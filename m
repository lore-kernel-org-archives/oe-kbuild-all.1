Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509641FD0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 03:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690343653; x=1721879653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oHMEVwlfWUSJ4qgba9wUiqhffBxhbH7Ym45ldWoVfY8=;
  b=NmwZxeaVbuH5ELdR4ayDhE5039/dRObM8Kc51j/uwked2fYH1lmf3aiX
   01cBZZMk05XHu0CjH7AZAdVNfCfeGKzQsWOnUYxeQ13Fuw8cTT4NoHkW5
   n3fh4xYgn3/b8Vj+T+meGsqsXNm7gO+BonKR3tm2QD5lCH10hEDoslXUW
   pXdgxaecI16HOG0i7NlBDfT/Be8LXBm8+l3uO8OHdy4950vbqC4r1HOZb
   9fxDROZcQtUn0ZDBkZ/dtD7H+OfIm57hQk3vSSt9Bd/mpSi4YwSXsUoJU
   unDUrHBJ0eRzBU/DZh5PHCYtLKdrb8pE2Z7zXi9rIlsrslnPF7kS+lr2S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="434160509"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="434160509"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 20:54:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="726351959"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="726351959"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Jul 2023 20:54:09 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOVbE-0000dx-1Q;
	Wed, 26 Jul 2023 03:54:08 +0000
Date: Wed, 26 Jul 2023 11:53:59 +0800
From: kernel test robot <lkp@intel.com>
To: Darren Etheridge <detheridge@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 62/70]
 drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c:159:17: error:
 implicit declaration of function 'vunmap'; did you mean 'kunmap'?
Message-ID: <202307261145.KUBUpbxx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   6f3ee6fcd1f316038e9cb9505c72a15b019f3c7d
commit: 3b23f836c2ec0541aea62823eeed7f2bbe88dc43 [62/70] media: platform: img: add the vxe-vxd driver into the build infra
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230726/202307261145.KUBUpbxx-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261145.KUBUpbxx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261145.KUBUpbxx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c: In function 'unified_free':
>> drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c:159:17: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]
     159 |                 vunmap(buffer->kptr);
         |                 ^~~~~~
         |                 kunmap
   drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c: In function 'unified_map_km':
>> drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c:197:24: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
     197 |         buffer->kptr = vmap((struct page **)pages, num_pages, VM_MAP, prot);
         |                        ^~~~
         |                        kmap
>> drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c:197:63: error: 'VM_MAP' undeclared (first use in this function); did you mean 'VM_MTE'?
     197 |         buffer->kptr = vmap((struct page **)pages, num_pages, VM_MAP, prot);
         |                                                               ^~~~~~
         |                                                               VM_MTE
   drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c:197:63: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors
--
   drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c: In function 'bspp_hevc_parse_vps':
>> drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:594:1: warning: the frame size of 1180 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     594 | }
         | ^


vim +159 drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c

309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  145  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  146  static void unified_free(struct heap *heap, struct buffer *buffer)
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  147  {
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  148  	void *dev = buffer->device;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  149  	void *sgt = buffer->priv;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  150  	void *sgl;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  151  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  152  	dev_dbg(dev, "%s:%d buffer %d (0x%p)\n", __func__, __LINE__,
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  153  		buffer->id, buffer);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  154  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  155  	if (buffer->kptr) {
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  156  		dev_dbg(dev, "%s vunmap 0x%p\n", __func__, buffer->kptr);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  157  		dma_unmap_sg(dev, img_mmu_get_sgl(sgt), img_mmu_get_orig_nents(sgt),
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  158  			     DMA_FROM_DEVICE);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25 @159  		vunmap(buffer->kptr);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  160  	}
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  161  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  162  	sgl = img_mmu_get_sgl(sgt);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  163  	while (sgl) {
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  164  		__free_page(sg_page(sgl));
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  165  		sgl = sg_next(sgl);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  166  	}
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  167  	sg_free_table(sgt);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  168  	kfree(sgt);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  169  }
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  170  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  171  static int unified_map_km(struct heap *heap, struct buffer *buffer)
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  172  {
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  173  	void *dev = buffer->device;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  174  	void *sgt = buffer->priv;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  175  	void *sgl = img_mmu_get_sgl(sgt);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  176  	unsigned int num_pages = sg_nents(sgl);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  177  	unsigned int orig_nents = img_mmu_get_orig_nents(sgt);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  178  	void **pages;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  179  	int ret;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  180  	pgprot_t prot;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  181  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  182  	dev_dbg(dev, "%s:%d buffer %d (0x%p)\n", __func__, __LINE__, buffer->id, buffer);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  183  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  184  	if (buffer->kptr) {
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  185  		dev_warn(dev, "%s called for already mapped buffer %d\n", __func__, buffer->id);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  186  		return 0;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  187  	}
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  188  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  189  	pages = kmalloc_array(num_pages, sizeof(void *), GFP_KERNEL);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  190  	if (!pages)
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  191  		return -ENOMEM;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  192  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  193  	img_mmu_get_pages(pages, sgt);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  194  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  195  	prot = PAGE_KERNEL;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  196  	prot = pgprot_writecombine(prot);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25 @197  	buffer->kptr = vmap((struct page **)pages, num_pages, VM_MAP, prot);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  198  	kfree(pages);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  199  	if (!buffer->kptr) {
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  200  		dev_err(dev, "%s vmap failed!\n", __func__);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  201  		return -EFAULT;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  202  	}
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  203  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  204  	ret = dma_map_sg(dev, sgl, orig_nents, DMA_FROM_DEVICE);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  205  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  206  	if (ret <= 0) {
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  207  		dev_err(dev, "%s dma_map_sg failed!\n", __func__);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  208  		vunmap(buffer->kptr);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  209  		return -EFAULT;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  210  	}
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  211  	dev_dbg(dev, "%s:%d buffer %d orig_nents %d nents %d\n", __func__,
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  212  		__LINE__, buffer->id, orig_nents, ret);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  213  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  214  	img_mmu_set_sgt_nents(sgt, ret);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  215  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  216  	dev_dbg(dev, "%s:%d buffer %d vmap to 0x%p\n", __func__, __LINE__,
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  217  		buffer->id, buffer->kptr);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  218  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  219  	return 0;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  220  }
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  221  

:::::: The code at line 159 was first introduced by commit
:::::: 309ef81727dfe5aec2a8cbcf0db6d42e7c7292e8 v4l: vxd-dec: Create vxd_dec Mem Manager helper library

:::::: TO: Sidraya <sidraya.bj@pathpartnertech.com>
:::::: CC: Praneeth Bajjuri <praneeth@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
