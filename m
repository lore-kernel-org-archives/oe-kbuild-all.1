Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F2E2C95
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728723662; cv=none; b=Da/PUagQpJNyaii9ZCp3QBzDK3xMKlsVx4lgw1424PfsPS20mwoGEj8Gpsqt81Q9+z5wWLGUJbbKlJ40TeK4g4Bw/UEM9t1L7FIqc/i7CyL/rE+X2Aasq/HS1Zh8YJY0E2Dhwv0yVtcvY82SnvU/JeTpwk/fDhM/2ZKrXZwQ4FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728723662; c=relaxed/simple;
	bh=TTBGl4/YBYtmcNjBtv7Lea8USwQFOxA9IGlg4S0mLsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G6CPCaR8g2GtEzOYwudxCQtdiEO0gIE1RXLYD/UqoczE3oLZWjy95SNgL31zWmO8FQ0X+RwAkTcHDO3xlmLjgqNJk2pdwKokGiwVHY1UE47VofhA4xcAAvQEA1ytn5WqwKM2SXumrO0h/LDIcAYkSCgAijhxhuzaS0mbzZ4J1K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5XNzMoV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5XNzMoV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728723661; x=1760259661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TTBGl4/YBYtmcNjBtv7Lea8USwQFOxA9IGlg4S0mLsQ=;
  b=Q5XNzMoVsWqFSK+98HxGLtqbO7MB0v+HoPdDh1BCiKSIL91qqggGLH0s
   1G1iPV3LxfCb37U5foi48UcTK2S6NBnrPMKTxbfTXQmwYwdyhsqCaIuW9
   pTuvmjECzR3RnTtst4nocFJ+GZaHCpq2D1EQ2I3sfJIKwg7/ZBXcJw/eo
   2pBG3N6RO9URaonW5Ak29ry9qk+49KUsgok6/1adjtbyXAmE3cS3XhJOo
   sqcZdvUY2Q3D1rQK9j7bdWmClRVhjfokC+8iNGuZSagGpNsCfs874RPGV
   xwiGgJNPCzISHbC4CvrgbTWRmfMX8282loTfIcQgjfJdrM2WMZrd3jFtF
   w==;
X-CSE-ConnectionGUID: 3++DKAUhTCyrI4SiXKJGBg==
X-CSE-MsgGUID: MmuOkrxbSi6/O3Te+7s12Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31003384"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="31003384"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 02:01:00 -0700
X-CSE-ConnectionGUID: sZqYLt6zSLuOEZ09Pm4Fsw==
X-CSE-MsgGUID: AXD+8nwWT2yJTmO/67g6cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="76759012"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Oct 2024 02:00:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szXzc-000DEN-1n;
	Sat, 12 Oct 2024 09:00:56 +0000
Date: Sat, 12 Oct 2024 17:00:41 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommu_pt 29/34]
 drivers/iommu/generic_pt/kunit_iommu_cmp.h: linux/timekeeping.h is included
 more than once.
Message-ID: <202410121607.kmSFoKKE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   873664ab338f94157d55587c4bb5f3978e37dda0
commit: 1959ca31ccd4edaf43f47755bdd4b45e509a8ce1 [29/34] iommupt: Add kunit test to benchmark page table operations
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121607.kmSFoKKE-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/iommu/generic_pt/kunit_iommu_cmp.h: linux/timekeeping.h is included more than once.

vim +27 drivers/iommu/generic_pt/kunit_iommu_cmp.h

    25	
    26	/* ktime related definitions */
  > 27	#include <linux/timekeeping.h>
    28	
    29	struct compare_map_timings {
    30		ktime_t map_genpt_ns;
    31		ktime_t map_iopt_ns;
    32	};
    33	
    34	struct compare_unmap_timings {
    35		ktime_t unmap_genpt_ns;
    36		ktime_t unmap_iopt_ns;
    37	};
    38	
    39	struct compare_timings {
    40		struct compare_map_timings map_time;
    41		struct compare_unmap_timings unmap_time;
    42	};
    43	
    44	#endif
    45	
    46	struct compare_tables {
    47		struct kunit *test;
    48		struct pt_range ref_range;
    49		struct pt_table_p *ref_table;
    50	};
    51	
    52	static int __compare_tables(struct pt_range *range, void *arg,
    53				    unsigned int level, struct pt_table_p *table)
    54	{
    55		struct pt_state pts = pt_init(range, level, table);
    56		struct compare_tables *cmp = arg;
    57		struct pt_state ref_pts =
    58			pt_init(&cmp->ref_range, level, cmp->ref_table);
    59		struct kunit *test = cmp->test;
    60		int ret;
    61	
    62		for_each_pt_level_item(&pts) {
    63			u64 entry, ref_entry;
    64	
    65			cmp->ref_range.va = range->va;
    66			ref_pts.index = pts.index;
    67			pt_load_entry(&ref_pts);
    68	
    69			entry = pt_kunit_cmp_mask_entry(&pts);
    70			ref_entry = pt_kunit_cmp_mask_entry(&ref_pts);
    71	
    72			/*if (entry != 0 || ref_entry != 0)
    73				printk("Check %llx Level %u index %u ptr %px refptr %px: %llx (%llx) %llx (%llx)\n",
    74				       pts.range->va, pts.level, pts.index,
    75				       pts.table,
    76				       ref_pts.table,
    77				       pts.entry, entry,
    78				       ref_pts.entry, ref_entry);*/
    79	
    80			KUNIT_ASSERT_EQ(test, pts.type, ref_pts.type);
    81			KUNIT_ASSERT_EQ(test, entry, ref_entry);
    82			if (entry != ref_entry)
    83				return 0;
    84	
    85			if (pts.type == PT_ENTRY_TABLE) {
    86				cmp->ref_table = ref_pts.table_lower;
    87				ret = pt_descend(&pts, arg, __compare_tables);
    88				if (ret)
    89					return ret;
    90			}
    91	
    92			/* Defeat contiguous entry aggregation */
    93			pts.type = PT_ENTRY_EMPTY;
    94		}
    95	
    96		return 0;
    97	}
    98	
    99	static void compare_tables(struct kunit *test)
   100	{
   101		struct kunit_iommu_cmp_priv *cmp_priv = test->priv;
   102		struct kunit_iommu_priv *priv = &cmp_priv->fmt;
   103		struct pt_range range = pt_top_range(priv->common);
   104		struct compare_tables cmp = {
   105			.test = test,
   106		};
   107		struct pt_state pts = pt_init_top(&range);
   108		struct pt_state ref_pts;
   109	
   110		pt_iommu_setup_ref_table(&cmp_priv->ref_table, cmp_priv->pgtbl_ops);
   111		cmp.ref_range =
   112			pt_top_range(common_from_iommu(&cmp_priv->ref_table.iommu));
   113		ref_pts = pt_init_top(&cmp.ref_range);
   114		KUNIT_ASSERT_EQ(test, pts.level, ref_pts.level);
   115	
   116		cmp.ref_table = ref_pts.table;
   117		KUNIT_ASSERT_EQ(test, pt_walk_range(&range, __compare_tables, &cmp), 0);
   118	}
   119	
   120	static void test_cmp_init(struct kunit *test)
   121	{
   122		struct kunit_iommu_cmp_priv *cmp_priv = test->priv;
   123		struct kunit_iommu_priv *priv = &cmp_priv->fmt;
   124		struct io_pgtable_cfg *pgtbl_cfg =
   125			&io_pgtable_ops_to_pgtable(cmp_priv->pgtbl_ops)->cfg;
   126	
   127		/* Fixture does the setup */
   128		KUNIT_ASSERT_NE(test, priv->info.pgsize_bitmap, 0);
   129	
   130		/* pt_iommu has a superset of page sizes (ARM supports contiguous) */
   131		KUNIT_ASSERT_EQ(test,
   132				priv->info.pgsize_bitmap & pgtbl_cfg->pgsize_bitmap,
   133				pgtbl_cfg->pgsize_bitmap);
   134	
   135		/* Empty compare works */
   136		compare_tables(test);
   137	}
   138	
   139	static void do_cmp_map(struct kunit *test, pt_vaddr_t va, pt_oaddr_t pa,
   140			       pt_oaddr_t len, unsigned int prot)
   141	{
   142		struct kunit_iommu_cmp_priv *cmp_priv = test->priv;
   143		struct kunit_iommu_priv *priv = &cmp_priv->fmt;
   144		const struct pt_iommu_ops *ops = priv->iommu->ops;
   145		size_t mapped;
   146		int ret;
   147	
   148		/* This lacks pagination, must call with perfectly aligned everything */
   149		if (sizeof(unsigned long) == 8) {
   150			KUNIT_ASSERT_EQ(test, va % len, 0);
   151			KUNIT_ASSERT_EQ(test, pa % len, 0);
   152		}
   153	
   154		mapped = 0;
   155		ret = ops->map_range(priv->iommu, va, pa, len, prot, GFP_KERNEL,
   156				     &mapped, NULL);
   157		KUNIT_ASSERT_EQ(test, ret, 0);
   158		KUNIT_ASSERT_EQ(test, mapped, len);
   159	
   160		mapped = 0;
   161		ret = cmp_priv->pgtbl_ops->map_pages(cmp_priv->pgtbl_ops, va, pa, len,
   162						     1, prot, GFP_KERNEL, &mapped);
   163		KUNIT_ASSERT_EQ(test, ret, 0);
   164		KUNIT_ASSERT_EQ(test, mapped, len);
   165	}
   166	
   167	static void do_cmp_unmap(struct kunit *test, pt_vaddr_t va, pt_vaddr_t len)
   168	{
   169		struct kunit_iommu_cmp_priv *cmp_priv = test->priv;
   170		struct kunit_iommu_priv *priv = &cmp_priv->fmt;
   171		const struct pt_iommu_ops *ops = priv->iommu->ops;
   172		size_t ret;
   173	
   174		if (sizeof(unsigned long) != 4)
   175			KUNIT_ASSERT_EQ(test, va % len, 0);
   176	
   177		ret = ops->unmap_range(priv->iommu, va, len, NULL);
   178		KUNIT_ASSERT_EQ(test, ret, len);
   179		ret = cmp_priv->pgtbl_ops->unmap_pages(cmp_priv->pgtbl_ops, va, len, 1,
   180						       NULL);
   181		KUNIT_ASSERT_EQ(test, ret, len);
   182	}
   183	
   184	#if IS_ENABLED(CONFIG_IOMMU_PT_KUNIT_BENCHMARK)
   185	
 > 186	#include <linux/timekeeping.h>
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
