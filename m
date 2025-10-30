Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F86324B3B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 12:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761828125; cv=none; b=jXeVLEyDPf+YCbjWc9XVU/Yr3kC14i6MKGNeM9mRR6Zuu9gTfKkrcejo41tgj4NCogn39El6V6UTIfWBe67CoFFj75gTAZaobzkMBkTraI6Qh7D1UDpWl1Lr25ignW2dXqhST04r9UFpofZG60zB0Rw1IQJ6ZQ2Qh1EyzkZO/wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761828125; c=relaxed/simple;
	bh=aMNUyPnxFHwz43GOM5XeV5JHWoeyrYmycpXm6m7/EHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thjStz5mBbTe2oxZolog5HaNTjAqi1kK+z4e6L5WnWpEOLXjiqPk2bvn1PZv0Pn53XUY5b4mwU8o6Am9OfhKjgcWxx78NzCaSouGVwAqk++9RmaEKoL1A3Be2JMHiNYTzBismQpJV2CEsdU9SFo1Bx+iJwaFNrOEKFuC4e/2/Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0RBTPfc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0RBTPfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761828124; x=1793364124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aMNUyPnxFHwz43GOM5XeV5JHWoeyrYmycpXm6m7/EHk=;
  b=A0RBTPfchnmwby12HqARzr2KOSkfzuSJQCdxM8rLGWTlG1na2msPsx8u
   2Hidp3OAC21SLdLBYb6R8e93I1x5kSu5EkQMpdRRreeuuRSCoXpNdSY5w
   qinursVuQddrPMbW9MrIHZIX38DbKXXAlj+aKoONc4452dzJ17KxkxoNY
   O/vN3Ect7YdhSKDLPIcYStFjdLEQ/mmn3I0TLLfrOWpfUje2L4XPc3J3H
   K/LozeCwBx8cN/HCb3d/EWcAcCas0QT2L+AYEmizh2LCHDqeRiJu66oXP
   Mrx9bemwyr4I3Ln6ODpMr6DBsTh5NXXqFyIi3ViKrudgdPB1OmiHMpHVb
   Q==;
X-CSE-ConnectionGUID: HoR2LbBhR/SraCZYpEUMAQ==
X-CSE-MsgGUID: NWEoiLfiRhW0joTC6jnbLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64007233"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="64007233"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 05:42:03 -0700
X-CSE-ConnectionGUID: bDgMe0uJTY6H4pUoY/jX+A==
X-CSE-MsgGUID: OcPHmdPsSAaB9JpbDctNLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="185603309"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 30 Oct 2025 05:42:02 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vERxw-000Lyq-2Y;
	Thu, 30 Oct 2025 12:41:36 +0000
Date: Thu, 30 Oct 2025 20:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 03/18] kasan: sw_tags: Use arithmetic shift for shadow
 computation
Message-ID: <202510302027.uPzsS8dH-lkp@intel.com>
References: <ab71a0af700c8b83b51a7174fb6fd297e9b5f1ee.1761763681.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab71a0af700c8b83b51a7174fb6fd297e9b5f1ee.1761763681.git.m.wieczorretman@pm.me>

Hi Maciej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on akpm-mm/mm-everything arm64/for-next/core linus/master v6.18-rc3 next-20251030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Wieczor-Retman/kasan-Unpoison-pcpu-chunks-with-base-address-tag/20251030-041340
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/ab71a0af700c8b83b51a7174fb6fd297e9b5f1ee.1761763681.git.m.wieczorretman%40pm.me
patch subject: [PATCH v6 03/18] kasan: sw_tags: Use arithmetic shift for shadow computation
config: xtensa-randconfig-001-20251030 (https://download.01.org/0day-ci/archive/20251030/202510302027.uPzsS8dH-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510302027.uPzsS8dH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510302027.uPzsS8dH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/kasan/report.c: In function 'kasan_non_canonical_hook':
>> mm/kasan/report.c:674:65: warning: left shift count >= width of type [-Wshift-count-overflow]
     674 |   if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0xFFUL << 56)) ||
         |                                                                 ^~


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
   652			if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0UL)) ||
   653			    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0UL)))
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
 > 674			if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0xFFUL << 56)) ||

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
