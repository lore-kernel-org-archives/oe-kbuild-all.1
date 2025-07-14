Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BD2251791
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 14:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752501618; cv=none; b=cxSTGvpUsC0Z1wx4jFX6E6wsLVZN+2Lxz2EjvVgOEXfFPgzUxxcO25cd7R8P9JjQkdkZOy3n6N5jqi3MD9slYnk5JVYd0PKQz5Q4Df5nfo7FDyMwEMQDzmxFTnRD9eD769JE1g1woXOPJZFhpArX1J3cg+AlOAjrV4BweoUNj98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752501618; c=relaxed/simple;
	bh=eK22Ricn2E5xE1vY1+2AjabFX6rn29XccfXdYWziJME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s+4hPVFuzmtGLupegOO578nvXNxTNPTDJ8A7WP0bkGHqaxmOBxIGh2TvpG7JAOuEcCP+/V8wfjiZbmZdlByUOIFRY9hJg9DeRiFKu2BwAO4NYC1YTdcLxBnGGKHYc+5exPL9bJS4ounvfhLNxI8H0y8+FsDSGDRkk2G70stoyFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WbDHreg6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WbDHreg6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752501617; x=1784037617;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eK22Ricn2E5xE1vY1+2AjabFX6rn29XccfXdYWziJME=;
  b=WbDHreg6sE1RwKeXX8fHQeYvQgLnDb6RmoHQ0BuKIKI57V51jzud23QA
   ZkU25ccpyHRwPQuQrWNZSyBuatygzlWNAlFN6Cf7M3ERhpqa4Z4X4247Z
   SLL1yR2q2T1w9SfK8pMuvHgllJx60jhnSv3oho14b8vgtglivZekBoPrb
   yXHM4FtKkfQUEA6fhl8wyf93jKJOwB4jI+ONIonWwXIb1cM76963v+Ls5
   QUVI8zquw9XGSCE2SwtrsiyVovJc+LhhB6BfmoQ/4tqEaN3q/f+3ptVhe
   C7bz5Vk+1AimMUZCI5zCuNYfb19QmRBZB2pRishRENYrE0NPLEBMagNgc
   g==;
X-CSE-ConnectionGUID: R6w2pauvQb+iOE/efusjfA==
X-CSE-MsgGUID: 6Tlfiq7aTxCRvToL78pHhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="64953506"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="64953506"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 07:00:15 -0700
X-CSE-ConnectionGUID: VWfUoKmZRtOc1Q7PVDFuAw==
X-CSE-MsgGUID: CO/o/f5oR8e3U1kN8Ghbtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="157041198"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jul 2025 07:00:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubJj1-0008xY-08;
	Mon, 14 Jul 2025 14:00:11 +0000
Date: Mon, 14 Jul 2025 21:59:36 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-has-macros 3/7]
 lib/vdso/gettimeofday.c:319:24: error: implicit declaration of function
 'clock_gettime32_fallback'; did you mean 'clock_gettime_fallback'?
Message-ID: <202507142108.lC9WqGzC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-has-macros
head:   51063ab687181b4aec3cfdb1def38e50381918b8
commit: ef658fe994fa9d401bf412fc296b27fd0f9225c5 [3/7] BUILD_VDSO32
config: arm64-randconfig-001-20250714 (https://download.01.org/0day-ci/archive/20250714/202507142108.lC9WqGzC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507142108.lC9WqGzC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507142108.lC9WqGzC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   lib/vdso/gettimeofday.c: In function '__cvdso_clock_gettime32_data':
>> lib/vdso/gettimeofday.c:319:24: error: implicit declaration of function 'clock_gettime32_fallback'; did you mean 'clock_gettime_fallback'? [-Werror=implicit-function-declaration]
     319 |                 return clock_gettime32_fallback(clock, res);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
         |                        clock_gettime_fallback
   lib/vdso/gettimeofday.c: In function '__cvdso_clock_getres_time32_data':
>> lib/vdso/gettimeofday.c:462:24: error: implicit declaration of function 'clock_getres32_fallback'; did you mean 'clock_getres_fallback'? [-Werror=implicit-function-declaration]
     462 |                 return clock_getres32_fallback(clock, res);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
         |                        clock_getres_fallback
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:287: arch/arm64/kernel/vdso/vgettimeofday.o] Error 1 shuffle=260039524
   make[3]: Target 'arch/arm64/kernel/vdso/vdso.so' not remade because of errors.
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:207: vdso_prepare] Error 2 shuffle=260039524
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=260039524
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=260039524
   make: Target 'prepare' not remade because of errors.


vim +319 lib/vdso/gettimeofday.c

e876f0b69dc993 Christophe Leroy   2020-02-07  308  
00b26474c2f161 Vincenzo Frascino  2019-06-21  309  static __maybe_unused int
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  310  __cvdso_clock_gettime32_data(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  311  			     struct old_timespec32 *res)
00b26474c2f161 Vincenzo Frascino  2019-06-21  312  {
00b26474c2f161 Vincenzo Frascino  2019-06-21  313  	struct __kernel_timespec ts;
00b26474c2f161 Vincenzo Frascino  2019-06-21  314  	int ret;
00b26474c2f161 Vincenzo Frascino  2019-06-21  315  
e876f0b69dc993 Christophe Leroy   2020-02-07  316  	ret = __cvdso_clock_gettime_common(vd, clock, &ts);
00b26474c2f161 Vincenzo Frascino  2019-06-21  317  
c60a32ea4f459f Thomas Gleixner    2019-07-30  318  	if (unlikely(ret))
c60a32ea4f459f Thomas Gleixner    2019-07-30 @319  		return clock_gettime32_fallback(clock, res);
502a590a170b3b Thomas Gleixner    2019-07-28  320  
a279235ddbe975 Vincenzo Frascino  2019-08-30  321  	/* For ret == 0 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  322  	res->tv_sec = ts.tv_sec;
00b26474c2f161 Vincenzo Frascino  2019-06-21  323  	res->tv_nsec = ts.tv_nsec;
a279235ddbe975 Vincenzo Frascino  2019-08-30  324  
00b26474c2f161 Vincenzo Frascino  2019-06-21  325  	return ret;
00b26474c2f161 Vincenzo Frascino  2019-06-21  326  }
e876f0b69dc993 Christophe Leroy   2020-02-07  327  
e876f0b69dc993 Christophe Leroy   2020-02-07  328  static __maybe_unused int
e876f0b69dc993 Christophe Leroy   2020-02-07  329  __cvdso_clock_gettime32(clockid_t clock, struct old_timespec32 *res)
e876f0b69dc993 Christophe Leroy   2020-02-07  330  {
df7fcbefa71090 Thomas Weiﬂschuh   2025-02-04  331  	return __cvdso_clock_gettime32_data(__arch_get_vdso_u_time_data(), clock, res);
e876f0b69dc993 Christophe Leroy   2020-02-07  332  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  333  
00b26474c2f161 Vincenzo Frascino  2019-06-21  334  static __maybe_unused int
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  335  __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
e876f0b69dc993 Christophe Leroy   2020-02-07  336  			  struct __kernel_old_timeval *tv, struct timezone *tz)
00b26474c2f161 Vincenzo Frascino  2019-06-21  337  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  338  	const struct vdso_clock *vc = vd->clock_data;
00b26474c2f161 Vincenzo Frascino  2019-06-21  339  
00b26474c2f161 Vincenzo Frascino  2019-06-21  340  	if (likely(tv != NULL)) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  341  		struct __kernel_timespec ts;
00b26474c2f161 Vincenzo Frascino  2019-06-21  342  
64c3613ce31a1a Anna-Maria Behnsen 2025-03-03  343  		if (do_hres(vd, &vc[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
00b26474c2f161 Vincenzo Frascino  2019-06-21  344  			return gettimeofday_fallback(tv, tz);
00b26474c2f161 Vincenzo Frascino  2019-06-21  345  
00b26474c2f161 Vincenzo Frascino  2019-06-21  346  		tv->tv_sec = ts.tv_sec;
00b26474c2f161 Vincenzo Frascino  2019-06-21  347  		tv->tv_usec = (u32)ts.tv_nsec / NSEC_PER_USEC;
00b26474c2f161 Vincenzo Frascino  2019-06-21  348  	}
00b26474c2f161 Vincenzo Frascino  2019-06-21  349  
00b26474c2f161 Vincenzo Frascino  2019-06-21  350  	if (unlikely(tz != NULL)) {
660fd04f931717 Thomas Gleixner    2019-11-12  351  		if (IS_ENABLED(CONFIG_TIME_NS) &&
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  352  		    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  353  			vd = __arch_get_vdso_u_timens_data(vd);
660fd04f931717 Thomas Gleixner    2019-11-12  354  
00b26474c2f161 Vincenzo Frascino  2019-06-21  355  		tz->tz_minuteswest = vd[CS_HRES_COARSE].tz_minuteswest;
00b26474c2f161 Vincenzo Frascino  2019-06-21  356  		tz->tz_dsttime = vd[CS_HRES_COARSE].tz_dsttime;
00b26474c2f161 Vincenzo Frascino  2019-06-21  357  	}
00b26474c2f161 Vincenzo Frascino  2019-06-21  358  
00b26474c2f161 Vincenzo Frascino  2019-06-21  359  	return 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  360  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  361  
e876f0b69dc993 Christophe Leroy   2020-02-07  362  static __maybe_unused int
e876f0b69dc993 Christophe Leroy   2020-02-07  363  __cvdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
e876f0b69dc993 Christophe Leroy   2020-02-07  364  {
df7fcbefa71090 Thomas Weiﬂschuh   2025-02-04  365  	return __cvdso_gettimeofday_data(__arch_get_vdso_u_time_data(), tv, tz);
e876f0b69dc993 Christophe Leroy   2020-02-07  366  }
e876f0b69dc993 Christophe Leroy   2020-02-07  367  
e876f0b69dc993 Christophe Leroy   2020-02-07  368  static __maybe_unused __kernel_old_time_t
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  369  __cvdso_time_data(const struct vdso_time_data *vd, __kernel_old_time_t *time)
00b26474c2f161 Vincenzo Frascino  2019-06-21  370  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  371  	const struct vdso_clock *vc = vd->clock_data;
660fd04f931717 Thomas Gleixner    2019-11-12  372  	__kernel_old_time_t t;
660fd04f931717 Thomas Gleixner    2019-11-12  373  
2d6b01bd88ccab Thomas Gleixner    2020-02-07  374  	if (IS_ENABLED(CONFIG_TIME_NS) &&
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  375  	    vc->clock_mode == VDSO_CLOCKMODE_TIMENS) {
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  376  		vd = __arch_get_vdso_u_timens_data(vd);
886653e3663917 Anna-Maria Behnsen 2025-03-03  377  		vc = vd->clock_data;
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  378  	}
660fd04f931717 Thomas Gleixner    2019-11-12  379  
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  380  	t = READ_ONCE(vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
00b26474c2f161 Vincenzo Frascino  2019-06-21  381  
00b26474c2f161 Vincenzo Frascino  2019-06-21  382  	if (time)
00b26474c2f161 Vincenzo Frascino  2019-06-21  383  		*time = t;
00b26474c2f161 Vincenzo Frascino  2019-06-21  384  
00b26474c2f161 Vincenzo Frascino  2019-06-21  385  	return t;
00b26474c2f161 Vincenzo Frascino  2019-06-21  386  }
e876f0b69dc993 Christophe Leroy   2020-02-07  387  
e876f0b69dc993 Christophe Leroy   2020-02-07  388  static __maybe_unused __kernel_old_time_t __cvdso_time(__kernel_old_time_t *time)
e876f0b69dc993 Christophe Leroy   2020-02-07  389  {
df7fcbefa71090 Thomas Weiﬂschuh   2025-02-04  390  	return __cvdso_time_data(__arch_get_vdso_u_time_data(), time);
e876f0b69dc993 Christophe Leroy   2020-02-07  391  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  392  
00b26474c2f161 Vincenzo Frascino  2019-06-21  393  static __maybe_unused
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  394  int __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  395  				struct __kernel_timespec *res)
00b26474c2f161 Vincenzo Frascino  2019-06-21  396  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  397  	const struct vdso_clock *vc = vd->clock_data;
00b26474c2f161 Vincenzo Frascino  2019-06-21  398  	u32 msk;
502a590a170b3b Thomas Gleixner    2019-07-28  399  	u64 ns;
00b26474c2f161 Vincenzo Frascino  2019-06-21  400  
00b26474c2f161 Vincenzo Frascino  2019-06-21  401  	/* Check for negative values or invalid clocks */
00b26474c2f161 Vincenzo Frascino  2019-06-21  402  	if (unlikely((u32) clock >= MAX_CLOCKS))
502a590a170b3b Thomas Gleixner    2019-07-28  403  		return -1;
00b26474c2f161 Vincenzo Frascino  2019-06-21  404  
2d6b01bd88ccab Thomas Gleixner    2020-02-07  405  	if (IS_ENABLED(CONFIG_TIME_NS) &&
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  406  	    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  407  		vd = __arch_get_vdso_u_timens_data(vd);
660fd04f931717 Thomas Gleixner    2019-11-12  408  
00b26474c2f161 Vincenzo Frascino  2019-06-21  409  	/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  410  	 * Convert the clockid to a bitmask and use it to check which
00b26474c2f161 Vincenzo Frascino  2019-06-21  411  	 * clocks are handled in the VDSO directly.
00b26474c2f161 Vincenzo Frascino  2019-06-21  412  	 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  413  	msk = 1U << clock;
cdb7c5a9c897ab Christophe Leroy   2019-12-23  414  	if (msk & (VDSO_HRES | VDSO_RAW)) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  415  		/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  416  		 * Preserves the behaviour of posix_get_hrtimer_res().
00b26474c2f161 Vincenzo Frascino  2019-06-21  417  		 */
886653e3663917 Anna-Maria Behnsen 2025-03-03  418  		ns = READ_ONCE(vd->hrtimer_res);
00b26474c2f161 Vincenzo Frascino  2019-06-21  419  	} else if (msk & VDSO_COARSE) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  420  		/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  421  		 * Preserves the behaviour of posix_get_coarse_res().
00b26474c2f161 Vincenzo Frascino  2019-06-21  422  		 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  423  		ns = LOW_RES_NSEC;
00b26474c2f161 Vincenzo Frascino  2019-06-21  424  	} else {
502a590a170b3b Thomas Gleixner    2019-07-28  425  		return -1;
00b26474c2f161 Vincenzo Frascino  2019-06-21  426  	}
00b26474c2f161 Vincenzo Frascino  2019-06-21  427  
1638b8f096ca16 Thomas Gleixner    2019-10-21  428  	if (likely(res)) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  429  		res->tv_sec = 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  430  		res->tv_nsec = ns;
1638b8f096ca16 Thomas Gleixner    2019-10-21  431  	}
00b26474c2f161 Vincenzo Frascino  2019-06-21  432  	return 0;
502a590a170b3b Thomas Gleixner    2019-07-28  433  }
502a590a170b3b Thomas Gleixner    2019-07-28  434  
ffd08731b2d632 Vincenzo Frascino  2019-11-28  435  static __maybe_unused
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  436  int __cvdso_clock_getres_data(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  437  			      struct __kernel_timespec *res)
502a590a170b3b Thomas Gleixner    2019-07-28  438  {
e876f0b69dc993 Christophe Leroy   2020-02-07  439  	int ret = __cvdso_clock_getres_common(vd, clock, res);
00b26474c2f161 Vincenzo Frascino  2019-06-21  440  
502a590a170b3b Thomas Gleixner    2019-07-28  441  	if (unlikely(ret))
00b26474c2f161 Vincenzo Frascino  2019-06-21  442  		return clock_getres_fallback(clock, res);
502a590a170b3b Thomas Gleixner    2019-07-28  443  	return 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  444  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  445  
e876f0b69dc993 Christophe Leroy   2020-02-07  446  static __maybe_unused
e876f0b69dc993 Christophe Leroy   2020-02-07  447  int __cvdso_clock_getres(clockid_t clock, struct __kernel_timespec *res)
e876f0b69dc993 Christophe Leroy   2020-02-07  448  {
df7fcbefa71090 Thomas Weiﬂschuh   2025-02-04  449  	return __cvdso_clock_getres_data(__arch_get_vdso_u_time_data(), clock, res);
e876f0b69dc993 Christophe Leroy   2020-02-07  450  }
e876f0b69dc993 Christophe Leroy   2020-02-07  451  
00b26474c2f161 Vincenzo Frascino  2019-06-21  452  static __maybe_unused int
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  453  __cvdso_clock_getres_time32_data(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  454  				 struct old_timespec32 *res)
00b26474c2f161 Vincenzo Frascino  2019-06-21  455  {
00b26474c2f161 Vincenzo Frascino  2019-06-21  456  	struct __kernel_timespec ts;
00b26474c2f161 Vincenzo Frascino  2019-06-21  457  	int ret;
00b26474c2f161 Vincenzo Frascino  2019-06-21  458  
e876f0b69dc993 Christophe Leroy   2020-02-07  459  	ret = __cvdso_clock_getres_common(vd, clock, &ts);
c60a32ea4f459f Thomas Gleixner    2019-07-30  460  
c60a32ea4f459f Thomas Gleixner    2019-07-30  461  	if (unlikely(ret))
c60a32ea4f459f Thomas Gleixner    2019-07-30 @462  		return clock_getres32_fallback(clock, res);
00b26474c2f161 Vincenzo Frascino  2019-06-21  463  
a279235ddbe975 Vincenzo Frascino  2019-08-30  464  	if (likely(res)) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  465  		res->tv_sec = ts.tv_sec;
00b26474c2f161 Vincenzo Frascino  2019-06-21  466  		res->tv_nsec = ts.tv_nsec;
00b26474c2f161 Vincenzo Frascino  2019-06-21  467  	}
00b26474c2f161 Vincenzo Frascino  2019-06-21  468  	return ret;
00b26474c2f161 Vincenzo Frascino  2019-06-21  469  }
e876f0b69dc993 Christophe Leroy   2020-02-07  470  

:::::: The code at line 319 was first introduced by commit
:::::: c60a32ea4f459f99b98d383cad3b1ac7cfb3f4be lib/vdso/32: Provide legacy syscall fallbacks

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
