Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFCE8C1B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686731535; x=1718267535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WucSbq2K4kR853zKx414lhpfu5VLT6dQ6KbfH+gmmb0=;
  b=Ylmqwo14tj8glPtmRzTlpAxqVLoKsTh81LS525hFuyspVQ1qBRa0c+35
   bc+PUfaLWF85ClTbkSgqy03d7TD2k6qXdjYvehnz1ZhuM/TS+ylqMsrTu
   wa/0tetn0c3KYf1eSH7alEieWLDevAt7AHtckGSzm+LwxeE5xesWe7NgL
   LZsKo+oBerIuixcROPS5JEThPb0hzvS03FPnLIHrqLXqGjTN/ZVuF5Gx+
   DFmZBryGX75idh6MrxwbSmLVKgxfHkuDTcN/XWF6A3ueBBBdR/0IWbbL9
   NgA5n7TGWJUIM7JCpCTZZHAjT0VT6R/tqZJhfF21m+3CKX+UstdU81v6e
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="361037774"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="361037774"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 01:32:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="836196069"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="836196069"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Jun 2023 01:32:13 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9LvI-0000R7-0c;
	Wed, 14 Jun 2023 08:32:12 +0000
Date: Wed, 14 Jun 2023 16:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_pre_modify 26/29] fs/ksmbd/vfs.c:683:49: error:
 passing argument 4 of 'vfs_path_parent_lookup' from incompatible pointer
 type
Message-ID: <202306141658.BwF1qKuS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fan_pre_modify
head:   d1e12ae958a97a287b314353957ab3c2e110af74
commit: d1db97dbadc9149238922cf27f79e332c521e02c [26/29] fsnotify: prepare for directory entry pre-modify permission events
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230614/202306141658.BwF1qKuS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/amir73il/linux/commit/d1db97dbadc9149238922cf27f79e332c521e02c
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il fan_pre_modify
        git checkout d1db97dbadc9149238922cf27f79e332c521e02c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306141658.BwF1qKuS-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ksmbd/vfs.c: In function 'ksmbd_vfs_rename':
>> fs/ksmbd/vfs.c:683:49: error: passing argument 4 of 'vfs_path_parent_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
     683 |                                      &new_path, &new_last, &new_type,
         |                                                 ^~~~~~~~~
         |                                                 |
         |                                                 struct qstr *
   In file included from fs/ksmbd/vfs.c:21:
   include/linux/namei.h:84:71: note: expected 'struct lookup_result *' but argument is of type 'struct qstr *'
      84 |                            struct path *parent, struct lookup_result *res,
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~^~~
   fs/ksmbd/vfs.c:683:60: error: passing argument 5 of 'vfs_path_parent_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
     683 |                                      &new_path, &new_last, &new_type,
         |                                                            ^~~~~~~~~
         |                                                            |
         |                                                            int *
   include/linux/namei.h:85:47: note: expected 'const struct path *' but argument is of type 'int *'
      85 |                            const struct path *root);
         |                            ~~~~~~~~~~~~~~~~~~~^~~~
>> fs/ksmbd/vfs.c:682:15: error: too many arguments to function 'vfs_path_parent_lookup'
     682 |         err = vfs_path_parent_lookup(to, lookup_flags | LOOKUP_BENEATH,
         |               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/namei.h:83:5: note: declared here
      83 | int vfs_path_parent_lookup(struct filename *filename, unsigned int flags,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/vfs_path_parent_lookup +683 fs/ksmbd/vfs.c

f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  657  
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  658  int ksmbd_vfs_rename(struct ksmbd_work *work, const struct path *old_path,
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  659  		     char *newname, int flags)
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  660  {
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  661  	struct dentry *old_parent, *new_dentry, *trap;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  662  	struct dentry *old_child = old_path->dentry;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  663  	struct path new_path;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  664  	struct qstr new_last;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  665  	struct renamedata rd;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  666  	struct filename *to;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  667  	struct ksmbd_share_config *share_conf = work->tcon->share_conf;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  668  	struct ksmbd_file *parent_fp;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  669  	int new_type;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  670  	int err, lookup_flags = LOOKUP_NO_SYMLINKS;
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  671  
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  672  	if (ksmbd_override_fsids(work))
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  673  		return -ENOMEM;
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  674  
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  675  	to = getname_kernel(newname);
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  676  	if (IS_ERR(to)) {
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  677  		err = PTR_ERR(to);
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  678  		goto revert_fsids;
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  679  	}
4b637fc1890260 fs/cifsd/vfs.c Namjae Jeon  2021-06-18  680  
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  681  retry:
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21 @682  	err = vfs_path_parent_lookup(to, lookup_flags | LOOKUP_BENEATH,
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21 @683  				     &new_path, &new_last, &new_type,
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  684  				     &share_conf->vfs_path);
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  685  	if (err)
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  686  		goto out1;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  687  
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  688  	if (old_path->mnt != new_path.mnt) {
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  689  		err = -EXDEV;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  690  		goto out2;
4b637fc1890260 fs/cifsd/vfs.c Namjae Jeon  2021-06-18  691  	}
4b637fc1890260 fs/cifsd/vfs.c Namjae Jeon  2021-06-18  692  
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  693  	trap = lock_rename_child(old_child, new_path.dentry);
4b637fc1890260 fs/cifsd/vfs.c Namjae Jeon  2021-06-18  694  
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  695  	old_parent = dget(old_child->d_parent);
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  696  	if (d_unhashed(old_child)) {
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  697  		err = -EINVAL;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  698  		goto out3;
c36fca8630dda0 fs/cifsd/vfs.c Namjae Jeon  2021-03-30  699  	}
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  700  
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  701  	parent_fp = ksmbd_lookup_fd_inode(d_inode(old_child->d_parent));
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  702  	if (parent_fp) {
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  703  		if (parent_fp->daccess & FILE_DELETE_LE) {
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  704  			pr_err("parent dir is opened with delete access\n");
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  705  			err = -ESHARE;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  706  			ksmbd_fd_put(work, parent_fp);
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  707  			goto out3;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  708  		}
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  709  		ksmbd_fd_put(work, parent_fp);
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  710  	}
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  711  
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  712  	new_dentry = lookup_one_qstr_excl(&new_last, new_path.dentry,
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  713  					  lookup_flags | LOOKUP_RENAME_TARGET);
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  714  	if (IS_ERR(new_dentry)) {
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  715  		err = PTR_ERR(new_dentry);
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  716  		goto out3;
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  717  	}
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  718  
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  719  	if (d_is_symlink(new_dentry)) {
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  720  		err = -EACCES;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  721  		goto out4;
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  722  	}
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  723  
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  724  	if ((flags & RENAME_NOREPLACE) && d_is_positive(new_dentry)) {
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  725  		err = -EEXIST;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  726  		goto out4;
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  727  	}
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  728  
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  729  	if (old_child == trap) {
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  730  		err = -EINVAL;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  731  		goto out4;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  732  	}
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  733  
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  734  	if (new_dentry == trap) {
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  735  		err = -ENOTEMPTY;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  736  		goto out4;
265fd1991c1db8 fs/ksmbd/vfs.c Hyunchul Lee 2021-09-25  737  	}
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  738  
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  739  	rd.old_mnt_idmap	= mnt_idmap(old_path->mnt),
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  740  	rd.old_dir		= d_inode(old_parent),
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  741  	rd.old_dentry		= old_child,
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  742  	rd.new_mnt_idmap	= mnt_idmap(new_path.mnt),
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  743  	rd.new_dir		= new_path.dentry->d_inode,
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  744  	rd.new_dentry		= new_dentry,
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  745  	rd.flags		= flags,
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  746  	err = vfs_rename(&rd);
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  747  	if (err)
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  748  		ksmbd_debug(VFS, "vfs_rename failed err %d\n", err);
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  749  
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  750  out4:
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  751  	dput(new_dentry);
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  752  out3:
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  753  	dput(old_parent);
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  754  	unlock_rename(old_parent, new_path.dentry);
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  755  out2:
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  756  	path_put(&new_path);
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  757  
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  758  	if (retry_estale(err, lookup_flags)) {
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  759  		lookup_flags |= LOOKUP_REVAL;
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  760  		goto retry;
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  761  	}
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  762  out1:
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  763  	putname(to);
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  764  revert_fsids:
74d7970febf7e9 fs/ksmbd/vfs.c Namjae Jeon  2023-04-21  765  	ksmbd_revert_fsids(work);
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  766  	return err;
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  767  }
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  768  

:::::: The code at line 683 was first introduced by commit
:::::: 74d7970febf7e9005375aeda0df821d2edffc9f7 ksmbd: fix racy issue from using ->d_parent and ->d_name

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
