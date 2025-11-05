Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209A2A927
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 07:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762327779; cv=none; b=qEmX/dB572x+fOeFF5KNWVIyZCXDPREePsKGcUV0t/SuHh75AIIBQA5XDjXENG9dgmFzwJwh2HJfI/diu9x7yVz4rmTdM1tFuzAYeJSVCT01VAQzq8yICB3yBKnRiOcBfXpqxwDOzqq+ZwGnwtCifM7iCUTtIztjifryI3XbAow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762327779; c=relaxed/simple;
	bh=Icufd+8+rMP4JL+3s/pxSmGVtorOdKKb3HrC2egQcN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z/6b4wJcprcV2s+3WLhlE6+F15JIlnE5UKboFKMMYMj/a/GTKLnEteiETEi8PcTM676Yte8zYOoZSzEda81RJDV3yAj+moImlnr1PqzK4h5OPN77qIWM0dpnN51I9FqdadvhJSOJeH9ZPf8aLH0XC3aOFHJwLRaCFG7f5v72oJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T5pQaVom; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5pQaVom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762327778; x=1793863778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Icufd+8+rMP4JL+3s/pxSmGVtorOdKKb3HrC2egQcN4=;
  b=T5pQaVomV31YUDxYXld3PzLbuNsktlj3jpKrgpgpe/sNvvtW2CQ0A3X2
   KZ7cfLDkQNkHUxp9VHJeprhidSFE7RJytTtwVSVNvVOmrIjr/7mWniwo+
   8UiDXgg5bRgusqy2EWvlU4aTpPZS6nWTieW/xPfoVoBAElDiBBNqO6ca0
   ljp1I+COmAQp9kRdRl3/YAmi3fVZ4fibfbME6Xj2Svj4wjR3Gj1HCheqk
   SQe0pp/n1LvXaxhkk0xboLBV4MGxAPpH2BUbacdgil0ROk9jibBxE+UHJ
   yIrUo81Rn/F8PGkBKr6Ly7uOwZRKp516n3sFG8syu2GEpGhHSg9gZFKYA
   g==;
X-CSE-ConnectionGUID: W7A6mGzORYug18ti4+vxfA==
X-CSE-MsgGUID: XtQDwCRYTVO3AGIxwNcd3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="52004049"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="52004049"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 23:29:37 -0800
X-CSE-ConnectionGUID: JA6ISPTCQj26w25prDe6Hw==
X-CSE-MsgGUID: Q/rEd1eBRMOiyu90sSNpvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="192544414"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Nov 2025 23:29:36 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGXxW-000SGC-06;
	Wed, 05 Nov 2025 07:29:34 +0000
Date: Wed, 5 Nov 2025 15:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 20/42] fs/namei.c:3492:31: error:
 'LEASE_BREAK_DIR_CREATE' undeclared; did you mean 'FL_IGN_DIR_CREATE'?
Message-ID: <202511051517.RT1fpMJM-lkp@intel.com>
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
config: arc-randconfig-001-20251105 (https://download.01.org/0day-ci/archive/20251105/202511051517.RT1fpMJM-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051517.RT1fpMJM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051517.RT1fpMJM-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/namei.c: In function 'vfs_create':
>> fs/namei.c:3492:31: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
     error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, args->delegated_inode);
                                  ^~~~~~~~~~~~~~~~~~~~~~
                                  FL_IGN_DIR_CREATE
   fs/namei.c:3492:31: note: each undeclared identifier is reported only once for each function it appears in
   fs/namei.c: In function 'lookup_open':
   fs/namei.c:3792:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
      error = try_break_deleg(dir_inode, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                         ^~~~~~~~~~~~~~~~~~~~~~
                                         FL_IGN_DIR_CREATE
   fs/namei.c: In function 'vfs_mknod':
   fs/namei.c:4341:31: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
     error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                  ^~~~~~~~~~~~~~~~~~~~~~
                                  FL_IGN_DIR_CREATE
   fs/namei.c: In function 'vfs_mkdir':
   fs/namei.c:4492:31: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
     error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                  ^~~~~~~~~~~~~~~~~~~~~~
                                  FL_IGN_DIR_CREATE
   fs/namei.c: In function 'vfs_rmdir':
>> fs/namei.c:4598:31: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_DELETE'?
     error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
                                  ^~~~~~~~~~~~~~~~~~~~~~
                                  FL_IGN_DIR_DELETE
   fs/namei.c: In function 'vfs_unlink':
   fs/namei.c:4731:33: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_DELETE'?
       error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
                                    ^~~~~~~~~~~~~~~~~~~~~~
                                    FL_IGN_DIR_DELETE
   fs/namei.c: In function 'vfs_symlink':
   fs/namei.c:4883:31: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
     error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                  ^~~~~~~~~~~~~~~~~~~~~~
                                  FL_IGN_DIR_CREATE
   fs/namei.c: In function 'vfs_link':
   fs/namei.c:5015:32: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
      error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                   ^~~~~~~~~~~~~~~~~~~~~~
                                   FL_IGN_DIR_CREATE
   fs/namei.c: In function 'vfs_rename':
>> fs/namei.c:5285:26: error: 'LEASE_BREAK_DIR_RENAME' undeclared (first use in this function); did you mean 'FL_IGN_DIR_RENAME'?
        old_dir == new_dir ? LEASE_BREAK_DIR_RENAME :
                             ^~~~~~~~~~~~~~~~~~~~~~
                             FL_IGN_DIR_RENAME
   fs/namei.c:5286:12: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_DELETE'?
               LEASE_BREAK_DIR_DELETE,
               ^~~~~~~~~~~~~~~~~~~~~~
               FL_IGN_DIR_DELETE
   fs/namei.c:5291:36: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
      error = try_break_deleg(new_dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                       ^~~~~~~~~~~~~~~~~~~~~~
                                       FL_IGN_DIR_CREATE


vim +3492 fs/namei.c

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
