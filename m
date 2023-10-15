Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327471FB2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 05:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eERlKw1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697349044; x=1728885044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FgkF66Uy7kSZXVzTJeK6TcuPWiNzW43vYXeoWZLfSqs=;
  b=eERlKw1pP41QJ+9ZrUXBumloW76KbNYLFmGVWRPq2WVQAgTCQY3m03DA
   M2ot3uQFgDcTpnoWwkNrP2Ol2gLCj1RCysQ5wmHzOUtlwOg97WjcB+hiO
   vwLIhu3lL86cMowS3VaaKpTvr5r/e4xXlNo+L/Rntbtr4SGfjMog2983q
   tz/Q6vq+HJSiIHTm5WFMc3aVh41h6kCWLdTUi2SqqPb7xEj/rifY3+rZp
   nIF5pDxNt+92W0A2dYeQ3pRjXNf9VnxPbyekhoexemzAmj8Gov13fnKgY
   5hyHmjfwXMGX5tl139z9x3uv86kddXOsJVyp58JLJhkzhiKS/JuvA6zM8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="370438890"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="370438890"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 22:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002490972"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="1002490972"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Oct 2023 22:50:37 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qru1L-00074q-0N;
	Sun, 15 Oct 2023 05:50:35 +0000
Date: Sun, 15 Oct 2023 13:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-kitchen-sink 12/55] lib/test_dynamic_debug.c:79:45: error:
 'DD_CLASS_TYPE_DISJOINT_NAMES' undeclared here (not in a function); did you
 mean 'DD_CLASS_TYPE_DISJOINT_BITS'?
Message-ID: <202310151311.aFmM6VuJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-kitchen-sink
head:   7e157cd3c1be4bbc30eddcbfea1ed696e904de89
commit: 5559a859a9737d9679addca4247c9fcebd04b5a8 [12/55] dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
config: i386-randconfig-013-20231011 (https://download.01.org/0day-ci/archive/20231015/202310151311.aFmM6VuJ-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151311.aFmM6VuJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151311.aFmM6VuJ-lkp@intel.com/

Note: the jimc/dd-kitchen-sink HEAD 7e157cd3c1be4bbc30eddcbfea1ed696e904de89 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:256,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/paravirt_types.h:20,
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
   include/linux/dynamic_debug.h:97:15: note: in definition of macro 'DECLARE_DYNDBG_CLASSMAP'
      97 |   .map_type = _maptype,     \
         |               ^~~~~~~~
>> lib/test_dynamic_debug.c:93:42: error: 'DD_CLASS_TYPE_LEVEL_NAMES' undeclared here (not in a function); did you mean 'DD_CLASS_TYPE_LEVEL_NUM'?
      93 | DECLARE_DYNDBG_CLASSMAP(map_level_names, DD_CLASS_TYPE_LEVEL_NAMES, 22,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:97:15: note: in definition of macro 'DECLARE_DYNDBG_CLASSMAP'
      97 |   .map_type = _maptype,     \
         |               ^~~~~~~~


vim +79 lib/test_dynamic_debug.c

6ea3bf466ac6ad Jim Cromie 2022-09-04  76  
6ea3bf466ac6ad Jim Cromie 2022-09-04  77  /* symbolic input, independent bits */
488f3bbf17ceb0 Jim Cromie 2022-10-11  78  enum cat_disjoint_names { LOW = 10, MID, HI };
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
