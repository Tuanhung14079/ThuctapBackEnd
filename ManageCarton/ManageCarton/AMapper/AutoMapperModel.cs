using AutoMapper;
using CartonManeger.Models;
using CartonManeger.ModelView.Account;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CartonManeger.AMapper
{
    public class AutoMapperModel:Profile
    {
        public AutoMapperModel()
        {
            CreateMap<AccountModelView, Account>();
            CreateMap<Account, AccountModelView>();
        }

        
    }
}
