Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C292F2D608
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 22:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GxvHCbGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704408460; x=1735944460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2wiGXS4gLBlBKIsYadDTQmIF1Eo0QdpdyZkviM0INUo=;
  b=GxvHCbGpbkyI48HkfvN7jI22H+5lZ2+0G+LbbS6qaLftGamvKbZ1FoQ+
   fUJk3NEBGPEQWH9tHCob3Z95+eUXZmh6scVWTmhbsNx08fh92/141ka+N
   G+sXRPURnmHeJJMmSQzCbHz2cy41mUR0gN5tFN6kqxSHm2X9EAOkU4Y2L
   wmOFvVYdUCXwXN1p2oqKc32sfoiRCPTQHtDeZTZQV2AchUF+rnUJDMDuR
   05r8SqdnGkShAcObW+fbr1vawhqU6uQLQU3HJQfVkiiSgAZ7UN886Qwbo
   pCIvpkmn9bRApi3H4iDETib3f1/B17x2bcUQPTqJKQOpWz2s9S5ZjPFJu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="10760962"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="10760962"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 14:43:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="22653000"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jan 2024 14:43:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLWQq-0000UK-0d;
	Thu, 04 Jan 2024 22:43:20 +0000
Date: Fri, 5 Jan 2024 06:43:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bp:tip-ras-core-WIP 14/14] drivers/ras/ras.c:22:6: warning: no
 previous prototype for 'amd_atl_register_decoder'
Message-ID: <202401050603.Hf3K7baU-lkp@intel.com>
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
config: x86_64-randconfig-004-20240105 (https://download.01.org/0day-ci/archive/20240105/202401050603.Hf3K7baU-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401050603.Hf3K7baU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401050603.Hf3K7baU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ras/ras.c:20:54: warning: 'struct mce' declared inside parameter list will not be visible outside of this definition or declaration
      20 | static unsigned long (*amd_atl_umc_na_to_spa)(struct mce *m);
         |                                                      ^~~
   drivers/ras/ras.c:22:57: warning: 'struct mce' declared inside parameter list will not be visible outside of this definition or declaration
      22 | void amd_atl_register_decoder(unsigned long (*f)(struct mce *))
         |                                                         ^~~
>> drivers/ras/ras.c:22:6: warning: no previous prototype for 'amd_atl_register_decoder' [-Wmissing-prototypes]
      22 | void amd_atl_register_decoder(unsigned long (*f)(struct mce *))
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ras/ras.c: In function 'amd_atl_register_decoder':
   drivers/ras/ras.c:24:24: error: assignment to 'long unsigned int (*)(struct mce *)' from incompatible pointer type 'long unsigned int (*)(struct mce *)' [-Werror=incompatible-pointer-types]
      24 |  amd_atl_umc_na_to_spa = f;
         |                        ^
   drivers/ras/ras.c: At top level:
>> drivers/ras/ras.c:28:6: warning: no previous prototype for 'amd_atl_unregister_decoder' [-Wmissing-prototypes]
      28 | void amd_atl_unregister_decoder(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ras/ras.c:34:59: warning: 'struct mce' declared inside parameter list will not be visible outside of this definition or declaration
      34 | unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct mce *m)
         |                                                           ^~~
>> drivers/ras/ras.c:34:15: warning: no previous prototype for 'amd_convert_umc_mca_addr_to_sys_addr' [-Wmissing-prototypes]
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


vim +/amd_atl_register_decoder +22 drivers/ras/ras.c

8e1d0790e0a749 Yazen Ghannam 2023-12-18  21  
8e1d0790e0a749 Yazen Ghannam 2023-12-18 @22  void amd_atl_register_decoder(unsigned long (*f)(struct mce *))
8e1d0790e0a749 Yazen Ghannam 2023-12-18  23  {
8e1d0790e0a749 Yazen Ghannam 2023-12-18  24  	amd_atl_umc_na_to_spa = f;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  25  }
8e1d0790e0a749 Yazen Ghannam 2023-12-18  26  EXPORT_SYMBOL_GPL(amd_atl_register_decoder);
8e1d0790e0a749 Yazen Ghannam 2023-12-18  27  
8e1d0790e0a749 Yazen Ghannam 2023-12-18 @28  void amd_atl_unregister_decoder(void)
8e1d0790e0a749 Yazen Ghannam 2023-12-18  29  {
8e1d0790e0a749 Yazen Ghannam 2023-12-18  30  	amd_atl_umc_na_to_spa = NULL;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  31  }
8e1d0790e0a749 Yazen Ghannam 2023-12-18  32  EXPORT_SYMBOL_GPL(amd_atl_unregister_decoder);
8e1d0790e0a749 Yazen Ghannam 2023-12-18  33  
8e1d0790e0a749 Yazen Ghannam 2023-12-18 @34  unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct mce *m)
8e1d0790e0a749 Yazen Ghannam 2023-12-18  35  {
8e1d0790e0a749 Yazen Ghannam 2023-12-18  36  	if (!amd_atl_umc_na_to_spa)
8e1d0790e0a749 Yazen Ghannam 2023-12-18  37  		return -EINVAL;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  38  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  39  	return amd_atl_umc_na_to_spa(m);
8e1d0790e0a749 Yazen Ghannam 2023-12-18  40  }
8e1d0790e0a749 Yazen Ghannam 2023-12-18  41  EXPORT_SYMBOL_GPL(amd_convert_umc_mca_addr_to_sys_addr);
8e1d0790e0a749 Yazen Ghannam 2023-12-18  42  #endif /* CONFIG_AMD_ATL */
8e1d0790e0a749 Yazen Ghannam 2023-12-18  43  

:::::: The code at line 22 was first introduced by commit
:::::: 8e1d0790e0a749a62428ff039c7a9050a06e9feb RAS: Introduce AMD Address Translation Library

:::::: TO: Yazen Ghannam <yazen.ghannam@amd.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
