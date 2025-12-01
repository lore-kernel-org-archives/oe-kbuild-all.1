Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034D6221D92
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 19:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764616056; cv=none; b=A/vv3Nz7xoB+igu6rCnfX6Lzx7wVIIk/+AIwOcYn6DRtC2Ioybg9vAkmaANknRXq4hupb2F5En/g8mVh1ZXhR8+21nXwsKeSS/hDSnI+Mwtcd+77gZk8BAWOYCWPuuCmk0+QTI6OWdCSdzSM8RGZH5VcgZasMORu2fWSnlVa+Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764616056; c=relaxed/simple;
	bh=J9/7lvYHYJI/46qPDs5749STnxim1lVAYC3cgEDarNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJ26RGXVPHP2qHdbKvqnlrWm1hAKFiXthVP+pI27i20WnUv8Cd8oD/igLTzZd0l2ycg0A1uNafcWCVJ3G7zYHBOqYhf2i+o3CO61GVkSuSdpijxY3qHpNYjgovZLYn5u0Yjd/Nj00e8Z0vxqe3LaMEOBIGF1863v9E4QLiJLoH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8yZVJbp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8yZVJbp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764616055; x=1796152055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J9/7lvYHYJI/46qPDs5749STnxim1lVAYC3cgEDarNI=;
  b=l8yZVJbpLWso61MfGbR18EAQHs8XrA8D3XmdwLjQtgqR8ckGocIyrChm
   319z1cmBIj+j6Rt4jS6ZUVM9jhEt3JJDleAc8hPFTtUsVpVHTEf02+pjH
   0niQD+ejBL70eBX+715o1QpmY+vhmmCIKXx86SpJD9cd4cng1P8YfHFQw
   Rd+t8S85uY0rANK21Ck5VmnS65Dauh7cZz5GSrbwSpszlSXwXj1AYpv5v
   PwnGMcsomhmCpw2w2ag2TIINCCFCUXIPf2RaLGtucF4dxwcEOwwd/0JyY
   AZNZEzVY9nXx3vznzXYBf91NSZFdlu8/JYjnT71bee7ZV92eAdiS653fl
   A==;
X-CSE-ConnectionGUID: BP31UxGbTqql375XbkJjBQ==
X-CSE-MsgGUID: KDv9/Cb8SWSezsXr95BbzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77255778"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="77255778"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 11:07:32 -0800
X-CSE-ConnectionGUID: ++xkWq0+Tv2rL7KEN+sCUA==
X-CSE-MsgGUID: vngPM77nQL2kLpPCOSWJ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="193832556"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2025 11:07:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ9FB-0000000094j-1Vim;
	Mon, 01 Dec 2025 19:07:29 +0000
Date: Tue, 2 Dec 2025 03:07:04 +0800
From: kernel test robot <lkp@intel.com>
To: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] mm/memblock: Fix reserve_mem allocation overlapping
 KHO scratch regions
Message-ID: <202512020241.cG6YFnyc-lkp@intel.com>
References: <20251130172939.574999-1-swarajgaikwad1925@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130172939.574999-1-swarajgaikwad1925@gmail.com>

Hi Swaraj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 2178727587e1eaa930b8266377119ed6043067df]

url:    https://github.com/intel-lab-lkp/linux/commits/Swaraj-Gaikwad/mm-memblock-Fix-reserve_mem-allocation-overlapping-KHO-scratch-regions/20251130-200138
base:   2178727587e1eaa930b8266377119ed6043067df
patch link:    https://lore.kernel.org/r/20251130172939.574999-1-swarajgaikwad1925%40gmail.com
patch subject: [PATCH RFC] mm/memblock: Fix reserve_mem allocation overlapping KHO scratch regions
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20251202/202512020241.cG6YFnyc-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020241.cG6YFnyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020241.cG6YFnyc-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memblock.c: In function 'reserve_mem':
>> mm/memblock.c:2692:25: error: 'kho_scratch_cnt' undeclared (first use in this function); did you mean 'kho_scratch_only'?
    2692 |         for (i = 0; i < kho_scratch_cnt; i++) {
         |                         ^~~~~~~~~~~~~~~
         |                         kho_scratch_only
   mm/memblock.c:2692:25: note: each undeclared identifier is reported only once for each function it appears in
>> mm/memblock.c:2693:33: error: 'kho_scratch' undeclared (first use in this function)
    2693 |                 scratch_start = kho_scratch[i].addr;
         |                                 ^~~~~~~~~~~


vim +2692 mm/memblock.c

  2627	
  2628	/*
  2629	 * Parse reserve_mem=nn:align:name
  2630	 */
  2631	static int __init reserve_mem(char *p)
  2632	{
  2633		phys_addr_t start, size, align, tmp;
  2634		char *name;
  2635		char *oldp;
  2636		int len;
  2637	
  2638		if (!p)
  2639			return -EINVAL;
  2640	
  2641		/* Check if there's room for more reserved memory */
  2642		if (reserved_mem_count >= RESERVE_MEM_MAX_ENTRIES)
  2643			return -EBUSY;
  2644	
  2645		oldp = p;
  2646		size = memparse(p, &p);
  2647		if (!size || p == oldp)
  2648			return -EINVAL;
  2649	
  2650		if (*p != ':')
  2651			return -EINVAL;
  2652	
  2653		align = memparse(p+1, &p);
  2654		if (*p != ':')
  2655			return -EINVAL;
  2656	
  2657		/*
  2658		 * memblock_phys_alloc() doesn't like a zero size align,
  2659		 * but it is OK for this command to have it.
  2660		 */
  2661		if (align < SMP_CACHE_BYTES)
  2662			align = SMP_CACHE_BYTES;
  2663	
  2664		name = p + 1;
  2665		len = strlen(name);
  2666	
  2667		/* name needs to have length but not too big */
  2668		if (!len || len >= RESERVE_MEM_NAME_SIZE)
  2669			return -EINVAL;
  2670	
  2671		/* Make sure that name has text */
  2672		for (p = name; *p; p++) {
  2673			if (!isspace(*p))
  2674				break;
  2675		}
  2676		if (!*p)
  2677			return -EINVAL;
  2678	
  2679		/* Make sure the name is not already used */
  2680		if (reserve_mem_find_by_name(name, &start, &tmp))
  2681			return -EBUSY;
  2682	
  2683		/* Pick previous allocations up from KHO if available */
  2684		if (reserve_mem_kho_revive(name, size, align))
  2685			return 1;
  2686	
  2687		phys_addr_t scratch_start, scratch_end;
  2688		phys_addr_t curr_start_addr = 0;
  2689		phys_addr_t alloc_end_addr = MEMBLOCK_ALLOC_ACCESSIBLE;
  2690		unsigned int i;
  2691	
> 2692		for (i = 0; i < kho_scratch_cnt; i++) {
> 2693			scratch_start = kho_scratch[i].addr;
  2694			scratch_end = kho_scratch[i].addr + kho_scratch[i].size;
  2695			alloc_end_addr = scratch_start;
  2696			if (alloc_end_addr > curr_start_addr) {
  2697				start = memblock_phys_alloc_range(size, align, curr_start_addr, alloc_end_addr);
  2698				if (start)
  2699					break;
  2700			}
  2701	   curr_start_addr = scratch_end;
  2702		}
  2703		if (!start)
  2704			return -ENOMEM;
  2705	
  2706		reserved_mem_add(start, size, name);
  2707	
  2708		return 1;
  2709	}
  2710	__setup("reserve_mem=", reserve_mem);
  2711	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
