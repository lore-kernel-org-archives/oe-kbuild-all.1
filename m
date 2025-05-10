Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC1F27C158
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 18:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746901973; cv=none; b=IKEzFFurrbex94Ejd/rAPuaBwGt84LXH5NOQACy8ZHw2Z4gHrzO22f7ItpjwrgsnNTUbtT4nIIs+7T29SbhI1f9j7CQz5IIXNEy49GaCMnEQg5sO74EeVN0vGIP1RTvMyf0aYFWQ60z1+cSyXsNQD1eTU4Hm1CEUXKWRUq1r/Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746901973; c=relaxed/simple;
	bh=3B9vN2alKQhDRF9BATsKRZIe3QcnaRgkkEbLTvdjMBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OuYfPR9nWW19O5vk7heZ+LM5KrxTX67AMhh+VsMdxnM9v8mslC5YcV4m7Zb58rA0ESqTJv44ti+NR16qYavEyl0B4ovLor9rwhbSD5H9L9fGfOrkhxmB/gDSTqLsjPkVTFbIk3Pked81GUGrhbKIZCuK3NhFSqrU1KDyFh+do7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDHkOjdg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDHkOjdg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746901969; x=1778437969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3B9vN2alKQhDRF9BATsKRZIe3QcnaRgkkEbLTvdjMBo=;
  b=YDHkOjdg0husZ9IMmgKJ/5nYVecN61bqd3OPf9bz7Ad9EKfpe1O+UKpa
   DtFZVkc9x4tNgLhr3jKAocfQ3xwNXDVuxO+X586E4ynsdYtFI1pqIgZF5
   hOth4mtS8g4tf/Sp3NyTiHsY7Llrh/0Vcjf4yScgLpEQeXTcA53rPrhNt
   pA5H/Fp84vEqLJFBunh2n5pK9BfV9uYJEGlLys0uU2919C+v5z5sIRfu4
   Gx7Ce1hbgOp+hu083sjkapNdRrPKh8IhyXI11c2VGIbKXmAVxdXySfmji
   nnU5q5/RlA1nNiMkZPlmCYqydiTD0bFeydpC0MVDRJD9BFZ3UQD1kGLuT
   w==;
X-CSE-ConnectionGUID: NDByaoCPQJmMDPMgUq4Z8w==
X-CSE-MsgGUID: ZrtWkiiuQBaI4Z28oRUhxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="52530812"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="52530812"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 11:32:48 -0700
X-CSE-ConnectionGUID: ey02EoAwSO+tyl+Ny0yzsw==
X-CSE-MsgGUID: epC+K4CsSfyZSIUytfABrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="136940252"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 May 2025 11:32:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDp09-000DI5-0P;
	Sat, 10 May 2025 18:32:45 +0000
Date: Sun, 11 May 2025 02:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: Rick Macklem <rmacklem@uoguelph.ca>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-testing 83/84] fs/nfsd/vfs.c:507 nfsd_setattr() warn:
 inconsistent indenting
Message-ID: <202505110231.hotFYWDm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   4ca256601287f539718965e46ea50fa9e71eb722
commit: 1ca6c760a2cd01ce486604c28f9b2548a0823bdd [83/84] Fix handling of zero length ACLs for file object creation
config: x86_64-randconfig-161-20250510 (https://download.01.org/0day-ci/archive/20250511/202505110231.hotFYWDm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505110231.hotFYWDm-lkp@intel.com/

New smatch warnings:
fs/nfsd/vfs.c:507 nfsd_setattr() warn: inconsistent indenting
fs/nfsd/vfs.c:1472 nfsd_create_setattr() warn: inconsistent indenting

Old smatch warnings:
fs/nfsd/vfs.c:612 nfsd_setattr() warn: inconsistent indenting
fs/nfsd/vfs.c:1482 nfsd_create_setattr() warn: inconsistent indenting

vim +507 fs/nfsd/vfs.c

   475	
   476	/**
   477	 * nfsd_setattr - Set various file attributes.
   478	 * @rqstp: controlling RPC transaction
   479	 * @fhp: filehandle of target
   480	 * @attr: attributes to set
   481	 * @guardtime: do not act if ctime.tv_sec does not match this timestamp
   482	 *
   483	 * This call may adjust the contents of @attr (in particular, this
   484	 * call may change the bits in the na_iattr.ia_valid field).
   485	 *
   486	 * Returns nfs_ok on success, otherwise an NFS status code is
   487	 * returned. Caller must release @fhp by calling fh_put in either
   488	 * case.
   489	 */
   490	__be32
   491	nfsd_setattr(struct svc_rqst *rqstp, struct svc_fh *fhp,
   492		     struct nfsd_attrs *attr, const struct timespec64 *guardtime)
   493	{
   494		struct dentry	*dentry;
   495		struct inode	*inode;
   496		struct iattr	*iap = attr->na_iattr;
   497		int		accmode = NFSD_MAY_SATTR;
   498		umode_t		ftype = 0;
   499		__be32		err;
   500		int		host_err = 0;
   501		bool		get_write_count;
   502		bool		size_change = (iap->ia_valid & ATTR_SIZE);
   503		int		retries;
   504	
   505		trace_nfsd_vfs_setattr(rqstp, fhp, iap, guardtime);
   506	
 > 507	dprintk("nfsd_setattr pacl=%p valid=0x%x\n", attr->na_pacl, iap->ia_valid);
   508		if (iap->ia_valid & ATTR_SIZE) {
   509			accmode |= NFSD_MAY_WRITE|NFSD_MAY_OWNER_OVERRIDE;
   510			ftype = S_IFREG;
   511		}
   512	
   513		/*
   514		 * If utimes(2) and friends are called with times not NULL, we should
   515		 * not set NFSD_MAY_WRITE bit. Otherwise fh_verify->nfsd_permission
   516		 * will return EACCES, when the caller's effective UID does not match
   517		 * the owner of the file, and the caller is not privileged. In this
   518		 * situation, we should return EPERM(notify_change will return this).
   519		 */
   520		if (iap->ia_valid & (ATTR_ATIME | ATTR_MTIME)) {
   521			accmode |= NFSD_MAY_OWNER_OVERRIDE;
   522			if (!(iap->ia_valid & (ATTR_ATIME_SET | ATTR_MTIME_SET)))
   523				accmode |= NFSD_MAY_WRITE;
   524		}
   525	
   526		/* Callers that do fh_verify should do the fh_want_write: */
   527		get_write_count = !fhp->fh_dentry;
   528	
   529		/* Get inode */
   530		err = fh_verify(rqstp, fhp, ftype, accmode);
   531		if (err)
   532			return err;
   533		if (get_write_count) {
   534			host_err = fh_want_write(fhp);
   535			if (host_err)
   536				goto out;
   537		}
   538	
   539		dentry = fhp->fh_dentry;
   540		inode = d_inode(dentry);
   541	
   542		nfsd_sanitize_attrs(inode, iap);
   543	
   544		/*
   545		 * The size case is special, it changes the file in addition to the
   546		 * attributes, and file systems don't expect it to be mixed with
   547		 * "random" attribute changes.  We thus split out the size change
   548		 * into a separate call to ->setattr, and do the rest as a separate
   549		 * setattr call.
   550		 */
   551		if (size_change) {
   552			err = nfsd_get_write_access(rqstp, fhp, iap);
   553			if (err)
   554				return err;
   555		}
   556	
   557		inode_lock(inode);
   558		err = fh_fill_pre_attrs(fhp);
   559		if (err)
   560			goto out_unlock;
   561	
   562		if (guardtime) {
   563			struct timespec64 ctime = inode_get_ctime(inode);
   564			if ((u32)guardtime->tv_sec != (u32)ctime.tv_sec ||
   565			    guardtime->tv_nsec != ctime.tv_nsec) {
   566				err = nfserr_notsync;
   567				goto out_fill_attrs;
   568			}
   569		}
   570	
   571		for (retries = 1;;) {
   572			struct iattr attrs;
   573	
   574			/*
   575			 * notify_change() can alter its iattr argument, making
   576			 * @iap unsuitable for submission multiple times. Make a
   577			 * copy for every loop iteration.
   578			 */
   579			attrs = *iap;
   580			host_err = __nfsd_setattr(dentry, &attrs);
   581			if (host_err != -EAGAIN || !retries--)
   582				break;
   583			if (!nfsd_wait_for_delegreturn(rqstp, inode))
   584				break;
   585		}
   586		if (attr->na_seclabel && attr->na_seclabel->len)
   587			attr->na_labelerr = security_inode_setsecctx(dentry,
   588				attr->na_seclabel->data, attr->na_seclabel->len);
   589		if (IS_ENABLED(CONFIG_FS_POSIX_ACL) && attr->na_dpacl) {
   590			if (!S_ISDIR(inode->i_mode))
   591				attr->na_dpaclerr = -EINVAL;
   592			else if (attr->na_dpacl->a_count > 0)
   593				/* a_count == 0 means delete the ACL. */
   594				attr->na_dpaclerr = set_posix_acl(&nop_mnt_idmap,
   595							dentry, ACL_TYPE_DEFAULT,
   596							attr->na_dpacl);
   597			else
   598				attr->na_dpaclerr = set_posix_acl(&nop_mnt_idmap,
   599							dentry, ACL_TYPE_DEFAULT,
   600							NULL);
   601		}
   602		if (IS_ENABLED(CONFIG_FS_POSIX_ACL) && attr->na_pacl) {
   603	dprintk("at set_posix_acl\n");
   604			/*
   605			 * For any file system that is not ACL_SCOPE_FILE_OBJECT,
   606			 * a_count == 0 MUST reply nfserr_inval.
   607			 * For a file system that is ACL_SCOPE_FILE_OBJECT,
   608			 * a_count == 0 deletes the ACL.
   609			 * XXX File systems that are ACL_SCOPE_FILE_OBJECT
   610			 * are not yet supported.
   611			 */
   612			if (attr->na_pacl->a_count > 0)
   613				attr->na_paclerr = set_posix_acl(&nop_mnt_idmap,
   614								dentry, ACL_TYPE_ACCESS,
   615								attr->na_pacl);
   616			else
   617				attr->na_paclerr = -EINVAL;
   618	dprintk("set_posix_acl=%d\n", attr->na_paclerr);
   619		}
   620	out_fill_attrs:
   621		/*
   622		 * RFC 1813 Section 3.3.2 does not mandate that an NFS server
   623		 * returns wcc_data for SETATTR. Some client implementations
   624		 * depend on receiving wcc_data, however, to sort out partial
   625		 * updates (eg., the client requested that size and mode be
   626		 * modified, but the server changed only the file mode).
   627		 */
   628		fh_fill_post_attrs(fhp);
   629	out_unlock:
   630		inode_unlock(inode);
   631		if (size_change)
   632			put_write_access(inode);
   633	out:
   634		if (!host_err)
   635			host_err = commit_metadata(fhp);
   636		return err != 0 ? err : nfserrno(host_err);
   637	}
   638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
