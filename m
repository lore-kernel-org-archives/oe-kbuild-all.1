Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2701A35963
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 21:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750282782; cv=none; b=flXsjyTYX3HqyjqnVi7YMOj0Q0BZ9JJBt5ucqgmLBYSKOxP+cVZyaerIs6dx8wY1yf88jW+qpG6oEOO8593+d/8AJ752XYYV6Z9kJgxRBqaEaQL5paddazFTvG4OoxlIlFShhuosYTOIVw9BWwfcR8hp3BsKp80K7v+sXWn2vqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750282782; c=relaxed/simple;
	bh=xZGI7P6zl1K2zgqEQB7dAaBp21443Z+GNJTh07RHTsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BSBVBJeRjXXlLubTOn+Ftx7GGFnh1uaBkIv7FFG/Mw6/g7OtDYmGWewYkMdZyKvOtm9EfIdEEZIUTUo81pFuseLaLDRJUGCal7v8GUgC+pLRm0ODJWzHSR3fxsp0NKmD5ZA9y/HCYQOhDzplMjJjQjVRffepDSIiMWZHpJt1pkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cK/tmu7q; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cK/tmu7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750282781; x=1781818781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xZGI7P6zl1K2zgqEQB7dAaBp21443Z+GNJTh07RHTsQ=;
  b=cK/tmu7qXHo3eEFDhYnR9CvEjRocGPO47p7lEnY6WjLQTjTLElkqOtkV
   2p02QSKFlBbfCswju+vpozsO0HPoKMJ8OKzJ15x5vCqo0uccsMludv7c0
   Yah7GFzXlDxlP3yOlr8srtvqq/h81iYQqsTT5BeHoAXwM8gxVkF7G0eSV
   giXISKPWwMzEkgfU9wD3kUMbFR3xbsxdPHml7Nlazfz3ijz+iLZsU0POh
   /9bBUou1V4O9EMUGdwemBppv3cchkGr4RgXf4qhZAIHwBZ6KhgUabFheY
   wY0uubIDudgPdGZZc+aK75m3+fXgZpYt8KFQrLk1ARAwa/unylV51gMoc
   g==;
X-CSE-ConnectionGUID: aT+DY32WQY6Slgfc33gKoA==
X-CSE-MsgGUID: TDSUKeppTXuNrVpkNS3JSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52224843"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52224843"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 14:39:40 -0700
X-CSE-ConnectionGUID: +02UuRviRZaNnRKruG7HEg==
X-CSE-MsgGUID: YHkg7b1QRRi5Ave/aFG0CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="187500343"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jun 2025 14:39:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS0VM-000KCM-1A;
	Wed, 18 Jun 2025 21:39:36 +0000
Date: Thu, 19 Jun 2025 05:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-direct-pfn 4/13] kernel/dma/mapping.c:190:13: error:
 implicit declaration of function 'arch_dma_unmap_phys_direct'; did you mean
 'arch_dma_unmap_physdirect'?
Message-ID: <202506190525.UMXBJMEr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-direct-pfn
head:   a7679860d78d4379f88e33c3f5cf972a17180db0
commit: 023d9f0376459ba6bc5e05cccdacbd2cc0b9fa6e [4/13] dma-mapping: convert dma_direct_*map_page to be phys_addr_t based
config: powerpc64-randconfig-001-20250619 (https://download.01.org/0day-ci/archive/20250619/202506190525.UMXBJMEr-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506190525.UMXBJMEr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506190525.UMXBJMEr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/dma-iommu.c:27:6: warning: no previous prototype for 'arch_dma_unmap_phys_direct' [-Wmissing-prototypes]
      27 | bool arch_dma_unmap_phys_direct(struct device *dev, dma_addr_t dma_handle)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   kernel/dma/mapping.c: In function 'dma_unmap_page_attrs':
>> kernel/dma/mapping.c:190:13: error: implicit declaration of function 'arch_dma_unmap_phys_direct'; did you mean 'arch_dma_unmap_physdirect'? [-Werror=implicit-function-declaration]
     190 |             arch_dma_unmap_phys_direct(dev, addr + size))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |             arch_dma_unmap_physdirect
   cc1: some warnings being treated as errors


vim +190 kernel/dma/mapping.c

   182	
   183	void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr, size_t size,
   184			enum dma_data_direction dir, unsigned long attrs)
   185	{
   186		const struct dma_map_ops *ops = get_dma_ops(dev);
   187	
   188		BUG_ON(!valid_dma_direction(dir));
   189		if (dma_map_direct(dev, ops) ||
 > 190		    arch_dma_unmap_phys_direct(dev, addr + size))
   191			dma_direct_unmap_phys(dev, addr, size, dir, attrs);
   192		else if (use_dma_iommu(dev))
   193			iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
   194		else
   195			ops->unmap_page(dev, addr, size, dir, attrs);
   196		trace_dma_unmap_phys(dev, addr, size, dir, attrs);
   197		debug_dma_unmap_phys(dev, addr, size, dir);
   198	}
   199	EXPORT_SYMBOL(dma_unmap_page_attrs);
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
