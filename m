Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C1C17C5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 21:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675631016; x=1707167016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mPWnmXgNWyAwE5hkoJEs+DfZza3l1jkDkRiYZDjNxsw=;
  b=haAzXvTty8SZaN+zwYYXRCl1BVZ2+bCHvvaeA2uiwcAFhpOeoJ7r8usX
   +cj28TzpTW4vTofnuBoolvpIxRMP8FLfJtPQvah/Z4eUJmxeEv/FCf04L
   GJeZB+FOiOjO3YA1xjDDJDU2opwIff6+vHbaMdbaYS7/DtaXffhsFVg04
   QWvXFhL+hpfPIX8qy4fY7Td+KOGo25hPSLFy19pF5vVL/7zp6CXB5K9zu
   /70uXtBkueEJLzx67hnvMfxPQs4OHMBDvvr5JjHWNmz1+ssgRmXGOZe3l
   8C0I5ZFIQm4URCm8K/M6mOZrLyBfNp2Y2rIUSxE1mCVAPsmOQlnmYSzNM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="393687463"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="393687463"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 13:03:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="840176269"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="840176269"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Feb 2023 13:03:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOmAf-0002DQ-2R;
	Sun, 05 Feb 2023 21:03:33 +0000
Date: Mon, 6 Feb 2023 05:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:ovl-lazy-lowerdata 1/2] fs/overlayfs/inode.c:256:
 undefined reference to `__divdi3'
Message-ID: <202302060551.1L7Rj2Ss-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux ovl-lazy-lowerdata
head:   815a759a1a03f231d5fc94fcb2de98efac1e184b
commit: 6364ddb1e514220d5b88c3b6b53c040419996c35 [1/2] ovl: add support for "redirect_dir=lazyfollow" on lower only overlay
config: i386-randconfig-a013-20230206 (https://download.01.org/0day-ci/archive/20230206/202302060551.1L7Rj2Ss-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/amir73il/linux/commit/6364ddb1e514220d5b88c3b6b53c040419996c35
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il ovl-lazy-lowerdata
        git checkout 6364ddb1e514220d5b88c3b6b53c040419996c35
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: fs/overlayfs/inode.o: in function `ovl_getattr':
>> fs/overlayfs/inode.c:256: undefined reference to `__divdi3'


vim +256 fs/overlayfs/inode.c

   155	
   156	int ovl_getattr(struct user_namespace *mnt_userns, const struct path *path,
   157			struct kstat *stat, u32 request_mask, unsigned int flags)
   158	{
   159		struct dentry *dentry = path->dentry;
   160		enum ovl_path_type type;
   161		struct path realpath;
   162		const struct cred *old_cred;
   163		struct inode *inode = d_inode(dentry);
   164		bool is_dir = S_ISDIR(inode->i_mode);
   165		int fsid = 0;
   166		int err;
   167		bool metacopy_blocks = false;
   168	
   169		metacopy_blocks = ovl_is_metacopy_dentry(dentry);
   170	
   171		type = ovl_path_real(dentry, &realpath);
   172		old_cred = ovl_override_creds(dentry->d_sb);
   173		err = vfs_getattr(&realpath, stat, request_mask, flags);
   174		if (err)
   175			goto out;
   176	
   177		/* Report the effective immutable/append-only STATX flags */
   178		generic_fill_statx_attr(inode, stat);
   179	
   180		/*
   181		 * For non-dir or same fs, we use st_ino of the copy up origin.
   182		 * This guaranties constant st_dev/st_ino across copy up.
   183		 * With xino feature and non-samefs, we use st_ino of the copy up
   184		 * origin masked with high bits that represent the layer id.
   185		 *
   186		 * If lower filesystem supports NFS file handles, this also guaranties
   187		 * persistent st_ino across mount cycle.
   188		 */
   189		if (!is_dir || ovl_same_dev(dentry->d_sb)) {
   190			if (!OVL_TYPE_UPPER(type)) {
   191				fsid = ovl_layer_lower(dentry)->fsid;
   192			} else if (OVL_TYPE_ORIGIN(type)) {
   193				struct kstat lowerstat;
   194				u32 lowermask = STATX_INO | STATX_BLOCKS |
   195						(!is_dir ? STATX_NLINK : 0);
   196	
   197				ovl_path_lower(dentry, &realpath);
   198				err = vfs_getattr(&realpath, &lowerstat,
   199						  lowermask, flags);
   200				if (err)
   201					goto out;
   202	
   203				/*
   204				 * Lower hardlinks may be broken on copy up to different
   205				 * upper files, so we cannot use the lower origin st_ino
   206				 * for those different files, even for the same fs case.
   207				 *
   208				 * Similarly, several redirected dirs can point to the
   209				 * same dir on a lower layer. With the "verify_lower"
   210				 * feature, we do not use the lower origin st_ino, if
   211				 * we haven't verified that this redirect is unique.
   212				 *
   213				 * With inodes index enabled, it is safe to use st_ino
   214				 * of an indexed origin. The index validates that the
   215				 * upper hardlink is not broken and that a redirected
   216				 * dir is the only redirect to that origin.
   217				 */
   218				if (ovl_test_flag(OVL_INDEX, d_inode(dentry)) ||
   219				    (!ovl_verify_lower(dentry->d_sb) &&
   220				     (is_dir || lowerstat.nlink == 1))) {
   221					fsid = ovl_layer_lower(dentry)->fsid;
   222					stat->ino = lowerstat.ino;
   223				}
   224	
   225				/*
   226				 * If we are querying a metacopy dentry and lower
   227				 * dentry is data dentry, then use the blocks we
   228				 * queried just now. We don't have to do additional
   229				 * vfs_getattr(). If lower itself is metacopy, then
   230				 * additional vfs_getattr() is unavoidable.
   231				 */
   232				if (metacopy_blocks &&
   233				    realpath.dentry == ovl_dentry_lowerdata(dentry)) {
   234					stat->blocks = lowerstat.blocks;
   235					metacopy_blocks = false;
   236				}
   237			}
   238	
   239			if (metacopy_blocks) {
   240				/*
   241				 * If lower is not same as lowerdata or if there was
   242				 * no origin on upper, we can end up here.
   243				 */
   244				struct kstat lowerdatastat;
   245				u32 lowermask = STATX_BLOCKS;
   246	
   247				ovl_path_lowerdata(dentry, &realpath);
   248				if (realpath.dentry) {
   249					err = vfs_getattr(&realpath, &lowerdatastat,
   250							  lowermask, flags);
   251					if (err)
   252						goto out;
   253				} else {
   254					/* TODO: store lowerdata blocks in metacopy xattr? */
   255					lowerdatastat.blocks =
 > 256						DIV_ROUND_UP(stat->size, stat->blksize) << 3;
   257				}
   258				stat->blocks = lowerdatastat.blocks;
   259			}
   260		}
   261	
   262		ovl_map_dev_ino(dentry, stat, fsid);
   263	
   264		/*
   265		 * It's probably not worth it to count subdirs to get the
   266		 * correct link count.  nlink=1 seems to pacify 'find' and
   267		 * other utilities.
   268		 */
   269		if (is_dir && OVL_TYPE_MERGE(type))
   270			stat->nlink = 1;
   271	
   272		/*
   273		 * Return the overlay inode nlinks for indexed upper inodes.
   274		 * Overlay inode nlink counts the union of the upper hardlinks
   275		 * and non-covered lower hardlinks. It does not include the upper
   276		 * index hardlink.
   277		 */
   278		if (!is_dir && ovl_test_flag(OVL_INDEX, d_inode(dentry)))
   279			stat->nlink = dentry->d_inode->i_nlink;
   280	
   281	out:
   282		revert_creds(old_cred);
   283	
   284		return err;
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
