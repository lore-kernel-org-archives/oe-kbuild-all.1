Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FD4620
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Feb 2024 18:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707676930; cv=none; b=GNtGcg2OLKu4hb88jnCDAYHzbmh638kO25AeuixC9yiBHfebvOv9lKMpuv/JldjQgJi3qkJLjhid+1UvN8bq/qfEELj7BFnLF6nbWxYGSWjAyk48fui7qfvERRso5dOauTYiFwgJtkn854cTNYIsxgOiClem3grrQbliKeIHEKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707676930; c=relaxed/simple;
	bh=xJ2HuhSqoGizEEgNhIOZjmvOK/qIHWmDAqgME07wH60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7zHlquaahpqvns1miyYVqGbooF+MoQ105vXY8fq/ZGbGU3aDK2LGeT27gLI6bJQs7Kdtgqb8xztmv3OzW3mB5B5zRcxTgeBviTZH3vwgW6uDNq1rzTWXbsSvC6Wy0Ntve474uyrnuCo23dOneHAHDZZsYmLpTmLMnLF2E3hkVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yu7Moyx9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yu7Moyx9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707676928; x=1739212928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xJ2HuhSqoGizEEgNhIOZjmvOK/qIHWmDAqgME07wH60=;
  b=Yu7Moyx9jizyQvYhJxgz59Zw1S2XH3Db/Bqnkz4xi7xum/ly9OTJsm7c
   VAYqkPusodsX2WhWaaMzi/f98xofYE9LmSqnOiTg3Ousyt6y7DeDqqCZ3
   J1MIsyk7Vh4wZl8WCF+eDpeYTkLxpv1CzoeIcj65EAeC5vcbW5IiCRCKy
   7aJl9HJhqMAaOLXCLDkeEslF29ZSy7Nr1suSBPD0ByHEk2HD/Xy6vGcTK
   flxlCRXHpZCA8neB8Xq+ijH/x0wJf8WmJ6qV6dGfDoeKUjSFuWNv3a0TT
   h/6nV2E7TMNI6tSnrP87aEkc1WqXjCMyCalq1DlVEWdETtuzyni/cn3Ul
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1794200"
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="1794200"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 10:42:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="7011752"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Feb 2024 10:42:05 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZEmA-0006jG-2M;
	Sun, 11 Feb 2024 18:42:02 +0000
Date: Mon, 12 Feb 2024 02:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Brnich <b-brnich@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 19/28]
 drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:911:34: warning:
 assignment to 'struct page *' from 'int' makes pointer from integer without
 a cast
Message-ID: <202402120233.MKgd7AVE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   ab9d88d11054a48d1833dc1bb203ce45b53fa706
commit: 21bbf30fcc1bd923c862ff3cf19741f9d5318fbf [19/28] media: img: vxe-vxd: decoder: Set Contiguous Allocation as Default
config: sparc64-allyesconfig (https://download.01.org/0day-ci/archive/20240212/202402120233.MKgd7AVE-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240212/202402120233.MKgd7AVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402120233.MKgd7AVE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c: In function 'vxd_dec_buf_prepare':
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:911:36: error: implicit declaration of function 'phys_to_page'; did you mean 'pfn_to_page'? [-Werror=implicit-function-declaration]
     911 |                         new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
         |                                    ^~~~~~~~~~~~
         |                                    pfn_to_page
>> drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:911:34: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     911 |                         new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
         |                                  ^
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:778:13: warning: variable 'pages' set but not used [-Wunused-but-set-variable]
     778 |         int pages;
         |             ^~~~~
   In file included from drivers/media/platform/img/vxe-vxd/decoder/vxd_props.h:19,
                    from drivers/media/platform/img/vxe-vxd/decoder/decoder.h:29,
                    from drivers/media/platform/img/vxe-vxd/decoder/core.h:20,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:53:
   drivers/media/platform/img/vxe-vxd/common/imgmmu.h: At top level:
   drivers/media/platform/img/vxe-vxd/common/imgmmu.h:65:28: warning: 'VIRT_DIR_IDX_MASK' defined but not used [-Wunused-const-variable=]
      65 | static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
         |                            ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/common/imgmmu.h:62:28: warning: 'VIRT_PAGE_TBL_MASK' defined but not used [-Wunused-const-variable=]
      62 | static const unsigned long VIRT_PAGE_TBL_MASK =
         |                            ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +911 drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c

f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  764  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  765  static int vxd_dec_buf_prepare(struct vb2_buffer *vb)
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  766  {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  767  	struct vxd_dec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  768  	struct device *dev = ctx->dev->dev;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  769  	struct vxd_dec_q_data *q_data;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  770  	void *sgt;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  771  #ifdef CAPTURE_CONTIG_ALLOC
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  772  	struct page *new_page;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  773  #else
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  774  	void *sgl;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  775  #endif
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  776  	struct sg_table *sgt_new;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  777  	void *sgl_new;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  778  	int pages;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  779  	int nents = 0;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  780  	int size = 0;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  781  	int plane, num_planes, ret = 0;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  782  	unsigned long dma_addr;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  783  	struct vxd_mapping *mapping;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  784  	struct list_head *list;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  785  	struct vxd_buffer *buf =
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  786  		container_of(vb, struct vxd_buffer, buffer.vb.vb2_buf);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  787  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  788  	q_data = get_q_data(ctx, vb->vb2_queue->type);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  789  	if (!q_data)
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  790  		return -EINVAL;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  791  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  792  	num_planes = q_data->fmt->num_planes;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  793  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  794  	for (plane = 0; plane < num_planes; plane++) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  795  		if (vb2_plane_size(vb, plane) < q_data->size_image[plane]) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  796  			dev_err(dev, "data will not fit into plane (%lu < %lu)\n",
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  797  				vb2_plane_size(vb, plane),
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  798  				(long)q_data->size_image[plane]);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  799  			return -EINVAL;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  800  		}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  801  	}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  802  
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  803  	if (buf->mapped && !V4L2_TYPE_IS_OUTPUT(vb->type)) {
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  804  #ifdef CAPTURE_CONTIG_ALLOC
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  805  		dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  806  #else
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  807  		sgt = vb2_dma_sg_plane_desc(vb, 0);
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  808  		if (!sgt)
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  809  			return -EFAULT;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  810  
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  811  		dma_addr = sg_phys(img_mmu_get_sgl(sgt));
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  812  #endif
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  813  		if (buf->buf_info.dma_addr != dma_addr) {
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  814  			list_for_each(list, &ctx->cap_mappings) {
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  815  				mapping = list_entry(list, struct vxd_mapping, list);
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  816  				if (dma_addr == mapping->dma_addr)
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  817  					break;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  818  
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  819  				mapping = NULL;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  820  			}
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  821  			if (mapping) {
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  822  				/* skip the mapping, buf update buf_map_id */
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  823  				buf->buf_info.dma_addr = mapping->dma_addr;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  824  				buf->buf_map_id = mapping->buf_map_id;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  825  				buf->buf_info.cpu_linear_addr = vb2_plane_vaddr(vb, 0);
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  826  				buf->mapping = mapping;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  827  				return 0;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  828  			}
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  829  		} else {
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  830  			return 0;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  831  		}
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  832  	} else if (buf->mapped) {
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  833  		return 0;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  834  	}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  835  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  836  	buf->buf_info.cpu_linear_addr = vb2_plane_vaddr(vb, 0);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  837  	buf->buf_info.buf_size = vb2_plane_size(vb, 0);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  838  	buf->buf_info.fd = -1;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  839  	sgt = vb2_dma_sg_plane_desc(vb, 0);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  840  	if (!sgt) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  841  		dev_err(dev, "Could not get sg_table from plane 0\n");
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  842  		return -EINVAL;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  843  	}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  844  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  845  	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  846  		buf->buf_info.dma_addr = sg_phys(img_mmu_get_sgl(sgt));
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  847  		ret = core_stream_map_buf_sg(ctx->res_str_id,
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  848  					     VDEC_BUFTYPE_BITSTREAM,
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  849  					     &buf->buf_info, sgt,
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  850  					     &buf->buf_map_id);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  851  		if (ret) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  852  			dev_err(dev, "OUTPUT core_stream_map_buf_sg failed\n");
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  853  			return ret;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  854  		}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  855  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  856  		buf->bstr_info.buf_size = q_data->size_image[0];
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  857  		buf->bstr_info.cpu_virt_addr = buf->buf_info.cpu_linear_addr;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  858  		buf->bstr_info.mem_attrib =
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  859  			SYS_MEMATTRIB_UNCACHED | SYS_MEMATTRIB_WRITECOMBINE |
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  860  			SYS_MEMATTRIB_INPUT | SYS_MEMATTRIB_CPU_WRITE;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  861  		buf->bstr_info.bufmap_id = buf->buf_map_id;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  862  		lst_init(&buf->seq_unit.bstr_seg_list);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  863  		lst_init(&buf->pic_unit.bstr_seg_list);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  864  		lst_init(&buf->end_unit.bstr_seg_list);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  865  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  866  		list_add_tail(&buf->list, &ctx->out_buffers);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  867  	} else {
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  868  #ifdef CAPTURE_CONTIG_ALLOC
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  869  		buf->buf_info.dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  870  #else
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  871  		buf->buf_info.dma_addr = sg_phys(img_mmu_get_sgl(sgt));
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  872  #endif
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  873  		/* Create a single sgt from the plane(s) */
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  874  		sgt_new = kmalloc(sizeof(*sgt_new), GFP_KERNEL);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  875  		if (!sgt_new)
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  876  			return -EINVAL;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  877  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  878  		for (plane = 0; plane < num_planes; plane++) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  879  			size += ALIGN(vb2_plane_size(vb, plane), PAGE_SIZE);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  880  			sgt = vb2_dma_sg_plane_desc(vb, plane);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  881  			if (!sgt) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  882  				dev_err(dev, "Could not get sg_table from plane %d\n", plane);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  883  				kfree(sgt_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  884  				return -EINVAL;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  885  			}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  886  #ifdef CAPTURE_CONTIG_ALLOC
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  887  			nents += 1;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  888  #else
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  889  			nents += sg_nents(img_mmu_get_sgl(sgt));
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  890  #endif
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  891  		}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  892  		buf->buf_info.buf_size = size;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  893  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  894  		pages = (size + PAGE_SIZE - 1) / PAGE_SIZE;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  895  		ret = sg_alloc_table(sgt_new, nents, GFP_KERNEL);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  896  		if (ret) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  897  			kfree(sgt_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  898  			return -EINVAL;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  899  		}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  900  		sgl_new = img_mmu_get_sgl(sgt_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  901  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  902  		for (plane = 0; plane < num_planes; plane++) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  903  			sgt = vb2_dma_sg_plane_desc(vb, plane);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  904  			if (!sgt) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  905  				dev_err(dev, "Could not get sg_table from plane %d\n", plane);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  906  				sg_free_table(sgt_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  907  				kfree(sgt_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  908  				return -EINVAL;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  909  			}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  910  #ifdef CAPTURE_CONTIG_ALLOC
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25 @911  			new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  912  			sg_set_page(sgl_new, new_page, ALIGN(vb2_plane_size(vb, plane),
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  913  							     PAGE_SIZE), 0);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  914  			sgl_new = sg_next(sgl_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  915  #else
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  916  			sgl = img_mmu_get_sgl(sgt);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  917  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  918  			while (sgl) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  919  				sg_set_page(sgl_new, sg_page(sgl), img_mmu_get_sgl_length(sgl), 0);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  920  				sgl = sg_next(sgl);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  921  				sgl_new = sg_next(sgl_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  922  			}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  923  #endif
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  924  		}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  925  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  926  		buf->buf_info.pictbuf_cfg = ctx->pict_bufcfg;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  927  		ret = core_stream_map_buf_sg(ctx->res_str_id,
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  928  					     VDEC_BUFTYPE_PICTURE,
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  929  					     &buf->buf_info, sgt_new,
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  930  					     &buf->buf_map_id);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  931  		sg_free_table(sgt_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  932  		kfree(sgt_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  933  		if (ret) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  934  			dev_err(dev, "CAPTURE core_stream_map_buf_sg failed\n");
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  935  			return ret;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  936  		}
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  937  		if (buf->mapped == FALSE)
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  938  			list_add_tail(&buf->list, &ctx->cap_buffers);
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  939  
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  940  		/* Add this to the mappings */
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  941  		mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  942  
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  943  		mapping->reuse = TRUE;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  944  		mapping->dma_addr = buf->buf_info.dma_addr;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  945  		mapping->buf_map_id = buf->buf_map_id;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  946  		list_add_tail(&mapping->list, &ctx->cap_mappings);
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  947  		buf->mapping = mapping;
fced2bd86798a6 drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c Darren Etheridge 2023-10-04  948  		mapping->buf = buf;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  949  	}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  950  	buf->mapped = TRUE;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  951  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  952  	return 0;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  953  }
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2023-04-25  954  

:::::: The code at line 911 was first introduced by commit
:::::: f1ce557a02e8f185c8585c901a2b2f79a91278e5 v4l: Add V4L2 Interface function implementations

:::::: TO: Sidraya <sidraya.bj@pathpartnertech.com>
:::::: CC: Praneeth Bajjuri <praneeth@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
