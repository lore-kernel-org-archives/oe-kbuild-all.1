Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8701798E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 06:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3PT1mt6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701844233; x=1733380233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PHvL8DySQS64lFK/MNrATOz4ftqzzReR7jKUSx0+q9A=;
  b=g3PT1mt6tZOA0Z78tq9xPxuqBUTl6xW+ywUcUyqaEP3i1H7YO7zWhJgP
   nL40itMU63opax8RkB8gGHV5vjXoTO847jtS+V+kJRBBwKSCvEj/h+v6+
   z2k9i/TcAB9/oWgWktNGXqSzsC3kWp57CW7x9MANVSW1l2EUGEopD9G8h
   HCXuC50bvtxVhW7Q6Y78bg2nza9cerlOA7GlVPMc3SZjcgPteUy2vpE+g
   cJuGJrFDrjBCLWB0Lo0p2nA6jArGH4VD2shYf9G9WmoY/Z3Y6R+ZTB7Cp
   DShe+IkGeeTs/JSkC6dmnIo0fNhHTNtrRrxZyiY/motzmMksz/3ciEeUw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="15564103"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="15564103"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 22:30:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="944537706"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="944537706"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Dec 2023 22:30:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAlQJ-000AOQ-0m;
	Wed, 06 Dec 2023 06:30:20 +0000
Date: Wed, 6 Dec 2023 14:29:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hugo Villeneuve <hugo@hugovil.com>, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, hvilleneuve@dimonoff.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, hugo@hugovil.com,
	stable@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/7] serial: sc16is7xx: fix snprintf format specifier in
 sc16is7xx_regmap_name()
Message-ID: <202312061443.Cknef7Uq-lkp@intel.com>
References: <20231130191050.3165862-2-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130191050.3165862-2-hugo@hugovil.com>

Hi Hugo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d804987153e7bedf503f8e4ba649afe52cfd7f6d]

url:    https://github.com/intel-lab-lkp/linux/commits/Hugo-Villeneuve/serial-sc16is7xx-fix-snprintf-format-specifier-in-sc16is7xx_regmap_name/20231201-031413
base:   d804987153e7bedf503f8e4ba649afe52cfd7f6d
patch link:    https://lore.kernel.org/r/20231130191050.3165862-2-hugo%40hugovil.com
patch subject: [PATCH 1/7] serial: sc16is7xx: fix snprintf format specifier in sc16is7xx_regmap_name()
config: x86_64-buildonly-randconfig-001-20231201 (https://download.01.org/0day-ci/archive/20231206/202312061443.Cknef7Uq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061443.Cknef7Uq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061443.Cknef7Uq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_i2c_probe':
>> drivers/tty/serial/sc16is7xx.c:1703:41: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
    1703 |         snprintf(buf, sizeof(buf), "port%u", port_id);
         |                                         ^~
   In function 'sc16is7xx_regmap_name',
       inlined from 'sc16is7xx_i2c_probe' at drivers/tty/serial/sc16is7xx.c:1805:17:
   drivers/tty/serial/sc16is7xx.c:1703:36: note: directive argument in the range [0, 4294967294]
    1703 |         snprintf(buf, sizeof(buf), "port%u", port_id);
         |                                    ^~~~~~~~
   drivers/tty/serial/sc16is7xx.c:1703:9: note: 'snprintf' output between 6 and 15 bytes into a destination of size 6
    1703 |         snprintf(buf, sizeof(buf), "port%u", port_id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1703 drivers/tty/serial/sc16is7xx.c

  1698	
  1699	static const char *sc16is7xx_regmap_name(unsigned int port_id)
  1700	{
  1701		static char buf[6];
  1702	
> 1703		snprintf(buf, sizeof(buf), "port%u", port_id);
  1704	
  1705		return buf;
  1706	}
  1707	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
