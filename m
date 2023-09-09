Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199FD10E1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 08:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694248742; x=1725784742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uyv7ANeY+GzsAVFcfdsKuHWPF5kIzFCSy3PE0Zr62Mk=;
  b=J8w+duHPjdBgxXeFL6UAwIqtweGhXvuYKhzAAjYpezIpQT9q/kio0APK
   HRXfNRWlB++pAsIx1hQRd6U4NR0/9MUEAUjDjoxtHLtORfsK3PP6mjUCv
   pUl29sClVMV8EVvPV86kUaNmGn30D0uciuSCYBCiAM25SECkM0Dae0btR
   QfRLLHPLZyHp6faLi6eE5SU1BIkXyd1qljdm2t5AbsDsbefjhgluyRx0k
   GPAgW2s6NVLEzimdIbji6alSb62nw+6Uu4WgPAyoWAtDRQAYs6xZ3Nzlt
   msffSuh9V7RSh6iUBZg0qTGa3rzSgnouzrG5f/He5isaGR/ODC+BBENI/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="380532445"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="380532445"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 01:39:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="742770863"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="742770863"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Sep 2023 01:38:59 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qetUX-0003AQ-2Q;
	Sat, 09 Sep 2023 08:38:57 +0000
Date: Sat, 9 Sep 2023 16:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: Qing Zhang <zhangqing@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: include/linux/fortify-string.h:68:33: warning: '__builtin_strncpy'
 output truncated copying between 0 and 32 bytes from a string of length 32
Message-ID: <202309091623.TKRBj5X7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qing,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6099776f9f268e61fe5ecd721f994a8cfce5306f
commit: d4c937c2a57bbba24790be6fe7a791456f5fbb60 LoongArch: Add ARCH_HAS_FORTIFY_SOURCE selection
date:   4 months ago
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230909/202309091623.TKRBj5X7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091623.TKRBj5X7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091623.TKRBj5X7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from lib/test_hexdump.c:8:
   In function 'strncpy',
       inlined from 'test_hexdump_prepare_test.constprop' at lib/test_hexdump.c:116:3:
>> include/linux/fortify-string.h:68:33: warning: '__builtin_strncpy' output truncated copying between 0 and 32 bytes from a string of length 32 [-Wstringop-truncation]
      68 | #define __underlying_strncpy    __builtin_strncpy
         |                                 ^
   include/linux/fortify-string.h:151:16: note: in expansion of macro '__underlying_strncpy'
     151 |         return __underlying_strncpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/nvme/target/core.c:7:
   In function 'strncpy',
       inlined from '__assign_req_name' at drivers/nvme/target/trace.h:56:2:
>> include/linux/fortify-string.h:68:33: warning: '__builtin_strncpy' specified bound depends on the length of the source argument [-Wstringop-truncation]
      68 | #define __underlying_strncpy    __builtin_strncpy
         |                                 ^
   include/linux/fortify-string.h:151:16: note: in expansion of macro '__underlying_strncpy'
     151 |         return __underlying_strncpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~~
   In function '__fortify_strlen',
       inlined from '__assign_req_name' at drivers/nvme/target/trace.h:57:3:
   include/linux/fortify-string.h:66:33: note: length computed here
      66 | #define __underlying_strlen     __builtin_strlen
         |                                 ^
   include/linux/fortify-string.h:241:24: note: in expansion of macro '__underlying_strlen'
     241 |                 return __underlying_strlen(p);
         |                        ^~~~~~~~~~~~~~~~~~~
   In function 'fortify_memcpy_chk',
       inlined from 'perf_trace_nvmet_req_init' at drivers/nvme/target/./trace.h:61:1:
   include/linux/fortify-string.h:529:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     529 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'fortify_memcpy_chk',
       inlined from 'trace_event_raw_event_nvmet_req_init' at drivers/nvme/target/./trace.h:61:1:
   include/linux/fortify-string.h:529:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     529 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__builtin_strncpy +68 include/linux/fortify-string.h

78a498c3a227f2 Alexander Potapenko 2022-10-24  61  
78a498c3a227f2 Alexander Potapenko 2022-10-24  62  #define __underlying_memchr	__builtin_memchr
78a498c3a227f2 Alexander Potapenko 2022-10-24  63  #define __underlying_memcmp	__builtin_memcmp
a28a6e860c6cf2 Francis Laniel      2021-02-25  64  #define __underlying_strcat	__builtin_strcat
a28a6e860c6cf2 Francis Laniel      2021-02-25  65  #define __underlying_strcpy	__builtin_strcpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  66  #define __underlying_strlen	__builtin_strlen
a28a6e860c6cf2 Francis Laniel      2021-02-25  67  #define __underlying_strncat	__builtin_strncat
a28a6e860c6cf2 Francis Laniel      2021-02-25 @68  #define __underlying_strncpy	__builtin_strncpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  69  #endif
a28a6e860c6cf2 Francis Laniel      2021-02-25  70  

:::::: The code at line 68 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
