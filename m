Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B489117BEA1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 09:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723715232; cv=none; b=ZhzjpF9nK3+GNA9IgpgsSuOz1btASUPQulhuLwFM6aOpZhk5cLW0TE1RpCwNx4ZV4lGw5tKPyf1mHyZULwQPamBE44cR4UaBk2In5hwkvQxoC/rSNuFpAxFv47rYsz5fRwSdqMI+vGqBjZp2yiBP7I0cnGMjF6flmrWlks46KVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723715232; c=relaxed/simple;
	bh=o8F0y9pJWzOt7q0RzbSl68ny89U7jdBZudZvE+qqmiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mfUcHja61FV9B0BJMfqMFnFLH34Y9qQrSRV6WyCmqYrAq1ZD0WYE6orpRq0p/Crwo8P1RBo984QmllDvws58kgPnkShhOVW94LwjCXxIR9/68OP/1Xj8vgrQnCbRWf9Gzk/aksvFeJ1XzHdn6Tu6zCOgegdeO7cwPyIvh1Oqag8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVSUacMM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVSUacMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723715230; x=1755251230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o8F0y9pJWzOt7q0RzbSl68ny89U7jdBZudZvE+qqmiw=;
  b=OVSUacMM825T01uWYyT8HUpFAvmFfbuVwEli85v4hgaaI5/LnyUs8HGv
   nVLqBl9JObGu1cw5Dk2CBF1vJdaaTssBMuZJHxUcjdlRBwqORZteTu+1i
   6+5/OE+kTe7SvuOvCI1n9xd6BqOl+e1uORTd52BkbAau9y5dc1or/8nsd
   57Pf1UfgHP/nDT0Wbqr9Uhtit8NaIbq3F3nNYAxJsluGhhYMA/4ANcJaC
   xUc8fDcPp3vuhlrOztEu5ny/wNti8FnkGCPpUygo9OfvUCdH1t12YNUzN
   8Fme3sVDFHZDHKq9ZnCPW8/C6lA+bwL0/72sxPFepXj20dD1FPFoLPxZ0
   Q==;
X-CSE-ConnectionGUID: 97tWNWZ+TYqarUq2OkhiCA==
X-CSE-MsgGUID: Dq0kH7uFTeuqYF9Sy7BZ3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21823014"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="21823014"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 02:47:08 -0700
X-CSE-ConnectionGUID: j+HXVqo1S8CAkSCM4gCPmw==
X-CSE-MsgGUID: oRJihMhnTDiKfl34nd3eeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="59153460"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Aug 2024 02:47:07 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seX4S-0003NC-1O;
	Thu, 15 Aug 2024 09:47:04 +0000
Date: Thu, 15 Aug 2024 17:46:56 +0800
From: kernel test robot <lkp@intel.com>
To: Darren Etheridge <detheridge@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-android-linux-6.1.y-cicd 406/1393]
 drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:770:34: error:
 assignment to 'struct page *' from 'int' makes pointer from integer without
 a cast
Message-ID: <202408151731.9DbEIJqM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-android-linux-6.1.y-cicd
head:   9391697ba76863942bbe649df45839eab77039cc
commit: 98e8ac20e59a87199bbd8b144f0551440b4de0ab [406/1393] TI: media: platform: img: add the vxe-vxd driver into the build infra
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240815/202408151731.9DbEIJqM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408151731.9DbEIJqM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151731.9DbEIJqM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c: In function 'vxd_dec_buf_prepare':
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:770:36: error: implicit declaration of function 'phys_to_page'; did you mean 'pfn_to_page'? [-Wimplicit-function-declaration]
     770 |                         new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
         |                                    ^~~~~~~~~~~~
         |                                    pfn_to_page
>> drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:770:34: error: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     770 |                         new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
         |                                  ^
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:637:13: warning: variable 'pages' set but not used [-Wunused-but-set-variable]
     637 |         int pages;
         |             ^~~~~
   In file included from include/linux/of_device.h:6,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:21:
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c: In function 'vxd_dec_driver_init':
   include/linux/device/driver.h:270:27: warning: passing argument 1 of '__platform_driver_register' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     270 |         return __register(&(__driver) , ##__VA_ARGS__); \
         |                           ^~~~~~~~~~~
   include/linux/platform_device.h:242:36: note: in definition of macro 'platform_driver_register'
     242 |         __platform_driver_register(drv, THIS_MODULE)
         |                                    ^~~
   include/linux/platform_device.h:272:9: note: in expansion of macro 'module_driver'
     272 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:2245:1: note: in expansion of macro 'module_platform_driver'
    2245 | module_platform_driver(vxd_dec_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:243:39: note: expected 'struct platform_driver *' but argument is of type 'const struct platform_driver *'
     243 | extern int __platform_driver_register(struct platform_driver *,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:32,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:17:
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c: In function 'vxd_dec_driver_exit':
   include/linux/device/driver.h:275:22: warning: passing argument 1 of 'platform_driver_unregister' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     275 |         __unregister(&(__driver) , ##__VA_ARGS__); \
         |                      ^~~~~~~~~~~
   include/linux/platform_device.h:272:9: note: in expansion of macro 'module_driver'
     272 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:2245:1: note: in expansion of macro 'module_platform_driver'
    2245 | module_platform_driver(vxd_dec_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:245:40: note: expected 'struct platform_driver *' but argument is of type 'const struct platform_driver *'
     245 | extern void platform_driver_unregister(struct platform_driver *);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c: At top level:
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:379:13: warning: 'vxd_error_recovery' defined but not used [-Wunused-function]
     379 | static void vxd_error_recovery(struct vxd_dec_ctx *ctx)
         |             ^~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/img/vxe-vxd/decoder/vxd_props.h:19,
                    from drivers/media/platform/img/vxe-vxd/decoder/decoder.h:29,
                    from drivers/media/platform/img/vxe-vxd/decoder/core.h:20,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:53:
   drivers/media/platform/img/vxe-vxd/common/imgmmu.h:65:28: warning: 'VIRT_DIR_IDX_MASK' defined but not used [-Wunused-const-variable=]
      65 | static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
         |                            ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/common/imgmmu.h:62:28: warning: 'VIRT_PAGE_TBL_MASK' defined but not used [-Wunused-const-variable=]
      62 | static const unsigned long VIRT_PAGE_TBL_MASK =
         |                            ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DMADEVICES
   Depends on [n]: HAS_DMA [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +770 drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c

722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  623  
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  624  static int vxd_dec_buf_prepare(struct vb2_buffer *vb)
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  625  {
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  626  	struct vxd_dec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  627  	struct device *dev = ctx->dev->dev;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  628  	struct vxd_dec_q_data *q_data;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  629  	void *sgt;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  630  #ifdef CAPTURE_CONTIG_ALLOC
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  631  	struct page *new_page;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  632  #else
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  633  	void *sgl;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  634  #endif
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  635  	struct sg_table *sgt_new;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  636  	void *sgl_new;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  637  	int pages;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  638  	int nents = 0;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  639  	int size = 0;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  640  	int plane, num_planes, ret = 0;
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  641  	unsigned long dma_addr;
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  642  	struct vxd_mapping *mapping;
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  643  	struct list_head *list;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  644  	struct vxd_buffer *buf =
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  645  		container_of(vb, struct vxd_buffer, buffer.vb.vb2_buf);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  646  
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  647  	q_data = get_q_data(ctx, vb->vb2_queue->type);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  648  	if (!q_data)
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  649  		return -EINVAL;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  650  
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  651  	num_planes = q_data->fmt->num_planes;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  652  
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  653  	for (plane = 0; plane < num_planes; plane++) {
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  654  		if (vb2_plane_size(vb, plane) < q_data->size_image[plane]) {
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  655  			dev_err(dev, "data will not fit into plane (%lu < %lu)\n",
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  656  				vb2_plane_size(vb, plane),
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  657  				(long)q_data->size_image[plane]);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  658  			return -EINVAL;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  659  		}
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  660  	}
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  661  
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  662  	if (buf->mapped && !V4L2_TYPE_IS_OUTPUT(vb->type)) {
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  663  #ifdef CAPTURE_CONTIG_ALLOC
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  664  		dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  665  #else
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  666  		sgt = vb2_dma_sg_plane_desc(vb, 0);
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  667  		if (!sgt)
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  668  			return -EFAULT;
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  669  
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  670  		dma_addr = sg_phys(img_mmu_get_sgl(sgt));
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  671  #endif
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  672  		if (buf->buf_info.dma_addr != dma_addr) {
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  673  			list_for_each(list, &ctx->cap_mappings) {
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  674  				mapping = list_entry(list, struct vxd_mapping, list);
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  675  				if (dma_addr == mapping->dma_addr)
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  676  					break;
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  677  
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  678  				mapping = NULL;
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  679  			}
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  680  			if (mapping) {
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  681  				/* skip the mapping, buf update buf_map_id */
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  682  				buf->buf_info.dma_addr = mapping->dma_addr;
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  683  				buf->buf_map_id = mapping->buf_map_id;
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  684  				buf->buf_info.cpu_linear_addr = vb2_plane_vaddr(vb, 0);
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  685  				buf->mapping = mapping;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  686  				return 0;
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  687  			}
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  688  		} else {
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  689  			return 0;
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  690  		}
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  691  	} else if (buf->mapped) {
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  692  		return 0;
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  693  	}
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  694  
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  695  	buf->buf_info.cpu_linear_addr = vb2_plane_vaddr(vb, 0);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  696  	buf->buf_info.buf_size = vb2_plane_size(vb, 0);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  697  	buf->buf_info.fd = -1;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  698  	sgt = vb2_dma_sg_plane_desc(vb, 0);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  699  	if (!sgt) {
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  700  		dev_err(dev, "Could not get sg_table from plane 0\n");
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  701  		return -EINVAL;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  702  	}
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  703  
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  704  	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  705  		buf->buf_info.dma_addr = sg_phys(img_mmu_get_sgl(sgt));
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  706  		ret = core_stream_map_buf_sg(ctx->res_str_id,
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  707  					     VDEC_BUFTYPE_BITSTREAM,
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  708  					     &buf->buf_info, sgt,
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  709  					     &buf->buf_map_id);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  710  		if (ret) {
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  711  			dev_err(dev, "OUTPUT core_stream_map_buf_sg failed\n");
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  712  			return ret;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  713  		}
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  714  
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  715  		buf->bstr_info.buf_size = q_data->size_image[0];
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  716  		buf->bstr_info.cpu_virt_addr = buf->buf_info.cpu_linear_addr;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  717  		buf->bstr_info.mem_attrib =
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  718  			SYS_MEMATTRIB_UNCACHED | SYS_MEMATTRIB_WRITECOMBINE |
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  719  			SYS_MEMATTRIB_INPUT | SYS_MEMATTRIB_CPU_WRITE;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  720  		buf->bstr_info.bufmap_id = buf->buf_map_id;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  721  		lst_init(&buf->seq_unit.bstr_seg_list);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  722  		lst_init(&buf->pic_unit.bstr_seg_list);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  723  		lst_init(&buf->end_unit.bstr_seg_list);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  724  
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  725  		list_add_tail(&buf->list, &ctx->out_buffers);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  726  	} else {
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  727  #ifdef CAPTURE_CONTIG_ALLOC
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  728  		buf->buf_info.dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  729  #else
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  730  		buf->buf_info.dma_addr = sg_phys(img_mmu_get_sgl(sgt));
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  731  #endif
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  732  		/* Create a single sgt from the plane(s) */
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  733  		sgt_new = kmalloc(sizeof(*sgt_new), GFP_KERNEL);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  734  		if (!sgt_new)
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  735  			return -EINVAL;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  736  
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  737  		for (plane = 0; plane < num_planes; plane++) {
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  738  			size += ALIGN(vb2_plane_size(vb, plane), PAGE_SIZE);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  739  			sgt = vb2_dma_sg_plane_desc(vb, plane);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  740  			if (!sgt) {
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  741  				dev_err(dev, "Could not get sg_table from plane %d\n", plane);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  742  				kfree(sgt_new);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  743  				return -EINVAL;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  744  			}
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  745  #ifdef CAPTURE_CONTIG_ALLOC
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  746  			nents += 1;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  747  #else
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  748  			nents += sg_nents(img_mmu_get_sgl(sgt));
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  749  #endif
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  750  		}
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  751  		buf->buf_info.buf_size = size;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  752  
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  753  		pages = (size + PAGE_SIZE - 1) / PAGE_SIZE;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  754  		ret = sg_alloc_table(sgt_new, nents, GFP_KERNEL);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  755  		if (ret) {
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  756  			kfree(sgt_new);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  757  			return -EINVAL;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  758  		}
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  759  		sgl_new = img_mmu_get_sgl(sgt_new);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  760  
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  761  		for (plane = 0; plane < num_planes; plane++) {
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  762  			sgt = vb2_dma_sg_plane_desc(vb, plane);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  763  			if (!sgt) {
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  764  				dev_err(dev, "Could not get sg_table from plane %d\n", plane);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  765  				sg_free_table(sgt_new);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  766  				kfree(sgt_new);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  767  				return -EINVAL;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  768  			}
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  769  #ifdef CAPTURE_CONTIG_ALLOC
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25 @770  			new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  771  			sg_set_page(sgl_new, new_page, ALIGN(vb2_plane_size(vb, plane),
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  772  							     PAGE_SIZE), 0);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  773  			sgl_new = sg_next(sgl_new);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  774  #else
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  775  			sgl = img_mmu_get_sgl(sgt);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  776  
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  777  			while (sgl) {
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  778  				sg_set_page(sgl_new, sg_page(sgl), img_mmu_get_sgl_length(sgl), 0);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  779  				sgl = sg_next(sgl);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  780  				sgl_new = sg_next(sgl_new);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  781  			}
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  782  #endif
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  783  		}
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  784  
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  785  		buf->buf_info.pictbuf_cfg = ctx->pict_bufcfg;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  786  		ret = core_stream_map_buf_sg(ctx->res_str_id,
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  787  					     VDEC_BUFTYPE_PICTURE,
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  788  					     &buf->buf_info, sgt_new,
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  789  					     &buf->buf_map_id);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  790  		sg_free_table(sgt_new);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  791  		kfree(sgt_new);
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  792  		if (ret) {
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  793  			dev_err(dev, "CAPTURE core_stream_map_buf_sg failed\n");
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  794  			return ret;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  795  		}
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  796  		if (buf->mapped == FALSE)
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  797  			list_add_tail(&buf->list, &ctx->cap_buffers);
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  798  
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  799  		/* Add this to the mappings */
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  800  		mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  801  
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  802  		mapping->reuse = TRUE;
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  803  		mapping->dma_addr = buf->buf_info.dma_addr;
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  804  		mapping->buf_map_id = buf->buf_map_id;
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  805  		list_add_tail(&mapping->list, &ctx->cap_mappings);
7e9c1f763a3306 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  806  		buf->mapping = mapping;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  807  	}
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  808  	buf->mapped = TRUE;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  809  
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  810  	return 0;
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  811  }
722a670dbe07df drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  812  

:::::: The code at line 770 was first introduced by commit
:::::: 722a670dbe07dfa6cb8e8eeb324eeaffddc4480d TI: v4l: Add V4L2 Interface function implementations

:::::: TO: Sidraya <sidraya.bj@pathpartnertech.com>
:::::: CC: Guillaume La Roque <glaroque@baylibre.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
