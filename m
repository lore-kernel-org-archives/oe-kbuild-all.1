Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C76746AA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677848238; x=1709384238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7SoblFyLXVmmwVxVj0hpUOoyscwL8YdS54cHMsczSmo=;
  b=KFVVyO2rfe/8gjBkFicxXGX6Py3ZhKgCWmGwHFZP6LT4R0ECLIfJq9pl
   RCPUSAF4Fs2PFL3dIyj6oCaquXyulyo/qZxf0V/XfhyCyWAR500WbyFHS
   kyIWEF+qKHWec/7WRfY6Zo0kfBuR6LN+y/dluwTbiMs0w+loCXlt/d8+/
   +dt5BZ1tjslQx9qe17LRT1f1hvWTbfxDwI/vwM8t8JNSLuPz0VI0/etFY
   gn5wzhuKk7f/C0gl2Gh7rUStNxNnJYeESSl2hQ3NHZet2XfbZlFRtW174
   IDNXT0TsiCscs8SCakq6vERFqa8pkTlFX6lYdsEP+AfYRZbHVF5R5etQg
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="421307973"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="421307973"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 04:57:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="1004569228"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="1004569228"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Mar 2023 04:57:14 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY4yH-0001RY-2x;
	Fri, 03 Mar 2023 12:57:13 +0000
Date: Fri, 3 Mar 2023 20:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jianpeng Ma <jianpeng.ma@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Coly Li <colyli@suse.de>,
	Qiaowei Ren <qiaowei.ren@intel.com>
Subject: [colyli-bcache:nvdimm-meta 2/16] include/linux/kern_levels.h:5:25:
 warning: format '%s' expects argument of type 'char *', but argument 3 has
 type 'int'
Message-ID: <202303032039.M3AVfOZR-lkp@intel.com>
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
commit: 3cb4e1ba67a17871c7c27e17a332300888fafb0a [2/16] bcache: initialize the nvm pages allocator
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230303/202303032039.M3AVfOZR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache.git/commit/?id=3cb4e1ba67a17871c7c27e17a332300888fafb0a
        git remote add colyli-bcache https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache.git
        git fetch --no-tags colyli-bcache nvdimm-meta
        git checkout 3cb4e1ba67a17871c7c27e17a332300888fafb0a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/md/bcache/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303032039.M3AVfOZR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/bcache/nvmpg.c: In function 'release_ns_tbl':
   drivers/md/bcache/nvmpg.c:61:25: error: too few arguments to function 'fs_put_dax'
      61 |                         fs_put_dax(ns->dax_dev);
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
   drivers/md/bcache/nvmpg.c:231:24: error: implicit declaration of function 'bdevname'; did you mean 'dev_name'? [-Werror=implicit-function-declaration]
     231 |                        bdevname(bdev, buf));
         |                        ^~~~~~~~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/md/bcache/nvmpg.c:230:17: note: in expansion of macro 'pr_err'
     230 |                 pr_err("%s read nvdimm meta super block failed.\n",
         |                 ^~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%s' expects argument of type 'char *', but argument 3 has type 'int' [-Wformat=]
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
   drivers/md/bcache/nvmpg.c:230:17: note: in expansion of macro 'pr_err'
     230 |                 pr_err("%s read nvdimm meta super block failed.\n",
         |                 ^~~~~~
   drivers/md/bcache/nvmpg.c:236:23: error: too few arguments to function 'fs_dax_get_by_bdev'
     236 |         ns->dax_dev = fs_dax_get_by_bdev(bdev, &start_off);
         |                       ^~~~~~~~~~~~~~~~~~
   include/linux/dax.h:145:34: note: declared here
     145 | static inline struct dax_device *fs_dax_get_by_bdev(struct block_device *bdev,
         |                                  ^~~~~~~~~~~~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%s' expects argument of type 'char *', but argument 3 has type 'int' [-Wformat=]
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
   drivers/md/bcache/nvmpg.c:238:17: note: in expansion of macro 'pr_err'
     238 |                 pr_err("%s don't support DAX\n", bdevname(bdev, buf));
         |                 ^~~~~~
   drivers/md/bcache/nvmpg.c:307:17: error: too few arguments to function 'fs_put_dax'
     307 |                 fs_put_dax(ns->dax_dev);
         |                 ^~~~~~~~~~
   include/linux/dax.h:151:20: note: declared here
     151 | static inline void fs_put_dax(struct dax_device *dax_dev, void *holder)
         |                    ^~~~~~~~~~
   In file included from drivers/md/bcache/nvmpg.h:8,
                    from drivers/md/bcache/nvmpg.c:11:
   drivers/md/bcache/nvmpg_format.h: At top level:
   drivers/md/bcache/nvmpg_format.h:132:19: warning: 'bch_nvmpg_recs_magic' defined but not used [-Wunused-const-variable=]
     132 | static const __u8 bch_nvmpg_recs_magic[] = {
         |                   ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
