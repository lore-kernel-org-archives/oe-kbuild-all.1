Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C670D17F3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 03:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NND9GMqw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699067232; x=1730603232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m3kSfnrmId7UzJLef/3XfznpxL+AK1bmpPxoLaWXKrY=;
  b=NND9GMqwh5TtvNnjzNgYKIukLb0LsZF8BmX1UHC23Gg82BLMXaW47Y6t
   hnSO1tAou7bOsKjqJ5EtWCIC9ASQQd2rFZGWrDsX03zJ0J4lw8DWKRDmm
   zTCbNTZzs3AM/csPMPJMLiKhs6C8yT+Ry1PULZI4fASba1iy0DcNN1QUT
   ILusN2UfS8QLVsFTbewl/eb7PTzxXLm/T1Jodky2zNzj5+pNHfu5rQKB/
   yd7H0x1qh27vnDSJL2RCBeR8L4/zBFA1I654sSkoaxywOKfH1Uc5e1Dc/
   xuh7Tn0vI6CNoRZnWfdLn9o2azWZ9TFLj6ExPBJm/g3RZ3z/2hRTpAdHe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387943608"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="387943608"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 20:07:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="935282093"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="935282093"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Nov 2023 20:07:09 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz706-0003Jj-2l;
	Sat, 04 Nov 2023 03:07:06 +0000
Date: Sat, 4 Nov 2023 11:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/240-isp 1/56]
 drivers/media/platform/apple/isp/isp-iommu.c:135:35: warning: format '%llx'
 expects argument of type 'long long unsigned int', but argument 3 has type
 'dma_addr_t' {aka 'unsigned int'}
Message-ID: <202311041107.8kClHmbS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   b5b7f780ce17699202c057aff11992dbde545241
commit: f0f1b152058cd2c9ee3a042da1349a1f88663d82 [1/56] media: apple: Add Apple ISP driver
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311041107.8kClHmbS-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041107.8kClHmbS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041107.8kClHmbS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/iommu.h:11,
                    from drivers/media/platform/apple/isp/isp-iommu.c:4:
   drivers/media/platform/apple/isp/isp-iommu.c: In function 'isp_surf_iommu_map':
>> drivers/media/platform/apple/isp/isp-iommu.c:135:35: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     135 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:135:17: note: in expansion of macro 'dev_err'
     135 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:135:73: note: format string is defined here
     135 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                                                                      ~~~^
         |                                                                         |
         |                                                                         long long unsigned int
         |                                                                      %x
   drivers/media/platform/apple/isp/isp-iommu.c: In function '__isp_alloc_surface':
   drivers/media/platform/apple/isp/isp-iommu.c:181:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     181 |                         "failed to iommu_map size 0x%llx to iova 0x%llx\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:180:17: note: in expansion of macro 'dev_err'
     180 |                 dev_err(isp->dev,
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:181:71: note: format string is defined here
     181 |                         "failed to iommu_map size 0x%llx to iova 0x%llx\n",
         |                                                                    ~~~^
         |                                                                       |
         |                                                                       long long unsigned int
         |                                                                    %x
   drivers/media/platform/apple/isp/isp-iommu.c: In function 'isp_alloc_surface_vmap':
   drivers/media/platform/apple/isp/isp-iommu.c:211:35: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     211 |                 dev_err(isp->dev, "failed to vmap iova 0x%llx - 0x%llx\n",
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:211:17: note: in expansion of macro 'dev_err'
     211 |                 dev_err(isp->dev, "failed to vmap iova 0x%llx - 0x%llx\n",
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:211:61: note: format string is defined here
     211 |                 dev_err(isp->dev, "failed to vmap iova 0x%llx - 0x%llx\n",
         |                                                          ~~~^
         |                                                             |
         |                                                             long long unsigned int
         |                                                          %x
   drivers/media/platform/apple/isp/isp-iommu.c: In function 'apple_isp_iommu_map_sgt':
   drivers/media/platform/apple/isp/isp-iommu.c:259:35: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     259 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:259:17: note: in expansion of macro 'dev_err'
     259 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:259:73: note: format string is defined here
     259 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                                                                      ~~~^
         |                                                                         |
         |                                                                         long long unsigned int
         |                                                                      %x


vim +135 drivers/media/platform/apple/isp/isp-iommu.c

   118	
   119	static int isp_surf_iommu_map(struct apple_isp *isp, struct isp_surf *surf)
   120	{
   121		unsigned long size;
   122		int err;
   123	
   124		err = sg_alloc_table_from_pages(&surf->sgt, surf->pages,
   125						surf->num_pages, 0, surf->size,
   126						GFP_KERNEL);
   127		if (err < 0) {
   128			dev_err(isp->dev, "failed to alloc sgt from pages\n");
   129			return err;
   130		}
   131	
   132		size = iommu_map_sgtable(isp->domain, surf->iova, &surf->sgt,
   133					 IOMMU_READ | IOMMU_WRITE);
   134		if (size < surf->size) {
 > 135			dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
   136				surf->iova);
   137			sg_free_table(&surf->sgt);
   138			return -ENXIO;
   139		}
   140	
   141		return 0;
   142	}
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
