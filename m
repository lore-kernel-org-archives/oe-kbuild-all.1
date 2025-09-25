Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFBB23A9B3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Sep 2025 22:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758839021; cv=none; b=I/IY70KCRzGOaUtVKFnY33sxkOEhgB8dlgqKWu1DrqOEUOpPaJt5PybEtWbFkfS801dAY+oo7jP/RnlItGPCcEygVdiPAnxhVP2u8TBSLGJVZHT2lRelpg1sCidqj3VOExywQq0GCkTNH/MRtM4J/uYebuKTyEjDul60C7znwPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758839021; c=relaxed/simple;
	bh=EmA6HEb2TFN47uJP4mNNyEaHadk+6dOHnbPutnCNKb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UblEvihCv+l+sHaGM2yG/QIX6k12agsew6kmezf0Lg5ghGhIlWMjnztO0N7iMDLh8JZTYc0QyKyLIrHOd3SM40AHxRaMhIYSnJXCu0wLrwRR1eDrkgBjm3zHL5BHanm/4kgyQaqDt77ailoRvgTrRTrdFlAXzCssivlQ32Gku60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lz0/VPCW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lz0/VPCW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758839020; x=1790375020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EmA6HEb2TFN47uJP4mNNyEaHadk+6dOHnbPutnCNKb0=;
  b=lz0/VPCWUL9tdUZu7dxtRkk5SeNM3ViAZQEuyY8Hwh8KNrQIn5egCSC+
   EEAvk+E+6+Ivi/mQkkFcu8PwLicXKvllqMVLq1ns/CLOQUxOPQLVaL/1u
   GUuaykk/h0ZAQHT5QSaJa0IOFa2Y1uuBBb/ymqoXNhJdJVsZTn/pCEraU
   iljstt2eos68CeSz9iQvnUIMFzdK8+cldKQjCl/8dgnBo/mIa/DcB1CCA
   6Nug/zlU0tIdxLuktFuwTog/7zsIloN3nCu3v0hf0RNyFPTbaroSrZfhh
   l3NopRpQt+e62Jb42Fm12NhAgKU7BOl/KmhK98dfNIcEZBtRrnoAbDsm1
   Q==;
X-CSE-ConnectionGUID: /XNL2SMFT/G754EMCF7FQw==
X-CSE-MsgGUID: Zl/FdPHqR+a8YNMP7LfCuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="64802709"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="64802709"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 15:23:40 -0700
X-CSE-ConnectionGUID: vFooFk1oQKW2BEFgBtIQhw==
X-CSE-MsgGUID: D1sZktm9THug5ftqupkkgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="181839819"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Sep 2025 15:23:38 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1uNE-0005g7-0Y;
	Thu, 25 Sep 2025 22:23:36 +0000
Date: Fri, 26 Sep 2025 06:23:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3218/3218]
 kernel/dma/phytium/pswiotlb-mapping.c:308:30: warning: no previous prototype
 for 'pswiotlb_clone_orig_dma_ops'
Message-ID: <202509260644.BcnW2VXb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   26e6aab08db562ec2a74b2125bddcc9a68cb6d5c
commit: 9bc24f753631ce5a80c2c6c36372981726746cf4 [3218/3218] dma: pswiotlb: Move pswiotlb dma functions behind dma_map_ops
config: arm64-randconfig-003-20250926 (https://download.01.org/0day-ci/archive/20250926/202509260644.BcnW2VXb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509260644.BcnW2VXb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509260644.BcnW2VXb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/phytium/pswiotlb-mapping.c:308:30: warning: no previous prototype for 'pswiotlb_clone_orig_dma_ops' [-Wmissing-prototypes]
     308 | struct pswiotlb_dma_map_ops *pswiotlb_clone_orig_dma_ops(struct device *dev,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pswiotlb_clone_orig_dma_ops +308 kernel/dma/phytium/pswiotlb-mapping.c

   283	
   284	static const struct dma_map_ops pswiotlb_noiommu_dma_ops = {
   285		.alloc			= pswiotlb_dma_alloc_distribute,
   286		.free			= pswiotlb_dma_free_distribute,
   287		.alloc_pages		= pswiotlb_dma_common_alloc_pages_distribute,
   288		.free_pages		= pswiotlb_dma_common_free_pages_distribute,
   289		.alloc_noncoherent	= pswiotlb_dma_alloc_noncoherent_distribute,
   290		.free_noncoherent	= pswiotlb_dma_free_noncoherent_distribute,
   291		.mmap			= pswiotlb_dma_mmap_distribute,
   292		.get_sgtable		= pswiotlb_dma_get_sgtable_distribute,
   293		.map_page		= pswiotlb_dma_map_page_attrs_distribute,
   294		.unmap_page		= pswiotlb_dma_unmap_page_attrs_distribute,
   295		.map_sg			= pswiotlb_dma_map_sg_attrs_distribute,
   296		.unmap_sg		= pswiotlb_dma_unmap_sg_attrs_distribute,
   297		.sync_single_for_cpu	= pswiotlb_dma_sync_single_for_cpu_distribute,
   298		.sync_single_for_device	= pswiotlb_dma_sync_single_for_device_distribute,
   299		.sync_sg_for_cpu	= pswiotlb_dma_sync_sg_for_cpu_distribute,
   300		.sync_sg_for_device	= pswiotlb_dma_sync_sg_for_device_distribute,
   301		.map_resource		= pswiotlb_dma_map_resource_distribute,
   302		.unmap_resource		= NULL,
   303		.get_merge_boundary	= pswiotlb_dma_get_merge_boundary_distribute,
   304		.get_required_mask  = pswiotlb_dma_get_required_mask_distribute,
   305		.dma_supported = pswiotlb_dma_supported_distribute,
   306		.max_mapping_size   = pswiotlb_dma_max_mapping_size_distribute,
   307	};
 > 308	struct pswiotlb_dma_map_ops *pswiotlb_clone_orig_dma_ops(struct device *dev,
   309				const struct dma_map_ops *ops)
   310	{
   311		struct pswiotlb_dma_map_ops *new_dma_ops = kmalloc(sizeof(struct pswiotlb_dma_map_ops),
   312					GFP_KERNEL);
   313		if (!new_dma_ops)
   314			return NULL;
   315	
   316		memcpy(new_dma_ops, ops, sizeof(struct pswiotlb_dma_map_ops));
   317	
   318		return new_dma_ops;
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
