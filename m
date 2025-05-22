Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F54A50
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 00:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747875162; cv=none; b=UDtVrSbRTETl54f4B7J+YWJSSL9jAUFAmBC/FKoyyGEgiVWEGeQIt5IUd5AZCOfOPePRNL6RjvT68/VhwvgJpSbaYr0x29hcPVLgTQGqxDkej/Q/PVpdHkYfGu9wsegK2ZXaZVIwfIdlER/wkC3a4b9BHbiUBxKkMYQOTrHrQsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747875162; c=relaxed/simple;
	bh=NK2Tu+2SOqNVrQgO9tvghdhydwRZaFqtMqKiDwmuOcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FopuB/Y/WEcYYsOsnB3Oer6I8VbyaPCAm5FTlmsAtdc0JjqWMeN/GmiDAvwJ4v5sfUPZyMzVnDWx7EUBrDrA5sezm1cs7CG578bnHZI/JR0bK76s3/zzDGT6Mvy6Ap8j8h+D6i9KpAPOw/DaJKCJdPFATzJgPemB0gRtimWX2IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mniSNj4r; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mniSNj4r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747875159; x=1779411159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NK2Tu+2SOqNVrQgO9tvghdhydwRZaFqtMqKiDwmuOcg=;
  b=mniSNj4rygckzIWlupxKNlQ62S63kKFqJdaggH0LNwd73C2Zh/W+bZBk
   PuD0w8AmdLICuOS8ifv75EBErkekyKVNuzYhJGTmjQtka8kCi5r2ex0QD
   R9radO3iqa3Cuk5IAKHanU3m9/UdlE95Hl07Cc2fG6c1m+KesvboCWWe+
   E4DpRiCnlhU2Yu+aqBSeD/bxdV5+iFQGqU90gKOEQblW4uv2lpl+ltdND
   OV+2ema+JEsUDra90XA/vLiG45Ej+mqzl0o42upM8TxgmENStG+vqte4k
   lGxZZdyfq5y7iSxAgNS2Sxp7FCQwXqTTxN27rMK5X8iDNSfRUFXRQs3Q6
   w==;
X-CSE-ConnectionGUID: ZZuKf/GSSkK/eT+2WR/90A==
X-CSE-MsgGUID: u3jXIxRWR72LCiLectQfEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="67435982"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="67435982"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:52:35 -0700
X-CSE-ConnectionGUID: 0suh4XjQTiaexoLaTEhPBQ==
X-CSE-MsgGUID: ilfEberyRWOU8ysCtL16aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="140176393"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 May 2025 17:52:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHuAi-000Ome-1q;
	Thu, 22 May 2025 00:52:32 +0000
Date: Thu, 22 May 2025 08:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 3/4] hppa-linux-ld:
 lib/tests/stacktrace_kunit.c:583:undefined reference to `__kunit_abort'
Message-ID: <202505220839.gmEjgOf9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   c734aedb3ed9454b32144052f3bd3af91a8a3942
commit: c90e7b578847508c53c8c62ab158ece809cd005d [3/4] WIP: lib: add more stacktracing tests
config: parisc-randconfig-002-20250522 (https://download.01.org/0day-ci/archive/20250522/202505220839.gmEjgOf9-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505220839.gmEjgOf9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220839.gmEjgOf9-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_expect_empty':
   lib/tests/stacktrace_kunit.c:239:(.text+0x2e4): undefined reference to `__kunit_do_failed_assertion'
   hppa-linux-ld: lib/tests/stacktrace_kunit.c:240:(.text+0x354): undefined reference to `__kunit_do_failed_assertion'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `__do_test_basic':
   lib/tests/stacktrace_kunit.c:310:(.text+0x430): undefined reference to `__kunit_do_failed_assertion'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_expect_trace':
   lib/tests/stacktrace_kunit.c:272:(.text+0x7e4): undefined reference to `__kunit_do_failed_assertion'
   hppa-linux-ld: lib/tests/stacktrace_kunit.c:277:(.text+0x8a4): undefined reference to `__kunit_do_failed_assertion'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_expect_callers_present_reliable':
   lib/tests/stacktrace_kunit.c:296:(.text+0x954): undefined reference to `kunit_log_append'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_ftrace_unwind_regs':
   lib/tests/stacktrace_kunit.c:490:(.text+0xd84): undefined reference to `kunit_try_catch_throw'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_test_exit':
   lib/tests/stacktrace_kunit.c:64:(.text+0xdd0): undefined reference to `kunit_kfree'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_dump':
   lib/tests/stacktrace_kunit.c:39:(.text+0xe68): undefined reference to `kunit_log_append'
   hppa-linux-ld: lib/tests/stacktrace_kunit.c:44:(.text+0xea8): undefined reference to `kunit_log_append'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `__do_test_fgraph_many':
   lib/tests/stacktrace_kunit.c:583:(.text+0xf5c): undefined reference to `__kunit_do_failed_assertion'
>> hppa-linux-ld: lib/tests/stacktrace_kunit.c:583:(.text+0xf64): undefined reference to `__kunit_abort'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `__do_test_ftrace':
   lib/tests/stacktrace_kunit.c:442:(.text+0x1104): undefined reference to `__kunit_do_failed_assertion'
   hppa-linux-ld: lib/tests/stacktrace_kunit.c:442:(.text+0x110c): undefined reference to `__kunit_abort'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `kunit_kmalloc':
   include/kunit/test.h:449:(.text+0x1220): undefined reference to `kunit_kmalloc_array'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `.LC1':
   stacktrace_kunit.c:(.rodata.cst4+0x0): undefined reference to `kunit_binary_assert_format'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `.LC8':
   stacktrace_kunit.c:(.rodata.cst4+0x4): undefined reference to `kunit_binary_ptr_assert_format'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `.LC51':
   stacktrace_kunit.c:(.rodata.cst4+0x50): undefined reference to `kunit_fail_assert_format'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `.LC70':
   stacktrace_kunit.c:(.rodata.cst4+0x54): undefined reference to `kunit_binary_assert_format'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `.LC75':
   stacktrace_kunit.c:(.rodata.cst4+0x58): undefined reference to `kunit_binary_assert_format'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
