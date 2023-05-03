Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27453BE74
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 May 2023 23:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683156159; x=1714692159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FhNGHK9radEbFjqZIqKlwWVW1L5iiVEFVso0iXe3Y2Q=;
  b=B/Oo4AqErSpneNnN0YIG2JueuueydXv3E+n0jRFP769j1PNSsg/nx5BM
   LWZk5t+lsg9iLqSTUJgoBqtu1951U+mr35TrqP5ILlLUwMxNp0FfCero7
   5APmcUXmpVZOVZHThOcDjAJ9UBijLK752hTXZW77LjVA3CwhAI3ltnRau
   oR9J3SLKBil17Am/jOo5dAJdasnM/ACdr9YUAP7hzU0jdpdImQEyWp77r
   7pEb8ughnrDFGUT4gM0Z6U06sY1kdHpR3O5JwYZpZA7ClOrLZ215Tv+UK
   RJN/9BuVroNaA3kKI47txvwNuSlE6tYUQld5rBwerDFNEVBdSXG8RiOB4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="414252366"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="414252366"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 16:22:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="696780324"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="696780324"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 May 2023 16:22:37 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puLnw-0002Lf-2f;
	Wed, 03 May 2023 23:22:36 +0000
Date: Thu, 4 May 2023 07:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: John Garry <john.g.garry@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 12/16] xfs: Add support for fallocate2
Message-ID: <202305040731.Y9a7CSnL-lkp@intel.com>
References: <20230503183821.1473305-13-john.g.garry@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503183821.1473305-13-john.g.garry@oracle.com>

Hi John,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on axboe-block/for-next mkp-scsi/for-next jejb-scsi/for-next v6.3]
[cannot apply to linus/master next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Garry/block-Add-atomic-write-operations-to-request_queue-limits/20230504-041447
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20230503183821.1473305-13-john.g.garry%40oracle.com
patch subject: [PATCH RFC 12/16] xfs: Add support for fallocate2
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230504/202305040731.Y9a7CSnL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c039ce328d699bc17e06c03a18cf8674fc707ffb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review John-Garry/block-Add-atomic-write-operations-to-request_queue-limits/20230504-041447
        git checkout c039ce328d699bc17e06c03a18cf8674fc707ffb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305040731.Y9a7CSnL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_file.c:887:1: warning: no previous prototype for '_xfs_file_fallocate' [-Wmissing-prototypes]
     887 | _xfs_file_fallocate(
         | ^~~~~~~~~~~~~~~~~~~


vim +/_xfs_file_fallocate +887 fs/xfs/xfs_file.c

   880	
   881	#define	XFS_FALLOC_FL_SUPPORTED						\
   882			(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE |		\
   883			 FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_ZERO_RANGE |	\
   884			 FALLOC_FL_INSERT_RANGE | FALLOC_FL_UNSHARE_RANGE)
   885	
   886	long
 > 887	_xfs_file_fallocate(
   888		struct file		*file,
   889		int			mode,
   890		loff_t			offset,
   891		loff_t			len,
   892		loff_t 			alignment)
   893	{
   894		struct inode		*inode = file_inode(file);
   895		struct xfs_inode	*ip = XFS_I(inode);
   896		long			error;
   897		uint			iolock = XFS_IOLOCK_EXCL | XFS_MMAPLOCK_EXCL;
   898		loff_t			new_size = 0;
   899		bool			do_file_insert = false;
   900	
   901		if (!S_ISREG(inode->i_mode))
   902			return -EINVAL;
   903		if (mode & ~XFS_FALLOC_FL_SUPPORTED)
   904			return -EOPNOTSUPP;
   905	
   906		xfs_ilock(ip, iolock);
   907		error = xfs_break_layouts(inode, &iolock, BREAK_UNMAP);
   908		if (error)
   909			goto out_unlock;
   910	
   911		/*
   912		 * Must wait for all AIO to complete before we continue as AIO can
   913		 * change the file size on completion without holding any locks we
   914		 * currently hold. We must do this first because AIO can update both
   915		 * the on disk and in memory inode sizes, and the operations that follow
   916		 * require the in-memory size to be fully up-to-date.
   917		 */
   918		inode_dio_wait(inode);
   919	
   920		/*
   921		 * Now AIO and DIO has drained we flush and (if necessary) invalidate
   922		 * the cached range over the first operation we are about to run.
   923		 *
   924		 * We care about zero and collapse here because they both run a hole
   925		 * punch over the range first. Because that can zero data, and the range
   926		 * of invalidation for the shift operations is much larger, we still do
   927		 * the required flush for collapse in xfs_prepare_shift().
   928		 *
   929		 * Insert has the same range requirements as collapse, and we extend the
   930		 * file first which can zero data. Hence insert has the same
   931		 * flush/invalidate requirements as collapse and so they are both
   932		 * handled at the right time by xfs_prepare_shift().
   933		 */
   934		if (mode & (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_ZERO_RANGE |
   935			    FALLOC_FL_COLLAPSE_RANGE)) {
   936			error = xfs_flush_unmap_range(ip, offset, len);
   937			if (error)
   938				goto out_unlock;
   939		}
   940	
   941		error = file_modified(file);
   942		if (error)
   943			goto out_unlock;
   944	
   945		if (mode & FALLOC_FL_PUNCH_HOLE) {
   946			error = xfs_free_file_space(ip, offset, len);
   947			if (error)
   948				goto out_unlock;
   949		} else if (mode & FALLOC_FL_COLLAPSE_RANGE) {
   950			if (!xfs_is_falloc_aligned(ip, offset, len)) {
   951				error = -EINVAL;
   952				goto out_unlock;
   953			}
   954	
   955			/*
   956			 * There is no need to overlap collapse range with EOF,
   957			 * in which case it is effectively a truncate operation
   958			 */
   959			if (offset + len >= i_size_read(inode)) {
   960				error = -EINVAL;
   961				goto out_unlock;
   962			}
   963	
   964			new_size = i_size_read(inode) - len;
   965	
   966			error = xfs_collapse_file_space(ip, offset, len);
   967			if (error)
   968				goto out_unlock;
   969		} else if (mode & FALLOC_FL_INSERT_RANGE) {
   970			loff_t		isize = i_size_read(inode);
   971	
   972			if (!xfs_is_falloc_aligned(ip, offset, len)) {
   973				error = -EINVAL;
   974				goto out_unlock;
   975			}
   976	
   977			/*
   978			 * New inode size must not exceed ->s_maxbytes, accounting for
   979			 * possible signed overflow.
   980			 */
   981			if (inode->i_sb->s_maxbytes - isize < len) {
   982				error = -EFBIG;
   983				goto out_unlock;
   984			}
   985			new_size = isize + len;
   986	
   987			/* Offset should be less than i_size */
   988			if (offset >= isize) {
   989				error = -EINVAL;
   990				goto out_unlock;
   991			}
   992			do_file_insert = true;
   993		} else {
   994			if (!(mode & FALLOC_FL_KEEP_SIZE) &&
   995			    offset + len > i_size_read(inode)) {
   996				new_size = offset + len;
   997				error = inode_newsize_ok(inode, new_size);
   998				if (error)
   999					goto out_unlock;
  1000			}
  1001	
  1002			if (mode & FALLOC_FL_ZERO_RANGE) {
  1003				/*
  1004				 * Punch a hole and prealloc the range.  We use a hole
  1005				 * punch rather than unwritten extent conversion for two
  1006				 * reasons:
  1007				 *
  1008				 *   1.) Hole punch handles partial block zeroing for us.
  1009				 *   2.) If prealloc returns ENOSPC, the file range is
  1010				 *       still zero-valued by virtue of the hole punch.
  1011				 */
  1012				unsigned int blksize = i_blocksize(inode);
  1013	
  1014				trace_xfs_zero_file_space(ip);
  1015	
  1016				error = xfs_free_file_space(ip, offset, len);
  1017				if (error)
  1018					goto out_unlock;
  1019	
  1020				len = round_up(offset + len, blksize) -
  1021				      round_down(offset, blksize);
  1022				offset = round_down(offset, blksize);
  1023			} else if (mode & FALLOC_FL_UNSHARE_RANGE) {
  1024				error = xfs_reflink_unshare(ip, offset, len);
  1025				if (error)
  1026					goto out_unlock;
  1027			} else {
  1028				/*
  1029				 * If always_cow mode we can't use preallocations and
  1030				 * thus should not create them.
  1031				 */
  1032				if (xfs_is_always_cow_inode(ip)) {
  1033					error = -EOPNOTSUPP;
  1034					goto out_unlock;
  1035				}
  1036			}
  1037	
  1038			if (!xfs_is_always_cow_inode(ip)) {
  1039				error = xfs_alloc_file_space(ip, offset, len, alignment);
  1040				if (error)
  1041					goto out_unlock;
  1042			}
  1043		}
  1044	
  1045		/* Change file size if needed */
  1046		if (new_size) {
  1047			struct iattr iattr;
  1048	
  1049			iattr.ia_valid = ATTR_SIZE;
  1050			iattr.ia_size = new_size;
  1051			error = xfs_vn_setattr_size(file_mnt_idmap(file),
  1052						    file_dentry(file), &iattr);
  1053			if (error)
  1054				goto out_unlock;
  1055		}
  1056	
  1057		/*
  1058		 * Perform hole insertion now that the file size has been
  1059		 * updated so that if we crash during the operation we don't
  1060		 * leave shifted extents past EOF and hence losing access to
  1061		 * the data that is contained within them.
  1062		 */
  1063		if (do_file_insert) {
  1064			error = xfs_insert_file_space(ip, offset, len);
  1065			if (error)
  1066				goto out_unlock;
  1067		}
  1068	
  1069		if (xfs_file_sync_writes(file))
  1070			error = xfs_log_force_inode(ip);
  1071	
  1072	out_unlock:
  1073		xfs_iunlock(ip, iolock);
  1074		return error;
  1075	}
  1076	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
