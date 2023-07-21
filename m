Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF587471
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 20:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689971544; x=1721507544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TXGHrlZDG6/jM4zv52Cer0X/s1/0zTa3sOZMZukh3oo=;
  b=LSxRGfj9slj1x3N1k++7Bah9QmlNTlzLZsUDXd3NPg2OQBrHefkJl7Ut
   p2T97E3BcnbPMRBg5gHSOeDqVyLo/utyr0RJTAOJHk9/eA1lqCuqn311I
   NnaaRoMycfl5rKld1JBacyj7T7UIL63e1spKRM7QYZxYZjQ7SyLIQe9uz
   65qgMPZ2c2Hhhui+kz2tQkMLFkfonQCBg1Im2Op1el3J9GuQsYd+JABpP
   ucMLeEV/W+gY1IKkA7a+LW7nV/HLljM+ngMwssJ3EvCw3cZ4Q3dVzlv+r
   zSDnaaMWmLUhRgovVy52LF3mwzvT1cBODyO88VXLKWhbqbxKWK35AOvgf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="346714695"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="346714695"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 13:32:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="724989259"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="724989259"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Jul 2023 13:32:21 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMwnU-0007e9-18;
	Fri, 21 Jul 2023 20:32:20 +0000
Date: Sat, 22 Jul 2023 04:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>
Subject: [linux-stable-rc:linux-4.19.y 6515/6544] fs/ext4/ioctl.c:583:21:
 warning: assignment to 'int' from 'struct super_block *' makes integer from
 pointer without a cast
Message-ID: <202307220419.LMXn9twJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
head:   71e850d72cc54c75316c30f51b1163a0da4f00e1
commit: c1a588a876df1ca461ee0bc432e78ed7f646ca86 [6515/6544] ext4: fix to check return value of freeze_bdev() in ext4_shutdown()
config: um-defconfig (https://download.01.org/0day-ci/archive/20230722/202307220419.LMXn9twJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220419.LMXn9twJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220419.LMXn9twJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
   In file included from include/linux/uaccess.h:14,
                    from include/linux/compat.h:19,
                    from fs/ext4/ioctl.c:14:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
   arch/um/include/asm/uaccess.h:17:36: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      17 |           (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                                    ^~
   arch/um/include/asm/uaccess.h:45:17: note: in expansion of macro '__access_ok_vsyscall'
      45 |                 __access_ok_vsyscall(addr, size) ||
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:10,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/ext4/ioctl.c:11:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
   include/asm-generic/fixmap.h:31:26: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                          ^~
   include/linux/compiler.h:398:23: note: in definition of macro '__compiletime_assert'
     398 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:418:9: note: in expansion of macro '_compiletime_assert'
     418 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:45:37: note: in expansion of macro 'compiletime_assert'
      45 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:69:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      69 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:31:9: note: in expansion of macro 'BUILD_BUG_ON'
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |         ^~~~~~~~~~~~
   In file included from include/linux/memremap.h:7,
                    from include/linux/mm.h:27,
                    from include/linux/pagemap.h:8,
                    from include/linux/buffer_head.h:14,
                    from include/linux/jbd2.h:26,
                    from fs/ext4/ext4_jbd2.h:16,
                    from fs/ext4/ioctl.c:23:
   include/linux/mm.h: In function 'pgtable_init':
   arch/um/include/asm/pgtable.h:35:33: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      35 | #define pgtable_cache_init() do ; while (0)
         |                                 ^
   include/linux/mm.h:1929:9: note: in expansion of macro 'pgtable_cache_init'
    1929 |         pgtable_cache_init();
         |         ^~~~~~~~~~~~~~~~~~
   fs/ext4/ioctl.c: In function 'ext4_shutdown':
>> fs/ext4/ioctl.c:583:21: warning: assignment to 'int' from 'struct super_block *' makes integer from pointer without a cast [-Wint-conversion]
     583 |                 ret = freeze_bdev(sb->s_bdev);
         |                     ^


vim +583 fs/ext4/ioctl.c

   559	
   560	static int ext4_shutdown(struct super_block *sb, unsigned long arg)
   561	{
   562		struct ext4_sb_info *sbi = EXT4_SB(sb);
   563		__u32 flags;
   564		int ret;
   565	
   566		if (!capable(CAP_SYS_ADMIN))
   567			return -EPERM;
   568	
   569		if (get_user(flags, (__u32 __user *)arg))
   570			return -EFAULT;
   571	
   572		if (flags > EXT4_GOING_FLAGS_NOLOGFLUSH)
   573			return -EINVAL;
   574	
   575		if (ext4_forced_shutdown(sbi))
   576			return 0;
   577	
   578		ext4_msg(sb, KERN_ALERT, "shut down requested (%d)", flags);
   579		trace_ext4_shutdown(sb, flags);
   580	
   581		switch (flags) {
   582		case EXT4_GOING_FLAGS_DEFAULT:
 > 583			ret = freeze_bdev(sb->s_bdev);
   584			if (ret)
   585				return ret;
   586			set_bit(EXT4_FLAGS_SHUTDOWN, &sbi->s_ext4_flags);
   587			thaw_bdev(sb->s_bdev, sb);
   588			break;
   589		case EXT4_GOING_FLAGS_LOGFLUSH:
   590			set_bit(EXT4_FLAGS_SHUTDOWN, &sbi->s_ext4_flags);
   591			if (sbi->s_journal && !is_journal_aborted(sbi->s_journal)) {
   592				(void) ext4_force_commit(sb);
   593				jbd2_journal_abort(sbi->s_journal, -ESHUTDOWN);
   594			}
   595			break;
   596		case EXT4_GOING_FLAGS_NOLOGFLUSH:
   597			set_bit(EXT4_FLAGS_SHUTDOWN, &sbi->s_ext4_flags);
   598			if (sbi->s_journal && !is_journal_aborted(sbi->s_journal))
   599				jbd2_journal_abort(sbi->s_journal, -ESHUTDOWN);
   600			break;
   601		default:
   602			return -EINVAL;
   603		}
   604		clear_opt(sb, DISCARD);
   605		return 0;
   606	}
   607	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
