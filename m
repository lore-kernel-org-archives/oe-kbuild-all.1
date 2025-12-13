Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36C2C8F0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 17:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765648034; cv=none; b=GU6Ol1m//554ursbvmPf7CKlVWhfTwSsnDhSxyK0uJO2t8thSBHf81lfCVumhoHN3yAs/Jin9AuIBP0sbv8QuPbBEIlAoIJpzwtkksCYgTvwEea7CTgiyL1tGaj2+jSpbHwF4LcclontVXndZysdtplOzTJt3RlurTe5vOrTuDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765648034; c=relaxed/simple;
	bh=78D29qJ1xOfq3p6Gjo0cS0f6zP1bxiW+tOEeRTNy1eE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YjqhgpKRYW63Jlofv1MX3gosE3jw5gKiTVBWTk+r88dI8niDErAxf0xil+hsYnQGkwsqYfN6pVVZiVqlcqmuR8BVwvTiLTmpCAozF+lx+/DoMsKFxpaVWcr1GPPwMcjluawFZB0I6lToxuMbonG0Ed6nJivKgukjcT/wc8yMiwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hn6tSmRY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hn6tSmRY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765648033; x=1797184033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=78D29qJ1xOfq3p6Gjo0cS0f6zP1bxiW+tOEeRTNy1eE=;
  b=Hn6tSmRYn0Q0f0R8jrDPw0wd/b/LhNRVx+CsT55/lN+Xxu9mWAsQK7cG
   MhK6GpyrPjFCRnItjH51o6L/lwEFMmEg+dsMkbV/eCypDbJz6KkJEVaet
   dqata7PoEqeVNuVAQIZtQENz0fZrtsWmmLn9HI5O7i/ql9qmab/UFpBGA
   HoATtKeMUswS3mKSeQZ9hbKrgVvRCo7uSxzWmii4LYdmn+A0T1tYwXYB7
   Z4lp0tou8GpjjXlg37qPsOL5E2946iRaizFsTWo6YAWlrPWGJkk6p7W09
   zrCz6i1Y4hv7AUbNWQwYmbUGYf1WJxClF2dWGp4EgVLwi/QEJBX3+vEOp
   w==;
X-CSE-ConnectionGUID: H5RVAQYNSduOfsBB4etoKw==
X-CSE-MsgGUID: /sNJfU9sTKaU9Wor3/pkXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="66605771"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="66605771"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 09:47:09 -0800
X-CSE-ConnectionGUID: 2PWFbm0kR8yZUyT+GMjXEg==
X-CSE-MsgGUID: 6iwUPpO4T+KRdnEdsE/qMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="234739988"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Dec 2025 09:47:08 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUThx-0000000080p-41qG;
	Sat, 13 Dec 2025 17:47:05 +0000
Date: Sun, 14 Dec 2025 01:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 18/18]
 drivers/virtio/virtio_msg_ffa_dma_heap.c:278:15: warning: unused variable
 'page'
Message-ID: <202512140156.b9FGoVHm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   e70cc743402c47048f65c4f9d065c129d5293fd5
commit: e70cc743402c47048f65c4f9d065c129d5293fd5 [18/18] temp
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251214/202512140156.b9FGoVHm-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140156.b9FGoVHm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140156.b9FGoVHm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_msg_ffa_dma_heap.c:278:15: warning: unused variable 'page' [-Wunused-variable]
     278 |         struct page *page = sg_page(table->sgl);
         |                      ^~~~
>> drivers/virtio/virtio_msg_ffa_dma_heap.c:308:13: warning: variable 'dma_handle' set but not used [-Wunused-but-set-variable]
     308 |         dma_addr_t dma_handle;
         |                    ^
   2 warnings generated.


vim +/page +278 drivers/virtio/virtio_msg_ffa_dma_heap.c

5f761d9629b02c Viresh Kumar 2025-10-31  272  
5f761d9629b02c Viresh Kumar 2025-10-31  273  static void ffa_heap_dma_buf_release(struct dma_buf *dmabuf)
5f761d9629b02c Viresh Kumar 2025-10-31  274  {
5f761d9629b02c Viresh Kumar 2025-10-31  275  	struct ffa_heap_buffer *buffer = dmabuf->priv;
e70cc743402c47 Viresh Kumar 2025-12-11  276  	struct device *dev = dma_heap_get_drvdata(buffer->heap);
5f761d9629b02c Viresh Kumar 2025-10-31  277  	struct sg_table *table = &buffer->sg_table;
5f761d9629b02c Viresh Kumar 2025-10-31 @278  	struct page *page = sg_page(table->sgl);
5f761d9629b02c Viresh Kumar 2025-10-31  279  
e70cc743402c47 Viresh Kumar 2025-12-11  280  	dma_free_coherent(dev, buffer->len, buffer->addr, buffer->dma_handle);
5f761d9629b02c Viresh Kumar 2025-10-31  281  	sg_free_table(table);
5f761d9629b02c Viresh Kumar 2025-10-31  282  	kfree(buffer);
5f761d9629b02c Viresh Kumar 2025-10-31  283  }
5f761d9629b02c Viresh Kumar 2025-10-31  284  
5f761d9629b02c Viresh Kumar 2025-10-31  285  static void ffa_heap_dma_buf_unshmem(struct dma_buf *dmabuf)
5f761d9629b02c Viresh Kumar 2025-10-31  286  {
e70cc743402c47 Viresh Kumar 2025-12-11  287  //	struct ffa_heap_buffer *buffer = dmabuf->priv;
e70cc743402c47 Viresh Kumar 2025-12-11  288  //	struct device *dev = dma_heap_get_drvdata(buffer->heap);
e70cc743402c47 Viresh Kumar 2025-12-11  289  //	struct sg_table *table = &buffer->sg_table;
e70cc743402c47 Viresh Kumar 2025-12-11  290  //	dma_addr_t dma = buffer->dma_handle;
e70cc743402c47 Viresh Kumar 2025-12-11  291  //
e70cc743402c47 Viresh Kumar 2025-12-11  292  //	if (WARN_ON(!sg_is_last(table->sgl)))
e70cc743402c47 Viresh Kumar 2025-12-11  293  //		return;
e70cc743402c47 Viresh Kumar 2025-12-11  294  //
e70cc743402c47 Viresh Kumar 2025-12-11  295  //	/* Unshare all shared memory areas */
e70cc743402c47 Viresh Kumar 2025-12-11  296  //	vmsg_ffa_bus_area_unshare(dev, &dma, buffer->len / PAGE_SIZE);
5f761d9629b02c Viresh Kumar 2025-10-31  297  }
5f761d9629b02c Viresh Kumar 2025-10-31  298  
5f761d9629b02c Viresh Kumar 2025-10-31  299  static int ffa_heap_dma_buf_shmem(struct dma_buf *dmabuf, void *data)
5f761d9629b02c Viresh Kumar 2025-10-31  300  {
5f761d9629b02c Viresh Kumar 2025-10-31  301  	struct ffa_heap_buffer *buffer = dmabuf->priv;
e70cc743402c47 Viresh Kumar 2025-12-11  302  //	struct device *dev = dma_heap_get_drvdata(buffer->heap);
5f761d9629b02c Viresh Kumar 2025-10-31  303  	struct sg_table *table = &buffer->sg_table;
5f761d9629b02c Viresh Kumar 2025-10-31  304  	struct page *page = sg_page(table->sgl);
5f761d9629b02c Viresh Kumar 2025-10-31  305  	struct vsock_shmem_desc *desc = data;
5f761d9629b02c Viresh Kumar 2025-10-31  306  	struct vsock_shmem_desc_payload_ffa *payload =
5f761d9629b02c Viresh Kumar 2025-10-31  307  		(struct vsock_shmem_desc_payload_ffa *)desc->payload;
5f761d9629b02c Viresh Kumar 2025-10-31 @308  	dma_addr_t dma_handle;
e70cc743402c47 Viresh Kumar 2025-12-11  309  //	int ret;
5f761d9629b02c Viresh Kumar 2025-10-31  310  
5f761d9629b02c Viresh Kumar 2025-10-31  311  	static_assert(sizeof(*payload) <= VSOCK_SHMEM_PAYLOAD_SIZE_MAX);
5f761d9629b02c Viresh Kumar 2025-10-31  312  
5f761d9629b02c Viresh Kumar 2025-10-31  313  	if (WARN_ON(!sg_is_last(table->sgl)))
5f761d9629b02c Viresh Kumar 2025-10-31  314  		return -EINVAL;
5f761d9629b02c Viresh Kumar 2025-10-31  315  
5f761d9629b02c Viresh Kumar 2025-10-31  316  	dma_handle = page_to_phys(page);
e70cc743402c47 Viresh Kumar 2025-12-11  317  //	ret = vmsg_ffa_bus_area_share(dev, page_to_virt(page),
e70cc743402c47 Viresh Kumar 2025-12-11  318  //				      buffer->len / PAGE_SIZE, &dma_handle);
e70cc743402c47 Viresh Kumar 2025-12-11  319  //	if (ret)
e70cc743402c47 Viresh Kumar 2025-12-11  320  //		return ret;
5f761d9629b02c Viresh Kumar 2025-10-31  321  
5f761d9629b02c Viresh Kumar 2025-10-31  322  	desc->type = VSOCK_SHMEM_TYPE_FFA;
5f761d9629b02c Viresh Kumar 2025-10-31  323  	desc->len = sizeof(*desc) + sizeof(*payload);
e70cc743402c47 Viresh Kumar 2025-12-11  324  	payload->dma_handle = buffer->dma_handle;
5f761d9629b02c Viresh Kumar 2025-10-31  325  	payload->size = buffer->len;
e70cc743402c47 Viresh Kumar 2025-12-11  326  //	buffer->dma_handle = dma_handle;
5f761d9629b02c Viresh Kumar 2025-10-31  327  
5f761d9629b02c Viresh Kumar 2025-10-31  328  	return 0;
5f761d9629b02c Viresh Kumar 2025-10-31  329  }
5f761d9629b02c Viresh Kumar 2025-10-31  330  

:::::: The code at line 278 was first introduced by commit
:::::: 5f761d9629b02c3a1bfe08986d990b30a18819ff virtio-msg: ffa: Add DMA-heap allocator

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
