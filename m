Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF931EA8F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 20:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689969619; x=1721505619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L2cX+NTmhpP1iWMJ/fIHwOZz9FB6s7oiU5KrBW8T2kA=;
  b=Y5qFShQty2edsrAhXxkkjfBkGlQfZzmyNaCSeCT9r2AbF6GdHsNgcqeG
   jFpWrayYZGvSVX3SGlg7vPIcrK/HPNanD+TUBvqc3hx8fpLV1w5OaZ12R
   rK2/AZt4CShne6ymt3BHBdF5kC3NULZpoS+sZSh5LX2tepyJ7NXQKahaK
   x7NvgON4jtbLvf5QAAtewwKkJ3ttEWPypPfkgW8CM43TAO9tNWJH3IIjT
   UX/PxL0wI2k7uXeqNar4mtcJWwxPPG7VW3aI8c4K8JaUyp4qwm9Y68vmE
   GRlHaxAx9rc8PL4R3D7AnsYeRsforbnPv0okAC6pBemk6FybBEZqVJFO9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="366000196"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="366000196"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 13:00:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="838683619"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="838683619"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2023 13:00:16 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMwIQ-0007bZ-2p;
	Fri, 21 Jul 2023 20:00:14 +0000
Date: Sat, 22 Jul 2023 03:59:49 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>
Subject: [linux-stable-rc:linux-4.14.y 5002/5021] fs/ext4/ioctl.c:523:7:
 warning: assignment makes integer from pointer without a cast
Message-ID: <202307220313.IvXC4CQm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
head:   5cffa7b2aa8b04d9314eff634a714e0c6fc2b754
commit: c5db0ab1cf73c0d6b3a55de6a6077f6e314dbf6b [5002/5021] ext4: fix to check return value of freeze_bdev() in ext4_shutdown()
config: i386-randconfig-r036-20230720 (https://download.01.org/0day-ci/archive/20230722/202307220313.IvXC4CQm-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220313.IvXC4CQm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220313.IvXC4CQm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ext4/ioctl.c: In function 'ext4_shutdown':
>> fs/ext4/ioctl.c:523:7: warning: assignment makes integer from pointer without a cast [-Wint-conversion]
      ret = freeze_bdev(sb->s_bdev);
          ^


vim +523 fs/ext4/ioctl.c

   500	
   501	static int ext4_shutdown(struct super_block *sb, unsigned long arg)
   502	{
   503		struct ext4_sb_info *sbi = EXT4_SB(sb);
   504		__u32 flags;
   505		int ret;
   506	
   507		if (!capable(CAP_SYS_ADMIN))
   508			return -EPERM;
   509	
   510		if (get_user(flags, (__u32 __user *)arg))
   511			return -EFAULT;
   512	
   513		if (flags > EXT4_GOING_FLAGS_NOLOGFLUSH)
   514			return -EINVAL;
   515	
   516		if (ext4_forced_shutdown(sbi))
   517			return 0;
   518	
   519		ext4_msg(sb, KERN_ALERT, "shut down requested (%d)", flags);
   520	
   521		switch (flags) {
   522		case EXT4_GOING_FLAGS_DEFAULT:
 > 523			ret = freeze_bdev(sb->s_bdev);
   524			if (ret)
   525				return ret;
   526			set_bit(EXT4_FLAGS_SHUTDOWN, &sbi->s_ext4_flags);
   527			thaw_bdev(sb->s_bdev, sb);
   528			break;
   529		case EXT4_GOING_FLAGS_LOGFLUSH:
   530			set_bit(EXT4_FLAGS_SHUTDOWN, &sbi->s_ext4_flags);
   531			if (sbi->s_journal && !is_journal_aborted(sbi->s_journal)) {
   532				(void) ext4_force_commit(sb);
   533				jbd2_journal_abort(sbi->s_journal, -ESHUTDOWN);
   534			}
   535			break;
   536		case EXT4_GOING_FLAGS_NOLOGFLUSH:
   537			set_bit(EXT4_FLAGS_SHUTDOWN, &sbi->s_ext4_flags);
   538			if (sbi->s_journal && !is_journal_aborted(sbi->s_journal))
   539				jbd2_journal_abort(sbi->s_journal, -ESHUTDOWN);
   540			break;
   541		default:
   542			return -EINVAL;
   543		}
   544		clear_opt(sb, DISCARD);
   545		return 0;
   546	}
   547	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
