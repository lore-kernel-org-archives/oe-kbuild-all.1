Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A7A6AD7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 05:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTBG2sJl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701753067; x=1733289067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1eUNyRFXejvK5Lp6kD97CSfR6WNheWGFM2BNBEYh71w=;
  b=bTBG2sJllWA9yPf6E62N9Sg1xsL6tWEwOYi8v0aV5UfWY4EbrxBO0lh0
   oou4U3WFolEmgzuTbHALa8JXeXRQq6ydBPy3lyO2Y06ZJZVdEZ5gP8E+Z
   eMTQzXpR/o9RNpNeJkcVWctaKwEXe38EuLx0GsuLREVeBunnMmDD6R1Gc
   zwNuLZ3xq+epGQk/spKKDoPCbiN0dE4naE3tG7h40yiLvBy5vFzyusk6q
   aIajLodyLLLRdt698+WrVfj8H9k6acxpKWVgsVIRV105nKrL9Y8j7ddhS
   PEdMhvpqS3pFkanGEq4BPyWl7pIh/Cx8PNR6ouJP0BoKO+hBPW1PxPJmF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="7133645"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="7133645"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 21:11:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="836848294"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="836848294"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 04 Dec 2023 21:11:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rANi3-0008NN-2k;
	Tue, 05 Dec 2023 05:11:03 +0000
Date: Tue, 5 Dec 2023 13:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-v2.1 23/26] lib/dynamic_debug.c:631:7: warning: no
 previous prototype for function '__skip_spaces'
Message-ID: <202312051343.4tDxM8F4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-v2.1
head:   20d113eb6f9ac604fce8e97eefae3b07e133d148
commit: bd5e2662b6cfb19528fe8c93525a6058fa235049 [23/26] dyndbg: __skip_spaces
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231205/202312051343.4tDxM8F4-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051343.4tDxM8F4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051343.4tDxM8F4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c:207:7: warning: no previous prototype for function 'show_T_args' [-Wmissing-prototypes]
   char *show_T_args(struct dd_ctrl *ctrl, char *p)
         ^
   lib/dynamic_debug.c:207:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   char *show_T_args(struct dd_ctrl *ctrl, char *p)
   ^
   static 
>> lib/dynamic_debug.c:631:7: warning: no previous prototype for function '__skip_spaces' [-Wmissing-prototypes]
   char *__skip_spaces(const char *str)
         ^
   lib/dynamic_debug.c:631:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   char *__skip_spaces(const char *str)
   ^
   static 
   2 warnings generated.


vim +/__skip_spaces +631 lib/dynamic_debug.c

   630	
 > 631	char *__skip_spaces(const char *str)
   632	{
   633		str = skip_spaces(str);
   634		if (*str == ',')
   635			str = skip_spaces(++str);
   636		return (char *)str;
   637	}
   638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
