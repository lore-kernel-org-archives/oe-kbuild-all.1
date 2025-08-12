Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4979D2D9EF3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 17:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755020137; cv=none; b=XPt8H9zmmptyXtJ0Ao+W0Qgkg7zlKUEYCxkaDbA7r+bqlQ4ePAL6jxo9kvbP0FvQF4+H8wmFRAbhbbK0A+hrNod3YN5khdd5zHdO9kF2hOm5Ii2reK7jfbwf1L5czZ0oWdIHj3KomTtYZZKOYE6xLVxe0JvJpk9RY80+GP1kcvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755020137; c=relaxed/simple;
	bh=G5bW9rp9wgeyoccSUiAg5dNYfe8rmL2ZYkZ21RhfV/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=giC6pqDv8vJXB15VjfmnKgvckfbl5LPz9ce1pt9F/ReDNMKi6JYwOCk4ATawFPwAPTm81QpWonxgC44YQillwd0BkALSVut+eFIsKGvtPjBCeTLTS88Mvjwdrqa1jGIDCAtOBrUgD3K6BaajH0SzUVPHVPR5/BkCbno+/+1uIoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvN5xttF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvN5xttF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755020137; x=1786556137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G5bW9rp9wgeyoccSUiAg5dNYfe8rmL2ZYkZ21RhfV/8=;
  b=SvN5xttFVXXWh7C9UqULlCimRxjJ3zkaTOuJTvoN8hUnlzMZSAMPansP
   kfsdNnYfRjlWSQxmTyEw9heNekeCnVNKgZ5d39u+TxT1T2zADJksnCS60
   grVDGivH/hqCLJnc4vzIpjcRM95DylKeHFJcCaV5QARLPEdrQlFFjHsph
   etSHW2SKlQUHVkjFEjM9+1vp3a/LTDdX26Dv78p1n32x1SLkcSeERdMhv
   TbackVCGpbeiJSdHCP9bx7ZmKYTYu0ywbRrcJVfMJdTxewqD612lBSFbx
   jYDQkzNg2kO8WjocU89g42KYZ6FVqqHWdxQdQCWOBF1kKr++tVe599fak
   g==;
X-CSE-ConnectionGUID: uv6xxmN7Sf69GYDcrHbFKQ==
X-CSE-MsgGUID: 35f1br88T+WvTZSu1PF12g==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57385551"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57385551"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 10:35:36 -0700
X-CSE-ConnectionGUID: RARsBC8tTtqJ6X1HLfhc2Q==
X-CSE-MsgGUID: 5aW1bCCZSh+ZJHaRKf5IPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="189954393"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Aug 2025 10:35:35 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulsuK-00074m-1W;
	Tue, 12 Aug 2025 17:35:32 +0000
Date: Wed, 13 Aug 2025 01:35:08 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 01/18] kasan: sw_tags: Use arithmetic shift for shadow
 computation
Message-ID: <202508130154.qURGvA1T-lkp@intel.com>
References: <6c04b001999b845f9f601ae42ccd116dcca6b4f1.1755004923.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c04b001999b845f9f601ae42ccd116dcca6b4f1.1755004923.git.maciej.wieczor-retman@intel.com>

Hi Maciej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on arm64/for-next/core tip/x86/mm linus/master v6.17-rc1 next-20250812]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Wieczor-Retman/kasan-sw_tags-Use-arithmetic-shift-for-shadow-computation/20250812-213257
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/6c04b001999b845f9f601ae42ccd116dcca6b4f1.1755004923.git.maciej.wieczor-retman%40intel.com
patch subject: [PATCH v4 01/18] kasan: sw_tags: Use arithmetic shift for shadow computation
config: arm-randconfig-004-20250812 (https://download.01.org/0day-ci/archive/20250813/202508130154.qURGvA1T-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508130154.qURGvA1T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508130154.qURGvA1T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/kasan/report.c: In function 'kasan_non_canonical_hook':
>> mm/kasan/report.c:652:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     652 |   if (addr < (u64)kasan_mem_to_shadow((void *)(0UL)) ||
         |              ^
   mm/kasan/report.c:653:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     653 |       addr > (u64)kasan_mem_to_shadow((void *)(~0UL)))
         |              ^
>> mm/kasan/report.c:674:55: warning: left shift count >= width of type [-Wshift-count-overflow]
     674 |   if (addr < (u64)kasan_mem_to_shadow((void *)(0xFFUL << 56)) ||
         |                                                       ^~
   mm/kasan/report.c:674:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     674 |   if (addr < (u64)kasan_mem_to_shadow((void *)(0xFFUL << 56)) ||
         |              ^
   mm/kasan/report.c:675:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     675 |       addr > (u64)kasan_mem_to_shadow((void *)(~0UL)))
         |              ^


vim +652 mm/kasan/report.c

   630	
   631	#if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
   632	/*
   633	 * With compiler-based KASAN modes, accesses to bogus pointers (outside of the
   634	 * mapped kernel address space regions) cause faults when KASAN tries to check
   635	 * the shadow memory before the actual memory access. This results in cryptic
   636	 * GPF reports, which are hard for users to interpret. This hook helps users to
   637	 * figure out what the original bogus pointer was.
   638	 */
   639	void kasan_non_canonical_hook(unsigned long addr)
   640	{
   641		unsigned long orig_addr;
   642		const char *bug_type;
   643	
   644		/*
   645		 * For Generic KASAN, kasan_mem_to_shadow() uses the logical right shift
   646		 * and never overflows with the chosen KASAN_SHADOW_OFFSET values (on
   647		 * both x86 and arm64). Thus, the possible shadow addresses (even for
   648		 * bogus pointers) belong to a single contiguous region that is the
   649		 * result of kasan_mem_to_shadow() applied to the whole address space.
   650		 */
   651		if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
 > 652			if (addr < (u64)kasan_mem_to_shadow((void *)(0UL)) ||
   653			    addr > (u64)kasan_mem_to_shadow((void *)(~0UL)))
   654				return;
   655		}
   656	
   657		/*
   658		 * For Software Tag-Based KASAN, kasan_mem_to_shadow() uses the
   659		 * arithmetic shift. Normally, this would make checking for a possible
   660		 * shadow address complicated, as the shadow address computation
   661		 * operation would overflow only for some memory addresses. However, due
   662		 * to the chosen KASAN_SHADOW_OFFSET values and the fact the
   663		 * kasan_mem_to_shadow() only operates on pointers with the tag reset,
   664		 * the overflow always happens.
   665		 *
   666		 * For arm64, the top byte of the pointer gets reset to 0xFF. Thus, the
   667		 * possible shadow addresses belong to a region that is the result of
   668		 * kasan_mem_to_shadow() applied to the memory range
   669		 * [0xFF000000000000, 0xFFFFFFFFFFFFFFFF]. Despite the overflow, the
   670		 * resulting possible shadow region is contiguous, as the overflow
   671		 * happens for both 0xFF000000000000 and 0xFFFFFFFFFFFFFFFF.
   672		 */
   673		if (IS_ENABLED(CONFIG_KASAN_SW_TAGS) && IS_ENABLED(CONFIG_ARM64)) {
 > 674			if (addr < (u64)kasan_mem_to_shadow((void *)(0xFFUL << 56)) ||

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
