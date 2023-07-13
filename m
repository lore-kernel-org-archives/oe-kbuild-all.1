Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1A11F163
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 15:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689263403; x=1720799403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rvi8NMskqUjxlAWpTD3I2vvAY28bQkgYyLzwxqgv2hM=;
  b=CGlEx/9H7XmGLZC+rRP+j4gCtdiZB9/LPXMaNt1+HQ/7+7NE4tJLumAy
   zMFCbAfWxKVrXTIeOjhGJZujvqaiauufTks9E4N1uEioFs2DNniqb75HO
   Y1V7XqpGZxIIoL2ALXw09hYuJ3xG40FUxXwxp85PpoFBIfLYms5QvXMDV
   Etou0nHA/LmZxZc8kGsXzfPN1CkhbJuVPxF8IloTN+PrhoYCdXrZOaE/6
   55+LHXGgElIv8PtCS+ocwu9wHeYZE65klbS1UMoAxvdAMz71XERBpBXQU
   H2QXKa9gEp5yEtfUrzARLyvSPInGJJwvMO7uWXQzZWFC8ZtNRdYh45HGv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="367871456"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="367871456"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 08:50:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="722040411"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="722040411"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Jul 2023 08:50:00 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJyZr-0006iv-1q;
	Thu, 13 Jul 2023 15:49:59 +0000
Date: Thu, 13 Jul 2023 23:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:ktext-current 1/19] include/linux/minmax.h:30:50: error:
 braced-group within expression allowed only inside a function
Message-ID: <202307132330.IUoEgOym-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm ktext-current
head:   1085162f4939fd1d436ba6ec27b54c707a2a7c47
commit: b392b426ad1dad14b1f13a984fef3f8e082b58e6 [1/19] arm64: place kernel in its own L0 page table entry
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230713/202307132330.IUoEgOym-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307132330.IUoEgOym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307132330.IUoEgOym-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:27,
                    from arch/arm64/include/asm/cpufeature.h:25,
                    from arch/arm64/include/asm/ptrace.h:11,
                    from arch/arm64/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:17,
                    from include/linux/spinlock.h:59,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/debugfs.h:15,
                    from arch/arm64/mm/ptdump.c:12:
   include/linux/minmax.h:20:35: warning: comparison of distinct pointer types lacks a cast
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                   ^~
   include/linux/minmax.h:26:18: note: in expansion of macro '__typecheck'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~
   include/linux/minmax.h:36:31: note: in expansion of macro '__safe_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:34: note: in expansion of macro 'max'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~
   arch/arm64/include/asm/memory.h:48:34: note: in expansion of macro 'KIMAGE_VADDR'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:49:34: note: in expansion of macro 'MODULES_END'
      49 | #define MODULES_VADDR           (MODULES_END - MODULES_VSIZE)
         |                                  ^~~~~~~~~~~
   arch/arm64/mm/ptdump.c:44:11: note: in expansion of macro 'MODULES_VADDR'
      44 |         { MODULES_VADDR,                "Modules start" },
         |           ^~~~~~~~~~~~~
>> include/linux/minmax.h:30:50: error: braced-group within expression allowed only inside a function
      30 | #define __cmp_once(x, y, unique_x, unique_y, op) ({     \
         |                                                  ^
   include/linux/minmax.h:38:17: note: in expansion of macro '__cmp_once'
      38 |                 __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:34: note: in expansion of macro 'max'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~
   arch/arm64/include/asm/memory.h:48:34: note: in expansion of macro 'KIMAGE_VADDR'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:49:34: note: in expansion of macro 'MODULES_END'
      49 | #define MODULES_VADDR           (MODULES_END - MODULES_VSIZE)
         |                                  ^~~~~~~~~~~
   arch/arm64/mm/ptdump.c:44:11: note: in expansion of macro 'MODULES_VADDR'
      44 |         { MODULES_VADDR,                "Modules start" },
         |           ^~~~~~~~~~~~~
   include/linux/minmax.h:20:35: warning: comparison of distinct pointer types lacks a cast
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                   ^~
   include/linux/minmax.h:26:18: note: in expansion of macro '__typecheck'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~
   include/linux/minmax.h:36:31: note: in expansion of macro '__safe_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:34: note: in expansion of macro 'max'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~
   arch/arm64/include/asm/memory.h:48:34: note: in expansion of macro 'KIMAGE_VADDR'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^~~~~~~~~~~~
   arch/arm64/mm/ptdump.c:45:11: note: in expansion of macro 'MODULES_END'
      45 |         { MODULES_END,                  "Modules end" },
         |           ^~~~~~~~~~~
>> include/linux/minmax.h:30:50: error: braced-group within expression allowed only inside a function
      30 | #define __cmp_once(x, y, unique_x, unique_y, op) ({     \
         |                                                  ^
   include/linux/minmax.h:38:17: note: in expansion of macro '__cmp_once'
      38 |                 __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:34: note: in expansion of macro 'max'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~
   arch/arm64/include/asm/memory.h:48:34: note: in expansion of macro 'KIMAGE_VADDR'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^~~~~~~~~~~~
   arch/arm64/mm/ptdump.c:45:11: note: in expansion of macro 'MODULES_END'
      45 |         { MODULES_END,                  "Modules end" },
         |           ^~~~~~~~~~~
   include/linux/minmax.h:20:35: warning: comparison of distinct pointer types lacks a cast
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                   ^~
   include/linux/minmax.h:26:18: note: in expansion of macro '__typecheck'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~
   include/linux/minmax.h:36:31: note: in expansion of macro '__safe_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:34: note: in expansion of macro 'max'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~
   arch/arm64/include/asm/memory.h:48:34: note: in expansion of macro 'KIMAGE_VADDR'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:24:34: note: in expansion of macro 'MODULES_END'
      24 | #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
         |                                  ^~~~~~~~~~~
   arch/arm64/mm/ptdump.c:46:11: note: in expansion of macro 'VMALLOC_START'
      46 |         { VMALLOC_START,                "vmalloc() area" },
         |           ^~~~~~~~~~~~~
>> include/linux/minmax.h:30:50: error: braced-group within expression allowed only inside a function
      30 | #define __cmp_once(x, y, unique_x, unique_y, op) ({     \
         |                                                  ^
   include/linux/minmax.h:38:17: note: in expansion of macro '__cmp_once'
      38 |                 __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:34: note: in expansion of macro 'max'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~
   arch/arm64/include/asm/memory.h:48:34: note: in expansion of macro 'KIMAGE_VADDR'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:24:34: note: in expansion of macro 'MODULES_END'
      24 | #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
         |                                  ^~~~~~~~~~~
   arch/arm64/mm/ptdump.c:46:11: note: in expansion of macro 'VMALLOC_START'
      46 |         { VMALLOC_START,                "vmalloc() area" },
         |           ^~~~~~~~~~~~~


vim +30 include/linux/minmax.h

b296a6d53339a7 Andy Shevchenko 2020-10-15  29  
b296a6d53339a7 Andy Shevchenko 2020-10-15 @30  #define __cmp_once(x, y, unique_x, unique_y, op) ({	\
b296a6d53339a7 Andy Shevchenko 2020-10-15  31  		typeof(x) unique_x = (x);		\
b296a6d53339a7 Andy Shevchenko 2020-10-15  32  		typeof(y) unique_y = (y);		\
b296a6d53339a7 Andy Shevchenko 2020-10-15  33  		__cmp(unique_x, unique_y, op); })
b296a6d53339a7 Andy Shevchenko 2020-10-15  34  

:::::: The code at line 30 was first introduced by commit
:::::: b296a6d53339a79082c1d2c1761e948e8b3def69 kernel.h: split out min()/max() et al. helpers

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
