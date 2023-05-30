Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A8BA42
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 02:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685412248; x=1716948248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FpkQ0vHoqKrUsMTMRxQ12yqMhqXIaDrJjsqXQUqfy6c=;
  b=LMDmvtU4DlKW9MGbknjl3c3r9JduQNR/opYWy/OsmgPme6yN019P5HpH
   CyqEDwvBSwooLO+OyOcNbc3e4EbIDNb27g6FK5pawxoRyU5EvseruofRW
   gb6XJlDzHH9yPsbORFqKdCAdWSXpfEYya5giAAe4pP3nl46JKz+elbXm6
   CwgXfbq/P1bqO9ypAZjfN097EDIVXmGLjpwrFtQkoQfyhzzSlpYK3Tw8F
   dmqNtM+RAMiqzeLiOdECnqRG6MD29uIsG0bnT22DQVRL5Lb5LTDrb6zxj
   N5KkE2Qn0TykrnInx3nUVB7i+qjrL/pPy2gRp9kdSoFY3tXxTs1WPUm1V
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="441153136"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="441153136"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 19:04:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="706233365"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="706233365"
Received: from lkp-server01.sh.intel.com (HELO fd90924b3b99) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 May 2023 19:04:06 -0700
Received: from kbuild by fd90924b3b99 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3oiT-00006a-2O;
	Tue, 30 May 2023 02:04:05 +0000
Date: Tue, 30 May 2023 10:03:14 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:dev-test 16/17] fs/f2fs/super.c:2944 f2fs_quota_on() warn:
 inconsistent indenting
Message-ID: <202305300911.QPCoh4Iw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
head:   5f71e655aac3f11bc19925d6966dae7a4ec57025
commit: 1b5a6675262efcfd1bd9bf8dd60e4134c4c811d3 [16/17] f2fs: avoid dead loop in f2fs_issue_checkpoint()
config: x86_64-randconfig-m001-20230528 (https://download.01.org/0day-ci/archive/20230530/202305300911.QPCoh4Iw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305300911.QPCoh4Iw-lkp@intel.com/

New smatch warnings:
fs/f2fs/super.c:2944 f2fs_quota_on() warn: inconsistent indenting

Old smatch warnings:
fs/f2fs/super.c:3966 read_raw_super_block() warn: possible memory leak of 'super'

vim +2944 fs/f2fs/super.c

  2917	
  2918	static int f2fs_quota_on(struct super_block *sb, int type, int format_id,
  2919								const struct path *path)
  2920	{
  2921		struct inode *inode;
  2922		int err;
  2923	
  2924		/* if quota sysfile exists, deny enabling quota with specific file */
  2925		if (f2fs_sb_has_quota_ino(F2FS_SB(sb))) {
  2926			f2fs_err(F2FS_SB(sb), "quota sysfile already exists");
  2927			return -EBUSY;
  2928		}
  2929	
  2930		if (path->dentry->d_sb != sb)
  2931			return -EXDEV;
  2932	
  2933		err = f2fs_quota_sync(sb, type);
  2934		if (err)
  2935			return err;
  2936	
  2937		inode = d_inode(path->dentry);
  2938	
  2939		err = filemap_fdatawrite(inode->i_mapping);
  2940		if (err)
  2941			return err;
  2942	
  2943		err = filemap_fdatawait(inode->i_mapping);
> 2944			if (err)
  2945				return err;
  2946	
  2947		err = dquot_quota_on(sb, type, format_id, path);
  2948		if (err)
  2949			return err;
  2950	
  2951		inode_lock(inode);
  2952		F2FS_I(inode)->i_flags |= F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL;
  2953		f2fs_set_inode_flags(inode);
  2954		inode_unlock(inode);
  2955		f2fs_mark_inode_dirty_sync(inode, false);
  2956	
  2957		return 0;
  2958	}
  2959	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
