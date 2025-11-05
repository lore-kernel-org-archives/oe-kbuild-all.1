Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9A21A23B9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 07:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762326494; cv=none; b=lj91saCzlkNv0ZTlfgaENqIhECm8QXEYjmq81/tBzn5t5fTtDWltWLQo9nGS+gJ0WtwXMiEKyxGBWRv2gV/TL71ulkv/NFeKrl2WIHiKoggIirHFenX3rEAryfXMEip+3bKtT2temnnUUFE94koMOBUhcSnJ68SqWRXQiwqXebU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762326494; c=relaxed/simple;
	bh=ON6b8etBTswmnOBQdR5CY3AzZ4c3RkilqFniWGId5o4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QsdRcAhmdXSzpYRqjkUqYCxaB4lKFThew343yCCjCaFedUGssG8bX035d0nk39Q/A9396qtHzdatLjmSTEmDWb1g4Py2m/PQbDjMZpun+wyhRrpPrWHwU+9W9qG4Qd4Zc7b3wynuT9WCjvc6Hp4/WPjolnmTzK+/mMcUpCaeSAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DFlaMoCV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFlaMoCV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762326491; x=1793862491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ON6b8etBTswmnOBQdR5CY3AzZ4c3RkilqFniWGId5o4=;
  b=DFlaMoCVUCYGbXFPHKqpWS9Sa89s5K/5QaJPbABxlDxORw6wLaZZynIt
   u5bkaHKo+t9DLklHLdor4CRZJsc0RmvmuqvFPXj4J+7ZOU6eqEqjXVxZc
   hRHUcuxOTwvpQHh5qzfaFs6zW99jD5E5so9rNk25CA5iXk3iaeWZOyz8Z
   38K2i1x8zDw81wygtK83BoCTf7o7ILKbDtOjVQ5FOKQD/LQ5V68VZN+KH
   ij5ndF2xi2UWsN2dgPZZjLKmf6pjRvRN/7rmheKPlVGrvIlfRNWhTMXRj
   oRAn3bTjsTmBYrQb7lfyV/uxjJzmFkbVJWUa/LBqhz7lFaz/MmAi7T+uy
   g==;
X-CSE-ConnectionGUID: X9vh7uqUR4C6Po6ydBxfdg==
X-CSE-MsgGUID: qnmzS2HLQ0WtRCyDtUh85w==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="82060167"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="82060167"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 23:08:11 -0800
X-CSE-ConnectionGUID: C0/ugK06T1SA60vDY6yolQ==
X-CSE-MsgGUID: oxIn5LCLQEmA8xUaKztvhw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2025 23:08:09 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGXcl-000SFI-1k;
	Wed, 05 Nov 2025 07:08:07 +0000
Date: Wed, 5 Nov 2025 15:07:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 20/42] fs/namei.c:3492:31: error: use of
 undeclared identifier 'LEASE_BREAK_DIR_CREATE'
Message-ID: <202511051500.zgRIPr1M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   c4fcd7f276a417ffe8f80480c5c929b6764602d2
commit: 7e793d3d38f1b5bc5ac94a95dc4138ec1baa9db0 [20/42] filelock: add support for ignoring deleg breaks for dir change events
config: hexagon-randconfig-r072-20251105 (https://download.01.org/0day-ci/archive/20251105/202511051500.zgRIPr1M-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051500.zgRIPr1M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051500.zgRIPr1M-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/namei.c:3492:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    3492 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, args->delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:3792:38: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    3792 |                 error = try_break_deleg(dir_inode, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:4341:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4341 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:4492:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4492 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
>> fs/namei.c:4598:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    4598 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:4731:33: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    4731 |                         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:4883:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4883 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5015:32: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5015 |                 error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~
>> fs/namei.c:5285:26: error: use of undeclared identifier 'LEASE_BREAK_DIR_RENAME'
    5285 |                                 old_dir == new_dir ? LEASE_BREAK_DIR_RENAME :
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5286:12: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    5286 |                                                      LEASE_BREAK_DIR_DELETE,
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5291:36: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5291 |                 error = try_break_deleg(new_dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~
   11 errors generated.


vim +/LEASE_BREAK_DIR_CREATE +3492 fs/namei.c

  3460	
  3461	/**
  3462	 * vfs_create - create new file
  3463	 * @args:	struct createdata describing create to be done
  3464	 *
  3465	 * Create a new file.
  3466	 *
  3467	 * If the inode has been found through an idmapped mount the idmap of
  3468	 * the vfsmount must be passed through @args->idmap. This function will then take
  3469	 * care to map the inode according to @args->idmap before checking permissions.
  3470	 * On non-idmapped mounts or if permission checking is to be performed on the
  3471	 * raw inode simply pass @nop_mnt_idmap.
  3472	 */
  3473	int vfs_create(struct createdata *args)
  3474	{
  3475		struct mnt_idmap *idmap = args->idmap;
  3476		struct inode *dir = args->dir;
  3477		struct dentry *dentry = args->dentry;
  3478		umode_t mode = args->mode;
  3479		int error;
  3480	
  3481		error = may_create(idmap, dir, dentry);
  3482		if (error)
  3483			return error;
  3484	
  3485		if (!dir->i_op->create)
  3486			return -EACCES;	/* shouldn't it be ENOSYS? */
  3487	
  3488		mode = vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
  3489		error = security_inode_create(dir, dentry, mode);
  3490		if (error)
  3491			return error;
> 3492		error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, args->delegated_inode);
  3493		if (error)
  3494			return error;
  3495		error = dir->i_op->create(idmap, dir, dentry, mode, true);
  3496		if (!error)
  3497			fsnotify_create(dir, dentry);
  3498		return error;
  3499	}
  3500	EXPORT_SYMBOL(vfs_create);
  3501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
