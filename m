Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9790C1448E3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 05:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740376240; cv=none; b=Q9ZEx1xMESzimsFta+3RI6H83QZbSZMkSBsPX+cJpoeu6HGIHSgpuhJnpktw8F2cLtnZDV5Uhhf3EibgvnR0txyxaywTG8O0sWZoKz7qSUhX04AFAmSEm7LWcKePwakRBhLeoebmsLoFUc+wzagAf48YV0F269op8vOtX9Idz78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740376240; c=relaxed/simple;
	bh=A7EfJBvUW3LMtXSdRfQ8ZkBEmA06TG+fgSOBhFsTc/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g0EiAZJW3674hF5ckdklRliyu5/Bthpgoj8/lz3yM+TsT7mwmY64sJlF5QihhJ4XCbr++BxnhO4XbDQo33OcXxfqmXkxX5mLtjF0KoL2kcdaN92DKtxbeNucW8Qbok5JPVu52VPdlJSjvY74dzRwRoD67Py9zr3aidGpJHk4JMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSg6peWa; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSg6peWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740376238; x=1771912238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A7EfJBvUW3LMtXSdRfQ8ZkBEmA06TG+fgSOBhFsTc/M=;
  b=ZSg6peWaz0l7BH8SCG8bq2XOBEgDozrfZNZ5cch7Nx048DIyWx4J8FiZ
   61saiwpae/fPR41cnWJF67gA4mCgE6QjtnKaZCceoxfgte2N4Jzn3HDcs
   H2LPsmLogDZFlOrEc+RfN+ad7vLm32tYldiBKPV+8e5qFXqhaX7GLiNJT
   9/SWzgXB3p+Y15cboB/fSmCWJ/HuYc4jymO08TRuM3tuI1krP4Q4L3hVo
   3Gus3MnODb3c9WeEuOH0Bx0/9mzS0Uf5YOyMS60ooP93wUjN/9atwO4a3
   pxJ8WyBaX2s1p8tgmCZ3lovhulVicYZsCwnatMVMw43rTJj73inNukxZB
   A==;
X-CSE-ConnectionGUID: P1S6LMRPTVKND0xvgP8eUg==
X-CSE-MsgGUID: 5yxZCw8vRq2NKqPHzJICSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="45026180"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="45026180"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 21:50:37 -0800
X-CSE-ConnectionGUID: qkxMj/lGRsaeR1WRLSHi2g==
X-CSE-MsgGUID: UTAcRZ0mT6exLj2mPFD9tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="120936522"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Feb 2025 21:50:35 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmRMO-0007uZ-32;
	Mon, 24 Feb 2025 05:50:32 +0000
Date: Mon, 24 Feb 2025 13:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuntao Liu <liuyuntao12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1966/1966] include/linux/fortify-string.h:57:33:
 warning: '__builtin_memcpy' reading between 65 and 536870912 bytes from a
 region of size 64
Message-ID: <202502241304.ilCBBhWc-lkp@intel.com>
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
head:   88b69da4524a4c574fa7642d89cb392506b4595e
commit: f04c0f3eb9b49427c273cd3e4d5a2ff895855b4b [1966/1966] make OPTIMIZE_INLINING config editable
config: arm64-randconfig-001-20250224 (https://download.01.org/0day-ci/archive/20250224/202502241304.ilCBBhWc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502241304.ilCBBhWc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502241304.ilCBBhWc-lkp@intel.com/

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
