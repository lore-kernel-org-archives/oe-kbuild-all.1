Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1917210F4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 07:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693207779; x=1724743779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cVsUjoypq/KYkql7yhMPoaF3oTxdWjfYpknXpXwZL6s=;
  b=izDG/C59hwFUuWYrMI2EX3XPZa7ghqEf6vgUQhTlVfIjAR1k38UB6hUq
   5WlImxGs7j+lwLxbzg99nOwVxLyY5nafUds/rWA4JkCC0SlAoqoI+b6ni
   wMXb2UDpSgbj/ud84IAcq/X9NS+T/jslFVltERRTTDOu3CDGs3otVeQK1
   0cR//nEFh/nIJqINC/RwA0IHK9xZgsc+BnZW29R4OFbvxCXHCYD17HPS/
   Ix7/IM4xzal8F+2Mb772f2P/TeCumC7Tk3R90tN64onCly6QyrBLnEin7
   hiWr6DU7mrcLUXTJmp5MB8jYptOzYek+rIyGn9ZVocnL+mc63K6M6ej81
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="372440933"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="372440933"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 00:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="741273388"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="741273388"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 28 Aug 2023 00:29:31 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaWgf-0007g3-29;
	Mon, 28 Aug 2023 07:29:27 +0000
Date: Mon, 28 Aug 2023 15:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-wip 20/21] drivers/iommu/dma-iommu.c:1612:29:
 warning: unused variable 'iovad'
Message-ID: <202308281515.f5yUcddM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rust-wip
head:   a8f31bd038880e11b0786822f42ef8fa6276c303
commit: df42097830d935f6c1e5ca942a6335511b6e27ee [20/21] iommu hack for DCP
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230828/202308281515.f5yUcddM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308281515.f5yUcddM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308281515.f5yUcddM-lkp@intel.com/

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
575249979250ed Asahi Lina        2023-03-22  1610  	struct iommu_domain *domain = iommu_get_dma_domain(dev);
575249979250ed Asahi Lina        2023-03-22  1611  	struct iommu_dma_cookie *cookie = domain->iova_cookie;
575249979250ed Asahi Lina        2023-03-22 @1612  	struct iova_domain *iovad = &cookie->iovad;
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
:::::: 575249979250ed2029744f5293672c9c7427298b 4k iommu hack

:::::: TO: Asahi Lina <lina@asahilina.net>
:::::: CC: Asahi Lina <lina@asahilina.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
