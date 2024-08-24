Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868043BB22
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Aug 2024 09:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724491683; cv=none; b=t7XAy2rMh3biYTxSWE/+TdLU1enKW8kulb+s51cl7mLgEad6B4uFmNvj4o6ZkxGx33kuoZGdM0ZhGYzWsuJImiDQsjSolDGGL5YdBU4mf6oJxjtn4R4+ZCo1umqAclwsT2hwFAU6ZsjoczeRUbf6mkGGGJQbuwevzLxyYAtoJUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724491683; c=relaxed/simple;
	bh=bmOu0E9yHNUfHmY2m0ne3V33jz2L+zvyMop3bLVvTzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YiLhlmgRLUlP3IRtPjyxSD0k1yiZYEPpRr8OY0SgTulxg9N0AGqyIMeMIk6Ga5jQ4NeRavU/huN6TMCmPn0OPFKXGley9InHSHIBmhv2mY47rWJIpGw3R0lDncN555Cyb2jNpPp6O2VDF9bwZ4FSOkQqH8uQyrVqteT2w7o2XHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GM85zUz0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GM85zUz0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724491682; x=1756027682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bmOu0E9yHNUfHmY2m0ne3V33jz2L+zvyMop3bLVvTzU=;
  b=GM85zUz0h3kwqsUOsrCWpfAAW1qlyHUSSCBb40pDubowWiO011tkD21F
   xvgMpSS7X0DwKACSv4nVs3Xd8vIlpUdWzGmZXQ3Yq3QPQs/GsE6Ns0Jgj
   A8EBuZAIdVSA5yN5sZeK1YsGbzxMCvMSBEk2gX5WfqWvb1H2gyQjOw7Ky
   jTxjNPaJfbJkm1TjUGgnetgnB4MgcHwu9Te6kWpvEwnH0Glct9WsF2UPg
   9OLsJ4iLXsMIM8UB2gg4DmPyC2VlC26z5PMEJJyeCxzy49BHd53dFEXlT
   TTYCsiYLNi1BTZuU1OZTj6CzmCYRybfKXslS5U+NiWfR6glQG01hpCK0J
   w==;
X-CSE-ConnectionGUID: OL5P+4/DRdGqrjzsc1NBEQ==
X-CSE-MsgGUID: 1gCbg5gMSCKNbYVkX7OrZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="34133944"
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="34133944"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 02:28:01 -0700
X-CSE-ConnectionGUID: S4igBBT1Sl+0O2Zr7Ap3Ww==
X-CSE-MsgGUID: dIFP9WmPRG6PGwxkQl7hYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="85236531"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Aug 2024 02:27:59 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shn3t-000ENz-0H;
	Sat, 24 Aug 2024 09:27:57 +0000
Date: Sat, 24 Aug 2024 17:27:39 +0800
From: kernel test robot <lkp@intel.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neilb@suse.de>
Subject: [cel:nfsd-6.1.y 7/7] fs/nfsd/vfs.c:536:13: error: void value not
 ignored as it ought to be
Message-ID: <202408241727.6i0CNdWO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-6.1.y
head:   a5860f87bf2b5c77071640da909e49584284ec73
commit: a5860f87bf2b5c77071640da909e49584284ec73 [7/7] nfsd: Fix a regression in nfsd_setattr()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240824/202408241727.6i0CNdWO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408241727.6i0CNdWO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408241727.6i0CNdWO-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/vfs.c: In function 'nfsd_setattr':
>> fs/nfsd/vfs.c:536:13: error: void value not ignored as it ought to be
     536 |         err = fh_fill_pre_attrs(fhp);
         |             ^


vim +536 fs/nfsd/vfs.c

   451	
   452	/**
   453	 * nfsd_setattr - Set various file attributes.
   454	 * @rqstp: controlling RPC transaction
   455	 * @fhp: filehandle of target
   456	 * @attr: attributes to set
   457	 * @check_guard: set to 1 if guardtime is a valid timestamp
   458	 * @guardtime: do not act if ctime.tv_sec does not match this timestamp
   459	 *
   460	 * This call may adjust the contents of @attr (in particular, this
   461	 * call may change the bits in the na_iattr.ia_valid field).
   462	 *
   463	 * Returns nfs_ok on success, otherwise an NFS status code is
   464	 * returned. Caller must release @fhp by calling fh_put in either
   465	 * case.
   466	 */
   467	__be32
   468	nfsd_setattr(struct svc_rqst *rqstp, struct svc_fh *fhp,
   469		     struct nfsd_attrs *attr,
   470		     int check_guard, time64_t guardtime)
   471	{
   472		struct dentry	*dentry;
   473		struct inode	*inode;
   474		struct iattr	*iap = attr->na_iattr;
   475		int		accmode = NFSD_MAY_SATTR;
   476		umode_t		ftype = 0;
   477		__be32		err;
   478		int		host_err = 0;
   479		bool		get_write_count;
   480		bool		size_change = (iap->ia_valid & ATTR_SIZE);
   481		int		retries;
   482	
   483		if (iap->ia_valid & ATTR_SIZE) {
   484			accmode |= NFSD_MAY_WRITE|NFSD_MAY_OWNER_OVERRIDE;
   485			ftype = S_IFREG;
   486		}
   487	
   488		/*
   489		 * If utimes(2) and friends are called with times not NULL, we should
   490		 * not set NFSD_MAY_WRITE bit. Otherwise fh_verify->nfsd_permission
   491		 * will return EACCES, when the caller's effective UID does not match
   492		 * the owner of the file, and the caller is not privileged. In this
   493		 * situation, we should return EPERM(notify_change will return this).
   494		 */
   495		if (iap->ia_valid & (ATTR_ATIME | ATTR_MTIME)) {
   496			accmode |= NFSD_MAY_OWNER_OVERRIDE;
   497			if (!(iap->ia_valid & (ATTR_ATIME_SET | ATTR_MTIME_SET)))
   498				accmode |= NFSD_MAY_WRITE;
   499		}
   500	
   501		/* Callers that do fh_verify should do the fh_want_write: */
   502		get_write_count = !fhp->fh_dentry;
   503	
   504		/* Get inode */
   505		err = fh_verify(rqstp, fhp, ftype, accmode);
   506		if (err)
   507			return err;
   508		if (get_write_count) {
   509			host_err = fh_want_write(fhp);
   510			if (host_err)
   511				goto out;
   512		}
   513	
   514		dentry = fhp->fh_dentry;
   515		inode = d_inode(dentry);
   516	
   517		nfsd_sanitize_attrs(inode, iap);
   518	
   519		if (check_guard && guardtime != inode->i_ctime.tv_sec)
   520			return nfserr_notsync;
   521	
   522		/*
   523		 * The size case is special, it changes the file in addition to the
   524		 * attributes, and file systems don't expect it to be mixed with
   525		 * "random" attribute changes.  We thus split out the size change
   526		 * into a separate call to ->setattr, and do the rest as a separate
   527		 * setattr call.
   528		 */
   529		if (size_change) {
   530			err = nfsd_get_write_access(rqstp, fhp, iap);
   531			if (err)
   532				return err;
   533		}
   534	
   535		inode_lock(inode);
 > 536		err = fh_fill_pre_attrs(fhp);
   537		if (err)
   538			goto out_unlock;
   539		for (retries = 1;;) {
   540			struct iattr attrs;
   541	
   542			/*
   543			 * notify_change() can alter its iattr argument, making
   544			 * @iap unsuitable for submission multiple times. Make a
   545			 * copy for every loop iteration.
   546			 */
   547			attrs = *iap;
   548			host_err = __nfsd_setattr(dentry, &attrs);
   549			if (host_err != -EAGAIN || !retries--)
   550				break;
   551			if (!nfsd_wait_for_delegreturn(rqstp, inode))
   552				break;
   553		}
   554		if (attr->na_seclabel && attr->na_seclabel->len)
   555			attr->na_labelerr = security_inode_setsecctx(dentry,
   556				attr->na_seclabel->data, attr->na_seclabel->len);
   557		if (IS_ENABLED(CONFIG_FS_POSIX_ACL) && attr->na_pacl)
   558			attr->na_aclerr = set_posix_acl(&init_user_ns,
   559							inode, ACL_TYPE_ACCESS,
   560							attr->na_pacl);
   561		if (IS_ENABLED(CONFIG_FS_POSIX_ACL) &&
   562		    !attr->na_aclerr && attr->na_dpacl && S_ISDIR(inode->i_mode))
   563			attr->na_aclerr = set_posix_acl(&init_user_ns,
   564							inode, ACL_TYPE_DEFAULT,
   565							attr->na_dpacl);
   566		fh_fill_post_attrs(fhp);
   567	out_unlock:
   568		inode_unlock(inode);
   569		if (size_change)
   570			put_write_access(inode);
   571	out:
   572		if (!host_err)
   573			host_err = commit_metadata(fhp);
   574		return err != 0 ? err : nfserrno(host_err);
   575	}
   576	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
