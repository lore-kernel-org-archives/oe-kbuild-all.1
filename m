Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C657AD2F7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 20:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680813377; x=1712349377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5aOBStNfgwCFBYKtpn6vf0aXh0wYJmDuoi2gDboeMi4=;
  b=hmKuSgoOYfxFBbUEgpzZJiPVm3F7/vA/gfIe+GT4urZjDfepgTKd/tDm
   iyrpJQPy1IFK53vSW4gzjczTwYb4Y3qOj2bI4c0sRFxjqtTCy0EUt0Wwd
   0K9T0HabeyDN0HJfjycaGkblf/q43G3jj4BSGtQKwMXTLcz6IxxYpgZJH
   Y5cXPQXyc7njGmoFLNficHib312eRVVPwwXAFWUbeSyF71c2zHKEUUacS
   jdlFDcGb4seMihTWtjcjiIfhmYVgS7/M2zMGBhLQHbdj+aqjMVVfHnAXA
   uaPQHW9bia65H8tXCDgmgWLRsw8pSLsEKzPbuI6xP5rwx7681MwhhFzDk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="326907146"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="326907146"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 13:36:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664630706"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="664630706"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Apr 2023 13:36:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkWL4-000RkS-1R;
	Thu, 06 Apr 2023 20:36:10 +0000
Date: Fri, 7 Apr 2023 04:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 7/7] fs/reiserfs/procfs.c:64: warning: "MAP" redefined
Message-ID: <202304070417.wMSpUF3i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git maph
head:   9c0824a037ac394909bf05dddcace5fd127384bc
commit: 9c0824a037ac394909bf05dddcace5fd127384bc [7/7] map.h: include it from dynamic_debug.h, get fallout from robots
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230407/202304070417.wMSpUF3i-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/9c0824a037ac394909bf05dddcace5fd127384bc
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc maph
        git checkout 9c0824a037ac394909bf05dddcace5fd127384bc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070417.wMSpUF3i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/reiserfs/procfs.c:64: warning: "MAP" redefined
      64 | #define MAP( i ) D4C( objectid_map( sb, rs )[ i ] )
         | 
   In file included from include/linux/dynamic_debug.h:10,
                    from include/linux/printk.h:564,
                    from include/linux/kernel.h:29,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from fs/reiserfs/procfs.c:11:
   include/linux/map.h:46: note: this is the location of the previous definition
      46 | #define MAP(f, ...) EVAL(MAP1(f, __VA_ARGS__, ()()(), ()()(), ()()(), 0))
         | 


vim +/MAP +64 fs/reiserfs/procfs.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  60  
^1da177e4c3f41 Linus Torvalds 2005-04-16  61  #define objectid_map( s, rs ) (old_format_only (s) ?				\
3e8962be915bac Al Viro        2005-05-01  62                           (__le32 *)((struct reiserfs_super_block_v1 *)rs + 1) :	\
3e8962be915bac Al Viro        2005-05-01  63  			 (__le32 *)(rs + 1))
^1da177e4c3f41 Linus Torvalds 2005-04-16 @64  #define MAP( i ) D4C( objectid_map( sb, rs )[ i ] )
^1da177e4c3f41 Linus Torvalds 2005-04-16  65  

:::::: The code at line 64 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
