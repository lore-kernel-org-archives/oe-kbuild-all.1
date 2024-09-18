Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12A114B94A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 20:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726692052; cv=none; b=BgPfFEVlEiQ4xlwYwZT00HzXJDOo6gX/XExb9jJrHFCNAVVVgg7mKVbeA6Rtj0mzudG6EkKrGI0vtRpVktEsKHi13mmix0ACGPvmsKoZ+UEqmPPzCEWabti+koE0HQu1QDknDCENzVo6Dex0/uWerCiS5JRYHR9oYZ1V5s7Br94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726692052; c=relaxed/simple;
	bh=H8NpjiUe8uVSwUUfMIFx4tX57qwo9fipUI5iLFyDtCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtVLDshra641NebppAxMsto4Unl2Vj7qzWzfUsZ2VsB/Xf94ZliBDmFn7jpR3BJ9B8O7rAHsU27bPRI5yGvdG+vNMPAtJ5outeNI2Z5FM9PikHIqSJswRmkgC0EPZkWbeRL2GQSjt5oEXTkGKc3qZvAZ8I2aqFOT4zAATos37U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJY74GGL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJY74GGL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726692051; x=1758228051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H8NpjiUe8uVSwUUfMIFx4tX57qwo9fipUI5iLFyDtCg=;
  b=IJY74GGL6Wd13BHVmLrF4zZlRq9oTt7yZZrNOY818eqrQ69WCuz1Rm0k
   l5Ffn/0Yd0Y6D15a3/G5GFfp2qIz48UIWoJTbmvIm1jVG0vdaG1ozHsEb
   kT33Vt//3rHEugLnJWAjn+KkuPY9AWNrU9KMWZ62JQfb66Srbl8Gw9r44
   dfIXl6ePapOJhndTd+nyy12CduQcEs29EaKIu8WMI+r650juL+icL18xf
   0XVmyhE53J47heG9aGP45jg8Jk946ZSZYv40iYDmSgVHosd/7HV6MaV09
   hezyMCRtv11GGAYmJ+CBrltRvck3NqOgkt6Pdh05Z1kxcOdI8k4k1rLty
   Q==;
X-CSE-ConnectionGUID: 8ZhL/9OVTAer5x8KpgsGvg==
X-CSE-MsgGUID: VS7dU+L+QsqXyHKqAIluXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="37002020"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="37002020"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 13:40:49 -0700
X-CSE-ConnectionGUID: 8uRKfh3ARUyvybs64jNFrQ==
X-CSE-MsgGUID: gPS2WFfsSSmvC4IHnjreyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="74488842"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Sep 2024 13:40:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sr1Th-000CcZ-2P;
	Wed, 18 Sep 2024 20:40:45 +0000
Date: Thu, 19 Sep 2024 04:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH - RFC] VFS: disable new delegations during
 delegation-breaking operations
Message-ID: <202409190404.Yjqn3KXY-lkp@intel.com>
References: <172646129988.17050.4729474250083101679@noble.neil.brown.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172646129988.17050.4729474250083101679@noble.neil.brown.name>

Hi NeilBrown,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 98f7e32f20d28ec452afb208f9cffc08448a2652]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/VFS-disable-new-delegations-during-delegation-breaking-operations/20240916-123616
base:   98f7e32f20d28ec452afb208f9cffc08448a2652
patch link:    https://lore.kernel.org/r/172646129988.17050.4729474250083101679%40noble.neil.brown.name
patch subject: [PATCH - RFC] VFS: disable new delegations during delegation-breaking operations
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240919/202409190404.Yjqn3KXY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409190404.Yjqn3KXY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409190404.Yjqn3KXY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/smb/server/vfs.c: In function 'ksmbd_vfs_rename':
>> fs/smb/server/vfs.c:784:12: error: 'struct renamedata' has no member named 'delegated_inode'; did you mean 'delegated_inode_new'?
     784 |         rd.delegated_inode      = NULL,
         |            ^~~~~~~~~~~~~~~
         |            delegated_inode_new
>> fs/smb/server/vfs.c:784:39: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     784 |         rd.delegated_inode      = NULL,
         |                                       ^


vim +784 fs/smb/server/vfs.c

f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  682  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  683  int ksmbd_vfs_rename(struct ksmbd_work *work, const struct path *old_path,
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  684  		     char *newname, int flags)
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  685  {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  686  	struct dentry *old_parent, *new_dentry, *trap;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  687  	struct dentry *old_child = old_path->dentry;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  688  	struct path new_path;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  689  	struct qstr new_last;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  690  	struct renamedata rd;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  691  	struct filename *to;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  692  	struct ksmbd_share_config *share_conf = work->tcon->share_conf;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  693  	struct ksmbd_file *parent_fp;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  694  	int new_type;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  695  	int err, lookup_flags = LOOKUP_NO_SYMLINKS;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  696  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  697  	if (ksmbd_override_fsids(work))
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  698  		return -ENOMEM;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  699  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  700  	to = getname_kernel(newname);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  701  	if (IS_ERR(to)) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  702  		err = PTR_ERR(to);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  703  		goto revert_fsids;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  704  	}
4b637fc1890260 fs/cifsd/vfs.c      Namjae Jeon       2021-06-18  705  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  706  retry:
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  707  	err = vfs_path_parent_lookup(to, lookup_flags | LOOKUP_BENEATH,
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  708  				     &new_path, &new_last, &new_type,
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  709  				     &share_conf->vfs_path);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  710  	if (err)
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  711  		goto out1;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  712  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  713  	if (old_path->mnt != new_path.mnt) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  714  		err = -EXDEV;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  715  		goto out2;
4b637fc1890260 fs/cifsd/vfs.c      Namjae Jeon       2021-06-18  716  	}
4b637fc1890260 fs/cifsd/vfs.c      Namjae Jeon       2021-06-18  717  
40b268d384a222 fs/smb/server/vfs.c Namjae Jeon       2023-06-15  718  	err = mnt_want_write(old_path->mnt);
40b268d384a222 fs/smb/server/vfs.c Namjae Jeon       2023-06-15  719  	if (err)
40b268d384a222 fs/smb/server/vfs.c Namjae Jeon       2023-06-15  720  		goto out2;
40b268d384a222 fs/smb/server/vfs.c Namjae Jeon       2023-06-15  721  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  722  	trap = lock_rename_child(old_child, new_path.dentry);
a8b0026847b8c4 fs/smb/server/vfs.c Al Viro           2023-11-20  723  	if (IS_ERR(trap)) {
a8b0026847b8c4 fs/smb/server/vfs.c Al Viro           2023-11-20  724  		err = PTR_ERR(trap);
a8b0026847b8c4 fs/smb/server/vfs.c Al Viro           2023-11-20  725  		goto out_drop_write;
a8b0026847b8c4 fs/smb/server/vfs.c Al Viro           2023-11-20  726  	}
4b637fc1890260 fs/cifsd/vfs.c      Namjae Jeon       2021-06-18  727  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  728  	old_parent = dget(old_child->d_parent);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  729  	if (d_unhashed(old_child)) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  730  		err = -EINVAL;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  731  		goto out3;
c36fca8630dda0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-30  732  	}
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  733  
4274a9dc6aeb9f fs/smb/server/vfs.c Namjae Jeon       2023-11-20  734  	parent_fp = ksmbd_lookup_fd_inode(old_child->d_parent);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  735  	if (parent_fp) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  736  		if (parent_fp->daccess & FILE_DELETE_LE) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  737  			pr_err("parent dir is opened with delete access\n");
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  738  			err = -ESHARE;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  739  			ksmbd_fd_put(work, parent_fp);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  740  			goto out3;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  741  		}
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  742  		ksmbd_fd_put(work, parent_fp);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  743  	}
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  744  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  745  	new_dentry = lookup_one_qstr_excl(&new_last, new_path.dentry,
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  746  					  lookup_flags | LOOKUP_RENAME_TARGET);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  747  	if (IS_ERR(new_dentry)) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  748  		err = PTR_ERR(new_dentry);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  749  		goto out3;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  750  	}
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  751  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  752  	if (d_is_symlink(new_dentry)) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  753  		err = -EACCES;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  754  		goto out4;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  755  	}
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  756  
4973b04d3ea577 fs/smb/server/vfs.c Marios Makassikis 2024-04-15  757  	/*
4973b04d3ea577 fs/smb/server/vfs.c Marios Makassikis 2024-04-15  758  	 * explicitly handle file overwrite case, for compatibility with
4973b04d3ea577 fs/smb/server/vfs.c Marios Makassikis 2024-04-15  759  	 * filesystems that may not support rename flags (e.g: fuse)
4973b04d3ea577 fs/smb/server/vfs.c Marios Makassikis 2024-04-15  760  	 */
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  761  	if ((flags & RENAME_NOREPLACE) && d_is_positive(new_dentry)) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  762  		err = -EEXIST;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  763  		goto out4;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  764  	}
4973b04d3ea577 fs/smb/server/vfs.c Marios Makassikis 2024-04-15  765  	flags &= ~(RENAME_NOREPLACE);
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  766  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  767  	if (old_child == trap) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  768  		err = -EINVAL;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  769  		goto out4;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  770  	}
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  771  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  772  	if (new_dentry == trap) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  773  		err = -ENOTEMPTY;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  774  		goto out4;
265fd1991c1db8 fs/ksmbd/vfs.c      Hyunchul Lee      2021-09-25  775  	}
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  776  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  777  	rd.old_mnt_idmap	= mnt_idmap(old_path->mnt),
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  778  	rd.old_dir		= d_inode(old_parent),
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  779  	rd.old_dentry		= old_child,
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  780  	rd.new_mnt_idmap	= mnt_idmap(new_path.mnt),
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  781  	rd.new_dir		= new_path.dentry->d_inode,
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  782  	rd.new_dentry		= new_dentry,
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  783  	rd.flags		= flags,
48b47f0caaa8a9 fs/smb/server/vfs.c Namjae Jeon       2023-05-12 @784  	rd.delegated_inode	= NULL,
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  785  	err = vfs_rename(&rd);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  786  	if (err)
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  787  		ksmbd_debug(VFS, "vfs_rename failed err %d\n", err);
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  788  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  789  out4:
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  790  	dput(new_dentry);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  791  out3:
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  792  	dput(old_parent);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  793  	unlock_rename(old_parent, new_path.dentry);
a8b0026847b8c4 fs/smb/server/vfs.c Al Viro           2023-11-20  794  out_drop_write:
40b268d384a222 fs/smb/server/vfs.c Namjae Jeon       2023-06-15  795  	mnt_drop_write(old_path->mnt);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  796  out2:
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  797  	path_put(&new_path);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  798  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  799  	if (retry_estale(err, lookup_flags)) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  800  		lookup_flags |= LOOKUP_REVAL;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  801  		goto retry;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  802  	}
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  803  out1:
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  804  	putname(to);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  805  revert_fsids:
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  806  	ksmbd_revert_fsids(work);
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  807  	return err;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  808  }
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  809  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
