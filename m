Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04913816
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 00:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682555758; x=1714091758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RuDzmxT5fovY55Km7fd1gLjrghXhBBdngOyiUu/h7SQ=;
  b=G1KBgyyU5lZ15TFvsGbfp5VJhQNeWNCYZsb8fgTD4Y+v0t0ar4hH+LT5
   OLXikG13hOoUqWo4t22vdfq44j5PerZI/pAVZz8+wZQV7RXbHb0Z9RIKR
   ut+bfqgx9j/g5fXQF4otQQTvOQKHyT6p46osEjIOCe9ST2IxfglLfJMAI
   edOt7ubbzTuJu3xGPl0YtZMxLP0AQt1je0iUoHUv6QEb9UMbhgo7OX5dk
   jrxowOscs9x9m9JMNrOeSSCajXFLiLh/3nkrz7luT9/DkcUHSQg1z1DZ9
   46wrV/fLjhkiiYoadXuutRfjZInG0rA/M3Ptb5bSQBe+3vACbfLle/Jiq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="410304379"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="410304379"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 17:35:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="724655167"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="724655167"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 26 Apr 2023 17:35:57 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prpc4-0000bq-2R;
	Thu, 27 Apr 2023 00:35:56 +0000
Date: Thu, 27 Apr 2023 08:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-wip 2/69] drivers/iommu/dma-iommu.c:1612:29:
 warning: unused variable 'iovad'
Message-ID: <202304270858.Ax3x7Bb0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rust-wip
head:   967e33995741fcd49dc189f940010f9142f7181a
commit: 0e91faabe6c8fe256d94cd483dfe8dbbcebb6656 [2/69] iommu hack for DCP
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230427/202304270858.Ax3x7Bb0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/AsahiLinux/linux/commit/0e91faabe6c8fe256d94cd483dfe8dbbcebb6656
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/rust-wip
        git checkout 0e91faabe6c8fe256d94cd483dfe8dbbcebb6656
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304270858.Ax3x7Bb0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/dma-iommu.c: In function 'iommu_dma_get_sgtable':
>> drivers/iommu/dma-iommu.c:1612:29: warning: unused variable 'iovad' [-Wunused-variable]
    1612 |         struct iova_domain *iovad = &cookie->iovad;
         |                             ^~~~~


vim +/iovad +1612 drivers/iommu/dma-iommu.c

06d60728ff5c017 Christoph Hellwig 2019-05-20  1605  
06d60728ff5c017 Christoph Hellwig 2019-05-20  1606  static int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
06d60728ff5c017 Christoph Hellwig 2019-05-20  1607  		void *cpu_addr, dma_addr_t dma_addr, size_t size,
06d60728ff5c017 Christoph Hellwig 2019-05-20  1608  		unsigned long attrs)
06d60728ff5c017 Christoph Hellwig 2019-05-20  1609  {
7430adc2c7771fa Asahi Lina        2023-03-22  1610  	struct iommu_domain *domain = iommu_get_dma_domain(dev);
7430adc2c7771fa Asahi Lina        2023-03-22  1611  	struct iommu_dma_cookie *cookie = domain->iova_cookie;
7430adc2c7771fa Asahi Lina        2023-03-22 @1612  	struct iova_domain *iovad = &cookie->iovad;
3fb3378bb1eb290 Christoph Hellwig 2019-05-20  1613  	struct page *page;
3fb3378bb1eb290 Christoph Hellwig 2019-05-20  1614  	int ret;
06d60728ff5c017 Christoph Hellwig 2019-05-20  1615  
f5ff79fddf0efec Christoph Hellwig 2022-02-26  1616  	if (is_vmalloc_addr(cpu_addr)) {
5cf4537975bbd56 Christoph Hellwig 2019-06-03  1617  		struct page **pages = dma_common_find_pages(cpu_addr);
3fb3378bb1eb290 Christoph Hellwig 2019-05-20  1618  
3fb3378bb1eb290 Christoph Hellwig 2019-05-20  1619  		if (pages) {
3fb3378bb1eb290 Christoph Hellwig 2019-05-20  1620  			return sg_alloc_table_from_pages(sgt, pages,
3fb3378bb1eb290 Christoph Hellwig 2019-05-20  1621  					PAGE_ALIGN(size) >> PAGE_SHIFT,
3fb3378bb1eb290 Christoph Hellwig 2019-05-20  1622  					0, size, GFP_KERNEL);
06d60728ff5c017 Christoph Hellwig 2019-05-20  1623  		}
06d60728ff5c017 Christoph Hellwig 2019-05-20  1624  
3fb3378bb1eb290 Christoph Hellwig 2019-05-20  1625  		page = vmalloc_to_page(cpu_addr);
3fb3378bb1eb290 Christoph Hellwig 2019-05-20  1626  	} else {
3fb3378bb1eb290 Christoph Hellwig 2019-05-20  1627  		page = virt_to_page(cpu_addr);
06d60728ff5c017 Christoph Hellwig 2019-05-20  1628  	}
06d60728ff5c017 Christoph Hellwig 2019-05-20  1629  
3fb3378bb1eb290 Christoph Hellwig 2019-05-20  1630  	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
3fb3378bb1eb290 Christoph Hellwig 2019-05-20  1631  	if (!ret)
3fb3378bb1eb290 Christoph Hellwig 2019-05-20  1632  		sg_set_page(sgt->sgl, page, PAGE_ALIGN(size), 0);
3fb3378bb1eb290 Christoph Hellwig 2019-05-20  1633  	return ret;
06d60728ff5c017 Christoph Hellwig 2019-05-20  1634  }
06d60728ff5c017 Christoph Hellwig 2019-05-20  1635  

:::::: The code at line 1612 was first introduced by commit
:::::: 7430adc2c7771fafedee50a458c5554c98bcb9bb 4k iommu hack

:::::: TO: Asahi Lina <lina@asahilina.net>
:::::: CC: Asahi Lina <lina@asahilina.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
