Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7602C11F3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 01:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830710; cv=none; b=uPe5mfI+fhoDr7BXHe/ldd+u7kmLMx7MxSisfK6Ie7qTc/YUA1PN8AmuFdZ93gjf3KNHagOZfvzK0lo6VzPIiVk9UwScMVnWo1tsxGz8rgR4FdxH6dV6qorZxtPclv8mU/yvYyA7UkJEOcFbsYfmQ63eSrI1eQzrvvzuTfkn6fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830710; c=relaxed/simple;
	bh=Q7fYrm79xPmJvtb+urjCzHXR4gr44AMe8mmA9KZVWVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k7wXN92brVzEaf2Uew3iG/BYynPfMCrps4bFQsU3JYTc1kTpL+4DjcE6bEgXNJXsdo6WsbmAFsWiGg0mL6Q3vAl7/fuJsE7hi6BLNXvQ11PRzVI/nF4RKPH9lGVOqLTU9SR0218obVHj/R4b7k8xsNikakA8b1kuaXo4pqSFoBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOWnWvFs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOWnWvFs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788830707; x=1820366707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q7fYrm79xPmJvtb+urjCzHXR4gr44AMe8mmA9KZVWVI=;
  b=bOWnWvFssXA9WgzMGWcZ9mI+fvSyfeDcAux0XiM8faTqePn9C8xxqq0t
   Qq6WCV0PTxpm3QI2AOeJN457zKW0Kv9G/IIe9M4xiQfdkKlP5kp/KxPop
   uHZg2kXc7Hx1wTyAxHyXQPmQD0MFaSv6fgh6W82oTzcIivDbBXgZ9cKT5
   fH+4hHmUYaaylMwb41EsxmpSLEnd7hgm4qHQlWQ4KrJ6K7niuBqcX840q
   2/8TYgLgXaTI8oFZcOlRfMp2NvKTbpE2fGPeO6QGzGaithzaqWvx25eO6
   eBvit0BrFwWT82iAztSyH14a1GelTd4s5+DSUiE+PT04JS6J5bbv9Vrgb
   w==;
X-CSE-ConnectionGUID: A/bkmCESSgCaz1z4PzwlNQ==
X-CSE-MsgGUID: rwsEmNuqRICG4781zfxy4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="92925337"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="92925337"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 18:25:07 -0700
X-CSE-ConnectionGUID: G9zadVhFSNe2/dd6deB2TA==
X-CSE-MsgGUID: 246lApn9TM2lNpAoiK8nkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="271361989"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 07 Sep 2026 18:25:06 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3ka7-000000000Vm-3mvK;
	Tue, 08 Sep 2026 01:25:03 +0000
Date: Tue, 08 Sep 2026 03:24:14 +0200
From: kernel test robot <lkp@intel.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Subject: lib/vdso/gettimeofday.c:288:24: error: call to undeclared
 function 'BITS_PER_TYPE'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202609080323.xiNyXtcY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Zhan-Xusheng/vdso-math64-Add-and-use-__iter_div64_u64_rem/20260901-100634
head:   70e38aef8fc8b80bc60e2249e5f2a38c2d1e604b
commit: 70e38aef8fc8b80bc60e2249e5f2a38c2d1e604b vdso/gettimeofday: Assert that the clock id fits the dispatch mask
date:   7 days ago
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20260908/202609080323.xiNyXtcY-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project b1f20dd48e11439d5a592662b407e07d8213ffee)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080323.xiNyXtcY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080323.xiNyXtcY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:4:
>> lib/vdso/gettimeofday.c:288:24: error: call to undeclared function 'BITS_PER_TYPE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     288 |         BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
         |                               ^
   lib/vdso/gettimeofday.c:442:24: error: call to undeclared function 'BITS_PER_TYPE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     442 |         BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
         |                               ^
   2 errors generated.
   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:95: arch/powerpc/kernel/vdso/vgettimeofday-32.o] Error 1
   make[3]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[2]: *** [arch/powerpc/Makefile:395: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/BITS_PER_TYPE +288 lib/vdso/gettimeofday.c

   273	
   274	static __always_inline bool
   275	__cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
   276				     struct __kernel_timespec *ts)
   277	{
   278		const struct vdso_clock *vc = vd->clock_data;
   279		u32 msk;
   280	
   281		if (!vdso_clockid_valid(clock))
   282			return false;
   283	
   284		/*
   285		 * Convert the clockid to a bitmask and use it to check which
   286		 * clocks are handled in the VDSO directly.
   287		 */
 > 288		BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
   289		msk = 1U << clock;
   290		if (likely(msk & VDSO_HRES))
   291			vc = &vc[CS_HRES_COARSE];
   292		else if (msk & VDSO_COARSE)
   293			return do_coarse(vd, &vc[CS_HRES_COARSE], clock, ts);
   294		else if (msk & VDSO_RAW)
   295			vc = &vc[CS_RAW];
   296		else if (msk & VDSO_AUX)
   297			return do_aux(vd, clock, ts);
   298		else
   299			return false;
   300	
   301		return do_hres(vd, vc, clock, ts);
   302	}
   303	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
