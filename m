Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B754A28750F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 06:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763362165; cv=none; b=siH4+3D47JkL9m0J9nQF8Z4tYRnlcWoXabPDNtpQ88K5bYWT08NvwYnZ8QsPQYMVeIxDQ3Xddb0pud5aG+TKfl8CH4TtVEv3fLDV2E0XC7Wf0g8qbrmeoKb4zJ5rL1t5S/LIfHYoY7Amyhyv6Myjw3d9dIl8drSpGGrQ0l0MR8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763362165; c=relaxed/simple;
	bh=hVCy+okSvPXmg06jrCsxlEy7dsrnZdyFmfIuFIjcPIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TtBJitxOKuRNsl6BufuwghEEOuZJqtQRbUVAzW5jGrkQTcbvJ1aTCPbzanr7uB/hLW0BPUMvSjC/zDcHv5AwLR3/4M54B4417SerS6X44KPw89smtGBFDdpHcx99HUor3rQiMUWja0v7ugYQUGKOsb5EmbTpQeuFy4vrFv9mshM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=enm+JMfY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="enm+JMfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763362163; x=1794898163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hVCy+okSvPXmg06jrCsxlEy7dsrnZdyFmfIuFIjcPIQ=;
  b=enm+JMfYAFgkYPIBzeSXG3UqbiIP5cm4oSXVO5pBKv9X/uersnQ0DJpe
   tzKOxLW7IcRE7p4oQxwOYSmsEYCKaWWbth1oe1fPgZVWDeogBeq3zoO0E
   mB67iOx23xnzlz7ubzwABUZLHciXkQVFY0PDzjGeevs3xXdHW2O1i7hpk
   dXkJVadV1NuBQYZMmmFV8COTsKlXp5UzpQkxvRA+mxNxqSCauZiUt8lOR
   ys/TW6ZsXGmfPVVX8LbmASTTN4GtfuiuIbK6tApAnll+KbQu6xOVo2FaK
   sbwjqgc2B5KZRZ4EL5kJglmssRbCgP1gWiroIOT+k/GnXuuyIlTRWjst0
   w==;
X-CSE-ConnectionGUID: e7j0ZSgpR/SVtjS5sqiiDw==
X-CSE-MsgGUID: fk38fbmkSuWftOhfYDbjfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82742132"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="82742132"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 22:49:21 -0800
X-CSE-ConnectionGUID: b+TftWYmT1G2HfxZidmDvw==
X-CSE-MsgGUID: QwwyofUpT4u0a8Nf2zLGTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="189668867"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Nov 2025 22:49:21 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKt38-0000EY-1U;
	Mon, 17 Nov 2025 06:49:18 +0000
Date: Mon, 17 Nov 2025 14:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yin Tirui <yintirui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3198/3198] mm/memory.c:2802:5: warning: no
 previous prototype for '__remap_pfn_range'
Message-ID: <202511171413.zOn7Hte0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ebdf6593446d169605a079430b44abc212c60eb6
commit: 923e224a12462d640fa37f3069c6bfafd378ac3b [3198/3198] mm: introduce remap_pfn_range_try_pmd() for PMD-level hugepage mapping
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251117/202511171413.zOn7Hte0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511171413.zOn7Hte0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511171413.zOn7Hte0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/memory.c:68:
   include/linux/migrate.h:102:9: error: expected identifier or '(' before '{' token
     102 |         { return -EINVAL; }
         |         ^
>> mm/memory.c:2802:5: warning: no previous prototype for '__remap_pfn_range' [-Wmissing-prototypes]
    2802 | int __remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
         |     ^~~~~~~~~~~~~~~~~
   mm/memory.c: In function 'do_numa_page':
   mm/memory.c:5614:24: warning: variable 'nr_pages' set but not used [-Wunused-but-set-variable]
    5614 |         int flags = 0, nr_pages;
         |                        ^~~~~~~~
   include/linux/migrate.h: At top level:
   include/linux/migrate.h:98:19: warning: 'isolate_and_migrate_folios' declared 'static' but never defined [-Wunused-function]
      98 | static inline int isolate_and_migrate_folios(struct folio **folios, unsigned int nr_folios,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_SUPPORTS_SCHED_SOFT_QUOTA
   Depends on [n]: CGROUPS [=n]
   Selected by [y]:
   - ARM64 [=y]
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +/__remap_pfn_range +2802 mm/memory.c

  2789	
  2790	/**
  2791	 * remap_pfn_range - remap kernel memory to userspace
  2792	 * @vma: user vma to map to
  2793	 * @addr: target page aligned user address to start at
  2794	 * @pfn: page frame number of kernel physical memory address
  2795	 * @size: size of mapping area
  2796	 * @prot: page protection flags for this mapping
  2797	 *
  2798	 * Note: this is only safe if the mm semaphore is held when called.
  2799	 *
  2800	 * Return: %0 on success, negative error code otherwise.
  2801	 */
> 2802	int __remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
  2803			    unsigned long pfn, unsigned long size, pgprot_t prot,
  2804				unsigned int page_shift)
  2805	{
  2806		int err;
  2807	
  2808		err = track_pfn_remap(vma, &prot, pfn, addr, PAGE_ALIGN(size));
  2809		if (err)
  2810			return -EINVAL;
  2811	
  2812		err = __remap_pfn_range_notrack(vma, addr, pfn, size, prot, page_shift);
  2813		if (err)
  2814			untrack_pfn(vma, pfn, PAGE_ALIGN(size), true);
  2815		return err;
  2816	}
  2817	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
