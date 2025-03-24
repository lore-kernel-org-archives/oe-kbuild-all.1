Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05612E3383
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Mar 2025 07:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742801369; cv=none; b=vAjttfH1GJFiWgxA5qBV34q8XT05fLRpoIH1LWHkp1oFJ6M1vq0QuEny/COrdc2FOHgxSuD1PrYsPuaOn4rSIFc7HLUdeCgqWJJc1WCsspR/VMJsfD3Bm1PZmZ4gphTlfJo+rWu+8mD6UnoDGbJqvATAdzoEl8SNRh1imDap33k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742801369; c=relaxed/simple;
	bh=SpZ5iO73swFcI7iVKKrcg49UdaphYyKxemXfQJenpjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8H12TuuePiIKYE1TB7xcTLQeDvbb18UrFtm4kljUyU3UgpHwjaOd9yO9JmSm0+rVCHFAGk65S56yZYqjcNp/WsZU+eFHca4bOtpX92lVdPNC1nyZMkSjDyQlO31na7FXOyWjANSk4HwpHjSdk2VyWqPAP2MFmX+y44cWI4pXW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ln67n+t6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ln67n+t6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742801367; x=1774337367;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SpZ5iO73swFcI7iVKKrcg49UdaphYyKxemXfQJenpjo=;
  b=ln67n+t6r0BLAlwqPuD0QWpt7apx0e1Q+1V2rP3LmzrN88yNR5uYzjRv
   ELV0ycKrnmkscaqp68j/xZuTROKVH61/6c2T3ISjGOKj0YXu0fRgb9nCH
   UhGpyUo1IirE3y2oKQacMRM8eHpqgSQcHRDbApI8Y5yOuTAcY8rvZRq2N
   4Chq9HIhlAG8WQbBEDOoN8TqYBpLl+CILaPAM7m/qdmkOsPKPaklNKt2l
   xs+kfgtnJtTrUK0DJV1f8Y98es5kjmK20OQt0MGBR+tHML9dBrr8ZPQQe
   jvgnBtlUlPfzlBkxH6WLOqG19drn3Bdh0F8A4agyyWt/wox63XTihWC8q
   Q==;
X-CSE-ConnectionGUID: /2yU5BXESsir4Ynid8PEqQ==
X-CSE-MsgGUID: MbxYIYOAQ7mPcQikXHVsJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="31590801"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="31590801"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 00:29:26 -0700
X-CSE-ConnectionGUID: ITNtxWFgTxmenbMOgqMemw==
X-CSE-MsgGUID: +zYjwSNITCmashIrUYbxjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="123951777"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 24 Mar 2025 00:29:25 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twcFP-0003My-00;
	Mon, 24 Mar 2025 07:29:23 +0000
Date: Mon, 24 Mar 2025 15:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
Message-ID: <202503241546.BdUEsLMd-lkp@intel.com>
References: <20250321112323.153741-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321112323.153741-1-david@redhat.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on b3ee1e4609512dfff642a96b34d7e5dfcdc92d05]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Hildenbrand/x86-mm-pat-Fix-VM_PAT-handling-when-fork-fails-in-copy_page_range/20250321-192604
base:   b3ee1e4609512dfff642a96b34d7e5dfcdc92d05
patch link:    https://lore.kernel.org/r/20250321112323.153741-1-david%40redhat.com
patch subject: [PATCH v2] x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()
config: xtensa-nommu_kc705_defconfig (https://download.01.org/0day-ci/archive/20250324/202503241546.BdUEsLMd-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503241546.BdUEsLMd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503241546.BdUEsLMd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/xtensa/include/asm/io.h:19,
                    from include/linux/io.h:14,
                    from lib/iomem_copy.c:8:
   include/linux/pgtable.h: In function 'untrack_pfn_copy':
>> include/linux/pgtable.h:1561:42: error: invalid use of undefined type 'struct vm_area_struct'
    1561 |         untrack_pfn(dst_vma, pfn, dst_vma->vm_end - dst_vma->vm_start, true);
         |                                          ^~
   include/linux/pgtable.h:1561:60: error: invalid use of undefined type 'struct vm_area_struct'
    1561 |         untrack_pfn(dst_vma, pfn, dst_vma->vm_end - dst_vma->vm_start, true);
         |                                                            ^~


vim +1561 include/linux/pgtable.h

  1553	
  1554	/*
  1555	 * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
  1556	 * copy_page_range(), but after track_pfn_copy() was already called.
  1557	 */
  1558	static inline void untrack_pfn_copy(struct vm_area_struct *dst_vma,
  1559			unsigned long pfn)
  1560	{
> 1561		untrack_pfn(dst_vma, pfn, dst_vma->vm_end - dst_vma->vm_start, true);
  1562		/*
  1563		 * Reservation was freed, any copied page tables will get cleaned
  1564		 * up later, but without getting PAT involved again.
  1565		 */
  1566	}
  1567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
