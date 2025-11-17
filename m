Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C337628467D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 16:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763395461; cv=none; b=C0gSn0oIqZPEvBFygXDjl/2txk2dotcbDbSsdDA//NVEG4AuZCrs4wnpW4Ni9QqGa40/H95mYGF5FZkRrc11dBrFKMBaWKedUREEjXhth44vy7WANwMi8QxBOpMJgidWIV8in2EL1eMGzOFAjbKnTVG3NO4bzOmXNDiPH2tDplo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763395461; c=relaxed/simple;
	bh=YpIze0rJbAIdTC3BgkkinvvaIltmtHFiy1ciW1ijB6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R9CUTJ9HU2JhgHFJQLVpZ/dLiNbcc9DBtx53HD2ldBIxjvcXMBSB4LM3byGc+suMDKAx89f0JU6HQWxr2JuJrTtjG4sot7NpO2pNyXX1qNl34/fwn1LpxgEVx3koVwxCO7wSDbPZfj1xpVM3Gq2CVExNleHABq0qBlG/KWAc3ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghXgcqGS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghXgcqGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763395460; x=1794931460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YpIze0rJbAIdTC3BgkkinvvaIltmtHFiy1ciW1ijB6U=;
  b=ghXgcqGSF5kt5SZmE+vh9iEHhDpEKIaPiTo09Y2+ZL31aL7kmxdd406u
   t9wRmnosKoqWzeluM9jiWcNji6SwQ+TVERWbGCISKYEgIB53//2q/x8go
   sH4ohC3bA7BdTdqdNCGOAqWjVYLO0Q3i4Fq5HJg2sUZxR8kdHVwANBn+M
   jhB/rHUZNTx8/igNXxxYWxzP7lhGNPg55CjOzgGJYIUXAwYXABe29G43M
   SDhFeVxErkxGehj6wPRf3DgOymuqqGStgRbfH1PkLKF018DOPm2bQ7/qn
   qgUmSBbgcEXVH9fkCO5sWp9k5TvVH9ZgTEZLvTUov4SMbN1a7HqCkA5KB
   A==;
X-CSE-ConnectionGUID: WN3hF3mOQ1yrbkp78tQ+Cw==
X-CSE-MsgGUID: 6PztkqIbRKSbUB9nCjXueg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69019231"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="69019231"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 08:04:19 -0800
X-CSE-ConnectionGUID: b9uSdCjPQpqJmabBgdOVYw==
X-CSE-MsgGUID: s2aDrmYpRlKXwAunPD7lDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="195621049"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Nov 2025 08:04:19 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL1iC-0000lf-0V;
	Mon, 17 Nov 2025 16:04:16 +0000
Date: Tue, 18 Nov 2025 00:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 8167/9360] fs/nfsd/nfs3proc.c:262:23: warning:
 variable 'inode' set but not used
Message-ID: <202511180048.EhhRxVPY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0c1c7a6a83feaf2cf182c52983ffe330ffb50280
commit: f28c9935f78bffe6fee62f7fb9f6c5af7e30d9b2 [8167/9360] Merge branch 'vfs-6.19.directory.locking' into vfs.all
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20251118/202511180048.EhhRxVPY-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180048.EhhRxVPY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180048.EhhRxVPY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/nfsd/nfs3proc.c: In function 'nfsd3_create_file':
>> fs/nfsd/nfs3proc.c:262:23: warning: variable 'inode' set but not used [-Wunused-but-set-variable]
     262 |         struct inode *inode;
         |                       ^~~~~


vim +/inode +262 fs/nfsd/nfs3proc.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  244  
^1da177e4c3f41 Linus Torvalds 2005-04-16  245  /*
df9606abddfb01 Chuck Lever    2022-03-28  246   * Implement NFSv3's unchecked, guarded, and exclusive CREATE
df9606abddfb01 Chuck Lever    2022-03-28  247   * semantics for regular files. Except for the created file,
df9606abddfb01 Chuck Lever    2022-03-28  248   * this operation is stateless on the server.
df9606abddfb01 Chuck Lever    2022-03-28  249   *
df9606abddfb01 Chuck Lever    2022-03-28  250   * Upon return, caller must release @fhp and @resfhp.
df9606abddfb01 Chuck Lever    2022-03-28  251   */
df9606abddfb01 Chuck Lever    2022-03-28  252  static __be32
df9606abddfb01 Chuck Lever    2022-03-28  253  nfsd3_create_file(struct svc_rqst *rqstp, struct svc_fh *fhp,
df9606abddfb01 Chuck Lever    2022-03-28  254  		  struct svc_fh *resfhp, struct nfsd3_createargs *argp)
df9606abddfb01 Chuck Lever    2022-03-28  255  {
df9606abddfb01 Chuck Lever    2022-03-28  256  	struct iattr *iap = &argp->attrs;
df9606abddfb01 Chuck Lever    2022-03-28  257  	struct dentry *parent, *child;
7fe2a71dda349a NeilBrown      2022-07-26  258  	struct nfsd_attrs attrs = {
7fe2a71dda349a NeilBrown      2022-07-26  259  		.na_iattr	= iap,
7fe2a71dda349a NeilBrown      2022-07-26  260  	};
df9606abddfb01 Chuck Lever    2022-03-28  261  	__u32 v_mtime, v_atime;
df9606abddfb01 Chuck Lever    2022-03-28 @262  	struct inode *inode;
df9606abddfb01 Chuck Lever    2022-03-28  263  	__be32 status;
df9606abddfb01 Chuck Lever    2022-03-28  264  	int host_err;
df9606abddfb01 Chuck Lever    2022-03-28  265  
85b0b1f217856b Jeff Layton    2025-05-03  266  	trace_nfsd_vfs_create(rqstp, fhp, S_IFREG, argp->name, argp->len);
85b0b1f217856b Jeff Layton    2025-05-03  267  
df9606abddfb01 Chuck Lever    2022-03-28  268  	if (isdotent(argp->name, argp->len))
df9606abddfb01 Chuck Lever    2022-03-28  269  		return nfserr_exist;
df9606abddfb01 Chuck Lever    2022-03-28  270  	if (!(iap->ia_valid & ATTR_MODE))
df9606abddfb01 Chuck Lever    2022-03-28  271  		iap->ia_mode = 0;
df9606abddfb01 Chuck Lever    2022-03-28  272  
df9606abddfb01 Chuck Lever    2022-03-28  273  	status = fh_verify(rqstp, fhp, S_IFDIR, NFSD_MAY_EXEC);
df9606abddfb01 Chuck Lever    2022-03-28  274  	if (status != nfs_ok)
df9606abddfb01 Chuck Lever    2022-03-28  275  		return status;
df9606abddfb01 Chuck Lever    2022-03-28  276  
df9606abddfb01 Chuck Lever    2022-03-28  277  	parent = fhp->fh_dentry;
df9606abddfb01 Chuck Lever    2022-03-28  278  	inode = d_inode(parent);
df9606abddfb01 Chuck Lever    2022-03-28  279  
df9606abddfb01 Chuck Lever    2022-03-28  280  	host_err = fh_want_write(fhp);
df9606abddfb01 Chuck Lever    2022-03-28  281  	if (host_err)
df9606abddfb01 Chuck Lever    2022-03-28  282  		return nfserrno(host_err);
df9606abddfb01 Chuck Lever    2022-03-28  283  
7ab96df840e60e NeilBrown      2025-11-13  284  	child = start_creating(&nop_mnt_idmap, parent,
7ab96df840e60e NeilBrown      2025-11-13  285  			       &QSTR_LEN(argp->name, argp->len));
df9606abddfb01 Chuck Lever    2022-03-28  286  	if (IS_ERR(child)) {
df9606abddfb01 Chuck Lever    2022-03-28  287  		status = nfserrno(PTR_ERR(child));
7ab96df840e60e NeilBrown      2025-11-13  288  		goto out_write;
df9606abddfb01 Chuck Lever    2022-03-28  289  	}
df9606abddfb01 Chuck Lever    2022-03-28  290  
df9606abddfb01 Chuck Lever    2022-03-28  291  	if (d_really_is_negative(child)) {
df9606abddfb01 Chuck Lever    2022-03-28  292  		status = fh_verify(rqstp, fhp, S_IFDIR, NFSD_MAY_CREATE);
df9606abddfb01 Chuck Lever    2022-03-28  293  		if (status != nfs_ok)
df9606abddfb01 Chuck Lever    2022-03-28  294  			goto out;
df9606abddfb01 Chuck Lever    2022-03-28  295  	}
df9606abddfb01 Chuck Lever    2022-03-28  296  
df9606abddfb01 Chuck Lever    2022-03-28  297  	status = fh_compose(resfhp, fhp->fh_export, child, fhp);
df9606abddfb01 Chuck Lever    2022-03-28  298  	if (status != nfs_ok)
df9606abddfb01 Chuck Lever    2022-03-28  299  		goto out;
df9606abddfb01 Chuck Lever    2022-03-28  300  
df9606abddfb01 Chuck Lever    2022-03-28  301  	v_mtime = 0;
df9606abddfb01 Chuck Lever    2022-03-28  302  	v_atime = 0;
df9606abddfb01 Chuck Lever    2022-03-28  303  	if (argp->createmode == NFS3_CREATE_EXCLUSIVE) {
df9606abddfb01 Chuck Lever    2022-03-28  304  		u32 *verifier = (u32 *)argp->verf;
df9606abddfb01 Chuck Lever    2022-03-28  305  
df9606abddfb01 Chuck Lever    2022-03-28  306  		/*
df9606abddfb01 Chuck Lever    2022-03-28  307  		 * Solaris 7 gets confused (bugid 4218508) if these have
df9606abddfb01 Chuck Lever    2022-03-28  308  		 * the high bit set, as do xfs filesystems without the
df9606abddfb01 Chuck Lever    2022-03-28  309  		 * "bigtime" feature. So just clear the high bits.
^1da177e4c3f41 Linus Torvalds 2005-04-16  310  		 */
df9606abddfb01 Chuck Lever    2022-03-28  311  		v_mtime = verifier[0] & 0x7fffffff;
df9606abddfb01 Chuck Lever    2022-03-28  312  		v_atime = verifier[1] & 0x7fffffff;
df9606abddfb01 Chuck Lever    2022-03-28  313  	}
df9606abddfb01 Chuck Lever    2022-03-28  314  
df9606abddfb01 Chuck Lever    2022-03-28  315  	if (d_really_is_positive(child)) {
df9606abddfb01 Chuck Lever    2022-03-28  316  		status = nfs_ok;
df9606abddfb01 Chuck Lever    2022-03-28  317  
df9606abddfb01 Chuck Lever    2022-03-28  318  		switch (argp->createmode) {
df9606abddfb01 Chuck Lever    2022-03-28  319  		case NFS3_CREATE_UNCHECKED:
df9606abddfb01 Chuck Lever    2022-03-28  320  			if (!d_is_reg(child))
df9606abddfb01 Chuck Lever    2022-03-28  321  				break;
df9606abddfb01 Chuck Lever    2022-03-28  322  			iap->ia_valid &= ATTR_SIZE;
df9606abddfb01 Chuck Lever    2022-03-28  323  			goto set_attr;
df9606abddfb01 Chuck Lever    2022-03-28  324  		case NFS3_CREATE_GUARDED:
df9606abddfb01 Chuck Lever    2022-03-28  325  			status = nfserr_exist;
df9606abddfb01 Chuck Lever    2022-03-28  326  			break;
df9606abddfb01 Chuck Lever    2022-03-28  327  		case NFS3_CREATE_EXCLUSIVE:
11fec9b9fb04fd Jeff Layton    2023-10-04  328  			if (inode_get_mtime_sec(d_inode(child)) == v_mtime &&
11fec9b9fb04fd Jeff Layton    2023-10-04  329  			    inode_get_atime_sec(d_inode(child)) == v_atime &&
df9606abddfb01 Chuck Lever    2022-03-28  330  			    d_inode(child)->i_size == 0) {
df9606abddfb01 Chuck Lever    2022-03-28  331  				break;
df9606abddfb01 Chuck Lever    2022-03-28  332  			}
df9606abddfb01 Chuck Lever    2022-03-28  333  			status = nfserr_exist;
df9606abddfb01 Chuck Lever    2022-03-28  334  		}
df9606abddfb01 Chuck Lever    2022-03-28  335  		goto out;
df9606abddfb01 Chuck Lever    2022-03-28  336  	}
df9606abddfb01 Chuck Lever    2022-03-28  337  
df9606abddfb01 Chuck Lever    2022-03-28  338  	if (!IS_POSIXACL(inode))
df9606abddfb01 Chuck Lever    2022-03-28  339  		iap->ia_mode &= ~current_umask();
df9606abddfb01 Chuck Lever    2022-03-28  340  
a332018a91c419 Jeff Layton    2023-07-21  341  	status = fh_fill_pre_attrs(fhp);
a332018a91c419 Jeff Layton    2023-07-21  342  	if (status != nfs_ok)
a332018a91c419 Jeff Layton    2023-07-21  343  		goto out;
c826229c6a82fe Jeff Layton    2025-11-11  344  	host_err = vfs_create(&nop_mnt_idmap, child, iap->ia_mode, NULL);
df9606abddfb01 Chuck Lever    2022-03-28  345  	if (host_err < 0) {
df9606abddfb01 Chuck Lever    2022-03-28  346  		status = nfserrno(host_err);
df9606abddfb01 Chuck Lever    2022-03-28  347  		goto out;
df9606abddfb01 Chuck Lever    2022-03-28  348  	}
debf16f0c671cb NeilBrown      2022-07-26  349  	fh_fill_post_attrs(fhp);
df9606abddfb01 Chuck Lever    2022-03-28  350  
df9606abddfb01 Chuck Lever    2022-03-28  351  	/* A newly created file already has a file size of zero. */
df9606abddfb01 Chuck Lever    2022-03-28  352  	if ((iap->ia_valid & ATTR_SIZE) && (iap->ia_size == 0))
df9606abddfb01 Chuck Lever    2022-03-28  353  		iap->ia_valid &= ~ATTR_SIZE;
df9606abddfb01 Chuck Lever    2022-03-28  354  	if (argp->createmode == NFS3_CREATE_EXCLUSIVE) {
df9606abddfb01 Chuck Lever    2022-03-28  355  		iap->ia_valid = ATTR_MTIME | ATTR_ATIME |
df9606abddfb01 Chuck Lever    2022-03-28  356  				ATTR_MTIME_SET | ATTR_ATIME_SET;
df9606abddfb01 Chuck Lever    2022-03-28  357  		iap->ia_mtime.tv_sec = v_mtime;
df9606abddfb01 Chuck Lever    2022-03-28  358  		iap->ia_atime.tv_sec = v_atime;
df9606abddfb01 Chuck Lever    2022-03-28  359  		iap->ia_mtime.tv_nsec = 0;
df9606abddfb01 Chuck Lever    2022-03-28  360  		iap->ia_atime.tv_nsec = 0;
df9606abddfb01 Chuck Lever    2022-03-28  361  	}
df9606abddfb01 Chuck Lever    2022-03-28  362  
df9606abddfb01 Chuck Lever    2022-03-28  363  set_attr:
7fe2a71dda349a NeilBrown      2022-07-26  364  	status = nfsd_create_setattr(rqstp, fhp, resfhp, &attrs);
df9606abddfb01 Chuck Lever    2022-03-28  365  
df9606abddfb01 Chuck Lever    2022-03-28  366  out:
fe497f0759e0ef NeilBrown      2025-11-13  367  	end_creating(child);
7ab96df840e60e NeilBrown      2025-11-13  368  out_write:
df9606abddfb01 Chuck Lever    2022-03-28  369  	fh_drop_write(fhp);
df9606abddfb01 Chuck Lever    2022-03-28  370  	return status;
df9606abddfb01 Chuck Lever    2022-03-28  371  }
df9606abddfb01 Chuck Lever    2022-03-28  372  

:::::: The code at line 262 was first introduced by commit
:::::: df9606abddfb01090d5ece7dcc2441d848f690f0 NFSD: Refactor NFSv3 CREATE

:::::: TO: Chuck Lever <chuck.lever@oracle.com>
:::::: CC: Chuck Lever <chuck.lever@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
