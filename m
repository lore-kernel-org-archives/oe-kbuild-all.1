Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADA0202C50
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 23:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751067901; cv=none; b=tTKLmyQTAPoqF0oPLF6C7YM0eJGDbHpMQcX36vNOajl196F25ADNJ7KJi83mwT2+jx+uQdmdM3B+v1wl6R8bDEAd4f103QWcM2ZOLTrx4lCJlkH9WA8+8lipVJ0DqKsSzOacGBWB7QZ6x2ti136MUHiEDHtwyVCL7SqFze+Sqys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751067901; c=relaxed/simple;
	bh=VAFXBRL00VkpTV+240+nKVo6pLExqIvKOfj6eECE8cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngYoAdM/3FuphSqlcPI3E+ph/hfq/KaTAruCvoGHFeDjA3cAHg9L3y4FeINBxQwQpJDnIzhpzGWTyt5HQ2bYmH2jg8MhrL3LR7FkrGQ81wcVjK5WZzxFF66B2tKs/ZHBXgXHbx2w6tfP2iF479HtvxCifq21T7xl5N4l/yboYsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXdhd6pl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXdhd6pl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751067898; x=1782603898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VAFXBRL00VkpTV+240+nKVo6pLExqIvKOfj6eECE8cw=;
  b=LXdhd6plPNcg6Gqft3e65d+Rj8DmOUKTVM2/8Y0pESVSCO1PxpCuRqa0
   5KLV5mv4vXvWL6wWDf7Y6FdoarBMZpS2S4NQ5XimAAguUzLcTlljwVzIh
   qMmrIIzqHXbv5tS4ZTt1362eLNc2og/qNl3NKoFyxAODTzyg4cgfVagLw
   DuDtiv5c5vuQl0fJ40jJDAS84ofHrLn9URENgNdS9B+M6WVSGES7slg2z
   7zj0C5pXovJeG5TEsIn1clUCty6Wush5ulPOIMJoKGL8GD8DmIvdbmz3E
   GaOvymL/0ZjT7WhP6B77uO8/HrcME+eEEJkNpa7fz83/qPzy0qLGn3X8+
   g==;
X-CSE-ConnectionGUID: pH5ILtzNR0K9FyBUHKJQ4g==
X-CSE-MsgGUID: n8iV2NPrQVuRzwRZUb4FOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="64739503"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="64739503"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 16:44:58 -0700
X-CSE-ConnectionGUID: s+1MyGS1TXmgnSSdwXmdUQ==
X-CSE-MsgGUID: r4cR46DTSNGcihTAPLdRyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="176614667"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jun 2025 16:44:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVIkY-000Wc2-1m;
	Fri, 27 Jun 2025 23:44:54 +0000
Date: Sat, 28 Jun 2025 07:44:50 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Thumshirn <jth@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 8/9] btrfs: lower log level of relocation messages
Message-ID: <202506280720.2zYUJWXx-lkp@intel.com>
References: <20250627091914.100715-9-jth@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627091914.100715-9-jth@kernel.org>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250626]
[cannot apply to kdave/for-next v6.16-rc3 v6.16-rc2 v6.16-rc1 linus/master v6.16-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Thumshirn/btrfs-zoned-do-not-select-metadata-BG-as-finish-target/20250627-172551
base:   next-20250626
patch link:    https://lore.kernel.org/r/20250627091914.100715-9-jth%40kernel.org
patch subject: [PATCH RFC 8/9] btrfs: lower log level of relocation messages
config: x86_64-buildonly-randconfig-003-20250628 (https://download.01.org/0day-ci/archive/20250628/202506280720.2zYUJWXx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506280720.2zYUJWXx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506280720.2zYUJWXx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/relocation.c: In function 'btrfs_relocate_block_group':
   fs/btrfs/relocation.c:4013:34: warning: variable 'finishes_stage' set but not used [-Wunused-but-set-variable]
    4013 |                 enum reloc_stage finishes_stage;
         |                                  ^~~~~~~~~~~~~~
   fs/btrfs/relocation.c: At top level:
>> fs/btrfs/relocation.c:3899:20: warning: 'stage_to_string' defined but not used [-Wunused-function]
    3899 | static const char *stage_to_string(enum reloc_stage stage)
         |                    ^~~~~~~~~~~~~~~


vim +/stage_to_string +3899 fs/btrfs/relocation.c

ebce0e01b930bf Adam Borowski      2016-11-14  3898  
8daf07cf2b7919 David Sterba       2023-09-22 @3899  static const char *stage_to_string(enum reloc_stage stage)
430640e31649be Qu Wenruo          2019-11-29  3900  {
430640e31649be Qu Wenruo          2019-11-29  3901  	if (stage == MOVE_DATA_EXTENTS)
430640e31649be Qu Wenruo          2019-11-29  3902  		return "move data extents";
430640e31649be Qu Wenruo          2019-11-29  3903  	if (stage == UPDATE_DATA_PTRS)
430640e31649be Qu Wenruo          2019-11-29  3904  		return "update data pointers";
430640e31649be Qu Wenruo          2019-11-29  3905  	return "unknown";
430640e31649be Qu Wenruo          2019-11-29  3906  }
430640e31649be Qu Wenruo          2019-11-29  3907  
5d4f98a28c7d33 Yan Zheng          2009-06-10  3908  /*
5d4f98a28c7d33 Yan Zheng          2009-06-10  3909   * function to relocate all extents in a block group.
5d4f98a28c7d33 Yan Zheng          2009-06-10  3910   */
6bccf3ab1e1f09 Jeff Mahoney       2016-06-21  3911  int btrfs_relocate_block_group(struct btrfs_fs_info *fs_info, u64 group_start)
5d4f98a28c7d33 Yan Zheng          2009-06-10  3912  {
32da5386d9a4fd David Sterba       2019-10-29  3913  	struct btrfs_block_group *bg;
29cbcf401793f4 Josef Bacik        2021-11-05  3914  	struct btrfs_root *extent_root = btrfs_extent_root(fs_info, group_start);
5d4f98a28c7d33 Yan Zheng          2009-06-10  3915  	struct reloc_control *rc;
0af3d00bad38d3 Josef Bacik        2010-06-21  3916  	struct inode *inode;
0af3d00bad38d3 Josef Bacik        2010-06-21  3917  	struct btrfs_path *path;
5d4f98a28c7d33 Yan Zheng          2009-06-10  3918  	int ret;
f0486c68e4bd9a Yan, Zheng         2010-05-16  3919  	int rw = 0;
5d4f98a28c7d33 Yan Zheng          2009-06-10  3920  	int err = 0;
5d4f98a28c7d33 Yan Zheng          2009-06-10  3921  
b4be6aefa73c9a Josef Bacik        2022-02-18  3922  	/*
b4be6aefa73c9a Josef Bacik        2022-02-18  3923  	 * This only gets set if we had a half-deleted snapshot on mount.  We
b4be6aefa73c9a Josef Bacik        2022-02-18  3924  	 * cannot allow relocation to start while we're still trying to clean up
b4be6aefa73c9a Josef Bacik        2022-02-18  3925  	 * these pending deletions.
b4be6aefa73c9a Josef Bacik        2022-02-18  3926  	 */
b4be6aefa73c9a Josef Bacik        2022-02-18  3927  	ret = wait_on_bit(&fs_info->flags, BTRFS_FS_UNFINISHED_DROPS, TASK_INTERRUPTIBLE);
b4be6aefa73c9a Josef Bacik        2022-02-18  3928  	if (ret)
b4be6aefa73c9a Josef Bacik        2022-02-18  3929  		return ret;
b4be6aefa73c9a Josef Bacik        2022-02-18  3930  
b4be6aefa73c9a Josef Bacik        2022-02-18  3931  	/* We may have been woken up by close_ctree, so bail if we're closing. */
b4be6aefa73c9a Josef Bacik        2022-02-18  3932  	if (btrfs_fs_closing(fs_info))
b4be6aefa73c9a Josef Bacik        2022-02-18  3933  		return -EINTR;
b4be6aefa73c9a Josef Bacik        2022-02-18  3934  
eede2bf34f4fa8 Omar Sandoval      2016-11-03  3935  	bg = btrfs_lookup_block_group(fs_info, group_start);
eede2bf34f4fa8 Omar Sandoval      2016-11-03  3936  	if (!bg)
eede2bf34f4fa8 Omar Sandoval      2016-11-03  3937  		return -ENOENT;
eede2bf34f4fa8 Omar Sandoval      2016-11-03  3938  
0320b3538b2b81 Naohiro Aota       2022-03-29  3939  	/*
0320b3538b2b81 Naohiro Aota       2022-03-29  3940  	 * Relocation of a data block group creates ordered extents.  Without
0320b3538b2b81 Naohiro Aota       2022-03-29  3941  	 * sb_start_write(), we can freeze the filesystem while unfinished
0320b3538b2b81 Naohiro Aota       2022-03-29  3942  	 * ordered extents are left. Such ordered extents can cause a deadlock
0320b3538b2b81 Naohiro Aota       2022-03-29  3943  	 * e.g. when syncfs() is waiting for their completion but they can't
0320b3538b2b81 Naohiro Aota       2022-03-29  3944  	 * finish because they block when joining a transaction, due to the
0320b3538b2b81 Naohiro Aota       2022-03-29  3945  	 * fact that the freeze locks are being held in write mode.
0320b3538b2b81 Naohiro Aota       2022-03-29  3946  	 */
0320b3538b2b81 Naohiro Aota       2022-03-29  3947  	if (bg->flags & BTRFS_BLOCK_GROUP_DATA)
0320b3538b2b81 Naohiro Aota       2022-03-29  3948  		ASSERT(sb_write_started(fs_info->sb));
0320b3538b2b81 Naohiro Aota       2022-03-29  3949  
eede2bf34f4fa8 Omar Sandoval      2016-11-03  3950  	if (btrfs_pinned_by_swapfile(fs_info, bg)) {
eede2bf34f4fa8 Omar Sandoval      2016-11-03  3951  		btrfs_put_block_group(bg);
eede2bf34f4fa8 Omar Sandoval      2016-11-03  3952  		return -ETXTBSY;
eede2bf34f4fa8 Omar Sandoval      2016-11-03  3953  	}
eede2bf34f4fa8 Omar Sandoval      2016-11-03  3954  
c258d6e36442eb Qu Wenruo          2019-03-01  3955  	rc = alloc_reloc_control(fs_info);
eede2bf34f4fa8 Omar Sandoval      2016-11-03  3956  	if (!rc) {
eede2bf34f4fa8 Omar Sandoval      2016-11-03  3957  		btrfs_put_block_group(bg);
5d4f98a28c7d33 Yan Zheng          2009-06-10  3958  		return -ENOMEM;
eede2bf34f4fa8 Omar Sandoval      2016-11-03  3959  	}
5d4f98a28c7d33 Yan Zheng          2009-06-10  3960  
907d2710d72754 David Sterba       2021-05-18  3961  	ret = reloc_chunk_start(fs_info);
907d2710d72754 David Sterba       2021-05-18  3962  	if (ret < 0) {
907d2710d72754 David Sterba       2021-05-18  3963  		err = ret;
907d2710d72754 David Sterba       2021-05-18  3964  		goto out_put_bg;
907d2710d72754 David Sterba       2021-05-18  3965  	}
907d2710d72754 David Sterba       2021-05-18  3966  
f0486c68e4bd9a Yan, Zheng         2010-05-16  3967  	rc->extent_root = extent_root;
eede2bf34f4fa8 Omar Sandoval      2016-11-03  3968  	rc->block_group = bg;
5d4f98a28c7d33 Yan Zheng          2009-06-10  3969  
b12de52896c0e8 Qu Wenruo          2019-11-15  3970  	ret = btrfs_inc_block_group_ro(rc->block_group, true);
f0486c68e4bd9a Yan, Zheng         2010-05-16  3971  	if (ret) {
f0486c68e4bd9a Yan, Zheng         2010-05-16  3972  		err = ret;
f0486c68e4bd9a Yan, Zheng         2010-05-16  3973  		goto out;
f0486c68e4bd9a Yan, Zheng         2010-05-16  3974  	}
f0486c68e4bd9a Yan, Zheng         2010-05-16  3975  	rw = 1;
f0486c68e4bd9a Yan, Zheng         2010-05-16  3976  
0af3d00bad38d3 Josef Bacik        2010-06-21  3977  	path = btrfs_alloc_path();
0af3d00bad38d3 Josef Bacik        2010-06-21  3978  	if (!path) {
0af3d00bad38d3 Josef Bacik        2010-06-21  3979  		err = -ENOMEM;
0af3d00bad38d3 Josef Bacik        2010-06-21  3980  		goto out;
0af3d00bad38d3 Josef Bacik        2010-06-21  3981  	}
0af3d00bad38d3 Josef Bacik        2010-06-21  3982  
7949f3392ed65d David Sterba       2019-03-20  3983  	inode = lookup_free_space_inode(rc->block_group, path);
0af3d00bad38d3 Josef Bacik        2010-06-21  3984  	btrfs_free_path(path);
0af3d00bad38d3 Josef Bacik        2010-06-21  3985  
0af3d00bad38d3 Josef Bacik        2010-06-21  3986  	if (!IS_ERR(inode))
20faaab2c32f37 Filipe Manana      2025-03-07  3987  		ret = delete_block_group_cache(rc->block_group, inode, 0);
0af3d00bad38d3 Josef Bacik        2010-06-21  3988  	else
0af3d00bad38d3 Josef Bacik        2010-06-21  3989  		ret = PTR_ERR(inode);
0af3d00bad38d3 Josef Bacik        2010-06-21  3990  
0af3d00bad38d3 Josef Bacik        2010-06-21  3991  	if (ret && ret != -ENOENT) {
0af3d00bad38d3 Josef Bacik        2010-06-21  3992  		err = ret;
0af3d00bad38d3 Josef Bacik        2010-06-21  3993  		goto out;
0af3d00bad38d3 Josef Bacik        2010-06-21  3994  	}
0af3d00bad38d3 Josef Bacik        2010-06-21  3995  
f75a043737ecf1 Filipe Manana      2025-03-07  3996  	rc->data_inode = create_reloc_inode(rc->block_group);
5d4f98a28c7d33 Yan Zheng          2009-06-10  3997  	if (IS_ERR(rc->data_inode)) {
5d4f98a28c7d33 Yan Zheng          2009-06-10  3998  		err = PTR_ERR(rc->data_inode);
5d4f98a28c7d33 Yan Zheng          2009-06-10  3999  		rc->data_inode = NULL;
5d4f98a28c7d33 Yan Zheng          2009-06-10  4000  		goto out;
5d4f98a28c7d33 Yan Zheng          2009-06-10  4001  	}
5d4f98a28c7d33 Yan Zheng          2009-06-10  4002  
17a21d79149b24 Johannes Thumshirn 2024-06-05  4003  	describe_relocation(rc->block_group);
5d4f98a28c7d33 Yan Zheng          2009-06-10  4004  
9cfa3e34e20e67 Filipe Manana      2016-04-26  4005  	btrfs_wait_block_group_reservations(rc->block_group);
f78c436c3931e7 Filipe Manana      2016-05-09  4006  	btrfs_wait_nocow_writers(rc->block_group);
42317ab440c110 David Sterba       2024-05-14  4007  	btrfs_wait_ordered_roots(fs_info, U64_MAX, rc->block_group);
5d4f98a28c7d33 Yan Zheng          2009-06-10  4008  
7ae9bd18032e81 Naohiro Aota       2021-08-19  4009  	ret = btrfs_zone_finish(rc->block_group);
7ae9bd18032e81 Naohiro Aota       2021-08-19  4010  	WARN_ON(ret && ret != -EAGAIN);
7ae9bd18032e81 Naohiro Aota       2021-08-19  4011  
5d4f98a28c7d33 Yan Zheng          2009-06-10  4012  	while (1) {
8daf07cf2b7919 David Sterba       2023-09-22 @4013  		enum reloc_stage finishes_stage;
430640e31649be Qu Wenruo          2019-11-29  4014  
76dda93c6ae2c1 Yan, Zheng         2009-09-21  4015  		mutex_lock(&fs_info->cleaner_mutex);
5d4f98a28c7d33 Yan Zheng          2009-06-10  4016  		ret = relocate_block_group(rc);
76dda93c6ae2c1 Yan, Zheng         2009-09-21  4017  		mutex_unlock(&fs_info->cleaner_mutex);
ff612ba7849964 Josef Bacik        2019-02-25  4018  		if (ret < 0)
5d4f98a28c7d33 Yan Zheng          2009-06-10  4019  			err = ret;
5d4f98a28c7d33 Yan Zheng          2009-06-10  4020  
430640e31649be Qu Wenruo          2019-11-29  4021  		finishes_stage = rc->stage;
ff612ba7849964 Josef Bacik        2019-02-25  4022  		/*
ff612ba7849964 Josef Bacik        2019-02-25  4023  		 * We may have gotten ENOSPC after we already dirtied some
ff612ba7849964 Josef Bacik        2019-02-25  4024  		 * extents.  If writeout happens while we're relocating a
ff612ba7849964 Josef Bacik        2019-02-25  4025  		 * different block group we could end up hitting the
ff612ba7849964 Josef Bacik        2019-02-25  4026  		 * BUG_ON(rc->stage == UPDATE_DATA_PTRS) in
ff612ba7849964 Josef Bacik        2019-02-25  4027  		 * btrfs_reloc_cow_block.  Make sure we write everything out
ff612ba7849964 Josef Bacik        2019-02-25  4028  		 * properly so we don't trip over this problem, and then break
ff612ba7849964 Josef Bacik        2019-02-25  4029  		 * out of the loop if we hit an error.
ff612ba7849964 Josef Bacik        2019-02-25  4030  		 */
5d4f98a28c7d33 Yan Zheng          2009-06-10  4031  		if (rc->stage == MOVE_DATA_EXTENTS && rc->found_file_extent) {
e641e323abb3ce Filipe Manana      2024-05-18  4032  			ret = btrfs_wait_ordered_range(BTRFS_I(rc->data_inode), 0,
0ef8b726075aa6 Josef Bacik        2013-10-25  4033  						       (u64)-1);
ff612ba7849964 Josef Bacik        2019-02-25  4034  			if (ret)
0ef8b726075aa6 Josef Bacik        2013-10-25  4035  				err = ret;
5d4f98a28c7d33 Yan Zheng          2009-06-10  4036  			invalidate_mapping_pages(rc->data_inode->i_mapping,
5d4f98a28c7d33 Yan Zheng          2009-06-10  4037  						 0, -1);
5d4f98a28c7d33 Yan Zheng          2009-06-10  4038  			rc->stage = UPDATE_DATA_PTRS;
5d4f98a28c7d33 Yan Zheng          2009-06-10  4039  		}
ff612ba7849964 Josef Bacik        2019-02-25  4040  
ff612ba7849964 Josef Bacik        2019-02-25  4041  		if (err < 0)
ff612ba7849964 Josef Bacik        2019-02-25  4042  			goto out;
ff612ba7849964 Josef Bacik        2019-02-25  4043  
ff612ba7849964 Josef Bacik        2019-02-25  4044  		if (rc->extents_found == 0)
ff612ba7849964 Josef Bacik        2019-02-25  4045  			break;
ff612ba7849964 Josef Bacik        2019-02-25  4046  
29dfe9961e3037 Johannes Thumshirn 2025-06-27  4047  		btrfs_debug(fs_info, "found %llu extents, stage: %s",
430640e31649be Qu Wenruo          2019-11-29  4048  			   rc->extents_found, stage_to_string(finishes_stage));
5d4f98a28c7d33 Yan Zheng          2009-06-10  4049  	}
5d4f98a28c7d33 Yan Zheng          2009-06-10  4050  
5d4f98a28c7d33 Yan Zheng          2009-06-10  4051  	WARN_ON(rc->block_group->pinned > 0);
5d4f98a28c7d33 Yan Zheng          2009-06-10  4052  	WARN_ON(rc->block_group->reserved > 0);
bf38be65f3703d David Sterba       2019-10-23  4053  	WARN_ON(rc->block_group->used > 0);
5d4f98a28c7d33 Yan Zheng          2009-06-10  4054  out:
f0486c68e4bd9a Yan, Zheng         2010-05-16  4055  	if (err && rw)
2ff7e61e0d30ff Jeff Mahoney       2016-06-22  4056  		btrfs_dec_block_group_ro(rc->block_group);
5d4f98a28c7d33 Yan Zheng          2009-06-10  4057  	iput(rc->data_inode);
907d2710d72754 David Sterba       2021-05-18  4058  out_put_bg:
907d2710d72754 David Sterba       2021-05-18  4059  	btrfs_put_block_group(bg);
907d2710d72754 David Sterba       2021-05-18  4060  	reloc_chunk_end(fs_info);
1a0afa0ecfc4db Josef Bacik        2020-03-04  4061  	free_reloc_control(rc);
5d4f98a28c7d33 Yan Zheng          2009-06-10  4062  	return err;
5d4f98a28c7d33 Yan Zheng          2009-06-10  4063  }
5d4f98a28c7d33 Yan Zheng          2009-06-10  4064  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
