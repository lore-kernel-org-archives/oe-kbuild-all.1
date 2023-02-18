Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250FA642
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 21:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676755277; x=1708291277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3teH1KCnshtb3UbIijxYtJRm73YFZEE+bPlA/r5Qw9g=;
  b=OXK+3/aEsS/PvOHvOacAdOS43upLFMghzZctAvbA7Dcr9glChMWjf1I+
   SFcmJZMAZNYp+HiyeMxDRI5VB9UAY1cWSf3bVj6fnjkYIcxTxSMWc7fOn
   C75SXM6MtRhADYCNSdvSDUGwmYTOng5ZPuTOzKAQ5ysPUNDX3J6yBwuLZ
   jW+1y6TBVbDI8i9mXGIuN3kAmVgSB90tHnsXF9By/GMJppaPX2TRSxqBQ
   kCNfmHvcXYflyyAGoz4QgF+WJPGbPAVGNxJBYIFJ12U3EzktMaGwqByVC
   a2ewaonKaWbyWE5S3lwrLKCR+oJ1kbuNb4aiuGiQxjkNwyip9KHrqtf5M
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="312569905"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="312569905"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 13:21:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="701288682"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="701288682"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 Feb 2023 13:21:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTUdu-000Clp-1u;
	Sat, 18 Feb 2023 21:21:14 +0000
Date: Sun, 19 Feb 2023 05:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix-next 2/20] include/linux/module.h:550:22: error:
 field has incomplete type 'struct _ddebug_info'
Message-ID: <202302190509.GakBJYgX-lkp@intel.com>
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
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20230219/202302190509.GakBJYgX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/cf693cfaeb0eb6df6fb46cfd8f9c168c708596d4
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-drm-fix-next
        git checkout cf693cfaeb0eb6df6fb46cfd8f9c168c708596d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302190509.GakBJYgX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:13:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
>> include/linux/module.h:550:22: error: field has incomplete type 'struct _ddebug_info'
           struct _ddebug_info dyndbg_info;
                               ^
   include/linux/module.h:550:9: note: forward declaration of 'struct _ddebug_info'
           struct _ddebug_info dyndbg_info;
                  ^
   1 error generated.
   make[2]: *** [scripts/Makefile.build:114: arch/x86/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1298: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +550 include/linux/module.h

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
