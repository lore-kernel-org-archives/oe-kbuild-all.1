Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14801864A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 18:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695149407; x=1726685407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nVyp6Nb+VLdsVvkauXq4QO8ZgKXw8kxiV1knt3MeOp8=;
  b=E2yXnV47NdW1u7jcWwAGt8Rlzf6iUPlpwt1SwHF78OsSPOgoQ5bWtwsa
   0VCj0QufDnEkqFRhY647Air2c6vjfFMPjo8Jup++KNxyTnnLMsqs7ZsXF
   xGW+znkld2+kbD4h4ZH3FHS5fJgnEu25hYnh+jKv+V1f3brHs7x36DMAu
   GkMLlrxDG1ZdVyFKRTQKK0rrgDOqpwcjxszf7YEwUkIFxiZDkOfFUKBCK
   NXrqQADJuxuQMQz48eq6nkVngV3vbMirutyQtXWaJ/t2Rh7F1zKLE68KT
   JfRFqkiMPUtSyIHVpL0w6BfjqJJhjCMcuSn1UHDHJgdQGQnnq+4/5fO0y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="377333498"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="377333498"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 11:50:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="749597776"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="749597776"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 19 Sep 2023 11:50:04 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qifnO-0007oO-25;
	Tue, 19 Sep 2023 18:50:02 +0000
Date: Wed, 20 Sep 2023 02:49:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy'
 offset -32 is out of the bounds of object 'boot_command_line' with type
 'char[]'
Message-ID: <202309200205.bFzhzjRt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cf0f715623872823a72e451243bbf555d10d032
commit: 55c84a5cf2c72a821719823ef2ebef01b119025b fortify: strcat: Move definition to use fortified strlcat()
date:   4 months ago
config: s390-randconfig-r016-20211009 (https://download.01.org/0day-ci/archive/20230920/202309200205.bFzhzjRt-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200205.bFzhzjRt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200205.bFzhzjRt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/s390/kernel/setup.c:21:
   In function 'strlcat',
       inlined from 'strcat' at include/linux/fortify-string.h:432:6,
       inlined from 'setup_zfcpdump' at arch/s390/kernel/setup.c:308:2,
       inlined from 'setup_arch' at arch/s390/kernel/setup.c:1008:2:
   include/linux/fortify-string.h:406:19: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
     406 |         p[actual] = '\0';
         |         ~~~~~~~~~~^~~~~~
   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/s390/include/asm/bug.h:69,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from arch/s390/include/asm/cmpxchg.h:11,
                    from arch/s390/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/s390/kernel/setup.c:21:
   arch/s390/kernel/setup.c: In function 'setup_arch':
   include/linux/init.h:146:24: note: at offset -2 into destination object 'boot_command_line' of size [0, 9223372036854775807]
     146 | extern char __initdata boot_command_line[];
         |                        ^~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/s390/kernel/setup.c:21:
   In function 'strlcat',
       inlined from 'strcat' at include/linux/fortify-string.h:432:6,
       inlined from 'setup_zfcpdump' at arch/s390/kernel/setup.c:308:2,
       inlined from 'setup_arch' at arch/s390/kernel/setup.c:1008:2:
>> include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' offset -32 is out of the bounds of object 'boot_command_line' with type 'char[]' [-Warray-bounds]
      57 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:405:9: note: in expansion of macro '__underlying_memcpy'
     405 |         __underlying_memcpy(p + p_len, q, copy_len);
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/s390/include/asm/bug.h:69,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from arch/s390/include/asm/cmpxchg.h:11,
                    from arch/s390/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/s390/kernel/setup.c:21:
   arch/s390/kernel/setup.c: In function 'setup_arch':
   include/linux/init.h:146:24: note: 'boot_command_line' declared here
     146 | extern char __initdata boot_command_line[];
         |                        ^~~~~~~~~~~~~~~~~


vim +57 include/linux/fortify-string.h

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
