Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26CA296BA5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 02:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766544254; cv=none; b=udUKGLDEElBAUCLY9yT0gFVyKDMDNiVlTePHPPh6mwY4NNDp4VGnws7PBFta+NtMckc6CLml8I7rprr6kWcAGQzBVxZfY6o5SPb0gSSaaBTPt759X5/YYTTJQ4rTpwVvmuN+2ud5UGD5Il+dM7Lfphne37Km+2tDjV840K0yyA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766544254; c=relaxed/simple;
	bh=WOo6wwaAA4Jybr5cTmNmjbU7d+yyFs/ui9IxoieMy0s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LXIVCkL1AHS8+qjVK8+RcZ+wp/WxE7rb5I7mkihqVGcvDl7t4nmwjcSmkZsLNvJqHGqviG4+9x90fKj2K/ryaux36MuHvgN8fvi0PeYqwFOk2UotpM3HjM0xZy/2LDgh1W9PZtXWEkHT0tfeApDo2fJMvg7GsWnN7vc/UhnK2cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jch3FpTS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jch3FpTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766544253; x=1798080253;
  h=date:from:to:cc:subject:message-id;
  bh=WOo6wwaAA4Jybr5cTmNmjbU7d+yyFs/ui9IxoieMy0s=;
  b=jch3FpTSJzoQz/XGXcg621O3L8wK2c9SUI5QR+pr1alH/Dd2OUsIMlp1
   kyzztEcGGugACww8SxIT3slpIykWYmfKue4MONKaNIUoH+WxG+RN/bv7L
   dkbC2VVo/1w54CfuVXSE7dBpmKzwo5cMZ5VMxY3ZoVR9zg20PxmnxnN3Y
   sGCxhaJ+8rOzJMAHfebT0Mk63xa91zzIeq59CnyNhsgY/R9VdEBcn3HXL
   Q+FVkG66R/U8MlyPSxzw7w16MbsUeGD8G0CqZsseZpW9cCoE5vP5UHVn/
   IHsIVfiNNRJh79NXl3Bq8LA4JWauboOTQlT7nbEQWmmDwbv8VeGypCZIK
   w==;
X-CSE-ConnectionGUID: ZtnDgDSyT2StkCUvnAtN6w==
X-CSE-MsgGUID: 5B75KWL8Rx6FgN1meDYaHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="85974948"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="85974948"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 18:44:12 -0800
X-CSE-ConnectionGUID: l84QjNdzQUiCUM/UEkrhgQ==
X-CSE-MsgGUID: z/M9hRntTzeJEKP8rpxgBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="199162648"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Dec 2025 18:44:11 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYEqQ-000000002b9-082J;
	Wed, 24 Dec 2025 02:43:30 +0000
Date: Wed, 24 Dec 2025 10:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:kerne-unload 6/6] arch/s390/kernel/ipl.c:2155:2:
 error: call to undeclared function 'tracing_off'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202512241034.379y66MA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux kerne-unload
head:   a2b83b8a1af321f2206864668e042008f27a0fbf
commit: a2b83b8a1af321f2206864668e042008f27a0fbf [6/6] drop trace_printk.h
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20251224/202512241034.379y66MA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241034.379y66MA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512241034.379y66MA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kernel/ipl.c:2155:2: error: call to undeclared function 'tracing_off'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2155 |         tracing_off();
         |         ^
   1 error generated.


vim +/tracing_off +2155 arch/s390/kernel/ipl.c

7dd6b3343fdc190 Michael Holzheu    2011-08-03  2152  
b44913fceb1324b Alexander Gordeev  2021-04-06  2153  void do_restart(void *arg)
8b646bd759086f6 Martin Schwidefsky 2012-03-11  2154  {
3ab121ab1866922 Michael Holzheu    2012-03-11 @2155  	tracing_off();
3ab121ab1866922 Michael Holzheu    2012-03-11  2156  	debug_locks_off();
3ab121ab1866922 Michael Holzheu    2012-03-11  2157  	lgr_info_log();
a795eeaf851b91c Sven Schnelle      2024-07-16  2158  	smp_call_ipl_cpu(__do_restart, arg);
8b646bd759086f6 Martin Schwidefsky 2012-03-11  2159  }
8b646bd759086f6 Martin Schwidefsky 2012-03-11  2160  

:::::: The code at line 2155 was first introduced by commit
:::::: 3ab121ab18669226742891416fe7ecc86dadb047 [S390] kernel: Add z/VM LGR detection

:::::: TO: Michael Holzheu <holzheu@linux.vnet.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
