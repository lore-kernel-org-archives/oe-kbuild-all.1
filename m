Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E1C2D5412
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 18:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771697707; cv=none; b=hxFd4JoS3zfEZCKrfQ+DpQaB3UIUGD5/BO0s8Ls6zM01nhCDTyEU4lsKdk77WMYWX240LxktIEcMvqpW413ZToWyKPMeqoJEJ8fypnKECatMHgRUkduD6YoLXj5hHySUZ4gbUjo1UdMq+wd9qwZKLTwA2ImDg7r7JBtqpCwm9mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771697707; c=relaxed/simple;
	bh=TloMzQueb8ycp5YBpe07YV+01+CRsXPNN2TvnuTjIsQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JdzMxB1hZcgseyiil1cKLzsWLr6GQyZAyArB+gs52ZXqv1vQPDjVmkfCEH7poGYJ/L0JHJ2VXApRlUGrD5W3CLQEsTKPHN81iBqoKQWvhE4JfLx597ZRpdAChzKKCkNcU8AgGI8CdYrax4Q/q4sFLTuHxG0xFA5Di8GEHHWBXFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsFqDoZz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsFqDoZz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771697704; x=1803233704;
  h=date:from:to:cc:subject:message-id;
  bh=TloMzQueb8ycp5YBpe07YV+01+CRsXPNN2TvnuTjIsQ=;
  b=IsFqDoZzlMGRMcHLEfpewrLV7bTeCMlPPo4jRS+uYlwjnMIMozERlMT7
   0FbFTm67OBQIBwf+f+QnqrOqrTlTbA/+BuaDJ8HnPQF9eNFF9fsrA6zEg
   BppIX873cdH5r58CZ+U11ynx13OBiyMiuRkR0RiO+CJS4IssUgUV70358
   SwDuaEcw2D0gFfltWCs0CKBNlGsx8oREWBGZaEwW2oTqpl/8ndkySV6he
   VyqYnpllX5P4L287GripIL9Aiwd/VZqaI7PeZReXLQRaxVMIMHKUg+sxF
   hzIz4DF7WvwE6YbWip1CRsKfq2ZO7V47ICwaX954t64FLEjUFtj1aTlvP
   Q==;
X-CSE-ConnectionGUID: LayCMSHNQ0Ws1GnzW0oKkQ==
X-CSE-MsgGUID: VTjDhCEvQfySD0hPCgVHwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="95372300"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="95372300"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 10:15:04 -0800
X-CSE-ConnectionGUID: 33kkYMooTnKzQjRxnl1D5g==
X-CSE-MsgGUID: C1Kloq0dQui+/0y9DE9AWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="218794843"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 21 Feb 2026 10:15:02 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtrVL-000000004RJ-44Tb;
	Sat, 21 Feb 2026 18:14:59 +0000
Date: Sat, 21 Feb 2026 19:14:35 +0100
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 11/17] fs/namespace.c:4682:28: error:
 redefinition of 'to_name'
Message-ID: <202602211908.3kCaaLwr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   359a5197d115ba7a640fac1b12e42be6820d9126
commit: c1ecad0ba1ebca55274a8dd7c3b72634876ff531 [11/17] rootns, vfs: Install rootns root mount tree
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260221/202602211908.3kCaaLwr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602211908.3kCaaLwr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602211908.3kCaaLwr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/namespace.c:4682:28: error: redefinition of 'to_name'
    4682 |         CLASS(filename_maybe_null,to_name)(to_pathname, uflags);
         |                                   ^
   fs/namespace.c:4655:19: note: previous definition is here
    4655 |         struct filename *to_name __free(putname) = NULL;
         |                          ^
>> fs/namespace.c:4779:28: error: redefinition of 'from_name'
    4779 |         CLASS(filename_maybe_null,from_name)(from_pathname, uflags);
         |                                   ^
   fs/namespace.c:4656:19: note: previous definition is here
    4656 |         struct filename *from_name __free(putname) = NULL;
         |                          ^
   2 errors generated.


vim +/to_name +4682 fs/namespace.c

c1ecad0ba1ebca David Howells     2019-02-01  4638  
93766fbd2696c2 David Howells     2018-11-01  4639  /*
93766fbd2696c2 David Howells     2018-11-01  4640   * Move a mount from one place to another.  In combination with
93766fbd2696c2 David Howells     2018-11-01  4641   * fsopen()/fsmount() this is used to install a new mount and in combination
93766fbd2696c2 David Howells     2018-11-01  4642   * with open_tree(OPEN_TREE_CLONE [| AT_RECURSIVE]) it can be used to copy
93766fbd2696c2 David Howells     2018-11-01  4643   * a mount subtree.
2db154b3ea8e14 David Howells     2018-11-05  4644   *
2db154b3ea8e14 David Howells     2018-11-05  4645   * Note the flags value is a combination of MOVE_MOUNT_* flags.
2db154b3ea8e14 David Howells     2018-11-05  4646   */
2db154b3ea8e14 David Howells     2018-11-05  4647  SYSCALL_DEFINE5(move_mount,
2658ce095df583 Ben Dooks         2019-10-15  4648  		int, from_dfd, const char __user *, from_pathname,
2658ce095df583 Ben Dooks         2019-10-15  4649  		int, to_dfd, const char __user *, to_pathname,
2db154b3ea8e14 David Howells     2018-11-05  4650  		unsigned int, flags)
2db154b3ea8e14 David Howells     2018-11-05  4651  {
f9fde814de3755 Christian Brauner 2025-02-21  4652  	struct path to_path __free(path_put) = {};
f9fde814de3755 Christian Brauner 2025-02-21  4653  	struct path from_path __free(path_put) = {};
c1ecad0ba1ebca David Howells     2019-02-01  4654  	struct path rootns_root __free(path_put) = {};
c1ecad0ba1ebca David Howells     2019-02-01  4655  	struct filename *to_name __free(putname) = NULL;
c1ecad0ba1ebca David Howells     2019-02-01  4656  	struct filename *from_name __free(putname) = NULL;
f9fde814de3755 Christian Brauner 2025-02-21  4657  	unsigned int lflags, uflags;
f9fde814de3755 Christian Brauner 2025-02-21  4658  	enum mnt_tree_flags_t mflags = 0;
c1ecad0ba1ebca David Howells     2019-02-01  4659  	bool to_rootns = false;
c1ecad0ba1ebca David Howells     2019-02-01  4660  	struct rootns *rootns;
c1ecad0ba1ebca David Howells     2019-02-01  4661  	struct fd f;
c1ecad0ba1ebca David Howells     2019-02-01  4662  	char buf[2];
2db154b3ea8e14 David Howells     2018-11-05  4663  	int ret = 0;
2db154b3ea8e14 David Howells     2018-11-05  4664  
2db154b3ea8e14 David Howells     2018-11-05  4665  	if (!may_mount())
2db154b3ea8e14 David Howells     2018-11-05  4666  		return -EPERM;
2db154b3ea8e14 David Howells     2018-11-05  4667  
2db154b3ea8e14 David Howells     2018-11-05  4668  	if (flags & ~MOVE_MOUNT__MASK)
2db154b3ea8e14 David Howells     2018-11-05  4669  		return -EINVAL;
2db154b3ea8e14 David Howells     2018-11-05  4670  
6ac392815628f3 Christian Brauner 2023-05-03  4671  	if ((flags & (MOVE_MOUNT_BENEATH | MOVE_MOUNT_SET_GROUP)) ==
6ac392815628f3 Christian Brauner 2023-05-03  4672  	    (MOVE_MOUNT_BENEATH | MOVE_MOUNT_SET_GROUP))
6ac392815628f3 Christian Brauner 2023-05-03  4673  		return -EINVAL;
6ac392815628f3 Christian Brauner 2023-05-03  4674  
f9fde814de3755 Christian Brauner 2025-02-21  4675  	if (flags & MOVE_MOUNT_SET_GROUP)	mflags |= MNT_TREE_PROPAGATION;
f9fde814de3755 Christian Brauner 2025-02-21  4676  	if (flags & MOVE_MOUNT_BENEATH)		mflags |= MNT_TREE_BENEATH;
f9fde814de3755 Christian Brauner 2025-02-21  4677  
99b6a1dee086e6 Arnd Bergmann     2025-02-26  4678  	uflags = 0;
593d9e4c3d634c Yuntao Wang       2025-08-11  4679  	if (flags & MOVE_MOUNT_T_EMPTY_PATH)
593d9e4c3d634c Yuntao Wang       2025-08-11  4680  		uflags = AT_EMPTY_PATH;
2db154b3ea8e14 David Howells     2018-11-05  4681  
cbe9e300a2c196 Al Viro           2025-12-14 @4682  	CLASS(filename_maybe_null,to_name)(to_pathname, uflags);
c1ecad0ba1ebca David Howells     2019-02-01  4683  
c1ecad0ba1ebca David Howells     2019-02-01  4684  	if (unlikely(flags & MOVE_MOUNT_T_ROOTNS_ROOT)) {
c1ecad0ba1ebca David Howells     2019-02-01  4685  		if (flags & (MOVE_MOUNT_T_SYMLINKS |
c1ecad0ba1ebca David Howells     2019-02-01  4686  			     MOVE_MOUNT_T_AUTOMOUNTS |
c1ecad0ba1ebca David Howells     2019-02-01  4687  			     MOVE_MOUNT_T_EMPTY_PATH))
c1ecad0ba1ebca David Howells     2019-02-01  4688  			return -EINVAL;
c1ecad0ba1ebca David Howells     2019-02-01  4689  		if (strncpy_from_user(buf, to_pathname, 2) < 0)
c1ecad0ba1ebca David Howells     2019-02-01  4690  			return -EFAULT;
c1ecad0ba1ebca David Howells     2019-02-01  4691  		if (buf[0] != '/' || buf[1] != '\0')
c1ecad0ba1ebca David Howells     2019-02-01  4692  			return -EINVAL;
c1ecad0ba1ebca David Howells     2019-02-01  4693  		if (buf[0] == '/' && buf[1] == '\0') {
c1ecad0ba1ebca David Howells     2019-02-01  4694  			/*
c1ecad0ba1ebca David Howells     2019-02-01  4695  			 * Set the root. This might be better done by
c1ecad0ba1ebca David Howells     2019-02-01  4696  			 * requiring to_pathname to be NULL.
c1ecad0ba1ebca David Howells     2019-02-01  4697  			 */
c1ecad0ba1ebca David Howells     2019-02-01  4698  			uflags = 0;
c1ecad0ba1ebca David Howells     2019-02-01  4699  			if (flags & MOVE_MOUNT_F_EMPTY_PATH)
c1ecad0ba1ebca David Howells     2019-02-01  4700  				uflags = AT_EMPTY_PATH;
c1ecad0ba1ebca David Howells     2019-02-01  4701  			from_name = getname_maybe_null(from_pathname, uflags);
c1ecad0ba1ebca David Howells     2019-02-01  4702  			if (IS_ERR(from_name))
c1ecad0ba1ebca David Howells     2019-02-01  4703  				return PTR_ERR(from_name);
c1ecad0ba1ebca David Howells     2019-02-01  4704  
c1ecad0ba1ebca David Howells     2019-02-01  4705  			if (!from_name && from_dfd >= 0) {
c1ecad0ba1ebca David Howells     2019-02-01  4706  				CLASS(fd_raw, f_from)(from_dfd);
c1ecad0ba1ebca David Howells     2019-02-01  4707  				if (fd_empty(f_from))
c1ecad0ba1ebca David Howells     2019-02-01  4708  					return -EBADF;
c1ecad0ba1ebca David Howells     2019-02-01  4709  
c1ecad0ba1ebca David Howells     2019-02-01  4710  				from_path = fd_file(f_from)->f_path;
c1ecad0ba1ebca David Howells     2019-02-01  4711  				path_get(&from_path);
c1ecad0ba1ebca David Howells     2019-02-01  4712  			} else {
c1ecad0ba1ebca David Howells     2019-02-01  4713  				lflags = 0;
c1ecad0ba1ebca David Howells     2019-02-01  4714  				if (flags & MOVE_MOUNT_F_SYMLINKS)
c1ecad0ba1ebca David Howells     2019-02-01  4715  					lflags |= LOOKUP_FOLLOW;
c1ecad0ba1ebca David Howells     2019-02-01  4716  				if (flags & MOVE_MOUNT_F_AUTOMOUNTS)
c1ecad0ba1ebca David Howells     2019-02-01  4717  					lflags |= LOOKUP_AUTOMOUNT;
c1ecad0ba1ebca David Howells     2019-02-01  4718  				ret = filename_lookup(from_dfd, from_name, lflags,
c1ecad0ba1ebca David Howells     2019-02-01  4719  						      &from_path, NULL);
c1ecad0ba1ebca David Howells     2019-02-01  4720  				if (ret)
c1ecad0ba1ebca David Howells     2019-02-01  4721  					return ret;
c1ecad0ba1ebca David Howells     2019-02-01  4722  			}
c1ecad0ba1ebca David Howells     2019-02-01  4723  			return set_rootns_root(&from_path, to_dfd);
c1ecad0ba1ebca David Howells     2019-02-01  4724  		}
c1ecad0ba1ebca David Howells     2019-02-01  4725  
c1ecad0ba1ebca David Howells     2019-02-01  4726  		/* Check the fd is a rootns handle.  This isn't a perfect
c1ecad0ba1ebca David Howells     2019-02-01  4727  		 * check as another thread can jump in and change the fd
c1ecad0ba1ebca David Howells     2019-02-01  4728  		 * between now and when pathwalk looks it up.
c1ecad0ba1ebca David Howells     2019-02-01  4729  		 */
c1ecad0ba1ebca David Howells     2019-02-01  4730  		if (buf[0] == '/')
c1ecad0ba1ebca David Howells     2019-02-01  4731  			return -EINVAL;
c1ecad0ba1ebca David Howells     2019-02-01  4732  		f = fdget(to_dfd);
c1ecad0ba1ebca David Howells     2019-02-01  4733  		if (fd_empty(f))
c1ecad0ba1ebca David Howells     2019-02-01  4734  			return -EBADF;
c1ecad0ba1ebca David Howells     2019-02-01  4735  		if (!is_rootns_file(fd_file(f))) {
c1ecad0ba1ebca David Howells     2019-02-01  4736  			fdput(f);
c1ecad0ba1ebca David Howells     2019-02-01  4737  			return -EINVAL;
c1ecad0ba1ebca David Howells     2019-02-01  4738  		}
c1ecad0ba1ebca David Howells     2019-02-01  4739  		rootns = fd_file(f)->private_data;
c1ecad0ba1ebca David Howells     2019-02-01  4740  		spin_lock(&rootns->members_lock);
c1ecad0ba1ebca David Howells     2019-02-01  4741  		if (!rootns->fs_ready) {
c1ecad0ba1ebca David Howells     2019-02-01  4742  			spin_unlock(&rootns->members_lock);
c1ecad0ba1ebca David Howells     2019-02-01  4743  			fdput(f);
c1ecad0ba1ebca David Howells     2019-02-01  4744  			return -ENOENT;
c1ecad0ba1ebca David Howells     2019-02-01  4745  		}
c1ecad0ba1ebca David Howells     2019-02-01  4746  		rootns_root = rootns->root;
c1ecad0ba1ebca David Howells     2019-02-01  4747  		path_get(&rootns_root);
c1ecad0ba1ebca David Howells     2019-02-01  4748  		spin_unlock(&rootns->members_lock);
c1ecad0ba1ebca David Howells     2019-02-01  4749  			fdput(f);
c1ecad0ba1ebca David Howells     2019-02-01  4750  			mflags |= MNT_TREE_ROOTNS;
c1ecad0ba1ebca David Howells     2019-02-01  4751  			to_rootns = true;
c1ecad0ba1ebca David Howells     2019-02-01  4752  		}
c1ecad0ba1ebca David Howells     2019-02-01  4753  	to_name = getname_maybe_null(to_pathname, uflags);
c1ecad0ba1ebca David Howells     2019-02-01  4754  	if (IS_ERR(to_name))
c1ecad0ba1ebca David Howells     2019-02-01  4755  		return PTR_ERR(to_name);
c1ecad0ba1ebca David Howells     2019-02-01  4756  
f9fde814de3755 Christian Brauner 2025-02-21  4757  	if (!to_name && to_dfd >= 0) {
f9fde814de3755 Christian Brauner 2025-02-21  4758  		CLASS(fd_raw, f_to)(to_dfd);
f9fde814de3755 Christian Brauner 2025-02-21  4759  		if (fd_empty(f_to))
f9fde814de3755 Christian Brauner 2025-02-21  4760  			return -EBADF;
2db154b3ea8e14 David Howells     2018-11-05  4761  
f9fde814de3755 Christian Brauner 2025-02-21  4762  		to_path = fd_file(f_to)->f_path;
f9fde814de3755 Christian Brauner 2025-02-21  4763  		path_get(&to_path);
f9fde814de3755 Christian Brauner 2025-02-21  4764  	} else {
593d9e4c3d634c Yuntao Wang       2025-08-11  4765  		lflags = 0;
593d9e4c3d634c Yuntao Wang       2025-08-11  4766  		if (flags & MOVE_MOUNT_T_SYMLINKS)
593d9e4c3d634c Yuntao Wang       2025-08-11  4767  			lflags |= LOOKUP_FOLLOW;
593d9e4c3d634c Yuntao Wang       2025-08-11  4768  		if (flags & MOVE_MOUNT_T_AUTOMOUNTS)
593d9e4c3d634c Yuntao Wang       2025-08-11  4769  			lflags |= LOOKUP_AUTOMOUNT;
f9fde814de3755 Christian Brauner 2025-02-21  4770  		ret = filename_lookup(to_dfd, to_name, lflags, &to_path, NULL);
f9fde814de3755 Christian Brauner 2025-02-21  4771  		if (ret)
f9fde814de3755 Christian Brauner 2025-02-21  4772  			return ret;
f9fde814de3755 Christian Brauner 2025-02-21  4773  	}
2db154b3ea8e14 David Howells     2018-11-05  4774  
593d9e4c3d634c Yuntao Wang       2025-08-11  4775  	uflags = 0;
593d9e4c3d634c Yuntao Wang       2025-08-11  4776  	if (flags & MOVE_MOUNT_F_EMPTY_PATH)
593d9e4c3d634c Yuntao Wang       2025-08-11  4777  		uflags = AT_EMPTY_PATH;
593d9e4c3d634c Yuntao Wang       2025-08-11  4778  
cbe9e300a2c196 Al Viro           2025-12-14 @4779  	CLASS(filename_maybe_null,from_name)(from_pathname, uflags);
f9fde814de3755 Christian Brauner 2025-02-21  4780  	if (!from_name && from_dfd >= 0) {
f9fde814de3755 Christian Brauner 2025-02-21  4781  		CLASS(fd_raw, f_from)(from_dfd);
f9fde814de3755 Christian Brauner 2025-02-21  4782  		if (fd_empty(f_from))
f9fde814de3755 Christian Brauner 2025-02-21  4783  			return -EBADF;
2db154b3ea8e14 David Howells     2018-11-05  4784  
f9fde814de3755 Christian Brauner 2025-02-21  4785  		return vfs_move_mount(&fd_file(f_from)->f_path, &to_path, mflags);
f9fde814de3755 Christian Brauner 2025-02-21  4786  	}
2db154b3ea8e14 David Howells     2018-11-05  4787  
593d9e4c3d634c Yuntao Wang       2025-08-11  4788  	lflags = 0;
593d9e4c3d634c Yuntao Wang       2025-08-11  4789  	if (flags & MOVE_MOUNT_F_SYMLINKS)
593d9e4c3d634c Yuntao Wang       2025-08-11  4790  		lflags |= LOOKUP_FOLLOW;
593d9e4c3d634c Yuntao Wang       2025-08-11  4791  	if (flags & MOVE_MOUNT_F_AUTOMOUNTS)
593d9e4c3d634c Yuntao Wang       2025-08-11  4792  		lflags |= LOOKUP_AUTOMOUNT;
f9fde814de3755 Christian Brauner 2025-02-21  4793  	ret = filename_lookup(from_dfd, from_name, lflags, &from_path, NULL);
f9fde814de3755 Christian Brauner 2025-02-21  4794  	if (ret)
2db154b3ea8e14 David Howells     2018-11-05  4795  		return ret;
f9fde814de3755 Christian Brauner 2025-02-21  4796  
f9fde814de3755 Christian Brauner 2025-02-21  4797  	return vfs_move_mount(&from_path, &to_path, mflags);
2db154b3ea8e14 David Howells     2018-11-05  4798  }
2db154b3ea8e14 David Howells     2018-11-05  4799  

:::::: The code at line 4682 was first introduced by commit
:::::: cbe9e300a2c196ecb47d83e1665901603aca4126 move_mount(2): switch to CLASS(filename_maybe_null)

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
