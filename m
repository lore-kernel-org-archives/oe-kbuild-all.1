Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BCC322E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 16:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687970510; x=1719506510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1X8Fdu5I7viplZH7+3LOG3yBHlfxGb5EBkMTyiKYt4c=;
  b=H+Tvgzv0Oep81qd7gnXn/0ltzNaoR1iYcV5WBdUjJGIwH6zu/NyoJlS6
   09OqcuiPI+H4SbVxBGQ+LqsqHmMNXF78Z97Nm9dFJfGl+2Xbii/lqULdp
   U+ogcNLW2C8GXx74ecG0uw+Zz5t5LolEN3w62LGKs0AzT1yQ7/T/SBJvY
   60CgoI+k9Sv5V7fci0JYIP+GtSKEahxREBUKCBRvddEF8fgaYce7pam4S
   g/NFccQooZVCZPwCKmpu/1g73P+ezrZ4jM+sPywXIwduaXlk6M1qTMWMR
   1mOzoIK5qQ5fbfyxTZivxJ37Udesc6b5h07Ibquzuk42Q0Gr9b7OIMp7y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="346663790"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="346663790"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 09:41:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="1047483498"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="1047483498"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jun 2023 09:41:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEYEl-000DNd-28;
	Wed, 28 Jun 2023 16:41:47 +0000
Date: Thu, 29 Jun 2023 00:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-wip 2/5] drivers/iommu/dma-iommu.c:1612:29:
 warning: unused variable 'iovad'
Message-ID: <202306290050.8K2ZxggM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rust-wip
head:   add608c3e9db6e64e0cde5d883257d6fa6163bea
commit: ca7eb2c9c15ed93f3801f48cf310163e33fce3a1 [2/5] iommu hack for DCP
config: i386-randconfig-r026-20230628 (https://download.01.org/0day-ci/archive/20230629/202306290050.8K2ZxggM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306290050.8K2ZxggM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306290050.8K2ZxggM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/dma-iommu.c: In function 'iommu_dma_get_sgtable':
>> drivers/iommu/dma-iommu.c:1612:29: warning: unused variable 'iovad' [-Wunused-variable]
    1612 |         struct iova_domain *iovad = &cookie->iovad;
         |                             ^~~~~


vim +/iovad +1612 drivers/iommu/dma-iommu.c

06d60728ff5c01 Christoph Hellwig 2019-05-20  1605  
06d60728ff5c01 Christoph Hellwig 2019-05-20  1606  static int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1607  		void *cpu_addr, dma_addr_t dma_addr, size_t size,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1608  		unsigned long attrs)
06d60728ff5c01 Christoph Hellwig 2019-05-20  1609  {
bf8488f5352219 Asahi Lina        2023-03-22  1610  	struct iommu_domain *domain = iommu_get_dma_domain(dev);
bf8488f5352219 Asahi Lina        2023-03-22  1611  	struct iommu_dma_cookie *cookie = domain->iova_cookie;
bf8488f5352219 Asahi Lina        2023-03-22 @1612  	struct iova_domain *iovad = &cookie->iovad;
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1613  	struct page *page;
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1614  	int ret;
06d60728ff5c01 Christoph Hellwig 2019-05-20  1615  
f5ff79fddf0efe Christoph Hellwig 2022-02-26  1616  	if (is_vmalloc_addr(cpu_addr)) {
5cf4537975bbd5 Christoph Hellwig 2019-06-03  1617  		struct page **pages = dma_common_find_pages(cpu_addr);
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1618  
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1619  		if (pages) {
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1620  			return sg_alloc_table_from_pages(sgt, pages,
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1621  					PAGE_ALIGN(size) >> PAGE_SHIFT,
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1622  					0, size, GFP_KERNEL);
06d60728ff5c01 Christoph Hellwig 2019-05-20  1623  		}
06d60728ff5c01 Christoph Hellwig 2019-05-20  1624  
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1625  		page = vmalloc_to_page(cpu_addr);
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1626  	} else {
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1627  		page = virt_to_page(cpu_addr);
06d60728ff5c01 Christoph Hellwig 2019-05-20  1628  	}
06d60728ff5c01 Christoph Hellwig 2019-05-20  1629  
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1630  	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1631  	if (!ret)
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1632  		sg_set_page(sgt->sgl, page, PAGE_ALIGN(size), 0);
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1633  	return ret;
06d60728ff5c01 Christoph Hellwig 2019-05-20  1634  }
06d60728ff5c01 Christoph Hellwig 2019-05-20  1635  

:::::: The code at line 1612 was first introduced by commit
:::::: bf8488f5352219679d7af6c883a02918a815fb76 4k iommu hack

:::::: TO: Asahi Lina <lina@asahilina.net>
:::::: CC: Asahi Lina <lina@asahilina.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
