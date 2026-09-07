Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDBB34A79D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 23:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788824643; cv=none; b=sfhjZ/Yh4zOdGfxXL6ZDhA9kED4C50RLc8eLR11EiNeA4nR71WIH9ibPPzugVqHhol4R/AZ8FzvL9ItBBw8eHHRns0pww7vMg+P/CHmlx5+8c/1hrrXDfCQc08nZhYjLP6sJACzE4bpWvi17LJlHddC9u6RUzXIn6RrDicZIVIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788824643; c=relaxed/simple;
	bh=UsyaNOsVCmSEEgvfK/QcIzA4rPtntI/BGgHJXiTCE8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tsh9V4xr8VB4cw4QpokNEVA1WDv1j+4mV9HXzAKAQfFEWlo3nNFai/K0Kg3iq9/1/E+svqE1PBPDUrrLUeM4JyAPsuQ6VOtvYHMVq3Jl1yaLKaaU9r4jNnyaNN6VwwHOIZe9xT4iVygXgWHOujEp9Cj7QS66VeV1VF8yaC+gtWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSGNbeCt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSGNbeCt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788824642; x=1820360642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UsyaNOsVCmSEEgvfK/QcIzA4rPtntI/BGgHJXiTCE8I=;
  b=LSGNbeCtKKJTpuRUqWvNZ7AqX6GqgvcArMXm0Mw/2OOxO7FI/njC6N33
   5KwqHofx/WtcRX6YueZeSveuBJJgyYYca7l1hl6l2w9rAps506c1kq3lw
   xzqTxvkeoCIKq/PEEB+HY36l8Nxi1dUnH+yxvszMzb4j61K66O5jAwguw
   9/w9HEk/21+xm/903iOPTdHCLOnvEAxj2TTysVvmI+k95cfNMdd5j4AZM
   DPPMbVeZpGOJG5eWoS2pXLW3ARmCd+8/kIEZRg8BgNoY0BkqJZkCsBmd5
   952FPDjD+SaTRvkqnpIHvwxJFJDQhjnJhFf4oeuIylUXS/r26sQwS6A4t
   A==;
X-CSE-ConnectionGUID: nMYQRVQBQtOLEa+hOWeEpg==
X-CSE-MsgGUID: 01vNOxf2SdysHRe6zCi+sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89346849"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89346849"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 16:44:01 -0700
X-CSE-ConnectionGUID: 5XQLIBnmSrqFiMTOz0Td8A==
X-CSE-MsgGUID: 9w4hxY70RGmQET8oy9B5Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="266485604"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 07 Sep 2026 16:43:59 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3j0H-000000000QY-1Xox;
	Mon, 07 Sep 2026 23:43:57 +0000
Date: Tue, 08 Sep 2026 01:42:57 +0200
From: kernel test robot <lkp@intel.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Subject: lib/vdso/gettimeofday.c:288:31: error: implicit declaration
 of function 'BITS_PER_TYPE'; did you mean 'BITS_PER_LONG'?
Message-ID: <202609080117.XY9u2XZ9-lkp@intel.com>
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
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260908/202609080117.XY9u2XZ9-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080117.XY9u2XZ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080117.XY9u2XZ9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   lib/vdso/gettimeofday.c: In function '__cvdso_clock_gettime_common':
>> lib/vdso/gettimeofday.c:288:31: error: implicit declaration of function 'BITS_PER_TYPE'; did you mean 'BITS_PER_LONG'? [-Wimplicit-function-declaration]
     288 |         BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
         |                               ^~~~~~~~~~~~~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   lib/vdso/gettimeofday.c:288:9: note: in expansion of macro 'BUILD_BUG_ON'
     288 |         BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
         |         ^~~~~~~~~~~~
   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:95: arch/powerpc/kernel/vdso/vgettimeofday-32.o] Error 1
   make[3]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[2]: *** [arch/powerpc/Makefile:395: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +288 lib/vdso/gettimeofday.c

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
