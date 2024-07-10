﻿using Contacts.Models.DTOs.Create;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Services.Interfaces
{
    public interface IAccountService
    {
        Task<string> GenerateJwt(LoginDTO dto);
    }
}
