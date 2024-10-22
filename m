Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D433F19AD9B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 17:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729618735; cv=none; b=YuGBgIBuLKjXyNqltIOiqa9JYqN+EaWtABVTPA96uIbUnAoLqeRRTCK8RNW9EthcKOgbwKhVRdFcFqVqWYplVQS61Xc98ZjBRE5NxN1YPqIdLVHVfzsuIjIrZAKh0/+yCmYxQIUF6LoVVR8NYaTwSSMQuJly5SbMfdSLehlZ7WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729618735; c=relaxed/simple;
	bh=yGBgtY1WeovcKvai4gRVnFgLPBd/TrBgV1BuJcnUtfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaIaTH61IB0MmIUOzdMmEFQ6Xze6GXZ0D+c7R9bi5oNxLmsqULnBV3Ef3Us++RqpLfEJVVExRVHgmoBirbsZzOtFN0ue3MjYTXqYs3SEY2kaO+LckgsVAbs7QfMgugeYDjNXH9HIEZYaQRrTjEaz5cr3afZFkfmIj6HcsOYq+bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAVoq1Ay; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAVoq1Ay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729618734; x=1761154734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yGBgtY1WeovcKvai4gRVnFgLPBd/TrBgV1BuJcnUtfE=;
  b=OAVoq1AyJG6B8xP8GB9++soAM+6OAgiMXL8boWL1JktzyT4LLw3VLWFf
   7sOiiZToAlA+zsgrBmj2zKOMgITEANYUyspo7d7BwH6wOI0BuFjWfh8wu
   OLHFd4kGlwojQKbRvuj2iICBvflL0wW14DW38kMKLD1iXf+RlVjE92Isx
   xu1FVPk2PUe8u5RqyXtPMq1DGmlaGranX5JH3aD8AKcFRZtS0SDL/7AZC
   ldeIT5FprKq5plLkZXqPhuAAfetJIOxT8bmSi+5EmPEF6jv/WdhFyflbE
   n85E0xQ0ulEpZEBuy/bfd78EI3EieJHPs08EIWaSwuF88xEv0lvVwFSWb
   Q==;
X-CSE-ConnectionGUID: 6BcvdomzQequeFQ1Blfg9A==
X-CSE-MsgGUID: 3HFJQj+zT7mpFUW7/Ja9QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29048614"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29048614"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 10:38:53 -0700
X-CSE-ConnectionGUID: L2f/KJ/QTy2uI+2p0hQCBA==
X-CSE-MsgGUID: TgPfvSFLR4C5gBh4gce7jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="103234596"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Oct 2024 10:38:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3IqH-000Tsx-0h;
	Tue, 22 Oct 2024 17:38:49 +0000
Date: Wed, 23 Oct 2024 01:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com
Cc: oe-kbuild-all@lists.linux.dev, maple-tree@lists.infradead.org,
	linux-mm@kvack.org, Wei Yang <richard.weiyang@gmail.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH v4 5/5] maple_tree: add a test checking storing null
Message-ID: <202410230105.UApdwd9S-lkp@intel.com>
References: <20241019023716.4516-6-richard.weiyang@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019023716.4516-6-richard.weiyang@gmail.com>

Hi Wei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on akpm-mm/mm-everything linus/master v6.12-rc4 next-20241022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/maple_tree-print-empty-for-an-empty-tree-on-mt_dump/20241019-103832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20241019023716.4516-6-richard.weiyang%40gmail.com
patch subject: [PATCH v4 5/5] maple_tree: add a test checking storing null
config: x86_64-randconfig-123-20241022 (https://download.01.org/0day-ci/archive/20241023/202410230105.UApdwd9S-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230105.UApdwd9S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410230105.UApdwd9S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/test_maple_tree.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
   lib/test_maple_tree.c:1456:9: sparse:     expected void const *entry
   lib/test_maple_tree.c:1456:9: sparse:     got void [noderef] __rcu *ma_root
>> lib/test_maple_tree.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
   lib/test_maple_tree.c:1456:9: sparse:     expected void const *entry
   lib/test_maple_tree.c:1456:9: sparse:     got void [noderef] __rcu *ma_root
   lib/test_maple_tree.c:1468:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
   lib/test_maple_tree.c:1468:9: sparse:     expected void const *entry
   lib/test_maple_tree.c:1468:9: sparse:     got void [noderef] __rcu *ma_root
   lib/test_maple_tree.c:1468:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
   lib/test_maple_tree.c:1468:9: sparse:     expected void const *entry
   lib/test_maple_tree.c:1468:9: sparse:     got void [noderef] __rcu *ma_root

vim +1456 lib/test_maple_tree.c

  1389	
  1390	static noinline void __init check_store_null(struct maple_tree *mt)
  1391	{
  1392		MA_STATE(mas, mt, 0, ULONG_MAX);
  1393	
  1394		/*
  1395		 * Store NULL at range [0, ULONG_MAX] to an empty tree should result
  1396		 * in an empty tree
  1397		 */
  1398		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
  1399		mas_lock(&mas);
  1400		mas_store_gfp(&mas, NULL, GFP_KERNEL);
  1401		MT_BUG_ON(mt, !mtree_empty(mt));
  1402		mas_unlock(&mas);
  1403		mtree_destroy(mt);
  1404	
  1405		/*
  1406		 * Store NULL at any range to an empty tree should result in an empty
  1407		 * tree
  1408		 */
  1409		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
  1410		mas_lock(&mas);
  1411		mas_set_range(&mas, 3, 10);
  1412		mas_store_gfp(&mas, NULL, GFP_KERNEL);
  1413		MT_BUG_ON(mt, !mtree_empty(mt));
  1414		mas_unlock(&mas);
  1415		mtree_destroy(mt);
  1416	
  1417		/*
  1418		 * Store NULL at range [0, ULONG_MAX] to a single entry tree should
  1419		 * result in an empty tree
  1420		 */
  1421		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
  1422		mas_lock(&mas);
  1423		mas_set(&mas, 0);
  1424		mas_store_gfp(&mas, &mas, GFP_KERNEL);
  1425		mas_set_range(&mas, 0, ULONG_MAX);
  1426		mas_store_gfp(&mas, NULL, GFP_KERNEL);
  1427		MT_BUG_ON(mt, !mtree_empty(mt));
  1428		mas_unlock(&mas);
  1429		mtree_destroy(mt);
  1430	
  1431		/*
  1432		 * Store NULL at range [0, n] to a single entry tree should
  1433		 * result in an empty tree
  1434		 */
  1435		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
  1436		mas_lock(&mas);
  1437		mas_set(&mas, 0);
  1438		mas_store_gfp(&mas, &mas, GFP_KERNEL);
  1439		mas_set_range(&mas, 0, 5);
  1440		mas_store_gfp(&mas, NULL, GFP_KERNEL);
  1441		MT_BUG_ON(mt, !mtree_empty(mt));
  1442		mas_unlock(&mas);
  1443		mtree_destroy(mt);
  1444	
  1445		/*
  1446		 * Store NULL at range [m, n] where m > 0 to a single entry tree
  1447		 * should still be a single entry tree
  1448		 */
  1449		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
  1450		mas_lock(&mas);
  1451		mas_set(&mas, 0);
  1452		mas_store_gfp(&mas, &mas, GFP_KERNEL);
  1453		mas_set_range(&mas, 2, 5);
  1454		mas_store_gfp(&mas, NULL, GFP_KERNEL);
  1455		MT_BUG_ON(mt, mtree_empty(mt));
> 1456		MT_BUG_ON(mt, xa_is_node(mt->ma_root));
  1457		mas_unlock(&mas);
  1458		mtree_destroy(mt);
  1459	
  1460		/*
  1461		 * Store NULL at range [0, ULONG_MAX] to a tree with node should
  1462		 * result in an empty tree
  1463		 */
  1464		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
  1465		mas_lock(&mas);
  1466		mas_set_range(&mas, 1, 3);
  1467		mas_store_gfp(&mas, &mas, GFP_KERNEL);
  1468		MT_BUG_ON(mt, !xa_is_node(mt->ma_root));
  1469		mas_set_range(&mas, 0, ULONG_MAX);
  1470		mas_store_gfp(&mas, NULL, GFP_KERNEL);
  1471		MT_BUG_ON(mt, !mtree_empty(mt));
  1472		mas_unlock(&mas);
  1473		mtree_destroy(mt);
  1474	}
  1475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
