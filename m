Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D67220F49
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 08:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756110364; cv=none; b=ab8oPweQU4h4uH/9wQlY0ZffwtkYhOyb6tFHh6Dibo06K1YEnbBa1nNH7mStqnW2vi0LA1arTj1IjlnrF7h1WnKxtYSdEH3BtKHfLkQfu/Ay6g1e8bpdVay77cMZXqv/OcmcHYiGgAv2/MO70kVt4o2j4/0jBj6olAIv07gFdA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756110364; c=relaxed/simple;
	bh=jF9oElM7RfwUHvaPvFYHTEe5WQyFHvAPj30zmDsft0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lu4O4WedKTY5F0d31vZIh0bLFJkPLLwdDudmf04tDe6WUhvddur51fAOz669HW1srBvrSqbuKKnfptku0OmfwzIMCbSSkRg+NZqce2Q1/jbBQiyVDIjxM83VVGexg0ObhZe1zS8whIA3AY6y4Si58p8UcgYMjvrx0Wa0UdKokx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1MNybRP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1MNybRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756110363; x=1787646363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jF9oElM7RfwUHvaPvFYHTEe5WQyFHvAPj30zmDsft0w=;
  b=h1MNybRPlbVsL7X06YScSwe2oRsatTiui36p8gdZ7U8yjsupOypHoMRJ
   YKnbq9/Tvm9FVtw8d2EXIwceFSZKERg245i0AUTtsxuKZjguzL3jOOvgg
   wtNupf+Jr+NNVVU0P/dTXIaGd0C+JUve6YpNt8QlSOsod5Gc+KpsdrLrC
   pYOLvFNpJzWa1XeWLf3YESvm7uauzGVFbrU4UYlv2u3kNc2uYBI1+iWX+
   XI7XB58iJl2CLKVVZlrfT2+7PJQ5NAjdIYjpJvzQaXWSWlD/ELhbv4s3A
   H5zCSFcA/nRotrYU84CGEDoOpY34V2dQDpxrFIEgYa+curiV9XoNiS/KF
   Q==;
X-CSE-ConnectionGUID: vBHUDkNRSY6C5stad7PXYg==
X-CSE-MsgGUID: IbLw7osCSb6zCeEf0ZAktw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="75913538"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="75913538"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 01:26:03 -0700
X-CSE-ConnectionGUID: bddS5Z4FS0msg0llnktyRA==
X-CSE-MsgGUID: VqR1H/76QneVW+gZXWZPTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="174518095"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Aug 2025 01:26:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqSWU-000NT5-0h;
	Mon, 25 Aug 2025 08:25:57 +0000
Date: Mon, 25 Aug 2025 16:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmap-fix-v4h 60/64] include/linux/module.h:600:29:
 error: field 'dyndbg_info' has incomplete type
Message-ID: <202508251607.bg1dfiNX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-classmap-fix-v4h
head:   2f32032bffe62e9db729a4fdce26fb799d6f7302
commit: 28d4018247d227eb3b461ffbec08a68f7593a1af [60/64] dyndbg: add stub defs for DYNAMIC_DEBUG_CLASSMAP_* macros
config: arm-randconfig-001-20250825 (https://download.01.org/0day-ci/archive/20250825/202508251607.bg1dfiNX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508251607.bg1dfiNX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508251607.bg1dfiNX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/dma-mapping.h:5,
                    from arch/arm/kernel/asm-offsets.c:13:
>> include/linux/module.h:600:29: error: field 'dyndbg_info' has incomplete type
     600 |         struct _ddebug_info dyndbg_info;
         |                             ^~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=3256248101
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1274: prepare0] Error 2 shuffle=3256248101
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3256248101
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3256248101
   make: Target 'prepare' not remade because of errors.


vim +/dyndbg_info +600 include/linux/module.h

92ace9991da088 Josef Bacik      2017-12-11  594  
540adea3809f61 Masami Hiramatsu 2018-01-13  595  #ifdef CONFIG_FUNCTION_ERROR_INJECTION
663faf9f7beeac Masami Hiramatsu 2018-01-13  596  	struct error_injection_entry *ei_funcs;
540adea3809f61 Masami Hiramatsu 2018-01-13  597  	unsigned int num_ei_funcs;
92ace9991da088 Josef Bacik      2017-12-11  598  #endif
7deabd67498869 Jason Baron      2023-03-03  599  #ifdef CONFIG_DYNAMIC_DEBUG_CORE
7deabd67498869 Jason Baron      2023-03-03 @600  	struct _ddebug_info dyndbg_info;
7deabd67498869 Jason Baron      2023-03-03  601  #endif
3859a271a003ab Kees Cook        2016-10-28  602  } ____cacheline_aligned __randomize_layout;
e61a1c1c4f240c Roman Zippel     2007-05-09  603  #ifndef MODULE_ARCH_INIT
e61a1c1c4f240c Roman Zippel     2007-05-09  604  #define MODULE_ARCH_INIT {}
e61a1c1c4f240c Roman Zippel     2007-05-09  605  #endif
^1da177e4c3f41 Linus Torvalds   2005-04-16  606  

:::::: The code at line 600 was first introduced by commit
:::::: 7deabd67498869640c937c9bd83472574b7dea0b dyndbg: use the module notifier callbacks

:::::: TO: Jason Baron <jbaron@akamai.com>
:::::: CC: Luis Chamberlain <mcgrof@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
