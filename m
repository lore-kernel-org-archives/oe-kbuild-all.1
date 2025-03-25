Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4A0269CFA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 22:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742941294; cv=none; b=QbNwiyAOPq9xluN7w1vTyMPRRHDyurUaoMbr+hOIpyJmGOC+YsJI7464hjKbAgMLiaU5ARNMTrpQ124QTXjWoB66XADhaYrla7118AibhRpIaWBVTCU7hfnbZlgZzLivOHoroY312HXpj4Gsqy+nv8miho8PFbTDrU/4TAgc0Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742941294; c=relaxed/simple;
	bh=9X68KzrHZkPJqbQ32dZAIntlkxQmvs0a0CpwvkTmTrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rDJd1deVUMpb5H0r+MERmsyNRluM5Bx7IwKANZgy+FbMvOHitpsLksQKEdzUyq4gwC1Dr0fwZxHmEnjR2/J8ctuN646oJ92Qptbc29hEFNKjVLrnXO5kshpXjbfYt3Ggjph2JCMwpN6EWmgIjJpIbDuQf0n9eYMeuwejCeLNABU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/qu0/+U; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/qu0/+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742941293; x=1774477293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9X68KzrHZkPJqbQ32dZAIntlkxQmvs0a0CpwvkTmTrE=;
  b=E/qu0/+UMhO7tXMqBicJYMNjLOPkT8F4CcJLeyoQrs7gMKZP4K4moclY
   QIRdzmUSTOaxil5cgzhv0msAMNMpskssp8WwZc7c2p3NtER9WU9g4Hj3R
   83GvgdN8Wim6rqQvHbQAYvVY5KRMuQEs8C2LpqUgxbKFdn3R25vv7ZXRr
   YDh+ZvhlaaCjbODnkH4V5f6Yobi1U5nFVTz9/roGJqVQ6ybYC2F5+OKBD
   N+t7hq8qe+ZZMeW3iAx8Km3V9wTKZR1HlbM3CRduekiDJZfUClbmgRQR1
   DA9IqyLHxX8hzxLelCGEKg+fqkgLtM2cqS57IlXumwZda4An6ckrLOE/V
   w==;
X-CSE-ConnectionGUID: m2kycf6eQ2uuo28KI5TUrA==
X-CSE-MsgGUID: ixrbPMyuTQ+Q/5MTFRGvEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44312287"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="44312287"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 15:21:30 -0700
X-CSE-ConnectionGUID: F7dKyiLDT/uRNaWqYoiXSg==
X-CSE-MsgGUID: bJMy/Bt+TPymdg3ImRbOJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="155524829"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Mar 2025 15:21:29 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txCeF-0005Ef-0K;
	Tue, 25 Mar 2025 22:21:27 +0000
Date: Wed, 26 Mar 2025 06:20:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-06 5/5]
 mm/kasan/kasan_test.c:412:14: warning: allocation of insufficient size '13'
 for type 'struct <anonymous>' with size '16'
Message-ID: <202503260642.m5A3QIeU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrey,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-06
head:   f2c25a3fab99d49c777fbf9af2d696fcdc877d76
commit: f7e01ab828fd4bf6d25b1f143a3994241e8572bf [5/5] kasan: move tests to mm/kasan/
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250326/202503260642.m5A3QIeU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503260642.m5A3QIeU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503260642.m5A3QIeU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/kasan/kasan_test.c: In function 'kmalloc_oob_16':
>> mm/kasan/kasan_test.c:412:14: warning: allocation of insufficient size '13' for type 'struct <anonymous>' with size '16' [-Walloc-size]
     412 |         ptr1 = kmalloc(sizeof(*ptr1) - 3, GFP_KERNEL);
         |              ^


vim +412 mm/kasan/kasan_test.c

26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  402  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  403  static void kmalloc_oob_16(struct kunit *test)
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  404  {
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  405  	struct {
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  406  		u64 words[2];
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  407  	} *ptr1, *ptr2;
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  408  
58b999d7a22c59 lib/test_kasan.c Andrey Konovalov 2020-11-01  409  	/* This test is specifically crafted for the generic mode. */
da17e377723f50 lib/test_kasan.c Andrey Konovalov 2021-02-24  410  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_GENERIC);
58b999d7a22c59 lib/test_kasan.c Andrey Konovalov 2020-11-01  411  
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13 @412  	ptr1 = kmalloc(sizeof(*ptr1) - 3, GFP_KERNEL);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  413  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr1);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  414  
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  415  	ptr2 = kmalloc(sizeof(*ptr2), GFP_KERNEL);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  416  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr2);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  417  
aaf50b1969d793 lib/test_kasan.c Kees Cook        2022-06-08  418  	OPTIMIZER_HIDE_VAR(ptr1);
aaf50b1969d793 lib/test_kasan.c Kees Cook        2022-06-08  419  	OPTIMIZER_HIDE_VAR(ptr2);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  420  	KUNIT_EXPECT_KASAN_FAIL(test, *ptr1 = *ptr2);
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  421  	kfree(ptr1);
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  422  	kfree(ptr2);
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  423  }
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  424  

:::::: The code at line 412 was first introduced by commit
:::::: 3f15801cdc2379ca4bf507f48bffd788f9e508ae lib: add kasan test module

:::::: TO: Andrey Ryabinin <a.ryabinin@samsung.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
