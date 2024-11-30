Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87EA29A0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 04:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732942527; cv=none; b=ji/NoFSreMk9gEMFeLnKESi8UsrHZt61p1zPxWdDRvg0nIdgc/uapVUGp/7lLzUiw+spDYR7qD/Ifjj/9XWrkjpNOstR9KJJqC14npO/b9twOm+qqzZ+pcV5k+rtq4707NfkPLDtb8Zk57aX6iybf7WEq8xbgxS0TApkW8geg+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732942527; c=relaxed/simple;
	bh=zMstsa0thMMhiegPRnb0kGPIUruWVZtAZQg/As+rOVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MEw7Brjt3N12YiTigd44qOOrjAfD0LX6k/ScSUJjN+ufIf8Gio6cYMglRHXUijm+ly4YTc71XmUmorZOm4wrG9EpVCjFh2fO3LobrFlCpVY6dmgvOcVtm1Jkk9XDmpgPQ0Bw1m3xY7lJFI6XOT3dmDFT2ryXuo2/Iu6jq7SEgdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LkIetmPn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LkIetmPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732942525; x=1764478525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zMstsa0thMMhiegPRnb0kGPIUruWVZtAZQg/As+rOVA=;
  b=LkIetmPn7K8iLmGxF3RD+sbsHsKv+UCX7VbnUaRVXQl+aVNRsxJbiFtT
   4kqDNaapc3c2/2WpWE03PhlpYu6+TuazPGe/MMIOHmgOf7hBUQTkxV1ZZ
   bO/1b+KWfIr9+NJWbAlGUeVekUfHyLc4S8or+a8lQYwiGing22aIJhl+o
   bfAH4KYhEjCi0NBgUgPPv2TelMPn5T8RspzWQaxGvi3SsdDmIzuaGfwRI
   aBY1QJKTclS+i1fj4/FB1ATATYOoo7aUWSngEPQ2H/3cxQNfW9nRyKKC1
   kOdP3DKTFj13bb5pxtGRsNWH26JFNrDGvitCp3+S/R4KpViyJUOcNo4j5
   A==;
X-CSE-ConnectionGUID: taSJSgCETt2LTgk9YWGdFA==
X-CSE-MsgGUID: I/KlwP4mRsm/+VpeqTFzvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="44549240"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="44549240"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 20:55:24 -0800
X-CSE-ConnectionGUID: +zPEF3FsQsGkQDexJIeRbA==
X-CSE-MsgGUID: MN+MzK1wSS6yhzcU0hE9gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="92723815"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Nov 2024 20:55:23 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHFVo-00005V-2r;
	Sat, 30 Nov 2024 04:55:20 +0000
Date: Sat, 30 Nov 2024 12:55:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 24/48]
 include/linux/atomic/atomic-arch-fallback.h:295:14: error: void value not
 ignored as it ought to be
Message-ID: <202411301219.jHkzXdJD-lkp@intel.com>
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
commit: 8bef54016a1aa71f47183f0940663228c436225b [24/48] iommupt: Add the 64 bit ARMv8 page table format
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20241130/202411301219.jHkzXdJD-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411301219.jHkzXdJD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301219.jHkzXdJD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/atomic.h:80,
                    from drivers/iommu/generic_pt/fmt/../pt_defs.h:17,
                    from drivers/iommu/generic_pt/fmt/iommu_template.h:35,
                    from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:13:
   drivers/iommu/generic_pt/fmt/../pt_defs.h: In function 'pt_table_install64':
>> include/linux/atomic/atomic-arch-fallback.h:295:14: error: void value not ignored as it ought to be
     295 |         ___r = raw_cmpxchg64_release((_ptr), ___o, (_new)); \
         |              ^
   include/linux/atomic/atomic-instrumented.h:4937:9: note: in expansion of macro 'raw_try_cmpxchg64_release'
    4937 |         raw_try_cmpxchg64_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_defs.h:144:16: note: in expansion of macro 'try_cmpxchg64_release'
     144 |         return try_cmpxchg64_release(entryp, &old_entry, table_entry);
         |                ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:40:
   drivers/iommu/generic_pt/fmt/../iommu_pt.h: In function 'pt_iommu_init_domain':
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:1144:15: error: 'struct iommu_domain' has no member named 'iommupt'
    1144 |         domain->iommupt = iommu_table;
         |               ^~
--
   In file included from include/linux/atomic.h:80,
                    from drivers/iommu/generic_pt/fmt/../pt_defs.h:17,
                    from drivers/iommu/generic_pt/fmt/iommu_template.h:35,
                    from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:13:
   drivers/iommu/generic_pt/fmt/../pt_defs.h: In function 'pt_table_install64':
>> include/linux/atomic/atomic-arch-fallback.h:295:14: error: void value not ignored as it ought to be
     295 |         ___r = raw_cmpxchg64_release((_ptr), ___o, (_new)); \
         |              ^
   include/linux/atomic/atomic-instrumented.h:4937:9: note: in expansion of macro 'raw_try_cmpxchg64_release'
    4937 |         raw_try_cmpxchg64_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_defs.h:144:16: note: in expansion of macro 'try_cmpxchg64_release'
     144 |         return try_cmpxchg64_release(entryp, &old_entry, table_entry);
         |                ^~~~~~~~~~~~~~~~~~~~~


vim +295 include/linux/atomic/atomic-arch-fallback.h

0aa7be05d83cc5 Uros Bizjak  2022-05-15  283  
9257959a6e5b4f Mark Rutland 2023-06-05  284  #if defined(arch_try_cmpxchg64_release)
9257959a6e5b4f Mark Rutland 2023-06-05  285  #define raw_try_cmpxchg64_release arch_try_cmpxchg64_release
9257959a6e5b4f Mark Rutland 2023-06-05  286  #elif defined(arch_try_cmpxchg64_relaxed)
9257959a6e5b4f Mark Rutland 2023-06-05  287  #define raw_try_cmpxchg64_release(...) \
9257959a6e5b4f Mark Rutland 2023-06-05  288  	__atomic_op_release(arch_try_cmpxchg64, __VA_ARGS__)
9257959a6e5b4f Mark Rutland 2023-06-05  289  #elif defined(arch_try_cmpxchg64)
9257959a6e5b4f Mark Rutland 2023-06-05  290  #define raw_try_cmpxchg64_release arch_try_cmpxchg64
9257959a6e5b4f Mark Rutland 2023-06-05  291  #else
9257959a6e5b4f Mark Rutland 2023-06-05  292  #define raw_try_cmpxchg64_release(_ptr, _oldp, _new) \
0aa7be05d83cc5 Uros Bizjak  2022-05-15  293  ({ \
0aa7be05d83cc5 Uros Bizjak  2022-05-15  294  	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
9257959a6e5b4f Mark Rutland 2023-06-05 @295  	___r = raw_cmpxchg64_release((_ptr), ___o, (_new)); \
0aa7be05d83cc5 Uros Bizjak  2022-05-15  296  	if (unlikely(___r != ___o)) \
0aa7be05d83cc5 Uros Bizjak  2022-05-15  297  		*___op = ___r; \
0aa7be05d83cc5 Uros Bizjak  2022-05-15  298  	likely(___r == ___o); \
0aa7be05d83cc5 Uros Bizjak  2022-05-15  299  })
9257959a6e5b4f Mark Rutland 2023-06-05  300  #endif
0aa7be05d83cc5 Uros Bizjak  2022-05-15  301  

:::::: The code at line 295 was first introduced by commit
:::::: 9257959a6e5b4fca6fc8e985790bff62c2046f20 locking/atomic: scripts: restructure fallback ifdeffery

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
