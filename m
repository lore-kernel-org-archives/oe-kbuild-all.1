Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873DA27FD40
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 19:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758049546; cv=none; b=ZP2LS4d8F8IP4tgoLg1D77Euh8eC+nygzO5n4EvSfDdqjk+MCVKbF5yzji12TEIvcIaqyec+DEeGxLegiq3hkQDO9xTjQCEWIVu5zxS8V8aAw+tOIcUrx6nprrzhwDfh3JBFyS1WfyRo50EwRCvuNDJkbcNZlXgdvLIz6QmeDUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758049546; c=relaxed/simple;
	bh=dc1O+7n2Hk8I2YEJDI0KZ1OerJNAV0Jf6ShHSHlta8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RbWT//BSH1tDLEtdxAL81O+Z1u6coHo0LG31onCh0ZhyIwm95hYVh5Vdm6DfEQ7arJ5km4N1Z3vS/IXayCM6kAs/LrZIn4sjK6wEwXeocYv05Y3F9RBJI46LrD+Jn+PHxp90vAbDWG4xCHx5NoUhmg0DCBDcklIXIPCD0lkJ1WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNE+ZBEH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNE+ZBEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758049544; x=1789585544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dc1O+7n2Hk8I2YEJDI0KZ1OerJNAV0Jf6ShHSHlta8s=;
  b=aNE+ZBEHk2DtJXXQpr7zuUj6PoE8NjX1BzjdmTaVmeItILexh2gh9Izj
   HxTC6NPgOJbzrWPJI9myub7/mtKrq3oVSFmZXcwKo/xVVCh5/1EyYvaAo
   LGq84UDY5vYc9YoXoOYrSzpchr3/nI0YKdOSzT7Yao+b4q931ntHrptJ/
   WzUNVDSJgOHOEHDCR1GWT/EVUwBuHJ+I3IXKYpMDmw7eXuT2V+5sTFmOW
   +5SEp2fdwizGEnvgsBIUWk4sRqQ2SS297yS1V6nRu2lu/j/2XH1xsKkt+
   H27Z4NjGMKH8+KpEmD0vSeAYCyHJrzC3qVtaD+KNY6Zov3jkoXKl03bfw
   A==;
X-CSE-ConnectionGUID: 40kJ4E6YTCO7dA5Q0h3aSw==
X-CSE-MsgGUID: VsccXK4nThyi6nVvBdFrDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="59387908"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="59387908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 12:05:43 -0700
X-CSE-ConnectionGUID: iX0GtgfBQLWf3fCgGaqhcQ==
X-CSE-MsgGUID: LtP1UIYvQDaaxl+olQUrVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="179323284"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Sep 2025 12:05:41 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyazk-0000fh-0x;
	Tue, 16 Sep 2025 19:05:40 +0000
Date: Wed, 17 Sep 2025 03:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 37/42] arch/powerpc/kernel/iommu.c:866:8:
 warning: assignment to 'void *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202509170224.8ScJTbjN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   887b59804850b679831fda6eba707cc1b1b077e0
commit: 7b4af8522254f58e9c812362d173b7417a7cc3da [37/42] powerpc: Convert to physical address DMA mapping
config: powerpc64-randconfig-002-20250916 (https://download.01.org/0day-ci/archive/20250917/202509170224.8ScJTbjN-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170224.8ScJTbjN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170224.8ScJTbjN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/kernel/iommu.c: In function 'iommu_map_phys':
   arch/powerpc/kernel/iommu.c:866:10: error: implicit declaration of function 'phsy_to_virt'; did you mean 'phys_to_virt'? [-Werror=implicit-function-declaration]
     vaddr = phsy_to_virt(phys);
             ^~~~~~~~~~~~
             phys_to_virt
>> arch/powerpc/kernel/iommu.c:866:8: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     vaddr = phsy_to_virt(phys);
           ^
   cc1: some warnings being treated as errors


vim +866 arch/powerpc/kernel/iommu.c

   848	
   849	/* Creates TCEs for a user provided buffer.  The user buffer must be
   850	 * contiguous real kernel storage (not vmalloc).  The address passed here
   851	 * is physical address into that page. The dma_addr_t returned will point
   852	 * to the same byte within the page as was passed in.
   853	 */
   854	dma_addr_t iommu_map_phys(struct device *dev, struct iommu_table *tbl,
   855				  phys_addr_t phys, size_t size, unsigned long mask,
   856				  enum dma_data_direction direction,
   857				  unsigned long attrs)
   858	{
   859		dma_addr_t dma_handle = DMA_MAPPING_ERROR;
   860		void *vaddr;
   861		unsigned long uaddr;
   862		unsigned int npages, align;
   863	
   864		BUG_ON(direction == DMA_NONE);
   865	
 > 866		vaddr = phsy_to_virt(phys);
   867		uaddr = (unsigned long)vaddr;
   868	
   869		if (tbl) {
   870			npages = iommu_num_pages(uaddr, size, IOMMU_PAGE_SIZE(tbl));
   871			align = 0;
   872			if (tbl->it_page_shift < PAGE_SHIFT && size >= PAGE_SIZE &&
   873			    ((unsigned long)vaddr & ~PAGE_MASK) == 0)
   874				align = PAGE_SHIFT - tbl->it_page_shift;
   875	
   876			dma_handle = iommu_alloc(dev, tbl, vaddr, npages, direction,
   877						 mask >> tbl->it_page_shift, align,
   878						 attrs);
   879			if (dma_handle == DMA_MAPPING_ERROR) {
   880				if (!(attrs & DMA_ATTR_NO_WARN) &&
   881				    printk_ratelimit())  {
   882					dev_info(dev, "iommu_alloc failed, tbl %p "
   883						 "vaddr %p npages %d\n", tbl, vaddr,
   884						 npages);
   885				}
   886			} else
   887				dma_handle |= (uaddr & ~IOMMU_PAGE_MASK(tbl));
   888		}
   889	
   890		return dma_handle;
   891	}
   892	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
