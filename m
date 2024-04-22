Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C64714A0A3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 12:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713789764; cv=none; b=u11+6HgrRKgFjiB0KklVKnK/ihUGbGAZ1HXeqj6lDyHrqG6yLq84oFIw1wsbIKypAEgekOo7j5MnMhkuCFvXosN8n0P2YoaJhU5YsDY6gTsrZ0ymDObuHY3cAVGGhfiJtUPqejGBFzw3C0Oyk9UZ04sTlSZG0JZslk7Ajsq6SrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713789764; c=relaxed/simple;
	bh=2QZ3LiUjeBRpsq+FhwhD4sEi9wxFIb750QFnRAF7WZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sO7eDUZaO1os4QqDdZ1JkWhs2/4Z5iMiUIAZ3SaOLkm05uC95Ww2sk5NDUFb3p4N2/sJEPgQ3frKg2ISYK+BZY6uW79UbwQiaGWzYAM23MOnNWKoRgP0EJATudQC6DJTKMCS/hkxVJMTanAXRjuBEmAL40BaMYE1bR2H2NX4mEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXORh+5T; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXORh+5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713789762; x=1745325762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2QZ3LiUjeBRpsq+FhwhD4sEi9wxFIb750QFnRAF7WZI=;
  b=HXORh+5To8k2jBDSUmrVAUXJOOhUsYV2ZOYIUv0XousBDnXcHZYcLQ8c
   f2J5E+tcJNigIkL/EFFfMWY66k6simKQIt/khxnxQvi6WI31x2//ADoFV
   ZLg67aJRAMNewXE9u8NWKNBxjeUBHttDXfWtTZFXiaSmVKtjxhnszvEZD
   6X3RT1UNy+3L/fgvxJVeFRh1wMoWfKIH4j672eFvbvTtEMQCed8s0Sc98
   XvFWcycn94GsI+fa9MPhB3wjKSm9NJZqXDVHW3T9q8Y6kJAJuGwWLa/m8
   CmPO1VyBAhNBEgVxjwZ/W89Y85QhObMAM0OlnUgkyCZrAuhZ6k8vGwkgH
   w==;
X-CSE-ConnectionGUID: RqN6AsdYSA2oBBiGK+pxFg==
X-CSE-MsgGUID: KpSfiMsNTSeOrNCetWfYpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13111624"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="13111624"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 05:42:41 -0700
X-CSE-ConnectionGUID: KfdPw/IjSVCsONCyk0werg==
X-CSE-MsgGUID: AQ71Iv/fRTyTZt8OGq2vqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="23979522"
Received: from lkp-server01.sh.intel.com (HELO 69a5ba6c3aa8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Apr 2024 05:42:39 -0700
Received: from kbuild by 69a5ba6c3aa8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryt0G-00002y-1X;
	Mon, 22 Apr 2024 12:42:36 +0000
Date: Mon, 22 Apr 2024 20:42:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuntao Liu <liuyuntao12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2431/7479] include/linux/fortify-string.h:57:33:
 warning: '__builtin_memcpy' reading between 65 and 536870912 bytes from a
 region of size 64
Message-ID: <202404222001.4hDpVvmd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e95a0071898084171841e9f3695a02fc5f58fd0f
commit: f04c0f3eb9b49427c273cd3e4d5a2ff895855b4b [2431/7479] make OPTIMIZE_INLINING config editable
config: arm64-randconfig-003-20240422 (https://download.01.org/0day-ci/archive/20240422/202404222001.4hDpVvmd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240422/202404222001.4hDpVvmd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404222001.4hDpVvmd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:294,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from kernel/padata.c:14:
   In function 'bitmap_copy',
       inlined from 'cpumask_copy' at include/linux/cpumask.h:740:2,
       inlined from '__padata_set_cpumasks' at kernel/padata.c:709:2:
>> include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' reading between 65 and 536870912 bytes from a region of size 64 [-Wstringop-overread]
      57 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:648:9: note: in expansion of macro '__underlying_memcpy'
     648 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:693:26: note: in expansion of macro '__fortify_memcpy_chk'
     693 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:268:17: note: in expansion of macro 'memcpy'
     268 |                 memcpy(dst, src, len);
         |                 ^~~~~~
   kernel/padata.c: In function '__padata_set_cpumasks':
   kernel/padata.c:692:48: note: source object 'pcpumask' of size [0, 64]
     692 |                                  cpumask_var_t pcpumask,
         |                                  ~~~~~~~~~~~~~~^~~~~~~~


vim +/__builtin_memcpy +57 include/linux/fortify-string.h

78a498c3a227f2 Alexander Potapenko 2022-10-24  46  
78a498c3a227f2 Alexander Potapenko 2022-10-24  47  #if defined(__SANITIZE_MEMORY__)
78a498c3a227f2 Alexander Potapenko 2022-10-24  48  /*
78a498c3a227f2 Alexander Potapenko 2022-10-24  49   * For KMSAN builds all memcpy/memset/memmove calls should be replaced by the
78a498c3a227f2 Alexander Potapenko 2022-10-24  50   * corresponding __msan_XXX functions.
78a498c3a227f2 Alexander Potapenko 2022-10-24  51   */
78a498c3a227f2 Alexander Potapenko 2022-10-24  52  #include <linux/kmsan_string.h>
78a498c3a227f2 Alexander Potapenko 2022-10-24  53  #define __underlying_memcpy	__msan_memcpy
78a498c3a227f2 Alexander Potapenko 2022-10-24  54  #define __underlying_memmove	__msan_memmove
78a498c3a227f2 Alexander Potapenko 2022-10-24  55  #define __underlying_memset	__msan_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  56  #else
a28a6e860c6cf2 Francis Laniel      2021-02-25 @57  #define __underlying_memcpy	__builtin_memcpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  58  #define __underlying_memmove	__builtin_memmove
a28a6e860c6cf2 Francis Laniel      2021-02-25  59  #define __underlying_memset	__builtin_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  60  #endif
78a498c3a227f2 Alexander Potapenko 2022-10-24  61  

:::::: The code at line 57 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
