Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8694546AA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 13:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677851917; x=1709387917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Bm9gDDXFRn/BQsdtK/e/ZBTBoRhKfDMWRRB/tiHsGA=;
  b=Guoo3ScmIZ5Zz0IPdLgoj0ZXJpfNHDbpeC+M0LY48kgtKt3brPVjc5UX
   MC/aUzo4db3HAz2jY9IlFIgvwZKadTi8OGDSApCBz6ddNq92Fjl1VWL0m
   +zgfU3KzqAuHNtJUseDQHWQ719CiHLDAArjAaLhj8bvRrIY7J2TQUOTRu
   oXh5zH3DBYc5nToxL50I8oywfQQ3S54x9m9954gwzdTJM425s1x+kPCsD
   RulaDxsHWuV9mIUxN2qlFs6DYlQ9aNhQYxcE3pokeleNiwlJezI6hk07c
   rfWdwK3MNzo5fNfIku8iOZUiJyl6o3I3v/cpntqrvK8kCDmmmtL2km9A5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="337363075"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="337363075"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 05:58:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="921123897"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="921123897"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Mar 2023 05:58:15 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY5vL-0001Su-0C;
	Fri, 03 Mar 2023 13:58:15 +0000
Date: Fri, 3 Mar 2023 21:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jianpeng Ma <jianpeng.ma@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Coly Li <colyli@suse.de>,
	Qiaowei Ren <qiaowei.ren@intel.com>
Subject: [colyli-bcache:nvdimm-meta 2/16]
 drivers/md/bcache/nvmpg_format.h:132:19: warning: 'bch_nvmpg_recs_magic'
 defined but not used
Message-ID: <202303032114.zYIbXu3F-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230303/202303032114.zYIbXu3F-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache.git/commit/?id=3cb4e1ba67a17871c7c27e17a332300888fafb0a
        git remote add colyli-bcache https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache.git
        git fetch --no-tags colyli-bcache nvdimm-meta
        git checkout 3cb4e1ba67a17871c7c27e17a332300888fafb0a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303032114.zYIbXu3F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/bcache/nvmpg.h:8,
                    from drivers/md/bcache/super.c:17:
>> drivers/md/bcache/nvmpg_format.h:132:19: warning: 'bch_nvmpg_recs_magic' defined but not used [-Wunused-const-variable=]
     132 | static const __u8 bch_nvmpg_recs_magic[] = {
         |                   ^~~~~~~~~~~~~~~~~~~~
>> drivers/md/bcache/nvmpg_format.h:129:19: warning: 'bch_nvmpg_magic' defined but not used [-Wunused-const-variable=]
     129 | static const __u8 bch_nvmpg_magic[] = {
         |                   ^~~~~~~~~~~~~~~
--
   drivers/md/bcache/nvmpg.c: In function 'release_ns_tbl':
   drivers/md/bcache/nvmpg.c:61:25: error: too few arguments to function 'fs_put_dax'
      61 |                         fs_put_dax(ns->dax_dev);
         |                         ^~~~~~~~~~
   In file included from drivers/md/bcache/nvmpg.c:16:
   include/linux/dax.h:136:6: note: declared here
     136 | void fs_put_dax(struct dax_device *dax_dev, void *holder);
         |      ^~~~~~~~~~
   In file included from include/linux/kernel.h:29,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/preempt.h:6,
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
   drivers/md/bcache/nvmpg.c:230:17: note: in expansion of macro 'pr_err'
     230 |                 pr_err("%s read nvdimm meta super block failed.\n",
         |                 ^~~~~~
   drivers/md/bcache/nvmpg.c:236:23: error: too few arguments to function 'fs_dax_get_by_bdev'
     236 |         ns->dax_dev = fs_dax_get_by_bdev(bdev, &start_off);
         |                       ^~~~~~~~~~~~~~~~~~
   In file included from drivers/md/bcache/nvmpg.c:16:
   include/linux/dax.h:134:20: note: declared here
     134 | struct dax_device *fs_dax_get_by_bdev(struct block_device *bdev, u64 *start_off,
         |                    ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:29,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/mempool.h:8,
                    from include/linux/bio.h:8,
                    from drivers/md/bcache/bcache.h:181,
                    from drivers/md/bcache/nvmpg.c:10:
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
   drivers/md/bcache/nvmpg.c:238:17: note: in expansion of macro 'pr_err'
     238 |                 pr_err("%s don't support DAX\n", bdevname(bdev, buf));
         |                 ^~~~~~
   drivers/md/bcache/nvmpg.c:307:17: error: too few arguments to function 'fs_put_dax'
     307 |                 fs_put_dax(ns->dax_dev);
         |                 ^~~~~~~~~~
   In file included from drivers/md/bcache/nvmpg.c:16:
   include/linux/dax.h:136:6: note: declared here
     136 | void fs_put_dax(struct dax_device *dax_dev, void *holder);
         |      ^~~~~~~~~~
   In file included from drivers/md/bcache/nvmpg.h:8,
                    from drivers/md/bcache/nvmpg.c:11:
   At top level:
>> drivers/md/bcache/nvmpg_format.h:132:19: warning: 'bch_nvmpg_recs_magic' defined but not used [-Wunused-const-variable=]
     132 | static const __u8 bch_nvmpg_recs_magic[] = {
         |                   ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/bch_nvmpg_recs_magic +132 drivers/md/bcache/nvmpg_format.h

99ed2b46752670 Coly Li 2021-07-26  128  
99ed2b46752670 Coly Li 2021-07-26 @129  static const __u8 bch_nvmpg_magic[] = {
99ed2b46752670 Coly Li 2021-07-26  130  	0x17, 0xbd, 0x53, 0x7f, 0x1b, 0x23, 0xd6, 0x83,
99ed2b46752670 Coly Li 2021-07-26  131  	0x46, 0xa4, 0xf8, 0x28, 0x17, 0xda, 0xec, 0xa9 };
99ed2b46752670 Coly Li 2021-07-26 @132  static const __u8 bch_nvmpg_recs_magic[] = {
99ed2b46752670 Coly Li 2021-07-26  133  	0x39, 0x25, 0x3f, 0xf7, 0x27, 0x17, 0xd0, 0xb9,
99ed2b46752670 Coly Li 2021-07-26  134  	0x10, 0xe6, 0xd2, 0xda, 0x38, 0x68, 0x26, 0xae };
99ed2b46752670 Coly Li 2021-07-26  135  

:::::: The code at line 132 was first introduced by commit
:::::: 99ed2b4675267093853951dfcb3514220c3b94d6 bcache: add initial data structures for nvm pages

:::::: TO: Coly Li <colyli@suse.de>
:::::: CC: Coly Li <colyli@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
