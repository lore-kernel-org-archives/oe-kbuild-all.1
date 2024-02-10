Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06559524A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 04:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707541147; cv=none; b=tSDOllflQsPg1t2LKLUwMgCyGqCcv7ZWj5p4vcDjwFvlJTmcRC3emPuMG8nxxszbImzX6Sd34rRmxErd92fUEZY2CaMN2e8fFt6eG+6zkSbn2IyQusLrUbc8Eoy9DGObGCymdtIQglyo0Vb1XRPS67HaLV2Hw61vLLPkpr7F/2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707541147; c=relaxed/simple;
	bh=4nOY6RagxZdgaNgGF1fQwvaQlMCXDDU9Dct/P5+mqVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JYlLwrO3oPfjAAHllrfrQmzqV/xVOPz/GLZeBUuddxNqPELDBV32B7lOon0zn/bp5pCeMGSesP90p09HCWgzpPbBRVYTpk1Mdoehb3ouBoBljz4DwxOEvbcBCV6kj5JosuNG765iw/Jm6AyWV3yTX9kBSDMCMZD66VcbWbdG22c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVwAItHj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVwAItHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707541146; x=1739077146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4nOY6RagxZdgaNgGF1fQwvaQlMCXDDU9Dct/P5+mqVk=;
  b=QVwAItHjh2jrgD/D+YJa2NgUaz6D6M9EAeUr9n5Utnk6pXKYXEZS/nTV
   C0Qnq8CvscJJmOlmKG/i58ZpVk88t20y73EBo84XNcm6piPrqqX2yIpHh
   30XCpgrCOn0x1BUm/YUXTbJCBRQWR+1UA8ICWTr7+4Hwri4YnEIlOkZu4
   kmdyIpBc9Gior8BwR6b3VKor1M/ZzaCkXR9ISYPySGMnQ0V4adu4dWCfe
   alD3d0rnbOC5FmzoP9Na7qGH1Mx3wFzZvYlCf8pNukk0xdLbRe94lA363
   MTYoGMltneNP1rbj5MtsR6CIrHa5uZ9Hc4lQnZs1oPhuLCVLDqQsCA9BE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="12274509"
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="12274509"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 20:59:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="2099553"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Feb 2024 20:59:03 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYfS9-0005ME-1e;
	Sat, 10 Feb 2024 04:59:01 +0000
Date: Sat, 10 Feb 2024 12:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Machek <pavel@denx.de>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [cip:linux-5.10.y-cip 43/56] drivers/cache/ax45mp_cache.c:141:6:
 warning: no previous prototype for 'arch_sync_dma_for_device'
Message-ID: <202402101256.mOmaXuSb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip
head:   a624abaa85d7f3ff289eb2e257db5c4485d11d18
commit: 2656f92bc7dc5ac286595c8eac040828c2f180af [43/56] cache: ax45mp_cache: Add non coherent support
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240210/202402101256.mOmaXuSb-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101256.mOmaXuSb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101256.mOmaXuSb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cache/ax45mp_cache.c: In function 'ax45mp_cpu_cache_operation':
   drivers/cache/ax45mp_cache.c:70:17: error: implicit declaration of function 'csr_write'; did you mean 'vfs_write'? [-Werror=implicit-function-declaration]
      70 |                 csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
         |                 ^~~~~~~~~
         |                 vfs_write
   drivers/cache/ax45mp_cache.c: At top level:
>> drivers/cache/ax45mp_cache.c:141:6: warning: no previous prototype for 'arch_sync_dma_for_device' [-Wmissing-prototypes]
     141 | void arch_sync_dma_for_device(phys_addr_t paddr,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/cache/ax45mp_cache.c:165:6: warning: no previous prototype for 'arch_sync_dma_for_cpu' [-Wmissing-prototypes]
     165 | void arch_sync_dma_for_cpu(phys_addr_t paddr,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/cache/ax45mp_cache.c:183:6: warning: no previous prototype for 'arch_setup_dma_ops' [-Wmissing-prototypes]
     183 | void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
         |      ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/arch_sync_dma_for_device +141 drivers/cache/ax45mp_cache.c

   140	
 > 141	void arch_sync_dma_for_device(phys_addr_t paddr,
   142				      size_t size, enum dma_data_direction dir)
   143	{
   144		switch (dir) {
   145		case DMA_TO_DEVICE:
   146			ax45mp_dma_cache_wback(paddr, size);
   147			break;
   148	
   149		case DMA_FROM_DEVICE:
   150			fallthrough;
   151	
   152		case DMA_BIDIRECTIONAL:
   153			/* Skip the invalidate here if it's done later */
   154			if (IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU))
   155				ax45mp_dma_cache_wback(paddr, size);
   156			else
   157				ax45mp_dma_cache_wback_inv(paddr, size);
   158			break;
   159	
   160		default:
   161			break;
   162		}
   163	}
   164	
 > 165	void arch_sync_dma_for_cpu(phys_addr_t paddr,
   166				   size_t size, enum dma_data_direction dir)
   167	{
   168		switch (dir) {
   169		case DMA_TO_DEVICE:
   170			break;
   171	
   172		case DMA_FROM_DEVICE:
   173		case DMA_BIDIRECTIONAL:
   174			/* FROM_DEVICE invalidate needed if speculative CPU prefetch only */
   175			ax45mp_dma_cache_inv(paddr, size);
   176			break;
   177	
   178		default:
   179			break;
   180		}
   181	}
   182	
 > 183	void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
   184				const struct iommu_ops *iommu, bool coherent)
   185	{
   186		dev->dma_coherent = coherent;
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
