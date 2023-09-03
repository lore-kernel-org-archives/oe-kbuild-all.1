Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D16210B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 12:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693745937; x=1725281937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X/V2fig2VIptIGo7GfyvJHH4eavfUJ09Ip4g9il4EMQ=;
  b=nSUKYzOrQ1yye5S1aGi1EQkJW/4BBZa9KeAWzUoQCzSxUIPFVGVGKFTL
   Rk4fugMzJrmyGyEaP1gK/qYcp0Fyz+Hggzs/sG3cDhB/b+LNk6V7biK0S
   HhDcPEgE3bOz5mJQXydHTDGShbCQDKBX5NUF4MHiDnxVHvlHm1tD50XsW
   NmsGneD5FUIAMpJrF3ffYQSgybK2FSNnPyHbb2zbn/8KfgSsDgKSrd1XO
   RAlt7vAiKeTC3ujLmbPhVanRUacukGWEKzvvG1fUpmnWQwrcQeGdbbKXT
   WX3WkXWSGdXhF3twmPf0lRF3RPiJHeZDN9iGpISQCWopEud0x4zFcXxqN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="442851175"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="442851175"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 05:58:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="769713607"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="769713607"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Sep 2023 05:58:55 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcmgn-0003AR-0B;
	Sun, 03 Sep 2023 12:58:53 +0000
Date: Sun, 3 Sep 2023 20:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-5e 12/24] lib/test_dynamic_debug.c:79:45: error:
 'DD_CLASS_TYPE_DISJOINT_NAMES' undeclared here (not in a function); did you
 mean 'DD_CLASS_TYPE_DISJOINT_BITS'?
Message-ID: <202309032055.u0donQRY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-5e
head:   69b58a07013be2ff9c21e29b48cce3de6d963f11
commit: fab3fcf23b230f40072db4539d503b201f09362f [12/24] dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230903/202309032055.u0donQRY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309032055.u0donQRY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309032055.u0donQRY-lkp@intel.com/

Note: the jimc/dd-fix-5e HEAD 69b58a07013be2ff9c21e29b48cce3de6d963f11 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:30,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/nospec-branch.h:14,
                    from arch/x86/include/asm/paravirt_types.h:27,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from lib/test_dynamic_debug.c:11:
>> lib/test_dynamic_debug.c:79:45: error: 'DD_CLASS_TYPE_DISJOINT_NAMES' undeclared here (not in a function); did you mean 'DD_CLASS_TYPE_DISJOINT_BITS'?
      79 | DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:95:29: note: in definition of macro 'DECLARE_DYNDBG_CLASSMAP'
      95 |                 .map_type = _maptype,                                   \
         |                             ^~~~~~~~
>> lib/test_dynamic_debug.c:93:42: error: 'DD_CLASS_TYPE_LEVEL_NAMES' undeclared here (not in a function); did you mean 'DD_CLASS_TYPE_LEVEL_NUM'?
      93 | DECLARE_DYNDBG_CLASSMAP(map_level_names, DD_CLASS_TYPE_LEVEL_NAMES, 22,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:95:29: note: in definition of macro 'DECLARE_DYNDBG_CLASSMAP'
      95 |                 .map_type = _maptype,                                   \
         |                             ^~~~~~~~


vim +79 lib/test_dynamic_debug.c

6ea3bf466ac6ad Jim Cromie 2022-09-04  76  
6ea3bf466ac6ad Jim Cromie 2022-09-04  77  /* symbolic input, independent bits */
ea8fd35f9786fa Jim Cromie 2022-10-11  78  enum cat_disjoint_names { LOW = 10, MID, HI };
6ea3bf466ac6ad Jim Cromie 2022-09-04 @79  DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
6ea3bf466ac6ad Jim Cromie 2022-09-04  80  			"LOW", "MID", "HI");
6ea3bf466ac6ad Jim Cromie 2022-09-04  81  DD_SYS_WRAP(disjoint_names, p);
6ea3bf466ac6ad Jim Cromie 2022-09-04  82  DD_SYS_WRAP(disjoint_names, T);
6ea3bf466ac6ad Jim Cromie 2022-09-04  83  
6ea3bf466ac6ad Jim Cromie 2022-09-04  84  /* numeric verbosity, V2 > V1 related */
6ea3bf466ac6ad Jim Cromie 2022-09-04  85  enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
6ea3bf466ac6ad Jim Cromie 2022-09-04  86  DECLARE_DYNDBG_CLASSMAP(map_level_num, DD_CLASS_TYPE_LEVEL_NUM, 14,
6ea3bf466ac6ad Jim Cromie 2022-09-04  87  		       "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
6ea3bf466ac6ad Jim Cromie 2022-09-04  88  DD_SYS_WRAP(level_num, p);
6ea3bf466ac6ad Jim Cromie 2022-09-04  89  DD_SYS_WRAP(level_num, T);
6ea3bf466ac6ad Jim Cromie 2022-09-04  90  
6ea3bf466ac6ad Jim Cromie 2022-09-04  91  /* symbolic verbosity */
6ea3bf466ac6ad Jim Cromie 2022-09-04  92  enum cat_level_names { L0 = 22, L1, L2, L3, L4, L5, L6, L7 };
6ea3bf466ac6ad Jim Cromie 2022-09-04 @93  DECLARE_DYNDBG_CLASSMAP(map_level_names, DD_CLASS_TYPE_LEVEL_NAMES, 22,
6ea3bf466ac6ad Jim Cromie 2022-09-04  94  			"L0", "L1", "L2", "L3", "L4", "L5", "L6", "L7");
6ea3bf466ac6ad Jim Cromie 2022-09-04  95  DD_SYS_WRAP(level_names, p);
6ea3bf466ac6ad Jim Cromie 2022-09-04  96  DD_SYS_WRAP(level_names, T);
6ea3bf466ac6ad Jim Cromie 2022-09-04  97  

:::::: The code at line 79 was first introduced by commit
:::::: 6ea3bf466ac6ad6c0ee1ad4e80d77d62e5e11c7a dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
