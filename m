Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B331E63A8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 14:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694097188; x=1725633188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7apOuL/mejNhHkNk6NKRAOVcxpmApJbfBJCvshK+kuc=;
  b=FUCMAYpPOxj03glv2HiF/5Rz+qF03F72AdlI40TlJVeFxuNayy9fiF+Z
   8cHg+kmVDWPIBFeAEEnm8+lOs8DA8C4q3IWxVw6qglmDvrZ9BeznpawvP
   AWHXtkf5EGavEpWhBR6FgSMKjfFsQjVc3JNFRhzpKec+V7OV67+CULPpx
   41CU5BipMrSsiMfj6FtiOxnysNi8lvhgik8+YX0FokBWgPq2AvcZbWo40
   hSAItw4eRnqLoD/V1LKC8pJUtwpJRGC6pRKO0x4SixgZokTtBOQlVkkdH
   w7SpSbpQgVkq/9l8cYSxKxtvQeBeAA+RqRD8klbCsQBXG2kZpa16iVO3s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="357681713"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="357681713"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 07:33:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="807565894"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="807565894"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Sep 2023 07:33:06 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeG48-0001Hf-1z;
	Thu, 07 Sep 2023 14:33:04 +0000
Date: Thu, 7 Sep 2023 22:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 39/159] fs/quota/dquot.c:2547:1:
 warning: label 'out' defined but not used
Message-ID: <202309072223.H1gwBm5W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   de158c39329c476963b106f32fc47e0ea04b4f48
commit: 207417a471846c9dc5c478331d650180e61251c1 [39/159] new helper: lookup_positive_unlocked()
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230907/202309072223.H1gwBm5W-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309072223.H1gwBm5W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309072223.H1gwBm5W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/quota/dquot.c: In function 'remove_dquot_ref':
   fs/quota/dquot.c:1059:13: warning: variable 'reserved' set but not used [-Wunused-but-set-variable]
    1059 |         int reserved = 0;
         |             ^~~~~~~~
   fs/quota/dquot.c: In function 'dquot_quota_on_mount':
>> fs/quota/dquot.c:2547:1: warning: label 'out' defined but not used [-Wunused-label]
    2547 | out:
         | ^~~


vim +/out +2547 fs/quota/dquot.c

f55abc0fb9c318 fs/dquot.c       Jan Kara          2008-08-20  2527  
^1da177e4c3f41 fs/dquot.c       Linus Torvalds    2005-04-16  2528  /*
^1da177e4c3f41 fs/dquot.c       Linus Torvalds    2005-04-16  2529   * This function is used when filesystem needs to initialize quotas
^1da177e4c3f41 fs/dquot.c       Linus Torvalds    2005-04-16  2530   * during mount time.
^1da177e4c3f41 fs/dquot.c       Linus Torvalds    2005-04-16  2531   */
287a80958cf63f fs/quota/dquot.c Christoph Hellwig 2010-05-19  2532  int dquot_quota_on_mount(struct super_block *sb, char *qf_name,
84de856ed30c56 fs/dquot.c       Christoph Hellwig 2005-06-23  2533  		int format_id, int type)
^1da177e4c3f41 fs/dquot.c       Linus Torvalds    2005-04-16  2534  {
84de856ed30c56 fs/dquot.c       Christoph Hellwig 2005-06-23  2535  	struct dentry *dentry;
^1da177e4c3f41 fs/dquot.c       Linus Torvalds    2005-04-16  2536  	int error;
^1da177e4c3f41 fs/dquot.c       Linus Torvalds    2005-04-16  2537  
207417a471846c fs/quota/dquot.c Al Viro           2019-10-31  2538  	dentry = lookup_positive_unlocked(qf_name, sb->s_root, strlen(qf_name));
84de856ed30c56 fs/dquot.c       Christoph Hellwig 2005-06-23  2539  	if (IS_ERR(dentry))
84de856ed30c56 fs/dquot.c       Christoph Hellwig 2005-06-23  2540  		return PTR_ERR(dentry);
84de856ed30c56 fs/dquot.c       Christoph Hellwig 2005-06-23  2541  
^1da177e4c3f41 fs/dquot.c       Linus Torvalds    2005-04-16  2542  	error = security_quota_on(dentry);
84de856ed30c56 fs/dquot.c       Christoph Hellwig 2005-06-23  2543  	if (!error)
dea655c28a32ac fs/quota/dquot.c David Howells     2015-03-17  2544  		error = vfs_load_quota_inode(d_inode(dentry), type, format_id,
f55abc0fb9c318 fs/dquot.c       Jan Kara          2008-08-20  2545  				DQUOT_USAGE_ENABLED | DQUOT_LIMITS_ENABLED);
84de856ed30c56 fs/dquot.c       Christoph Hellwig 2005-06-23  2546  
154f484b92e5c2 fs/dquot.c       Jan Kara          2005-11-28 @2547  out:
84de856ed30c56 fs/dquot.c       Christoph Hellwig 2005-06-23  2548  	dput(dentry);
^1da177e4c3f41 fs/dquot.c       Linus Torvalds    2005-04-16  2549  	return error;
^1da177e4c3f41 fs/dquot.c       Linus Torvalds    2005-04-16  2550  }
287a80958cf63f fs/quota/dquot.c Christoph Hellwig 2010-05-19  2551  EXPORT_SYMBOL(dquot_quota_on_mount);
b85f4b87a511be fs/dquot.c       Jan Kara          2008-07-25  2552  

:::::: The code at line 2547 was first introduced by commit
:::::: 154f484b92e5c25c400f6903512c511644a49322 [PATCH] Fix oops in vfs_quotaon_mount()

:::::: TO: Jan Kara <jack@suse.cz>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
