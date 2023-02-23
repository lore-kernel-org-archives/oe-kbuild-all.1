Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A6417CA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 04:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677125809; x=1708661809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RBR+nd0FUqrIhyVwnt+F7t4OlFbHhbFAiOVbtLoWDQk=;
  b=gPIoE/8osAe0ZIACouTVbfORuFagrglXAr/p1et0YNrJtJom5xEr69uw
   TQcrHs5Jrp9De3TKdRKunNNPG+Wd9kEf/24qoDaPgzWHLBR6wdqCEDMS+
   xxQX47Khw6r92hpv0Lh9qFDdE9zXLxJ+c1ouBhGl2n34syeqVFsxhqNAM
   qT8KehkdDaosHYjv5rY9McI/JhtSbSD8jtRxn06/ix2+lZHeNyb6G+egu
   YnG0rd3+ujVBXdUn0tC0RyFXb56Fn4KOlurbE0ICz3Zv9yXQbdGIGFHmJ
   DCy5KHAp/seWnvPdv8cj8fieuzXneOKT/11q6L20wvitL7XL9upQJiC+n
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="360599513"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="360599513"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 20:16:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="846409270"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="846409270"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Feb 2023 20:16:46 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pV32D-00010v-0Z;
	Thu, 23 Feb 2023 04:16:45 +0000
Date: Thu, 23 Feb 2023 12:16:07 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Filipe Manana <fdmanana@suse.com>, David Sterba <dsterba@suse.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 3744/9999] include/linux/pagemap.h:576: Error:
 unrecognized opcode `csrs sstatus,s9'
Message-ID: <202302231255.L8apuXUi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   3eb67e3248e1d96ef4eaa43d9f5dc6ff2ba6db99
commit: 7c9bf5c3ed15fd6ad777663c636a6f4a5d9edf2c [3744/9999] btrfs: fix potential deadlock in the search ioctl
config: riscv-randconfig-r016-20230219 (https://download.01.org/0day-ci/archive/20230223/202302231255.L8apuXUi-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=7c9bf5c3ed15fd6ad777663c636a6f4a5d9edf2c
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 7c9bf5c3ed15fd6ad777663c636a6f4a5d9edf2c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash fs/btrfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302231255.L8apuXUi-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/btrfs/ctree.h:3731:13: note: in expansion of macro 'unlikely'
    3731 |         if (unlikely(test_bit(BTRFS_FS_STATE_DUMMY_FS_INFO,
         |             ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   fs/btrfs/ctree.h:3731:9: note: in expansion of macro 'if'
    3731 |         if (unlikely(test_bit(BTRFS_FS_STATE_DUMMY_FS_INFO,
         |         ^~
   fs/btrfs/ioctl.c: In function 'btrfs_extent_same_range':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   fs/btrfs/ioctl.c:3561:9: note: in expansion of macro 'if'
    3561 |         if (WARN_ON(ret)) {
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:194:9: note: in expansion of macro 'unlikely'
     194 |         unlikely(__ret_warn_on);                                        \
         |         ^~~~~~~~
   fs/btrfs/ioctl.c:3561:13: note: in expansion of macro 'WARN_ON'
    3561 |         if (WARN_ON(ret)) {
         |             ^~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   fs/btrfs/ioctl.c:3561:9: note: in expansion of macro 'if'
    3561 |         if (WARN_ON(ret)) {
         |         ^~
   fs/btrfs/ioctl.c: In function 'btrfs_dedupe_file_range':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   fs/btrfs/ioctl.c:3671:9: note: in expansion of macro 'if'
    3671 |         if (WARN_ON_ONCE(bs < PAGE_SIZE)) {
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:194:9: note: in expansion of macro 'unlikely'
     194 |         unlikely(__ret_warn_on);                                        \
         |         ^~~~~~~~
   include/asm-generic/bug.h:206:33: note: in expansion of macro 'WARN_ON'
     206 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                 ^~~~~~~
   fs/btrfs/ioctl.c:3671:13: note: in expansion of macro 'WARN_ON_ONCE'
    3671 |         if (WARN_ON_ONCE(bs < PAGE_SIZE)) {
         |             ^~~~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   fs/btrfs/ioctl.c:3671:9: note: in expansion of macro 'if'
    3671 |         if (WARN_ON_ONCE(bs < PAGE_SIZE)) {
         |         ^~
   fs/btrfs/ioctl.c: In function 'btrfs_clone_files':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   fs/btrfs/ioctl.c:4362:9: note: in expansion of macro 'if'
    4362 |         if (WARN_ON(ret)) {
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:194:9: note: in expansion of macro 'unlikely'
     194 |         unlikely(__ret_warn_on);                                        \
         |         ^~~~~~~~
   fs/btrfs/ioctl.c:4362:13: note: in expansion of macro 'WARN_ON'
    4362 |         if (WARN_ON(ret)) {
         |             ^~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   fs/btrfs/ioctl.c:4362:9: note: in expansion of macro 'if'
    4362 |         if (WARN_ON(ret)) {
         |         ^~
   include/linux/pagemap.h: Assembler messages:
>> include/linux/pagemap.h:576: Error: unrecognized opcode `csrs sstatus,s9'
>> include/linux/pagemap.h:576: Error: unrecognized opcode `csrc sstatus,s9'
   include/linux/pagemap.h:584: Error: unrecognized opcode `csrs sstatus,s9'
   include/linux/pagemap.h:584: Error: unrecognized opcode `csrc sstatus,s9'
   fs/btrfs/ioctl.c:482: Error: unrecognized opcode `csrs sstatus,a4'
   fs/btrfs/ioctl.c:482: Error: unrecognized opcode `csrc sstatus,a4'


vim +576 include/linux/pagemap.h

385e1ca5f21c46 David Howells  2009-04-03  558  
^1da177e4c3f41 Linus Torvalds 2005-04-16  559  /*
4bce9f6ee8f84f Al Viro        2016-09-17  560   * Fault everything in given userspace address range in.
^1da177e4c3f41 Linus Torvalds 2005-04-16  561   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  562  static inline int fault_in_pages_writeable(char __user *uaddr, int size)
f56f821feb7b36 Daniel Vetter  2012-03-25  563  {
9923777dff4543 Daniel Vetter  2012-04-14  564  	char __user *end = uaddr + size - 1;
f56f821feb7b36 Daniel Vetter  2012-03-25  565  
f56f821feb7b36 Daniel Vetter  2012-03-25  566  	if (unlikely(size == 0))
e23d4159b10916 Al Viro        2016-09-20  567  		return 0;
f56f821feb7b36 Daniel Vetter  2012-03-25  568  
e23d4159b10916 Al Viro        2016-09-20  569  	if (unlikely(uaddr > end))
e23d4159b10916 Al Viro        2016-09-20  570  		return -EFAULT;
f56f821feb7b36 Daniel Vetter  2012-03-25  571  	/*
f56f821feb7b36 Daniel Vetter  2012-03-25  572  	 * Writing zeroes into userspace here is OK, because we know that if
f56f821feb7b36 Daniel Vetter  2012-03-25  573  	 * the zero gets there, we'll be overwriting it.
f56f821feb7b36 Daniel Vetter  2012-03-25  574  	 */
e23d4159b10916 Al Viro        2016-09-20  575  	do {
e23d4159b10916 Al Viro        2016-09-20 @576  		if (unlikely(__put_user(0, uaddr) != 0))
e23d4159b10916 Al Viro        2016-09-20  577  			return -EFAULT;
f56f821feb7b36 Daniel Vetter  2012-03-25  578  		uaddr += PAGE_SIZE;
e23d4159b10916 Al Viro        2016-09-20  579  	} while (uaddr <= end);
f56f821feb7b36 Daniel Vetter  2012-03-25  580  
f56f821feb7b36 Daniel Vetter  2012-03-25  581  	/* Check whether the range spilled into the next page. */
f56f821feb7b36 Daniel Vetter  2012-03-25  582  	if (((unsigned long)uaddr & PAGE_MASK) ==
f56f821feb7b36 Daniel Vetter  2012-03-25  583  			((unsigned long)end & PAGE_MASK))
e23d4159b10916 Al Viro        2016-09-20  584  		return __put_user(0, end);
f56f821feb7b36 Daniel Vetter  2012-03-25  585  
e23d4159b10916 Al Viro        2016-09-20  586  	return 0;
f56f821feb7b36 Daniel Vetter  2012-03-25  587  }
f56f821feb7b36 Daniel Vetter  2012-03-25  588  

:::::: The code at line 576 was first introduced by commit
:::::: e23d4159b109167126e5bcd7f3775c95de7fee47 fix fault_in_multipages_...() on architectures with no-op access_ok()

:::::: TO: Al Viro <viro@ZenIV.linux.org.uk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
