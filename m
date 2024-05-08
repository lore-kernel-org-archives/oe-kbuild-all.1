Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F411C762DF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 09:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715161761; cv=none; b=h38r6ORVh+LYSAFF/EYW8D1Wp6gKSl88ln1n03dh/F4iV0zZtkNUG6nVabVgC3svxI7fXi6ItdVTSABAbdKLUWboRAwYlMMHmRFFq9xSEEIOIPiV8kpqpKMcGyknU8+bU2bqP7tHPIjV9QeqEXEYeeRAgD51Qy4b5E10RnaJSD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715161761; c=relaxed/simple;
	bh=4vHCF52vvyEINTFw/2GJp5IhlPonT8Fhi2qHp3RN90E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oikhNZwalV2bH4rf74Z69kGEyWngiMWKExMBsyeKGJekO6v34Z2YhSE+QChN8LaQ/mAfnMeD65gNVEo/COp4SCWcY9JbrZePlxlU3q+MajmEb4F5urZp91p8bPz982wsk8EaR0c9uElcZrZRRnyfg9GvGRuP2hkAnP45I77K7wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgTSjx7e; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgTSjx7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715161761; x=1746697761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4vHCF52vvyEINTFw/2GJp5IhlPonT8Fhi2qHp3RN90E=;
  b=DgTSjx7eeOc2NgXE0/NG+aOF5vxVbDZJo6BrBBiKUypEYg1VHTikbTZZ
   uCwO8HSxK3IQNpIbPrAtU37Fpwz6wTnhAxZMXHrEGg/iK9NGZniiTLuF1
   k648Yu2qoRXZLUW4JVgUC5jXtz00Xt8UDlzqijtbeRthyPFH2sVWxtb1W
   EWwtGG+TTbVHJu+PUVjw9K+I5eXa4tJs03fGKgx9ll/cPT74pkYULq/b0
   UdUD1IHTbyxL4YdswYvg9iKA4IwbTxzrCcOS1niRcaNfttfYRQcYuiTOf
   wZid4QDdA8+Upcxe52wYuLL3Js+zkFBtlAJJAuUPQ6SC4IIStpuHFP/Ud
   g==;
X-CSE-ConnectionGUID: aLy207rJTAWXUwyvzH93dQ==
X-CSE-MsgGUID: Y00pDa9cSZ2pIvuUW2HYLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22164298"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="22164298"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 02:49:20 -0700
X-CSE-ConnectionGUID: IQyv4gLsQAGjRJ2LWCq8Fg==
X-CSE-MsgGUID: ySjxGMuJSV+q5o4596Hyjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="33522845"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 May 2024 02:49:18 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4dvH-0003F2-27;
	Wed, 08 May 2024 09:49:15 +0000
Date: Wed, 8 May 2024 17:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Will Deacon <will@kernel.org>, Michael Shavit <mshavit@google.com>
Subject: [linux-next:master 9342/12060] include/kunit/test.h:444:undefined
 reference to `kunit_kmalloc_array'
Message-ID: <202405081726.OX8xkyJA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7b4ef8fffaca247809337bb78daceb406659f2d
commit: 56e1a4cc2588a7cb9664457a62fd7a77e005aa01 [9342/12060] iommu/arm-smmu-v3: Add unit tests for arm_smmu_write_entry
config: arm64-randconfig-003-20240508 (https://download.01.org/0day-ci/archive/20240508/202405081726.OX8xkyJA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081726.OX8xkyJA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081726.OX8xkyJA-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: in function `kunit_kmalloc':
>> include/kunit/test.h:444:(.text+0x34c): undefined reference to `kunit_kmalloc_array'
>> include/kunit/test.h:444:(.text+0x34c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `kunit_kmalloc_array'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: in function `arm_smmu_test_writer_record_syncs':
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:58:(.text+0x368): undefined reference to `kunit_binary_ptr_assert_format'
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:58:(.text+0x368): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `kunit_binary_ptr_assert_format'
>> aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:58:(.text+0x370): undefined reference to `kunit_binary_ptr_assert_format'
>> aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:58:(.text+0x380): undefined reference to `__kunit_do_failed_assertion'
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:58:(.text+0x380): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `__kunit_do_failed_assertion'
>> aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:58:(.text+0x388): undefined reference to `__kunit_abort'
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:58:(.text+0x388): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `__kunit_abort'
>> aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:77:(.text+0x44c): undefined reference to `kunit_unary_assert_format'
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:77:(.text+0x44c): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:77:(.text+0x454): undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:77:(.text+0x468): undefined reference to `__kunit_do_failed_assertion'
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:77:(.text+0x468): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: in function `arm_smmu_v3_test_cd_expect_transition':
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:320:(.text+0x568): undefined reference to `kunit_binary_assert_format'
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:320:(.text+0x568): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `kunit_binary_assert_format'
>> aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:320:(.text+0x570): undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:320:(.text+0x58c): undefined reference to `__kunit_do_failed_assertion'
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:320:(.text+0x58c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:321:(.text+0x5a4): undefined reference to `kunit_binary_assert_format'
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:321:(.text+0x5a4): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:321:(.text+0x5ac): undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:321:(.text+0x5c8): undefined reference to `__kunit_do_failed_assertion'
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:321:(.text+0x5c8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `__kunit_do_failed_assertion'
>> aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:322:(.text+0x658): undefined reference to `kunit_mem_assert_format'
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:322:(.text+0x658): additional relocation overflows omitted from the output
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:322:(.text+0x668): undefined reference to `kunit_mem_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:322:(.text+0x67c): undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: in function `arm_smmu_v3_test_ste_expect_transition':
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:142:(.text+0x9d4): undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:142:(.text+0x9dc): undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:142:(.text+0x9f8): undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:143:(.text+0xa14): undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:143:(.text+0xa1c): undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:143:(.text+0xa38): undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:144:(.text+0xac8): undefined reference to `kunit_mem_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:144:(.text+0xad8): undefined reference to `kunit_mem_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:144:(.text+0xaec): undefined reference to `__kunit_do_failed_assertion'


vim +444 include/kunit/test.h

7122debb4367ee Daniel Latypov  2021-05-03  430  
7122debb4367ee Daniel Latypov  2021-05-03  431  /**
7122debb4367ee Daniel Latypov  2021-05-03  432   * kunit_kmalloc() - Like kmalloc() except the allocation is *test managed*.
7122debb4367ee Daniel Latypov  2021-05-03  433   * @test: The test context object.
7122debb4367ee Daniel Latypov  2021-05-03  434   * @size: The size in bytes of the desired memory.
7122debb4367ee Daniel Latypov  2021-05-03  435   * @gfp: flags passed to underlying kmalloc().
7122debb4367ee Daniel Latypov  2021-05-03  436   *
7122debb4367ee Daniel Latypov  2021-05-03  437   * See kmalloc() and kunit_kmalloc_array() for more information.
57e3cded99e9c8 David Gow       2023-05-25  438   *
57e3cded99e9c8 David Gow       2023-05-25  439   * Note that some internal context data is also allocated with GFP_KERNEL,
57e3cded99e9c8 David Gow       2023-05-25  440   * regardless of the gfp passed in.
7122debb4367ee Daniel Latypov  2021-05-03  441   */
7122debb4367ee Daniel Latypov  2021-05-03  442  static inline void *kunit_kmalloc(struct kunit *test, size_t size, gfp_t gfp)
7122debb4367ee Daniel Latypov  2021-05-03  443  {
7122debb4367ee Daniel Latypov  2021-05-03 @444  	return kunit_kmalloc_array(test, 1, size, gfp);
7122debb4367ee Daniel Latypov  2021-05-03  445  }
0a756853586ce1 Brendan Higgins 2019-09-23  446  

:::::: The code at line 444 was first introduced by commit
:::::: 7122debb4367ee5c89237e5d36dcc0007d7ec43c kunit: introduce kunit_kmalloc_array/kunit_kcalloc() helpers

:::::: TO: Daniel Latypov <dlatypov@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
