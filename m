Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E1E7F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 03:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692674871; x=1724210871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tvoGXSwlxA5H3T1Bq4tQ36YLY+vOqHObKl/pTl9i+00=;
  b=ZIf1dP8YV9I48nWEUan/kBm1yNd2RnLBFGpXUaT3/yadxAqxjZD72DCl
   ZNc3pLEiKei2c8YxQ/8/YqvW+By4zUkoWshDcmILxJj8tGCQiAGzgY7qh
   rp5CUZw/9xu8cYO4HqasNdeJzq/jdpOUy17e/zPXlUnwRLUeWBIVhGkUL
   lMWaW6sKHk4ENrtfhK44UuXcdo3zIu5OrmfI9T0YCaEqhSlxLmiFt3Au2
   L/DBoZLoDmHi+mbDpDaISVj89pyC4pedKAm3tS/LUtgxKKe+MbWpXUf/I
   h9NliKUyhALLIfUgLbjQyTOl4PUzxJFCTXyQmx8gTsPqIk/6M4AsVwreP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354094849"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="354094849"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 20:27:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="879772395"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2023 20:27:54 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYI3A-0001IZ-2k;
	Tue, 22 Aug 2023 03:27:34 +0000
Date: Tue, 22 Aug 2023 11:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:aass 20/27] include/linux/bitops.h:52:11: warning: 'bmap' is
 used uninitialized
Message-ID: <202308221115.Q64YWlZI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux aass
head:   96956014f80d8f6ce35aca12f34ae5fea88899ea
commit: fb60d78147eb02e558595ebbdca02695ffa8fab8 [20/27] perf_test
config: powerpc-randconfig-r024-20230821 (https://download.01.org/0day-ci/archive/20230822/202308221115.Q64YWlZI-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221115.Q64YWlZI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221115.Q64YWlZI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:8,
                    from lib/test_bitmap.c:8:
   include/linux/bitops.h: In function 'test_weight':
>> include/linux/bitops.h:52:11: warning: 'bmap' is used uninitialized [-Wuninitialized]
      52 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |           ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/powerpc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from include/linux/build_bug.h:5,
                    from include/linux/bits.h:21,
                    from include/linux/bitops.h:6:
   lib/test_bitmap.c:366:24: note: 'bmap' declared here
     366 |         DECLARE_BITMAP(bmap, 1024);
         |                        ^~~~
   include/linux/types.h:11:23: note: in definition of macro 'DECLARE_BITMAP'
      11 |         unsigned long name[BITS_TO_LONGS(bits)]
         |                       ^~~~


vim +/bmap +52 include/linux/bitops.h

0e862838f29014 Alexander Lobakin 2022-06-24  35  
b03fc1173c0c2b Alexander Lobakin 2022-06-24  36  /*
b03fc1173c0c2b Alexander Lobakin 2022-06-24  37   * Many architecture-specific non-atomic bitops contain inline asm code and due
b03fc1173c0c2b Alexander Lobakin 2022-06-24  38   * to that the compiler can't optimize them to compile-time expressions or
b03fc1173c0c2b Alexander Lobakin 2022-06-24  39   * constants. In contrary, generic_*() helpers are defined in pure C and
b03fc1173c0c2b Alexander Lobakin 2022-06-24  40   * compilers optimize them just well.
b03fc1173c0c2b Alexander Lobakin 2022-06-24  41   * Therefore, to make `unsigned long foo = 0; __set_bit(BAR, &foo)` effectively
b03fc1173c0c2b Alexander Lobakin 2022-06-24  42   * equal to `unsigned long foo = BIT(BAR)`, pick the generic C alternative when
b03fc1173c0c2b Alexander Lobakin 2022-06-24  43   * the arguments can be resolved at compile time. That expression itself is a
b03fc1173c0c2b Alexander Lobakin 2022-06-24  44   * constant and doesn't bring any functional changes to the rest of cases.
b03fc1173c0c2b Alexander Lobakin 2022-06-24  45   * The casts to `uintptr_t` are needed to mitigate `-Waddress` warnings when
b03fc1173c0c2b Alexander Lobakin 2022-06-24  46   * passing a bitmap from .bss or .data (-> `!!addr` is always true).
b03fc1173c0c2b Alexander Lobakin 2022-06-24  47   */
e69eb9c460f128 Alexander Lobakin 2022-06-24  48  #define bitop(op, nr, addr)						\
b03fc1173c0c2b Alexander Lobakin 2022-06-24  49  	((__builtin_constant_p(nr) &&					\
b03fc1173c0c2b Alexander Lobakin 2022-06-24  50  	  __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) &&	\
b03fc1173c0c2b Alexander Lobakin 2022-06-24  51  	  (uintptr_t)(addr) != (uintptr_t)NULL &&			\
b03fc1173c0c2b Alexander Lobakin 2022-06-24 @52  	  __builtin_constant_p(*(const unsigned long *)(addr))) ?	\
b03fc1173c0c2b Alexander Lobakin 2022-06-24  53  	 const##op(nr, addr) : op(nr, addr))
e69eb9c460f128 Alexander Lobakin 2022-06-24  54  

:::::: The code at line 52 was first introduced by commit
:::::: b03fc1173c0c2bb8fad61902a862985cecdc4b1b bitops: let optimize out non-atomic bitops on compile-time constants

:::::: TO: Alexander Lobakin <alexandr.lobakin@intel.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
