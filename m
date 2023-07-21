Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC3B24176
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 20:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689971502; x=1721507502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=prvvJC/+/81yxVhjKcRaSyEnscky7XCXGMC/xULnQBI=;
  b=QV7JiWHOIdXBbAbATbfAcZQsQyV0xEkZtALhek1ac3iq5OhpiqYDM5R7
   j1HYpiUqQMgOAiGunYExtfyPAlKyS9fdAqxs7OqU4SU2cvpaK94oip2vl
   NmGh9T9Zm/0aSKPkvfKae/jWVFWNN4OxbBpG0OZUCgYpM4VN0mF/jYjCN
   d7GWND89virHefGVUUG7txcwi/mkRN08XxxOoJ3CItbVPvBvwHr3OOhQE
   LLPbSMvLKnE1g+wXa9EnZvUizlhEKK3kz6boVxz3XuEWJIFv0zoZ09zQN
   f1q3h3z+QZZTvqw2BOcP4BDB+Gkup9Lqjgv+TnD6xn/cE342wveX9qUU4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="351998375"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="351998375"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 13:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="898823816"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="898823816"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Jul 2023 13:31:21 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMwmW-0007dz-0u;
	Fri, 21 Jul 2023 20:31:20 +0000
Date: Sat, 22 Jul 2023 04:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>
Subject: [linux-stable-rc:linux-4.19.y 6515/6544] fs/ext4/ioctl.c:583:21:
 warning: assignment to 'int' from 'struct super_block *' makes integer from
 pointer without a cast
Message-ID: <202307220453.tCatLwRG-lkp@intel.com>
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
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230722/202307220453.tCatLwRG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220453.tCatLwRG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220453.tCatLwRG-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
