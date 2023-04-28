Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9F4847B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 18:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682705622; x=1714241622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5qGiFp1NPtEg4d23bR4eGtKb05fQuGLEVtFWohyWTIc=;
  b=b7pz0cc+UrAZKS74F/uUddXWRuWCCanHYkx0OMNIC7qyoXT/0T54mR5r
   jytT6w1EJiKtPpX+zpB21v/1cYCwCL2chEqN3UFKbk5VP6UL1dZ5skZFu
   XZ0skZhPjFm/QXSYZOz2NFU58pJi+xdIWTT+OCOTYsp+bPl1Q4/AQW+48
   /kz6JY7dkzPjvOJiJGO1hQbuoEBXzcet1zY7jBfLoFBpjbXmLdlWqbC4G
   alXS8kt4+0kZ+Q6fZC0qjSjb9M5BE7KDmobRJvYp86mkDSZpfRN/m1SQd
   bxJ1XUmS0xqQboI6YeFXhyHRxU2IZfX8DDPo7n5jTmSwLxtohMevE5DTF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="349847668"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="349847668"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 11:13:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="838940650"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="838940650"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2023 11:13:40 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psSbD-0000az-1T;
	Fri, 28 Apr 2023 18:13:39 +0000
Date: Sat, 29 Apr 2023 02:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-rebased 120/187]
 drivers/iommu/dma-iommu.c:1612:29: warning: unused variable 'iovad'
Message-ID: <202304290204.vCBzLMu4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rust-rebased
head:   b9982bbd1f22f2c3041a99849ef8aa0aebf6a4ec
commit: e876952fee79f6cb647607915034cc39d6bcf724 [120/187] iommu hack for DCP
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230429/202304290204.vCBzLMu4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/AsahiLinux/linux/commit/e876952fee79f6cb647607915034cc39d6bcf724
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/rust-rebased
        git checkout e876952fee79f6cb647607915034cc39d6bcf724
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304290204.vCBzLMu4-lkp@intel.com/

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
b550ac18a0158c Asahi Lina        2023-03-22  1610  	struct iommu_domain *domain = iommu_get_dma_domain(dev);
b550ac18a0158c Asahi Lina        2023-03-22  1611  	struct iommu_dma_cookie *cookie = domain->iova_cookie;
b550ac18a0158c Asahi Lina        2023-03-22 @1612  	struct iova_domain *iovad = &cookie->iovad;
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
:::::: b550ac18a0158c8ff482609132e2c7d3aa4e312d 4k iommu hack

:::::: TO: Asahi Lina <lina@asahilina.net>
:::::: CC: Asahi Lina <lina@asahilina.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
