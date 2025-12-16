Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3143AA186
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 13:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765891942; cv=none; b=iUCizmdRlqv73HroxfGbtY51bjMWr7DotIUclGir+9I7YkmsLgIuxUtSIB45H1SjjuX3gQgRDR2z0aM2Z9wwFCgCYHawXSPks9T5T3mly9AcpJmUeIH9iHuH09fhtF6nCtPOL5eCYIl7hhEMUv/gZleMIXon44k3w4txD0XrzRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765891942; c=relaxed/simple;
	bh=N9t0mkY5H1xtpiI7x104oD8Kp+A6sUMpGvqI4yStues=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eREKChvTOq9C18syg5LYmr+rF1IK6F9TEZ5PqQlUEXHMyFtEyuR/w5l2fKjgAZEKptTMupjCIJNrs3esk4Hi9PjwoiDj2DSpG0Vyh39KtMRq/Lj2cdRwrlI22Ea9BBSm1Ty608BR+T9jKgC0bkHnRixyeJts34Deakz+BFM6iMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jjlrv/Gl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jjlrv/Gl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765891940; x=1797427940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N9t0mkY5H1xtpiI7x104oD8Kp+A6sUMpGvqI4yStues=;
  b=Jjlrv/GlWfw3Hzi9MIDqSQcwgAKYUBvs9z2Q2/QULRofyV1Ky9A3t5cm
   nLpbon3irbj5kEvjXiEW8ZBFnHEG70blfSTBbO7aS8dZquZhrFti5SfLR
   hSiYkGWbGxvke4tCsdRY62wy+GS9AWrhIAXyfVBOwkOQ6xXkgJ3F8RvMe
   XVpEqoYP7W4PnS7kkdgmjo7cF6O7EvS1qnuO2eHj1F9EDoI5hHRt1B3sl
   5UbvKt9yWi7MfkNB61E89lD5BGRCKbN8Dxte+gHBK/CbMx6jSR5StDT/3
   EI3iMDioUK9+2SFmddlAX/X7sTG2pQPlBzME67OpC0TR9E0rwhg5iVnEE
   Q==;
X-CSE-ConnectionGUID: fDZ1diWUQOKH92MhKIyZdA==
X-CSE-MsgGUID: 6fRhVHgNQDKg3bqfR/jRZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55379808"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="55379808"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:32:19 -0800
X-CSE-ConnectionGUID: gTGHgYNtRK64Rr8AmdNrGw==
X-CSE-MsgGUID: vawAui99Q+6aZIR+plrxuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="202928251"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 16 Dec 2025 05:32:17 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVV9z-0000000037c-0QIS;
	Tue, 16 Dec 2025 13:32:15 +0000
Date: Tue, 16 Dec 2025 14:31:54 +0100
From: kernel test robot <lkp@intel.com>
To: Vernon Yang <vernon2gm@gmail.com>, akpm@linux-foundation.org,
	david@kernel.org, lorenzo.stoakes@oracle.com
Cc: oe-kbuild-all@lists.linux.dev, ziy@nvidia.com, npache@redhat.com,
	baohua@kernel.org, lance.yang@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vernon Yang <yanglincheng@kylinos.cn>
Subject: Re: [PATCH 3/4] mm: khugepaged: move mm to list tail when
 MADV_COLD/MADV_FREE
Message-ID: <202512161405.8IVTXVcr-lkp@intel.com>
References: <20251215090419.174418-4-yanglincheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215090419.174418-4-yanglincheng@kylinos.cn>

Hi Vernon,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20251216]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vernon-Yang/mm-khugepaged-add-trace_mm_khugepaged_scan-event/20251215-171046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251215090419.174418-4-yanglincheng%40kylinos.cn
patch subject: [PATCH 3/4] mm: khugepaged: move mm to list tail when MADV_COLD/MADV_FREE
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251216/202512161405.8IVTXVcr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161405.8IVTXVcr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161405.8IVTXVcr-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/madvise.c: In function 'madvise_cold':
>> mm/madvise.c:609:9: error: implicit declaration of function 'khugepaged_move_tail'; did you mean 'khugepaged_exit'? [-Wimplicit-function-declaration]
     609 |         khugepaged_move_tail(vma->vm_mm);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         khugepaged_exit


vim +609 mm/madvise.c

   595	
   596	static long madvise_cold(struct madvise_behavior *madv_behavior)
   597	{
   598		struct vm_area_struct *vma = madv_behavior->vma;
   599		struct mmu_gather tlb;
   600	
   601		if (!can_madv_lru_vma(vma))
   602			return -EINVAL;
   603	
   604		lru_add_drain();
   605		tlb_gather_mmu(&tlb, madv_behavior->mm);
   606		madvise_cold_page_range(&tlb, madv_behavior);
   607		tlb_finish_mmu(&tlb);
   608	
 > 609		khugepaged_move_tail(vma->vm_mm);
   610	
   611		return 0;
   612	}
   613	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
