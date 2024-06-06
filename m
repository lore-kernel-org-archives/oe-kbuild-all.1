Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FCD4AEC6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 20:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717704008; cv=none; b=qe7Pjn8u7cqU5ZJ3TL71qYPlww9TyK4cKmY+MDhhcK8Mnv4jZLeR3DrA2CCzIdKtTsdEPfpOFxPOg4uNCS3SBeuEPJsGR2lZoK9M/gg7rQYav9e2sv46lF9hPtNXmKZ1swJyGkXwYyTpOj+GRQRhBxDVrBbwTGYuSUGePBINVkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717704008; c=relaxed/simple;
	bh=Pog3UK/GBctC6dItiSiiSPp9Eo9tu4aaJmoluvZSs1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bLA6SdscM/DvVBXXfau/kWQAMMQ1y1r+va6Tt42Z7kFqThmo/Qy9ZfPy+qPTUrqqR4fncvqyMDB2L8znKLAxc5fdupu25+sAN4m/sTgObzyg/3oKiNTKbgX3BhZsWHlAr/HXlQ5bIMA/nEV2KqCqyX33/Q0PKFiRFMDBLZxxWsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6F6k9BJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6F6k9BJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717704007; x=1749240007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pog3UK/GBctC6dItiSiiSPp9Eo9tu4aaJmoluvZSs1E=;
  b=O6F6k9BJqWlGYqagbLZGr7M69BYAMBcQnxj+Fuby5/XgiBFa5QHX7L+W
   ZKlFOYvyOSCDCDleN0z9PjfHVjE9rT/PEk+4CSecc75Ey5fhSh2CguJru
   0N+gbrp4qZN4BF+bfWMePpawsQ0v3HSo5kphPrzHsdOA78qcXMqAQivfV
   ojxprWZWuf7DjboS/ASq3lZmqJ+SdzOUMZjW56eKWS2pznpyi2V5rWx2N
   2a4gLwwSOC7q0ongfXST8tfnB79RMfJCoaE/IWwZVc7LkfoKMhnIWnPpR
   pAqVyT6UMFl3mRtYa9yU/U0cpDFM/V74RUMprHxmluNlm/wtJ1uxXOW2m
   Q==;
X-CSE-ConnectionGUID: e9uMw22YQ9moig8PNGMp3A==
X-CSE-MsgGUID: XyPmh45kSDqjhasBPs7mNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25054166"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="25054166"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 13:00:06 -0700
X-CSE-ConnectionGUID: M78MGbqgRhODXhTEletTHQ==
X-CSE-MsgGUID: xkRcljGSRRCWW6teEeCVCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38153356"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 06 Jun 2024 13:00:05 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFJHH-0003ek-0a;
	Thu, 06 Jun 2024 20:00:03 +0000
Date: Fri, 7 Jun 2024 03:59:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 29/30] stacktrace_kunit.c:undefined reference
 to `kunit_fail_assert_format'
Message-ID: <202406070331.Q58fghXR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   b355c7c11a4a1cec3478bc7a2f129638d9b5116d
commit: bd60ed306ab25ea1c027a362c756729923d62548 [29/30] WIP: lib: add basic stacktrace tests
config: sparc64-randconfig-001-20240606 (https://download.01.org/0day-ci/archive/20240607/202406070331.Q58fghXR-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070331.Q58fghXR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070331.Q58fghXR-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: lib/stacktrace_kunit.o: in function `std_expect_trace':
>> stacktrace_kunit.c:(.text+0x1b8): undefined reference to `kunit_fail_assert_format'
>> sparc64-linux-ld: stacktrace_kunit.c:(.text+0x1c8): undefined reference to `kunit_fail_assert_format'
>> sparc64-linux-ld: stacktrace_kunit.c:(.text+0x1dc): undefined reference to `__kunit_do_failed_assertion'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x308): undefined reference to `kunit_fail_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x320): undefined reference to `kunit_fail_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x330): undefined reference to `__kunit_do_failed_assertion'
   sparc64-linux-ld: lib/stacktrace_kunit.o: in function `std_expect_callers_present_reliable':
>> stacktrace_kunit.c:(.text+0x404): undefined reference to `kunit_log_append'
   sparc64-linux-ld: lib/stacktrace_kunit.o: in function `std_test_exit':
>> stacktrace_kunit.c:(.text+0x4b8): undefined reference to `kunit_kfree'
>> sparc64-linux-ld: stacktrace_kunit.c:(.text+0x51c): undefined reference to `kunit_log_append'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x564): undefined reference to `kunit_log_append'
   sparc64-linux-ld: lib/stacktrace_kunit.o: in function `std_test_init':
>> stacktrace_kunit.c:(.text+0x5b0): undefined reference to `kunit_kmalloc_array'
   sparc64-linux-ld: lib/stacktrace_kunit.o: in function `test_unwind_reliable_notail':
>> stacktrace_kunit.c:(.text+0x630): undefined reference to `kunit_binary_ptr_assert_format'
>> sparc64-linux-ld: stacktrace_kunit.c:(.text+0x654): undefined reference to `kunit_binary_ptr_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x668): undefined reference to `__kunit_do_failed_assertion'
   sparc64-linux-ld: lib/stacktrace_kunit.o: in function `test_nounwind':
>> stacktrace_kunit.c:(.text+0x6e4): undefined reference to `kunit_binary_assert_format'
>> sparc64-linux-ld: stacktrace_kunit.c:(.text+0x730): undefined reference to `kunit_binary_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x740): undefined reference to `__kunit_do_failed_assertion'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x770): undefined reference to `kunit_binary_ptr_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x78c): undefined reference to `kunit_binary_ptr_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x7a0): undefined reference to `__kunit_do_failed_assertion'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x7c8): undefined reference to `kunit_binary_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x7e8): undefined reference to `kunit_binary_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x7f8): undefined reference to `__kunit_do_failed_assertion'
   sparc64-linux-ld: lib/stacktrace_kunit.o: in function `test_nounwind_tail':
   stacktrace_kunit.c:(.text+0x884): undefined reference to `kunit_binary_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x8d0): undefined reference to `kunit_binary_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x8e0): undefined reference to `__kunit_do_failed_assertion'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x910): undefined reference to `kunit_binary_ptr_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x92c): undefined reference to `kunit_binary_ptr_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x940): undefined reference to `__kunit_do_failed_assertion'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x968): undefined reference to `kunit_binary_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x988): undefined reference to `kunit_binary_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0x998): undefined reference to `__kunit_do_failed_assertion'
   sparc64-linux-ld: lib/stacktrace_kunit.o: in function `test_unwind_reliable':
   stacktrace_kunit.c:(.text+0x9f0): undefined reference to `kunit_binary_ptr_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xa14): undefined reference to `kunit_binary_ptr_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xa28): undefined reference to `__kunit_do_failed_assertion'
   sparc64-linux-ld: lib/stacktrace_kunit.o: in function `test_unwind_reliable_tail':
   stacktrace_kunit.c:(.text+0xa70): undefined reference to `kunit_binary_ptr_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xa94): undefined reference to `kunit_binary_ptr_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xaa8): undefined reference to `__kunit_do_failed_assertion'
   sparc64-linux-ld: lib/stacktrace_kunit.o: in function `test_nounwind_notail':
   stacktrace_kunit.c:(.text+0xb24): undefined reference to `kunit_binary_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xb70): undefined reference to `kunit_binary_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xb80): undefined reference to `__kunit_do_failed_assertion'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xbb0): undefined reference to `kunit_binary_ptr_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xbcc): undefined reference to `kunit_binary_ptr_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xbe0): undefined reference to `__kunit_do_failed_assertion'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xc08): undefined reference to `kunit_binary_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xc28): undefined reference to `kunit_binary_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xc38): undefined reference to `__kunit_do_failed_assertion'
   sparc64-linux-ld: lib/stacktrace_kunit.o: in function `test_unwind':
   stacktrace_kunit.c:(.text+0xca0): undefined reference to `kunit_binary_ptr_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xcbc): undefined reference to `kunit_binary_ptr_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xcd0): undefined reference to `__kunit_do_failed_assertion'
   sparc64-linux-ld: lib/stacktrace_kunit.o: in function `test_unwind_tail':
   stacktrace_kunit.c:(.text+0xd40): undefined reference to `kunit_binary_ptr_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xd5c): undefined reference to `kunit_binary_ptr_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xd70): undefined reference to `__kunit_do_failed_assertion'
   sparc64-linux-ld: lib/stacktrace_kunit.o: in function `test_unwind_notail':
   stacktrace_kunit.c:(.text+0xde0): undefined reference to `kunit_binary_ptr_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xdfc): undefined reference to `kunit_binary_ptr_assert_format'
   sparc64-linux-ld: stacktrace_kunit.c:(.text+0xe10): undefined reference to `__kunit_do_failed_assertion'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
