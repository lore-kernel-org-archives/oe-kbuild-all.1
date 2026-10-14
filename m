Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A041684B0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 02:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791944165; cv=none; b=YQgXET6hzreR9h5cMSvRf8V6J+I3oPDvGb5MgC2sCIN7s70RDilTXNQF2AjnmG2mTy3UNjFbWgiZZRF4nOQ+iDrtSBKmK9XKAyU8ptQda72mIwJhOKNyI3XaZ2T1ndv2tZYJU85ia9VYWI1w72cV3MDFjMDB0X00RHEmZmQPEJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791944165; c=relaxed/simple;
	bh=5KoAtB4DTr9s3x/LKOuWHourSMcarhKZgtKHTceXUiU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VEKE+S6xDu9CkAcjJ59gbJLJVYqEr2p7LyqI+4AKlXSicMIuLR2xOnb1k70NHOs/1/n13+WMlHeV3TYYf4nRmy/uysGmc3tVjboZyPo6qaFY3KsJHpzuxKBgY5+tWytZy5xKxeeNchvk8klWLvM/EsSQvU416u3A8v8DqpIPLJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYbjIJZ5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYbjIJZ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791944163; x=1823480163;
  h=date:from:to:cc:subject:message-id;
  bh=5KoAtB4DTr9s3x/LKOuWHourSMcarhKZgtKHTceXUiU=;
  b=MYbjIJZ5EEyhcXrxcpoDtsUeiJOpXLC58GFyU8JQmQVhXqYQOm+scCtN
   qAZV8pRAP3Kww/CgBnykyrcd30XDnzPF913z4pa+zFPXahTbp5b04/Ik4
   8c2dw5GpiIe9qLeN8ACPx8OubxrRsMSrPglUIs8DCHot0DQbzHBb26Sqq
   mXn+Et1L3NHEg5BFmY4XndLUZdJ+rMudQoDyapiNhLdecUkBOLxA8/C+x
   Av+fUOyFcB7iG6PRjw5Y7McnULf2q8WfsLN/YMc88HnCZb20XVSOqYqg1
   GwXAe23GIXze190JL01Z8CvPsrJMBMs1gotVxXFSTV2p79B3sivwnSwDT
   Q==;
X-CSE-ConnectionGUID: 2ZbaEvcaTCWenAUzJqdFaw==
X-CSE-MsgGUID: ffdL/9TKQkCLA2Z9Ln8vRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="692173"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="692173"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 19:16:02 -0700
X-CSE-ConnectionGUID: 8JLc9IL4TjWb92P7DvYA6Q==
X-CSE-MsgGUID: QzU1LVWdQKyANNWqzNfy2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1406372"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Oct 2026 19:16:01 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGoX8-00000000Aox-3a2z;
	Wed, 14 Oct 2026 02:15:58 +0000
Date: Wed, 14 Oct 2026 04:15:23 +0200
From: kernel test robot <lkp@intel.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [krzk-github:wip/eliza-integration-display-on-early-hwe
 22479/22523] drivers/iommu/of_iommu.c:204:13: warning:
 'of_iommu_derive_resv_regions' defined but not used
Message-ID: <202610140431.Oibtitx2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/krzk/linux wip/eliza-integration-display-on-early-hwe
head:   bc8619ef46818e58ca3d967ab1c52ad66162306a
commit: 65e5b1819ef65430d58df9451428404f2ae889b1 [22479/22523] FROMLIST: iommu: of_iommu: Add support for "iommu-ranges" on a device node
config: sparc-randconfig-r2306-20261014 (https://download.01.org/0day-ci/archive/20261014/202610140431.Oibtitx2-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610140431.Oibtitx2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610140431.Oibtitx2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/of_iommu.c:204:13: warning: 'of_iommu_derive_resv_regions' defined but not used [-Wunused-function]
     204 | static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/of_iommu_derive_resv_regions +204 drivers/iommu/of_iommu.c

   192	
   193	/**
   194	 * of_iommu_derive_resv_regions - derive reserved regions which
   195	 *                                are outside of iommu-ranges
   196	 * @dev: device for which to get reserved regions
   197	 * @list: reserved region list
   198	 *
   199	 * A device can describe its own usable IOVA ranges directly on its node
   200	 * via "iommu-ranges". Everything not under those ranges is derived
   201	 * as a reserved region so the IOMMU allocator won't use it. Entries may
   202	 * appear in any order in the property.
   203	 */
 > 204	static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
   205	{
   206		struct of_iommu_range {
   207			struct list_head node;
   208			phys_addr_t start;
   209			phys_addr_t end;
   210		} *pos, *new, *next_range;
   211		int size, prot = IOMMU_READ | IOMMU_WRITE;
   212		struct iommu_resv_region *region;
   213		const __be32 *maps, *end;
   214		struct list_head *prev;
   215		phys_addr_t next = 0;
   216		LIST_HEAD(ranges);
   217	
   218		maps = of_get_property(dev->of_node, "iommu-ranges", &size);
   219		if (!maps)
   220			return;
   221	
   222		end = maps + size / sizeof(__be32);
   223	
   224		while (maps < end) {
   225			phys_addr_t iova, iova_end;
   226			size_t length;
   227	
   228			maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
   229			if (!maps) {
   230				dev_err(dev, "%pOF: failed to parse iommu-ranges\n",
   231					dev->of_node);
   232				break;
   233			}
   234	
   235			if (!length)
   236				continue;
   237	
   238			iova_end = iova + length - 1;
   239	
   240			if (iova_end < iova) {
   241				dev_err(dev, "%pOF: iommu-ranges overflows address space\n",
   242					dev->of_node);
   243				continue;
   244			}
   245	
   246			prev = &ranges;
   247			list_for_each_entry(pos, &ranges, node) {
   248				if (pos->start > iova)
   249					break;
   250				prev = &pos->node;
   251			}
   252	
   253			new = kmalloc_obj(*new);
   254			if (!new)
   255				continue;
   256	
   257			new->start = iova;
   258			new->end = iova_end;
   259			list_add(&new->node, prev);
   260		}
   261	
   262		if (list_empty(&ranges))
   263			return;
   264	
   265		if (of_dma_is_coherent(dev->of_node))
   266			prot |= IOMMU_CACHE;
   267	
   268		list_for_each_entry_safe(pos, next_range, &ranges, node) {
   269			if (pos->start > next) {
   270				region = iommu_alloc_resv_region(next, pos->start - next, prot,
   271								 IOMMU_RESV_RESERVED, GFP_KERNEL);
   272				if (region)
   273					list_add_tail(&region->list, list);
   274			}
   275	
   276			if (pos->end == PHYS_ADDR_MAX)
   277				goto exit;
   278	
   279			if (pos->end >= next)
   280				next = pos->end + 1;
   281	
   282			list_del(&pos->node);
   283			kfree(pos);
   284		}
   285	
   286		region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
   287						 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
   288		if (region)
   289			list_add_tail(&region->list, list);
   290	
   291	exit:
   292		list_for_each_entry_safe(pos, next_range, &ranges, node) {
   293			list_del(&pos->node);
   294			kfree(pos);
   295		}
   296	}
   297	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
