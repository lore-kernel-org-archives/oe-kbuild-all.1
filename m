Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8CEF9F0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 13:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721482903; cv=none; b=Mh0FrdpJVKnrGKtRjEDZeHMh/doQB/ermwJRbDMi9blSJM0lrsj3IIKua24htMQcR5Qd9KUIOnlfqItz22j+pLhQ1wKuLlFs2cpl7JCVdPPpqvu2uxOv16J2rM5bidNIZo0YA4hxrBvJAtuNWysHeDX12Qp66qvObpfKOx2U8fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721482903; c=relaxed/simple;
	bh=1T5xZkFVqLlZY924yzFfs68HM96qlhKVtmiHw0bNHBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bmmTllyyrLB0aPSpU3Cyx+p7jpvvfsdTzyxPslVDxjBItaRJlPcbphLe0z/hKe4cT7QKHIkrzhVqrhwTI76PQJ6GPFofUuPDBkcgI0/5K5esuAPHBZ6WUFGy7f4Hln2cNQjjM6XqFbkP+f40uk+ryXHzLxzzGzVf803+Vi9U9SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGwPw17n; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGwPw17n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721482900; x=1753018900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1T5xZkFVqLlZY924yzFfs68HM96qlhKVtmiHw0bNHBg=;
  b=fGwPw17nD+ihcfiuO8H9cUFwZ9g4b8R9lYSYosLR6Nlzas6HEiBMgzYs
   z4o8dhK093Au6s3S451eNs/EZs8I/fzVYQqR0W3MeHvwL3AFo3Sgx9mcl
   6ovdqgmvEOvu2g4swtxZ2HyqC84QOk+PliCR0iw1dVpgLN1EkQPEzJ/7s
   ZAHAgyrAzfDXCzgbbSYh2hC8J3EbwXxDB8RWm7MfgtTp+2H/AN5iq7KMg
   gPJ1oWWX8VSoJ3dUcGPwT5nymnqXfwg7OTo/Zw3dqJzh9eIr+Dny+lsG/
   E0i5DkBW3dRZHRZlihC1AedS+2ZPli2VIzfGsZ5wL4WmJ0lHn4PPLKv22
   Q==;
X-CSE-ConnectionGUID: KbFf1fABSPWhkQsO8qwLsg==
X-CSE-MsgGUID: juk1g69pS3qC6i9XIDdCXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="19250013"
X-IronPort-AV: E=Sophos;i="6.09,223,1716274800"; 
   d="scan'208";a="19250013"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 06:41:39 -0700
X-CSE-ConnectionGUID: 3hetEybMTFeINLVDV8Ascg==
X-CSE-MsgGUID: syhsUlv/S2KxVYQIoR06ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,223,1716274800"; 
   d="scan'208";a="55944074"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jul 2024 06:41:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVAL9-000jF1-0T;
	Sat, 20 Jul 2024 13:41:35 +0000
Date: Sat, 20 Jul 2024 21:40:37 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 53/55] mm/damon/tests/core-kunit.h:394:undefined
 reference to `kunit_binary_assert_format'
Message-ID: <202407202132.JxTrdrIU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   8fc85b06e0de8c68ae3886178818c03d6eced514
commit: dfbce92b00bf8691cb86026352354792271c39f5 [53/55] mm/damon/tests: Rename test files to have _kunit suffix
config: i386-randconfig-015-20240720 (https://download.01.org/0day-ci/archive/20240720/202407202132.JxTrdrIU-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407202132.JxTrdrIU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407202132.JxTrdrIU-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/damon/core.o: in function `damon_test_moving_sum':
>> mm/damon/tests/core-kunit.h:394:(.text+0x9c5): undefined reference to `kunit_binary_assert_format'
>> ld: mm/damon/tests/core-kunit.h:394:(.text+0x9d3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_feed_loop_next_input':
   mm/damon/tests/core-kunit.h:496:(.text+0xa77): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:496:(.text+0xaa8): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damos_test_new_filter':
   mm/damon/tests/core-kunit.h:403:(.text+0xfe7): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:403:(.text+0xff5): undefined reference to `__kunit_do_failed_assertion'
>> ld: mm/damon/tests/core-kunit.h:404:(.text+0x1044): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:404:(.text+0x1052): undefined reference to `__kunit_do_failed_assertion'
>> ld: mm/damon/tests/core-kunit.h:405:(.text+0x107b): undefined reference to `kunit_binary_ptr_assert_format'
   ld: mm/damon/tests/core-kunit.h:405:(.text+0x1089): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:406:(.text+0x10ab): undefined reference to `kunit_binary_ptr_assert_format'
   ld: mm/damon/tests/core-kunit.h:406:(.text+0x10b9): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_update_monitoring_result':
   mm/damon/tests/core-kunit.h:341:(.text+0x258d): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:341:(.text+0x259b): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:346:(.text+0x25d5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:346:(.text+0x25e3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:347:(.text+0x2615): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:347:(.text+0x2623): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:352:(.text+0x2655): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:352:(.text+0x2663): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:353:(.text+0x2695): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:353:(.text+0x26a3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_merge_two':
>> mm/damon/tests/core-kunit.h:172:(.text+0x28b9): undefined reference to `kunit_binary_ptr_assert_format'
   ld: mm/damon/tests/core-kunit.h:172:(.text+0x28c7): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:175:(.text+0x2919): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:175:(.text+0x2927): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:166:(.text+0x295d): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:166:(.text+0x296b): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:167:(.text+0x29a5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:167:(.text+0x29b3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:168:(.text+0x29e5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:168:(.text+0x29f3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damos_test_filter_out':
>> mm/damon/tests/core-kunit.h:425:(.text+0x2e8c): undefined reference to `kunit_unary_assert_format'
   ld: mm/damon/tests/core-kunit.h:425:(.text+0x2e9a): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:426:(.text+0x2ed5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:426:(.text+0x2ee3): undefined reference to `__kunit_do_failed_assertion'
>> ld: mm/damon/tests/core-kunit.h:431:(.text+0x2f04): undefined reference to `kunit_unary_assert_format'
   ld: mm/damon/tests/core-kunit.h:431:(.text+0x2f12): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:432:(.text+0x2f45): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:432:(.text+0x2f53): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:437:(.text+0x2f74): undefined reference to `kunit_unary_assert_format'
   ld: mm/damon/tests/core-kunit.h:437:(.text+0x2f82): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:438:(.text+0x2fb5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:438:(.text+0x2fc3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:443:(.text+0x2fe4): undefined reference to `kunit_unary_assert_format'
   ld: mm/damon/tests/core-kunit.h:443:(.text+0x2ff2): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:445:(.text+0x3025): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:445:(.text+0x3033): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:446:(.text+0x3065): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:446:(.text+0x3073): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:447:(.text+0x30a5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:447:(.text+0x30b3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:449:(.text+0x30e8): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:449:(.text+0x30f6): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:450:(.text+0x3130): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:450:(.text+0x313e): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:456:(.text+0x3164): undefined reference to `kunit_unary_assert_format'
   ld: mm/damon/tests/core-kunit.h:456:(.text+0x3172): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:458:(.text+0x31a5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:458:(.text+0x31b3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:459:(.text+0x31e5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:459:(.text+0x31f3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:460:(.text+0x3225): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:460:(.text+0x3233): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:462:(.text+0x3268): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:462:(.text+0x3276): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:463:(.text+0x32b0): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:463:(.text+0x32be): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_merge_regions_of':
   mm/damon/tests/core-kunit.h:218:(.text+0x3699): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:218:(.text+0x36ad): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:219:(.text+0x36f3): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:219:(.text+0x3707): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:215:(.text+0x3750): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:215:(.text+0x375e): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_regions':
   mm/damon/tests/core-kunit.h:23:(.text+0x3a25): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:23:(.text+0x3a33): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:24:(.text+0x3a65): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:24:(.text+0x3a73): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:25:(.text+0x3aa5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:25:(.text+0x3ab3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:28:(.text+0x3ae5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:28:(.text+0x3af3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:31:(.text+0x3b25): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:31:(.text+0x3b33): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:34:(.text+0x3b85): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:34:(.text+0x3b93): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_set_regions':
   mm/damon/tests/core-kunit.h:311:(.text+0x44b1): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:311:(.text+0x44bf): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:310:(.text+0x44f1): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:310:(.text+0x44ff): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:308:(.text+0x4535): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:308:(.text+0x4543): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_ops_registration':
   mm/damon/tests/core-kunit.h:260:(.text+0x4d35): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:260:(.text+0x4d43): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:282:(.text+0x4ffc): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:282:(.text+0x500a): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:263:(.text+0x5044): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:263:(.text+0x5052): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:275:(.text+0x5084): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:275:(.text+0x5092): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:255:(.text+0x50c4): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:255:(.text+0x50d2): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_split_regions_of':
   mm/damon/tests/core-kunit.h:234:(.text+0x52dd): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:234:(.text+0x52eb): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:241:(.text+0x5325): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:241:(.text+0x5333): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_split_at':
   mm/damon/tests/core-kunit.h:134:(.text+0x556d): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:134:(.text+0x557b): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:135:(.text+0x55b8): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:135:(.text+0x55c6): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:138:(.text+0x5603): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:138:(.text+0x5611): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:139:(.text+0x5653): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:139:(.text+0x5661): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:141:(.text+0x56a2): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:141:(.text+0x56b0): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:142:(.text+0x56f2): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:142:(.text+0x5700): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:143:(.text+0x5739): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:143:(.text+0x5747): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_aggregate':
   mm/damon/tests/core-kunit.h:108:(.text+0x5b2a): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:108:(.text+0x5b38): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:112:(.text+0x5b98): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:112:(.text+0x5ba6): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:116:(.text+0x5bff): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:116:(.text+0x5c0d): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_target':
   mm/damon/tests/core-kunit.h:59:(.text+0x5f14): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:59:(.text+0x5f24): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:62:(.text+0x5f75): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:62:(.text+0x5f85): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:56:(.text+0x5fc0): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:56:(.text+0x5fd0): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_set_attrs':
   mm/damon/tests/core-kunit.h:366:(.text+0x6314): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:366:(.text+0x6322): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:374:(.text+0x6354): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:374:(.text+0x6362): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:378:(.text+0x6394): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:378:(.text+0x63a2): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/vaddr.o: in function `damon_test_split_evenly_succ':
>> mm/damon/tests/vaddr-kunit.h:288:(.text+0x361): undefined reference to `kunit_binary_assert_format'
>> ld: mm/damon/tests/vaddr-kunit.h:288:(.text+0x36f): undefined reference to `__kunit_do_failed_assertion'
>> ld: mm/damon/tests/vaddr-kunit.h:290:(.text+0x40c): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:290:(.text+0x41a): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:277:(.text+0x454): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:277:(.text+0x462): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:279:(.text+0x494): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:279:(.text+0x4a2): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:285:(.text+0x4d2): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:285:(.text+0x4e0): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:283:(.text+0x510): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:283:(.text+0x51e): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/vaddr.o: in function `damon_test_split_evenly_fail':
   mm/damon/tests/vaddr-kunit.h:262:(.text+0x667): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:262:(.text+0x675): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:261:(.text+0x6af): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:261:(.text+0x6bd): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:256:(.text+0x6f4): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:256:(.text+0x702): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:258:(.text+0x735): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:258:(.text+0x743): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/vaddr.o: in function `damon_test_split_evenly':
   mm/damon/tests/vaddr-kunit.h:297:(.text+0x7ff): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:297:(.text+0x822): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/vaddr.o: in function `damon_do_test_apply_three_regions':
   mm/damon/tests/vaddr-kunit.h:149:(.text+0x991): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:149:(.text+0x9a2): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:148:(.text+0x9d1): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:148:(.text+0x9e2): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/vaddr.o: in function `damon_test_three_regions_in_vmas':
   mm/damon/tests/vaddr-kunit.h:86:(.text+0x1143): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:86:(.text+0x1151): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:91:(.text+0x1194): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:91:(.text+0x11a2): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:90:(.text+0x11e5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:90:(.text+0x11f3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:89:(.text+0x1236): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:89:(.text+0x1244): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:88:(.text+0x1287): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:88:(.text+0x1295): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:87:(.text+0x12d8): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:87:(.text+0x12e6): undefined reference to `__kunit_do_failed_assertion'
>> ld: mm/damon/tests/vaddr-kunit.h:82:(.text+0x131b): undefined reference to `kunit_try_catch_throw'
   ld: mm/damon/sysfs.o: in function `damon_sysfs_test_add_targets':
>> mm/damon/tests/sysfs-kunit.h:60:(.text+0x1477): undefined reference to `kunit_binary_assert_format'
>> ld: mm/damon/tests/sysfs-kunit.h:60:(.text+0x1487): undefined reference to `__kunit_do_failed_assertion'
>> ld: mm/damon/tests/sysfs-kunit.h:65:(.text+0x14dc): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/sysfs-kunit.h:65:(.text+0x14ec): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/dbgfs.o: in function `damon_dbgfs_test_set_init_regions':
>> mm/damon/tests/dbgfs-kunit.h:139:(.text+0x138b): undefined reference to `kunit_binary_str_assert_format'
>> ld: mm/damon/tests/dbgfs-kunit.h:139:(.text+0x1399): undefined reference to `__kunit_do_failed_assertion'
>> ld: mm/damon/tests/dbgfs-kunit.h:134:(.text+0x13de): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:134:(.text+0x13ec): undefined reference to `__kunit_do_failed_assertion'
>> ld: mm/damon/tests/dbgfs-kunit.h:151:(.text+0x1429): undefined reference to `kunit_binary_str_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:151:(.text+0x1437): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:146:(.text+0x147e): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:146:(.text+0x148c): undefined reference to `__kunit_do_failed_assertion'
>> ld: mm/damon/tests/dbgfs-kunit.h:121:(.text+0x1505): undefined reference to `kunit_try_catch_throw'
   ld: mm/damon/dbgfs.o: in function `damon_dbgfs_test_set_targets':
   mm/damon/tests/dbgfs-kunit.h:86:(.text+0x16ca): undefined reference to `kunit_binary_str_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:86:(.text+0x16d8): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:90:(.text+0x1702): undefined reference to `kunit_binary_str_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:90:(.text+0x1710): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:94:(.text+0x173a): undefined reference to `kunit_binary_str_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:94:(.text+0x1748): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:78:(.text+0x177e): undefined reference to `kunit_try_catch_throw'
   ld: mm/damon/dbgfs.o: in function `damon_dbgfs_test_str_to_ints':
>> mm/damon/tests/dbgfs-kunit.h:50:(.text+0x1dfa): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:50:(.text+0x1e08): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:43:(.text+0x1e42): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:43:(.text+0x1e50): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:57:(.text+0x1e84): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:57:(.text+0x1e92): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:24:(.text+0x1ed7): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:24:(.text+0x1ee5): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:25:(.text+0x1f1f): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:25:(.text+0x1f2d): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:30:(.text+0x1f67): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:30:(.text+0x1f75): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:31:(.text+0x1faf): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:31:(.text+0x1fbd): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:67:(.text+0x1ff7): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:67:(.text+0x2005): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:55:(.text+0x203c): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:55:(.text+0x204a): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:36:(.text+0x2087): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:36:(.text+0x2095): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:41:(.text+0x20d4): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:41:(.text+0x20e2): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:48:(.text+0x212c): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:48:(.text+0x213a): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:62:(.text+0x217f): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:62:(.text+0x218d): undefined reference to `__kunit_do_failed_assertion'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DAMON_DBGFS
   Depends on [n]: DAMON_DBGFS_DEPRECATED [=n]
   Selected by [m]:
   - DAMON_DBGFS_KUNIT_TEST [=y] && KUNIT [=m]


vim +394 mm/damon/tests/core-kunit.h

aa13779be6b7d1 mm/damon/core-test.h SeongJae Park 2023-06-15  382  
0926e8ff96b588 mm/damon/core-test.h SeongJae Park 2023-09-15  383  static void damon_test_moving_sum(struct kunit *test)
0926e8ff96b588 mm/damon/core-test.h SeongJae Park 2023-09-15  384  {
0926e8ff96b588 mm/damon/core-test.h SeongJae Park 2023-09-15  385  	unsigned int mvsum = 50000, nomvsum = 50000, len_window = 10;
0926e8ff96b588 mm/damon/core-test.h SeongJae Park 2023-09-15  386  	unsigned int new_values[] = {10000, 0, 10000, 0, 0, 0, 10000, 0, 0, 0};
0926e8ff96b588 mm/damon/core-test.h SeongJae Park 2023-09-15  387  	unsigned int expects[] = {55000, 50000, 55000, 50000, 45000, 40000,
0926e8ff96b588 mm/damon/core-test.h SeongJae Park 2023-09-15  388  		45000, 40000, 35000, 30000};
0926e8ff96b588 mm/damon/core-test.h SeongJae Park 2023-09-15  389  	int i;
0926e8ff96b588 mm/damon/core-test.h SeongJae Park 2023-09-15  390  
0926e8ff96b588 mm/damon/core-test.h SeongJae Park 2023-09-15  391  	for (i = 0; i < ARRAY_SIZE(new_values); i++) {
0926e8ff96b588 mm/damon/core-test.h SeongJae Park 2023-09-15  392  		mvsum = damon_moving_sum(mvsum, nomvsum, len_window,
0926e8ff96b588 mm/damon/core-test.h SeongJae Park 2023-09-15  393  				new_values[i]);
0926e8ff96b588 mm/damon/core-test.h SeongJae Park 2023-09-15 @394  		KUNIT_EXPECT_EQ(test, mvsum, expects[i]);
0926e8ff96b588 mm/damon/core-test.h SeongJae Park 2023-09-15  395  	}
0926e8ff96b588 mm/damon/core-test.h SeongJae Park 2023-09-15  396  }
0926e8ff96b588 mm/damon/core-test.h SeongJae Park 2023-09-15  397  
2a158e956b98e0 mm/damon/core-test.h SeongJae Park 2023-07-29  398  static void damos_test_new_filter(struct kunit *test)
2a158e956b98e0 mm/damon/core-test.h SeongJae Park 2023-07-29  399  {
2a158e956b98e0 mm/damon/core-test.h SeongJae Park 2023-07-29  400  	struct damos_filter *filter;
2a158e956b98e0 mm/damon/core-test.h SeongJae Park 2023-07-29  401  
2a158e956b98e0 mm/damon/core-test.h SeongJae Park 2023-07-29  402  	filter = damos_new_filter(DAMOS_FILTER_TYPE_ANON, true);
2a158e956b98e0 mm/damon/core-test.h SeongJae Park 2023-07-29  403  	KUNIT_EXPECT_EQ(test, filter->type, DAMOS_FILTER_TYPE_ANON);
2a158e956b98e0 mm/damon/core-test.h SeongJae Park 2023-07-29 @404  	KUNIT_EXPECT_EQ(test, filter->matching, true);
2a158e956b98e0 mm/damon/core-test.h SeongJae Park 2023-07-29 @405  	KUNIT_EXPECT_PTR_EQ(test, filter->list.prev, &filter->list);
2a158e956b98e0 mm/damon/core-test.h SeongJae Park 2023-07-29  406  	KUNIT_EXPECT_PTR_EQ(test, filter->list.next, &filter->list);
2a158e956b98e0 mm/damon/core-test.h SeongJae Park 2023-07-29  407  	damos_destroy_filter(filter);
2a158e956b98e0 mm/damon/core-test.h SeongJae Park 2023-07-29  408  }
2a158e956b98e0 mm/damon/core-test.h SeongJae Park 2023-07-29  409  
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  410  static void damos_test_filter_out(struct kunit *test)
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  411  {
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  412  	struct damon_target *t;
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  413  	struct damon_region *r, *r2;
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  414  	struct damos_filter *f;
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  415  
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  416  	f = damos_new_filter(DAMOS_FILTER_TYPE_ADDR, true);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  417  	f->addr_range = (struct damon_addr_range){
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  418  		.start = DAMON_MIN_REGION * 2, .end = DAMON_MIN_REGION * 6};
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  419  
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  420  	t = damon_new_target();
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  421  	r = damon_new_region(DAMON_MIN_REGION * 3, DAMON_MIN_REGION * 5);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  422  	damon_add_region(r, t);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  423  
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  424  	/* region in the range */
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02 @425  	KUNIT_EXPECT_TRUE(test, __damos_filter_out(NULL, t, r, f));
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  426  	KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 1);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  427  
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  428  	/* region before the range */
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  429  	r->ar.start = DAMON_MIN_REGION * 1;
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  430  	r->ar.end = DAMON_MIN_REGION * 2;
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02 @431  	KUNIT_EXPECT_FALSE(test, __damos_filter_out(NULL, t, r, f));
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  432  	KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 1);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  433  
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  434  	/* region after the range */
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  435  	r->ar.start = DAMON_MIN_REGION * 6;
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  436  	r->ar.end = DAMON_MIN_REGION * 8;
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  437  	KUNIT_EXPECT_FALSE(test, __damos_filter_out(NULL, t, r, f));
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  438  	KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 1);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  439  
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  440  	/* region started before the range */
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  441  	r->ar.start = DAMON_MIN_REGION * 1;
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  442  	r->ar.end = DAMON_MIN_REGION * 4;
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  443  	KUNIT_EXPECT_FALSE(test, __damos_filter_out(NULL, t, r, f));
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  444  	/* filter should have split the region */
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  445  	KUNIT_EXPECT_EQ(test, r->ar.start, DAMON_MIN_REGION * 1);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  446  	KUNIT_EXPECT_EQ(test, r->ar.end, DAMON_MIN_REGION * 2);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  447  	KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 2);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  448  	r2 = damon_next_region(r);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  449  	KUNIT_EXPECT_EQ(test, r2->ar.start, DAMON_MIN_REGION * 2);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  450  	KUNIT_EXPECT_EQ(test, r2->ar.end, DAMON_MIN_REGION * 4);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  451  	damon_destroy_region(r2, t);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  452  
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  453  	/* region started in the range */
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  454  	r->ar.start = DAMON_MIN_REGION * 2;
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  455  	r->ar.end = DAMON_MIN_REGION * 8;
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  456  	KUNIT_EXPECT_TRUE(test, __damos_filter_out(NULL, t, r, f));
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  457  	/* filter should have split the region */
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  458  	KUNIT_EXPECT_EQ(test, r->ar.start, DAMON_MIN_REGION * 2);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  459  	KUNIT_EXPECT_EQ(test, r->ar.end, DAMON_MIN_REGION * 6);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  460  	KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 2);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  461  	r2 = damon_next_region(r);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  462  	KUNIT_EXPECT_EQ(test, r2->ar.start, DAMON_MIN_REGION * 6);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  463  	KUNIT_EXPECT_EQ(test, r2->ar.end, DAMON_MIN_REGION * 8);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  464  	damon_destroy_region(r2, t);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  465  
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  466  	damon_free_target(t);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  467  	damos_free_filter(f);
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  468  }
26713c8908752a mm/damon/core-test.h SeongJae Park 2023-08-02  469  

:::::: The code at line 394 was first introduced by commit
:::::: 0926e8ff96b58845e802438374caaca53ab36053 mm/damon/core-test: add a unit test for damon_moving_sum()

:::::: TO: SeongJae Park <sj@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
