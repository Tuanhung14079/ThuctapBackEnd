using CartonManeger.Models;
using CartonManeger.ModelView.Diary;
using CartonManeger.Page_Parameters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CartonManeger.Service
{
    public interface ICartonService
    {
        IEnumerable<PostCarton> GetDiary(PageParameters pageParameters );
        PostCarton GetById(int id);
        CartonReponseResult Insert(PostCarton model);
        void Update(PostCarton model);
        void Delete(int id);
        void Save();

    }
    public class ProductService :ICartonService
    {
        private readonly ManegerCartonContext _db;

        public ProductService(ManegerCartonContext db)
        {
            _db = db;
        }

        public void Delete(int id)
        {
            try
            {
                var diary = GetById(id);
                _db.PostDiaries.Remove(diary);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message.ToString());
            }
        }

        public PostCarton GetById(int id)
        {
            try
            {
                PostCarton diary = _db.PostDiaries.Find(id);
                return diary;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public IEnumerable<PostCarton> GetDiary(PageParameters pageParameters)
        {
            try
            {
                IEnumerable<PostCarton> diary = _db.PostDiaries
                    .Skip((pageParameters.PageNumber - 1) * pageParameters.PageSize)
                    .Take(pageParameters.PageSize)
                    .ToList();
                return diary;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public CartonReponseResult Insert(PostCarton model)
        {
            try
            {
                _db.PostDiaries.Add(model);
                return (new CartonReponseResult
                {
                    StartusCode = 200,
                    Message = "Add successfully!"
                });
            }
            catch (Exception ex)
            {
                return (new CartonReponseResult
                {
                    StartusCode = 500,
                    Message = ex.Message.ToString()
                });
            }
        }

        public void Save()
        {
            try
            {
                _db.SaveChanges();
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message.ToString());
            }
            
        }

        public void Update(PostCarton model)
        {
            try
            {
                _db.PostDiaries.Update(model);
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message.ToString());
            }
            
        }
    }
    
}

