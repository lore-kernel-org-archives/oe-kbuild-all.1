Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0FB1D6194
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 05:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764480950; cv=none; b=ZtRti1NIxNwkwqzpQcRVi+m2RNMN7oQT3vKEo8GSlU/O3+eALE3oD/oiIcLvX6q/oaKQgc1IvxAJrfUx2YGnCD7UE+Yd9EmUnfMqIPuaBh/I9JtafVXlQ90ki4JMaXcmgfJR+uvJgUpNb3eX5vDIOkPR2Y8nJqF+vF9t2Fv0ToQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764480950; c=relaxed/simple;
	bh=ofT8b8zEte7mCU6UZuTrjNszB5YE4IFFUYlGsnJSH6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=osf8zFCz6CKqeHAmHaV+sak/tA/zZsxx00bn8iaxvXFYVBwjrPnT7sfbcyEsWz5oGVP34k6mv5Mp58NxJmwHTMprdavHVX6xwUPNXVFqqB0tI9nIoi683Yw5XHg8deOhkuwHYqc5E+9Qb+BDbnQVb8sWHC2dTjmNbA/SsP6KAB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bl6lAhfG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bl6lAhfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764480948; x=1796016948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ofT8b8zEte7mCU6UZuTrjNszB5YE4IFFUYlGsnJSH6Q=;
  b=bl6lAhfGH7KaZ3x7JJ+jaySUkrfQZyb7yiPsuXBfTzEHnO2njlqW/qWp
   Lv6VHo32Ts/8BLRr0LTkqO1prKxSnZcvFvCms4LbGq6TuRcE2Cu/D/EZ1
   yrw/LiPZ8oClzq+YMtuRNx6AJ4QJGIBUz9zrPO6Tydgto+EuMj7a9h9r1
   NfFO5F+ogof9sVMR1s3QajdH+K3QOa75kltK1+sqz1t0IraltZeWEpsHz
   SUuJUGcCMfZftHyKX05DRA+FP2LUrINKzAOjUMYwmPAmpSZjUVrfnCD8r
   AxSEY0tNtkjp98stsmqIERGtPPAcVf+HQIxSYKQE+1N5Xq2u9OVKh7v4u
   A==;
X-CSE-ConnectionGUID: LeCspEmqQEWztk4lskB84w==
X-CSE-MsgGUID: t9eG7WZBSOuQBA1L+D43Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="77910647"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="77910647"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 21:35:45 -0800
X-CSE-ConnectionGUID: bQmabrXCR66h+8Je8bRpMw==
X-CSE-MsgGUID: ONXS4giCRx2L1RsXQeBDoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="217130983"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Nov 2025 21:35:44 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPa62-000000007nX-1Hyc;
	Sun, 30 Nov 2025 05:35:42 +0000
Date: Sun, 30 Nov 2025 13:34:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/46]
 include/uapi/linux/const.h:20:25: error: conversion from 'long long unsigned
 int' to 'size_t' {aka 'unsigned int'} changes value from '34359738368' to
 '0'
Message-ID: <202511301357.DcPAZ26E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   520e11ce6f5596dca544fdc96adbb85b54e8e26f
commit: a0a3f0a41c8789060f0ed28f79066d97bfc47a8b [0/46] UPSTREAM: drm/xe: Add a xe_bo subtest for shrinking / swapping
config: i386-randconfig-012-20251129 (https://download.01.org/0day-ci/archive/20251130/202511301357.DcPAZ26E-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511301357.DcPAZ26E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511301357.DcPAZ26E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:100,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/pagemap.h:8,
                    from include/drm/ttm/ttm_tt.h:30,
                    from drivers/gpu/drm/xe/xe_bo.h:9,
                    from drivers/gpu/drm/xe/xe_bo.c:6:
   drivers/gpu/drm/xe/tests/xe_bo.c: In function 'shrink_test_run_device':
>> include/uapi/linux/const.h:20:25: error: conversion from 'long long unsigned int' to 'size_t' {aka 'unsigned int'} changes value from '34359738368' to '0' [-Werror=overflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:49:41: note: in expansion of macro '_AC'
      49 | #define SZ_32G                          _AC(0x800000000, ULL)
         |                                         ^~~
   drivers/gpu/drm/xe/tests/xe_bo.c:461:17: note: in expansion of macro 'SZ_32G'
     461 |         limit = SZ_32G;
         |                 ^~~~~~
   include/uapi/linux/const.h:20:25: error: conversion from 'long long unsigned int' to 'size_t' {aka 'unsigned int'} changes value from '17179869184' to '0' [-Werror=overflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:48:41: note: in expansion of macro '_AC'
      48 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~
   drivers/gpu/drm/xe/tests/xe_bo.c:464:25: note: in expansion of macro 'SZ_16G'
     464 |                 limit = SZ_16G;
         |                         ^~~~~~
   cc1: all warnings being treated as errors


vim +20 include/uapi/linux/const.h

9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   6  
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   7  /* Some constant macros are used in both assembler and
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   8   * C code.  Therefore we cannot annotate them always with
6df95fd7ad9a84 include/linux/const.h      Randy Dunlap        2007-05-08   9   * 'UL' and other type specifiers unilaterally.  We
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  10   * use the following macros to deal with this.
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  11   *
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  12   * Similarly, _AT() will cast an expression with a type in C, but
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  13   * leave it unchanged in asm.
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  14   */
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  15  
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  16  #ifdef __ASSEMBLY__
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  17  #define _AC(X,Y)	X
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  18  #define _AT(T,X)	X
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  19  #else
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02 @20  #define __AC(X,Y)	(X##Y)
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  21  #define _AC(X,Y)	__AC(X,Y)
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  22  #define _AT(T,X)	((T)(X))
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  23  #endif
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  24  

:::::: The code at line 20 was first introduced by commit
:::::: 9d291e787b2b71d1b57e5fbb24ba9c70e748ed84 [PATCH] x86-64: Assembly safe page.h and pgtable.h

:::::: TO: Vivek Goyal <vgoyal@in.ibm.com>
:::::: CC: Andi Kleen <andi@basil.nowhere.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
