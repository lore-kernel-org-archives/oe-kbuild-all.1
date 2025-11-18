Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33A4305079
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 16:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763484415; cv=none; b=cT6/NpzvFKyAKyNsc2MXAEAxYYqbuLc5hMPOA3QiU9XVsnzB3FZOcahlj5qaUyegNf/mpY0wFOb2ROUBYwjJpbYkwu7c6ExUrOKHakLRQ4UxySkDUL4T9pPjwyd/koW5oLR0L35g8nokec0PIJsg3OHqXCkN+5Yn7KqEMRPvuxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763484415; c=relaxed/simple;
	bh=NY/Bb0V6hf16GbWY4vYB0R69MSR5YtfrZVcYMKUprHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cr0vTqxOjmzXUeJ55USsLHObSHTY01H+8VUCtYzmHAzkqH8xtfT0kywfTto3LEybaJnYElc/mWNsQqpAhy8f/tuLMqDBjtveW0tOw9zpEDi9lF8GEicdEfXans/hCLfA1To2yz/57dhXzXDQinK91cpfK0RnuAWuJjkTlCfhOSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9v2n6Iv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9v2n6Iv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763484413; x=1795020413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NY/Bb0V6hf16GbWY4vYB0R69MSR5YtfrZVcYMKUprHE=;
  b=k9v2n6IvJPa8381y31L8J8ULB9fxEo2i+0MAhzDbSGd0tB79NkPmCeYy
   PKjq3aJ1kN9Pvf88f+VulpdI4Q+POZGaT3IpFURxPWVaHnhfiuxLno22h
   Mw+7I3NgTC9Qc8WjKZXk2nYG48vY/mseAxNn/dbSvXD+d40996PiKU77G
   RacZCQOIbuC7li+JVELXbibs7OMXCvaAVJuYJpweaFN9/NM/xy8N8Ifv1
   HYuxlKZHgHXkrUYyc9dr7uLVWJ9kKs5r8QIuM0NNt9A/I9g5N9bRiw7Nk
   uB0ImqtSlMWr1tRB6B1EIRP3U4mCE70RxY9dh9RaRhhyoD2l8Dqm9+VY0
   g==;
X-CSE-ConnectionGUID: YPinqnIqQt6Ag4be/vL9Qg==
X-CSE-MsgGUID: 3/j6Lz8WR9Wb8Ji9gf4ZjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65451293"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65451293"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:46:52 -0800
X-CSE-ConnectionGUID: bElgRJ5PQkm5aLd3HsBsZQ==
X-CSE-MsgGUID: 2Na+S1oER0i+B819Sb/K0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="191585164"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Nov 2025 08:46:51 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLOqu-0001xg-2s;
	Tue, 18 Nov 2025 16:46:48 +0000
Date: Wed, 19 Nov 2025 00:46:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yin Tirui <yintirui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3214/3214] mm/memory.c:2802:5: sparse: sparse:
 symbol '__remap_pfn_range' was not declared. Should it be static?
Message-ID: <202511190025.obom3fen-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b4a3c05741e1650e8bb8399196fb5d7a318a4698
commit: 923e224a12462d640fa37f3069c6bfafd378ac3b [3214/3214] mm: introduce remap_pfn_range_try_pmd() for PMD-level hugepage mapping
config: x86_64-randconfig-r111-20251118 (https://download.01.org/0day-ci/archive/20251119/202511190025.obom3fen-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511190025.obom3fen-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511190025.obom3fen-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memory.c:2802:5: sparse: sparse: symbol '__remap_pfn_range' was not declared. Should it be static?
   mm/memory.c:301:9: sparse: sparse: incompatible types in conditional expression (different base types):
   mm/memory.c:301:9: sparse:    void
   mm/memory.c:301:9: sparse:    int

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
