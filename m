Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DFC1C01
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 03:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710386188; cv=none; b=U8mk8UpJV/I/xIwhICkw6tRN9qMsgpHBQFxgkB5M0gz43jYECJTPvS88+8Ajvj1k91tdt0WPgKXUKyX3RH0emEl+qN9qZLhUpFMWEmJWEpXzZlFi/UBEVe4WKcKD0Si1SIup+tIl9gT807tR2BSapD/aOa1ZV2LvYUgchDwpvHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710386188; c=relaxed/simple;
	bh=klZfh6HYlGq58scHufDV1DJIiy4kT4j7lkwyQ+Pmui8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MblRGhBOV0xiVpk77rYBFT/B/mC383Jt6bcnCurHUU3xN4xpBsOG1mbIUBZmCuXYmX5I04goiZaU95PgF4sqm0EnbizdnsGKPXe8swLzjxtuCxqIlTCxaCkMyXlg1D8ILb17PiVrr7YCE21UF/9daimDov/CYkrQYCe563KT+tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6gA3Sh3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6gA3Sh3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710386186; x=1741922186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=klZfh6HYlGq58scHufDV1DJIiy4kT4j7lkwyQ+Pmui8=;
  b=M6gA3Sh3wY6bxenzSBN3Vxivk38kIXWHZ8X0VBsqlD4Uc1VZOy0pVhKh
   Rj0Xjvm6TeYG7AZ56P3sd0f8ZlQOwoH8x52RlD3efkDk0hnTTzwsVCZnT
   QHF+39TEo46kAa/70Y7KnxfVq+flEED7bfLzMgFst9XLLkRYArI0hPtut
   nS4pCDuPgAzGQK74Mstc+nuMlXJ152F+WHyD1e5P9kFnGkO8zz5S/op6a
   pCibY5mQMVXK5mvhqpdAmys9Th9UzNhI20R9/MgdAFkW/Euf37LP7Yq2C
   9rdi9uHxIjXUewYVi+IaFkLPqBceydBuRVAicrs7ihvan58qbnnWGu/NX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="8965897"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="8965897"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 20:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="12162415"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Mar 2024 20:16:15 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkbZj-000D0h-1N;
	Thu, 14 Mar 2024 03:16:11 +0000
Date: Thu, 14 Mar 2024 11:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/iommu/dma-iommu.c:203:30: error: 'host_pasid_set'
 undeclared; did you mean 'ioasid_set'?
Message-ID: <202403141132.GJZdRcJ3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   c13208f42a275b32080b8b1f05865c408364ef9f
commit: 996d1fdcf14af721ac84d6c9360b39f804daeeb4 iommu/vtd: Fix vIOMMU GIOVA by avoiding reserved IOASIDs
date:   9 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240314/202403141132.GJZdRcJ3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141132.GJZdRcJ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141132.GJZdRcJ3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/iommu.h:16,
                    from include/linux/dma-iommu.h:13,
                    from drivers/iommu/dma-iommu.c:14:
   include/linux/ioasid.h:214:51: error: unknown type name 'ioasid_set_type'
     214 |                                                   ioasid_set_type type)
         |                                                   ^~~~~~~~~~~~~~~
   drivers/iommu/dma-iommu.c: In function 'iommu_enable_pasid_dma':
>> drivers/iommu/dma-iommu.c:203:30: error: 'host_pasid_set' undeclared (first use in this function); did you mean 'ioasid_set'?
     203 |         pasid = ioasid_alloc(host_pasid_set, IOASID_ALLOC_BASE, PCI_PASID_MAX, dev);
         |                              ^~~~~~~~~~~~~~
         |                              ioasid_set
   drivers/iommu/dma-iommu.c:203:30: note: each undeclared identifier is reported only once for each function it appears in
   drivers/iommu/dma-iommu.c: In function 'iommu_disable_pasid_dma':
   drivers/iommu/dma-iommu.c:245:29: error: 'host_pasid_set' undeclared (first use in this function); did you mean 'ioasid_set'?
     245 |                 ioasid_free(host_pasid_set, dev->pasid);
         |                             ^~~~~~~~~~~~~~
         |                             ioasid_set


vim +203 drivers/iommu/dma-iommu.c

  > 14	#include <linux/dma-iommu.h>
    15	#include <linux/dma-noncoherent.h>
    16	#include <linux/gfp.h>
    17	#include <linux/huge_mm.h>
    18	#include <linux/iommu.h>
    19	#include <linux/iova.h>
    20	#include <linux/irq.h>
    21	#include <linux/mm.h>
    22	#include <linux/mutex.h>
    23	#include <linux/pci.h>
    24	#include <linux/swiotlb.h>
    25	#include <linux/scatterlist.h>
    26	#include <linux/vmalloc.h>
    27	#include <linux/crash_dump.h>
    28	#include <linux/dma-direct.h>
    29	
    30	struct iommu_dma_msi_page {
    31		struct list_head	list;
    32		dma_addr_t		iova;
    33		phys_addr_t		phys;
    34	};
    35	
    36	enum iommu_dma_cookie_type {
    37		IOMMU_DMA_IOVA_COOKIE,
    38		IOMMU_DMA_MSI_COOKIE,
    39	};
    40	
    41	struct iommu_dma_cookie {
    42		enum iommu_dma_cookie_type	type;
    43		union {
    44			/* Full allocator for IOMMU_DMA_IOVA_COOKIE */
    45			struct iova_domain	iovad;
    46			/* Trivial linear page allocator for IOMMU_DMA_MSI_COOKIE */
    47			dma_addr_t		msi_iova;
    48		};
    49		struct list_head		msi_page_list;
    50	
    51		/* Domain for flush queue callback; NULL if flush queue not in use */
    52		struct iommu_domain		*fq_domain;
    53	};
    54	
    55	static DEFINE_STATIC_KEY_FALSE(iommu_deferred_attach_enabled);
    56	bool iommu_dma_forcedac __read_mostly;
    57	
    58	static int __init iommu_dma_forcedac_setup(char *str)
    59	{
    60		int ret = kstrtobool(str, &iommu_dma_forcedac);
    61	
    62		if (!ret && iommu_dma_forcedac)
    63			pr_info("Forcing DAC for PCI devices\n");
    64		return ret;
    65	}
    66	early_param("iommu.forcedac", iommu_dma_forcedac_setup);
    67	
    68	static void iommu_dma_entry_dtor(unsigned long data)
    69	{
    70		struct page *freelist = (struct page *)data;
    71	
    72		while (freelist) {
    73			unsigned long p = (unsigned long)page_address(freelist);
    74	
    75			freelist = freelist->freelist;
    76			free_page(p);
    77		}
    78	}
    79	
    80	static inline size_t cookie_msi_granule(struct iommu_dma_cookie *cookie)
    81	{
    82		if (cookie->type == IOMMU_DMA_IOVA_COOKIE)
    83			return cookie->iovad.granule;
    84		return PAGE_SIZE;
    85	}
    86	
    87	static struct iommu_dma_cookie *cookie_alloc(enum iommu_dma_cookie_type type)
    88	{
    89		struct iommu_dma_cookie *cookie;
    90	
    91		cookie = kzalloc(sizeof(*cookie), GFP_KERNEL);
    92		if (cookie) {
    93			INIT_LIST_HEAD(&cookie->msi_page_list);
    94			cookie->type = type;
    95		}
    96		return cookie;
    97	}
    98	
    99	/**
   100	 * iommu_get_dma_cookie - Acquire DMA-API resources for a domain
   101	 * @domain: IOMMU domain to prepare for DMA-API usage
   102	 *
   103	 * IOMMU drivers should normally call this from their domain_alloc
   104	 * callback when domain->type == IOMMU_DOMAIN_DMA.
   105	 */
   106	int iommu_get_dma_cookie(struct iommu_domain *domain)
   107	{
   108		if (domain->iova_cookie)
   109			return -EEXIST;
   110	
   111		domain->iova_cookie = cookie_alloc(IOMMU_DMA_IOVA_COOKIE);
   112		if (!domain->iova_cookie)
   113			return -ENOMEM;
   114	
   115		return 0;
   116	}
   117	EXPORT_SYMBOL(iommu_get_dma_cookie);
   118	
   119	/**
   120	 * iommu_get_msi_cookie - Acquire just MSI remapping resources
   121	 * @domain: IOMMU domain to prepare
   122	 * @base: Start address of IOVA region for MSI mappings
   123	 *
   124	 * Users who manage their own IOVA allocation and do not want DMA API support,
   125	 * but would still like to take advantage of automatic MSI remapping, can use
   126	 * this to initialise their own domain appropriately. Users should reserve a
   127	 * contiguous IOVA region, starting at @base, large enough to accommodate the
   128	 * number of PAGE_SIZE mappings necessary to cover every MSI doorbell address
   129	 * used by the devices attached to @domain.
   130	 */
   131	int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base)
   132	{
   133		struct iommu_dma_cookie *cookie;
   134	
   135		if (domain->type != IOMMU_DOMAIN_UNMANAGED)
   136			return -EINVAL;
   137	
   138		if (domain->iova_cookie)
   139			return -EEXIST;
   140	
   141		cookie = cookie_alloc(IOMMU_DMA_MSI_COOKIE);
   142		if (!cookie)
   143			return -ENOMEM;
   144	
   145		cookie->msi_iova = base;
   146		domain->iova_cookie = cookie;
   147		return 0;
   148	}
   149	EXPORT_SYMBOL(iommu_get_msi_cookie);
   150	
   151	/**
   152	 * iommu_put_dma_cookie - Release a domain's DMA mapping resources
   153	 * @domain: IOMMU domain previously prepared by iommu_get_dma_cookie() or
   154	 *          iommu_get_msi_cookie()
   155	 *
   156	 * IOMMU drivers should normally call this from their domain_free callback.
   157	 */
   158	void iommu_put_dma_cookie(struct iommu_domain *domain)
   159	{
   160		struct iommu_dma_cookie *cookie = domain->iova_cookie;
   161		struct iommu_dma_msi_page *msi, *tmp;
   162	
   163		if (!cookie)
   164			return;
   165	
   166		if (cookie->type == IOMMU_DMA_IOVA_COOKIE && cookie->iovad.granule)
   167			put_iova_domain(&cookie->iovad);
   168	
   169		list_for_each_entry_safe(msi, tmp, &cookie->msi_page_list, list) {
   170			list_del(&msi->list);
   171			kfree(msi);
   172		}
   173		kfree(cookie);
   174		domain->iova_cookie = NULL;
   175	}
   176	EXPORT_SYMBOL(iommu_put_dma_cookie);
   177	
   178	#define PCI_PASID_MAX 0x100000 /* TODO: Use per dev limits */
   179	/**
   180	 * iommu_enable_pasid_dma --Enable in-kernel DMA request with PASID
   181	 * @dev:	Device to be enabled
   182	 *
   183	 * DMA request with PASID will be mapped the same way as the legacy DMA.
   184	 * If the device is in pass-through, PASID will also pass-through. If the
   185	 * device is in IOVA map, the supervisor PASID will point to the same IOVA
   186	 * page table.
   187	 *
   188	 * @return the kernel PASID to be used for DMA or INVALID_IOASID on failure
   189	 */
   190	ioasid_t iommu_enable_pasid_dma(struct device *dev)
   191	{
   192		struct iommu_domain *dom;
   193		u32 pasid;
   194	
   195		if (dev->pasid) {
   196			dev_err(dev, "PASID DMA already enabled\n");
   197			return dev->pasid;
   198		}
   199		dom = iommu_get_domain_for_dev(dev);
   200		if (!dom || !dom->ops)
   201			return INVALID_IOASID;
   202	
 > 203		pasid = ioasid_alloc(host_pasid_set, IOASID_ALLOC_BASE, PCI_PASID_MAX, dev);
   204		dev_alert(dev, "%s: PASID %u\n", __func__, pasid);
   205		/*
   206		 * Use the reserved kernel PASID for all devices. For now,
   207		 * there is no need to have different PASIDs for in-kernel use.
   208		 */
   209		if (!dom->ops->enable_pasid_dma || dom->ops->enable_pasid_dma(dev, pasid))
   210			return INVALID_IOASID;
   211		/* Used for device IOTLB flush */
   212		dev->pasid = pasid;
   213	
   214		return pasid;
   215	}
   216	EXPORT_SYMBOL(iommu_enable_pasid_dma);
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
