Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C0C12B93
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 09:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732957458; cv=none; b=VXcRr0MxgG1kIRuWj3VojCpxa64iri3Qh9OgDXq6XYSX54+K2OYm1/G23kzvfDLR5eL0temWbTKWTo+BwT7zwnDLnqFB+IwrGpyEVBnjIQsf+vuXcjEVkbtykm6gRHEnvpNtp5ZpFUJESOR9np2s1tqo7ZQJ3R+kW7qGYdL5GnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732957458; c=relaxed/simple;
	bh=3nuOyvxSkl7X+WrA6q5g4SYDGnS8tYWv1pQC6Jo1WhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lL89S7hHfcQ5jG12T7SADBvCW27bZHXhMdRsIoyfQtpHIyzLmGBaY6+SPfAr/9kGPJrVdaUP/Ja9fd6DGStXP82Dt4yxWOK/Kww+fXDX69M4NqThXz82cgefaw7CndoTfs+gCWPn3RvNPZGN1fCIA4jGNOh4O7GtJVkt+xFTn/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4L/Dy1+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4L/Dy1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732957456; x=1764493456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3nuOyvxSkl7X+WrA6q5g4SYDGnS8tYWv1pQC6Jo1WhA=;
  b=D4L/Dy1+fChoE7RQk5lh8rxIXv0gnO8Oogm89rGta8AuUB+xmc/fDx7+
   sy/PBiP3pgCmtHr6rdVSXz/Ndeaa+Ebm9s6BxgnsZcVBuQgehDt/T5c+Z
   r/h4KDtGVJA0j2ueIrCIoPgi5WWyvyHn+lJaybZniIC5mbVtz+qnUHZNA
   sbJyIOny+Tjc5fdwNlY8PHxXG5GyZ821tl0GTV4PaLiXakfvWuuVDEazx
   v3vmosvw6Ssj2zf6DYvV8QWo7PMlyJ97NAin9Nvo4KeXFTsd/FMvyAsne
   yLbhlBvx4KgSaVSDVpzfn+jrVU7bWvPrks68LUuPv1Vo0GQEr1KdivMSZ
   A==;
X-CSE-ConnectionGUID: 1aG/0F22S7e28DZzCBcVLQ==
X-CSE-MsgGUID: pjeALnHWRI+n4Z4kcO6Zmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33305015"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="33305015"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 01:04:15 -0800
X-CSE-ConnectionGUID: DT9QWbKARZ+paX1L47sBRw==
X-CSE-MsgGUID: k69bCM7OTXq/c53egqEEXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="97427258"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 30 Nov 2024 01:04:14 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHJOe-0000Sd-08;
	Sat, 30 Nov 2024 09:04:12 +0000
Date: Sat, 30 Nov 2024 17:03:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 25/48]
 drivers/iommu/generic_pt/fmt/amdv1.h:298:13: warning: unused variable 'new'
Message-ID: <202411301716.o0yY86D0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   87e70b0c76695339b0163fde25b260773b0720c2
commit: b7d6aaa64d8e078f38e5958b76c4b9bb37fb9fb7 [25/48] iommupt: Add the AMD IOMMU v1 page table format
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20241130/202411301716.o0yY86D0-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411301716.o0yY86D0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301716.o0yY86D0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/atomic.h:80,
                    from drivers/iommu/generic_pt/fmt/../pt_defs.h:17,
                    from drivers/iommu/generic_pt/fmt/iommu_template.h:35,
                    from drivers/iommu/generic_pt/fmt/iommu_amdv1.c:9:
   drivers/iommu/generic_pt/fmt/../pt_defs.h: In function 'pt_table_install64':
   include/linux/atomic/atomic-arch-fallback.h:295:14: error: void value not ignored as it ought to be
     295 |         ___r = raw_cmpxchg64_release((_ptr), ___o, (_new)); \
         |              ^
   include/linux/atomic/atomic-instrumented.h:4937:9: note: in expansion of macro 'raw_try_cmpxchg64_release'
    4937 |         raw_try_cmpxchg64_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_defs.h:144:16: note: in expansion of macro 'try_cmpxchg64_release'
     144 |         return try_cmpxchg64_release(entryp, &old_entry, table_entry);
         |                ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/amdv1.h: In function 'amdv1pt_entry_make_write_dirty':
   include/linux/atomic/atomic-arch-fallback.h:259:14: error: void value not ignored as it ought to be
     259 |         ___r = raw_cmpxchg64((_ptr), ___o, (_new)); \
         |              ^
   include/linux/atomic/atomic-instrumented.h:4918:9: note: in expansion of macro 'raw_try_cmpxchg64'
    4918 |         raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/amdv1.h:300:16: note: in expansion of macro 'try_cmpxchg64'
     300 |         return try_cmpxchg64(tablep, &pts->entry, new);
         |                ^~~~~~~~~~~~~
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:36:
>> drivers/iommu/generic_pt/fmt/amdv1.h:298:13: warning: unused variable 'new' [-Wunused-variable]
     298 |         u64 new = pts->entry | AMDV1PT_FMT_D;
         |             ^~~
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:40:
   drivers/iommu/generic_pt/fmt/../iommu_pt.h: In function 'pt_iommu_init_domain':
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:1144:15: error: 'struct iommu_domain' has no member named 'iommupt'
    1144 |         domain->iommupt = iommu_table;
         |               ^~
--
   In file included from include/linux/atomic.h:80,
                    from drivers/iommu/generic_pt/fmt/../pt_defs.h:17,
                    from drivers/iommu/generic_pt/fmt/iommu_template.h:35,
                    from drivers/iommu/generic_pt/fmt/iommu_amdv1.c:9:
   drivers/iommu/generic_pt/fmt/../pt_defs.h: In function 'pt_table_install64':
   include/linux/atomic/atomic-arch-fallback.h:295:14: error: void value not ignored as it ought to be
     295 |         ___r = raw_cmpxchg64_release((_ptr), ___o, (_new)); \
         |              ^
   include/linux/atomic/atomic-instrumented.h:4937:9: note: in expansion of macro 'raw_try_cmpxchg64_release'
    4937 |         raw_try_cmpxchg64_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_defs.h:144:16: note: in expansion of macro 'try_cmpxchg64_release'
     144 |         return try_cmpxchg64_release(entryp, &old_entry, table_entry);
         |                ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/amdv1.h: In function 'amdv1pt_entry_make_write_dirty':
   include/linux/atomic/atomic-arch-fallback.h:259:14: error: void value not ignored as it ought to be
     259 |         ___r = raw_cmpxchg64((_ptr), ___o, (_new)); \
         |              ^
   include/linux/atomic/atomic-instrumented.h:4918:9: note: in expansion of macro 'raw_try_cmpxchg64'
    4918 |         raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/amdv1.h:300:16: note: in expansion of macro 'try_cmpxchg64'
     300 |         return try_cmpxchg64(tablep, &pts->entry, new);
         |                ^~~~~~~~~~~~~
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:36:
>> drivers/iommu/generic_pt/fmt/amdv1.h:298:13: warning: unused variable 'new' [-Wunused-variable]
     298 |         u64 new = pts->entry | AMDV1PT_FMT_D;
         |             ^~~


vim +/new +298 drivers/iommu/generic_pt/fmt/amdv1.h

   294	
   295	static inline bool amdv1pt_entry_make_write_dirty(struct pt_state *pts)
   296	{
   297		u64 *tablep = pt_cur_table(pts, u64) + pts->index;
 > 298		u64 new = pts->entry | AMDV1PT_FMT_D;
   299	
   300		return try_cmpxchg64(tablep, &pts->entry, new);
   301	}
   302	#define pt_entry_make_write_dirty amdv1pt_entry_make_write_dirty
   303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
