Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EB61EA84
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 11:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239699; cv=none; b=k+bPH1ancvYjRSHJkmIyYuhazVdItsfvPKtR4mVuc5bdGuqd1uYFrHUxMDTF5rZye3hu0scoyRYfMELEWT8Qtum6SI33YNTJiysZZuEU9WBBsBSKyX3fS1EBh6XYS1P58acfpZv29SxaTIRhoDfj8ko4RowcODBiNJnbOJpkQQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239699; c=relaxed/simple;
	bh=5T9YcZF/t3Y0FYYzh0jVvuOVNLlYh2BMHtvyA3/vt24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=s4cwOFNQN+OuSqdkAbmBscU5+RRZBakd3f7komaLIc9I/Kd/yh+/an6ZIlmFYIzjc4LFN1fqqaJ+CRQTUywpD51pxC8l2K9ovyvzTua9dMYfRWoWyxYNwJU1ue0xYCiMxVPWhrib/L/H3MIspfa0M5mIE+Z96hrUf+8m+6M81Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0IyAriL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0IyAriL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771239698; x=1802775698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5T9YcZF/t3Y0FYYzh0jVvuOVNLlYh2BMHtvyA3/vt24=;
  b=k0IyAriLVadsvXWAURuZuT6k/4emJ7g7QgJSZz8m7JYj7TiVH08hTVXI
   vA+gEPky/hImjloY4Aq16lVBCKF9WXh1xOiFYGxDihUrWePqOu7GZU+Im
   U0s9P+Prsrn584H3xSJrH1KJtMJrAvBOsY0xyN9fACuKJZRWVK1Wzc0I6
   34Tc048zCpCh+dRRIPGazI7ft4do/vsKnW6Q1QUqzBz4qQtl06z6wATq+
   j47d6tc4kgSrK3H8avTJAw5/Ytyj75vJxmhQMO0161H4Gc7gGTIsGggPt
   W8wQvechGvVXztVIpwkBA8UEPvvFe1rKWU89bQSxYAhWQBtZ9SFgBJ3gG
   Q==;
X-CSE-ConnectionGUID: tqHdNkeYTFGGJ4iMok6peg==
X-CSE-MsgGUID: 2TkToPr/So603ph4vkKi6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="89902103"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="89902103"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 03:01:37 -0800
X-CSE-ConnectionGUID: 2qBxJ5/GRUeQZcR8/9IE9g==
X-CSE-MsgGUID: iaMcJneFSYacJDjPZRjJZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="212882421"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Feb 2026 03:01:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrwM9-00000000zbl-490d;
	Mon, 16 Feb 2026 11:01:34 +0000
Date: Mon, 16 Feb 2026 19:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-compat_32bit_time 7/9]
 arch/powerpc/kernel/vdso/vgettimeofday.c:21:16: error: expected ';' before
 'int'
Message-ID: <202602161845.2PZSVkm7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-compat_32bit_time
head:   3754a409e685da0c172803eb93b5c01b0ab10818
commit: 89b30788a24d1afbf12f1f8bc657c07b514ce7d3 [7/9] powerpc
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20260216/202602161845.2PZSVkm7-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161845.2PZSVkm7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602161845.2PZSVkm7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/vdso/vgettimeofday.c:21:16: error: expected ';' before 'int'
      21 | __time32_symbol
         |                ^
         |                ;
      22 | int __c_kernel_clock_gettime(clockid_t clock, struct old_timespec32 *ts,
         | ~~~             
   arch/powerpc/kernel/vdso/vgettimeofday.c:34:16: error: expected ';' before 'int'
      34 | __time32_symbol
         |                ^
         |                ;
      35 | int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res,
         | ~~~             
   arch/powerpc/kernel/vdso/vgettimeofday.c:48:16: error: expected ';' before 'int'
      48 | __time32_symbol
         |                ^
         |                ;
      49 | int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz,
         | ~~~             
>> arch/powerpc/kernel/vdso/vgettimeofday.c:55:1: error: unknown type name '__time32_symbol'
      55 | __time32_symbol
         | ^~~~~~~~~~~~~~~
>> arch/powerpc/kernel/vdso/vgettimeofday.c:56:21: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__c_kernel_time'
      56 | __kernel_old_time_t __c_kernel_time(__kernel_old_time_t *time, const struct vdso_time_data *vd)
         |                     ^~~~~~~~~~~~~~~
   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:89: arch/powerpc/kernel/vdso/vgettimeofday-32.o] Error 1
   make[3]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[2]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +21 arch/powerpc/kernel/vdso/vgettimeofday.c

    14	
    15	int __c_kernel_clock_getres(clockid_t clock_id, struct __kernel_timespec *res,
    16				    const struct vdso_time_data *vd)
    17	{
    18		return __cvdso_clock_getres_data(vd, clock_id, res);
    19	}
    20	#else
  > 21	__time32_symbol
    22	int __c_kernel_clock_gettime(clockid_t clock, struct old_timespec32 *ts,
    23				     const struct vdso_time_data *vd)
    24	{
    25		return __cvdso_clock_gettime32_data(vd, clock, ts);
    26	}
    27	
    28	int __c_kernel_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts,
    29				       const struct vdso_time_data *vd)
    30	{
    31		return __cvdso_clock_gettime_data(vd, clock, ts);
    32	}
    33	
    34	__time32_symbol
    35	int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res,
    36				    const struct vdso_time_data *vd)
    37	{
    38		return __cvdso_clock_getres_time32_data(vd, clock_id, res);
    39	}
    40	
    41	int __c_kernel_clock_getres_time64(clockid_t clock_id, struct __kernel_timespec *res,
    42					   const struct vdso_time_data *vd)
    43	{
    44		return __cvdso_clock_getres_data(vd, clock_id, res);
    45	}
    46	#endif
    47	
    48	__time32_symbol
    49	int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz,
    50				    const struct vdso_time_data *vd)
    51	{
    52		return __cvdso_gettimeofday_data(vd, tv, tz);
    53	}
    54	
  > 55	__time32_symbol
  > 56	__kernel_old_time_t __c_kernel_time(__kernel_old_time_t *time, const struct vdso_time_data *vd)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
