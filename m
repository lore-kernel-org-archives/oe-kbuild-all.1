Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BEB3793C8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 06:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775542861; cv=none; b=HUbigOcoOrO/G2CFzcHd9bvyF0xMBolrgWW429CoUw9ukFF6tBytWLcXBxkGap5KOjtBNSUESKWqRC5QM8aewfMoR0WuG/fJ61fUUlF+r4XQsEFyOUT4as5UeG91xhWzxSLoc5aXkwKJFHE1zBSu79WbtMhBpsNBNhgNJrPjMj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775542861; c=relaxed/simple;
	bh=4fOMOOsS1zL9FQYVNvT0CGwOzZ08tPJfPJt0P1hi6Nk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sg2loKXrK5wPAvaUL1D8BYUU6MDjX2A3rG0vBGWncGTr99PTY/7bS+s0YreuKglP46m/v7NDgVzTTWQvybXrPqKdpzV4Lu3Urcm7v1RiWgQb6mWf3G4eVeOTPCA4NtTSO3ByQcHcGRh+16t2qsEGix2zrkRF0vN6ct3rDa9VRsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLqO6WEs; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLqO6WEs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775542858; x=1807078858;
  h=date:from:to:cc:subject:message-id;
  bh=4fOMOOsS1zL9FQYVNvT0CGwOzZ08tPJfPJt0P1hi6Nk=;
  b=RLqO6WEsGPJE/Jid1zjorHx79dcAheIXDYvO00nwlpYzRtAiDRtwx1Yf
   j1nJJPilOd1fXyHo+35LuFBErG+Rxizc49d+x84qh8z0gIxIWqyL1pRwm
   b8PdIOAosNhTHPx4+09ZcFmK+bd0s4I0TmSRpMrtfGdxkK3qSQQLFgCHF
   V9Ss6XQwuob7AypX1NBjMZcAD7tr/ntnzPqraHi7QR6C4QlpKKaZQ0wk7
   mwNL3aWZn49pF0VLRePzL0o0kzEWb4zcJw9/lbgpgZ98qx1e1WBvf8IN1
   cF0bF0JAb9Sp1QH9NxkDb1/b7AwpSC/BfUIsRev8kY0LHWAAYs1sErDC9
   A==;
X-CSE-ConnectionGUID: w5uRXeCxTsC/9Gy0mo3XKQ==
X-CSE-MsgGUID: qpQG/N73SO6G0aLKCVVrPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76569964"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76569964"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 23:20:54 -0700
X-CSE-ConnectionGUID: Yc2AdP0vS1KTyhYKpozZzg==
X-CSE-MsgGUID: BbYTdvUkRBSAmFZexr2ftQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="227983835"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Apr 2026 23:20:53 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9znt-000000000Ft-46jA;
	Tue, 07 Apr 2026 06:20:49 +0000
Date: Tue, 07 Apr 2026 14:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jian Zhang <zhangjian.3032@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, Corey Minyard <corey@minyard.net>
Subject: [linux-next:master 10744/12201]
 include/kunit/test.h:501:undefined reference to `kunit_kmalloc_array'
Message-ID: <202604071448.zUBjPYPu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   816f193dd0d95246f208590924dd962b192def78
commit: d4464694f2a409fadbe17a70202242ff6b72ee30 [10744/12201] ipmi: ssif_bmc: add unit test for state machine
config: x86_64-randconfig-007-20250906 (https://download.01.org/0day-ci/archive/20260407/202604071448.zUBjPYPu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071448.zUBjPYPu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071448.zUBjPYPu-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/char/ipmi/ssif_bmc.o: in function `kunit_kmalloc':
>> include/kunit/test.h:501:(.text+0x9c1): undefined reference to `kunit_kmalloc_array'
   ld: drivers/char/ipmi/ssif_bmc.o: in function `ssif_bmc_test_singlepart_req':
>> drivers/char/ipmi/ssif_bmc.c:957:(.text+0x450b): undefined reference to `kunit_binary_assert_format'
>> ld: drivers/char/ipmi/ssif_bmc.c:957:(.text+0x4534): undefined reference to `__kunit_do_failed_assertion'
>> ld: drivers/char/ipmi/ssif_bmc.c:960:(.text+0x4b7c): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:960:(.text+0x4b9f): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:966:(.text+0x4bbb): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:966:(.text+0x4bda): undefined reference to `__kunit_do_failed_assertion'
>> ld: drivers/char/ipmi/ssif_bmc.c:967:(.text+0x4bf8): undefined reference to `kunit_unary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:967:(.text+0x4c17): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:961:(.text+0x4c35): undefined reference to `kunit_unary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:961:(.text+0x4c54): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:962:(.text+0x4c72): undefined reference to `kunit_unary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:962:(.text+0x4c91): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:963:(.text+0x4caf): undefined reference to `kunit_unary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:963:(.text+0x4cce): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:964:(.text+0x4ce9): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:964:(.text+0x4d0c): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:965:(.text+0x4d28): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:965:(.text+0x4d47): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.o: in function `ssif_bmc_test_restart_after_invalid_command':
   drivers/char/ipmi/ssif_bmc.c:1001:(.text+0x56cb): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1003:(.text+0x56ea): undefined reference to `__kunit_do_failed_assertion'
>> ld: drivers/char/ipmi/ssif_bmc.c:1003:(.text+0x56f7): undefined reference to `__kunit_abort'
   ld: drivers/char/ipmi/ssif_bmc.c:1003:(.text+0x5791): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:998:(.text+0x57bb): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1007:(.text+0x57fa): undefined reference to `kunit_unary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1007:(.text+0x5819): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1006:(.text+0x5834): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1006:(.text+0x5857): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.o: in function `ssif_bmc_test_restart_write_without_stop':
   drivers/char/ipmi/ssif_bmc.c:983:(.text+0x60ce): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:978:(.text+0x6184): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:983:(.text+0x61a3): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:983:(.text+0x61b0): undefined reference to `__kunit_abort'
   ld: drivers/char/ipmi/ssif_bmc.c:981:(.text+0x624a): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:975:(.text+0x6274): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:986:(.text+0x62b0): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:986:(.text+0x62d3): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.o: in function `ssif_bmc_test_write_interrupts_response_sending':
   drivers/char/ipmi/ssif_bmc.c:1177:(.text+0x6966): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1182:(.text+0x698f): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1182:(.text+0x699c): undefined reference to `__kunit_abort'
   ld: drivers/char/ipmi/ssif_bmc.c:1180:(.text+0x69b2): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1180:(.text+0x69d5): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1182:(.text+0x69e8): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1185:(.text+0x6a24): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1185:(.text+0x6a44): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.o: in function `ssif_bmc_test_write_interrupts_response_send':
   drivers/char/ipmi/ssif_bmc.c:1155:(.text+0x6eeb): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1155:(.text+0x6f0f): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1155:(.text+0x6f1c): undefined reference to `__kunit_abort'
   ld: drivers/char/ipmi/ssif_bmc.c:1158:(.text+0x6f2c): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1158:(.text+0x6f54): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.o: in function `ssif_bmc_test_singlepart_read_response_completion':
   drivers/char/ipmi/ssif_bmc.c:1053:(.text+0x7d1c): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1053:(.text+0x7d45): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1029:(.text+0x7d5d): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1029:(.text+0x7d81): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1029:(.text+0x7d8e): undefined reference to `__kunit_abort'
   ld: drivers/char/ipmi/ssif_bmc.c:1057:(.text+0x7da4): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1057:(.text+0x7dc7): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1033:(.text+0x7de2): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1033:(.text+0x7e05): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1036:(.text+0x7e20): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1036:(.text+0x7e44): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1039:(.text+0x7e60): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1039:(.text+0x7e7f): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1032:(.text+0x7e9b): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1032:(.text+0x7eba): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1042:(.text+0x7ed5): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1042:(.text+0x7ef9): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1045:(.text+0x7f15): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1045:(.text+0x7f34): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1048:(.text+0x7f4f): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1048:(.text+0x7f73): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1051:(.text+0x7f9a): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1051:(.text+0x7faa): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1055:(.text+0x7fc5): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1055:(.text+0x7fe8): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1056:(.text+0x8006): undefined reference to `kunit_unary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1056:(.text+0x8025): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.o: in function `ssif_bmc_test_stop_during_start_discards_partial_request':
   drivers/char/ipmi/ssif_bmc.c:1086:(.text+0x9020): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1086:(.text+0x9049): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1082:(.text+0x933c): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1082:(.text+0x9365): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1079:(.text+0x9401): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1079:(.text+0x942a): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1070:(.text+0x94bf): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1070:(.text+0x94e8): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1084:(.text+0x9584): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1084:(.text+0x95ad): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1065:(.text+0x95c5): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1065:(.text+0x95e9): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1065:(.text+0x95f6): undefined reference to `__kunit_abort'
   ld: drivers/char/ipmi/ssif_bmc.c:1074:(.text+0x960d): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1074:(.text+0x962c): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1076:(.text+0x9647): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1076:(.text+0x966b): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1072:(.text+0x9686): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1072:(.text+0x96a9): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1073:(.text+0x96c7): undefined reference to `kunit_unary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1073:(.text+0x96e6): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1091:(.text+0x9701): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1091:(.text+0x9721): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1068:(.text+0x973c): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1068:(.text+0x975f): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1089:(.text+0x977d): undefined reference to `kunit_unary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1089:(.text+0x979c): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1090:(.text+0x97b7): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1090:(.text+0x97da): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.o: in function `ssif_bmc_test_read_interrupts_partial_write':
   drivers/char/ipmi/ssif_bmc.c:1134:(.text+0xad81): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1134:(.text+0xadaa): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1108:(.text+0xb0cc): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1132:(.text+0xb1af): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1132:(.text+0xb1d8): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1130:(.text+0xb2a4): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1130:(.text+0xb2cd): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1127:(.text+0xb399): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1127:(.text+0xb3c2): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/char/ipmi/ssif_bmc.c:1118:(.text+0xb541): undefined reference to `kunit_binary_assert_format'
   ld: drivers/char/ipmi/ssif_bmc.c:1118:(.text+0xb56a): undefined reference to `__kunit_do_failed_assertion'


vim +501 include/kunit/test.h

7122debb4367ee Daniel Latypov  2021-05-03  487  
7122debb4367ee Daniel Latypov  2021-05-03  488  /**
7122debb4367ee Daniel Latypov  2021-05-03  489   * kunit_kmalloc() - Like kmalloc() except the allocation is *test managed*.
7122debb4367ee Daniel Latypov  2021-05-03  490   * @test: The test context object.
7122debb4367ee Daniel Latypov  2021-05-03  491   * @size: The size in bytes of the desired memory.
7122debb4367ee Daniel Latypov  2021-05-03  492   * @gfp: flags passed to underlying kmalloc().
7122debb4367ee Daniel Latypov  2021-05-03  493   *
7122debb4367ee Daniel Latypov  2021-05-03  494   * See kmalloc() and kunit_kmalloc_array() for more information.
57e3cded99e9c8 David Gow       2023-05-25  495   *
57e3cded99e9c8 David Gow       2023-05-25  496   * Note that some internal context data is also allocated with GFP_KERNEL,
57e3cded99e9c8 David Gow       2023-05-25  497   * regardless of the gfp passed in.
7122debb4367ee Daniel Latypov  2021-05-03  498   */
7122debb4367ee Daniel Latypov  2021-05-03  499  static inline void *kunit_kmalloc(struct kunit *test, size_t size, gfp_t gfp)
7122debb4367ee Daniel Latypov  2021-05-03  500  {
7122debb4367ee Daniel Latypov  2021-05-03 @501  	return kunit_kmalloc_array(test, 1, size, gfp);
7122debb4367ee Daniel Latypov  2021-05-03  502  }
0a756853586ce1 Brendan Higgins 2019-09-23  503  

:::::: The code at line 501 was first introduced by commit
:::::: 7122debb4367ee5c89237e5d36dcc0007d7ec43c kunit: introduce kunit_kmalloc_array/kunit_kcalloc() helpers

:::::: TO: Daniel Latypov <dlatypov@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
