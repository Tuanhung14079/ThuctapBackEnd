using AutoMapper;
using CartonManeger.Models;
using CartonManeger.ModelView.Account;
using CartonManeger.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CartonManeger.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly IAccountService _accountService;
        private readonly IMapper _mapper;
        public AccountController(IAccountService accountService, IMapper mapper)
        {
            _accountService = accountService;
            
        }
        [HttpGet("GetAccount")]
        public IActionResult GetAccount()
        {
            try
            {
                var accounts = _accountService.GetAccount();
                return Ok(accounts);
            }
            catch (Exception ex)
            {
                return BadRequest(new AccountReponseResult
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
                var account = _accountService.GetById(id);
                if (account == null)
                {
                    return BadRequest($"Account Id: {id} Does not exist in the system!");
                }
                return Ok(account);
            }
            catch (Exception ex)
            {
                return BadRequest(new AccountReponseResult
                {
                    StartusCode = 500,
                    Message = ex.Message.ToString()
                });
            }
        }
        [HttpGet("GetByPhoneNumber")]
        public IActionResult GetByPhoneNumber(Account model)
        {
            try
            {
                var account = _accountService.GetByPhoneNumber(model);
                if (account == null)
                {
                    return BadRequest($"Phone Number: {model} Does not exist in the system!");
                }
                return Ok(account);
            }
            catch (Exception ex)
            {
                return BadRequest(new AccountReponseResult
                {
                    StartusCode = 500,
                    Message = ex.Message.ToString()
                });
            }
        }
        [HttpPost("Add")]
        public IActionResult Insert(Account model)
        {
            try
            {
                _accountService.Insert(model);
                _accountService.Save();
                return Ok("Success");
                
            }
            catch (Exception ex)
            {
                return BadRequest(new AccountReponseResult
                {
                    StartusCode = 500,
                    Message = ex.Message.ToString()
                }) ;
            }  
        }
        [HttpPut("Update")]
        public IActionResult Update(Account model)
        {
            try
            {
                _accountService.Update(model);
                _accountService.Save();
                return Ok(new AccountReponseResult
                {
                    StartusCode = 200,
                    Message = "Update successful !"
                });
            }
            catch (Exception ex)
            {
                return BadRequest(new AccountReponseResult
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
                _accountService.Delete(id);
                _accountService.Save();
                return Ok(new AccountReponseResult
                {
                    StartusCode = 200,
                    Message = "Delete successful !"
                });
            }
            catch (Exception ex)
            {
                return BadRequest(new AccountReponseResult
                {
                    StartusCode = 500,
                    Message = ex.Message.ToString()
                });
            }
        }
    }
}
