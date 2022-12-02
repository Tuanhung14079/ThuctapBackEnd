using CartonManeger.Models;
using CartonManeger.ModelView.Account;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CartonManeger.Service
{
    public interface IAccountService
    {
        IEnumerable<Account> GetAccount();
        Account GetById(int id);
        Account GetByPhoneNumber(Account model);
        AccountReponseResult Insert(Account model);
        void Update(Account model);
        void Delete(int id);
        void Save();
    }
    public class AccountService : IAccountService //Colltroler gửi xuống request service xử lý chức năng
    {
        private readonly ManegerCartonContext _db;

        public AccountService(ManegerCartonContext db)
        {
            _db = db;
        }

        public void Delete(int id)
        {
            try
            {
                var account = GetById(id);
                _db.Accounts.Remove(account);
            }
            catch (Exception ex)
            {

            }
        }

        public IEnumerable<Account> GetAccount()
        {
            try
            {
                IEnumerable<Account> account = _db.Accounts.ToList();
                return account;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public Account GetById(int id)
        {
            try
            {
                Account account = _db.Accounts.Find(id);
                return account;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

       

        public AccountReponseResult Insert(Account model)
        {
            try
            {
                var check = CheckruleAccount(model);
                if (check != null)
                {
                    return check;
                };
                _db.Accounts.Add(model);
                return (new AccountReponseResult
                {
                    StartusCode = 200,
                    Message = "Add successfully!"
                });

            }
            catch (Exception ex)
            {
                return (new AccountReponseResult
                {
                    StartusCode = 500,
                    Message = ex.Message.ToString()
                });
            }
        }
        public void Save()
        {
            _db.SaveChanges();
        }

        public void Update(Account model)
        {
            _db.Accounts.Update(model);
        }
        public AccountReponseResult CheckruleAccount(Account model)
        {
            var check = _db.Accounts.Where(x => x.PhoneNumber == model.PhoneNumber).FirstOrDefault();
            if (check != null)
            {
                return new AccountReponseResult
                {
                    StartusCode = 400,
                    Message = "Phone number already exists, please enter another number !"
                };
            }
            return null;
        }

        public Account GetByPhoneNumber(Account model)
        {
            try
            {
                Account account = _db.Accounts.Where(x=>x.PhoneNumber == model.PhoneNumber).FirstOrDefault();
                return account;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
