Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DE739A7EF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 09:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045736; cv=none; b=H67pjbcwODh0u1PX+vmKB1kvj8Wm1wfIvTx56k1bBKJ4/i5EaRO8MrWT9EpyIaBUvI9gqM3v3CN7jBIE7P/d6eXLHfSN8H+2KBGfO3LtvnLGWJyvQc0X+Hh5+TDC9oG4UgLxOHzXQANk56ssFQYZmZkPnXfAShNP/xsXAOYJRFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045736; c=relaxed/simple;
	bh=YQRUZvYXiGbUeX2tPCYXbANwq1ut7JG3s1jZS5IkwOw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mO7M7TRoz71H1/wKuqTc9voxD0aq5galIuz1eVZ3PVA9r1tvobQM7zaAfEUwWAOgMdOHCwb/ciu2i/pRKHGjAuLN1TXoV6Tq7Lfi5KcyLupWv0l2QWudanNL2j9z8JZqYpXMkBVRPmZIxnfAHSHv2A/ghzNSRCmKdQ1ATcbTiHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c39IISlr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c39IISlr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787045735; x=1818581735;
  h=date:from:to:cc:subject:message-id;
  bh=YQRUZvYXiGbUeX2tPCYXbANwq1ut7JG3s1jZS5IkwOw=;
  b=c39IISlr0Y+EmN+urz+3WM5ouHOMrh0B4z75M/Fy6qa/KMv8QQTRkry8
   HikoGAo+J6q0Mp2x/YYcJBlBGbQsDR+xG1OxL749SKD9yCytDhzuQ3PG8
   XImPIj44Mq6K0CqOBWqUQ++1QHccLFQx3ikC4TD5qG4kSkqv2C4NuIlpF
   jbdxshbSbbB6/AjK7EcUc1xDAo8FqTtQGgozdfqa8+igz5EMFykKj2E/+
   VMiJKqEqc4gpdSeBuX6mJTFAlRDqpROYimvg83CcuqTQG99k9d5V107ER
   Jd9OCh+2Zm4oCzVUlnX/4ztTQa0thK/Moy7GPRBDF/C6QYpLuE6NyRzfg
   g==;
X-CSE-ConnectionGUID: wbBwxSRJQe+WCYn/efq9UA==
X-CSE-MsgGUID: M6KYzIUvRDKI/NYXuRetYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87599635"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87599635"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 02:35:34 -0700
X-CSE-ConnectionGUID: 1b223G7SRPKWJ+1X7OTSuA==
X-CSE-MsgGUID: DI5DS5DZSLOoTpEq0SB7gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="268683393"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Aug 2026 02:35:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwGEE-00000000eEA-3UDj;
	Tue, 18 Aug 2026 09:35:30 +0000
Date: Tue, 18 Aug 2026 17:35:16 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 [mcgrof:blk-iobuf-pool-v5-premap-iova-pgsize-clamp-param-test 16/23]
 drivers/iommu/dma-iommu-test.c:181:undefined reference to
 `kunit_binary_assert_format'
Message-ID: <202608181747.TxSZV1sh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v5-premap-iova-pgsize-clamp-param-test
head:   23b3f1b3b97e1cab7154f5a36b596f91670e4faa
commit: f97e67079ec9c01e1e14856a0bcc8d280c0e7376 [16/23] selftests: add DMA IOVA page-size coverage
config: x86_64-randconfig-014-20260818 (https://download.01.org/0day-ci/archive/20260818/202608181747.TxSZV1sh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181747.TxSZV1sh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181747.TxSZV1sh-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/iommu/dma-iommu-test.o: in function `dma_iova_pgsize_partial_unwind_test':
>> drivers/iommu/dma-iommu-test.c:181:(.text+0x68c): undefined reference to `kunit_binary_assert_format'
>> ld: drivers/iommu/dma-iommu-test.c:181:(.text+0x6bd): undefined reference to `__kunit_do_failed_assertion'
>> ld: drivers/iommu/dma-iommu-test.c:179:(.text+0x6d5): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:179:(.text+0x706): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:180:(.text+0x71c): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:180:(.text+0x74d): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:182:(.text+0x763): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:182:(.text+0x794): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.o: in function `dma_iova_legacy_small_leaf_test':
   drivers/iommu/dma-iommu-test.c:155:(.text+0xc35): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:155:(.text+0xc60): undefined reference to `__kunit_do_failed_assertion'
>> ld: drivers/iommu/dma-iommu-test.c:155:(.text+0xc6d): undefined reference to `__kunit_abort'
   ld: drivers/iommu/dma-iommu-test.c:156:(.text+0xc7e): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:156:(.text+0xcaf): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:158:(.text+0xccc): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:158:(.text+0xcf6): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:167:(.text+0xd0c): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:167:(.text+0xd3d): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:159:(.text+0xd53): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:159:(.text+0xd84): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:166:(.text+0xd9c): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:166:(.text+0xdcd): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:157:(.text+0xdea): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:157:(.text+0xe14): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.o: in function `dma_iova_pgsize_core_map_test':
   drivers/iommu/dma-iommu-test.c:137:(.text+0x12ea): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:137:(.text+0x1315): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:137:(.text+0x1322): undefined reference to `__kunit_abort'
   ld: drivers/iommu/dma-iommu-test.c:138:(.text+0x1333): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:138:(.text+0x1364): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:140:(.text+0x1381): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:140:(.text+0x13ab): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:141:(.text+0x13c8): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:141:(.text+0x13f2): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:142:(.text+0x1408): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:142:(.text+0x1439): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:139:(.text+0x1456): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:139:(.text+0x1480): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.o: in function `dma_iova_pgsize_alignment_test':
   drivers/iommu/dma-iommu-test.c:31:(.text+0x1771): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:31:(.text+0x1799): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:35:(.text+0x17ae): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:35:(.text+0x17d6): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.o: in function `dma_iova_pgsize_unsupported_test':
   drivers/iommu/dma-iommu-test.c:24:(.text+0x19af): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:24:(.text+0x19d7): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.o: in function `dma_iova_pgsize_invalid_test':
   drivers/iommu/dma-iommu-test.c:13:(.text+0x1c61): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:13:(.text+0x1c89): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:17:(.text+0x1c9e): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:17:(.text+0x1cc6): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:10:(.text+0x1cdb): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:10:(.text+0x1d03): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.o: in function `dma_iova_pgsize_valid_test':
   drivers/iommu/dma-iommu-test.c:56:(.text+0x1f72): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:56:(.text+0x1f9a): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:60:(.text+0x1faf): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:60:(.text+0x1fd7): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.o: in function `dma_iova_link_alignment_test':
   drivers/iommu/dma-iommu-test.c:46:(.text+0x22a4): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:46:(.text+0x22cc): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:49:(.text+0x22e1): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:49:(.text+0x2309): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.c:43:(.text+0x231e): undefined reference to `kunit_binary_assert_format'
   ld: drivers/iommu/dma-iommu-test.c:43:(.text+0x2346): undefined reference to `__kunit_do_failed_assertion'


vim +181 drivers/iommu/dma-iommu-test.c

   146	
   147	static void dma_iova_legacy_small_leaf_test(struct kunit *test)
   148	{
   149		struct dma_iova_test_domain test_domain;
   150		int ret;
   151	
   152		dma_iova_test_domain_init(&test_domain);
   153		ret = iommu_map_nosync(&test_domain.domain, SZ_4K, SZ_4K, SZ_64K,
   154				IOMMU_READ, GFP_KERNEL);
 > 155		KUNIT_ASSERT_EQ(test, ret, 0);
   156		KUNIT_EXPECT_EQ(test, test_domain.map_calls, (size_t)1);
   157		KUNIT_EXPECT_EQ(test, test_domain.min_pgsize, (size_t)SZ_4K);
   158		KUNIT_EXPECT_EQ(test, test_domain.mapped_bytes, (size_t)SZ_64K);
   159		KUNIT_EXPECT_EQ(test,
   160			iommu_unmap(&test_domain.domain, SZ_4K, SZ_64K),
   161			(size_t)SZ_64K);
   162	
   163		dma_iova_test_domain_init(&test_domain);
   164		ret = iommu_map_nosync_pgsized(&test_domain.domain, SZ_4K, SZ_4K,
   165				SZ_64K, SZ_2M, IOMMU_READ, GFP_KERNEL);
   166		KUNIT_EXPECT_EQ(test, ret, -EINVAL);
   167		KUNIT_EXPECT_EQ(test, test_domain.map_calls, (size_t)0);
   168	}
   169	
   170	static void dma_iova_pgsize_partial_unwind_test(struct kunit *test)
   171	{
   172		struct dma_iova_test_domain test_domain;
   173		int ret;
   174	
   175		dma_iova_test_domain_init(&test_domain);
   176		test_domain.fail_partial = true;
   177		ret = iommu_map_nosync_pgsized(&test_domain.domain, SZ_2M, SZ_2M,
   178				2 * SZ_2M, SZ_2M, IOMMU_READ, GFP_KERNEL);
 > 179		KUNIT_EXPECT_EQ(test, ret, -ENOMEM);
   180		KUNIT_EXPECT_EQ(test, test_domain.map_calls, (size_t)1);
 > 181		KUNIT_EXPECT_EQ(test, test_domain.mapped_bytes, (size_t)SZ_2M);
   182		KUNIT_EXPECT_EQ(test, test_domain.unmapped_bytes, (size_t)SZ_2M);
   183	}
   184	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
