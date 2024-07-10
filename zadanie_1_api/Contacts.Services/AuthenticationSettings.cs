﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Services
{
    public class AuthenticationSettings
    {
        public string JwtKey { get; set; }
        public int JwtExpireHours { get; set; }
        public string JwtIssuer { get; set; }
    }
}
