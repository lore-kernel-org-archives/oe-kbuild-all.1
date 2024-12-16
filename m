Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F005614B94C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 21:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734383878; cv=none; b=kBNvfPbsPFLvmWcwdEnX6RZWBkT6bmzDocCu+2S5EUhnfnBcyPbrHf4hnjCy4FpGhO6q58BXqvM9QHei+cM2ruD8olBamaSiEbIxnjr1QjPr8ONRiGBQUrjyrJ5ya05nVJeIfwu2mM7P5RiZ08ykF6bnebvL7yWnT33b662I0qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734383878; c=relaxed/simple;
	bh=ToNzIEwySaICQqjyeJH0vt3hr8CHuxiifg3cvY3YQEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3ku/AsG+DhOs9dqQ1tBFNHLW4kL74PHA9JQzSTl45pL1CKZrUTnx/roASBCmZFKt0EKHRXy4vzXVUcWEq9XaC3sghbkMCuQUxCOLXzgB3TgwAmiOLyIFTuop0lL+VuyUIwwOVdgfJ0xMEVHopjbscFYlytuj4kqUE4fu4N1VlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gs0Kbqj3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gs0Kbqj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734383877; x=1765919877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ToNzIEwySaICQqjyeJH0vt3hr8CHuxiifg3cvY3YQEE=;
  b=gs0Kbqj3isf8QMa6cYIHX1wgQFRsPerGo5870EpONRFSH6OUClA6lyRM
   jgg1peB/ztcUkb2b75ZqWf5OqdlcpZcGFIak3Fr+X9WI4Irsi+NAEO6Q4
   /ki/bQNaDFsgMBypQF3Rk896F7fhds1RYndI9B9NKX5wyNGMvFw/rkTri
   EH8YsXxazL2U23a+Uv7OJkZSAO9P6FlWsHwaA/qibL1kPuGfNZ/h2v9oH
   2vwiGNXcJAUnoN63K6EyxXDf+70nXUQonswpLGuccI6uJf4iMGWiZxhNq
   zJBt9leoWG1OrSA2tm+cEEN1I59B2EDoQrgtFrcLi8Nig/zSqFl2VKTQ9
   g==;
X-CSE-ConnectionGUID: 0KtQLpOzQMq/MdeoBEgK1Q==
X-CSE-MsgGUID: Xdb+mFa/Rme3GWKCExNcYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="45484839"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="45484839"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 13:17:56 -0800
X-CSE-ConnectionGUID: +xh5xtXxSDWpfmP3TtWvkQ==
X-CSE-MsgGUID: vYcvqpztRGCpHqp4WTy6hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134652800"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2024 13:17:55 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNITR-000ETo-0a;
	Mon, 16 Dec 2024 21:17:53 +0000
Date: Tue, 17 Dec 2024 05:16:41 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm: enforce __must_check on VMA merge and split
Message-ID: <202412170520.Ldy6Uwt1-lkp@intel.com>
References: <20241206225036.273103-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206225036.273103-1-lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-enforce-__must_check-on-VMA-merge-and-split/20241207-065244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241206225036.273103-1-lorenzo.stoakes%40oracle.com
patch subject: [PATCH] mm: enforce __must_check on VMA merge and split
config: x86_64-randconfig-003-20241217 (https://download.01.org/0day-ci/archive/20241217/202412170520.Ldy6Uwt1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412170520.Ldy6Uwt1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412170520.Ldy6Uwt1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vma.c: In function '__mmap_region':
>> mm/vma.c:2468:17: warning: ignoring return value of 'vma_merge_existing_range' declared with attribute 'warn_unused_result' [-Wunused-result]
    2468 |                 vma_merge_existing_range(&vmg);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2468 mm/vma.c

52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2434  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2435  unsigned long __mmap_region(struct file *file, unsigned long addr,
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2436  		unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2437  		struct list_head *uf)
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2438  {
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2439  	struct mm_struct *mm = current->mm;
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2440  	struct vm_area_struct *vma = NULL;
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2441  	int error;
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2442  	VMA_ITERATOR(vmi, mm, addr);
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2443  	MMAP_STATE(map, mm, &vmi, addr, len, pgoff, vm_flags, file);
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2444  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2445  	error = __mmap_prepare(&map, uf);
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2446  	if (error)
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2447  		goto abort_munmap;
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2448  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2449  	/* Attempt to merge with adjacent VMAs... */
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2450  	if (map.prev || map.next) {
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2451  		VMG_MMAP_STATE(vmg, &map, /* vma = */ NULL);
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2452  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2453  		vma = vma_merge_new_range(&vmg);
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2454  	}
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2455  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2456  	/* ...but if we can't, allocate a new VMA. */
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2457  	if (!vma) {
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2458  		error = __mmap_new_vma(&map, &vma);
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2459  		if (error)
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2460  			goto unacct_error;
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2461  	}
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2462  
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2463  	/* If flags changed, we might be able to merge, so try again. */
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2464  	if (map.retry_merge) {
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2465  		VMG_MMAP_STATE(vmg, &map, vma);
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2466  
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2467  		vma_iter_config(map.vmi, map.addr, map.end);
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25 @2468  		vma_merge_existing_range(&vmg);
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2469  	}
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2470  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2471  	__mmap_complete(&map, vma);
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2472  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2473  	return addr;
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2474  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2475  	/* Accounting was done by __mmap_prepare(). */
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2476  unacct_error:
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2477  	if (map.charged)
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2478  		vm_unacct_memory(map.charged);
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2479  abort_munmap:
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2480  	vms_abort_munmap_vmas(&map.vms, &map.mas_detach);
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2481  	return error;
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2482  }
98aad6cab8cb2a Lorenzo Stoakes 2024-12-03  2483  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
