Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856F83212
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 16:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681231283; x=1712767283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7DNSXwWb7aFxFuOyW/JeVsWioh0JZOVWO/LWj8SWTm4=;
  b=BFdfCditYmQ+evCSLUUzFwlzEgW5xixN7XCFulAt5QwiuL9J6E3EY4zP
   r7mnVZ/co4gx/3hixkduPot5r7pRBTd6ji0LiRTg3hBq15uXbA4lNPOMk
   DekzDD8v16nPa86ri0UQTh3EP0TtVeznhsvwHziD5JnUSqJiEMMetMlXo
   uy7+p6u7f4fDek+oFA2bUYY2CQQY0W1K9RoF+GEBZNAM7lsZFTyNo+RHE
   Rg8x6huICbshyxol+kTGVpFyoCdEYpC0RYFbeDGBLm6x4EsSPF1Dg6T//
   5zVPnD5dgg9kyX9JXp7zF9PbESuyYD6E0cSvnVaIBLx6Qp32Bd2C2n4T/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="406496243"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="406496243"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 09:41:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="721251156"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="721251156"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Apr 2023 09:41:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmH3V-000WUZ-2W;
	Tue, 11 Apr 2023 16:41:17 +0000
Date: Wed, 12 Apr 2023 00:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nikolay Borisov <nborisov@suse.com>, Qu Wenruo <wqu@suse.com>,
	Johannes Thumshirn <jthumshirn@suse.de>,
	David Sterba <dsterba@suse.com>, Anand Jain <anand.jain@oracle.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.4.y 633/9999] include/linux/list.h:63:20: warning:
 storing the address of local variable 'ticket' in
 '*&space_info_37(D)->priority_tickets.prev'
Message-ID: <202304120017.2CRjmyHB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   32bea3bac5ca484c6f7e302c8c96fc686f62e7b4
commit: 39c5eb1482b2461ea54e0d23c4742987c20480fa [633/9999] btrfs: don't pass system_chunk into can_overcommit
config: parisc-randconfig-r013-20230411 (https://download.01.org/0day-ci/archive/20230412/202304120017.2CRjmyHB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=39c5eb1482b2461ea54e0d23c4742987c20480fa
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout 39c5eb1482b2461ea54e0d23c4742987c20480fa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash fs/btrfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304120017.2CRjmyHB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:99,
                    from fs/btrfs/ctree.h:9,
                    from fs/btrfs/space-info.c:4:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
   arch/parisc/include/asm/pgtable.h:91:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   arch/parisc/include/asm/pgtable.h:316:34: note: in expansion of macro 'set_pte_at'
     316 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:201:9: note: in expansion of macro 'pte_clear'
     201 |         pte_clear(mm, address, ptep);
         |         ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
   arch/parisc/include/asm/pgtable.h:91:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   include/asm-generic/pgtable.h:629:9: note: in expansion of macro 'set_pte_at'
     629 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |         ^~~~~~~~~~
   In file included from fs/btrfs/space-info.c:6:
   fs/btrfs/sysfs.h: At top level:
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
       inlined from '__reserve_metadata_bytes' at fs/btrfs/space-info.c:1079:4:
>> include/linux/list.h:63:20: warning: storing the address of local variable 'ticket' in '*&space_info_37(D)->priority_tickets.prev' [-Wdangling-pointer=]
      63 |         next->prev = new;
         |         ~~~~~~~~~~~^~~~~
   fs/btrfs/space-info.c: In function '__reserve_metadata_bytes':
   fs/btrfs/space-info.c:1028:31: note: 'ticket' declared here
    1028 |         struct reserve_ticket ticket;
         |                               ^~~~~~
   fs/btrfs/space-info.c:1028:31: note: 'space_info' declared here


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

:::::: The code at line 63 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
