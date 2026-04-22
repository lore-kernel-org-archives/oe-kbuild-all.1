Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2357D367F25
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Apr 2026 21:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776893611; cv=none; b=LOJnLBQZy3uF84+AM63e+ukqm3ck+VUP08U2s3KE9ulb/m80zvuzCwJTPxGL3L8Uf3StP6mOWQ9KSL6vOw5Rptmbxsfj2k7epvPEyu+JjuYWp8+OH9xxwnJN9dRMNDhJ2TL+3B+VgaIiybD8jH+OqmcoRyJNssdC+icHN9L7rek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776893611; c=relaxed/simple;
	bh=Su+4RzP8eGdBX37SNSjk7xjuCswF2J4NIIKMLTRlXQA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mpLeDPRkSeXjF9xrL/QGK4LBW6Q4d3YIEsUwaiCYmrntHCagNBLXwSJfN95K/JKhtsuFpTsc3VXTDFecglLdXrOfaKTna4bGypUyCNsQzbA+pL7hhbK+11QZLHdzSIjzA52wjY/PUqGGfcPSE7ofjl7x1tUuRI11iZe/nlNPGFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4XhuQO8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4XhuQO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776893609; x=1808429609;
  h=date:from:to:cc:subject:message-id;
  bh=Su+4RzP8eGdBX37SNSjk7xjuCswF2J4NIIKMLTRlXQA=;
  b=Q4XhuQO8u+A5g5ukqDaB/EEIgqszkWkhuwQnEmwqVTQ1z7MKhtYxky0g
   zno32ATrEXLYOuMydZOIfqOfXBRtYw3jv84iZ37EWFYVn+MSdYEw/JnB9
   eLL8O543bps8omCxZ7WvS7uTr4w7PvWISR5ogPyWHQbWWZTpChAYTUnvi
   EoNYB2w1t95r+lqKzdpa1Q4sgDaDUU65nsY593gqARNCNGflRK3CEKF8o
   2tXiMziRYvW1/e48xuVLgpMgn42O1aKvQDSzcjuycjHXRmwbKVLakmU8Q
   qLcZNBO5ND/PBNgKabSiucGFVzjJ/odRb+n7ruLJhX5tY7PpXg3z3fKDz
   g==;
X-CSE-ConnectionGUID: krwv0GV8SdCO7KjYnPqjng==
X-CSE-MsgGUID: CM+gxUM/QyaWH4c1JE3LkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77022722"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="77022722"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 14:33:28 -0700
X-CSE-ConnectionGUID: PdKz5zjIQkO43qYFDPAUzg==
X-CSE-MsgGUID: TbP06pM6SqqKCeHERTuIqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="236832260"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Apr 2026 14:33:27 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFfCG-0000000013W-1Kee;
	Wed, 22 Apr 2026 21:33:24 +0000
Date: Thu, 23 Apr 2026 05:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 3/4] csky-linux-ld:
 stacktrace_kunit.c:undefined reference to `__kunit_abort'
Message-ID: <202604230535.L3FHusZl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   224cbf0cef8a49306bab3f8723e83a207d43ad11
commit: fe331f10804b0205503506bac2cd91599ff6163a [3/4] WIP: lib: add more stacktracing tests
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260423/202604230535.L3FHusZl-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604230535.L3FHusZl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604230535.L3FHusZl-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_expect_empty':
   stacktrace_kunit.c:(.text+0x4de): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x52e): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x57c): undefined reference to `kunit_binary_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x580): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_expect_trace':
   stacktrace_kunit.c:(.text+0x6da): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x746): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x7a4): undefined reference to `kunit_fail_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x7ac): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_expect_callers_present_reliable':
   stacktrace_kunit.c:(.text+0x8b2): undefined reference to `kunit_log_append'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x8e0): undefined reference to `kunit_log_append'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `__do_kprobe_unwind':
   stacktrace_kunit.c:(.text+0x94e): undefined reference to `kunit_log_append'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x97e): undefined reference to `kunit_log_append'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x9c8): undefined reference to `kunit_log_append'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind_with_kprobe':
   stacktrace_kunit.c:(.text+0xa4a): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xa8c): undefined reference to `kunit_fail_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xa94): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind_with_fgraph_tail':
   stacktrace_kunit.c:(.text+0xd28): undefined reference to `__kunit_do_failed_assertion'
>> csky-linux-ld: stacktrace_kunit.c:(.text+0xd2e): undefined reference to `__kunit_abort'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xd9c): undefined reference to `kunit_binary_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xda0): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xda4): undefined reference to `__kunit_abort'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_test_exit':
   stacktrace_kunit.c:(.text+0xe98): undefined reference to `kunit_kfree'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xf0c): undefined reference to `kunit_log_append'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xf5e): undefined reference to `kunit_log_append'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_test_init':
   stacktrace_kunit.c:(.text+0xfd4): undefined reference to `kunit_kmalloc_array'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xff0): undefined reference to `kunit_kfree'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1008): undefined reference to `kunit_log_append'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1014): undefined reference to `kunit_kmalloc_array'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `__do_test_fgraph_async':
   stacktrace_kunit.c:(.text+0x118e): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x11ae): undefined reference to `kunit_log_append'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x11c2): undefined reference to `kunit_log_append'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_fgraph_async_unwind_reliable':
   stacktrace_kunit.c:(.text+0x1270): undefined reference to `kunit_fail_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1278): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1288): undefined reference to `kunit_log_append'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `__do_test_one_async_kp.constprop.0':
   stacktrace_kunit.c:(.text+0x133a): undefined reference to `kunit_log_append'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x134e): undefined reference to `kunit_log_append'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_async_unwind_reliable':
   stacktrace_kunit.c:(.text+0x1400): undefined reference to `kunit_log_append'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_kprobe_unwind_regs':
   stacktrace_kunit.c:(.text+0x16ca): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1710): undefined reference to `kunit_fail_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1718): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_kprobe_unwind_reliable':
   stacktrace_kunit.c:(.text+0x178a): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_kprobe_unwind':
   stacktrace_kunit.c:(.text+0x180a): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x185c): undefined reference to `kunit_fail_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1864): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_reliable_with_kprobe':
   stacktrace_kunit.c:(.text+0x18ca): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_with_kprobe':
   stacktrace_kunit.c:(.text+0x194a): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_ftrace_unwind_regs':
   stacktrace_kunit.c:(.text+0x19dc): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x19e2): undefined reference to `__kunit_abort'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1a2c): undefined reference to `kunit_fail_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1a34): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1a5c): undefined reference to `kunit_binary_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1a60): undefined reference to `__kunit_abort'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_ftrace_unwind_reliable':
   stacktrace_kunit.c:(.text+0x1adc): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1ae2): undefined reference to `__kunit_abort'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_ftrace_unwind':
   stacktrace_kunit.c:(.text+0x1b9c): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1ba2): undefined reference to `__kunit_abort'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1bec): undefined reference to `kunit_binary_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1bf0): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1bf4): undefined reference to `__kunit_abort'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_reliable_with_ftrace':
   stacktrace_kunit.c:(.text+0x1c9c): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1ca2): undefined reference to `__kunit_abort'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_with_ftrace':
   stacktrace_kunit.c:(.text+0x1d5c): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1d62): undefined reference to `__kunit_abort'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1dac): undefined reference to `kunit_binary_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1db0): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1db4): undefined reference to `__kunit_abort'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind_with_ftrace':
   stacktrace_kunit.c:(.text+0x1e5c): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1e62): undefined reference to `__kunit_abort'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1e9e): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1ede): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_reliable_notail':
   stacktrace_kunit.c:(.text+0x1f8a): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1fcc): undefined reference to `kunit_binary_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1fd0): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1fd4): undefined reference to `__kunit_abort'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x1ff0): undefined reference to `kunit_binary_ptr_assert_format'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_reliable_tail':
   stacktrace_kunit.c:(.text+0x204a): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_reliable':
   stacktrace_kunit.c:(.text+0x20ca): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_notail':
   stacktrace_kunit.c:(.text+0x214a): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x218c): undefined reference to `kunit_binary_ptr_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x2190): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_tail':
   stacktrace_kunit.c:(.text+0x220a): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_unwind':
   stacktrace_kunit.c:(.text+0x228a): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind_notail':
   stacktrace_kunit.c:(.text+0x230a): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x234c): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o:stacktrace_kunit.c:(.text+0x238c): more undefined references to `__kunit_do_failed_assertion' follow
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind_notail':
   stacktrace_kunit.c:(.text+0x23c8): undefined reference to `kunit_binary_ptr_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x23cc): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x23e8): undefined reference to `kunit_binary_assert_format'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind_tail':
   stacktrace_kunit.c:(.text+0x244a): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x248c): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x24cc): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind':

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
