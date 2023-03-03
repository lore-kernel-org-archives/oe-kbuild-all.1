Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A2346AA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 13:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677850696; x=1709386696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VNgyzolaEvFh9FQi44oBUSpJ3xWqzfVY0t6BDD/G75k=;
  b=E0ywbbNMBKVhbZ/6OMi+SKn+OHvPcajz1AkNjVPx+QUxbYoTy7NQSpwY
   6oo5JZXlLLmLnVQee7l8SOJEobyI7jO048Vp4k3/PbsLgTqWAh0y+Ju7i
   wyLU4ccocAAa22BI5ODZ1FBZVhCi4KDod9JbmuitYeAon5hlUdK302B8b
   J47osVrBYN1H8ZUeVpCrC/04Z40ZlYjrlwg2IoNwATPXWBFqql0GDOtpx
   SOEtiqCDh+4Y0IVJCo7YuYq8d+4orVl9Qy+xwxDObmfdJf6fB5xvXVJwV
   qTEVAgNzDNN3GmZcKByIPnKc97diEPS1EnZVU3gzC6VHw5iAOr2umIs66
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="318865709"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="318865709"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 05:38:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="705645877"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="705645877"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Mar 2023 05:38:15 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY5by-0001SK-1Y;
	Fri, 03 Mar 2023 13:38:14 +0000
Date: Fri, 3 Mar 2023 21:37:37 +0800
From: kernel test robot <lkp@intel.com>
To: Coly Li <colyli@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [colyli-bcache:nvdimm-meta 14/16] drivers/md/bcache/nvmpg.c:103:5:
 warning: no previous prototype for 'bkey_offset_to_nvmpg_ns_id'
Message-ID: <202303032100.yDbGqneD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache.git nvdimm-meta
head:   7ae909b6dcf328bd8757e42861dcbadc29cca872
commit: c70bd0e5cbe25d19e37a37d4f9e78192d9cbc527 [14/16] bcache: add helper routines to convert bkey and nvmpg offset
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230303/202303032100.yDbGqneD-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache.git/commit/?id=c70bd0e5cbe25d19e37a37d4f9e78192d9cbc527
        git remote add colyli-bcache https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache.git
        git fetch --no-tags colyli-bcache nvdimm-meta
        git checkout c70bd0e5cbe25d19e37a37d4f9e78192d9cbc527
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/md/bcache/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303032100.yDbGqneD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/bcache/nvmpg.c:103:5: warning: no previous prototype for 'bkey_offset_to_nvmpg_ns_id' [-Wmissing-prototypes]
     103 | int bkey_offset_to_nvmpg_ns_id(unsigned long bkey_offset)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/nvmpg.c: In function 'release_ns_tbl':
   drivers/md/bcache/nvmpg.c:166:25: error: too few arguments to function 'fs_put_dax'
     166 |                         fs_put_dax(ns->dax_dev);
         |                         ^~~~~~~~~~
   In file included from drivers/md/bcache/nvmpg.c:16:
   include/linux/dax.h:151:20: note: declared here
     151 | static inline void fs_put_dax(struct dax_device *dax_dev, void *holder)
         |                    ^~~~~~~~~~
   In file included from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/alpha/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/mempool.h:8,
                    from include/linux/bio.h:8,
                    from drivers/md/bcache/bcache.h:181,
                    from drivers/md/bcache/nvmpg.c:10:
   drivers/md/bcache/nvmpg.c: In function 'bch_register_namespace':
   drivers/md/bcache/nvmpg.c:850:24: error: implicit declaration of function 'bdevname'; did you mean 'dev_name'? [-Werror=implicit-function-declaration]
     850 |                        bdevname(bdev, buf));
         |                        ^~~~~~~~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/md/bcache/nvmpg.c:849:17: note: in expansion of macro 'pr_err'
     849 |                 pr_err("%s read nvdimm meta super block failed.\n",
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%s' expects argument of type 'char *', but argument 3 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:498:16: note: in expansion of macro 'KERN_ERR'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/md/bcache/nvmpg.c:849:17: note: in expansion of macro 'pr_err'
     849 |                 pr_err("%s read nvdimm meta super block failed.\n",
         |                 ^~~~~~
   drivers/md/bcache/nvmpg.c:855:23: error: too few arguments to function 'fs_dax_get_by_bdev'
     855 |         ns->dax_dev = fs_dax_get_by_bdev(bdev, &start_off);
         |                       ^~~~~~~~~~~~~~~~~~
   include/linux/dax.h:145:34: note: declared here
     145 | static inline struct dax_device *fs_dax_get_by_bdev(struct block_device *bdev,
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%s' expects argument of type 'char *', but argument 3 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:498:16: note: in expansion of macro 'KERN_ERR'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/md/bcache/nvmpg.c:857:17: note: in expansion of macro 'pr_err'
     857 |                 pr_err("%s don't support DAX\n", bdevname(bdev, buf));
         |                 ^~~~~~
   drivers/md/bcache/nvmpg.c:962:17: error: too few arguments to function 'fs_put_dax'
     962 |                 fs_put_dax(ns->dax_dev);
         |                 ^~~~~~~~~~
   include/linux/dax.h:151:20: note: declared here
     151 | static inline void fs_put_dax(struct dax_device *dax_dev, void *holder)
         |                    ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/bkey_offset_to_nvmpg_ns_id +103 drivers/md/bcache/nvmpg.c

   102	
 > 103	int bkey_offset_to_nvmpg_ns_id(unsigned long bkey_offset)
   104	{
   105		return (bkey_offset >> BCH_BKEY_OFFSET_BITS) &
   106			BCH_BKEY_OFFSET_NS_ID_MASK;
   107	}
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
