Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAAD286881
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 09:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755164270; cv=none; b=jYltTHAxvS+FIvieKwJqwaf94lJpACc1AKpANQ/G5dZoPUAO2LtfCCe67cNDb/ZvtYJoQ/p0IlG9cjatyKmSI2exLFZ6E33LBe9YNqqz4LPWCEPbKsTEUtIx4qMRq/GVy/wtQTZwRal++cJrMvvjGe+tBmpj43NXGFCPrr3E3a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755164270; c=relaxed/simple;
	bh=t7IQUP4ZiipKfHSPC1wlKZWKpfwiSw94izwc7MSbdgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JPP++NnQLEsEC5A009Th1eQgeQlGTT3/CO7qDWHQd755kRy19VYZTjpKDgxhfnl9HsTb7irkOmlQlNYzp9fMQ0d/bKvxW/O63ej1DL0z8o2M6kSg74A3whfwySLK7zIdRwchAS+bMyaz9OYyyo+qwd6Oe+5WQIKsC1wzU6o8X08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZkuB+7+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZkuB+7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755164269; x=1786700269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t7IQUP4ZiipKfHSPC1wlKZWKpfwiSw94izwc7MSbdgM=;
  b=KZkuB+7+xEAw4zqi9V6BTtKDlr44bPzsPg8A0d1XrtBoNY04UiZB8LlN
   C5caCZZjXeN1XGmPOnZF0qo0X8kIUdBekY4IRXRZaxt66NQnuY71A1tsX
   RvSp8VHVeRpcqSDW+jlfjsNQp220ZbyDziRAHyoeAap2aeEoEJJcXIpJt
   UmhbJ1O9GUNJB6v6lGh7snpF0JQZbnkjrShKK2SVTawyMhpabaBj/E2YR
   EobwcIJvuh9seioZm7R91KMiWH3AL/9i6dU7TgPL4XnTAdR6ZvU8424UL
   5NsatNz0MN4Sz3ZfCMGeY+MixkdULbHNekfJBdo5yTwqGqB+r2SmaoGbO
   Q==;
X-CSE-ConnectionGUID: iuoS2/rXTzC27Cjk5Mx7Og==
X-CSE-MsgGUID: BwP44XmuSm2/agBZUDBwYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56684026"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="56684026"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 02:37:48 -0700
X-CSE-ConnectionGUID: RO6fpDvrSxWMWrRznSjPlw==
X-CSE-MsgGUID: c7DIUuJCS8WNijd8ihKMdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="170950603"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 14 Aug 2025 02:37:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umUP2-000Aoi-2H;
	Thu, 14 Aug 2025 09:37:44 +0000
Date: Thu, 14 Aug 2025 17:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuntao Liu <liuyuntao12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2678/2678] include/linux/fortify-string.h:57:33:
 warning: '__builtin_memcpy' reading between 65 and 536870912 bytes from a
 region of size 64
Message-ID: <202508141753.fScbJysb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   43d8c124ec4624389b14d42595e5f0195e3e5a1d
commit: f04c0f3eb9b49427c273cd3e4d5a2ff895855b4b [2678/2678] make OPTIMIZE_INLINING config editable
config: arm64-randconfig-004-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141753.fScbJysb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141753.fScbJysb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508141753.fScbJysb-lkp@intel.com/

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
