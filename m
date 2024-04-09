Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE287157476
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 23:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712704452; cv=none; b=TUkZKQX9Aj4sJ4o7pYSZynEaBzSINpxiLV+NKx/VNzwhzS+6F4c1/VUfwS8amBSht4xDcIP3ehdGZDDsQPpg0wZkKeMLG2UVuNHSXfQ/dqUWf77V57dxtX2joY4fQ3Yjm7odsS8g4z5Twthc5qBU1bMBWKqIU2BL+6aWcv+5P8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712704452; c=relaxed/simple;
	bh=gK9Gw+G7cl1CYloCdtPuqPxWGYTycSEobjBdpbyBA0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F0rMjUsyFn3jv/r54n0xJ5NGCwJpRCnrOmhAi7HCe6ZoJu02Bqgyi+vF1d6VH5MRyNbE0lswtJKBGgiMLu3BZeyytdzDjXr9KiwslXDQwm9GRywCsxZa//Eo7W4X3y/IO8ShUHJUDh9c1U2RjoSnHyJcgZtuW3DJj3X4u5NUciw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=di4rNkfM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="di4rNkfM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712704451; x=1744240451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gK9Gw+G7cl1CYloCdtPuqPxWGYTycSEobjBdpbyBA0g=;
  b=di4rNkfMlydCa8sur7urP/ALuLNGVz/GVZLz64wWd4ioTNibNS3mpqfq
   oxkpRyXaXMD0OTN4UorDyDGRHoGJGmh1ZPF+Y02iGN1ha+LAr/i5qB00j
   WZqOkrBAkLQzn8xI1y0PmfSbovzqeiyLKw9TML4xZW2L4DtAg4y6Eevna
   x8fw1We0JoTHREpuKiRfd++BFOweTuhRgB18OBaBhocxJmAmHLC7QDMte
   +S20wQZBNU3kgIozJhQnncP7NjYt8cFG2w68G27HANJ7Z616Oyhgr8qYS
   4WwlCdaBVc9H92iAGJzzB5pZdaHiYHP4KJliglX0TRBGTJlwOO/UbsBO4
   w==;
X-CSE-ConnectionGUID: obcFQqZ8REagYVVs3gGI6g==
X-CSE-MsgGUID: QLPEaguJT/2nZdA29MeieA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19472356"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="19472356"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:14:10 -0700
X-CSE-ConnectionGUID: G6DL8apQQnyIQ2Fu9OBzRw==
X-CSE-MsgGUID: 0hy0d81mSW2yb9vIxwJDXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20410657"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Apr 2024 16:14:09 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruKfH-0006bq-0d;
	Tue, 09 Apr 2024 23:14:07 +0000
Date: Wed, 10 Apr 2024 07:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/v4+x86-rox 21/22] mm/execmem.c:192:9: error: implicit
 declaration of function 'flush_tlb_kernel_range'
Message-ID: <202404100717.uL6WsHUX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/v4+x86-rox
head:   a14551111ff8bbf3c520771e89892d599463da71
commit: 85e04aa7ae67c997077a12fc9e6ed04fbc2d6975 [21/22] execmem: add support for cache of large ROX pages
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240410/202404100717.uL6WsHUX-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100717.uL6WsHUX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100717.uL6WsHUX-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/execmem.c: In function 'execmem_cache_populate':
>> mm/execmem.c:192:9: error: implicit declaration of function 'flush_tlb_kernel_range' [-Werror=implicit-function-declaration]
     192 |         flush_tlb_kernel_range(start, end);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/flush_tlb_kernel_range +192 mm/execmem.c

   166	
   167	static int execmem_cache_populate(struct execmem_range *range, size_t size)
   168	{
   169		unsigned long vm_flags = VM_FLUSH_RESET_PERMS | VM_ALLOW_HUGE_VMAP;
   170		unsigned long start, end;
   171		struct vm_struct *vm;
   172		size_t alloc_size;
   173		int err = -ENOMEM;
   174		void *p;
   175	
   176		alloc_size = round_up(size, PMD_SIZE);
   177		p = execmem_vmalloc(range, alloc_size, PAGE_KERNEL, vm_flags);
   178		if (!p)
   179			return err;
   180	
   181		vm = find_vm_area(p);
   182		if (!vm)
   183			goto err_free_mem;
   184	
   185		/* fill memory with invalid instructions */
   186		execmem_invalidate(p, alloc_size, /* writable = */ true);
   187	
   188		start = (unsigned long)p;
   189		end = start + alloc_size;
   190	
   191		vunmap_range_noflush(start, end);
 > 192		flush_tlb_kernel_range(start, end);
   193	
   194		/* FIXME: handle direct map alias */
   195	
   196		err = vmap_pages_range_noflush(start, end, range->pgprot, vm->pages,
   197					       PMD_SHIFT);
   198		if (err)
   199			goto err_free_mem;
   200	
   201		err = execmem_cache_add(p, alloc_size);
   202		if (err)
   203			goto err_free_mem;
   204	
   205		return 0;
   206	
   207	err_free_mem:
   208		vfree(p);
   209		return err;
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
