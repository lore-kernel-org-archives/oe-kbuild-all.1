Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE6525F981
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 01:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788311095; cv=none; b=P4NqhZKrQwX/U604IIQbvGU1+7K6Zi7pGnwHaVN5ZCLmnGjdbyagAWGGnieRqmWsymE9MkIQqAPtWfgRX7E/K0o3PGlCRuYrMUaDAAWRdoLnaC8jz5Swg+O0fZlS7urnzMm57nT09sJM6o4vwK03m1Tx/bo9DAVBi5RhGmu4ysE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788311095; c=relaxed/simple;
	bh=L+1nOQb3O3n7CQTOBUfVE49iCKGhvJGX4nVBBljQVvs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UZTmGv+PNu64PWNtDRNxUQTe0VmFHtG4/xgAgbf7+AHqlDrQHmzF9bF4k7XrZ17C9+/cnBl6btNMzTzCBd+RDqKrAXDG3itO5J0O+slh0Urh/gs602JJoz8++M6UHqTUDVXHXSQH28UYTg1gLZqNOj8lXNYK8DLVLkJBfnghj3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUpEmK3z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUpEmK3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788311093; x=1819847093;
  h=date:from:to:cc:subject:message-id;
  bh=L+1nOQb3O3n7CQTOBUfVE49iCKGhvJGX4nVBBljQVvs=;
  b=HUpEmK3zj1T8rHfYa8ADffZk3AJOd12dr3TH6OMn2GHr+KLl8EVd2hHd
   rhMd1jlzD6aOF/TNqMkmq4DNztizvsOLBvFDJ5s5iS6nu3FRQpwdTNyIm
   z7or3m2IdExlAd+S1JxhNXaRBNbbC7U+XKw55U/NEeuGtciY7Z2DAohTy
   q/u4Ib+YLI5W+7HmxQN4QoKiA+SW5UA/is6e/+P1pj14drMDpzMsCq63l
   mxAkyQJp67z32aQzOewEE7DDJqmelxLkOBLkNn+h4VkcUGmGyK6M/2FcA
   I8GZ8R2tSc1kCBgPsQtPG2A0KqxsKK3DbRYJF8i2WEOyQKI8iw3wUW93M
   Q==;
X-CSE-ConnectionGUID: zqxG/e1hQG2FwuOtyD6p6g==
X-CSE-MsgGUID: toFmJCPsROyosZkvVWzp3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99090994"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="99090994"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 18:04:53 -0700
X-CSE-ConnectionGUID: 9ppiFzfnT/KZvoFPsZT5+Q==
X-CSE-MsgGUID: 9IbWVaBvQZqjtCoxXbJlzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="271215627"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Sep 2026 18:04:50 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1ZPD-000000001he-2UTy;
	Wed, 02 Sep 2026 01:04:47 +0000
Date: Wed, 02 Sep 2026 09:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 1206/2332] fs/namei.c:4637 lookup_open()
 warn: inconsistent indenting
Message-ID: <202609020834.LGMSIGsS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8b72f6626dc39b9e7e82b2721d4f7c3b86286012
commit: 449c7265d60d44eece1f83eee2badf2ea61e767d [1206/2332] vfs: add O_CREAT|O_DIRECTORY to open*(2)
config: csky-randconfig-r071-20260901 (https://download.01.org/0day-ci/archive/20260902/202609020834.LGMSIGsS-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609020834.LGMSIGsS-lkp@intel.com/

New smatch warnings:
fs/namei.c:4637 lookup_open() warn: inconsistent indenting

Old smatch warnings:
fs/namei.c:1789 lookup_dcache() warn: passing zero to 'ERR_PTR'
fs/namei.c:1901 lookup_fast() warn: passing zero to 'ERR_PTR'

vim +4637 fs/namei.c

  4478	
  4479	static inline
  4480	struct dentry *vfs_mkdir_no_perm(struct mnt_idmap *, struct inode *,
  4481					 struct dentry *, umode_t,
  4482					 struct delegated_inode *);
  4483	/*
  4484	 * Look up and maybe create and open the last component.
  4485	 *
  4486	 * Takes the parent inode lock itself, exclusive if O_CREAT was requested and
  4487	 * shared otherwise, and drops it again before returning.  The caller must not
  4488	 * hold it.
  4489	 *
  4490	 * On success returns the dentry of the last component.  If FMODE_OPENED is set
  4491	 * on file->f_mode the file was also opened and attached to @file; otherwise
  4492	 * only lookup and creation were performed and the caller has to open it.  In
  4493	 * the latter case the dentry may be negative if O_CREAT hadn't been specified.
  4494	 *
  4495	 * Returns ERR_PTR() on failure.
  4496	 */
  4497	static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
  4498					  const struct open_flags *op)
  4499	{
  4500		struct delegated_inode delegated_inode = { };
  4501		struct mnt_idmap *idmap;
  4502		struct dentry *dir = nd->path.dentry;
  4503		struct inode *dir_inode = dir->d_inode;
  4504		bool create_dir = O_IS_MKDIR(op->mode);
  4505		int open_flag;
  4506		struct dentry *dentry;
  4507		int error, create_error;
  4508		umode_t mode;
  4509		bool got_write;
  4510	
  4511	retry:
  4512		open_flag = op->open_flag;
  4513		got_write = false;
  4514		mode = op->mode;
  4515		create_error = 0;
  4516	
  4517		if (open_flag & (O_CREAT | O_TRUNC | O_WRONLY | O_RDWR)) {
  4518			got_write = !mnt_want_write(nd->path.mnt);
  4519			/*
  4520			 * do _not_ fail yet - we might not need that or fail with
  4521			 * a different error; we'll be dropping this one anyway.
  4522			 */
  4523		}
  4524		if (open_flag & O_CREAT)
  4525			inode_lock_nested(dir_inode, I_MUTEX_PARENT);
  4526		else
  4527			inode_lock_shared(dir_inode);
  4528	
  4529		if (unlikely(IS_DEADDIR(dir_inode))) {
  4530			dentry = ERR_PTR(-ENOENT);
  4531			goto out;
  4532		}
  4533	
  4534		if (create_dir && dir_inode->i_op->atomic_open)
  4535			open_flag &= ~O_CREAT;
  4536	
  4537		file->f_mode &= ~FMODE_CREATED;
  4538		dentry = d_lookup(dir, &nd->last);
  4539		for (;;) {
  4540			if (!dentry) {
  4541				dentry = d_alloc_parallel(dir, &nd->last);
  4542				if (IS_ERR(dentry))
  4543					goto out;
  4544			}
  4545			if (d_in_lookup(dentry))
  4546				break;
  4547	
  4548			error = d_revalidate(dir_inode, &nd->last, dentry, nd->flags);
  4549			if (likely(error > 0))
  4550				break;
  4551			if (error)
  4552				goto out_dput;
  4553			d_invalidate(dentry);
  4554			dput(dentry);
  4555			dentry = NULL;
  4556		}
  4557		if (dentry->d_inode) {
  4558			/* Cached positive dentry: will open in do_open(). */
  4559			goto out;
  4560		}
  4561	
  4562		if (open_flag & O_CREAT)
  4563			audit_inode(nd->name, dir, AUDIT_INODE_PARENT);
  4564	
  4565		/*
  4566		 * Checking write permission is tricky, bacuse we don't know if we are
  4567		 * going to actually need it: O_CREAT opens should work as long as the
  4568		 * file exists.  But checking existence breaks atomicity.  The trick is
  4569		 * to check access and if not granted clear O_CREAT from the flags.
  4570		 *
  4571		 * Another problem is returing the "right" error value (e.g. for an
  4572		 * O_EXCL open we want to return EEXIST not EROFS).
  4573		 */
  4574		if (unlikely(!got_write))
  4575			open_flag &= ~O_TRUNC;
  4576		idmap = mnt_idmap(nd->path.mnt);
  4577		if (open_flag & O_CREAT) {
  4578			if (open_flag & O_EXCL)
  4579				open_flag &= ~O_TRUNC;
  4580			mode = o_create_mode(idmap, dir_inode, open_flag, mode);
  4581			if (likely(got_write))
  4582				create_error = may_o_create(idmap, &nd->path,
  4583							    dentry, open_flag, mode);
  4584			else
  4585				create_error = -EROFS;
  4586		}
  4587		if (create_error)
  4588			open_flag &= ~O_CREAT;
  4589		if (dir_inode->i_op->atomic_open) {
  4590			if (nd->flags & LOOKUP_DIRECTORY)
  4591				open_flag |= O_DIRECTORY;
  4592			dentry = atomic_open(&nd->path, dentry, file, open_flag, mode,
  4593					     create_error);
  4594			goto out;
  4595		}
  4596	
  4597		if (d_in_lookup(dentry)) {
  4598			struct dentry *res = dir_inode->i_op->lookup(dir_inode, dentry,
  4599								     nd->flags);
  4600			d_lookup_done(dentry);
  4601			if (unlikely(res)) {
  4602				if (IS_ERR(res)) {
  4603					error = PTR_ERR(res);
  4604					goto out_dput;
  4605				}
  4606				dput(dentry);
  4607				dentry = res;
  4608			}
  4609		}
  4610	
  4611		if (dentry->d_inode || !(op->open_flag & O_CREAT)) {
  4612			/*
  4613			 * No need to create a file.  If lookup returned a positive
  4614			 * dentry, the file will be opened in do_open().
  4615			 */
  4616			goto out;
  4617		}
  4618	
  4619		/* Negative dentry with O_CREAT flag set */
  4620		audit_inode_child(dir_inode, dentry, AUDIT_TYPE_CHILD_CREATE);
  4621	
  4622		if (unlikely(create_error)) {
  4623			/* should have done a create, but we already errored */
  4624			error = create_error;
  4625			goto out_dput;
  4626		}
  4627	
  4628		if ((create_dir && !dir_inode->i_op->mkdir)
  4629			|| (!create_dir && !dir_inode->i_op->create)) {
  4630			error = -EACCES;
  4631			goto out_dput;
  4632		}
  4633	
  4634		if (create_dir) {
  4635			struct dentry *res = vfs_mkdir_no_perm(idmap, dir_inode, dentry,
  4636							       mode, &delegated_inode);
> 4637				error = PTR_ERR_OR_ZERO(res);
  4638				if (!error)
  4639					dentry = res;
  4640		} else {
  4641			error = vfs_create_no_perm(idmap, dentry, mode, &delegated_inode);
  4642		}
  4643		if (error)
  4644			goto out_dput;
  4645	
  4646		file->f_mode |= FMODE_CREATED;
  4647	out:
  4648		if ((open_flag & O_CREAT) || create_error)
  4649			inode_unlock(dir_inode);
  4650		else
  4651			inode_unlock_shared(dir_inode);
  4652	
  4653		if (got_write)
  4654			mnt_drop_write(nd->path.mnt);
  4655	
  4656		if (is_delegated(&delegated_inode)) {
  4657			/* Must have come through out_dput: dentry is an ERR_PTR() */
  4658			error = break_deleg_wait(&delegated_inode);
  4659	
  4660			if (!error)
  4661				goto retry;
  4662			dentry = ERR_PTR(error);
  4663		}
  4664	
  4665		return dentry;
  4666	
  4667	out_dput:
  4668		dput(dentry);
  4669		dentry = ERR_PTR(error);
  4670		goto out;
  4671	}
  4672	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
