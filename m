Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341439;
	b=gS6P6QA1PhMJUgtGgRuQctLKV6CkeTbxYWSv4aW7k+EX/FYBuIfoyLm/zus3tSLv3s9k
	 vn8Q2+gv8fBnoaLymivqAP8PrKul6pxKsoa2GtUcsYc1tzkdnMv4vS653d0YQDRjnDUWG
	 +6ENkSUs8CYvwU1HymHkicKCLhYaPIu3PyeQ5dTbOdLn8D1yIPWA9bhTaqVptiqGT7jKT
	 P8cK7tD4S/5Bo4w2BEKMhjXxhgK4h0W6leKALipNEe1mFdrD1gsXRSRs9dmTXo8mfsYzD
	 Y8YNlK3pMpCw/eL7SMwBVr8tubR1LjWu0vFWro4kr7ITyjehRnUMP0yr0BfDQyKwHvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341439;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=/jEibsnfOhq53pcn1HiaaJkoHXzuLU7yFDgeQJJTaRw=;
	b=MrTXz19TUHgVGAD+Z4lScqEa+Y+GPwfy++fGkOjii3P75Hlhc90abz8oDSF7LdpLE9Sc
	 TXlmvBbugyVMGMraujAyb5/gdZf0vyzQD/OKVzlv6L7agZqWLV5KwFEp/b9tSMBGTXRif
	 IAjg8aCfnEuxpA4vbzlstNH34Vj9qzYOP3QCadVSFc31hJFOUj4eKGFcIrs56cIUUfH/6
	 o2ElhptvpY3AeMgruaCeCrW4P+Y45yjityOPjP+Q8fgQ6ol3LKenFH0GoD+xqfW6I33No
	 +ZByN9C7y9RTl3XKXI1/+qaOm9LZnssrgJu04rbINZe78VqpoIsgBHtVyYGIDXHFkew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TIOjfGiN;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5CE606A323
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 20:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D5CE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TIOjfGiN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794341439; x=1825877439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cnRXsx5b3aMehScCppNNLV/+Zngl9LJYjFZmJW5aZNQ=;
  b=TIOjfGiNEI2TzWdxGXQ/8V7VpkMcL2PcHg7RQv1AQ6gvYPB5OEhelLQz
   L25GZogJHwjwVJNAlBi+IScyoIX7/j82x4zsiXn99MvDfrAK9Drm4bH0e
   Gg+J0Jhl6zUhaWodbMbcUMhdSgCmMObV2PnHP+VJy1NWAEIkpM2Flmz3r
   h7ApflPTKYmPYL8sFJnW0BoyHOJdusVzTlB1z2H5oYodZuyVoBXVcPyLw
   EFiwgYBlRV401iQFTMWZhRWwdk/60ceeM5UQ9PezACFEsc05eZOdV+xKN
   tDb49jzhzBb8nxdS8BLLvZtdsOcLLS+2cExdEtzZQnmiNLliRfZeVYs+i
   A==;
X-CSE-ConnectionGUID: cBbHVWg1T1ebD7IpKzzqfA==
X-CSE-MsgGUID: l1fj5d2nRU+pivj2OqUGHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2992507"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2992507"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 12:10:37 -0800
X-CSE-ConnectionGUID: Sw+j9A+7Trm/KVsAOpfe4g==
X-CSE-MsgGUID: 0IjkBFPoRQSXc1HWCY8ACw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="10118110"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 10 Nov 2026 12:10:35 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQsAr-000000000LW-0fwz;
	Tue, 10 Nov 2026 20:10:33 +0000
Date: Tue, 10 Nov 2026 21:10:27 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-no-fallback 10/11]
 lib/vdso/gettimeofday.c:451:11: error: 'EINVAL' undeclared
Message-ID: <202611102115.MJcc4qUZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-no-fallback
head:   3b966bf4e9676dd99abe071691e72e14fd05fe73
commit: 090f60ded7da81c15e516570a3d5b89de9d00587 [10/11] getres: fallback
config: powerpc64-randconfig-2000-20261110 (https://download.01.org/0day-ci/archive/20261110/202611102115.MJcc4qUZ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611102115.MJcc4qUZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611102115.MJcc4qUZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   lib/vdso/gettimeofday.c: In function '__cvdso_clock_getres_common':
>> lib/vdso/gettimeofday.c:451:11: error: 'EINVAL' undeclared (first use in this function)
      return -EINVAL;
              ^~~~~~
   lib/vdso/gettimeofday.c:451:11: note: each undeclared identifier is reported only once for each function it appears in
   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:96: arch/powerpc/kernel/vdso/vgettimeofday-32.o] Error 1 shuffle=1950352311
   make[3]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[2]: *** [arch/powerpc/Makefile:395: vdso_prepare] Error 2 shuffle=1950352311
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1950352311
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1950352311
   make: Target 'prepare' not remade because of errors.


vim +/EINVAL +451 lib/vdso/gettimeofday.c

   442	
   443	static __always_inline
   444	int __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t clock,
   445					struct __kernel_timespec *res)
   446	{
   447		u32 msk;
   448		u64 ns;
   449	
   450		if (!vdso_clockid_valid(clock))
 > 451			return -EINVAL;
   452	
   453		if (vdso_is_timens_clock(&vd->hres_coarse))
   454			vd = vdso_timens_data(vd);
   455	
   456		/*
   457		 * Convert the clockid to a bitmask and use it to check which
   458		 * clocks are handled in the VDSO directly.
   459		 */
   460		msk = 1U << clock;
   461		if (msk & (VDSO_HRES | VDSO_RAW)) {
   462			/*
   463			 * Preserves the behaviour of posix_get_hrtimer_res().
   464			 */
   465			ns = READ_ONCE(vd->hrtimer_res);
   466		} else if (msk & VDSO_COARSE) {
   467			/*
   468			 * Preserves the behaviour of posix_get_coarse_res().
   469			 */
   470			ns = LOW_RES_NSEC;
   471		} else if (msk & VDSO_AUX) {
   472			ns = aux_clock_resolution_ns();
   473		} else if (msk & vdso_alarmclock_mask(vd)) {
   474			ns = READ_ONCE(vd->hrtimer_res);
   475		} else {
   476			return -EINVAL;
   477		}
   478	
   479		if (likely(res)) {
   480			res->tv_sec = 0;
   481			res->tv_nsec = ns;
   482		}
   483		return 0;
   484	}
   485	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
