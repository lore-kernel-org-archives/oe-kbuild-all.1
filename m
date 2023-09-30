Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1517F7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 05:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696050580; x=1727586580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y/jZwekSbV3pSKapKiqMX3AcYg6x8OzHuqPYaoqtruQ=;
  b=Cun07p9XRzn4ieGJVfj3ft+OLWZddn6AU6Snhn8/3Dkdbcd1kyXhFYRD
   JYddjH9QYpr84GO2ApBC/3+rjGL7PqQDqdcRMVH5jPURH/USisqWaG+lD
   xUc9++gZckMobY8YTeHacqGycDeZ3QW7mFePK11+ZB2CPlUdPG8409SH1
   6+UetFwJR4CrWvFFcwPcXESv4DQY7JnrXfUxw6KuAbOnVt1RHdNNfiIVt
   Kl+3bBbFD2FHSMKLhPwxcWWLypeB/D5EruDwq8SM928xEcq79dJNahTIP
   0zg62M/PT6ZdbHrGwkfM0XCQD9Y7kcZZCHuaMpVK6tNF3gt1fFdVtCA3+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="386291864"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="386291864"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 22:09:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="1057984"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Sep 2023 22:09:40 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmSES-0003jD-2Z;
	Sat, 30 Sep 2023 05:09:36 +0000
Date: Sat, 30 Sep 2023 13:09:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 88/90] fs/bcachefs/fs.c:69:26: error: 'struct
 inode' has no member named 'i_atime'; did you mean '__i_atime'?
Message-ID: <202309301204.8eYbAQUO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jeff,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   fdca726b7d8db6c267c18dad9c1f757270d78877
commit: a065266119ed0e14e73a4ccb146c37d90291c964 [88/90] fs: rename inode i_atime and i_mtime fields
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20230930/202309301204.8eYbAQUO-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309301204.8eYbAQUO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301204.8eYbAQUO-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/fs.c: In function 'bch2_inode_update_after_write':
>> fs/bcachefs/fs.c:69:26: error: 'struct inode' has no member named 'i_atime'; did you mean '__i_atime'?
      69 |                 inode->v.i_atime = bch2_time_to_timespec(c, bi->bi_atime);
         |                          ^~~~~~~
         |                          __i_atime
>> fs/bcachefs/fs.c:71:26: error: 'struct inode' has no member named 'i_mtime'; did you mean '__i_mtime'?
      71 |                 inode->v.i_mtime = bch2_time_to_timespec(c, bi->bi_mtime);
         |                          ^~~~~~~
         |                          __i_mtime
   fs/bcachefs/fs.c: In function 'bch2_getattr':
   fs/bcachefs/fs.c:756:36: error: 'struct inode' has no member named 'i_atime'; did you mean '__i_atime'?
     756 |         stat->atime     = inode->v.i_atime;
         |                                    ^~~~~~~
         |                                    __i_atime
   fs/bcachefs/fs.c:757:36: error: 'struct inode' has no member named 'i_mtime'; did you mean '__i_mtime'?
     757 |         stat->mtime     = inode->v.i_mtime;
         |                                    ^~~~~~~
         |                                    __i_mtime
   fs/bcachefs/fs.c: In function 'inode_update_times_fn':
   fs/bcachefs/fs.c:1421:61: error: 'struct inode' has no member named 'i_atime'; did you mean '__i_atime'?
    1421 |         bi->bi_atime    = timespec_to_bch2_time(c, inode->v.i_atime);
         |                                                             ^~~~~~~
         |                                                             __i_atime
   fs/bcachefs/fs.c:1422:61: error: 'struct inode' has no member named 'i_mtime'; did you mean '__i_mtime'?
    1422 |         bi->bi_mtime    = timespec_to_bch2_time(c, inode->v.i_mtime);
         |                                                             ^~~~~~~
         |                                                             __i_mtime


vim +69 fs/bcachefs/fs.c

e0750d9473522d Kent Overstreet 2017-03-16  44  
2394d5f4210bc0 Kent Overstreet 2021-11-06  45  static void bch2_vfs_inode_init(struct btree_trans *, subvol_inum,
e0750d9473522d Kent Overstreet 2017-03-16  46  				struct bch_inode_info *,
5f00f0e5843e03 Kent Overstreet 2021-10-27  47  				struct bch_inode_unpacked *,
5f00f0e5843e03 Kent Overstreet 2021-10-27  48  				struct bch_subvolume *);
e0750d9473522d Kent Overstreet 2017-03-16  49  
2394d5f4210bc0 Kent Overstreet 2021-11-06  50  void bch2_inode_update_after_write(struct btree_trans *trans,
e0750d9473522d Kent Overstreet 2017-03-16  51  				   struct bch_inode_info *inode,
e0750d9473522d Kent Overstreet 2017-03-16  52  				   struct bch_inode_unpacked *bi,
e0750d9473522d Kent Overstreet 2017-03-16  53  				   unsigned fields)
e0750d9473522d Kent Overstreet 2017-03-16  54  {
2394d5f4210bc0 Kent Overstreet 2021-11-06  55  	struct bch_fs *c = trans->c;
2394d5f4210bc0 Kent Overstreet 2021-11-06  56  
2394d5f4210bc0 Kent Overstreet 2021-11-06  57  	BUG_ON(bi->bi_inum != inode->v.i_ino);
2394d5f4210bc0 Kent Overstreet 2021-11-06  58  
2394d5f4210bc0 Kent Overstreet 2021-11-06  59  	bch2_assert_pos_locked(trans, BTREE_ID_inodes,
2394d5f4210bc0 Kent Overstreet 2021-11-06  60  			       POS(0, bi->bi_inum),
0725e71bbf81cb Kent Overstreet 2022-01-12  61  			       c->opts.inodes_use_key_cache);
2394d5f4210bc0 Kent Overstreet 2021-11-06  62  
5d338cc9deb8b7 Kent Overstreet 2019-09-25  63  	set_nlink(&inode->v, bch2_inode_nlink_get(bi));
e0750d9473522d Kent Overstreet 2017-03-16  64  	i_uid_write(&inode->v, bi->bi_uid);
e0750d9473522d Kent Overstreet 2017-03-16  65  	i_gid_write(&inode->v, bi->bi_gid);
e0750d9473522d Kent Overstreet 2017-03-16  66  	inode->v.i_mode	= bi->bi_mode;
e0750d9473522d Kent Overstreet 2017-03-16  67  
e0750d9473522d Kent Overstreet 2017-03-16  68  	if (fields & ATTR_ATIME)
e0750d9473522d Kent Overstreet 2017-03-16 @69  		inode->v.i_atime = bch2_time_to_timespec(c, bi->bi_atime);
e0750d9473522d Kent Overstreet 2017-03-16  70  	if (fields & ATTR_MTIME)
e0750d9473522d Kent Overstreet 2017-03-16 @71  		inode->v.i_mtime = bch2_time_to_timespec(c, bi->bi_mtime);
e0750d9473522d Kent Overstreet 2017-03-16  72  	if (fields & ATTR_CTIME)
e0750d9473522d Kent Overstreet 2017-03-16  73  		inode_set_ctime_to_ts(&inode->v, bch2_time_to_timespec(c, bi->bi_ctime));
e0750d9473522d Kent Overstreet 2017-03-16  74  
e0750d9473522d Kent Overstreet 2017-03-16  75  	inode->ei_inode		= *bi;
ba279570ae8228 Kent Overstreet 2018-07-17  76  
ba279570ae8228 Kent Overstreet 2018-07-17  77  	bch2_inode_flags_to_vfs(inode);
e0750d9473522d Kent Overstreet 2017-03-16  78  }
e0750d9473522d Kent Overstreet 2017-03-16  79  

:::::: The code at line 69 was first introduced by commit
:::::: e0750d9473522d076b33ee257a21e27a5dd75031 bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
