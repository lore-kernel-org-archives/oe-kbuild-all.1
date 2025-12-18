Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99541DEFE7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 05:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766034160; cv=none; b=tN8W5+WKCYU/A4Yr9ir5ShZsIVq8+Xuw7WTchQum2QM+aPKnTL+LCAjejkvz6bUxyNtaPpcZsktcvH7ipvjknYqcLD5AeoVeuiImKnxI7o8ougCeWqhyHo27AX8hOAW4EFk2Derz/2VPJic6vn5M+jiM1miY5ADNmfjQNzpHrEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766034160; c=relaxed/simple;
	bh=FZmFeMzhYE6DCidbor4n6aBZurv7+maiInEnFKkjdxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vd0PAfyp5iTRK7v8pgn1BNVilQ9so7AlfUXn/l93+ioN6SIarnz/IfMDv9muS9EmMTSLYn1XcYHLtuV/uQUlq04c/hA0S9YSQ8Lyio+ydEViRuHQp0DuOHt5WbtlPIXoss319J0IJy1PIuU1MXbnYgVTzSzFXJLY1lQr21V3et8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RjhWaRli; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RjhWaRli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766034159; x=1797570159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FZmFeMzhYE6DCidbor4n6aBZurv7+maiInEnFKkjdxw=;
  b=RjhWaRlieYtyjv1qZ8x1F8PvRZoIkfCLAhyvhyez/jsDO+n1DiXXD3aV
   WWcW8ZxO/HikR7tdDMroMkjTBW+JI/wfnOwoIiiMEI57eMRAVI3wSM6gy
   piA/KN1J5ZAPCZrnSlpOdZ5qpGfR9kx6YeeiVIHj5a0LYUsPaf9c1jGXk
   G5cj7RFojjVoucEP6vh/ZcT4VJGBgKoROEeAy6S+2c5eccJH3udIkGgec
   ME5VE+nOGESYZQ6bkb/DV+KoZTH+cVnQMNz2IbgH5xu8za9vGwg3L6WvF
   gEN3/3c9hv/hOj3fIp2DoLscTTn3a82Yu7Bd/DBGfjLKBIVI/UdyoPoag
   w==;
X-CSE-ConnectionGUID: 7OZ2gvS3SDKeFUwO78+BJg==
X-CSE-MsgGUID: HaoMp1xGSran5n69YEzVUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71612272"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="71612272"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 21:02:36 -0800
X-CSE-ConnectionGUID: JIBxwBy6QlqpP1oXsx0JXQ==
X-CSE-MsgGUID: nqLPpRNoQ2qnrEc8d1VHiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="229543288"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Dec 2025 21:02:35 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW69p-000000001bf-1UBf;
	Thu, 18 Dec 2025 05:02:33 +0000
Date: Thu, 18 Dec 2025 13:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xiongfeng Wang <wangxiongfeng2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1946/1946] kernel/time/hrtimer.o:
 warning: objtool: hrtimer_start_range_ns()+0x91b: unreachable instruction
Message-ID: <202512181230.mRJPKu3s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Phil,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4e9c55920995d70b3e88b60c69753df54b03fdf4
commit: 40ecfb28732cefd0c5658f7c10543bbc4cd41cb8 [1946/1946] hrtimer: Prevent queuing of hrtimer without a function callback
config: x86_64-randconfig-002-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181230.mRJPKu3s-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181230.mRJPKu3s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181230.mRJPKu3s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:59:
   include/linux/compiler-clang.h:20:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      20 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   kernel/time/hrtimer.c:130:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     130 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:128:27: note: previous initialization is here
     128 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:131:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     131 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:128:27: note: previous initialization is here
     128 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:132:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     132 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:128:27: note: previous initialization is here
     128 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:133:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     133 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:128:27: note: previous initialization is here
     128 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.
>> kernel/time/hrtimer.o: warning: objtool: hrtimer_start_range_ns()+0x91b: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
