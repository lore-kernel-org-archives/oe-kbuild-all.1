Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B09F12B63
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 01:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738718129; cv=none; b=eHzkPXW8tzxMhNCRwMeya/F2tzW5ALGUoKl+ZJfv5xIj6H/hhlpN24Lde539tqH0IkApQk6ijGRh2NOQKYHdioZ4Fkf2crMSjxz0DdixonvQN7UFlwPOpsaFDtAZirsQ53HOlv+BsWIk7O4Mou4gLYCa8qCndWQMv0c4em2Rx6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738718129; c=relaxed/simple;
	bh=Ed6vjEfw9r1wd/LBwTOwJ57S2gdUILiTOzMv9Kc0pvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H5g39hRjv7l12c+l9Iqoo5tTixzkiZXMBz0qEFA5XSbVmG3xau6fH66RRc0sJRZFBRoMxheIN/teeSf0xpWrejjH8c+9zBMPjLXd6IeTXUFM3sQS70UCIyU0DuD/iLRMmMCtpJrE7dUkD1ls2YXKweZyeOWJA2Kg5v0qBqEP0LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eu2eaYER; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eu2eaYER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738718127; x=1770254127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ed6vjEfw9r1wd/LBwTOwJ57S2gdUILiTOzMv9Kc0pvI=;
  b=Eu2eaYERtUZNx4M2x56llLuT/0lpM3anF6BR6rtf491piX/IZmf2FnEa
   JmT14CC9aL+/eihwQ3VI1g+VOoCNVYyws97Tw5tyeaOSht0aX3j+CrZg+
   r3Cl4upKpm16eIZSMnAHEJfp9qgEMuwzC4kn8jFaI/kRB+q7NSNXlSnqz
   kNgfgeM43ZRxCWGUKmtIBHasaLO7J8HsijQkHesqIu8XRKhqvnod04Z3l
   W29hn6ax3MtCyx8D0af2Ur/8GwjkWifx9hqv9cH1AYP3p/8iQ2U4UQaf3
   DpIL+KmFn/Wpq/heMhwWTD44Ij9qqIUeS6Y9jPQ5EVOJh4ctYajDy3BH5
   Q==;
X-CSE-ConnectionGUID: bvdXI2P+SlKEDhbK5kt4QQ==
X-CSE-MsgGUID: fy8Q+WYZTdmDHTceO/fTGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43190321"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="43190321"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 17:15:25 -0800
X-CSE-ConnectionGUID: 9Bhzi9cgTsiMiZNmG9iCOg==
X-CSE-MsgGUID: KwjIxCBVQpWxoh7jxXDAqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="110647425"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Feb 2025 17:15:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfU0f-000tHP-1i;
	Wed, 05 Feb 2025 01:15:21 +0000
Date: Wed, 5 Feb 2025 09:14:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 0/2]
 drivers/iommu/io-pgtable-arm.c:666:20: error: implicit declaration of
 function 'iommu_pgsize'
Message-ID: <202502050945.z0AlNrsV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Swathi,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a8bf86a0e0fa05070897a210d706d5c4d83c26ac
commit: 27de1978c331d4e7571a5d0187ef1802d65dbf65 [0/2] ANDROID: GKI: iommu/io-pgtable-arm: LPAE related updates by vendor
config: x86_64-buildonly-randconfig-003-20241212 (https://download.01.org/0day-ci/archive/20250205/202502050945.z0AlNrsV-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050945.z0AlNrsV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050945.z0AlNrsV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_object.c:60: error: Cannot parse struct or union!
   drivers/gpu/drm/ttm/ttm_object.c:98: warning: Function parameter or member 'mem_glob' not described in 'ttm_object_device'
   drivers/gpu/drm/ttm/ttm_object.c:98: warning: Function parameter or member 'ops' not described in 'ttm_object_device'
   drivers/gpu/drm/ttm/ttm_object.c:98: warning: Function parameter or member 'dmabuf_release' not described in 'ttm_object_device'
   drivers/gpu/drm/ttm/ttm_object.c:98: warning: Function parameter or member 'dma_buf_size' not described in 'ttm_object_device'
   drivers/gpu/drm/ttm/ttm_object.c:129: warning: Function parameter or member 'rcu_head' not described in 'ttm_ref_object'
   drivers/gpu/drm/ttm/ttm_object.c:129: warning: Function parameter or member 'tfile' not described in 'ttm_ref_object'
   drivers/gpu/drm/ttm/ttm_object.c:561: warning: Function parameter or member 'dmabuf' not described in 'get_dma_buf_unless_doomed'
   drivers/gpu/drm/ttm/ttm_object.c:561: warning: Excess function parameter 'dma_buf' description in 'get_dma_buf_unless_doomed'
--
   drivers/iommu/io-pgtable-arm.c:312:16: error: implicit declaration of function 'io_pgtable_alloc_pages_exact' [-Werror,-Wimplicit-function-declaration]
     312 |         void *pages = io_pgtable_alloc_pages_exact(cfg, cookie, size,
         |                       ^
   drivers/iommu/io-pgtable-arm.c:312:8: error: incompatible integer to pointer conversion initializing 'void *' with an expression of type 'int' [-Wint-conversion]
     312 |         void *pages = io_pgtable_alloc_pages_exact(cfg, cookie, size,
         |               ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     313 |                                                    gfp | __GFP_ZERO);
         |                                                    ~~~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-arm.c:337:2: error: implicit declaration of function 'io_pgtable_free_pages_exact' [-Werror,-Wimplicit-function-declaration]
     337 |         io_pgtable_free_pages_exact(cfg, cookie, pages, size);
         |         ^
   drivers/iommu/io-pgtable-arm.c:347:2: error: implicit declaration of function 'io_pgtable_free_pages_exact' [-Werror,-Wimplicit-function-declaration]
     347 |         io_pgtable_free_pages_exact(cfg, cookie, pages, size);
         |         ^
   drivers/iommu/io-pgtable-arm.c:572:19: error: use of undeclared identifier 'IOMMU_USE_UPSTREAM_HINT'
     572 |                 else if (prot & IOMMU_USE_UPSTREAM_HINT)
         |                                 ^
   drivers/iommu/io-pgtable-arm.c:575:19: error: use of undeclared identifier 'IOMMU_USE_LLC_NWA'
     575 |                 else if (prot & IOMMU_USE_LLC_NWA)
         |                                 ^
>> drivers/iommu/io-pgtable-arm.c:666:20: error: implicit declaration of function 'iommu_pgsize' [-Werror,-Wimplicit-function-declaration]
     666 |                         size_t pgsize = iommu_pgsize(
         |                                         ^
   drivers/iommu/io-pgtable-arm.c:767:9: error: implicit declaration of function 'iommu_pgsize' [-Werror,-Wimplicit-function-declaration]
     767 |         size = iommu_pgsize(data->iop.cfg.pgsize_bitmap, iova, size);
         |                ^
   drivers/iommu/io-pgtable-arm.c:901:19: error: implicit declaration of function 'iommu_pgsize' [-Werror,-Wimplicit-function-declaration]
     901 |                 size_to_unmap = iommu_pgsize(data->iop.cfg.pgsize_bitmap, iova,
         |                                 ^
   drivers/iommu/io-pgtable-arm.c:1095:4: error: field designator 'map_sg' does not refer to any field in type 'struct io_pgtable_ops'
    1095 |                 .map_sg         = arm_lpae_map_sg,
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-arm.c:1098:4: error: field designator 'is_iova_coherent' does not refer to any field in type 'struct io_pgtable_ops'
    1098 |                 .is_iova_coherent = arm_lpae_is_iova_coherent,
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-arm.c:1099:4: error: field designator 'iova_to_pte' does not refer to any field in type 'struct io_pgtable_ops'; did you mean 'iova_to_phys'?
    1099 |                 .iova_to_pte    = arm_lpae_iova_get_pte,
         |                  ^~~~~~~~~~~
         |                  iova_to_phys
   include/linux/io-pgtable.h:132:16: note: 'iova_to_phys' declared here
     132 |         phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
         |                       ^
   drivers/iommu/io-pgtable-arm.c:1099:18: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    1099 |                 .iova_to_pte    = arm_lpae_iova_get_pte,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-arm.c:1097:19: note: previous initialization is here
    1097 |                 .iova_to_phys   = arm_lpae_iova_to_phys,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-arm.c:1113:8: error: use of undeclared identifier 'IO_PGTABLE_QUIRK_QCOM_USE_UPSTREAM_HINT'
    1113 |                           | IO_PGTABLE_QUIRK_QCOM_USE_UPSTREAM_HINT
         |                             ^
   drivers/iommu/io-pgtable-arm.c:1114:8: error: use of undeclared identifier 'IO_PGTABLE_QUIRK_QSMMUV500_NON_SHAREABLE'
    1114 |                           | IO_PGTABLE_QUIRK_QSMMUV500_NON_SHAREABLE
         |                             ^
   drivers/iommu/io-pgtable-arm.c:1115:8: error: use of undeclared identifier 'IO_PGTABLE_QUIRK_QCOM_USE_LLC_NWA'
    1115 |                           | IO_PGTABLE_QUIRK_QCOM_USE_LLC_NWA))
         |                             ^
   drivers/iommu/io-pgtable-arm.c:1127:26: error: use of undeclared identifier 'IO_PGTABLE_QUIRK_QCOM_USE_UPSTREAM_HINT'
    1127 |         else if ((cfg->quirks & IO_PGTABLE_QUIRK_QCOM_USE_UPSTREAM_HINT) &&
         |                                 ^
   drivers/iommu/io-pgtable-arm.c:1128:18: error: use of undeclared identifier 'IO_PGTABLE_QUIRK_QSMMUV500_NON_SHAREABLE'
    1128 |                 (cfg->quirks & IO_PGTABLE_QUIRK_QSMMUV500_NON_SHAREABLE))
         |                                ^
   drivers/iommu/io-pgtable-arm.c:1132:25: error: use of undeclared identifier 'IO_PGTABLE_QUIRK_QCOM_USE_UPSTREAM_HINT'
    1132 |         else if (cfg->quirks & IO_PGTABLE_QUIRK_QCOM_USE_UPSTREAM_HINT)
         |                                ^
   drivers/iommu/io-pgtable-arm.c:1136:26: error: use of undeclared identifier 'IO_PGTABLE_QUIRK_QCOM_USE_LLC_NWA'
    1136 |         else if ((cfg->quirks & IO_PGTABLE_QUIRK_QCOM_USE_LLC_NWA) &&
         |                                 ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +/iommu_pgsize +666 drivers/iommu/io-pgtable-arm.c

   625	
   626	static int arm_lpae_map_sg(struct io_pgtable_ops *ops, unsigned long iova,
   627				   struct scatterlist *sg, unsigned int nents,
   628				   int iommu_prot, size_t *size)
   629	{
   630		struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
   631		arm_lpae_iopte *ptep = data->pgd;
   632		int lvl = ARM_LPAE_START_LVL(data);
   633		arm_lpae_iopte prot;
   634		struct scatterlist *s;
   635		size_t mapped = 0;
   636		int i;
   637		int ret = -EINVAL;
   638		unsigned int min_pagesz;
   639		struct io_pgtable_cfg *cfg = &data->iop.cfg;
   640		struct map_state ms;
   641	
   642		/* If no access, then nothing to do */
   643		if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
   644			goto out_err;
   645	
   646		prot = arm_lpae_prot_to_pte(data, iommu_prot);
   647	
   648		min_pagesz = 1 << __ffs(cfg->pgsize_bitmap);
   649	
   650		memset(&ms, 0, sizeof(ms));
   651	
   652		for_each_sg(sg, s, nents, i) {
   653			phys_addr_t phys = page_to_phys(sg_page(s)) + s->offset;
   654			size_t size = s->length;
   655	
   656			/*
   657			 * We are mapping on IOMMU page boundaries, so offset within
   658			 * the page must be 0. However, the IOMMU may support pages
   659			 * smaller than PAGE_SIZE, so s->offset may still represent
   660			 * an offset of that boundary within the CPU page.
   661			 */
   662			if (!IS_ALIGNED(s->offset, min_pagesz))
   663				goto out_err;
   664	
   665			while (size) {
 > 666				size_t pgsize = iommu_pgsize(
   667					cfg->pgsize_bitmap, iova | phys, size);
   668	
   669				if (ms.pgtable && (iova < ms.iova_end)) {
   670					arm_lpae_iopte *ptep = ms.pgtable +
   671						ARM_LPAE_LVL_IDX(iova, MAP_STATE_LVL,
   672								 data);
   673					arm_lpae_init_pte(
   674						data, iova, phys, prot, MAP_STATE_LVL,
   675						ptep, ms.prev_pgtable, false);
   676					ms.num_pte++;
   677				} else {
   678					ret = __arm_lpae_map(data, iova, phys, pgsize,
   679							prot, lvl, ptep, NULL, &ms);
   680					if (ret)
   681						goto out_err;
   682				}
   683	
   684				iova += pgsize;
   685				mapped += pgsize;
   686				phys += pgsize;
   687				size -= pgsize;
   688			}
   689		}
   690	
   691		if (ms.pgtable)
   692			pgtable_dma_sync_single_for_device(cfg,
   693				__arm_lpae_dma_addr(ms.pte_start),
   694				ms.num_pte * sizeof(*ms.pte_start),
   695				DMA_TO_DEVICE);
   696	
   697		/*
   698		 * Synchronise all PTE updates for the new mapping before there's
   699		 * a chance for anything to kick off a table walk for the new iova.
   700		 */
   701		wmb();
   702	
   703		return mapped;
   704	
   705	out_err:
   706		/* Return the size of the partial mapping so that they can be undone */
   707		*size = mapped;
   708		return ret;
   709	}
   710	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
