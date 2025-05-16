Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B16275854
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 20:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747426946; cv=none; b=p6kkngLvUSN0CjAZmtHqB52cyr3eH5Ke9uKrFz/8johU3K1RF/f0fP7v/cWBNVBok6YiXYC9cqRE4prP+ticDLmOIRSdgbA+CNEAYe4jNWD1/IpC9fCm7jalek7ZkhpUki+LZ7a8jgWBLp+h+YRkixVcNySIv00tOHdzHLYRSsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747426946; c=relaxed/simple;
	bh=jt2AzYrsCHkwTjGbOzrd79K1YdvAYQRIZk/LLOKqX14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oqfz1TEF0VWst5QTKfp4+5qINt8t0ZmW11D5HtMjAM/r8l0MphKVpBl+DMnFrqKHFk0c4eVb5k4VDkZLs63XIS+QhrclGyq8BeEPPNqxRF4ZDyEBpz9ogrAjjTYl9vKOJs5Yd8b/fyq3WUBvLQ+vXvaR5W3wQ9tzF7Xv+w86Rpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRjGYZCt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRjGYZCt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747426945; x=1778962945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jt2AzYrsCHkwTjGbOzrd79K1YdvAYQRIZk/LLOKqX14=;
  b=gRjGYZCtl+awAzLnsx9Z3od5NpcsTrYqka4EbbTJRQ/L1d2c79jsDMb0
   gteWUK9kQNz/GfqwL/ZLTGeFqzhT8KH+VoNoFRlEtnJWy0DbN6Ud4WWX2
   Wk/8UCGmvHiydTz/ICiX/+W7oRlygkiR0zTxm6XNhnftIqYhtJDwbo4XT
   UXbSLOFCJEPYlGrwzuHJqUZ7d/6xJwLg9y1RBBKJcWM5CEICRCyadcMEj
   3ZrB/LmO26ecCCydkDSApIaRVq0z4ijy9iEQLzTzcgP67pszhMzpfpeWx
   ZZal69awDrW/AV9vHoMK6Xk0PSDgAebr2lu+fcrP5k/Y1rzRKBj9hJ9I6
   Q==;
X-CSE-ConnectionGUID: YRw94xQITzK4nCV7DlFB4A==
X-CSE-MsgGUID: lf5lEJ/6RNqx/17IaBsbHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66961725"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="66961725"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 13:22:24 -0700
X-CSE-ConnectionGUID: hTt0QD1cSo+kOS1leOgRdw==
X-CSE-MsgGUID: hLol/kFkSTaW6r+pcUZcZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="143559715"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 May 2025 13:22:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG1ZU-000JgB-1O;
	Fri, 16 May 2025 20:22:20 +0000
Date: Sat, 17 May 2025 04:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 11711/11779]
 include/asm-generic/bitops/generic-non-atomic.h:128: undefined reference to
 `__udivdi3'
Message-ID: <202505170435.9PHcbsp6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8566fc3b96539e3235909d6bdda198e1282beaed
commit: 233e9b69967c707b3b7573752bf6cd6707972684 [11711/11779] Merge branch 'timers/drivers/next' of https://git.linaro.org/people/daniel.lezcano/linux.git
config: xtensa-randconfig-001-20250516 (https://download.01.org/0day-ci/archive/20250517/202505170435.9PHcbsp6-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170435.9PHcbsp6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170435.9PHcbsp6-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/clocksource/timer-tegra186.o: in function `tegra186_timer_remove':
   drivers/clocksource/timer-tegra186.c:479: undefined reference to `__udivdi3'
   xtensa-linux-ld: drivers/clocksource/timer-tegra186.o: in function `generic_test_bit':
>> include/asm-generic/bitops/generic-non-atomic.h:128: undefined reference to `__udivdi3'


vim +128 include/asm-generic/bitops/generic-non-atomic.h

21bb8af513d35c Alexander Lobakin 2022-06-24  114  
21bb8af513d35c Alexander Lobakin 2022-06-24  115  /**
21bb8af513d35c Alexander Lobakin 2022-06-24  116   * generic_test_bit - Determine whether a bit is set
21bb8af513d35c Alexander Lobakin 2022-06-24  117   * @nr: bit number to test
21bb8af513d35c Alexander Lobakin 2022-06-24  118   * @addr: Address to start counting from
21bb8af513d35c Alexander Lobakin 2022-06-24  119   */
0e862838f29014 Alexander Lobakin 2022-06-24  120  static __always_inline bool
0e862838f29014 Alexander Lobakin 2022-06-24  121  generic_test_bit(unsigned long nr, const volatile unsigned long *addr)
21bb8af513d35c Alexander Lobakin 2022-06-24  122  {
21bb8af513d35c Alexander Lobakin 2022-06-24  123  	/*
21bb8af513d35c Alexander Lobakin 2022-06-24  124  	 * Unlike the bitops with the '__' prefix above, this one *is* atomic,
21bb8af513d35c Alexander Lobakin 2022-06-24  125  	 * so `volatile` must always stay here with no cast-aways. See
21bb8af513d35c Alexander Lobakin 2022-06-24  126  	 * `Documentation/atomic_bitops.txt` for the details.
21bb8af513d35c Alexander Lobakin 2022-06-24  127  	 */
21bb8af513d35c Alexander Lobakin 2022-06-24 @128  	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
21bb8af513d35c Alexander Lobakin 2022-06-24  129  }
21bb8af513d35c Alexander Lobakin 2022-06-24  130  

:::::: The code at line 128 was first introduced by commit
:::::: 21bb8af513d35c005c401706030f4eb469538d1d bitops: always define asm-generic non-atomic bitops

:::::: TO: Alexander Lobakin <alexandr.lobakin@intel.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
