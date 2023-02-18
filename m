Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEEA642
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 20:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676753476; x=1708289476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hbk7P+QRx5P2MYwfhVSKx3aFJomcVUHK8AEMSzA1OfI=;
  b=I7rGCxnFSaNmjJ4HardQWG5trieDVJUoiKQzjoWjX/x5vEPzqMul14qc
   fClGvxAB1gxLoQJmQ7ZtVSet7MOBpgMCFyC4qYWTaFcyy2+XN8IehhJRo
   4haZpesthCOGy+Ut9ggPzj3s7efhzjfNHoNmU83YXuBGO6wzq0Nl8mDie
   OqLVDwqS8bby2j50ib4+tK0UBVoigRFUI6Sj0uUteSBXszk0gGZc4DKwN
   B1Sip1pt0mCR+mbPGlAPFyPudlDabBqmgD7FzJ/PN3aqqAWH/u8zF+Y5R
   PX6HTw4KxD3DUDmmwwmwfK9IcANUwoS2PVAYgldqVQ7z6LFYYlrRJedJw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="394687346"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="394687346"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 12:51:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="672964184"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="672964184"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Feb 2023 12:51:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTUAr-000Ck9-19;
	Sat, 18 Feb 2023 20:51:13 +0000
Date: Sun, 19 Feb 2023 04:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix-next 2/20] include/linux/module.h:550:29: error:
 field 'dyndbg_info' has incomplete type
Message-ID: <202302190427.9iIK2NfJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-drm-fix-next
head:   23def6f5fa9da6a03e232b4368bfa5908d7e3194
commit: cf693cfaeb0eb6df6fb46cfd8f9c168c708596d4 [2/20] dyndbg: use the module notifier callbacks
config: x86_64-randconfig-a006 (https://download.01.org/0day-ci/archive/20230219/202302190427.9iIK2NfJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/jimc/linux/commit/cf693cfaeb0eb6df6fb46cfd8f9c168c708596d4
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-drm-fix-next
        git checkout cf693cfaeb0eb6df6fb46cfd8f9c168c708596d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302190427.9iIK2NfJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:22,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:13:
>> include/linux/module.h:550:29: error: field 'dyndbg_info' has incomplete type
     550 |         struct _ddebug_info dyndbg_info;
         |                             ^~~~~~~~~~~
   make[2]: *** [scripts/Makefile.build:114: arch/x86/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1298: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/dyndbg_info +550 include/linux/module.h

   544	
   545	#ifdef CONFIG_FUNCTION_ERROR_INJECTION
   546		struct error_injection_entry *ei_funcs;
   547		unsigned int num_ei_funcs;
   548	#endif
   549	#ifdef CONFIG_DYNAMIC_DEBUG_CORE
 > 550		struct _ddebug_info dyndbg_info;
   551	#endif
   552	} ____cacheline_aligned __randomize_layout;
   553	#ifndef MODULE_ARCH_INIT
   554	#define MODULE_ARCH_INIT {}
   555	#endif
   556	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
