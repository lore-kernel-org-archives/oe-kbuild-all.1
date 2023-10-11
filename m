Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED601F182
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 13:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdlchRO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697030135; x=1728566135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zq3CJhJQjMrxWDHEiIdMuOGv/aoTuUem72+4WmGtvzc=;
  b=cdlchRO92r8EM6Q6ZB4ZcxFsmWV+jLLE2eaIPT6DxrK0+0aJCIeCGS5/
   cs3D5NeFxiaPWeYI6wZBp8rUXHb7OyTyePPL6FYFLk7ku3fLpLFXqAnej
   fqvqb/5kr+a1qY7xCU89TLuw6teRdVZ8WVMHod4l8FSdkhMefKIiisuFT
   lrJRFjHAjMYTEjM0XauGnxl04pOajeyqLatf1D5WAvO74rMz7IQzyGZTn
   KQl1nQXuTpoNiIoqdy1+soLHhf95dfBqu03Z5v34q5E+VN5Ae89nPonhR
   QSicoYLkc6KVT/zjv5PUmzzh2reF1ga7ZOW/gjfp598lFV+lsYNg1jplQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364945054"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="364945054"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 06:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="783235566"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="783235566"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 11 Oct 2023 06:15:33 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqZ3j-0002E9-0M;
	Wed, 11 Oct 2023 13:15:31 +0000
Date: Wed, 11 Oct 2023 21:14:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:bakeathon 10/13] fs/xfs/xfs_iops.c:562:33: warning: unused
 variable 'ctime'
Message-ID: <202310112104.mXxRmLH1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git bakeathon
head:   fb68ac18df9442a3a064e632eff09cf184aacb23
commit: c976d1f74f46996460393051a6d6744a20795886 [10/13] xfs: switch to multigrain timestamps
config: arc-randconfig-001-20231011 (https://download.01.org/0day-ci/archive/20231011/202310112104.mXxRmLH1-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310112104.mXxRmLH1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310112104.mXxRmLH1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/xfs/xfs_iops.c: In function 'xfs_vn_getattr':
>> fs/xfs/xfs_iops.c:562:33: warning: unused variable 'ctime' [-Wunused-variable]
     562 |         struct timespec64       ctime;
         |                                 ^~~~~


vim +/ctime +562 fs/xfs/xfs_iops.c

   548	
   549	STATIC int
   550	xfs_vn_getattr(
   551		struct mnt_idmap	*idmap,
   552		const struct path	*path,
   553		struct kstat		*stat,
   554		u32			request_mask,
   555		unsigned int		query_flags)
   556	{
   557		struct inode		*inode = d_inode(path->dentry);
   558		struct xfs_inode	*ip = XFS_I(inode);
   559		struct xfs_mount	*mp = ip->i_mount;
   560		vfsuid_t		vfsuid = i_uid_into_vfsuid(idmap, inode);
   561		vfsgid_t		vfsgid = i_gid_into_vfsgid(idmap, inode);
 > 562		struct timespec64	ctime;
   563	
   564		trace_xfs_getattr(ip);
   565	
   566		if (xfs_is_shutdown(mp))
   567			return -EIO;
   568	
   569		stat->size = XFS_ISIZE(ip);
   570		stat->dev = inode->i_sb->s_dev;
   571		stat->mode = inode->i_mode;
   572		stat->nlink = inode->i_nlink;
   573		stat->uid = vfsuid_into_kuid(vfsuid);
   574		stat->gid = vfsgid_into_kgid(vfsgid);
   575		stat->ino = ip->i_ino;
   576		stat->atime = inode_get_atime(inode);
   577		fill_mg_cmtime(stat, request_mask, inode);
   578	
   579		stat->blocks = XFS_FSB_TO_BB(mp, ip->i_nblocks + ip->i_delayed_blks);
   580	
   581		if (xfs_has_v3inodes(mp)) {
   582			if (request_mask & STATX_BTIME) {
   583				stat->result_mask |= STATX_BTIME;
   584				stat->btime = ip->i_crtime;
   585			}
   586		}
   587	
   588		/*
   589		 * Note: If you add another clause to set an attribute flag, please
   590		 * update attributes_mask below.
   591		 */
   592		if (ip->i_diflags & XFS_DIFLAG_IMMUTABLE)
   593			stat->attributes |= STATX_ATTR_IMMUTABLE;
   594		if (ip->i_diflags & XFS_DIFLAG_APPEND)
   595			stat->attributes |= STATX_ATTR_APPEND;
   596		if (ip->i_diflags & XFS_DIFLAG_NODUMP)
   597			stat->attributes |= STATX_ATTR_NODUMP;
   598	
   599		stat->attributes_mask |= (STATX_ATTR_IMMUTABLE |
   600					  STATX_ATTR_APPEND |
   601					  STATX_ATTR_NODUMP);
   602	
   603		switch (inode->i_mode & S_IFMT) {
   604		case S_IFBLK:
   605		case S_IFCHR:
   606			stat->blksize = BLKDEV_IOSIZE;
   607			stat->rdev = inode->i_rdev;
   608			break;
   609		case S_IFREG:
   610			if (request_mask & STATX_DIOALIGN) {
   611				struct xfs_buftarg	*target = xfs_inode_buftarg(ip);
   612				struct block_device	*bdev = target->bt_bdev;
   613	
   614				stat->result_mask |= STATX_DIOALIGN;
   615				stat->dio_mem_align = bdev_dma_alignment(bdev) + 1;
   616				stat->dio_offset_align = bdev_logical_block_size(bdev);
   617			}
   618			fallthrough;
   619		default:
   620			stat->blksize = xfs_stat_blksize(ip);
   621			stat->rdev = 0;
   622			break;
   623		}
   624	
   625		return 0;
   626	}
   627	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
