Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABABF3EBF3B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 06:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771136545; cv=none; b=FeishhorrpfFdRttKh+zq8D+DRnUmuw64nwgiJMYGGoeNDOhnik8AA9VZvCnuKqIc8A5qywAWTnLfRGIlXRBEcHhsIehWLuhnVvCu4lo/vXJgH52NQS3RIuFG7GWuVIEv5rPEVAAzdR76S8jvmgpUEph1IN4bBSqsQNNFOpy1iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771136545; c=relaxed/simple;
	bh=EzcTdWE0FihGzHNHpuyMbtF0oY+ur01G6s5AugZK8w4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Assc47F1OtA6FOzBKBYCekazNF6ATVwF6MHdW/7miUJ5n4RNT4ZfGB9U10pCsZjGZFXiA7BksC2D2Jff+NxBFuEKg7t0Z6ktD3UsFdCjxh5TG02fddXMpTY5Ei7ttP6Wqc3wR5R3rkM4XZMrwXHw8XjYiMp71d1mK1vxoEJd2XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ThtA0gTe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThtA0gTe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771136543; x=1802672543;
  h=date:from:to:cc:subject:message-id;
  bh=EzcTdWE0FihGzHNHpuyMbtF0oY+ur01G6s5AugZK8w4=;
  b=ThtA0gTe0HUFm9ZZxk4ihu7J+HeNUVnF8iaeb3dZBIwJk2WtjCtxdQjd
   2WU+y2StXv6rG0cIh4ucpbRpkgyOg3q9DyyEZT9gyYC0d0q1yXx0nH4uR
   j62FyhqRgaqCyD+UDHT0/Xxacm3zV8XKZh49JNgNI9jAd7x2AXKVI2DOH
   1KTcwQfszaFd1H7sCEKVaycK2TbQ3xF8GRYGEYNNZNc13RTpABjI0ljCB
   73YTUnUfDrpot6bJfmfwueicu0tPrDBjB+TOFYFoD+VGiSFSFxXJ9wio5
   muCR2vyPSTocrwinqwIWAZh/y8quS+PYaMy39apnobq+oQARDkAz9wRyP
   A==;
X-CSE-ConnectionGUID: C98ENxFlS1ap9WN5Ji9+wA==
X-CSE-MsgGUID: m220JtbXRMueDDST+hbOcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="72163117"
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="72163117"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 22:22:23 -0800
X-CSE-ConnectionGUID: O/Q1UPYTRheAPSHz5EZSqA==
X-CSE-MsgGUID: wEHJn9aJRROPU3UEgNC24Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="213321596"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Feb 2026 22:22:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrVWN-00000000xcG-0zdU;
	Sun, 15 Feb 2026 06:22:19 +0000
Date: Sun, 15 Feb 2026 14:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 14/17] fs/namespace.c:4364
 __do_sys_fsmount() warn: inconsistent indenting
Message-ID: <202602151451.Mx14gAWq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   0b7243a05fc7f6484b8c81985b6b9c23c86ab464
commit: e7b9229db7952240e952282065e4272934d9e0c8 [14/17] vfs: Allow mounting to other namespaces
config: x86_64-randconfig-161-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151451.Mx14gAWq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151451.Mx14gAWq-lkp@intel.com/

New smatch warnings:
fs/namespace.c:4364 __do_sys_fsmount() warn: inconsistent indenting
fs/namespace.c:4364 __do_sys_fsmount() warn: inconsistent indenting
fs/namespace.c:4636 __do_sys_move_mount() warn: fd re-used after fget(): 'to_dfd'
fs/namespace.c:4636 __do_sys_move_mount() warn: fd re-used after fget(): 'to_dfd'

Old smatch warnings:
fs/namespace.c:1421 mntput_no_expire() warn: inconsistent returns 'rcu_read'.
fs/namespace.c:2835 may_change_propagation() warn: inconsistent indenting

vim +4364 fs/namespace.c

5b490500f91b21 Christian Brauner 2021-01-21  4279  
2db154b3ea8e14 David Howells     2018-11-05  4280  /*
93766fbd2696c2 David Howells     2018-11-01  4281   * Create a kernel mount representation for a new, prepared superblock
93766fbd2696c2 David Howells     2018-11-01  4282   * (specified by fs_fd) and attach to an open_tree-like file descriptor.
93766fbd2696c2 David Howells     2018-11-01  4283   */
93766fbd2696c2 David Howells     2018-11-01  4284  SYSCALL_DEFINE3(fsmount, int, fs_fd, unsigned int, flags,
93766fbd2696c2 David Howells     2018-11-01  4285  		unsigned int, attr_flags)
93766fbd2696c2 David Howells     2018-11-01  4286  {
05885f41658ce9 Christian Brauner 2025-11-23  4287  	struct path new_path __free(path_put) = {};
93766fbd2696c2 David Howells     2018-11-01  4288  	struct mnt_namespace *ns;
93766fbd2696c2 David Howells     2018-11-01  4289  	struct fs_context *fc;
05885f41658ce9 Christian Brauner 2025-11-23  4290  	struct vfsmount *new_mnt;
93766fbd2696c2 David Howells     2018-11-01  4291  	struct mount *mnt;
93766fbd2696c2 David Howells     2018-11-01  4292  	unsigned int mnt_flags = 0;
93766fbd2696c2 David Howells     2018-11-01  4293  	long ret;
93766fbd2696c2 David Howells     2018-11-01  4294  
93766fbd2696c2 David Howells     2018-11-01  4295  	if (!may_mount())
93766fbd2696c2 David Howells     2018-11-01  4296  		return -EPERM;
93766fbd2696c2 David Howells     2018-11-01  4297  
93766fbd2696c2 David Howells     2018-11-01  4298  	if ((flags & ~(FSMOUNT_CLOEXEC)) != 0)
93766fbd2696c2 David Howells     2018-11-01  4299  		return -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4300  
5b490500f91b21 Christian Brauner 2021-01-21  4301  	if (attr_flags & ~FSMOUNT_VALID_FLAGS)
93766fbd2696c2 David Howells     2018-11-01  4302  		return -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4303  
5b490500f91b21 Christian Brauner 2021-01-21  4304  	mnt_flags = attr_flags_to_mnt_flags(attr_flags);
93766fbd2696c2 David Howells     2018-11-01  4305  
93766fbd2696c2 David Howells     2018-11-01  4306  	switch (attr_flags & MOUNT_ATTR__ATIME) {
93766fbd2696c2 David Howells     2018-11-01  4307  	case MOUNT_ATTR_STRICTATIME:
93766fbd2696c2 David Howells     2018-11-01  4308  		break;
93766fbd2696c2 David Howells     2018-11-01  4309  	case MOUNT_ATTR_NOATIME:
93766fbd2696c2 David Howells     2018-11-01  4310  		mnt_flags |= MNT_NOATIME;
93766fbd2696c2 David Howells     2018-11-01  4311  		break;
93766fbd2696c2 David Howells     2018-11-01  4312  	case MOUNT_ATTR_RELATIME:
93766fbd2696c2 David Howells     2018-11-01  4313  		mnt_flags |= MNT_RELATIME;
93766fbd2696c2 David Howells     2018-11-01  4314  		break;
93766fbd2696c2 David Howells     2018-11-01  4315  	default:
93766fbd2696c2 David Howells     2018-11-01  4316  		return -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4317  	}
93766fbd2696c2 David Howells     2018-11-01  4318  
8152f820108835 Al Viro           2024-07-19  4319  	CLASS(fd, f)(fs_fd);
8152f820108835 Al Viro           2024-07-19  4320  	if (fd_empty(f))
93766fbd2696c2 David Howells     2018-11-01  4321  		return -EBADF;
93766fbd2696c2 David Howells     2018-11-01  4322  
1da91ea87aefe2 Al Viro           2024-05-31  4323  	if (fd_file(f)->f_op != &fscontext_fops)
8152f820108835 Al Viro           2024-07-19  4324  		return -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4325  
1da91ea87aefe2 Al Viro           2024-05-31  4326  	fc = fd_file(f)->private_data;
93766fbd2696c2 David Howells     2018-11-01  4327  
05885f41658ce9 Christian Brauner 2025-11-23  4328  	ACQUIRE(mutex_intr, uapi_mutex)(&fc->uapi_mutex);
05885f41658ce9 Christian Brauner 2025-11-23  4329  	ret = ACQUIRE_ERR(mutex_intr, &uapi_mutex);
05885f41658ce9 Christian Brauner 2025-11-23  4330  	if (ret)
8152f820108835 Al Viro           2024-07-19  4331  		return ret;
93766fbd2696c2 David Howells     2018-11-01  4332  
93766fbd2696c2 David Howells     2018-11-01  4333  	/* There must be a valid superblock or we can't mount it */
93766fbd2696c2 David Howells     2018-11-01  4334  	ret = -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4335  	if (!fc->root)
05885f41658ce9 Christian Brauner 2025-11-23  4336  		return ret;
93766fbd2696c2 David Howells     2018-11-01  4337  
93766fbd2696c2 David Howells     2018-11-01  4338  	ret = -EPERM;
93766fbd2696c2 David Howells     2018-11-01  4339  	if (mount_too_revealing(fc->root->d_sb, &mnt_flags)) {
807602d8cfc8b6 Aleksa Sarai      2025-08-06  4340  		errorfcp(fc, "VFS", "Mount too revealing");
05885f41658ce9 Christian Brauner 2025-11-23  4341  		return ret;
93766fbd2696c2 David Howells     2018-11-01  4342  	}
93766fbd2696c2 David Howells     2018-11-01  4343  
93766fbd2696c2 David Howells     2018-11-01  4344  	ret = -EBUSY;
93766fbd2696c2 David Howells     2018-11-01  4345  	if (fc->phase != FS_CONTEXT_AWAITING_MOUNT)
05885f41658ce9 Christian Brauner 2025-11-23  4346  		return ret;
93766fbd2696c2 David Howells     2018-11-01  4347  
f7e33bdbd6d1bd Jeff Layton       2021-08-19  4348  	if (fc->sb_flags & SB_MANDLOCK)
f7e33bdbd6d1bd Jeff Layton       2021-08-19  4349  		warn_mandlock();
93766fbd2696c2 David Howells     2018-11-01  4350  
05885f41658ce9 Christian Brauner 2025-11-23  4351  	new_mnt = vfs_create_mount(fc);
05885f41658ce9 Christian Brauner 2025-11-23  4352  	if (IS_ERR(new_mnt))
05885f41658ce9 Christian Brauner 2025-11-23  4353  		return PTR_ERR(new_mnt);
05885f41658ce9 Christian Brauner 2025-11-23  4354  	new_mnt->mnt_flags = mnt_flags;
05885f41658ce9 Christian Brauner 2025-11-23  4355  
05885f41658ce9 Christian Brauner 2025-11-23  4356  	new_path.dentry = dget(fc->root);
05885f41658ce9 Christian Brauner 2025-11-23  4357  	new_path.mnt = new_mnt;
93766fbd2696c2 David Howells     2018-11-01  4358  
93766fbd2696c2 David Howells     2018-11-01  4359  	/* We've done the mount bit - now move the file context into more or
93766fbd2696c2 David Howells     2018-11-01  4360  	 * less the same state as if we'd done an fspick().  We don't want to
93766fbd2696c2 David Howells     2018-11-01  4361  	 * do any memory allocation or anything like that at this point as we
93766fbd2696c2 David Howells     2018-11-01  4362  	 * don't want to have to handle any errors incurred.
93766fbd2696c2 David Howells     2018-11-01  4363  	 */
93766fbd2696c2 David Howells     2018-11-01 @4364  vfs_clean_context(fc);
93766fbd2696c2 David Howells     2018-11-01  4365  

:::::: The code at line 4364 was first introduced by commit
:::::: 93766fbd2696c2c4453dd8e1070977e9cd4e6b6d vfs: syscall: Add fsmount() to create a mount for a superblock

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
