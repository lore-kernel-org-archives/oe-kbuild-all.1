Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394D9258CF9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 09:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758620539; cv=none; b=MwfjZUqyIonuDSH+dWxPfDtfNkqd+b+9wqc9DZ7KymLultzJhlRtFIwVgMCkqktoT0tUkNPdFcu3qnfZgA3T/OR+mignicySKuIE/ijl8qPecWNT3MqoWbjEeEaPFOMfha4G7SWy/ZH9nsXtq0Gtfh5X8VP5jwcNebKc6f3HKHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758620539; c=relaxed/simple;
	bh=GIpckiDowe4oK8sPQCBE5g+44IoE+A/fz3R0cRLRnvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m3oeyCWHnC/rjr5D53ZRrVYqWjz0zXQ1f2eGo2wpSHAMAMgp7jPL7QW6bRVUU9lAlwi8pNchrEr6DYvSH8x9V+S/5JH+/89GuCVqldCOOp4X2LEvT6PTdKmjCFXlyJ6ucIZBgWbWpARjbzioKi1bk33vLjupvP2u9/zg/9mwOjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cKrqOZqt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cKrqOZqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758620537; x=1790156537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GIpckiDowe4oK8sPQCBE5g+44IoE+A/fz3R0cRLRnvI=;
  b=cKrqOZqtnPlWqKTCD+SW2xMelUOVU/pfFO+qgGMA/ss7BNeDozYovoLY
   +o2DtOJ9T/xqg1Cdsvy/TAQ6oAnYYUZNflkU6J8ipjeyI8Qk4DWvBP9Xf
   KpXusdpUjOzAlbLseTfHF3jf1DznyihFR0LHhN4gm7FCghxbvMHRZ7Lk2
   o8tr55ndN8gWPY/UtEwcmJqViLFLZqmb04NuHKN14WNY8e3P5+G8jSSBG
   OSXkmxzC5vBIjxICwzQfOK9Bo2b1q+KcIALrn/JxQpb6sDGxz8Xpzd9Ez
   KERlFE6glqLaSkqYef730rM/h20J/9mmkI6iFIFnFQrHf9YXHyn9yWxUb
   w==;
X-CSE-ConnectionGUID: mTnf+WanRlSdh/wMSDIdTw==
X-CSE-MsgGUID: LyfP/KSbRQiHSNtHZOy1eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="48464970"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="48464970"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 02:42:17 -0700
X-CSE-ConnectionGUID: G/wyF3H7QdmwIOQOU09ybA==
X-CSE-MsgGUID: 7kTU8us/T8aEa7n2FAxifw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="207649798"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2025 02:42:15 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0zXJ-0002yX-1o;
	Tue, 23 Sep 2025 09:42:13 +0000
Date: Tue, 23 Sep 2025 17:42:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2909/2909]
 drivers/gpu/drm/phytium/phytium_gem.c:174:5: sparse: sparse: symbol
 'phytium_gem_prime_mmap' was not declared. Should it be static?
Message-ID: <202509231756.bOMWC43K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   be758a5796c3d280deb877699c41fd0cd04e1deb
commit: 3b4a5906fa714bdc9a15fc04374942888737eb4c [2909/2909] drm/phytium: Fix Phytium DRM build fail
config: arm64-randconfig-r121-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231756.bOMWC43K-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231756.bOMWC43K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231756.bOMWC43K-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/phytium/phytium_gem.c: note: in included file (through arch/arm64/include/asm/cpufeature.h, arch/arm64/include/asm/ptrace.h, arch/arm64/include/asm/irqflags.h, ...):
   arch/arm64/include/asm/cputype.h:163:9: sparse: sparse: preprocessor token PHYTIUM_CPU_PART_FTC862 redefined
   arch/arm64/include/asm/cputype.h:110:9: sparse: this was the original definition
   drivers/gpu/drm/phytium/phytium_gem.c:22:5: sparse: sparse: symbol 'phytium_memory_pool_alloc' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_gem.c:37:6: sparse: sparse: symbol 'phytium_memory_pool_free' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_gem.c:161:5: sparse: sparse: symbol 'phytium_gem_prime_vmap' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_gem.c:170:6: sparse: sparse: symbol 'phytium_gem_prime_vunmap' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_gem.c:174:5: sparse: sparse: symbol 'phytium_gem_prime_mmap' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_gem.c:186:5: sparse: sparse: symbol 'phytium_dma_transfer' was not declared. Should it be static?

vim +/phytium_gem_prime_mmap +174 drivers/gpu/drm/phytium/phytium_gem.c

b80df10f845813 lishuo       2024-01-31   21  
b80df10f845813 lishuo       2024-01-31  @22  int phytium_memory_pool_alloc(struct phytium_display_private *priv, void **pvaddr,
b80df10f845813 lishuo       2024-01-31   23  					phys_addr_t *phys_addr, uint64_t size)
b80df10f845813 lishuo       2024-01-31   24  {
b80df10f845813 lishuo       2024-01-31   25  	unsigned long vaddr;
b80df10f845813 lishuo       2024-01-31   26  
b80df10f845813 lishuo       2024-01-31   27  	vaddr = gen_pool_alloc(priv->memory_pool, size);
b80df10f845813 lishuo       2024-01-31   28  	if (!vaddr)
b80df10f845813 lishuo       2024-01-31   29  		return -ENOMEM;
b80df10f845813 lishuo       2024-01-31   30  
b80df10f845813 lishuo       2024-01-31   31  	*phys_addr = gen_pool_virt_to_phys(priv->memory_pool, vaddr);
b80df10f845813 lishuo       2024-01-31   32  
b80df10f845813 lishuo       2024-01-31   33  	*pvaddr = (void *)vaddr;
b80df10f845813 lishuo       2024-01-31   34  	return 0;
b80df10f845813 lishuo       2024-01-31   35  }
b80df10f845813 lishuo       2024-01-31   36  
b80df10f845813 lishuo       2024-01-31   37  void phytium_memory_pool_free(struct phytium_display_private *priv, void *vaddr, uint64_t size)
b80df10f845813 lishuo       2024-01-31   38  {
b80df10f845813 lishuo       2024-01-31   39  	gen_pool_free(priv->memory_pool, (unsigned long)vaddr, size);
b80df10f845813 lishuo       2024-01-31   40  }
b80df10f845813 lishuo       2024-01-31   41  
b80df10f845813 lishuo       2024-01-31   42  int phytium_memory_pool_init(struct device *dev, struct phytium_display_private *priv)
b80df10f845813 lishuo       2024-01-31   43  {
b80df10f845813 lishuo       2024-01-31   44  	int ret = 0;
b80df10f845813 lishuo       2024-01-31   45  
b80df10f845813 lishuo       2024-01-31   46  	priv->memory_pool = gen_pool_create(VRAM_POOL_ALLOC_ORDER, -1);
b80df10f845813 lishuo       2024-01-31   47  	if (priv->memory_pool == NULL) {
b80df10f845813 lishuo       2024-01-31   48  		DRM_ERROR("fail to create memory pool\n");
b80df10f845813 lishuo       2024-01-31   49  		ret = -1;
b80df10f845813 lishuo       2024-01-31   50  		goto failed_create_pool;
b80df10f845813 lishuo       2024-01-31   51  	}
b80df10f845813 lishuo       2024-01-31   52  
b80df10f845813 lishuo       2024-01-31   53  	ret = gen_pool_add_virt(priv->memory_pool, (unsigned long)priv->pool_virt_addr,
b80df10f845813 lishuo       2024-01-31   54  				priv->pool_phys_addr, priv->pool_size, -1);
b80df10f845813 lishuo       2024-01-31   55  	if (ret) {
b80df10f845813 lishuo       2024-01-31   56  		DRM_ERROR("fail to add vram pool\n");
b80df10f845813 lishuo       2024-01-31   57  		ret = -1;
b80df10f845813 lishuo       2024-01-31   58  		goto failed_add_pool_virt;
b80df10f845813 lishuo       2024-01-31   59  	}
b80df10f845813 lishuo       2024-01-31   60  
b80df10f845813 lishuo       2024-01-31   61  	return 0;
b80df10f845813 lishuo       2024-01-31   62  
b80df10f845813 lishuo       2024-01-31   63  failed_add_pool_virt:
b80df10f845813 lishuo       2024-01-31   64  	gen_pool_destroy(priv->memory_pool);
b80df10f845813 lishuo       2024-01-31   65  
b80df10f845813 lishuo       2024-01-31   66  failed_create_pool:
b80df10f845813 lishuo       2024-01-31   67  	return ret;
b80df10f845813 lishuo       2024-01-31   68  }
b80df10f845813 lishuo       2024-01-31   69  
b80df10f845813 lishuo       2024-01-31   70  void phytium_memory_pool_fini(struct device *dev, struct phytium_display_private *priv)
b80df10f845813 lishuo       2024-01-31   71  {
b80df10f845813 lishuo       2024-01-31   72  	gen_pool_destroy(priv->memory_pool);
b80df10f845813 lishuo       2024-01-31   73  }
b80df10f845813 lishuo       2024-01-31   74  
b80df10f845813 lishuo       2024-01-31   75  struct sg_table *
b80df10f845813 lishuo       2024-01-31   76  phytium_gem_prime_get_sg_table(struct drm_gem_object *obj)
b80df10f845813 lishuo       2024-01-31   77  {
b80df10f845813 lishuo       2024-01-31   78  	struct phytium_gem_object *phytium_gem_obj = to_phytium_gem_obj(obj);
b80df10f845813 lishuo       2024-01-31   79  	struct sg_table *sgt;
b80df10f845813 lishuo       2024-01-31   80  	struct drm_device *dev = obj->dev;
b80df10f845813 lishuo       2024-01-31   81  	int ret;
b80df10f845813 lishuo       2024-01-31   82  	struct page *page = NULL;
b80df10f845813 lishuo       2024-01-31   83  
b80df10f845813 lishuo       2024-01-31   84  	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
b80df10f845813 lishuo       2024-01-31   85  	if (!sgt) {
b80df10f845813 lishuo       2024-01-31   86  		DRM_DEBUG_KMS("malloc sgt fail\n");
b80df10f845813 lishuo       2024-01-31   87  		return ERR_PTR(-ENOMEM);
b80df10f845813 lishuo       2024-01-31   88  	}
b80df10f845813 lishuo       2024-01-31   89  
8c04aa95ffa8ae Jiakun Shuai 2024-05-20   90  	if ((phytium_gem_obj->memory_type == MEMORY_TYPE_VRAM_WC) ||
8c04aa95ffa8ae Jiakun Shuai 2024-05-20   91  	    (phytium_gem_obj->memory_type == MEMORY_TYPE_VRAM_DEVICE) ||
b80df10f845813 lishuo       2024-01-31   92  	    (phytium_gem_obj->memory_type == MEMORY_TYPE_SYSTEM_CARVEOUT)) {
b80df10f845813 lishuo       2024-01-31   93  		ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
b80df10f845813 lishuo       2024-01-31   94  		if (ret) {
b80df10f845813 lishuo       2024-01-31   95  			DRM_ERROR("failed to allocate sg\n");
b80df10f845813 lishuo       2024-01-31   96  			goto sgt_free;
b80df10f845813 lishuo       2024-01-31   97  		}
e2cdf30a3e12bb XuYan        2025-04-09   98  		page = pfn_to_page(__phys_to_pfn(phytium_gem_obj->phys_addr));
b80df10f845813 lishuo       2024-01-31   99  		sg_set_page(sgt->sgl, page, PAGE_ALIGN(phytium_gem_obj->size), 0);
b80df10f845813 lishuo       2024-01-31  100  	} else if (phytium_gem_obj->memory_type == MEMORY_TYPE_SYSTEM_UNIFIED) {
b80df10f845813 lishuo       2024-01-31  101  		ret = dma_get_sgtable_attrs(dev->dev, sgt, phytium_gem_obj->vaddr,
b80df10f845813 lishuo       2024-01-31  102  				    phytium_gem_obj->iova, phytium_gem_obj->size,
b80df10f845813 lishuo       2024-01-31  103  				    DMA_ATTR_WRITE_COMBINE);
b80df10f845813 lishuo       2024-01-31  104  		if (ret) {
b80df10f845813 lishuo       2024-01-31  105  			DRM_ERROR("failed to allocate sgt, %d\n", ret);
b80df10f845813 lishuo       2024-01-31  106  			goto sgt_free;
b80df10f845813 lishuo       2024-01-31  107  		}
b80df10f845813 lishuo       2024-01-31  108  	}
b80df10f845813 lishuo       2024-01-31  109  
b80df10f845813 lishuo       2024-01-31  110  	return sgt;
b80df10f845813 lishuo       2024-01-31  111  sgt_free:
b80df10f845813 lishuo       2024-01-31  112  	kfree(sgt);
b80df10f845813 lishuo       2024-01-31  113  	return ERR_PTR(ret);
b80df10f845813 lishuo       2024-01-31  114  }
b80df10f845813 lishuo       2024-01-31  115  
b80df10f845813 lishuo       2024-01-31  116  struct drm_gem_object *
b80df10f845813 lishuo       2024-01-31  117  phytium_gem_prime_import_sg_table(struct drm_device *dev,
b80df10f845813 lishuo       2024-01-31  118  					       struct dma_buf_attachment *attach,
b80df10f845813 lishuo       2024-01-31  119  					       struct sg_table *sgt)
b80df10f845813 lishuo       2024-01-31  120  {
b80df10f845813 lishuo       2024-01-31  121  	struct phytium_gem_object *phytium_gem_obj = NULL;
b80df10f845813 lishuo       2024-01-31  122  	struct scatterlist *s;
b80df10f845813 lishuo       2024-01-31  123  	dma_addr_t expected;
b80df10f845813 lishuo       2024-01-31  124  	int ret, i;
b80df10f845813 lishuo       2024-01-31  125  
b80df10f845813 lishuo       2024-01-31  126  	phytium_gem_obj = kzalloc(sizeof(*phytium_gem_obj), GFP_KERNEL);
b80df10f845813 lishuo       2024-01-31  127  	if (!phytium_gem_obj) {
b80df10f845813 lishuo       2024-01-31  128  		DRM_ERROR("failed to allocate phytium_gem_obj\n");
b80df10f845813 lishuo       2024-01-31  129  		ret = -ENOMEM;
b80df10f845813 lishuo       2024-01-31  130  		goto failed_malloc;
b80df10f845813 lishuo       2024-01-31  131  	}
b80df10f845813 lishuo       2024-01-31  132  
b80df10f845813 lishuo       2024-01-31  133  	ret = drm_gem_object_init(dev, &phytium_gem_obj->base, attach->dmabuf->size);
b80df10f845813 lishuo       2024-01-31  134  	if (ret) {
b80df10f845813 lishuo       2024-01-31  135  		DRM_ERROR("failed to initialize drm gem object: %d\n", ret);
b80df10f845813 lishuo       2024-01-31  136  		goto failed_object_init;
b80df10f845813 lishuo       2024-01-31  137  	}
b80df10f845813 lishuo       2024-01-31  138  
b80df10f845813 lishuo       2024-01-31  139  	expected = sg_dma_address(sgt->sgl);
b80df10f845813 lishuo       2024-01-31  140  	for_each_sg(sgt->sgl, s, sgt->nents, i) {
b80df10f845813 lishuo       2024-01-31  141  		if (sg_dma_address(s) != expected) {
b80df10f845813 lishuo       2024-01-31  142  			DRM_ERROR("sg_table is not contiguous");
b80df10f845813 lishuo       2024-01-31  143  			ret = -EINVAL;
b80df10f845813 lishuo       2024-01-31  144  			goto failed_check_continue;
b80df10f845813 lishuo       2024-01-31  145  		}
b80df10f845813 lishuo       2024-01-31  146  		expected = sg_dma_address(s) + sg_dma_len(s);
b80df10f845813 lishuo       2024-01-31  147  	}
b80df10f845813 lishuo       2024-01-31  148  
b80df10f845813 lishuo       2024-01-31  149  	phytium_gem_obj->iova = sg_dma_address(sgt->sgl);
b80df10f845813 lishuo       2024-01-31  150  	phytium_gem_obj->sgt = sgt;
b80df10f845813 lishuo       2024-01-31  151  
b80df10f845813 lishuo       2024-01-31  152  	return &phytium_gem_obj->base;
b80df10f845813 lishuo       2024-01-31  153  failed_check_continue:
b80df10f845813 lishuo       2024-01-31  154  	drm_gem_object_release(&phytium_gem_obj->base);
b80df10f845813 lishuo       2024-01-31  155  failed_object_init:
b80df10f845813 lishuo       2024-01-31  156  	kfree(phytium_gem_obj);
b80df10f845813 lishuo       2024-01-31  157  failed_malloc:
b80df10f845813 lishuo       2024-01-31  158  	return ERR_PTR(ret);
b80df10f845813 lishuo       2024-01-31  159  }
b80df10f845813 lishuo       2024-01-31  160  
b80df10f845813 lishuo       2024-01-31  161  int phytium_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
b80df10f845813 lishuo       2024-01-31  162  {
b80df10f845813 lishuo       2024-01-31  163  	struct phytium_gem_object *phytium_obj = to_phytium_gem_obj(obj);
b80df10f845813 lishuo       2024-01-31  164  
b80df10f845813 lishuo       2024-01-31  165  	iosys_map_set_vaddr(map, phytium_obj->vaddr);
b80df10f845813 lishuo       2024-01-31  166  
b80df10f845813 lishuo       2024-01-31  167  	return 0;
b80df10f845813 lishuo       2024-01-31  168  }
b80df10f845813 lishuo       2024-01-31  169  
b80df10f845813 lishuo       2024-01-31  170  void phytium_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
b80df10f845813 lishuo       2024-01-31  171  {
e2cdf30a3e12bb XuYan        2025-04-09  172  }
b80df10f845813 lishuo       2024-01-31  173  
e2cdf30a3e12bb XuYan        2025-04-09 @174  int phytium_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
e2cdf30a3e12bb XuYan        2025-04-09  175  {
e2cdf30a3e12bb XuYan        2025-04-09  176  	return phytium_gem_mmap_obj(obj, vma);
b80df10f845813 lishuo       2024-01-31  177  }
b80df10f845813 lishuo       2024-01-31  178  

:::::: The code at line 174 was first introduced by commit
:::::: e2cdf30a3e12bb55e76d60e99c0abd7db2917b5c drm/phytium: Fix some Bugs in Phytium Display Engine

:::::: TO: XuYan <xuyan1481@phytium.com.cn>
:::::: CC: xuyan <xuyan1481@phytium.com.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
