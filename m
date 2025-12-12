Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9298231A04E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 10:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765537132; cv=none; b=dazbnx1+1eyNuGkTnfO6q2ml3gpKVvUdkUgCe/bjq/l0sP9ekrObSPh9C3o9SbeZB1sd1VwiRigFen78dlmhmecNppmSoYD3hkuamuDkYz08KIz3fwnYo94LqNEObELITshsbUhXikdQHTgjyWYBMZb+s9bKn/NZiVSzIU2GHAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765537132; c=relaxed/simple;
	bh=26uqO3Qhxz2JDmNCWEQRA4zTvQFvpbnaG4vErL2k3+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8hDMA0wjsZvnyLaXXrqSrPlIw6FDbsXtEykSUJ+VvnXffSUT3iiaJz6sMxZs4H6SmoQVRPVCsGlFbAP4sEjm0wdUfTt4D0W1sWEqMWbzuLHBd93yIvbB3weJw1eOv+17b6eKLRs8GbrN8GSwjD6VkxFd2JSw15up8nqR9og20w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMdR3o6O; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMdR3o6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765537131; x=1797073131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=26uqO3Qhxz2JDmNCWEQRA4zTvQFvpbnaG4vErL2k3+k=;
  b=TMdR3o6OuEkvWdW5faWK/VJYFQxXwr3SUlZLMLEsOhoa0HBwRwYLMHHu
   VPxWvgFU0eI5n/YdzxQZn/Nz72qXT66u51bGK/S2mSP2tylEtSpuO5gcZ
   NOIwdYFzAlXfuw4xUlqo/kjc+igEVfJFvgVH+1bK8Ok/V1AMdhVx5Zgd0
   GL/ex4zzbd2mTq1yyhptT6TdZteH1PkdUE0CsnbqfwBvqIDAGKlvqnTWc
   bGzQQAXK0c7e0twLjIsxgGhFMSxlHyVBxGJx3b4WnxsycSKrw57fav6Mc
   m/icfUEwYzWegszqCoRFbXDG78m7Vr1QBf8nGswgIJ4smrsH6cnwBMXz8
   Q==;
X-CSE-ConnectionGUID: R+ck7yM3Twako57oeLKDEQ==
X-CSE-MsgGUID: YOYTO1F0Tmu1Ub68LBqXHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78996648"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="78996648"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 02:58:49 -0800
X-CSE-ConnectionGUID: ynUSh+g5R2G2DWTFxcPvxw==
X-CSE-MsgGUID: BB7b1VVXQbOVHMyR4rnIvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="196967130"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Dec 2025 02:58:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU0rF-000000005xV-3Qgn;
	Fri, 12 Dec 2025 10:58:45 +0000
Date: Fri, 12 Dec 2025 18:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 01/15] kasan: sw_tags: Use arithmetic shift for shadow
 computation
Message-ID: <202512121839.CrLjXgKI-lkp@intel.com>
References: <138681b036a91587e62fd62548502bc3205c93af.1765386422.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <138681b036a91587e62fd62548502bc3205c93af.1765386422.git.m.wieczorretman@pm.me>

Hi Maciej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18 next-20251212]
[cannot apply to tip/x86/core arm64/for-next/core akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Wieczor-Retman/kasan-sw_tags-Use-arithmetic-shift-for-shadow-computation/20251211-014414
base:   linus/master
patch link:    https://lore.kernel.org/r/138681b036a91587e62fd62548502bc3205c93af.1765386422.git.m.wieczorretman%40pm.me
patch subject: [PATCH v7 01/15] kasan: sw_tags: Use arithmetic shift for shadow computation
config: arm-randconfig-r131-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121839.CrLjXgKI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121839.CrLjXgKI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121839.CrLjXgKI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/kasan/report.c:215:9: sparse: sparse: context imbalance in 'start_report' - wrong count at exit
   mm/kasan/report.c:225:9: sparse: sparse: context imbalance in 'end_report' - unexpected unlock
>> mm/kasan/report.c:674:80: sparse: sparse: cast truncates bits from constant value (ff00000000000000 becomes 0)

vim +674 mm/kasan/report.c

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
   652			if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0ULL)) ||
   653			    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
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
 > 674			if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0xFFULL << 56)) ||

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
