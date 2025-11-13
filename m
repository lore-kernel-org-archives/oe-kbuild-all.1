Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C96303A20
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 04:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009488; cv=none; b=OuxAM1L1G4VdXik29IWF6c+CCXVzWfRsuFAJUPcIfuDNstKofxsLNOgVtvJUwaafXMQ8qJzQUKhXJOW9bpv6mcXaW6i5W5KYxsBC+acEgQZesx7PKbYKLIcE+MGaGjlVmwSzxBqgERuz65Aia8LaIv+ODaVhrnwsecN4fRGP7Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009488; c=relaxed/simple;
	bh=Pu7JCh+uZQ+wAjeaVzQzIHM60xa65wVtxbks+jBVGCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbBGpGtJb5dRVcB54yveT+ZlxgVMCrK9hWsmk2YemCtG2hRpvUyE7V72EAT4W8rSl0wPWvGvxsWwHMl53X939kjFljnF88BzKyXJG9XcjFEUzwwVwzzr7AqL638Rbp5Wn9J7wiiWnUJrowGxR3klnbEvw+SDfDxfIXwuHH/Qiiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L0nZWq55; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L0nZWq55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009486; x=1794545486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pu7JCh+uZQ+wAjeaVzQzIHM60xa65wVtxbks+jBVGCw=;
  b=L0nZWq55xk1Xh6kCRbS3e7DXeCIdlXT4+CiVVbVNi4T3tPe5lxOh8GUV
   VvaxlXrdOAv589YTJZtd91C3V4sY/q8bdghag4wB5jg5AHaqGIZn7VWsX
   ykmxdEpCEtxASAtNnfdqRAO03b2ZMI8hmMx6AeV+DkTywmAAh1jzCfZMv
   W+M6VHtzbC7h9+EU/noYArZ2hhI9rkVBtplfhTOZrdjJhsbodNBSNywwu
   nx80INhPBmMcn0IUtkGfpMCTUl5QANFX863esaXBZaSNrEKSeMYMIDzIY
   duhpToiaHyrDMq6yNZtf/UNROtp2IpEDH2mvcY+XTj7Uny0f+FVmtUu/R
   w==;
X-CSE-ConnectionGUID: xX5iZUtbTTGpK2bnRSGO4g==
X-CSE-MsgGUID: ajea/fVRTQm0QMGMW3ERTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65008605"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65008605"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:51:23 -0800
X-CSE-ConnectionGUID: yeX6xk15RoqAxx0O+4o3JQ==
X-CSE-MsgGUID: fA5wbbIKQbGrsZzt8amQug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="220161056"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2025 20:51:21 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPIk-0004tH-34;
	Thu, 13 Nov 2025 04:51:18 +0000
Date: Thu, 13 Nov 2025 12:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay@kernel.org>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, kernel-team@meta.com
Subject: Re: [PATCH bpf-next 1/4] bpf: arena: populate vm_area without
 allocating memory
Message-ID: <202511130329.jSq8tSKf-lkp@intel.com>
References: <20251111163424.16471-2-puranjay@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111163424.16471-2-puranjay@kernel.org>

Hi Puranjay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Puranjay-Mohan/bpf-arena-populate-vm_area-without-allocating-memory/20251112-004253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251111163424.16471-2-puranjay%40kernel.org
patch subject: [PATCH bpf-next 1/4] bpf: arena: populate vm_area without allocating memory
config: arm64-randconfig-003-20251112 (https://download.01.org/0day-ci/archive/20251113/202511130329.jSq8tSKf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511130329.jSq8tSKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511130329.jSq8tSKf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/arena.c: In function 'apply_range_clear_cb':
>> kernel/bpf/arena.c:122:20: warning: unused variable 'mm' [-Wunused-variable]
     struct mm_struct *mm = &init_mm;
                       ^~


vim +/mm +122 kernel/bpf/arena.c

   119	
   120	static int apply_range_clear_cb(pte_t *pte, unsigned long addr, void *data)
   121	{
 > 122		struct mm_struct *mm = &init_mm;
   123		pte_t old_pte;
   124		struct page *page;
   125	
   126		/* sanity check */
   127		old_pte = ptep_get(pte);
   128		if (pte_none(old_pte) || !pte_present(old_pte))
   129			return 0; /* nothing to do */
   130	
   131		/* get page and free it */
   132		page = pte_page(old_pte);
   133		if (WARN_ON_ONCE(!page))
   134			return -EINVAL;
   135	
   136		pte_clear(mm, addr, pte);
   137	
   138		/* ensure no stale TLB entries */
   139		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
   140	
   141		__free_page(page);
   142	
   143		return 0;
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
