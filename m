Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC6524E4B5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 14:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781275613; cv=none; b=cyd/068GgSWTzX80lMDxSkZNmKQih+5BY1VbPZLA5hklctjNtiJofV05GPDDB6I4JUWNcvu0CjUQqulBIAXtcXEQ+G2wl6Mzhxqi09HAI1xnWljcO3vDzD2LREyyzSzTiG8PoT9Xu0ptheZhTz87b9LUGf5WHlrXVj/RAypGcdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781275613; c=relaxed/simple;
	bh=tkZpLjIDq1J8df88E6mW90KgmxfYDSLu1z52l/HMXCI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pA0Bdgg49GMtNdeyN8mPnT+X/nxWP4CGgmrF9b3VfJkObn0nRbXpElEeed8jkmtzrHNSzJ7lSkTeIEoVmbmzv61fcNUl1CyyXG9mcX9oDPu/fIRkbxLRr/NJf46PFQEt3OPo/MC9i6s95Dv32HgrHXFdvnLtEQx5cLRrelaO1YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2blkDlg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2blkDlg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781275611; x=1812811611;
  h=date:from:to:cc:subject:message-id;
  bh=tkZpLjIDq1J8df88E6mW90KgmxfYDSLu1z52l/HMXCI=;
  b=l2blkDlgnG4Qxwd3Rt8cVYEZNZT+q6LxoT61M6Nq2P8jGl1t8QXQw4w9
   n9hxjv/Axad7oxwp0FJzunFbCTHqKdOin7effsUQ38AmjMIB95Drvfgox
   rsDX9tTnuSEOyVuEYdeuD0gftVXH7wHsJtqCj/R7yM8wsQjOuV0MHioz4
   vqlXHNBxKcA4WH63hGVGFJHLXL8d37hgmQxYMRvoDhYrHANtqHFrTLm2A
   QNzD7uDO4I8iq0EhnZEXDkZTN2Gv6HbSwK+/ApB2oVicBi3RF9BB1mZAN
   CgN7+coQ8SxARxe4Qa/rZWSvmPq2o/p1THZyYjOJGP1RxAbmt4oMmJR4p
   Q==;
X-CSE-ConnectionGUID: Sk8tkIbFTw+rHqtvWA7FKA==
X-CSE-MsgGUID: jgQ8GmN2RNu7Ve0bLb86AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81949586"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="81949586"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 07:46:50 -0700
X-CSE-ConnectionGUID: jaI9/HIiTmK6BEkgwJe1QA==
X-CSE-MsgGUID: ZUzoOxQARh6g1zVyYUNGGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="248726260"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jun 2026 07:46:49 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY39j-00000000Otr-01Ap;
	Fri, 12 Jun 2026 14:46:47 +0000
Date: Fri, 12 Jun 2026 22:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 12/12]
 drivers/accel/adla_legacy/kmd/drv/common/mm/adlak_mm_cma.c:191:18: warning:
 cast from pointer to integer of different size
Message-ID: <202606122220.9iFeos9n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   3e1cd9728037a89d53b1973467e84cf36e811d34
commit: 3e1cd9728037a89d53b1973467e84cf36e811d34 [12/12] Temporary use Adla Legacy driver
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260612/202606122220.9iFeos9n-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606122220.9iFeos9n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606122220.9iFeos9n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/accel/adla_legacy/kmd/drv/port/os/linux/mm/adlak_mm_os_common.c: In function 'adlak_os_attach_ext_mem':
>> drivers/accel/adla_legacy/kmd/drv/port/os/linux/mm/adlak_mm_os_common.c:413:27: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     413 |     mm_info->dma_addr   = (dma_addr_t)NULL;
         |                           ^
   drivers/accel/adla_legacy/kmd/drv/port/os/linux/mm/adlak_mm_os_common.c: In function 'adlak_os_mmap':
   drivers/accel/adla_legacy/kmd/drv/port/os/linux/mm/adlak_mm_os_common.c:438:34: warning: variable 'vm_page_prot' set but not used [-Wunused-but-set-variable=]
     438 |     pgprot_t                     vm_page_prot;
         |                                  ^~~~~~~~~~~~
--
   drivers/accel/adla_legacy/kmd/drv/common/mm/adlak_mm_cma.c: In function 'adlak_malloc_from_mem_pool':
>> drivers/accel/adla_legacy/kmd/drv/common/mm/adlak_mm_cma.c:191:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     191 |         (void *)((dma_addr_t)ptr_mm_cma->mem_pool->cpu_addr_base + (dma_addr_t)start);
         |                  ^
>> drivers/accel/adla_legacy/kmd/drv/common/mm/adlak_mm_cma.c:191:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     191 |         (void *)((dma_addr_t)ptr_mm_cma->mem_pool->cpu_addr_base + (dma_addr_t)start);
         |         ^


vim +191 drivers/accel/adla_legacy/kmd/drv/common/mm/adlak_mm_cma.c

   172	
   173	static int adlak_malloc_from_mem_pool(struct adlak_mem *mm, struct adlak_mem_handle *mm_info) {
   174	    unsigned long start;
   175	    AML_LOG_DEBUG("%s", __func__);
   176	    if (!(mm_info->req.mem_type & ADLAK_ENUM_MEMTYPE_INNER_SHARE)) {
   177	        start = adlak_alloc_from_bitmap_pool(&ptr_mm_cma->mem_pool->bitmap_area,
   178	                                             (size_t)mm_info->req.bytes);
   179	    } else {
   180	        start = adlak_alloc_share_buf_from_bitmap_pool_reverse(mm, (size_t)mm_info->req.bytes);
   181	    }
   182	
   183	    if (ADLAK_IS_ERR((void *)start)) {
   184	        mm_info->phys_addr = 0;
   185	        return ERR(ENOMEM);
   186	    }
   187	
   188	    mm_info->from_pool = 1;
   189	    mm_info->mem_src   = ptr_mm_cma->mem_pool->mem_src;
   190	    mm_info->cpu_addr =
 > 191	        (void *)((dma_addr_t)ptr_mm_cma->mem_pool->cpu_addr_base + (dma_addr_t)start);
   192	    mm_info->dma_addr  = ptr_mm_cma->mem_pool->dma_addr_base + (dma_addr_t)start;
   193	    mm_info->phys_addr = ptr_mm_cma->mem_pool->phys_addr_base + (phys_addr_t)start;
   194	
   195	    mm_info->iova_addr = mm_info->phys_addr;
   196	
   197	    return ERR(NONE);
   198	}
   199	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
