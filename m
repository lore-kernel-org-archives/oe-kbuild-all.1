Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7E7155C82
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 03:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774409630; cv=none; b=ILR96HHn7Dg9u+rtW/MAXVmxJrPoQ7tsmAB59UomBa2IPidYy671lbN2bSQHvUbVk1dLPmnPwlyYiY1tAtoqdlbIwfbTYn0ldzWRLwIH2LvY9DTqY8fY0KQ+TrgsFh/qDu7d7hytK94CsNu06AnYHZA0WMiy6+KdJpkdajm5+GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774409630; c=relaxed/simple;
	bh=63W/wDGa1V7jmwjxqfQ5mSzeGSwx8zZiq3xWsbIkkkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GXXstoPxtaAlwua64vFuRrdUcSazK3HsrOOJUSdNKj1ut1VElD0vzxfEVwq6bBiRF+jxMlftuSpm+9eeLUVMIs60/gp7/FU8acx3L6aE4TfUS2ck8GBc7vFChr4meWB7RKo0m+ZMSUiICE4c2hAS7BMlBEI9nNpilaf/itvGie8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SALd5mHW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SALd5mHW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774409629; x=1805945629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=63W/wDGa1V7jmwjxqfQ5mSzeGSwx8zZiq3xWsbIkkkA=;
  b=SALd5mHWNnLhiW1RZ4M+ck39Kdbp+T7fXJN9IMbWKJbV7hQdgQ+kjVZD
   zebx0a2Tuy2ObWQJbvjBBzOdknAsw59MCx4Zuq8wLCTCRSmWBlHxrA7mC
   7I/WGolw5jhSfLd7nb1poRtskJdi4LvY1A7rlAP5IQ/sa2aD5kzbGYDWC
   VTGnWqqLtNivpDsBREcMexpyOaHKF+UEkmRFOnVGYdq5IWbXE/d0hPDVg
   BigrUnJBHmzds0/AdWqHrkQKeyAwfy4QYv8p67IAfB5axZRyEBJGV0qav
   AFQusaqV/HC3SNAjUQl4V0rwtfomWvWHh/gS/W14sIzuOO3yOwi3DUHMg
   g==;
X-CSE-ConnectionGUID: qFqvb4kVQ2mrLZl1VtkOHg==
X-CSE-MsgGUID: qI1eL6bkT8ahKXmHDLAx3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74620701"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="74620701"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 20:33:48 -0700
X-CSE-ConnectionGUID: x5z2pKqsTx2HNTcXauAxWQ==
X-CSE-MsgGUID: LLraiH9cScm5CGvKmwqRLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="247585302"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Mar 2026 20:33:47 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5F04-000000005rF-45Ct;
	Wed, 25 Mar 2026 03:33:44 +0000
Date: Wed, 25 Mar 2026 11:33:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-ifdeffery 4/6]
 arch/s390/kernel/vdso/../../../../lib/vdso/gettimeofday.c:446:21: error:
 conflicting types for 'clock_getres_fallback'; have 'int(clockid_t,  struct
 __kernel_timespec *)' {aka 'int(int,  struct __kernel_timespec *)'}
Message-ID: <202603251121.fGmIhhEU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-ifdeffery
head:   45c96fcd1b5efdc20a7638f8aafec16f4572a94b
commit: 541db7c42182bf886177c34f5bef756f958e99e2 [4/6] getres fallbacks
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260325/202603251121.fGmIhhEU-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251121.fGmIhhEU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251121.fGmIhhEU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/vdso/vdso_generic.c:2:
>> arch/s390/kernel/vdso/../../../../lib/vdso/gettimeofday.c:446:21: error: conflicting types for 'clock_getres_fallback'; have 'int(clockid_t,  struct __kernel_timespec *)' {aka 'int(int,  struct __kernel_timespec *)'}
     446 | __always_inline int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts);
         |                     ^~~~~~~~~~~~~~~~~~~~~
   In file included from arch/s390/kernel/vdso/../../../../lib/vdso/gettimeofday.c:24:
   arch/s390/include/asm/vdso/gettimeofday.h:34:6: note: previous definition of 'clock_getres_fallback' with type 'long int(clockid_t,  struct __kernel_timespec *)' {aka 'long int(int,  struct __kernel_timespec *)'}
      34 | long clock_getres_fallback(clockid_t clkid, struct __kernel_timespec *ts)
         |      ^~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [arch/s390/kernel/vdso/Makefile:62: arch/s390/kernel/vdso/vdso_generic.o] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/s390/Makefile:154: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +446 arch/s390/kernel/vdso/../../../../lib/vdso/gettimeofday.c

   445	
 > 446	__always_inline int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts);
   447	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
