Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418DD14A91
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 17:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729964721; cv=none; b=HP6zjdZHRgvNswXZnrFvuT3nYKjAwzY1UL0rE4EXer4xtPtKsZtUbDx0n2YC6q9oJ+SI+MnNodzK+nYv9q+zaEDpcBVpmYZVjw900t3ikXjyhNFgR6IrlZLqp9okEnz/zxXrdkoYV0Hqu/t0hhzf2HJ8hdh5Lpvl5oL1AwXSmLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729964721; c=relaxed/simple;
	bh=gHqfgkGQOTtmvWPydQksC2RKv6S7FqcvBy56lMEBzmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p8yek/qfO0Hhj5607mS9d0RL2CF0lLjOsJ9h23xVL25Mjp/8g4jyHw3c1Npqkc/qEApYehnau8c5Ad1YScpNiC+QHSZKn8Par3b26OgPGHBFoHgZRrJhxPlwbcGShhs2+cnXlkkekMl9JnnGHJGYYe8zh3IYjYOdseB0nIay4VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bzI2BFOJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzI2BFOJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729964717; x=1761500717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gHqfgkGQOTtmvWPydQksC2RKv6S7FqcvBy56lMEBzmE=;
  b=bzI2BFOJdfQ0yRy/kVvFSf8uACqVW4EzTjNJyurT01ADQScqIY5wXvy3
   L7IkK19vwz6g+59ZRV24ve9IHPdkKEUvZtwuPy97aq8U76ObKyQD3S9Kz
   eEw3zZfbISmP19uC7SbouscOQt7RArt+GSn1elvzxNKmqBhUYCGCZJVMS
   1cqFlNi7ysdzPvlgjYiOEswa+/rfeTc29JB6bHfZ24OuSZfBgmlIpKugx
   SeChsYGb69jgsKOPYx5hR5jTPkdV2uTGcKFh9soDYSVLzS4uR5h3pMj0o
   EhEXFLlFwgQruiVr/Ky2AFf3cJyrG5ZVX3XTz/7z+T2VmjdIE+INXQrWL
   Q==;
X-CSE-ConnectionGUID: G2s4R8iLSMmQjZft9vcNSA==
X-CSE-MsgGUID: CbSPwV/IT1qJLVQ3ojC3wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47076234"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47076234"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 10:45:16 -0700
X-CSE-ConnectionGUID: ef7zeJDPSF6jd/bBAi9XKQ==
X-CSE-MsgGUID: O1KcvJxhQPazfkzmNpDMOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="81255107"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Oct 2024 10:45:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4kqe-000Ztm-2Q;
	Sat, 26 Oct 2024 17:45:12 +0000
Date: Sun, 27 Oct 2024 01:44:56 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sandeen:mount-api 7/7] fs/devpts/inode.c:354:15: error: implicit
 declaration of function 'parse_mount_options'; did you mean
 'parse_early_options'?
Message-ID: <202410270108.erZeaNts-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sandeen/linux.git mount-api
head:   cf7abe7ded8f2c97728ebb2655ca09970b4cdeb6
commit: cf7abe7ded8f2c97728ebb2655ca09970b4cdeb6 [7/7] devpts: convert to the new mount API
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241027/202410270108.erZeaNts-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270108.erZeaNts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270108.erZeaNts-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/devpts/inode.c: In function 'devpts_parse_param':
>> fs/devpts/inode.c:251:13: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
     251 |         if (fc->purpose = FS_CONTEXT_FOR_MOUNT)
         |             ^~
   fs/devpts/inode.c: In function 'devpts_remount':
>> fs/devpts/inode.c:354:15: error: implicit declaration of function 'parse_mount_options'; did you mean 'parse_early_options'? [-Werror=implicit-function-declaration]
     354 |         err = parse_mount_options(data, PARSE_REMOUNT, opts);
         |               ^~~~~~~~~~~~~~~~~~~
         |               parse_early_options
   fs/devpts/inode.c: At top level:
>> fs/devpts/inode.c:492:27: error: 'devpts_reconfigure' undeclared here (not in a function)
     492 |         .reconfigure    = devpts_reconfigure,
         |                           ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +354 fs/devpts/inode.c

2a1b2dc0c83bbf Sukadev Bhattiprolu   2009-01-02  231  
1f71ebedb3f8ce Sukadev Bhattiprolu   2009-05-14  232  /*
1f71ebedb3f8ce Sukadev Bhattiprolu   2009-05-14  233   * parse_mount_options():
1f71ebedb3f8ce Sukadev Bhattiprolu   2009-05-14  234   *	Set @opts to mount options specified in @data. If an option is not
eedf265aa003b4 Eric W. Biederman     2016-06-02  235   *	specified in @data, set it to its default value.
1f71ebedb3f8ce Sukadev Bhattiprolu   2009-05-14  236   *
1f71ebedb3f8ce Sukadev Bhattiprolu   2009-05-14  237   * Note: @data may be NULL (in which case all options are set to default).
1f71ebedb3f8ce Sukadev Bhattiprolu   2009-05-14  238   */
cf7abe7ded8f2c Eric Sandeen          2024-10-25  239  // static int parse_mount_options(char *data, int op, struct pts_mount_opts *opts)
cf7abe7ded8f2c Eric Sandeen          2024-10-25  240  static int devpts_parse_param(struct fs_context *fc, struct fs_parameter *param)
^1da177e4c3f41 Linus Torvalds        2005-04-16  241  {
cf7abe7ded8f2c Eric Sandeen          2024-10-25  242  	struct pts_fs_info *fsi = fc->s_fs_info;
cf7abe7ded8f2c Eric Sandeen          2024-10-25  243  	struct pts_mount_opts *opts = &fsi->mount_opts;
cf7abe7ded8f2c Eric Sandeen          2024-10-25  244  	struct fs_parse_result result;
cf7abe7ded8f2c Eric Sandeen          2024-10-25  245  	int opt;
7a673c6b8fff4b Domen Puncer          2006-03-23  246  
7a673c6b8fff4b Domen Puncer          2006-03-23  247  
eedf265aa003b4 Eric W. Biederman     2016-06-02  248  	/* Only allow instances mounted from the initial mount
eedf265aa003b4 Eric W. Biederman     2016-06-02  249  	 * namespace to tap the reserve pool of ptys.
eedf265aa003b4 Eric W. Biederman     2016-06-02  250  	 */
cf7abe7ded8f2c Eric Sandeen          2024-10-25 @251  	if (fc->purpose = FS_CONTEXT_FOR_MOUNT)
eedf265aa003b4 Eric W. Biederman     2016-06-02  252  		opts->reserve =
eedf265aa003b4 Eric W. Biederman     2016-06-02  253  			(current->nsproxy->mnt_ns == init_task.nsproxy->mnt_ns);
2a1b2dc0c83bbf Sukadev Bhattiprolu   2009-01-02  254  
cf7abe7ded8f2c Eric Sandeen          2024-10-25  255  	opt = fs_parse(fc, devpts_param_spec, param, &result);
7a673c6b8fff4b Domen Puncer          2006-03-23  256  
cf7abe7ded8f2c Eric Sandeen          2024-10-25  257  	switch (opt) {
7a673c6b8fff4b Domen Puncer          2006-03-23  258  	case Opt_uid:
cf7abe7ded8f2c Eric Sandeen          2024-10-25  259  		opts->uid = result.uid;
31af0abbdafb66 Sukadev Bhattiprolu   2009-01-02  260  		opts->setuid = 1;
7a673c6b8fff4b Domen Puncer          2006-03-23  261  		break;
7a673c6b8fff4b Domen Puncer          2006-03-23  262  	case Opt_gid:
cf7abe7ded8f2c Eric Sandeen          2024-10-25  263  		opts->gid = result.gid;
31af0abbdafb66 Sukadev Bhattiprolu   2009-01-02  264  		opts->setgid = 1;
7a673c6b8fff4b Domen Puncer          2006-03-23  265  		break;
7a673c6b8fff4b Domen Puncer          2006-03-23  266  	case Opt_mode:
cf7abe7ded8f2c Eric Sandeen          2024-10-25  267  		opts->mode = result.uint_32 & S_IALLUGO;
7a673c6b8fff4b Domen Puncer          2006-03-23  268  		break;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  269  	case Opt_ptmxmode:
cf7abe7ded8f2c Eric Sandeen          2024-10-25  270  		opts->ptmxmode = result.uint_32 & S_IALLUGO;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  271  		break;
2a1b2dc0c83bbf Sukadev Bhattiprolu   2009-01-02  272  	case Opt_newinstance:
2a1b2dc0c83bbf Sukadev Bhattiprolu   2009-01-02  273  		break;
e9aba5158a8009 Konstantin Khlebnikov 2012-01-05  274  	case Opt_max:
cf7abe7ded8f2c Eric Sandeen          2024-10-25  275  		 if (result.int_32 < 0 || result.int_32 > NR_UNIX98_PTY_MAX)
e9aba5158a8009 Konstantin Khlebnikov 2012-01-05  276  			return -EINVAL;
cf7abe7ded8f2c Eric Sandeen          2024-10-25  277  		opts->max = result.int_32;
e9aba5158a8009 Konstantin Khlebnikov 2012-01-05  278  		break;
7a673c6b8fff4b Domen Puncer          2006-03-23  279  	default:
^1da177e4c3f41 Linus Torvalds        2005-04-16  280  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds        2005-04-16  281  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  282  
^1da177e4c3f41 Linus Torvalds        2005-04-16  283  	return 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  284  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  285  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  286  static int mknod_ptmx(struct super_block *sb)
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  287  {
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  288  	int mode;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  289  	int rc = -ENOMEM;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  290  	struct dentry *dentry;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  291  	struct inode *inode;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  292  	struct dentry *root = sb->s_root;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  293  	struct pts_fs_info *fsi = DEVPTS_SB(sb);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  294  	struct pts_mount_opts *opts = &fsi->mount_opts;
e98d41370392db Eric W. Biederman     2016-09-14  295  	kuid_t ptmx_uid = current_fsuid();
e98d41370392db Eric W. Biederman     2016-09-14  296  	kgid_t ptmx_gid = current_fsgid();
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  297  
5955102c9984fa Al Viro               2016-01-22  298  	inode_lock(d_inode(root));
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  299  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  300  	/* If we have already created ptmx node, return */
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  301  	if (fsi->ptmx_dentry) {
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  302  		rc = 0;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  303  		goto out;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  304  	}
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  305  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  306  	dentry = d_alloc_name(root, "ptmx");
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  307  	if (!dentry) {
04541a2f316022 Fabian Frederick      2014-06-06  308  		pr_err("Unable to alloc dentry for ptmx node\n");
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  309  		goto out;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  310  	}
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  311  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  312  	/*
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  313  	 * Create a new 'ptmx' node in this mount of devpts.
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  314  	 */
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  315  	inode = new_inode(sb);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  316  	if (!inode) {
04541a2f316022 Fabian Frederick      2014-06-06  317  		pr_err("Unable to alloc inode for ptmx node\n");
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  318  		dput(dentry);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  319  		goto out;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  320  	}
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  321  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  322  	inode->i_ino = 2;
69d9116d0a0d99 Jeff Layton           2023-10-04  323  	simple_inode_init_ts(inode);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  324  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  325  	mode = S_IFCHR|opts->ptmxmode;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  326  	init_special_inode(inode, mode, MKDEV(TTYAUX_MAJOR, 2));
e98d41370392db Eric W. Biederman     2016-09-14  327  	inode->i_uid = ptmx_uid;
e98d41370392db Eric W. Biederman     2016-09-14  328  	inode->i_gid = ptmx_gid;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  329  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  330  	d_add(dentry, inode);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  331  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  332  	fsi->ptmx_dentry = dentry;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  333  	rc = 0;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  334  out:
5955102c9984fa Al Viro               2016-01-22  335  	inode_unlock(d_inode(root));
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  336  	return rc;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  337  }
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  338  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  339  static void update_ptmx_mode(struct pts_fs_info *fsi)
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  340  {
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  341  	struct inode *inode;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  342  	if (fsi->ptmx_dentry) {
2b0143b5c986be David Howells         2015-03-17  343  		inode = d_inode(fsi->ptmx_dentry);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  344  		inode->i_mode = S_IFCHR|fsi->mount_opts.ptmxmode;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  345  	}
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  346  }
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  347  
53af8ee4094d80 Sukadev Bhattiprolu   2009-01-02  348  static int devpts_remount(struct super_block *sb, int *flags, char *data)
53af8ee4094d80 Sukadev Bhattiprolu   2009-01-02  349  {
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  350  	int err;
53af8ee4094d80 Sukadev Bhattiprolu   2009-01-02  351  	struct pts_fs_info *fsi = DEVPTS_SB(sb);
53af8ee4094d80 Sukadev Bhattiprolu   2009-01-02  352  	struct pts_mount_opts *opts = &fsi->mount_opts;
53af8ee4094d80 Sukadev Bhattiprolu   2009-01-02  353  
2a1b2dc0c83bbf Sukadev Bhattiprolu   2009-01-02 @354  	err = parse_mount_options(data, PARSE_REMOUNT, opts);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  355  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  356  	/*
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  357  	 * parse_mount_options() restores options to default values
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  358  	 * before parsing and may have changed ptmxmode. So, update the
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  359  	 * mode in the inode too. Bogus options don't fail the remount,
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  360  	 * so do this even on error return.
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  361  	 */
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  362  	update_ptmx_mode(fsi);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  363  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  364  	return err;
53af8ee4094d80 Sukadev Bhattiprolu   2009-01-02  365  }
53af8ee4094d80 Sukadev Bhattiprolu   2009-01-02  366  
34c80b1d93e6e2 Al Viro               2011-12-08  367  static int devpts_show_options(struct seq_file *seq, struct dentry *root)
b87a267eb7291d Miklos Szeredi        2008-02-08  368  {
34c80b1d93e6e2 Al Viro               2011-12-08  369  	struct pts_fs_info *fsi = DEVPTS_SB(root->d_sb);
31af0abbdafb66 Sukadev Bhattiprolu   2009-01-02  370  	struct pts_mount_opts *opts = &fsi->mount_opts;
31af0abbdafb66 Sukadev Bhattiprolu   2009-01-02  371  
31af0abbdafb66 Sukadev Bhattiprolu   2009-01-02  372  	if (opts->setuid)
04541a2f316022 Fabian Frederick      2014-06-06  373  		seq_printf(seq, ",uid=%u",
04541a2f316022 Fabian Frederick      2014-06-06  374  			   from_kuid_munged(&init_user_ns, opts->uid));
31af0abbdafb66 Sukadev Bhattiprolu   2009-01-02  375  	if (opts->setgid)
04541a2f316022 Fabian Frederick      2014-06-06  376  		seq_printf(seq, ",gid=%u",
04541a2f316022 Fabian Frederick      2014-06-06  377  			   from_kgid_munged(&init_user_ns, opts->gid));
31af0abbdafb66 Sukadev Bhattiprolu   2009-01-02  378  	seq_printf(seq, ",mode=%03o", opts->mode);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  379  	seq_printf(seq, ",ptmxmode=%03o", opts->ptmxmode);
e9aba5158a8009 Konstantin Khlebnikov 2012-01-05  380  	if (opts->max < NR_UNIX98_PTY_MAX)
e9aba5158a8009 Konstantin Khlebnikov 2012-01-05  381  		seq_printf(seq, ",max=%d", opts->max);
b87a267eb7291d Miklos Szeredi        2008-02-08  382  
b87a267eb7291d Miklos Szeredi        2008-02-08  383  	return 0;
b87a267eb7291d Miklos Szeredi        2008-02-08  384  }
b87a267eb7291d Miklos Szeredi        2008-02-08  385  
ee9b6d61a2a43c Josef 'Jeff' Sipek    2007-02-12  386  static const struct super_operations devpts_sops = {
^1da177e4c3f41 Linus Torvalds        2005-04-16  387  	.statfs		= simple_statfs,
^1da177e4c3f41 Linus Torvalds        2005-04-16  388  	.remount_fs	= devpts_remount,
b87a267eb7291d Miklos Szeredi        2008-02-08  389  	.show_options	= devpts_show_options,
^1da177e4c3f41 Linus Torvalds        2005-04-16  390  };
^1da177e4c3f41 Linus Torvalds        2005-04-16  391  
cf7abe7ded8f2c Eric Sandeen          2024-10-25  392  #if 0
67245ff332064c Linus Torvalds        2016-04-16  393  static void *new_pts_fs_info(struct super_block *sb)
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  394  {
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  395  	struct pts_fs_info *fsi;
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  396  
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  397  	fsi = kzalloc(sizeof(struct pts_fs_info), GFP_KERNEL);
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  398  	if (!fsi)
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  399  		return NULL;
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  400  
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  401  	ida_init(&fsi->allocated_ptys);
31af0abbdafb66 Sukadev Bhattiprolu   2009-01-02  402  	fsi->mount_opts.mode = DEVPTS_DEFAULT_MODE;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  403  	fsi->mount_opts.ptmxmode = DEVPTS_DEFAULT_PTMX_MODE;
67245ff332064c Linus Torvalds        2016-04-16  404  	fsi->sb = sb;
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  405  
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  406  	return fsi;
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  407  }
cf7abe7ded8f2c Eric Sandeen          2024-10-25  408  #endif
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  409  
^1da177e4c3f41 Linus Torvalds        2005-04-16  410  static int
cf7abe7ded8f2c Eric Sandeen          2024-10-25  411  devpts_fill_super(struct super_block *s, struct fs_context *fc)
^1da177e4c3f41 Linus Torvalds        2005-04-16  412  {
^1da177e4c3f41 Linus Torvalds        2005-04-16  413  	struct inode *inode;
dee87d47365e47 Eric W. Biederman     2016-09-14  414  	int error;
^1da177e4c3f41 Linus Torvalds        2005-04-16  415  
cc50a07a247e17 Eric W. Biederman     2016-06-09  416  	s->s_iflags &= ~SB_I_NODEV;
^1da177e4c3f41 Linus Torvalds        2005-04-16  417  	s->s_blocksize = 1024;
^1da177e4c3f41 Linus Torvalds        2005-04-16  418  	s->s_blocksize_bits = 10;
^1da177e4c3f41 Linus Torvalds        2005-04-16  419  	s->s_magic = DEVPTS_SUPER_MAGIC;
^1da177e4c3f41 Linus Torvalds        2005-04-16  420  	s->s_op = &devpts_sops;
73052b0daee0b7 Varad Gautam          2019-01-24  421  	s->s_d_op = &simple_dentry_operations;
^1da177e4c3f41 Linus Torvalds        2005-04-16  422  	s->s_time_gran = 1;
^1da177e4c3f41 Linus Torvalds        2005-04-16  423  
dee87d47365e47 Eric W. Biederman     2016-09-14  424  	error = -ENOMEM;
cf7abe7ded8f2c Eric Sandeen          2024-10-25  425  	//s->s_fs_info = new_pts_fs_info(s);
cf7abe7ded8f2c Eric Sandeen          2024-10-25  426  	//if (!s->s_fs_info)
cf7abe7ded8f2c Eric Sandeen          2024-10-25  427  	//	goto fail;
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  428  
cf7abe7ded8f2c Eric Sandeen          2024-10-25  429  	//error = parse_mount_options(data, PARSE_MOUNT, &DEVPTS_SB(s)->mount_opts);
cf7abe7ded8f2c Eric Sandeen          2024-10-25  430  	//if (error)
cf7abe7ded8f2c Eric Sandeen          2024-10-25  431  	//	goto fail;
dee87d47365e47 Eric W. Biederman     2016-09-14  432  
^1da177e4c3f41 Linus Torvalds        2005-04-16  433  	inode = new_inode(s);
^1da177e4c3f41 Linus Torvalds        2005-04-16  434  	if (!inode)
3850aba74873aa Al Viro               2012-01-08  435  		goto fail;
^1da177e4c3f41 Linus Torvalds        2005-04-16  436  	inode->i_ino = 1;
69d9116d0a0d99 Jeff Layton           2023-10-04  437  	simple_inode_init_ts(inode);
^1da177e4c3f41 Linus Torvalds        2005-04-16  438  	inode->i_mode = S_IFDIR | S_IRUGO | S_IXUGO | S_IWUSR;
^1da177e4c3f41 Linus Torvalds        2005-04-16  439  	inode->i_op = &simple_dir_inode_operations;
^1da177e4c3f41 Linus Torvalds        2005-04-16  440  	inode->i_fop = &simple_dir_operations;
bfe8684869601d Miklos Szeredi        2011-10-28  441  	set_nlink(inode, 2);
^1da177e4c3f41 Linus Torvalds        2005-04-16  442  
48fde701aff662 Al Viro               2012-01-08  443  	s->s_root = d_make_root(inode);
180d904442023d Eric W. Biederman     2016-09-14  444  	if (!s->s_root) {
04541a2f316022 Fabian Frederick      2014-06-06  445  		pr_err("get root dentry failed\n");
180d904442023d Eric W. Biederman     2016-09-14  446  		goto fail;
180d904442023d Eric W. Biederman     2016-09-14  447  	}
180d904442023d Eric W. Biederman     2016-09-14  448  
180d904442023d Eric W. Biederman     2016-09-14  449  	error = mknod_ptmx(s);
180d904442023d Eric W. Biederman     2016-09-14  450  	if (error)
180d904442023d Eric W. Biederman     2016-09-14  451  		goto fail_dput;
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  452  
180d904442023d Eric W. Biederman     2016-09-14  453  	return 0;
180d904442023d Eric W. Biederman     2016-09-14  454  fail_dput:
180d904442023d Eric W. Biederman     2016-09-14  455  	dput(s->s_root);
180d904442023d Eric W. Biederman     2016-09-14  456  	s->s_root = NULL;
^1da177e4c3f41 Linus Torvalds        2005-04-16  457  fail:
dee87d47365e47 Eric W. Biederman     2016-09-14  458  	return error;
^1da177e4c3f41 Linus Torvalds        2005-04-16  459  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  460  
2a1b2dc0c83bbf Sukadev Bhattiprolu   2009-01-02  461  /*
cf7abe7ded8f2c Eric Sandeen          2024-10-25  462   * devpts_get_tree()
289f00e225a6f6 Sukadev Bhattiprolu   2009-03-07  463   *
eedf265aa003b4 Eric W. Biederman     2016-06-02  464   *     Mount a new (private) instance of devpts.  PTYs created in this
eedf265aa003b4 Eric W. Biederman     2016-06-02  465   *     instance are independent of the PTYs in other devpts instances.
d4076ac55bf875 Sukadev Bhattiprolu   2009-01-02  466   */
cf7abe7ded8f2c Eric Sandeen          2024-10-25  467  static int devpts_get_tree(struct fs_context *fc)
^1da177e4c3f41 Linus Torvalds        2005-04-16  468  {
cf7abe7ded8f2c Eric Sandeen          2024-10-25  469  	return get_tree_nodev(fc, devpts_fill_super);
2a1b2dc0c83bbf Sukadev Bhattiprolu   2009-01-02  470  }
482984f06df54d Sukadev Bhattiprolu   2009-03-07  471  
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  472  static void devpts_kill_sb(struct super_block *sb)
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  473  {
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  474  	struct pts_fs_info *fsi = DEVPTS_SB(sb);
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  475  
40b320e1c75735 Eric W. Biederman     2016-09-14  476  	if (fsi)
66da0e1f903414 Ilija Hadzic          2013-11-12  477  		ida_destroy(&fsi->allocated_ptys);
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  478  	kfree(fsi);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  479  	kill_litter_super(sb);
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  480  }
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  481  
cf7abe7ded8f2c Eric Sandeen          2024-10-25  482  static void devpts_free_fc(struct fs_context *fc)
cf7abe7ded8f2c Eric Sandeen          2024-10-25  483  {
cf7abe7ded8f2c Eric Sandeen          2024-10-25  484  	struct pts_fs_info *fsi = fc->s_fs_info;
cf7abe7ded8f2c Eric Sandeen          2024-10-25  485  
cf7abe7ded8f2c Eric Sandeen          2024-10-25  486  	kfree(fsi);
cf7abe7ded8f2c Eric Sandeen          2024-10-25  487  }
cf7abe7ded8f2c Eric Sandeen          2024-10-25  488  
cf7abe7ded8f2c Eric Sandeen          2024-10-25  489  static const struct fs_context_operations devpts_context_ops = {
cf7abe7ded8f2c Eric Sandeen          2024-10-25  490  	.parse_param	= devpts_parse_param,
cf7abe7ded8f2c Eric Sandeen          2024-10-25  491  	.get_tree	= devpts_get_tree,
cf7abe7ded8f2c Eric Sandeen          2024-10-25 @492  	.reconfigure	= devpts_reconfigure,
cf7abe7ded8f2c Eric Sandeen          2024-10-25  493  	.free		= devpts_free_fc,
cf7abe7ded8f2c Eric Sandeen          2024-10-25  494  };
cf7abe7ded8f2c Eric Sandeen          2024-10-25  495  

:::::: The code at line 354 was first introduced by commit
:::::: 2a1b2dc0c83bbfc24d72cafd5e69810a149b44e4 Enable multiple instances of devpts

:::::: TO: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
