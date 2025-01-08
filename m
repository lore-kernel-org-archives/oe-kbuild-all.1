Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E4319D8A3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 22:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736375161; cv=none; b=fzO3SH+YQdCQ6h2vYcXnPr9wNM7AFgBMjug41XTDk027W43v8uOm0zXDnEarZqHhW98GnaYAQUFxAzHpE8N7Jn8GjZL5rXP7AcHbHsnRP/TfZ/f0vBpKFjhIRJJFMrfYwxn9S66kC8potS6fE+01zRHbcjvcutiH+FL+g/NTpmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736375161; c=relaxed/simple;
	bh=PVrT9+kUOfif9SVG4slHU0XMql8aXx6cqOpHNKasMD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HnfAgSKTWu+OcpDUe4TtvhYi2A1wUvjaw5XCmRUQp0QqTLw4yoCTgV82CuX/klwYBGA6yxjN3dqWnlZezrOjz2zV80m+btanUYOmSTfK2Q3DxvSOpGXHoTSAMS7HrwH/JSoB0tbsQQj/z4KqlfQVhURjoMak0gFGQKOaHsRag+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+/qEfHn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+/qEfHn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736375160; x=1767911160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PVrT9+kUOfif9SVG4slHU0XMql8aXx6cqOpHNKasMD0=;
  b=W+/qEfHnHtfsIa17FFlrIOFLvYGUXVwIGml8QM7//CpkMkyk/MBtevmY
   RIK77ayxiqVNaOc2AP1biLAhSofWVLWVJw2CJGVCpgSDsEO2TEDirZjyG
   QRw4KyfbZqQUuisDKiT1yPohqp9NTYGV4axKJupMqqhydrSp73djtJ5GP
   CgeTkG/V/ZKPRjRGD/UftBFyIzfcShJGqb61FP7CmzNiwOhCJM2QyCqIR
   H7D5dPK2FDBFOv0/Yb0Rp2RKKOIrEg2WIkQOSk7EeEbW7Sn/PV79l7UT7
   xiD+6lsOB3LWUQF+N6OwwB0IbiTUdUvO5nJTp9+3NneUNTaxoz32GcMkr
   A==;
X-CSE-ConnectionGUID: yfdhMgDSQc+fQBSJsrmChw==
X-CSE-MsgGUID: OMZm/+wOTtqirzsNJWQDdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="48030955"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="48030955"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 14:25:59 -0800
X-CSE-ConnectionGUID: bfy40lF8SvOJNwEcPiloOQ==
X-CSE-MsgGUID: T38SE6XLQNmGvXycZ6Mz9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104100051"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Jan 2025 14:25:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVeUu-000Gk9-1H;
	Wed, 08 Jan 2025 22:25:56 +0000
Date: Thu, 9 Jan 2025 06:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 10/22]
 drivers/virtio/virtio_msg_ffa_dma_ops.c:36:8: error: call to undeclared
 function 'vmsg_ffa_bus_area_share'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202501090610.NlGhq8C9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   89b536eafa42f856d6b175424f11c4c7c7079d1f
commit: f47f984d983e30d299ec66a78256c57ef7dc2ce8 [10/22] virtio-msg: Add DMA OPs support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250109/202501090610.NlGhq8C9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501090610.NlGhq8C9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501090610.NlGhq8C9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/virtio/virtio_msg_ffa_dma_ops.c:36:8: error: call to undeclared function 'vmsg_ffa_bus_area_share'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      36 |         ret = vmsg_ffa_bus_area_share(dev, vaddr, n_pages, dma_handle);
         |               ^
>> drivers/virtio/virtio_msg_ffa_dma_ops.c:51:8: error: call to undeclared function 'vmsg_ffa_bus_area_unshare'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      51 |         ret = vmsg_ffa_bus_area_unshare(dev, &dma_handle, n_pages);
         |               ^
   drivers/virtio/virtio_msg_ffa_dma_ops.c:90:6: error: call to undeclared function 'vmsg_ffa_bus_area_share'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      90 |         if (vmsg_ffa_bus_area_share(dev, page_to_virt(page), n_pages,
         |             ^
   drivers/virtio/virtio_msg_ffa_dma_ops.c:110:8: error: call to undeclared function 'vmsg_ffa_bus_area_unshare'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     110 |         ret = vmsg_ffa_bus_area_unshare(dev, &dma_handle, n_pages);
         |               ^
   drivers/virtio/virtio_msg_ffa_dma_ops.c:160:17: warning: shift count >= width of type [-Wshift-count-overflow]
     160 |         return mask == DMA_BIT_MASK(64);
         |                        ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 4 errors generated.


vim +/vmsg_ffa_bus_area_share +36 drivers/virtio/virtio_msg_ffa_dma_ops.c

    23	
    24	static void *virtio_msg_dma_alloc(struct device *dev, size_t size,
    25					  dma_addr_t *dma_handle, gfp_t gfp,
    26					  unsigned long attrs)
    27	{
    28		size_t n_pages = PFN_UP(size);
    29		void *vaddr;
    30		int ret;
    31	
    32		vaddr = alloc_pages_exact(n_pages * PAGE_SIZE, gfp);
    33		if (!vaddr)
    34			return NULL;
    35	
  > 36		ret = vmsg_ffa_bus_area_share(dev, vaddr, n_pages, dma_handle);
    37		if (ret) {
    38			free_pages_exact(vaddr, n_pages * PAGE_SIZE);
    39			return NULL;
    40		}
    41	
    42		return vaddr;
    43	}
    44	
    45	static void virtio_msg_dma_free(struct device *dev, size_t size, void *vaddr,
    46					dma_addr_t dma_handle, unsigned long attrs)
    47	{
    48		size_t n_pages = PFN_UP(size);
    49		int ret;
    50	
  > 51		ret = vmsg_ffa_bus_area_unshare(dev, &dma_handle, n_pages);
    52		if (ret)
    53			dev_err(dev, "%s: Failed to unshare area: %d", __func__, ret);
    54	
    55		free_pages_exact(vaddr, n_pages * PAGE_SIZE);
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
