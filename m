Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3911D6DA1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733407385; cv=none; b=TymnYKXpYhgvvMw0hMJG7pkDySknOwBf2UHZPyyaz0H5hg4t+f6GWgWXAiDfnDwWXhj0dT3Zlw9xafhwjU37mFU7OhJf7nnwmoke5xpmv5nq3KQpskZg+YbFIIRu/iUmLQ/bHwU9wS+2JtQAwstrrMUQ0e1/hMMXezRH6vaC/l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733407385; c=relaxed/simple;
	bh=3kEXiJLlnYSuzkHnXZ1BabgAuuDSBSP8ND4pQEjG7BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ST7uVS+Js+g0cb5+F5SuJL8Nx3539jXqwGGvboJaAiE4Viw0FiakNAD4MYSWcY8RQc8IPEW2of8ECnLqkJFZjTxC45YdttWI3AHYMrcBHQAZEP3p/rex7w/36qDcCRo5z95/NhbQjzmD7hbGv7uAGGO+j0OzLmkHqfENI+fyzS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUSnms22; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUSnms22"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733407384; x=1764943384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3kEXiJLlnYSuzkHnXZ1BabgAuuDSBSP8ND4pQEjG7BM=;
  b=IUSnms22WoO8mZ2yF+HdCA39LGomzcQUXQyOvuREvH9EivXO26zDvOqo
   zuJQ+6P/63VZynU/zGQLME01GNpf1JvghjpMnab54bERl0deUkHMvebNn
   2v4TvmtEMe54+Lvy30cxRZHCYQR8vd3Eyp2U2tkdyxA0D4ATUBmRyRnyY
   iGqArWMIiJmzDxLH6B0XOyA1z9cz1Ik/t//9SXxLjm5qzIu/frPUzE2Rp
   u1UWKMbt2N17lMQOk1jhPSv+NxO6n+5WiM98/IrP2bxSf/i9GDmxdy9uI
   UHl5GGHgt5eGw5DQPDnh3w6AOLGt60rj1IVCmdBfUbOdYQ08FmwDfIVpV
   A==;
X-CSE-ConnectionGUID: Y1+nmuiZSCOyFdm0aOvGkw==
X-CSE-MsgGUID: /novtb5JTYy3Dboiw2FNHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33865010"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="33865010"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 06:03:04 -0800
X-CSE-ConnectionGUID: JtlULMVbT26iiK6GuSHWjA==
X-CSE-MsgGUID: MaqpSYwgTPSSLGC3BtuRgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="94577836"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Dec 2024 06:03:02 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJCRY-00003j-1Y;
	Thu, 05 Dec 2024 14:03:00 +0000
Date: Thu, 5 Dec 2024 22:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/5] mm/vma: move stack expansion logic to mm/vma.c
Message-ID: <202412052111.B5Jmi2yT-lkp@intel.com>
References: <0feb104eff85922019d4fb29280f3afb130c5204.1733248985.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0feb104eff85922019d4fb29280f3afb130c5204.1733248985.git.lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-vma-move-brk-internals-to-mm-vma-c/20241204-115150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/0feb104eff85922019d4fb29280f3afb130c5204.1733248985.git.lorenzo.stoakes%40oracle.com
patch subject: [PATCH 4/5] mm/vma: move stack expansion logic to mm/vma.c
config: x86_64-randconfig-161-20241205 (https://download.01.org/0day-ci/archive/20241205/202412052111.B5Jmi2yT-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412052111.B5Jmi2yT-lkp@intel.com/

smatch warnings:
mm/vma.c:2816 expand_downwards() warn: unsigned 'address' is never less than zero.

vim +/address +2816 mm/vma.c

  2798	
  2799	/*
  2800	 * vma is the first one with address < vma->vm_start.  Have to extend vma.
  2801	 * mmap_lock held for writing.
  2802	 */
  2803	int expand_downwards(struct vm_area_struct *vma, unsigned long address)
  2804	{
  2805		struct mm_struct *mm = vma->vm_mm;
  2806		struct vm_area_struct *prev;
  2807		int error = 0;
  2808		VMA_ITERATOR(vmi, mm, vma->vm_start);
  2809	
  2810		if (!(vma->vm_flags & VM_GROWSDOWN))
  2811			return -EFAULT;
  2812	
  2813		mmap_assert_write_locked(mm);
  2814	
  2815		address &= PAGE_MASK;
> 2816		if (address < mmap_min_addr || address < FIRST_USER_ADDRESS)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
