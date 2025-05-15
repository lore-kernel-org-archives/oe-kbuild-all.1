Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DC6B664
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 21:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747345170; cv=none; b=AB/2iv5rZz7k5mHj1QwEcy/C6b7i9urNRX7CVhIgyT0TC3k3vSNyz1Y22zUH7aYPSGeK6FyD4rzSgr/na319WxQHHiW84SVXQQw6NtADXQDif6L7RDrX2kfCkKh1CgwxnN2qJ6yofvhicl2Odh/HK7OnB8tegcZ5IDVe3SDV3kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747345170; c=relaxed/simple;
	bh=sAItSJuA0gDFDsaAlfi6jyZon83JoFoumqzTcWsNKRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=regNNhwXa0BID8+FEhwq/RUwaSeQtQD+3c/+a+vEzlezmLe2PDaCSkJJfkvAkXIhn+MeT96Ey6NcFu3UM0XXGgcIs4pXwpdlllLgfYpHidjma5iXfrpygfg6hEwrZCDA8cHI5DuEVjv2TuBZ0F4hT+JDkDOIyDKQM50P7+2x8ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NIWOoCOS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NIWOoCOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747345168; x=1778881168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sAItSJuA0gDFDsaAlfi6jyZon83JoFoumqzTcWsNKRo=;
  b=NIWOoCOSX/NxTepF0IcM0A0nFrb1r1zQJpZ2G5318Q1gptHFMvrJy5zd
   13FwOudXHgHqAUzH8UtD7fjLVhHhA/XTWAaaH9g10ZcGOpV2GqeQxJLS3
   JWGulwrfzrQdKIMTisqmxEF0uf9AZpiO7hXFrfPVupADmvLQ7Bc3b5Dpl
   HmgyNWkeQSRtyMdGMgAfbmG1EkC94Yj7zaJ1ny2ZjI0PWvElVXxsg8IvG
   C/mSakDV8UAoCk0j3Hnp5mBZCvGrZ+QgEMTnQlOOyAAxBQHEZESFeBXJg
   svTMZOIcSIG//YMVMD1g3RQiIMgm03DejkpfkABcgPiOx8B1Z4JGdGK37
   g==;
X-CSE-ConnectionGUID: bwlRvDYJTiWxLxg8ITJ9yg==
X-CSE-MsgGUID: w6PSREGSSSWhpij7xu0omA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53118797"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="53118797"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 14:39:27 -0700
X-CSE-ConnectionGUID: vlw2NGqpSoiPHU1G26HiPQ==
X-CSE-MsgGUID: 7uCmY/95S+uN7EWEmztQvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="138994749"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 May 2025 14:39:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFgIW-000IlP-0K;
	Thu, 15 May 2025 21:39:24 +0000
Date: Fri, 16 May 2025 05:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 include/linux/fortify-string.h:70:29: warning: '__builtin_memcpy': specified
 size between 4294967272 and 4294967295 exceeds maximum object size
 2147483647
Message-ID: <202505160507.TpdEr4cX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   33d0bb4218ed324364ecbbaef42f75f4479a2fc7
commit: 1359fd9eae29490c542e17c107cb41cfb8463138 [1/1] ARM: 9429/1: ioremap: Sync PGDs for VMALLOC shadow
config: arm-randconfig-r111-20250516 (https://download.01.org/0day-ci/archive/20250516/202505160507.TpdEr4cX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250516/202505160507.TpdEr4cX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505160507.TpdEr4cX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:294:0,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from arch/arm/mm/ioremap.c:24:
   In function 'memcpy_pgd.constprop',
       inlined from '__check_vmalloc_seq' at arch/arm/mm/ioremap.c:145:3:
>> include/linux/fortify-string.h:70:29: warning: '__builtin_memcpy': specified size between 4294967272 and 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overflow=]
    #define __underlying_memcpy __builtin_memcpy
                                ^
   include/linux/fortify-string.h:662:2: note: in expansion of macro '__underlying_memcpy'
     __underlying_##op(p, q, __fortify_size);   \
     ^~~~~~~~~~~~~
   include/linux/fortify-string.h:707:26: note: in expansion of macro '__fortify_memcpy_chk'
    #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,   \
                             ^~~~~~~~~~~~~~~~~~~~
   arch/arm/mm/ioremap.c:135:2: note: in expansion of macro 'memcpy'
     memcpy(pgd_offset(mm, start), pgd_offset_k(start),
     ^~~~~~


vim +/__builtin_memcpy +70 include/linux/fortify-string.h

78a498c3a227f2 Alexander Potapenko 2022-10-24  59  
78a498c3a227f2 Alexander Potapenko 2022-10-24  60  #if defined(__SANITIZE_MEMORY__)
78a498c3a227f2 Alexander Potapenko 2022-10-24  61  /*
78a498c3a227f2 Alexander Potapenko 2022-10-24  62   * For KMSAN builds all memcpy/memset/memmove calls should be replaced by the
78a498c3a227f2 Alexander Potapenko 2022-10-24  63   * corresponding __msan_XXX functions.
78a498c3a227f2 Alexander Potapenko 2022-10-24  64   */
78a498c3a227f2 Alexander Potapenko 2022-10-24  65  #include <linux/kmsan_string.h>
78a498c3a227f2 Alexander Potapenko 2022-10-24  66  #define __underlying_memcpy	__msan_memcpy
78a498c3a227f2 Alexander Potapenko 2022-10-24  67  #define __underlying_memmove	__msan_memmove
78a498c3a227f2 Alexander Potapenko 2022-10-24  68  #define __underlying_memset	__msan_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  69  #else
a28a6e860c6cf2 Francis Laniel      2021-02-25 @70  #define __underlying_memcpy	__builtin_memcpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  71  #define __underlying_memmove	__builtin_memmove
a28a6e860c6cf2 Francis Laniel      2021-02-25  72  #define __underlying_memset	__builtin_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  73  #endif
78a498c3a227f2 Alexander Potapenko 2022-10-24  74  

:::::: The code at line 70 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
