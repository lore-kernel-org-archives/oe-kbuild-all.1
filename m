Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7023B8F5B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 04:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766203902; cv=none; b=qHN2hA4ZN4dPMyh1bdDjNfWfbMVydfwJR1tNQT0yQvrYp7mRf/+qcrTZRG1sHak/KSUffufLYSKvslLanpPNsne8Vvygt3TgLAk1VNeSQtVFu3HPIQ73lrWq+V0Q0BU5a0EYo7/JdaJjDyOPZIIpAt+HnbdMv7OfNf6Q9978hMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766203902; c=relaxed/simple;
	bh=vPaXe3ol8Ji1/mT6288vW3FqTTQLWwa4bu97sZ4woBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h7V8DbXd+RhUAC5Deepp1G7wi8/+LNv6aVZB4FGc4NUOvWn+jjzMek/AysS2HWbvgtiVTAE9dk0EcB57vdvNrqbxVsG2fVVQ0hwF9IjdY/pDWPogPnsri+8PKh9NvsYweA4zcIJFF7+apZjcvru3U7mB7T+PYiRPowwmpwgCxn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f2VnLYr+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f2VnLYr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766203901; x=1797739901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vPaXe3ol8Ji1/mT6288vW3FqTTQLWwa4bu97sZ4woBg=;
  b=f2VnLYr+pSU69jHnVnUPvqr+eEEsD99GOvdeDX7OqtCl/DznyfsGiyT/
   dkSEGq5K4upShRV6ANUfA4ucmgs1VFxBQwvbf97Etd9rFHKTlOfAqn7n1
   Sn0VhqBV9LxrFoK402uLOQ/6rmuxINEAsyV/6N6q35pB33S6lsn9BEi/j
   3OGX9FpINkC3J6bQhE3g9Oef3bVWBojBNRUdGZ5LzNF95PMtUM63q1YvB
   qUm3IzlZ2SpKHdQq4Vs22TcHPSTQKV3xoqkQv+obwPut/OxypAaimuB3V
   6iwy4DW6T4nSBY3fqSz87HXnVu7qv+arqTwG6CwQuNJxwrL8gjUTtwom1
   Q==;
X-CSE-ConnectionGUID: x5WkGPdjRQGDxwbe8hsq7A==
X-CSE-MsgGUID: FJ9Yoj4bS4ihSOCWHrnDtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="79613216"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="79613216"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 20:11:40 -0800
X-CSE-ConnectionGUID: nILw6jkSSGub4hYBUl5Y5Q==
X-CSE-MsgGUID: /AOwyuEGS92qq07KXUQjVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="199076614"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Dec 2025 20:11:39 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWoJc-000000004K5-25kJ;
	Sat, 20 Dec 2025 04:11:36 +0000
Date: Sat, 20 Dec 2025 12:10:40 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 2/5] stacktrace_kunit.c:undefined reference
 to `kunit_kmalloc_array'
Message-ID: <202512201238.Y2GQKk8I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   9fd0a6b1cdf040215994ff60cdf83b349d5480c4
commit: 7b244ac0f694315794b60badb50cb146f2f5fc8c [2/5] WIP: lib: add basic stacktrace tests
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512201238.Y2GQKk8I-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512201238.Y2GQKk8I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201238.Y2GQKk8I-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: lib/tests/stacktrace_kunit.o: in function `std_test_init':
>> stacktrace_kunit.c:(.text+0x1cb): undefined reference to `kunit_kmalloc_array'
   ld: lib/tests/stacktrace_kunit.o: in function `std_test_exit':
>> stacktrace_kunit.c:(.text+0x20f): undefined reference to `kunit_kfree'
   ld: lib/tests/stacktrace_kunit.o: in function `std_expect_empty':
>> stacktrace_kunit.c:(.text+0x2e1): undefined reference to `kunit_binary_assert_format'
>> ld: stacktrace_kunit.c:(.text+0x2ef): undefined reference to `__kunit_do_failed_assertion'
>> ld: stacktrace_kunit.c:(.text+0x324): undefined reference to `kunit_binary_assert_format'
   ld: stacktrace_kunit.c:(.text+0x332): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind':
>> stacktrace_kunit.c:(.text+0x3cf): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0x3dd): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `std_expect_trace':
>> stacktrace_kunit.c:(.text+0x449): undefined reference to `kunit_fail_assert_format'
   ld: stacktrace_kunit.c:(.text+0x459): undefined reference to `__kunit_do_failed_assertion'
>> ld: stacktrace_kunit.c:(.text+0x53f): undefined reference to `kunit_fail_assert_format'
   ld: stacktrace_kunit.c:(.text+0x54f): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_reliable_notail':
   stacktrace_kunit.c:(.text+0x67f): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0x68d): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_reliable_tail':
   stacktrace_kunit.c:(.text+0x71f): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0x72d): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_reliable':
   stacktrace_kunit.c:(.text+0x7bf): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0x7cd): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_notail':
   stacktrace_kunit.c:(.text+0x867): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0x875): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_tail':
   stacktrace_kunit.c:(.text+0x917): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0x925): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_unwind':
   stacktrace_kunit.c:(.text+0x9c7): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0x9d5): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind_notail':
   stacktrace_kunit.c:(.text+0xa6f): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0xa7d): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind_tail':
   stacktrace_kunit.c:(.text+0xb0f): undefined reference to `kunit_binary_ptr_assert_format'
   ld: stacktrace_kunit.c:(.text+0xb1d): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `std_test_exit.cold':
>> stacktrace_kunit.c:(.text.unlikely+0x70): undefined reference to `kunit_log_append'
>> ld: stacktrace_kunit.c:(.text.unlikely+0xbc): undefined reference to `kunit_log_append'
   ld: lib/tests/stacktrace_kunit.o: in function `std_expect_callers_present_reliable.cold':
   stacktrace_kunit.c:(.text.unlikely+0x159): undefined reference to `kunit_log_append'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
