Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570EE74BE1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 07:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763365950; cv=none; b=YxxDMXEtsSuJ66mn4tvWmyHf+T0n/kmEX+Ad6SRqeRN9bsdKviWSrpZ6hkiDRvdBlg5F44i74c/tcYEcJdwgGaiqeVdkvdWVIY5MK3sATtl7lKzYgdLso96h2J4g7//ZHjFkVlfARyciXQdjkj8ftyujga+SkJeAJTTmSOGp8Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763365950; c=relaxed/simple;
	bh=2CjHqgbXATi/RP24TaVLQUa+2vBJRu6Jpa8AEXhgOuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jrew7hl818yEQx/7MP6Li3CcwL6L6NIfGlt0/Awan6wkGYx6jainIDNwahI+RV4jXDgfFDkFph/IOClo2SGpFA1U7YYTp27OOf7HWWoZm7w+Io29BLuvGuoyO6h1bguMl9BfvNgb5U19YAOIkh5g4xvi6tOAXKo8gDVx+lsom98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hb/sCFdI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hb/sCFdI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763365948; x=1794901948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2CjHqgbXATi/RP24TaVLQUa+2vBJRu6Jpa8AEXhgOuc=;
  b=hb/sCFdIXQtgExxgj5QKIHo3y1d2hPX8w7nq2m26AQWjjUSsXqihE13D
   Q2cjKqlW3reWibO1Qq9VOXhmmP4U7+/hFrB0NpkCShhOWXoOXOk4YHBn9
   ALxs/8Cj3ez/gOiNnyQT2ARspHHXp7Jmd608wo8OnOKKfeY41EmCvYNY8
   zF7Zh6Fyzmu5ywgC32eHcln+mQJ/gQYDWHrVqZqZ8IuB4XgiUuJPgblAj
   3xdcN/JJ1BdAL3XtOFVxjNuPEuxG9JdCA2/woNrMpF//C1sxtNAGLqUUO
   c3i+4Qvblm5bHoyGz9EyoUxuFviJqe3RxXJWG/j5XN+68NYZxxwHgn7AB
   A==;
X-CSE-ConnectionGUID: 5IC53ygiTh+3IMo4YRuhag==
X-CSE-MsgGUID: J5YlVQZ9SpaP3xgmD077RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="76707739"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="76707739"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 23:52:28 -0800
X-CSE-ConnectionGUID: de53y+JzTgaIk7GPxHcUhw==
X-CSE-MsgGUID: mEtL2zqhRKGLiWSpDYHMYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="190618082"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Nov 2025 23:52:26 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKu2C-0000HV-22;
	Mon, 17 Nov 2025 07:52:24 +0000
Date: Mon, 17 Nov 2025 15:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3198/3198] mm/memory.c:2805: warning: Function
 parameter or member 'page_shift' not described in '__remap_pfn_range'
Message-ID: <202511171556.lxjrabpR-lkp@intel.com>
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
commit: 9058fc5efa4aa44340385ca69fb4ef016931af50 [3198/3198] !18961  mm: add huge pfnmap support for remap_pfn_range()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251117/202511171556.lxjrabpR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511171556.lxjrabpR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511171556.lxjrabpR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:2805: warning: Function parameter or member 'page_shift' not described in '__remap_pfn_range'
>> mm/memory.c:2805: warning: expecting prototype for remap_pfn_range(). Prototype was for __remap_pfn_range() instead


vim +2805 mm/memory.c

923e224a12462d Yin Tirui                     2025-11-13  2789  
74ffa5a3e68504 Christoph Hellwig             2021-04-29  2790  /**
74ffa5a3e68504 Christoph Hellwig             2021-04-29  2791   * remap_pfn_range - remap kernel memory to userspace
74ffa5a3e68504 Christoph Hellwig             2021-04-29  2792   * @vma: user vma to map to
74ffa5a3e68504 Christoph Hellwig             2021-04-29  2793   * @addr: target page aligned user address to start at
74ffa5a3e68504 Christoph Hellwig             2021-04-29  2794   * @pfn: page frame number of kernel physical memory address
74ffa5a3e68504 Christoph Hellwig             2021-04-29  2795   * @size: size of mapping area
74ffa5a3e68504 Christoph Hellwig             2021-04-29  2796   * @prot: page protection flags for this mapping
74ffa5a3e68504 Christoph Hellwig             2021-04-29  2797   *
74ffa5a3e68504 Christoph Hellwig             2021-04-29  2798   * Note: this is only safe if the mm semaphore is held when called.
74ffa5a3e68504 Christoph Hellwig             2021-04-29  2799   *
74ffa5a3e68504 Christoph Hellwig             2021-04-29  2800   * Return: %0 on success, negative error code otherwise.
74ffa5a3e68504 Christoph Hellwig             2021-04-29  2801   */
923e224a12462d Yin Tirui                     2025-11-13  2802  int __remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
923e224a12462d Yin Tirui                     2025-11-13  2803  		    unsigned long pfn, unsigned long size, pgprot_t prot,
923e224a12462d Yin Tirui                     2025-11-13  2804  			unsigned int page_shift)
74ffa5a3e68504 Christoph Hellwig             2021-04-29 @2805  {
74ffa5a3e68504 Christoph Hellwig             2021-04-29  2806  	int err;
74ffa5a3e68504 Christoph Hellwig             2021-04-29  2807  
74ffa5a3e68504 Christoph Hellwig             2021-04-29  2808  	err = track_pfn_remap(vma, &prot, pfn, addr, PAGE_ALIGN(size));
2ab640379a0ab4 venkatesh.pallipadi@intel.com 2008-12-18  2809  	if (err)
74ffa5a3e68504 Christoph Hellwig             2021-04-29  2810  		return -EINVAL;
2ab640379a0ab4 venkatesh.pallipadi@intel.com 2008-12-18  2811  
923e224a12462d Yin Tirui                     2025-11-13  2812  	err = __remap_pfn_range_notrack(vma, addr, pfn, size, prot, page_shift);
74ffa5a3e68504 Christoph Hellwig             2021-04-29  2813  	if (err)
68f48381d7fdd1 Suren Baghdasaryan            2023-01-26  2814  		untrack_pfn(vma, pfn, PAGE_ALIGN(size), true);
^1da177e4c3f41 Linus Torvalds                2005-04-16  2815  	return err;
^1da177e4c3f41 Linus Torvalds                2005-04-16  2816  }
923e224a12462d Yin Tirui                     2025-11-13  2817  

:::::: The code at line 2805 was first introduced by commit
:::::: 74ffa5a3e68504dd289135b1cf0422c19ffb3f2e mm: add remap_pfn_range_notrack

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
