Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF392F3600
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 05:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773986072; cv=none; b=ssYGWLWMua4TcQSse1QfuFnYQo1G7HPkIRETcOwpZQ066+fwZIHSywSYhMwSjJ1atCxWZHvw8PVJibMwqHapejSpg6sQn60KcrQsHD+DFVvkWzir+64ghmGbwB1Jmh/+aBW1tamyZImTUwq+6IAC7Nc/6xquIWm5f8//i+Xp4Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773986072; c=relaxed/simple;
	bh=addPloMv85t3ejU/bm4KUi0ItELzoaA/OJ/7XsKEXg8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DDozgwZrjlGbN797OWjcCTGtRwoetYJMAS+YsM5FD9k1D4HVtFgKNVnGHFphCeTlJnuKGX/mmKnV+dIQ8NjyrngyRbqLf8Du4dvCzyaxns3ve/j2wTdCGmnPlcQadb5QYDbJvln2WhFHtuAEUKK4PGLARoSP0J2OeCqHuBxo7Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKxiHcuq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKxiHcuq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773986070; x=1805522070;
  h=date:from:to:cc:subject:message-id;
  bh=addPloMv85t3ejU/bm4KUi0ItELzoaA/OJ/7XsKEXg8=;
  b=MKxiHcuqesugUNA8KoihdQFbQr7LTAcjMZaJsp9VpBja3v8jJldU/xJw
   W519zVUrDh4Hr1keZuIo4qOX/LfGDVaZxXzbl6dWp/lcUU21UK4xFYN8q
   1KVib5VnSWh9iDwDGFLDVhMdpSi+qB2LYHKlc/Lg+DJTWPl/ZABYpaLC2
   Vmdq1Oylg0ZhkCstV6CSXErd20QlTEhT5nfFk2Mt5poIlI6jQ3bQzjUce
   Y3Vz84LuOFFN9L7AJOs+aK0goBGh5nAsEzznzmKUw8TkMk6exdPARK1TJ
   VyW/giifoMpUDTaNdTiqQ6bwdGn7qi3DwbupDPS6XnZgKMtwRZ9vBFRBS
   Q==;
X-CSE-ConnectionGUID: yPE8zOlCQXWmItwHicaUHA==
X-CSE-MsgGUID: /T+lAt+eR0q7fn9nqEbWng==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74082549"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74082549"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 22:54:30 -0700
X-CSE-ConnectionGUID: 870bz+ENQberQO+gBgnf/w==
X-CSE-MsgGUID: BCZxN4iyQXOcRJuSdYQ7aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="222284377"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 19 Mar 2026 22:54:29 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3SoU-000000004yz-1An4;
	Fri, 20 Mar 2026 05:54:26 +0000
Date: Fri, 20 Mar 2026 06:54:22 +0100
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:upstreamtest 2/2]
 ./include/asm-generic/bitops/non-atomic.h:15:23: error: redefinition of
 'generic_test_bit'
Message-ID: <202603200621.4kiCDkDj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/tdx.git upstreamtest
head:   5c38ae7e5c475be0eb737e7e77f6982529e0ef4f
commit: 5c38ae7e5c475be0eb737e7e77f6982529e0ef4f [2/2] asm-generic/bitops: Move test_bit{_acquire}() to instrumented-atomic.h
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260320/202603200621.4kiCDkDj-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200621.4kiCDkDj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200621.4kiCDkDj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/powerpc/include/asm/bitops.h:255,
                    from ./include/linux/bitops.h:67,
                    from ./include/linux/log2.h:12,
                    from kernel/bounds.c:14:
>> ./include/asm-generic/bitops/non-atomic.h:15:23: error: redefinition of 'generic_test_bit'
      15 | #define arch_test_bit generic_test_bit
         |                       ^~~~~~~~~~~~~~~~
   ./include/asm-generic/bitops/non-instrumented-non-atomic.h:14:33: note: in expansion of macro 'arch_test_bit'
      14 | #define _test_bit               arch_test_bit
         |                                 ^~~~~~~~~~~~~
   ./include/asm-generic/bitops/instrumented-atomic.h:109:1: note: in expansion of macro '_test_bit'
     109 | _test_bit(unsigned long nr, const volatile unsigned long *addr)
         | ^~~~~~~~~
   In file included from ./include/linux/bitops.h:28:
   ./include/asm-generic/bitops/generic-non-atomic.h:121:1: note: previous definition of 'generic_test_bit' with type 'bool(long unsigned int,  const volatile long unsigned int *)' {aka '_Bool(long unsigned int,  const volatile long unsigned int *)'}
     121 | generic_test_bit(unsigned long nr, const volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~
>> ./include/asm-generic/bitops/non-atomic.h:16:31: error: redefinition of 'generic_test_bit_acquire'
      16 | #define arch_test_bit_acquire generic_test_bit_acquire
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/bitops/non-instrumented-non-atomic.h:15:33: note: in expansion of macro 'arch_test_bit_acquire'
      15 | #define _test_bit_acquire       arch_test_bit_acquire
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/bitops/instrumented-atomic.h:121:1: note: in expansion of macro '_test_bit_acquire'
     121 | _test_bit_acquire(unsigned long nr, const volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
   ./include/asm-generic/bitops/generic-non-atomic.h:137:1: note: previous definition of 'generic_test_bit_acquire' with type 'bool(long unsigned int,  const volatile long unsigned int *)' {aka '_Bool(long unsigned int,  const volatile long unsigned int *)'}
     137 | generic_test_bit_acquire(unsigned long nr, const volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/generic_test_bit +15 ./include/asm-generic/bitops/non-atomic.h

4117b02132d1cf Akinobu Mita      2006-03-26  14  
21bb8af513d35c Alexander Lobakin 2022-06-24 @15  #define arch_test_bit generic_test_bit
8238b4579866b7 Mikulas Patocka   2022-08-26 @16  #define arch_test_bit_acquire generic_test_bit_acquire
0e862838f29014 Alexander Lobakin 2022-06-24  17  

:::::: The code at line 15 was first introduced by commit
:::::: 21bb8af513d35c005c401706030f4eb469538d1d bitops: always define asm-generic non-atomic bitops

:::::: TO: Alexander Lobakin <alexandr.lobakin@intel.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
