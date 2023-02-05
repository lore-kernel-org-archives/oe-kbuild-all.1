Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDC915B4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 00:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675557005; x=1707093005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ogz9Tbwr8bDROAXeOWVcSA0NVPYabAvQ7kH9tNxWj8U=;
  b=CbXKgDRu6QEa/1/t/qS8wotr3kbgVO1bbc60iH5db/hjrlNd3N+EmNp2
   Z116mKxsHP4/VYZENpzIKLsSzRkhPQLUpo5pgdupvGxNoC6iws9+K9eeo
   ks8y1ROd6I5EbrcTn/nygTlW3sskeeGK+22ePofgsB1fJIhn3p1qA7j1f
   mivB7nQtMEbaLJT+7dykGgOkf2CqJ+SAZkxI+tBUHNYnIY0SYVr9Tx07B
   FaIKPpZ7o/PzQyIp7HUob2IA2NvfXSRvicAdosodopPfpgqIi2q9wGCa5
   1o3sMa7TiqAqvRA0U4krfZZhfe0PbdIUg2Pd/y0RygOZPJfJ9wgYTaZ7u
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="309341880"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="309341880"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 16:30:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="659486809"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="659486809"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Feb 2023 16:30:02 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOSuv-0001bU-0Q;
	Sun, 05 Feb 2023 00:30:01 +0000
Date: Sun, 5 Feb 2023 08:29:01 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: mm/low-mem-notify.c:53:6: warning: no previous prototype for
 function 'low_mem_notify'
Message-ID: <202302050856.mFpS92nt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 585b704d6b9decff53ce46e97eaa1f71a15e388c CHROMIUM: mm: move low memory code
date:   2 years, 2 months ago
config: s390-randconfig-r012-20230205 (https://download.01.org/0day-ci/archive/20230205/202302050856.mFpS92nt-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=585b704d6b9decff53ce46e97eaa1f71a15e388c
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 585b704d6b9decff53ce46e97eaa1f71a15e388c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_swab32'
           (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
                     ^
   In file included from mm/low-mem-notify.c:34:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:21:12: note: expanded from macro '___constant_swab32'
           (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
                     ^
   In file included from mm/low-mem-notify.c:34:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:22:12: note: expanded from macro '___constant_swab32'
           (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
                     ^
   In file included from mm/low-mem-notify.c:34:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
           __fswab32(x))
                     ^
   In file included from mm/low-mem-notify.c:34:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> mm/low-mem-notify.c:53:6: warning: no previous prototype for function 'low_mem_notify' [-Wmissing-prototypes]
   void low_mem_notify(void)
        ^
   mm/low-mem-notify.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void low_mem_notify(void)
   ^
   static 
>> mm/low-mem-notify.c:121:6: warning: no previous prototype for function 'low_mem_check' [-Wmissing-prototypes]
   bool low_mem_check(void)
        ^
   mm/low-mem-notify.c:121:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool low_mem_check(void)
   ^
   static 
   22 warnings generated.


vim +/low_mem_notify +53 mm/low-mem-notify.c

bca855d46bcc36 Luigi Semenzato 2014-04-03   52  
bca855d46bcc36 Luigi Semenzato 2014-04-03  @53  void low_mem_notify(void)
bca855d46bcc36 Luigi Semenzato 2014-04-03   54  {
bca855d46bcc36 Luigi Semenzato 2014-04-03   55  	atomic_set(&low_mem_state, true);
bca855d46bcc36 Luigi Semenzato 2014-04-03   56  	wake_up(&low_mem_wait);
bca855d46bcc36 Luigi Semenzato 2014-04-03   57  }
bca855d46bcc36 Luigi Semenzato 2014-04-03   58  
585b704d6b9dec Yu Zhao         2019-11-10   59  /*
585b704d6b9dec Yu Zhao         2019-11-10   60   * Compute available memory used by files that can be reclaimed quickly.
585b704d6b9dec Yu Zhao         2019-11-10   61   */
585b704d6b9dec Yu Zhao         2019-11-10   62  static unsigned long get_available_file_mem(void)
bca855d46bcc36 Luigi Semenzato 2014-04-03   63  {
585b704d6b9dec Yu Zhao         2019-11-10   64  	unsigned long file_mem =
585b704d6b9dec Yu Zhao         2019-11-10   65  			global_node_page_state(NR_ACTIVE_FILE) +
585b704d6b9dec Yu Zhao         2019-11-10   66  			global_node_page_state(NR_INACTIVE_FILE);
585b704d6b9dec Yu Zhao         2019-11-10   67  	unsigned long dirty_mem = global_node_page_state(NR_FILE_DIRTY);
585b704d6b9dec Yu Zhao         2019-11-10   68  	unsigned long min_file_mem = min_filelist_kbytes >> (PAGE_SHIFT - 10);
585b704d6b9dec Yu Zhao         2019-11-10   69  	unsigned long clean_file_mem = file_mem > dirty_mem ?
585b704d6b9dec Yu Zhao         2019-11-10   70  			file_mem - dirty_mem : 0;
585b704d6b9dec Yu Zhao         2019-11-10   71  	/* Conservatively estimate the amount of available_file_mem */
585b704d6b9dec Yu Zhao         2019-11-10   72  	unsigned long available_file_mem = clean_file_mem > min_file_mem ?
585b704d6b9dec Yu Zhao         2019-11-10   73  			clean_file_mem - min_file_mem : 0;
585b704d6b9dec Yu Zhao         2019-11-10   74  	return available_file_mem;
585b704d6b9dec Yu Zhao         2019-11-10   75  }
bca855d46bcc36 Luigi Semenzato 2014-04-03   76  
585b704d6b9dec Yu Zhao         2019-11-10   77  /*
585b704d6b9dec Yu Zhao         2019-11-10   78   * Available anonymous memory.
585b704d6b9dec Yu Zhao         2019-11-10   79   */
585b704d6b9dec Yu Zhao         2019-11-10   80  static unsigned long get_available_anon_mem(void)
585b704d6b9dec Yu Zhao         2019-11-10   81  {
585b704d6b9dec Yu Zhao         2019-11-10   82  	return global_node_page_state(NR_ACTIVE_ANON) +
585b704d6b9dec Yu Zhao         2019-11-10   83  		global_node_page_state(NR_INACTIVE_ANON);
bca855d46bcc36 Luigi Semenzato 2014-04-03   84  }
bca855d46bcc36 Luigi Semenzato 2014-04-03   85  
585b704d6b9dec Yu Zhao         2019-11-10   86  /*
585b704d6b9dec Yu Zhao         2019-11-10   87   * Compute "available" memory, that is either free memory or memory that can be
585b704d6b9dec Yu Zhao         2019-11-10   88   * reclaimed quickly, adjusted for the presence of swap.
585b704d6b9dec Yu Zhao         2019-11-10   89   */
585b704d6b9dec Yu Zhao         2019-11-10   90  static unsigned long get_available_mem_adj(void)
585b704d6b9dec Yu Zhao         2019-11-10   91  {
585b704d6b9dec Yu Zhao         2019-11-10   92  	/* free_mem is completely unallocated; clean file-backed memory
585b704d6b9dec Yu Zhao         2019-11-10   93  	 * (file_mem - dirty_mem) is easy to reclaim, except for the last
585b704d6b9dec Yu Zhao         2019-11-10   94  	 * min_filelist_kbytes. totalreserve_pages is the reserve of pages that
585b704d6b9dec Yu Zhao         2019-11-10   95  	 * are not available to user space.
585b704d6b9dec Yu Zhao         2019-11-10   96  	 */
585b704d6b9dec Yu Zhao         2019-11-10   97  	unsigned long raw_free_mem = global_zone_page_state(NR_FREE_PAGES);
585b704d6b9dec Yu Zhao         2019-11-10   98  	unsigned long free_mem = raw_free_mem > totalreserve_pages ?
585b704d6b9dec Yu Zhao         2019-11-10   99  			raw_free_mem - totalreserve_pages : 0;
585b704d6b9dec Yu Zhao         2019-11-10  100  	unsigned long available_mem = free_mem + get_available_file_mem();
585b704d6b9dec Yu Zhao         2019-11-10  101  	unsigned long swappable_pages = min_t(unsigned long,
585b704d6b9dec Yu Zhao         2019-11-10  102  			get_nr_swap_pages(), get_available_anon_mem());
585b704d6b9dec Yu Zhao         2019-11-10  103  	/*
585b704d6b9dec Yu Zhao         2019-11-10  104  	 * The contribution of swap is reduced by a factor of
585b704d6b9dec Yu Zhao         2019-11-10  105  	 * low_mem_ram_vs_swap_weight.
585b704d6b9dec Yu Zhao         2019-11-10  106  	 */
585b704d6b9dec Yu Zhao         2019-11-10  107  	return available_mem + swappable_pages / low_mem_ram_vs_swap_weight;
585b704d6b9dec Yu Zhao         2019-11-10  108  }
585b704d6b9dec Yu Zhao         2019-11-10  109  
585b704d6b9dec Yu Zhao         2019-11-10  110  #ifdef CONFIG_SYSFS
585b704d6b9dec Yu Zhao         2019-11-10  111  static void low_mem_threshold_notify(void);
585b704d6b9dec Yu Zhao         2019-11-10  112  #else
585b704d6b9dec Yu Zhao         2019-11-10  113  static void low_mem_threshold_notify(void)
585b704d6b9dec Yu Zhao         2019-11-10  114  {
585b704d6b9dec Yu Zhao         2019-11-10  115  }
585b704d6b9dec Yu Zhao         2019-11-10  116  #endif
585b704d6b9dec Yu Zhao         2019-11-10  117  
585b704d6b9dec Yu Zhao         2019-11-10  118  /*
585b704d6b9dec Yu Zhao         2019-11-10  119   * Returns TRUE if we are in a low memory state.
585b704d6b9dec Yu Zhao         2019-11-10  120   */
585b704d6b9dec Yu Zhao         2019-11-10 @121  bool low_mem_check(void)
585b704d6b9dec Yu Zhao         2019-11-10  122  {
585b704d6b9dec Yu Zhao         2019-11-10  123  	static bool was_low_mem;	/* = false, as per style guide */
585b704d6b9dec Yu Zhao         2019-11-10  124  	static atomic_t in_low_mem_check = ATOMIC_INIT(0);
585b704d6b9dec Yu Zhao         2019-11-10  125  	/* last observed threshold */
585b704d6b9dec Yu Zhao         2019-11-10  126  	static unsigned int low_mem_threshold_last = UINT_MAX;
585b704d6b9dec Yu Zhao         2019-11-10  127  	/* Limit logging low memory to once per second. */
585b704d6b9dec Yu Zhao         2019-11-10  128  	static DEFINE_RATELIMIT_STATE(low_mem_logging_ratelimit, 1 * HZ, 1);
585b704d6b9dec Yu Zhao         2019-11-10  129  
585b704d6b9dec Yu Zhao         2019-11-10  130  	/* We declare a low-memory condition when a combination of RAM and swap
585b704d6b9dec Yu Zhao         2019-11-10  131  	 * space is low.
585b704d6b9dec Yu Zhao         2019-11-10  132  	 */
585b704d6b9dec Yu Zhao         2019-11-10  133  	unsigned long available_mem = get_available_mem_adj();
585b704d6b9dec Yu Zhao         2019-11-10  134  	/*
585b704d6b9dec Yu Zhao         2019-11-10  135  	 * For backwards compatibility with the older margin interface, we will
585b704d6b9dec Yu Zhao         2019-11-10  136  	 * trigger the /dev/chromeos-low_mem device when we are below the
585b704d6b9dec Yu Zhao         2019-11-10  137  	 * lowest threshold
585b704d6b9dec Yu Zhao         2019-11-10  138  	 */
585b704d6b9dec Yu Zhao         2019-11-10  139  	bool is_low_mem = available_mem < low_mem_thresholds[0];
585b704d6b9dec Yu Zhao         2019-11-10  140  	unsigned int threshold_lowest = UINT_MAX;
585b704d6b9dec Yu Zhao         2019-11-10  141  	int i;
585b704d6b9dec Yu Zhao         2019-11-10  142  
585b704d6b9dec Yu Zhao         2019-11-10  143  	if (!low_mem_margin_enabled)
585b704d6b9dec Yu Zhao         2019-11-10  144  		return false;
585b704d6b9dec Yu Zhao         2019-11-10  145  
585b704d6b9dec Yu Zhao         2019-11-10  146  	if (atomic_read(&in_low_mem_check) || atomic_xchg(&in_low_mem_check, 1))
585b704d6b9dec Yu Zhao         2019-11-10  147  		return was_low_mem;
585b704d6b9dec Yu Zhao         2019-11-10  148  
585b704d6b9dec Yu Zhao         2019-11-10  149  	if (unlikely(is_low_mem && !was_low_mem) &&
585b704d6b9dec Yu Zhao         2019-11-10  150  	    __ratelimit(&low_mem_logging_ratelimit)) {
585b704d6b9dec Yu Zhao         2019-11-10  151  		pr_info("entering low_mem (avail RAM = %lu kB, avail swap %lu kB, avail file %lu kB, anon mem: %lu kB)\n",
585b704d6b9dec Yu Zhao         2019-11-10  152  			available_mem * PAGE_SIZE / 1024,
585b704d6b9dec Yu Zhao         2019-11-10  153  			get_nr_swap_pages() * PAGE_SIZE / 1024,
585b704d6b9dec Yu Zhao         2019-11-10  154  			get_available_file_mem() * PAGE_SIZE / 1024,
585b704d6b9dec Yu Zhao         2019-11-10  155  			get_available_anon_mem() * PAGE_SIZE / 1024);
585b704d6b9dec Yu Zhao         2019-11-10  156  	}
585b704d6b9dec Yu Zhao         2019-11-10  157  	was_low_mem = is_low_mem;
585b704d6b9dec Yu Zhao         2019-11-10  158  
585b704d6b9dec Yu Zhao         2019-11-10  159  	if (is_low_mem)
585b704d6b9dec Yu Zhao         2019-11-10  160  		low_mem_notify();
585b704d6b9dec Yu Zhao         2019-11-10  161  
585b704d6b9dec Yu Zhao         2019-11-10  162  	for (i = 0; i < low_mem_threshold_count; i++) {
585b704d6b9dec Yu Zhao         2019-11-10  163  		if (available_mem < low_mem_thresholds[i]) {
585b704d6b9dec Yu Zhao         2019-11-10  164  			threshold_lowest = i;
585b704d6b9dec Yu Zhao         2019-11-10  165  			break;
585b704d6b9dec Yu Zhao         2019-11-10  166  		}
585b704d6b9dec Yu Zhao         2019-11-10  167  	}
585b704d6b9dec Yu Zhao         2019-11-10  168  
585b704d6b9dec Yu Zhao         2019-11-10  169  	/* we crossed one or more thresholds */
585b704d6b9dec Yu Zhao         2019-11-10  170  	if (unlikely(threshold_lowest < low_mem_threshold_last))
585b704d6b9dec Yu Zhao         2019-11-10  171  		low_mem_threshold_notify();
585b704d6b9dec Yu Zhao         2019-11-10  172  
585b704d6b9dec Yu Zhao         2019-11-10  173  	low_mem_threshold_last = threshold_lowest;
585b704d6b9dec Yu Zhao         2019-11-10  174  
585b704d6b9dec Yu Zhao         2019-11-10  175  	atomic_set(&in_low_mem_check, 0);
585b704d6b9dec Yu Zhao         2019-11-10  176  
585b704d6b9dec Yu Zhao         2019-11-10  177  	return is_low_mem;
585b704d6b9dec Yu Zhao         2019-11-10  178  }
585b704d6b9dec Yu Zhao         2019-11-10  179  

:::::: The code at line 53 was first introduced by commit
:::::: bca855d46bcc364801c1336e96d238fbf1d3c20b CHROMIUM: Add /dev/low-mem device for low-memory notification.

:::::: TO: Luigi Semenzato <semenzato@chromium.org>
:::::: CC: Guenter Roeck <groeck@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
