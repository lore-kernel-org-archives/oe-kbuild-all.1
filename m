Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B121DDC37
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 22:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734042654; cv=none; b=BUK2XD/xr+kID/QSDikJxix1+3AU5afX/Zpw5KRZj/fodkrazi8kQMMsZWt7l9JmpankFBG+tgVnAEzUvZywFvsU2O4mzosVm06fSK7Wu0G7dzLDtVKRCDfFW8zASI6/S4s6OH8cxtrjxD0kwfcpKKvBg4RdifU0sVyuAT2CsIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734042654; c=relaxed/simple;
	bh=5RUqluS6/FuCUlfLPqQMq1cJzZiSkK6Nor/ycBw/YtY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QJi2qNeZRq+yucTFJ5mmpNUnsqhf3n9BlnwFKdDH3a1iDtmkNxYoWIy9cwRCI8vAKIezQ4ryycagC+d6WCWe76N2EzXM0itvqIL1a11JijZHFxiE8rfzNdX6PojehmIpamz1VGB5SM/X2lDmpUiHPFH8w8fk+3MHvOlgGbf6dM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ba92/g+2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ba92/g+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734042651; x=1765578651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5RUqluS6/FuCUlfLPqQMq1cJzZiSkK6Nor/ycBw/YtY=;
  b=ba92/g+2cPQhS1q4XeSdVop0Qk02gUCkefkjw1lBYIz1EfginLtU9hOZ
   tRegd2Fr6gved4+rw8sFHsvaSCMUmOjndzoOBgLR+4/i6i9nmkHefSClb
   y03ykNbcveNaGV7PNdnFfFOfeqcnX3dCkXZv5u5DuRPt2aTMVtv6CEhDo
   eHZDEHe9K2u/Y3p5Lhh5PJx7k85hDQsHpV8IffzsqfqCKhQpWfaPoXQWu
   ukFws3umidrBFt6PLcy8/AfHHEok0LvHGeoQ4kpswaGSzuD5tlKgOYfYb
   nffUMMrGvfrT1ce2hoMBIK/FE4eNJ/wSZ+Y7DHDNuHSTQHjEzHbEQc9Nx
   Q==;
X-CSE-ConnectionGUID: bI+CGSmbSeOwhse3pqSt3Q==
X-CSE-MsgGUID: boNCjQEkQyS7tILz7FRivQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34614609"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="34614609"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 14:30:51 -0800
X-CSE-ConnectionGUID: /Js1tf7VS3eRauYyW1WVsw==
X-CSE-MsgGUID: 8hLXe6LfSla2+3rauZ4CcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="96105337"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Dec 2024 14:30:50 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLrho-000BRM-0T;
	Thu, 12 Dec 2024 22:30:48 +0000
Date: Fri, 13 Dec 2024 06:30:28 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 10/18]
 drivers/virtio/virtio_msg_ffa_dma_ops.c:42:27: error: incompatible integer
 to pointer conversion passing 'u64' (aka 'unsigned long long') to parameter
 of type 'const void *'
Message-ID: <202412130650.ysV9xfoZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   2fb1132cbfed1f9c19ee5b9856411f6da4558a51
commit: e454cdc8078f8c9be4e91ffe41adb1fa22ec96ee [10/18] virtio-msg: Add DMA OPs support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241213/202412130650.ysV9xfoZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412130650.ysV9xfoZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412130650.ysV9xfoZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/virtio/virtio_msg_ffa_dma_ops.c:42:27: error: incompatible integer to pointer conversion passing 'u64' (aka 'unsigned long long') to parameter of type 'const void *' [-Wint-conversion]
      42 |                 pages[i] = virt_to_page((u64)vaddr + PAGE_SIZE * i);
         |                            ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:409:50: note: expanded from macro 'virt_to_page'
     409 | #define virt_to_page(x)         pfn_to_page(virt_to_pfn(x))
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/asm-generic/memory_model.h:37:40: note: expanded from macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   arch/arm64/include/asm/memory.h:382:53: note: passing argument to parameter 'kaddr' here
     382 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                                     ^
   drivers/virtio/virtio_msg_ffa_dma_ops.c:110:27: error: incompatible integer to pointer conversion passing 'u64' (aka 'unsigned long long') to parameter of type 'const void *' [-Wint-conversion]
     110 |                 pages[i] = virt_to_page((u64)vaddr + PAGE_SIZE * i);
         |                            ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:409:50: note: expanded from macro 'virt_to_page'
     409 | #define virt_to_page(x)         pfn_to_page(virt_to_pfn(x))
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/asm-generic/memory_model.h:37:40: note: expanded from macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   arch/arm64/include/asm/memory.h:382:53: note: passing argument to parameter 'kaddr' here
     382 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                                     ^
   drivers/virtio/virtio_msg_ffa_dma_ops.c:185:17: warning: shift count >= width of type [-Wshift-count-overflow]
     185 |         return mask == DMA_BIT_MASK(64);
         |                        ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 2 errors generated.


vim +42 drivers/virtio/virtio_msg_ffa_dma_ops.c

    23	
    24	static void *virtio_msg_dma_alloc(struct device *dev, size_t size,
    25					  dma_addr_t *dma_handle, gfp_t gfp,
    26					  unsigned long attrs)
    27	{
    28		size_t n_pages = PFN_UP(size), i;
    29		struct page **pages;
    30		void *vaddr;
    31		int ret;
    32	
    33		pages = kmalloc(sizeof(*pages) * n_pages, GFP_KERNEL);
    34		if (!pages)
    35			return NULL;
    36	
    37		vaddr = alloc_pages_exact(n_pages * PAGE_SIZE, gfp);
    38		if (!vaddr)
    39			goto out;
    40	
    41		for (i = 0; i < n_pages; i++)
  > 42			pages[i] = virt_to_page((u64)vaddr + PAGE_SIZE * i);
    43	
    44		ret = vmsg_ffa_bus_area_share(dev, pages, n_pages, dma_handle);
    45		if (ret) {
    46			dev_err(dev, "%s: Failed to share area: %d", __func__, ret);
    47			free_pages_exact(vaddr, n_pages * PAGE_SIZE);
    48			vaddr = NULL;
    49		}
    50	
    51	out:
    52		kfree(pages);
    53		return vaddr;
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
