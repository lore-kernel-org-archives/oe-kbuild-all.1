Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985FB1FB4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jan 2024 01:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fvuKR3p1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704418310; x=1735954310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AibCkLbXfi1vitg0oo5+szBqTXwwfT5vYdSEbC3bjzI=;
  b=fvuKR3p1RrJF+QEMnybZexmZKAv9HBN/2FZ2ecOWKyYeAHDWgfd56hoV
   0XUctOl27na6QwCGGCIOk1yjiubkxDioPbN2CiRgW4j5pI3h14IytR4jV
   lnNwA51aGn1uIcyq/eCu7dfLaF5j4KYz8c/7YtfWIjFwA+HlR3rYe45K9
   Lumg1TiCmLaIvM2IqwIGyXKk2tk+VOvhlCtwVODBifSuxaoW/GJstKHAG
   X5v0D3uIWfci1q0YLE5MRwNBPI9YL0jM9Ux7IH+t0p+xBq/v/A3SN6h/2
   HnkIo3NIqo4Op9kz6sUyRmOwE9b4ZUpDLPU2jKaCBv8qEgWkwJg6WD301
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="396289188"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="396289188"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 17:31:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="756801570"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="756801570"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Jan 2024 17:31:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLZ3n-0000c7-1S;
	Fri, 05 Jan 2024 01:31:44 +0000
Date: Fri, 5 Jan 2024 09:30:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bp:tip-ras-core-WIP 14/14] drivers/ras/ras.c:24:24: error:
 assignment to 'long unsigned int (*)(struct mce *)' from incompatible
 pointer type 'long unsigned int (*)(struct mce *)'
Message-ID: <202401050942.XrpJD0aa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git tip-ras-core-WIP
head:   cf9dcdd287f3d175a9fafdadb944586333cb785c
commit: cf9dcdd287f3d175a9fafdadb944586333cb785c [14/14] WIP build fix
config: x86_64-randconfig-004-20240105 (https://download.01.org/0day-ci/archive/20240105/202401050942.XrpJD0aa-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401050942.XrpJD0aa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401050942.XrpJD0aa-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ras/ras.c:20:54: warning: 'struct mce' declared inside parameter list will not be visible outside of this definition or declaration
      20 | static unsigned long (*amd_atl_umc_na_to_spa)(struct mce *m);
         |                                                      ^~~
   drivers/ras/ras.c:22:57: warning: 'struct mce' declared inside parameter list will not be visible outside of this definition or declaration
      22 | void amd_atl_register_decoder(unsigned long (*f)(struct mce *))
         |                                                         ^~~
   drivers/ras/ras.c:22:6: warning: no previous prototype for 'amd_atl_register_decoder' [-Wmissing-prototypes]
      22 | void amd_atl_register_decoder(unsigned long (*f)(struct mce *))
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ras/ras.c: In function 'amd_atl_register_decoder':
>> drivers/ras/ras.c:24:24: error: assignment to 'long unsigned int (*)(struct mce *)' from incompatible pointer type 'long unsigned int (*)(struct mce *)' [-Werror=incompatible-pointer-types]
      24 |  amd_atl_umc_na_to_spa = f;
         |                        ^
   drivers/ras/ras.c: At top level:
   drivers/ras/ras.c:28:6: warning: no previous prototype for 'amd_atl_unregister_decoder' [-Wmissing-prototypes]
      28 | void amd_atl_unregister_decoder(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ras/ras.c:34:59: warning: 'struct mce' declared inside parameter list will not be visible outside of this definition or declaration
      34 | unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct mce *m)
         |                                                           ^~~
   drivers/ras/ras.c:34:15: warning: no previous prototype for 'amd_convert_umc_mca_addr_to_sys_addr' [-Wmissing-prototypes]
      34 | unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct mce *m)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ras/ras.c: In function 'amd_convert_umc_mca_addr_to_sys_addr':
   drivers/ras/ras.c:39:31: error: passing argument 1 of 'amd_atl_umc_na_to_spa' from incompatible pointer type [-Werror=incompatible-pointer-types]
      39 |  return amd_atl_umc_na_to_spa(m);
         |                               ^
         |                               |
         |                               struct mce *
   drivers/ras/ras.c:39:31: note: expected 'struct mce *' but argument is of type 'struct mce *'
   cc1: some warnings being treated as errors


vim +24 drivers/ras/ras.c

8e1d0790e0a749 Yazen Ghannam 2023-12-18  21  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  22  void amd_atl_register_decoder(unsigned long (*f)(struct mce *))
8e1d0790e0a749 Yazen Ghannam 2023-12-18  23  {
8e1d0790e0a749 Yazen Ghannam 2023-12-18 @24  	amd_atl_umc_na_to_spa = f;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  25  }
8e1d0790e0a749 Yazen Ghannam 2023-12-18  26  EXPORT_SYMBOL_GPL(amd_atl_register_decoder);
8e1d0790e0a749 Yazen Ghannam 2023-12-18  27  

:::::: The code at line 24 was first introduced by commit
:::::: 8e1d0790e0a749a62428ff039c7a9050a06e9feb RAS: Introduce AMD Address Translation Library

:::::: TO: Yazen Ghannam <yazen.ghannam@amd.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
