Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9429182
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 00:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675728172; x=1707264172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p7OcuoxVAVXdgcHexkNryZQ3oT4r2ovae0pPJ+rK/ko=;
  b=bQTMkXeTLrhU5bNWpU0IlJaejlBkn60BnWYpTjGJb1Dvpur3p0V8grSl
   0Gk3y4sYdL6la6iB2rYlcgY5/tgZq+ZLgCGbUhBjoK2a/uwkf+5e2KaKb
   TL4XjDnDRx0g9CPQN8ytDQKFZlgz46ltJdJLrxFVQUapTX36r4uqGIirh
   Uz26Clk8WDbP/ozFNwEJfc8QtGVbo+RTvw7O9FSrSHvzG5HlMFUF16nUV
   fU2Euw6EyTCfdp/oGmYPRESUzkp+c+uCrIVIw0i6reCJ66rxGFJfYnCZ6
   tUkXzAxVuB9OZAmyroME5htIWx16AzU2kIYALyPojQkorm7A6HbLA+iVI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="317368379"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="317368379"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 16:02:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="666654150"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="666654150"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Feb 2023 16:02:25 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPBRI-0002tG-1O;
	Tue, 07 Feb 2023 00:02:24 +0000
Date: Tue, 7 Feb 2023 08:02:18 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: mm/low-mem-notify.c:53:6: warning: no previous prototype for
 'low_mem_notify'
Message-ID: <202302070731.yP2bExck-lkp@intel.com>
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
config: h8300-randconfig-r001-20230206 (https://download.01.org/0day-ci/archive/20230207/202302070731.yP2bExck-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=585b704d6b9decff53ce46e97eaa1f71a15e388c
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 585b704d6b9decff53ce46e97eaa1f71a15e388c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=h8300 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=h8300 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from mm/low-mem-notify.c:25:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   include/asm-generic/page.h:93:51: warning: ordered comparison of pointer with null pointer [-Wextra]
      93 | #define virt_addr_valid(kaddr)  (((void *)(kaddr) >= (void *)PAGE_OFFSET) && \
         |                                                   ^~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/scatterlist.h:143:9: note: in expansion of macro 'BUG_ON'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |         ^~~~~~
   include/linux/scatterlist.h:143:17: note: in expansion of macro 'virt_addr_valid'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |                 ^~~~~~~~~~~~~~~
   mm/low-mem-notify.c: At top level:
>> mm/low-mem-notify.c:53:6: warning: no previous prototype for 'low_mem_notify' [-Wmissing-prototypes]
      53 | void low_mem_notify(void)
         |      ^~~~~~~~~~~~~~
>> mm/low-mem-notify.c:121:6: warning: no previous prototype for 'low_mem_check' [-Wmissing-prototypes]
     121 | bool low_mem_check(void)
         |      ^~~~~~~~~~~~~


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
