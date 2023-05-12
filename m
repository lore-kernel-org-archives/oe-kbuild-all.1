Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3D57EC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 00:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683852696; x=1715388696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JuBowb6rkoPQY8JW3IYI7FVgZO77vD216c1zqWbwajM=;
  b=VsbBgOA1pJOnh+tQbQUgUm0TD+X9wdW/SjwDMVQaw/aA+RaURjEwXIyS
   e2jzXHQsL7jCvusPnfyhD2UrSwY1w6f64Rsf68ZP5u388yB2m0kl/gqI+
   q/ihQnrv/iIOuXEz+gvneIkxREIFZwo4fdEm9dkEPBiBUrczwl0tbcu76
   JS3wU/ybK8PzA96pDwuamWKdzhdr13CiUXdZB8D+QEjE7D34qCax0qinK
   SmOB75eJfE2NW05wtRbzFFUD2q5gHcGapyT7uJdPO6/CTb7WZ6O0oA3C4
   W+Q3IQN+hXBVdLMP0JG4D6tg8ssIXwW0qs9S4h5RW0vppIc4sdoBRrHI+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="353789679"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="353789679"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 17:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="844199911"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="844199911"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 May 2023 17:51:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxH0M-0004Lm-3A;
	Fri, 12 May 2023 00:51:30 +0000
Date: Fri, 12 May 2023 08:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nikolay Borisov <nborisov@suse.com>,
	David Sterba <dsterba@suse.com>, Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:queue/5.4 5848/23329] include/linux/list.h:63:20:
 warning: storing the address of local variable 'ticket' in
 '*&space_info_79(D)->priority_tickets.prev'
Message-ID: <202305120805.M1icgldq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Josef,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.4
head:   d17335b56c10fc4804987be8009455e6ed37c9a8
commit: 1e42a1857bcff0820498d95c0803ad0e482b8f05 [5848/23329] btrfs: improve global reserve stealing logic
config: nds32-randconfig-r035-20230509 (https://download.01.org/0day-ci/archive/20230512/202305120805.M1icgldq-lkp@intel.com/config)
compiler: nds32le-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=1e42a1857bcff0820498d95c0803ad0e482b8f05
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.4
        git checkout 1e42a1857bcff0820498d95c0803ad0e482b8f05
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nds32 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nds32 SHELL=/bin/bash fs/btrfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305120805.M1icgldq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/btrfs/space-info.c:6:
   fs/btrfs/sysfs.h:16:1: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
      16 | const char * const btrfs_feature_set_name(enum btrfs_feature_set set);
         | ^~~~~
   In file included from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from fs/btrfs/misc.h:6,
                    from fs/btrfs/space-info.c:3:
   In function '__list_add',
       inlined from 'list_add_tail' at include/linux/list.h:93:2,
       inlined from '__reserve_metadata_bytes' at fs/btrfs/space-info.c:1089:4:
>> include/linux/list.h:63:20: warning: storing the address of local variable 'ticket' in '*&space_info_79(D)->priority_tickets.prev' [-Wdangling-pointer=]
      63 |         next->prev = new;
         |         ~~~~~~~~~~~^~~~~
   fs/btrfs/space-info.c: In function '__reserve_metadata_bytes':
   fs/btrfs/space-info.c:1037:31: note: 'ticket' declared here
    1037 |         struct reserve_ticket ticket;
         |                               ^~~~~~
   fs/btrfs/space-info.c:1037:31: note: 'space_info' declared here


vim +63 include/linux/list.h

d7c816733d501b Kees Cook        2016-08-17  49  
^1da177e4c3f41 Linus Torvalds   2005-04-16  50  /*
^1da177e4c3f41 Linus Torvalds   2005-04-16  51   * Insert a new entry between two known consecutive entries.
^1da177e4c3f41 Linus Torvalds   2005-04-16  52   *
^1da177e4c3f41 Linus Torvalds   2005-04-16  53   * This is only for internal list manipulation where we know
^1da177e4c3f41 Linus Torvalds   2005-04-16  54   * the prev/next entries already!
^1da177e4c3f41 Linus Torvalds   2005-04-16  55   */
^1da177e4c3f41 Linus Torvalds   2005-04-16  56  static inline void __list_add(struct list_head *new,
^1da177e4c3f41 Linus Torvalds   2005-04-16  57  			      struct list_head *prev,
^1da177e4c3f41 Linus Torvalds   2005-04-16  58  			      struct list_head *next)
^1da177e4c3f41 Linus Torvalds   2005-04-16  59  {
d7c816733d501b Kees Cook        2016-08-17  60  	if (!__list_add_valid(new, prev, next))
d7c816733d501b Kees Cook        2016-08-17  61  		return;
d7c816733d501b Kees Cook        2016-08-17  62  
^1da177e4c3f41 Linus Torvalds   2005-04-16 @63  	next->prev = new;
^1da177e4c3f41 Linus Torvalds   2005-04-16  64  	new->next = next;
^1da177e4c3f41 Linus Torvalds   2005-04-16  65  	new->prev = prev;
1c97be677f72b3 Paul E. McKenney 2015-09-20  66  	WRITE_ONCE(prev->next, new);
^1da177e4c3f41 Linus Torvalds   2005-04-16  67  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  68  
^1da177e4c3f41 Linus Torvalds   2005-04-16  69  /**
^1da177e4c3f41 Linus Torvalds   2005-04-16  70   * list_add - add a new entry
^1da177e4c3f41 Linus Torvalds   2005-04-16  71   * @new: new entry to be added
^1da177e4c3f41 Linus Torvalds   2005-04-16  72   * @head: list head to add it after
^1da177e4c3f41 Linus Torvalds   2005-04-16  73   *
^1da177e4c3f41 Linus Torvalds   2005-04-16  74   * Insert a new entry after the specified head.
^1da177e4c3f41 Linus Torvalds   2005-04-16  75   * This is good for implementing stacks.
^1da177e4c3f41 Linus Torvalds   2005-04-16  76   */
^1da177e4c3f41 Linus Torvalds   2005-04-16  77  static inline void list_add(struct list_head *new, struct list_head *head)
^1da177e4c3f41 Linus Torvalds   2005-04-16  78  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  79  	__list_add(new, head, head->next);
^1da177e4c3f41 Linus Torvalds   2005-04-16  80  }
199a9afc3dbe98 Dave Jones       2006-09-29  81  
^1da177e4c3f41 Linus Torvalds   2005-04-16  82  
^1da177e4c3f41 Linus Torvalds   2005-04-16  83  /**
^1da177e4c3f41 Linus Torvalds   2005-04-16  84   * list_add_tail - add a new entry
^1da177e4c3f41 Linus Torvalds   2005-04-16  85   * @new: new entry to be added
^1da177e4c3f41 Linus Torvalds   2005-04-16  86   * @head: list head to add it before
^1da177e4c3f41 Linus Torvalds   2005-04-16  87   *
^1da177e4c3f41 Linus Torvalds   2005-04-16  88   * Insert a new entry before the specified head.
^1da177e4c3f41 Linus Torvalds   2005-04-16  89   * This is useful for implementing queues.
^1da177e4c3f41 Linus Torvalds   2005-04-16  90   */
^1da177e4c3f41 Linus Torvalds   2005-04-16  91  static inline void list_add_tail(struct list_head *new, struct list_head *head)
^1da177e4c3f41 Linus Torvalds   2005-04-16  92  {
^1da177e4c3f41 Linus Torvalds   2005-04-16 @93  	__list_add(new, head->prev, head);
^1da177e4c3f41 Linus Torvalds   2005-04-16  94  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  95  

:::::: The code at line 63 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
