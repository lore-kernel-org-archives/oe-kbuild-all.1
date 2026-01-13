Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F1230F7F2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 09:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768297255; cv=none; b=Ewiox9KzX4FiBcuAn6t4cNVHK05aOxxsEjgDzVlKpCoDQzlNwTXQKEjapD5SBD7psCReslQP0/if5uw25rV5b/mJjNIxoFRkenqkTMdeBULEXNmXNJLkaG8X+WCpq3T8my5PJ7v3fFZJWgjZHsxX2/xbhUb0u+2JNsJfhFA9ma8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768297255; c=relaxed/simple;
	bh=UDNaW7Sn4obq4whRUbXRQozD33l0Xm4m3Sj/R6DL/rs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tlG30BTWltyJMQ8MezGZDfei9TNsDU88J1r0apHMgpe/UtZUAmOi/RfPybPj2QUIqrT+t8D8YOY7aT5xX09yvdpA9sRFXS8w+r60QZGDximi/FUYllF3/jZ3zgFStXKLsb7pTcKcuC9ryb+m0w2WfR57XMBxgbMtXgkCio8tOcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJLjRPTW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJLjRPTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768297253; x=1799833253;
  h=date:from:to:cc:subject:message-id;
  bh=UDNaW7Sn4obq4whRUbXRQozD33l0Xm4m3Sj/R6DL/rs=;
  b=fJLjRPTWEdNsuYFWvJ717kZmTb5vPCdT/+Cn8knrrfegcE7ST0i1CNOH
   wPCABn+yoVCNulBhBdl4gMYzZlsgDHows0LmyyJ9od4mS6IEbX6D0MoIO
   3fMU3TpLVhgHj3WDu4VlsuC3IteS4zPHUBpFkJxEMzixD/xOdHliu8yvz
   ErFSCFY9xxG4viq/WglPHLvewfqSrgMkpYtK39C+HCtO6LDsGwcj3kVGE
   TGU9SdwBxaP7Vgxs84Ootprkbt9rwyNyUUpFUjOEcuh03CO63cRir85YU
   p/1DAFJ/WGjbl6stbFtlftvGRlOEvRfjsatXpgCuQHNMRYYlqBf1TsXaW
   A==;
X-CSE-ConnectionGUID: XcoqGmO9S0Sz0W4UNN0mlw==
X-CSE-MsgGUID: D56HN1zDRYm/Zldoqss3yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80944384"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80944384"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 01:40:52 -0800
X-CSE-ConnectionGUID: 3facd3uCQAK5rlyj7ZiwjA==
X-CSE-MsgGUID: ccwhKksfQC+RIInLyIw0Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208808986"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jan 2026 01:40:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfatM-00000000EYa-1s9T;
	Tue, 13 Jan 2026 09:40:48 +0000
Date: Tue, 13 Jan 2026 17:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "Maciej Wieczor-Retman" <maciej.wieczor-retman@intel.com>
Subject: [akpm-mm:mm-new 283/303] mm/kasan/report.c:674:80: sparse:
 sparse: cast truncates bits from constant value (ff00000000000000 becomes 0)
Message-ID: <202601131757.U5JRrwbH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   abb8eb84b7bb668d982e556b2b19f0e3ac42c591
commit: a63f13759f21f65c96a77ad92773d94162380948 [283/303] kasan: sw_tags: use arithmetic shift for shadow computation
config: powerpc-randconfig-r132-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131757.U5JRrwbH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131757.U5JRrwbH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131757.U5JRrwbH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/kasan/report.c:206:13: sparse: sparse: context imbalance in 'start_report' - wrong count at exit
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
