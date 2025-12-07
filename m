Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B36D271457
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 07:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765091707; cv=none; b=XWIdhgA+bphsq8AJ03tfdc3vNGltO96TXXw0yrmlh+4hVM/VOZv9AMRiWC9eLH27rXiP0Ls/1FzMXzOSsdb+qZowcHgIL+P+mPcpVJVAUm7eneHt2btFOAgbR6tjC8Sr8VbXlD0BgIRaCgZ3WYuwpck7FLau7jhUWcAWm9ZmWzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765091707; c=relaxed/simple;
	bh=oOn2WmfklNsNTh6AfKiWmYcYPyNgBrwjdZ33qXIS2eo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lw6tSO9cqBBnmYAbHNLNzS9eZ8wdddl0C2hXj7Y93NeDIgQC4aOBAskVnLa0NGz7x/6Q/SSzk/m2DEVudVG3v9/EIkCYbl6qGGWv1H5TXBp30biZ8U7qt8btzpTq1aBcEKH2Lqq3HvqUHktkKJnFiliPHbRVBViO3WktpenzmuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bnfu5Hq7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnfu5Hq7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765091706; x=1796627706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oOn2WmfklNsNTh6AfKiWmYcYPyNgBrwjdZ33qXIS2eo=;
  b=bnfu5Hq79y5SfKeU6rSupqTzX7n6BBHIJXqEP+B5/qURv4adI4V2IIA6
   UaMf0sK5aEVnGLB8Z+8xawjQbXcQGxLy9SXhEyvDCpLrop0ajcFh7hbXp
   XG8HpNMQaZb+OfXnD+DuIFiFlC24WumufuWNjhUSMtnGzWDRVA0I0Gbg8
   qLmtgopF6/Zd4G4KsWyOTTCqj1Xnj4pGYcW5FWRkzAyVZzn9l8MtQerVY
   nCYqpioyx+SCVAR5vGxHQJYMXFnHaGsnaeJ00EzaPg2FBmFXlFk9cJLko
   8x5yDeXJGJIIvtbXdo8UQ/ka2FqACkHWtT3ifj3s261aHVYGqCoGnUtTF
   Q==;
X-CSE-ConnectionGUID: 4gZlK6mlT4qziLliYT5q5w==
X-CSE-MsgGUID: LOs36k4lR4aA3joPcWpKOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="84474732"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="84474732"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 23:15:05 -0800
X-CSE-ConnectionGUID: Nv0bbilSSVKe2d6dcxC45w==
X-CSE-MsgGUID: GSASqY1yQleSo+7nI4fMag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="195726085"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 06 Dec 2025 23:15:04 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vS8yz-000000001Av-1UFI;
	Sun, 07 Dec 2025 07:15:01 +0000
Date: Sun, 7 Dec 2025 08:14:27 +0100
From: kernel test robot <lkp@intel.com>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 52/72] mm/kasan/common.c:601:21: error:
 'KASAN_VMALLOC_KEEP_TAG' undeclared; did you mean
 'KASAN_VMALLOC_PAGE_RANGE'?
Message-ID: <202512070858.6Mhh5r5D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   ecc46e02e0abe025a6e840cba2d647f23fd1d721
commit: 6b83afdcfa935db4f836906ca7f0fcafdca8d229 [52/72] kasan: unpoison vms[area] addresses with a common tag
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251207/202512070858.6Mhh5r5D-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512070858.6Mhh5r5D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512070858.6Mhh5r5D-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/kasan/common.c: In function '__kasan_unpoison_vmap_areas':
>> mm/kasan/common.c:601:21: error: 'KASAN_VMALLOC_KEEP_TAG' undeclared (first use in this function); did you mean 'KASAN_VMALLOC_PAGE_RANGE'?
     601 |         if (flags & KASAN_VMALLOC_KEEP_TAG) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~
         |                     KASAN_VMALLOC_PAGE_RANGE
   mm/kasan/common.c:601:21: note: each undeclared identifier is reported only once for each function it appears in


vim +601 mm/kasan/common.c

   586	
   587	#ifdef CONFIG_KASAN_VMALLOC
   588	void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms,
   589					 kasan_vmalloc_flags_t flags)
   590	{
   591		unsigned long size;
   592		void *addr;
   593		int area;
   594		u8 tag;
   595	
   596		/*
   597		 * If KASAN_VMALLOC_KEEP_TAG was set at this point, all vms[] pointers
   598		 * would be unpoisoned with the KASAN_TAG_KERNEL which would disable
   599		 * KASAN checks down the line.
   600		 */
 > 601		if (flags & KASAN_VMALLOC_KEEP_TAG) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
