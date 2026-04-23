Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148252C1788
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Apr 2026 02:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776911385; cv=none; b=eolyHbT71pU9ZCaufkZXUUDIv146pCPq4AJFlpwXr3+lOHdAIefKfjIRnGHtaXfbeAhQ5oWtn0CoNPoD3qRE/kKDCSKcx35UfzvSs2EH+fUgcNaoZDbXVvUyvjqgqQc1ExlB0pjlfaFZ/hNj8VCH6GpT/aRsU8GucY5wHHHGAGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776911385; c=relaxed/simple;
	bh=SEZfztFDf1CR0I2DxM2pmnojQbncv1o98DgelerikOc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T7ZRmnXGswCH6h0dEfiYzW3qIDMUCFboAy9w7tgwi4fcq7a0irCgCMpvL/JgnogOiYbRs3MPA/6krjJUyr5elIdo9n1HC5GtLm7G3kGHYRoiAuVTkjwx61/y8xMQ26grpi7hbjyJnjaNn8wZH0aa4vY+Pzh7jRUUgeUyeHhE0UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEm8lGmC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEm8lGmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776911383; x=1808447383;
  h=date:from:to:cc:subject:message-id;
  bh=SEZfztFDf1CR0I2DxM2pmnojQbncv1o98DgelerikOc=;
  b=jEm8lGmCQEJzNCZ7MKWkZrzU0Jb1cenytOZAbmSmkxIuynYhaao/b3Wf
   HuHchTIXNPqkCn+/b8pKn+Uqnm1En9TPOzdpXamnkbCrlj9/NFAp0563X
   aOSbt0BZLLWI7pv/cdFh4Pbw4dM7hqFmnn9866xX5e7fZhsYCeGJG/k25
   ugU7qZkmK+XpklEuXWtPCYCN8hsvtDQWqjjspPCDuTSzMVDLb4SGZx4BF
   0U0lX9drfmzHRHHSyCylG5VoGXXYaoSVUKlwg66Dh33xv/JpHF8e5I/FU
   7VCExZM1Z6pG0mXVudF1AfC/AZ32Fo2zP8VKwxkWf5RTqeGje0t7ZZ/AD
   A==;
X-CSE-ConnectionGUID: johkgjtnQd2B16AyNIkkhQ==
X-CSE-MsgGUID: 0Zc1aZIERr2vxeIvB/CuQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88482611"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="88482611"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 19:29:42 -0700
X-CSE-ConnectionGUID: TTDcgoeZS12e6F9r9qwwyA==
X-CSE-MsgGUID: M54sVHQGRtmeh0ygocKWgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="232834517"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Apr 2026 19:29:40 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFjow-000000001NZ-1HcC;
	Thu, 23 Apr 2026 02:29:38 +0000
Date: Thu, 23 Apr 2026 10:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 3/4] ld: stacktrace_kunit.c:undefined
 reference to `__kunit_abort'
Message-ID: <202604231034.7T357f6w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   224cbf0cef8a49306bab3f8723e83a207d43ad11
commit: fe331f10804b0205503506bac2cd91599ff6163a [3/4] WIP: lib: add more stacktracing tests
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260423/202604231034.7T357f6w-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604231034.7T357f6w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604231034.7T357f6w-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: lib/tests/stacktrace_kunit.o: in function `std_test_init':
   stacktrace_kunit.c:(.text+0x85b): undefined reference to `kunit_kmalloc_array'
   ld: lib/tests/stacktrace_kunit.o: in function `std_expect_empty':
   stacktrace_kunit.c:(.text+0x931): undefined reference to `kunit_binary_assert_format'
   ld: stacktrace_kunit.c:(.text+0x93f): undefined reference to `__kunit_do_failed_assertion'
   ld: stacktrace_kunit.c:(.text+0x974): undefined reference to `kunit_binary_assert_format'
   ld: stacktrace_kunit.c:(.text+0x982): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind_with_kprobe':
   stacktrace_kunit.c:(.text+0xa42): undefined reference to `kunit_fail_assert_format'
   ld: stacktrace_kunit.c:(.text+0xa50): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind_with_ftrace':
   stacktrace_kunit.c:(.text+0xb14): undefined reference to `kunit_binary_assert_format'
   ld: stacktrace_kunit.c:(.text+0xb22): undefined reference to `__kunit_do_failed_assertion'
>> ld: stacktrace_kunit.c:(.text+0xb29): undefined reference to `__kunit_abort'
   ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind':
   stacktrace_kunit.c:(.text+0xbbf): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0xbcd): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind_with_fgraph_tail':
   stacktrace_kunit.c:(.text+0xcac): undefined reference to `kunit_binary_assert_format'
   ld: stacktrace_kunit.c:(.text+0xcba): undefined reference to `__kunit_do_failed_assertion'
   ld: stacktrace_kunit.c:(.text+0xcc1): undefined reference to `__kunit_abort'
   ld: lib/tests/stacktrace_kunit.o: in function `std_expect_trace':
   stacktrace_kunit.c:(.text+0xe22): undefined reference to `kunit_fail_assert_format'
   ld: stacktrace_kunit.c:(.text+0xe30): undefined reference to `__kunit_do_failed_assertion'
   ld: stacktrace_kunit.c:(.text+0xf06): undefined reference to `kunit_fail_assert_format'
   ld: stacktrace_kunit.c:(.text+0xf14): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `std_test_exit':
   stacktrace_kunit.c:(.text+0x109f): undefined reference to `kunit_kfree'
   ld: lib/tests/stacktrace_kunit.o: in function `__do_test_fgraph_async':
   stacktrace_kunit.c:(.text+0x121b): undefined reference to `kunit_fail_assert_format'
   ld: stacktrace_kunit.c:(.text+0x1229): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_kprobe_unwind_regs':
   stacktrace_kunit.c:(.text+0x1802): undefined reference to `kunit_fail_assert_format'
   ld: stacktrace_kunit.c:(.text+0x1810): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_kprobe_unwind_reliable':
   stacktrace_kunit.c:(.text+0x18c2): undefined reference to `kunit_fail_assert_format'
   ld: stacktrace_kunit.c:(.text+0x18d0): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_kprobe_unwind':
   stacktrace_kunit.c:(.text+0x1982): undefined reference to `kunit_fail_assert_format'
   ld: stacktrace_kunit.c:(.text+0x1990): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_reliable_with_kprobe':
   stacktrace_kunit.c:(.text+0x1a42): undefined reference to `kunit_fail_assert_format'
   ld: stacktrace_kunit.c:(.text+0x1a50): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_with_kprobe':
   stacktrace_kunit.c:(.text+0x1b02): undefined reference to `kunit_fail_assert_format'
   ld: stacktrace_kunit.c:(.text+0x1b10): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_ftrace_unwind_regs':
   stacktrace_kunit.c:(.text+0x1bdc): undefined reference to `kunit_binary_assert_format'
   ld: stacktrace_kunit.c:(.text+0x1bea): undefined reference to `__kunit_do_failed_assertion'
   ld: stacktrace_kunit.c:(.text+0x1bf1): undefined reference to `__kunit_abort'
   ld: lib/tests/stacktrace_kunit.o: in function `test_ftrace_unwind_reliable':
   stacktrace_kunit.c:(.text+0x1c94): undefined reference to `kunit_binary_assert_format'
   ld: stacktrace_kunit.c:(.text+0x1ca2): undefined reference to `__kunit_do_failed_assertion'
   ld: stacktrace_kunit.c:(.text+0x1ca9): undefined reference to `__kunit_abort'
   ld: lib/tests/stacktrace_kunit.o: in function `test_ftrace_unwind':
   stacktrace_kunit.c:(.text+0x1d5c): undefined reference to `kunit_binary_assert_format'
   ld: stacktrace_kunit.c:(.text+0x1d6a): undefined reference to `__kunit_do_failed_assertion'
   ld: stacktrace_kunit.c:(.text+0x1d71): undefined reference to `__kunit_abort'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_reliable_with_ftrace':
   stacktrace_kunit.c:(.text+0x1e14): undefined reference to `kunit_binary_assert_format'
   ld: stacktrace_kunit.c:(.text+0x1e22): undefined reference to `__kunit_do_failed_assertion'
   ld: stacktrace_kunit.c:(.text+0x1e29): undefined reference to `__kunit_abort'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_with_ftrace':
   stacktrace_kunit.c:(.text+0x1edc): undefined reference to `kunit_binary_assert_format'
   ld: stacktrace_kunit.c:(.text+0x1eea): undefined reference to `__kunit_do_failed_assertion'
   ld: stacktrace_kunit.c:(.text+0x1ef1): undefined reference to `__kunit_abort'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_reliable_notail':
   stacktrace_kunit.c:(.text+0x1f7f): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0x1f8d): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_reliable_tail':
   stacktrace_kunit.c:(.text+0x203f): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0x204d): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_reliable':
   stacktrace_kunit.c:(.text+0x20ff): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0x210d): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_notail':
   stacktrace_kunit.c:(.text+0x21c7): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0x21d5): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_tail':
   stacktrace_kunit.c:(.text+0x2287): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0x2295): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind':
   stacktrace_kunit.c:(.text+0x2347): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0x2355): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind_notail':
   stacktrace_kunit.c:(.text+0x23ff): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0x240d): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind_tail':
   stacktrace_kunit.c:(.text+0x24bf): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0x24cd): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_fgraph_exit_unwind_reliable':
   stacktrace_kunit.c:(.text+0x25a4): undefined reference to `kunit_binary_assert_format'
   ld: stacktrace_kunit.c:(.text+0x25b2): undefined reference to `__kunit_do_failed_assertion'
   ld: stacktrace_kunit.c:(.text+0x25b9): undefined reference to `__kunit_abort'
   ld: lib/tests/stacktrace_kunit.o: in function `test_fgraph_exit_unwind':
   stacktrace_kunit.c:(.text+0x26ac): undefined reference to `kunit_binary_assert_format'
   ld: stacktrace_kunit.c:(.text+0x26ba): undefined reference to `__kunit_do_failed_assertion'
   ld: stacktrace_kunit.c:(.text+0x26c1): undefined reference to `__kunit_abort'
   ld: lib/tests/stacktrace_kunit.o: in function `test_fgraph_entry_unwind_reliable':
   stacktrace_kunit.c:(.text+0x27a4): undefined reference to `kunit_binary_assert_format'
   ld: stacktrace_kunit.c:(.text+0x27b2): undefined reference to `__kunit_do_failed_assertion'
   ld: stacktrace_kunit.c:(.text+0x27b9): undefined reference to `__kunit_abort'
   ld: lib/tests/stacktrace_kunit.o: in function `test_fgraph_entry_unwind':
   stacktrace_kunit.c:(.text+0x28ac): undefined reference to `kunit_binary_assert_format'
   ld: stacktrace_kunit.c:(.text+0x28ba): undefined reference to `__kunit_do_failed_assertion'
   ld: stacktrace_kunit.c:(.text+0x28c1): undefined reference to `__kunit_abort'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_reliable_with_fgraph':
   stacktrace_kunit.c:(.text+0x29a4): undefined reference to `kunit_binary_assert_format'
   ld: stacktrace_kunit.c:(.text+0x29b2): undefined reference to `__kunit_do_failed_assertion'
   ld: stacktrace_kunit.c:(.text+0x29b9): undefined reference to `__kunit_abort'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_with_fgraph':
   stacktrace_kunit.c:(.text+0x2aac): undefined reference to `kunit_binary_assert_format'
   ld: stacktrace_kunit.c:(.text+0x2aba): undefined reference to `__kunit_do_failed_assertion'
   ld: stacktrace_kunit.c:(.text+0x2ac1): undefined reference to `__kunit_abort'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
