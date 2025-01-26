Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154264A11
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 10:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737885620; cv=none; b=hjYEo/ru13K/vwxkqpteCKqVrDEJt+gjFiu3ADOea5d42+6r4wh+kK1h4MFECpCTJFNTglJpsAnlDY9w8l681g6BctFoYNnvscETIask7PkITx50Gul3oY5DIJdeKpRJ4CrlcDIit7JqfjQOqAD63gkINtiSNPBKO0/NZshyNxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737885620; c=relaxed/simple;
	bh=FqefYPyktdbWrX/Z0y4N7YCDCvcgWP9onoYVQ44dKZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJP/rF6upkOcAiAouV2K3cNn/dUYQamoZvGYlUyI40nyudbVV2BXNHjsIf6e7tgQ3JAbihunPHk78baV0J8DKLfVa/spjP1xcxlrh0xl+ce927c81xpLV/bQM4Cd8AWiLs6yaRzMhcx+08FEQ1+r7PIe0nVnr6738RrT2RQhqGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WldJR+KX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WldJR+KX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737885617; x=1769421617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FqefYPyktdbWrX/Z0y4N7YCDCvcgWP9onoYVQ44dKZw=;
  b=WldJR+KXl+WsfwlRZt3lng76F8+rnjIeoJ5fFQdO+dryRAW81smL5yBe
   HS4+4fhKB4BDppsDvYC06AAoznBq/uB8qtQb5Dgn/4TtIqPWgy54krwdk
   f9D1Yz3bDhVPy/1FNpUYfSDCD4Fz/JlAFNtknBBKaUDQOc8CiLG9bFVcj
   F7T1hHTF3YUE3V7hxYNEXxfdblQtRQdQQWTvK+q9b/40oVSg2fEocLVJ7
   u9O2frqr7aPnlVkzYYlxztjAlZdrqkWbC4w+DQNaGDBiJTIWhn+/rEJ7M
   Z6N7pJUoDnb6+mcq/aGsKpK6Oih7BZ1KBQXsFerc39fi9YIL+6A/hdb6h
   g==;
X-CSE-ConnectionGUID: HPvYybxWTcKhCBILHKHNGA==
X-CSE-MsgGUID: gLOozmxqRlC5kN1GBnI2Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="38066872"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="38066872"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 02:00:15 -0800
X-CSE-ConnectionGUID: mrlWfIAyTfahD7RY2Z+nvA==
X-CSE-MsgGUID: KBomorHtSz2uMOuwpz7Wqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145413634"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Jan 2025 02:00:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbzR4-000fBv-1h;
	Sun, 26 Jan 2025 10:00:10 +0000
Date: Sun, 26 Jan 2025 17:59:44 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Basharath Hussain Khaja <basharath@couthit.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH 2/2] of: address: Add kunit test for
 __of_address_resource_bounds()
Message-ID: <202501261727.x0aztept-lkp@intel.com>
References: <20250120-of-address-overflow-v1-2-dd68dbf47bce@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-of-address-overflow-v1-2-dd68dbf47bce@linutronix.de>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/of-address-Fix-empty-resource-handling-in-__of_address_resource_bounds/20250120-221141
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250120-of-address-overflow-v1-2-dd68dbf47bce%40linutronix.de
patch subject: [PATCH 2/2] of: address: Add kunit test for __of_address_resource_bounds()
config: arc-randconfig-r121-20250126 (https://download.01.org/0day-ci/archive/20250126/202501261727.x0aztept-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250126/202501261727.x0aztept-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501261727.x0aztept-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/of/of_test.c:130:47: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
   drivers/of/of_test.c:131:45: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
>> drivers/of/of_test.c:138:45: sparse: sparse: cast truncates bits from constant value (100000ffe becomes ffe)

vim +130 drivers/of/of_test.c

    72	
    73	static const struct of_address_resource_bounds_case of_address_resource_bounds_cases[] = {
    74		{
    75			.start = 0,
    76			.size = 0,
    77			.ret = 0,
    78			.res_start = 0,
    79			.res_end = -1,
    80		},
    81		{
    82			.start = 0,
    83			.size = 0x1000,
    84			.ret = 0,
    85			.res_start = 0,
    86			.res_end = 0xfff,
    87		},
    88		{
    89			.start = 0x1000,
    90			.size = 0,
    91			.ret = 0,
    92			.res_start = 0x1000,
    93			.res_end = 0xfff,
    94		},
    95		{
    96			.start = 0x1000,
    97			.size = 0x1000,
    98			.ret = 0,
    99			.res_start = 0x1000,
   100			.res_end = 0x1fff,
   101		},
   102		{
   103			.start = 1,
   104			.size = RESOURCE_SIZE_MAX,
   105			.ret = 0,
   106			.res_start = 1,
   107			.res_end = RESOURCE_SIZE_MAX,
   108		},
   109		{
   110			.start = RESOURCE_SIZE_MAX,
   111			.size = 1,
   112			.ret = 0,
   113			.res_start = RESOURCE_SIZE_MAX,
   114			.res_end = RESOURCE_SIZE_MAX,
   115		},
   116		{
   117			.start = 2,
   118			.size = RESOURCE_SIZE_MAX,
   119			.ret = -EOVERFLOW,
   120		},
   121		{
   122			.start = RESOURCE_SIZE_MAX,
   123			.size = 2,
   124			.ret = -EOVERFLOW,
   125		},
   126		{
   127			.start = 0x100000000ULL,
   128			.size = 1,
   129			.ret = sizeof(resource_size_t) > sizeof(u32) ? 0 : -EOVERFLOW,
 > 130			.res_start = (resource_size_t)0x100000000,
   131			.res_end = (resource_size_t)0x100000000,
   132		},
   133		{
   134			.start = 0x1000,
   135			.size = 0xffffffff,
   136			.ret = sizeof(resource_size_t) > sizeof(u32) ? 0 : -EOVERFLOW,
   137			.res_start = (resource_size_t)0x1000,
 > 138			.res_end = (resource_size_t)0x100000ffe,
   139		},
   140	};
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
