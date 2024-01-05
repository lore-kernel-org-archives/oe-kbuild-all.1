Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C91185B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jan 2024 01:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PEoXqns4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704416919; x=1735952919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ukebvb3GF50xKfDFJ3k/mnCGHaPLwi9yh+9sB711b9g=;
  b=PEoXqns4ok4hdQ4fiHJKIn/MDk2BRvbYYGQa72COY6iCoA0MntYjVgP1
   lt3svMqKQirtMvN9ybdtHarCxuQyPEjI/ef6yc7Ij94q6b/XcQ87GPWGY
   8D7XlbA8b0iqdo33NOR5BS/V/vocLD3DjEJQnvE3GD2nTuRgJ7xTaIGB5
   5xG1lGA28Ky//ObRymCGwUPQtiXK9FOWiSQBwAHJHMSmNPdYOPbK8fxFu
   zW2UBAJz/pbMYBpRuxs2DBlCxDDibJL2a/bN/V8Y2skFVJllhDlzoWeG/
   T7mp+YPEDoXzEru5Dyd/RjXt359tR4XMptA/n1iaGsxTXJGJqHEjGMk5+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="463800280"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="463800280"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 17:08:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="784057578"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="784057578"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 04 Jan 2024 17:08:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLYhP-0000ai-0T;
	Fri, 05 Jan 2024 01:08:35 +0000
Date: Fri, 5 Jan 2024 09:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bp:tip-ras-core-WIP 14/14] drivers/ras/ras.c:20:54: warning:
 'struct mce' declared inside parameter list will not be visible outside of
 this definition or declaration
Message-ID: <202401050938.2lAhSKEz-lkp@intel.com>
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
config: x86_64-randconfig-005-20240105 (https://download.01.org/0day-ci/archive/20240105/202401050938.2lAhSKEz-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401050938.2lAhSKEz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401050938.2lAhSKEz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ras/ras.c:20:54: warning: 'struct mce' declared inside parameter list will not be visible outside of this definition or declaration
    static unsigned long (*amd_atl_umc_na_to_spa)(struct mce *m);
                                                         ^~~
   drivers/ras/ras.c:22:57: warning: 'struct mce' declared inside parameter list will not be visible outside of this definition or declaration
    void amd_atl_register_decoder(unsigned long (*f)(struct mce *))
                                                            ^~~
   drivers/ras/ras.c: In function 'amd_atl_register_decoder':
   drivers/ras/ras.c:24:24: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
     amd_atl_umc_na_to_spa = f;
                           ^
   drivers/ras/ras.c: At top level:
   drivers/ras/ras.c:34:59: warning: 'struct mce' declared inside parameter list will not be visible outside of this definition or declaration
    unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct mce *m)
                                                              ^~~
   drivers/ras/ras.c: In function 'amd_convert_umc_mca_addr_to_sys_addr':
   drivers/ras/ras.c:39:31: error: passing argument 1 of 'amd_atl_umc_na_to_spa' from incompatible pointer type [-Werror=incompatible-pointer-types]
     return amd_atl_umc_na_to_spa(m);
                                  ^
   drivers/ras/ras.c:39:31: note: expected 'struct mce *' but argument is of type 'struct mce *'
   cc1: some warnings being treated as errors
--
   In file included from drivers/ras/amd/atl/denormalize.c:13:0:
>> drivers/ras/amd/atl/internal.h:226:55: warning: 'struct mce' declared inside parameter list will not be visible outside of this definition or declaration
    unsigned long convert_umc_mca_addr_to_sys_addr(struct mce *m);
                                                          ^~~
--
   In file included from drivers/ras/amd/atl/umc.c:13:0:
>> drivers/ras/amd/atl/internal.h:226:55: warning: 'struct mce' declared inside parameter list will not be visible outside of this definition or declaration
    unsigned long convert_umc_mca_addr_to_sys_addr(struct mce *m);
                                                          ^~~
>> drivers/ras/amd/atl/umc.c:15:29: warning: 'struct mce' declared inside parameter list will not be visible outside of this definition or declaration
    static u8 get_die_id(struct mce *m)
                                ^~~
   drivers/ras/amd/atl/umc.c:25:37: warning: 'struct mce' declared inside parameter list will not be visible outside of this definition or declaration
    static u8 get_coh_st_inst_id(struct mce *m)
                                        ^~~
   In file included from <command-line>:0:0:
   drivers/ras/amd/atl/umc.c: In function 'get_coh_st_inst_id':
   drivers/ras/amd/atl/umc.c:27:37: error: dereferencing pointer to incomplete type 'struct mce'
     return FIELD_GET(UMC_CHANNEL_NUM, m->ipid);
                                        ^
   include/linux/compiler_types.h:415:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:435:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:71:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) > \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:61:39: note: in expansion of macro '__unsigned_scalar_typeof'
    #define __bf_cast_unsigned(type, x) ((__unsigned_scalar_typeof(type))(x))
                                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:6: note: in expansion of macro '__bf_cast_unsigned'
         __bf_cast_unsigned(_reg, ~0ull), \
         ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:154:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: "); \
      ^~~~~~~~~~~~~~~~
   drivers/ras/amd/atl/umc.c:27:9: note: in expansion of macro 'FIELD_GET'
     return FIELD_GET(UMC_CHANNEL_NUM, m->ipid);
            ^~~~~~~~~
   drivers/ras/amd/atl/umc.c: At top level:
   drivers/ras/amd/atl/umc.c:30:55: warning: 'struct mce' declared inside parameter list will not be visible outside of this definition or declaration
    unsigned long convert_umc_mca_addr_to_sys_addr(struct mce *m)
                                                          ^~~
   drivers/ras/amd/atl/umc.c:30:15: error: conflicting types for 'convert_umc_mca_addr_to_sys_addr'
    unsigned long convert_umc_mca_addr_to_sys_addr(struct mce *m)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/ras/amd/atl/umc.c:13:0:
   drivers/ras/amd/atl/internal.h:226:15: note: previous declaration of 'convert_umc_mca_addr_to_sys_addr' was here
    unsigned long convert_umc_mca_addr_to_sys_addr(struct mce *m);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ras/amd/atl/umc.c: In function 'convert_umc_mca_addr_to_sys_addr':
   drivers/ras/amd/atl/umc.c:32:41: error: passing argument 1 of 'get_coh_st_inst_id' from incompatible pointer type [-Werror=incompatible-pointer-types]
     u8 coh_st_inst_id = get_coh_st_inst_id(m);
                                            ^
   drivers/ras/amd/atl/umc.c:25:11: note: expected 'struct mce *' but argument is of type 'struct mce *'
    static u8 get_coh_st_inst_id(struct mce *m)
              ^~~~~~~~~~~~~~~~~~
   drivers/ras/amd/atl/umc.c:33:24: error: dereferencing pointer to incomplete type 'struct mce'
     unsigned long addr = m->addr;
                           ^~
   drivers/ras/amd/atl/umc.c:35:25: error: passing argument 1 of 'get_die_id' from incompatible pointer type [-Werror=incompatible-pointer-types]
     u8 die_id = get_die_id(m);
                            ^
   drivers/ras/amd/atl/umc.c:15:11: note: expected 'struct mce *' but argument is of type 'struct mce *'
    static u8 get_die_id(struct mce *m)
              ^~~~~~~~~~
   drivers/ras/amd/atl/umc.c: In function 'get_coh_st_inst_id':
>> drivers/ras/amd/atl/umc.c:28:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/ras/amd/atl/core.c:16:0:
>> drivers/ras/amd/atl/internal.h:226:55: warning: 'struct mce' declared inside parameter list will not be visible outside of this definition or declaration
    unsigned long convert_umc_mca_addr_to_sys_addr(struct mce *m);
                                                          ^~~
   drivers/ras/amd/atl/core.c: In function 'amd_atl_init':
   drivers/ras/amd/atl/core.c:207:2: error: implicit declaration of function 'amd_atl_register_decoder'; did you mean '__pci_register_driver'? [-Werror=implicit-function-declaration]
     amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
     ^~~~~~~~~~~~~~~~~~~~~~~~
     __pci_register_driver
   drivers/ras/amd/atl/core.c: In function 'amd_atl_exit':
   drivers/ras/amd/atl/core.c:219:2: error: implicit declaration of function 'amd_atl_unregister_decoder'; did you mean 'pci_unregister_driver'? [-Werror=implicit-function-declaration]
     amd_atl_unregister_decoder();
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
     pci_unregister_driver
   cc1: some warnings being treated as errors


vim +20 drivers/ras/ras.c

d963cd95bea93b Chen, Gong    2014-06-11  12  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  13  #if IS_ENABLED(CONFIG_AMD_ATL)
8e1d0790e0a749 Yazen Ghannam 2023-12-18  14  /*
8e1d0790e0a749 Yazen Ghannam 2023-12-18  15   * Once set, this function pointer should never be unset.
8e1d0790e0a749 Yazen Ghannam 2023-12-18  16   *
8e1d0790e0a749 Yazen Ghannam 2023-12-18  17   * The library module will set this pointer if it successfully loads. The module
8e1d0790e0a749 Yazen Ghannam 2023-12-18  18   * should not be unloaded except for testing and debug purposes.
8e1d0790e0a749 Yazen Ghannam 2023-12-18  19   */
8e1d0790e0a749 Yazen Ghannam 2023-12-18 @20  static unsigned long (*amd_atl_umc_na_to_spa)(struct mce *m);
8e1d0790e0a749 Yazen Ghannam 2023-12-18  21  

:::::: The code at line 20 was first introduced by commit
:::::: 8e1d0790e0a749a62428ff039c7a9050a06e9feb RAS: Introduce AMD Address Translation Library

:::::: TO: Yazen Ghannam <yazen.ghannam@amd.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
