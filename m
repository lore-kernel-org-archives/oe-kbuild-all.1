Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B01A185F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Mar 2023 07:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678605979; x=1710141979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HPdq+xqIrZiMqhtQtWkOVi2DstRt+7sys8vU8MJd7FM=;
  b=DxJc4vzb5Xq7Z9zIOqmECWNj4jjphtn7liIX7rqZmqrz5LsQCqf3Sc/+
   cCJCVEkApkh+1a1RyDA5giSc6Thidd2TaIsIPpogvS6mg8pWc8y2p/v6H
   FcDulf4/jS4eYEgj3qbqqqTsRQ9nDc/zmcJ7p0u9VQDAtoCClnEIj3dpH
   +B7HDXkaJX6c9/7+D7oWj2p2F26I+DxyYs1592WUANB2su5NO099PjnNy
   L8ZMs6s/OUzU53mVXS+K7N3KtLc6NXLWkAEe8+KIGHZfwrnHzNZsSzwMK
   vu/9JGh5fXxTGqWvRwKz2aXm+06KLJk+hPJXvet3dtbWR9yRGDGjHS4Hn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="335665564"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="335665564"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 23:26:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="924137773"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="924137773"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Mar 2023 23:26:15 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbG5v-00056C-0y;
	Sun, 12 Mar 2023 07:26:15 +0000
Date: Sun, 12 Mar 2023 15:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: drivers/watchdog/indydog.c:116:24: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202303121544.1qATI7To-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   81ff855485a366a391dc3aed3942715e676ed132
commit: ddb002d6d6af12c45dd9d565cadf0f40b36b7c25 MIPS: uaccess: Reduce number of nested macros
date:   1 year, 11 months ago
config: mips-randconfig-s033-20230312 (https://download.01.org/0day-ci/archive/20230312/202303121544.1qATI7To-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ddb002d6d6af12c45dd9d565cadf0f40b36b7c25
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ddb002d6d6af12c45dd9d565cadf0f40b36b7c25
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips SHELL=/bin/bash drivers/watchdog/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303121544.1qATI7To-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/watchdog/indydog.c:110:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct watchdog_info * @@
   drivers/watchdog/indydog.c:110:35: sparse:     expected void [noderef] __user *to
   drivers/watchdog/indydog.c:110:35: sparse:     got struct watchdog_info *
>> drivers/watchdog/indydog.c:116:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int [noderef] __user *__p @@     got int * @@
   drivers/watchdog/indydog.c:116:24: sparse:     expected int [noderef] __user *__p
   drivers/watchdog/indydog.c:116:24: sparse:     got int *
>> drivers/watchdog/indydog.c:119:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int const [noderef] __user *__p @@     got int * @@
   drivers/watchdog/indydog.c:119:21: sparse:     expected int const [noderef] __user *__p
   drivers/watchdog/indydog.c:119:21: sparse:     got int *
   drivers/watchdog/indydog.c:135:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int [noderef] __user *__p @@     got int * @@
   drivers/watchdog/indydog.c:135:24: sparse:     expected int [noderef] __user *__p
   drivers/watchdog/indydog.c:135:24: sparse:     got int *
   drivers/watchdog/indydog.c:153:27: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected long ( *write )( ... ) @@     got long ( * )( ... ) @@
   drivers/watchdog/indydog.c:153:27: sparse:     expected long ( *write )( ... )
   drivers/watchdog/indydog.c:153:27: sparse:     got long ( * )( ... )

vim +116 drivers/watchdog/indydog.c

^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16   97  
9b9dbcca3fa13a drivers/watchdog/indydog.c      Alan Cox         2008-05-19   98  static long indydog_ioctl(struct file *file, unsigned int cmd,
9b9dbcca3fa13a drivers/watchdog/indydog.c      Alan Cox         2008-05-19   99  							unsigned long arg)
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  100  {
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  101  	int options, retval = -EINVAL;
42747d712de56c drivers/watchdog/indydog.c      Wim Van Sebroeck 2009-12-26  102  	static const struct watchdog_info ident = {
e73a780272a46e drivers/watchdog/indydog.c      Wim Van Sebroeck 2009-05-11  103  		.options		= WDIOF_KEEPALIVEPING,
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  104  		.firmware_version	= 0,
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  105  		.identity		= "Hardware Watchdog for SGI IP22",
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  106  	};
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  107  
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  108  	switch (cmd) {
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  109  	case WDIOC_GETSUPPORT:
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16 @110  		if (copy_to_user((struct watchdog_info *)arg,
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  111  				 &ident, sizeof(ident)))
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  112  			return -EFAULT;
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  113  		return 0;
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  114  	case WDIOC_GETSTATUS:
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  115  	case WDIOC_GETBOOTSTATUS:
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16 @116  		return put_user(0, (int *)arg);
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  117  	case WDIOC_SETOPTIONS:
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  118  	{
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16 @119  		if (get_user(options, (int *)arg))
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  120  			return -EFAULT;
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  121  		if (options & WDIOS_DISABLECARD) {
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  122  			indydog_stop();
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  123  			retval = 0;
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  124  		}
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  125  		if (options & WDIOS_ENABLECARD) {
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  126  			indydog_start();
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  127  			retval = 0;
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  128  		}
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  129  		return retval;
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  130  	}
0c06090c9472db drivers/watchdog/indydog.c      Wim Van Sebroeck 2008-07-18  131  	case WDIOC_KEEPALIVE:
0c06090c9472db drivers/watchdog/indydog.c      Wim Van Sebroeck 2008-07-18  132  		indydog_ping();
0c06090c9472db drivers/watchdog/indydog.c      Wim Van Sebroeck 2008-07-18  133  		return 0;
0c06090c9472db drivers/watchdog/indydog.c      Wim Van Sebroeck 2008-07-18  134  	case WDIOC_GETTIMEOUT:
0c06090c9472db drivers/watchdog/indydog.c      Wim Van Sebroeck 2008-07-18  135  		return put_user(WATCHDOG_TIMEOUT, (int *)arg);
9b9dbcca3fa13a drivers/watchdog/indydog.c      Alan Cox         2008-05-19  136  	default:
9b9dbcca3fa13a drivers/watchdog/indydog.c      Alan Cox         2008-05-19  137  		return -ENOTTY;
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  138  	}
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  139  }
^1da177e4c3f41 drivers/char/watchdog/indydog.c Linus Torvalds   2005-04-16  140  

:::::: The code at line 116 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
