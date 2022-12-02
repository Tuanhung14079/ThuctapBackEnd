using AutoMapper;
using CartonManeger.Models;
using CartonManeger.ModelView.Diary;
using CartonManeger.Page_Parameters;
using CartonManeger.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace CartonManeger.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartonManegerControler : ControllerBase
    {
        private readonly ICartonService _postDiaryService;
        private readonly IMapper _mapper;

        public CartonManegerControler(ICartonService postDiaryService, IMapper mapper)
        {
            _postDiaryService = postDiaryService;
            _mapper = mapper;
        }
        [HttpGet("GetDiary")]
        public IActionResult GetDiary([FromQuery] PageParameters pageParameters)
        {
            try
            {
                var diary =  _postDiaryService.GetDiary(pageParameters);
                List<CartonModelView> Diary = _mapper.Map<List<CartonModelView>>(diary);
                return Ok(diary);
            }
            catch (Exception ex)
            {
                return BadRequest(new CartonReponseResult
                {
                    StartusCode = 500,
                    Message = ex.Message.ToString()
                });
            }
        }
        [HttpGet("GetById")]
        public IActionResult GetById(int id)
        {
            try
            {
                var diary = _postDiaryService.GetById(id);
                if (diary == null)
                {
                    return BadRequest($"Id : {id} Does not exist in the system!");
                }
                return Ok(diary);
            }
            catch (Exception ex)
            {
                return BadRequest(new CartonReponseResult
                {
                    StartusCode = 500,
                    Message = ex.Message.ToString()
                });
            }

        }
        [HttpPost("Add")]
        public IActionResult Insert(CartonModelView model)
        {
            try
            {
                model.CreateDate = DateTime.Now;
                model.PostDate = DateTime.Now;
                model.UpdateDate = null;
                PostCarton diary = _mapper.Map<PostCarton>(model);
                var result = _postDiaryService.Insert(diary);
                if (result.StartusCode == 200)
                {
                    _postDiaryService.Save();
                }
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new CartonReponseResult
                {
                    StartusCode = 500,
                    Message = ex.Message.ToString()
                });
            }
        }
        [HttpPut("Update")]
        public IActionResult Update(CartonModelView model)
        {
            try
            {
                model.UpdateDate = DateTime.Now;
                PostCarton diary = _mapper.Map<PostCarton>(model);
                _postDiaryService.Update(diary);
                _postDiaryService.Save();
                return Ok(new CartonReponseResult
                {
                    StartusCode = 200,
                    Message = "Update successful !"
                });

            }
            catch (Exception ex)
            {
                return BadRequest(new CartonReponseResult
                {
                    StartusCode = 500,
                    Message = ex.Message.ToString()
                });
            }
        }
        [HttpDelete("Delete")]
        public IActionResult Delete(int id)
        {
            try
            {
                _postDiaryService.Delete(id);
                _postDiaryService.Save();
                return Ok(new CartonReponseResult
                {
                    StartusCode = 200,
                    Message = "Delete successful !"
                });
            }
            catch (Exception ex)
            {
                return BadRequest(new CartonReponseResult
                {
                    StartusCode = 500,
                    Message = ex.Message.ToString()
                });
            }
        }
        [HttpPost("upload",Name ="upload")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(string),StatusCodes.Status400BadRequest)]
        public async Task<IActionResult>UploadFile(
            IFormFile file,
           CancellationToken cancellationToken)
        {
            string FileName = null;
            if (CheckFile(file))
            {
               FileName = await WriteFile(file);
            }
            else
            {
                return BadRequest(new { message = "Invalid file extension" });
            }
            return Ok(FileName);
        }
        private bool CheckFile(IFormFile file)
        {
            var extension = "." + file.FileName.Split('.')[file.FileName.Split('.').Length - 1];
            return (extension == ".png" || extension == ".jpg");
        }
        private async Task<string> WriteFile(IFormFile file)
        {
            string isSaveSuccess = null;
            string fileName;
            try
            {
                var extension = "." + file.FileName.Split('.')[file.FileName.Split('.').Length - 1];
                fileName = DateTime.Now.Ticks + extension;
                var pathBuilt = Path.Combine(Directory.GetCurrentDirectory(), "Upload\\fileImage");
                if (!Directory.Exists(pathBuilt))
                {
                    Directory.CreateDirectory(pathBuilt);
                }
                var path = Path.Combine(Directory.GetCurrentDirectory(), "Upload\\fileImage", fileName);
                using(var stream = new FileStream(path, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }
                isSaveSuccess = fileName;
            }
            catch(Exception ex)
            {
                return isSaveSuccess = null;
            }
            return isSaveSuccess;
        }
    }
}
