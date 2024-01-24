Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC0E2572
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jan 2024 01:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706058887; cv=none; b=SasEetxkpVzLoKX2//6z2nHt81wZ0g8sZL/xsyhdTpaFWt6m5/K03Ee//vJ8hmlDomXX3JiMcXPrexHlnK1dvIc3CrtuQ1niwqPlzjy72JGvdGtrlL1e9cej8s+6gqQx2OFI7qVEMDX3WGpjg2Nd+crQ/qtTrC4gqdgDgdp/ILs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706058887; c=relaxed/simple;
	bh=+CJTFx6kywtXJ9NwOr2CfHUlA0kjDctUMjGaJXROIZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mv8u1Ka9OYUve6UC/0coqfZA2Kk6eqNaXcgd6UlMQVpdlrCIlMlqY6NBaMifLtlf03KI6C1D0qhiZ2WJl3QBZaKw+XyJgpGchCLG2gVMSgzqKaSbSjBnt4EshElrFn8Ywonew/gSq/AlZdNUrBPRckcZG12No9PXRkfiJ3fUH88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qtqh4Vxz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qtqh4Vxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706058886; x=1737594886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+CJTFx6kywtXJ9NwOr2CfHUlA0kjDctUMjGaJXROIZg=;
  b=Qtqh4VxzPdvbmT3G8cOBOGZqJPHEhw+70pbyReq4bPtAKdTHMVbspNGn
   odkj5p2nXzc8PteQHjfsHfAREhkH1r7tZWGl+BCK+TKmBBz9KEU3MSD6G
   xrtbx6XLAjnX1LWDBLyO8msLLpJRIsBczlToOmzNFb77wcWTFuHrvBCDL
   Wr2+WuL/AsP1Ydk8JYq20zXF9FuwYa4bii5LAYuvEw9OODIzaVoLXOeTc
   VIDD0joUd5OvJsp0yCKIFrXrRSjYpCes0thJ8Xdi/c48DOMy7QrcJ6LT6
   vwjiqBwLGKIWfkKRDY7naHNMwDpgee5oYDGtK7NVQklMZbRnfGdVe/xqj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8819956"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8819956"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 17:14:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909500368"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="909500368"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Jan 2024 17:14:43 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSRqi-0007lt-2a;
	Wed, 24 Jan 2024 01:14:40 +0000
Date: Wed, 24 Jan 2024 09:14:03 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:kasan/dev 3/4] include/linux/fortify-string.h:57:29:
 warning: '__builtin_memcpy': specified size 4294967295 exceeds maximum
 object size 2147483647
Message-ID: <202401240922.6dqCAZtl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git kasan/dev
head:   22932cc8492a23ace6b45731717767b3cad35a2b
commit: 2467f2e4963fe6816b3549ffd5da27e749108b21 [3/4] stackdepot: use variable size records for non-evictable entries
config: i386-randconfig-012-20240124 (https://download.01.org/0day-ci/archive/20240124/202401240922.6dqCAZtl-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401240922.6dqCAZtl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401240922.6dqCAZtl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:295:0,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/debugfs.h:15,
                    from lib/stackdepot.c:17:
   In function 'depot_alloc_stack',
       inlined from 'stack_depot_save_flags' at lib/stackdepot.c:691:24:
>> include/linux/fortify-string.h:57:29: warning: '__builtin_memcpy': specified size 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overflow=]
    #define __underlying_memcpy __builtin_memcpy
                                ^
   include/linux/fortify-string.h:644:2: note: in expansion of macro '__underlying_memcpy'
     __underlying_##op(p, q, __fortify_size);   \
     ^~~~~~~~~~~~~
   include/linux/fortify-string.h:689:26: note: in expansion of macro '__fortify_memcpy_chk'
    #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,   \
                             ^~~~~~~~~~~~~~~~~~~~
   lib/stackdepot.c:465:2: note: in expansion of macro 'memcpy'
     memcpy(stack->entries, entries, flex_array_size(stack, entries, nr_entries));
     ^~~~~~


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
