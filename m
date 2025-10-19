Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06926246782
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Oct 2025 22:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760912696; cv=none; b=p23/Dyd64H+PhBTabdAXQsNqHZJLpfJeMLtacPQvwIj1VNdZvXv38YfhfD/PCSENPpwAIeH4Mn5VVxZHDQ921I98mVRakuXhwSMWouvwC14gIFwyZRjy525YgNNfxL8Tk6DsbSYXZ/iRqkxIBqGZDWcgZi0inkK9UOinzvTPzS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760912696; c=relaxed/simple;
	bh=1LNy99L8zqlHOMwf52esQ3C62U90F1d7tlZehh69oQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TIqa1VNOk4iPWjzT8mPQadFaE0S5gHuk5XaUA9JMK+ECl7cimQ0XXjcMuKN//DXFi/X+QenKQWtvSAJHDG0a5GZCRricmUd0p1lZEkG8eZIhHCXBU2IvEv2doq6zd0w3z7fJUtT5XKt75NfTXVhGFC+AgZXrHsaEPt2n6xqdZl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPa6PkIm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPa6PkIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760912695; x=1792448695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1LNy99L8zqlHOMwf52esQ3C62U90F1d7tlZehh69oQ8=;
  b=YPa6PkIm+MxPcyB2OH76X4NHo3w/79Jsh0xocsyY8kms0lrMQuJ2gy1f
   nweo5MQp1h5lUymNO0okEjFL0LoGAMiuohv31jRkLkQWps3kwJKH4ZcL6
   uttjBUGV3L2pnHmzVNtITkqe1vLww7DxD6cibXSzAL0P9WURkDepPHR1R
   spGRsj72Pef8zx9/TnxEruZpB8PODhRb0SVuzfXHoldDGsFCp6g162sZ2
   sDQ5FRa/3gBChOGgvOyrOgp4JuUQoBryAjXVRNctqQ1maYpSk1Y7gfm80
   ozD2OMncd5q8ogXy9YHs625Z2t/HUnIPva/3YsPedhqExcSghCN54CFPC
   A==;
X-CSE-ConnectionGUID: 6F57uPE5TOSX7jekNOio9A==
X-CSE-MsgGUID: +er5mXhKQVqXIXwARp8s9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="63184853"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="63184853"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 15:24:55 -0700
X-CSE-ConnectionGUID: l97go/YMQ/+CcswmoeJD6A==
X-CSE-MsgGUID: tUiSXWyMRICVOXx+/P4M0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="183602792"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 19 Oct 2025 15:24:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAbpb-0009Kv-0J;
	Sun, 19 Oct 2025 22:24:51 +0000
Date: Mon, 20 Oct 2025 06:24:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommufd_dmabuf 15/28]
 drivers/vfio/pci/nvgrace-gpu/main.c:716:1: warning: control reaches end of
 non-void function
Message-ID: <202510200619.a56qirOl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommufd_dmabuf
head:   fa05815572860da32b9145bb5e396a511cc081a9
commit: b223fd6ff7a3c77e15e53a2068a3906acf8f178b [15/28] vfio/nvgrace: Support get_dmabuf_phys
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20251020/202510200619.a56qirOl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510200619.a56qirOl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510200619.a56qirOl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:382,
                    from arch/um/include/asm/current.h:5,
                    from include/linux/mutex.h:14,
                    from include/linux/vfio_pci_core.h:11,
                    from drivers/vfio/pci/nvgrace-gpu/main.c:7:
   drivers/vfio/pci/nvgrace-gpu/main.c: In function 'nvgrace_get_dmabuf_phys':
   include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/vfio_pci_core.h:75:39: note: in expansion of macro 'NULL'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^~~~
   drivers/vfio/pci/nvgrace-gpu/main.c:714:16: note: in expansion of macro 'vfio_pci_core_get_dmabuf_phys'
     714 |         return vfio_pci_core_get_dmabuf_phys(core_vdev, provider, region_index,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/vfio/pci/nvgrace-gpu/main.c:716:1: warning: control reaches end of non-void function [-Wreturn-type]
     716 | }
         | ^


vim +716 drivers/vfio/pci/nvgrace-gpu/main.c

   686	
   687	static int nvgrace_get_dmabuf_phys(struct vfio_pci_core_device *core_vdev,
   688					   struct p2pdma_provider **provider,
   689					   unsigned int region_index,
   690					   struct phys_vec *phys_vec,
   691					   struct vfio_region_dma_range *dma_ranges,
   692					   size_t nr_ranges)
   693	{
   694		struct nvgrace_gpu_pci_core_device *nvdev = container_of(
   695			core_vdev, struct nvgrace_gpu_pci_core_device, core_device);
   696		struct pci_dev *pdev = core_vdev->pdev;
   697	
   698		if (region_index == RESMEM_REGION_INDEX) {
   699			*provider = pcim_p2pdma_provider(pdev, 0);
   700			if (!*provider)
   701				return -EINVAL;
   702			return vfio_pci_core_fill_phys_vec(phys_vec, dma_ranges,
   703							   nr_ranges,
   704							   nvdev->resmem.memphys,
   705							   nvdev->resmem.memlength);
   706		} else if (region_index == USEMEM_REGION_INDEX) {
   707			/* Indicates cachable memory. */
   708			*provider = NULL;
   709			return vfio_pci_core_fill_phys_vec(phys_vec, dma_ranges,
   710							   nr_ranges,
   711							   nvdev->usemem.memphys,
   712							   nvdev->usemem.memlength);
   713		}
 > 714		return vfio_pci_core_get_dmabuf_phys(core_vdev, provider, region_index,
   715						     phys_vec, dma_ranges, nr_ranges);
 > 716	}
   717	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
