Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055094B1E6E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 07:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747465877; cv=none; b=uZEhISKUVyOYc15emeLHeeS/W0+JO9N8t4xveZ37Z3bLb9ziJes62mQljgNOOn/PEf0DuE7XP0ffKNisBchBBWgDqAeC1MMKYbGb2OCWKZPCZhfb5SFLPRhGQepMzNR0ZMVi7CJf94mmBMW2qlVOR2CtSCCljYAEQNtuD5RbiV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747465877; c=relaxed/simple;
	bh=OC/h9gh71cfa4MhkvyjfEeOHPzY+i3ZIHKxJwmrX3hs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kB91cNU+kfSkqXvZ7acg4khmn14t3iia5yWVpWPzKER2xFBR/Le2wBN9RTWpZIrZ4BkDlvLjaiQEajzRm2JDdvAP3ZJWwqHhzO76jbzzlo8FybNTYJ6YEtxnodOOPSW3tgq2b8pfIxNkQu3YmCcA+5qrQ0PSJEpART6JfiY55oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRUVNXqf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRUVNXqf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747465875; x=1779001875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OC/h9gh71cfa4MhkvyjfEeOHPzY+i3ZIHKxJwmrX3hs=;
  b=NRUVNXqf9x6dzjfk0Bt6gGjFi6hH4NtXG6vvHDjiVS7uqNGC8lkZ0sIM
   ERnPF8o0mSRmvgXeN3HzoixufkGKiAMvPmtX3t7eCd/zt4EY0hM1Us0pB
   2Oyfz57bHFNJ34dgYbsymnYCr126oRdJPhVW/r1pUvPOq1V2okq31I0Df
   42upBQGQLHY8oa5EpB/RxPbIFLrJczvsv0GB5jRhugPeuEkoWoewohTrc
   PF1lOjNmYyo2dtnSiqM7ArxKH83Q5z7Fz33Ui8xJ1VJWgeN8acFfP2pWs
   KK72JSsXLKgDmJrkXrRFhNi/f+M2WT/KLi+TC+FyqMmegSirUWL+i4eyh
   A==;
X-CSE-ConnectionGUID: 6Vt++2dlTi+z8SRVMCjvtw==
X-CSE-MsgGUID: VIzfgve3QGi+oI2ACKQ0Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66846737"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="66846737"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 00:11:14 -0700
X-CSE-ConnectionGUID: j87xe3qQQXqbVlvtt9wq7w==
X-CSE-MsgGUID: qrSX5K2gRoCUpKAX4cG5cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="139423397"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 May 2025 00:11:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGBhO-000Jzr-2B;
	Sat, 17 May 2025 07:11:10 +0000
Date: Sat, 17 May 2025 15:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: Rick Macklem <rmacklem@uoguelph.ca>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-testing 91/93] fs/nfsd/nfs4proc.c:279 nfsd4_create_file()
 warn: inconsistent indenting
Message-ID: <202505171519.DPB1Yoy0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   d868e4920c3f4feefcbc17c5812bbe1a48af8c6f
commit: 1565917dd617b22386c49581af69e92fb44407ef [91/93] Fix handling of POSIX draft default ACLs
config: i386-randconfig-141-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171519.DPB1Yoy0-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171519.DPB1Yoy0-lkp@intel.com/

New smatch warnings:
fs/nfsd/nfs4proc.c:279 nfsd4_create_file() warn: inconsistent indenting
fs/nfsd/nfs4proc.c:471 do_open_lookup() warn: inconsistent indenting
fs/nfsd/nfs4proc.c:569 nfsd4_open() warn: inconsistent indenting
fs/nfsd/nfs4proc.c:1198 nfsd4_proc_setacl() warn: inconsistent indenting
fs/nfsd/nfs4proc.c:1245 nfsd4_setattr() warn: inconsistent indenting

Old smatch warnings:
fs/nfsd/nfs4proc.c:390 nfsd4_create_file() warn: inconsistent indenting
fs/nfsd/nfs4proc.c:403 nfsd4_create_file() warn: 'child' is an error pointer or valid
fs/nfsd/nfs4proc.c:473 do_open_lookup() warn: inconsistent indenting
fs/nfsd/nfs4proc.c:613 nfsd4_open() warn: inconsistent indenting
fs/nfsd/nfs4proc.c:631 nfsd4_open() warn: inconsistent indenting
fs/nfsd/nfs4proc.c:1215 nfsd4_proc_setacl() warn: inconsistent indenting
fs/nfsd/nfs4proc.c:1224 nfsd4_proc_setacl() warn: inconsistent indenting
fs/nfsd/nfs4proc.c:1255 nfsd4_setattr() warn: inconsistent indenting
fs/nfsd/nfs4proc.c:1278 nfsd4_setattr() warn: inconsistent indenting
fs/nfsd/nfs4proc.c:1285 nfsd4_setattr() warn: inconsistent indenting
fs/nfsd/nfs4proc.c:1291 nfsd4_setattr() warn: inconsistent indenting
fs/nfsd/nfs4proc.c:1298 nfsd4_setattr() warn: inconsistent indenting
fs/nfsd/nfs4proc.c:1305 nfsd4_setattr() warn: inconsistent indenting
fs/nfsd/nfs4proc.c:1310 nfsd4_setattr() warn: inconsistent indenting
fs/nfsd/nfs4proc.c:1315 nfsd4_setattr() warn: inconsistent indenting

vim +279 fs/nfsd/nfs4proc.c

   230	
   231	/*
   232	 * Implement NFSv4's unchecked, guarded, and exclusive create
   233	 * semantics for regular files. Open state for this new file is
   234	 * subsequently fabricated in nfsd4_process_open2().
   235	 *
   236	 * Upon return, caller must release @fhp and @resfhp.
   237	 */
   238	static __be32
   239	nfsd4_create_file(struct svc_rqst *rqstp, struct svc_fh *fhp,
   240			  struct svc_fh *resfhp, struct nfsd4_open *open)
   241	{
   242		struct iattr *iap = &open->op_iattr;
   243		struct nfsd_attrs attrs = {
   244			.na_iattr	= iap,
   245			.na_seclabel	= &open->op_label,
   246		};
   247		struct dentry *parent, *child;
   248		__u32 v_mtime, v_atime;
   249		struct inode *inode;
   250		__be32 status;
   251		int host_err;
   252	
   253		if (isdotent(open->op_fname, open->op_fnamelen))
   254			return nfserr_exist;
   255		if (!(iap->ia_valid & ATTR_MODE))
   256			iap->ia_mode = 0;
   257	
   258		status = fh_verify(rqstp, fhp, S_IFDIR, NFSD_MAY_EXEC);
   259		if (status != nfs_ok)
   260			return status;
   261		parent = fhp->fh_dentry;
   262		inode = d_inode(parent);
   263	
   264		host_err = fh_want_write(fhp);
   265		if (host_err)
   266			return nfserrno(host_err);
   267	
   268		if (open->op_acl) {
   269			if (open->op_dpacl || open->op_pacl)
   270				return nfserr_inval;
   271			if (is_create_with_attrs(open))
   272				nfsd4_acl_to_attr(NF4REG, open->op_acl, &attrs);
   273		} else if (is_create_with_attrs(open)) {
   274			/* The dpacl and pacl will get released by nfsd_attrs_free(). */
   275			attrs.na_dpacl = open->op_dpacl;
   276			attrs.na_pacl = open->op_pacl;
   277			open->op_dpacl = NULL;
   278			open->op_pacl = NULL;
 > 279	dprintk("in open pacl=%p dpacl=%p\n", attrs.na_pacl, attrs.na_dpacl);
   280		}
   281	
   282		inode_lock_nested(inode, I_MUTEX_PARENT);
   283	
   284		child = lookup_one_len(open->op_fname, parent, open->op_fnamelen);
   285		if (IS_ERR(child)) {
   286			status = nfserrno(PTR_ERR(child));
   287			goto out;
   288		}
   289	
   290		if (d_really_is_negative(child)) {
   291			status = fh_verify(rqstp, fhp, S_IFDIR, NFSD_MAY_CREATE);
   292			if (status != nfs_ok)
   293				goto out;
   294		}
   295	
   296		status = fh_compose(resfhp, fhp->fh_export, child, fhp);
   297		if (status != nfs_ok)
   298			goto out;
   299	
   300		v_mtime = 0;
   301		v_atime = 0;
   302		if (nfsd4_create_is_exclusive(open->op_createmode)) {
   303			u32 *verifier = (u32 *)open->op_verf.data;
   304	
   305			/*
   306			 * Solaris 7 gets confused (bugid 4218508) if these have
   307			 * the high bit set, as do xfs filesystems without the
   308			 * "bigtime" feature. So just clear the high bits. If this
   309			 * is ever changed to use different attrs for storing the
   310			 * verifier, then do_open_lookup() will also need to be
   311			 * fixed accordingly.
   312			 */
   313			v_mtime = verifier[0] & 0x7fffffff;
   314			v_atime = verifier[1] & 0x7fffffff;
   315		}
   316	
   317		if (d_really_is_positive(child)) {
   318			/* NFSv4 protocol requires change attributes even though
   319			 * no change happened.
   320			 */
   321			status = fh_fill_both_attrs(fhp);
   322			if (status != nfs_ok)
   323				goto out;
   324	
   325			switch (open->op_createmode) {
   326			case NFS4_CREATE_UNCHECKED:
   327				if (!d_is_reg(child))
   328					break;
   329	
   330				/*
   331				 * In NFSv4, we don't want to truncate the file
   332				 * now. This would be wrong if the OPEN fails for
   333				 * some other reason. Furthermore, if the size is
   334				 * nonzero, we should ignore it according to spec!
   335				 */
   336				open->op_truncate = (iap->ia_valid & ATTR_SIZE) &&
   337							!iap->ia_size;
   338				break;
   339			case NFS4_CREATE_GUARDED:
   340				status = nfserr_exist;
   341				break;
   342			case NFS4_CREATE_EXCLUSIVE:
   343				if (inode_get_mtime_sec(d_inode(child)) == v_mtime &&
   344				    inode_get_atime_sec(d_inode(child)) == v_atime &&
   345				    d_inode(child)->i_size == 0) {
   346					open->op_created = true;
   347					break;		/* subtle */
   348				}
   349				status = nfserr_exist;
   350				break;
   351			case NFS4_CREATE_EXCLUSIVE4_1:
   352				if (inode_get_mtime_sec(d_inode(child)) == v_mtime &&
   353				    inode_get_atime_sec(d_inode(child)) == v_atime &&
   354				    d_inode(child)->i_size == 0) {
   355					open->op_created = true;
   356					goto set_attr;	/* subtle */
   357				}
   358				status = nfserr_exist;
   359			}
   360			goto out;
   361		}
   362	
   363		if (!IS_POSIXACL(inode))
   364			iap->ia_mode &= ~current_umask();
   365	
   366		status = fh_fill_pre_attrs(fhp);
   367		if (status != nfs_ok)
   368			goto out;
   369		status = nfsd4_vfs_create(fhp, child, open);
   370		if (status != nfs_ok)
   371			goto out;
   372		open->op_created = true;
   373		fh_fill_post_attrs(fhp);
   374	
   375		/* A newly created file already has a file size of zero. */
   376		if ((iap->ia_valid & ATTR_SIZE) && (iap->ia_size == 0))
   377			iap->ia_valid &= ~ATTR_SIZE;
   378		if (nfsd4_create_is_exclusive(open->op_createmode)) {
   379			iap->ia_valid = ATTR_MTIME | ATTR_ATIME |
   380					ATTR_MTIME_SET|ATTR_ATIME_SET;
   381			iap->ia_mtime.tv_sec = v_mtime;
   382			iap->ia_atime.tv_sec = v_atime;
   383			iap->ia_mtime.tv_nsec = 0;
   384			iap->ia_atime.tv_nsec = 0;
   385		}
   386	
   387	set_attr:
   388	dprintk("at nfsd_create_setattr\n");
   389		status = nfsd_create_setattr(rqstp, fhp, resfhp, &attrs);
   390	dprintk("aft nfsd_create_setattr=%d paclerr=%d\n", status, attrs.na_paclerr);
   391	
   392		if (attrs.na_labelerr)
   393			open->op_bmval[2] &= ~FATTR4_WORD2_SECURITY_LABEL;
   394		if (attrs.na_aclerr)
   395			open->op_bmval[0] &= ~FATTR4_WORD0_ACL;
   396		if (attrs.na_dpaclerr)
   397			open->op_bmval[2] &= ~FATTR4_WORD2_POSIX_DEFAULT_ACL;
   398		if (attrs.na_paclerr)
   399			open->op_bmval[2] &= ~FATTR4_WORD2_POSIX_ACCESS_ACL;
   400	out:
   401		inode_unlock(inode);
   402		nfsd_attrs_free(&attrs);
   403		if (child && !IS_ERR(child))
   404			dput(child);
   405		fh_drop_write(fhp);
   406		return status;
   407	}
   408	
   409	/**
   410	 * set_change_info - set up the change_info4 for a reply
   411	 * @cinfo: pointer to nfsd4_change_info to be populated
   412	 * @fhp: pointer to svc_fh to use as source
   413	 *
   414	 * Many operations in NFSv4 require change_info4 in the reply. This function
   415	 * populates that from the info that we (should!) have already collected. In
   416	 * the event that we didn't get any pre-attrs, just zero out both.
   417	 */
   418	static void
   419	set_change_info(struct nfsd4_change_info *cinfo, struct svc_fh *fhp)
   420	{
   421		cinfo->atomic = (u32)(fhp->fh_pre_saved && fhp->fh_post_saved && !fhp->fh_no_atomic_attr);
   422		cinfo->before_change = fhp->fh_pre_change;
   423		cinfo->after_change = fhp->fh_post_change;
   424	
   425		/*
   426		 * If fetching the pre-change attributes failed, then we should
   427		 * have already failed the whole operation. We could have still
   428		 * failed to fetch post-change attributes however.
   429		 *
   430		 * If we didn't get post-op attrs, just zero-out the after
   431		 * field since we don't know what it should be. If the pre_saved
   432		 * field isn't set for some reason, throw warning and just copy
   433		 * whatever is in the after field.
   434		 */
   435		if (WARN_ON_ONCE(!fhp->fh_pre_saved))
   436			cinfo->before_change = 0;
   437		if (!fhp->fh_post_saved)
   438			cinfo->after_change = cinfo->before_change + 1;
   439	}
   440	
   441	static __be32
   442	do_open_lookup(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate, struct nfsd4_open *open, struct svc_fh **resfh)
   443	{
   444		struct svc_fh *current_fh = &cstate->current_fh;
   445		int accmode;
   446		__be32 status;
   447	
   448		*resfh = kmalloc(sizeof(struct svc_fh), GFP_KERNEL);
   449		if (!*resfh)
   450			return nfserr_jukebox;
   451		fh_init(*resfh, NFS4_FHSIZE);
   452		open->op_truncate = false;
   453	
   454		if (open->op_create) {
   455			/* FIXME: check session persistence and pnfs flags.
   456			 * The nfsv4.1 spec requires the following semantics:
   457			 *
   458			 * Persistent   | pNFS   | Server REQUIRED | Client Allowed
   459			 * Reply Cache  | server |                 |
   460			 * -------------+--------+-----------------+--------------------
   461			 * no           | no     | EXCLUSIVE4_1    | EXCLUSIVE4_1
   462			 *              |        |                 | (SHOULD)
   463			 *              |        | and EXCLUSIVE4  | or EXCLUSIVE4
   464			 *              |        |                 | (SHOULD NOT)
   465			 * no           | yes    | EXCLUSIVE4_1    | EXCLUSIVE4_1
   466			 * yes          | no     | GUARDED4        | GUARDED4
   467			 * yes          | yes    | GUARDED4        | GUARDED4
   468			 */
   469	
   470			current->fs->umask = open->op_umask;
 > 471	dprintk("openacl=%p\n", open->op_pacl);
   472			status = nfsd4_create_file(rqstp, current_fh, *resfh, open);
   473	dprintk("aft create_file=%d\n", status);
   474			current->fs->umask = 0;
   475	
   476			/*
   477			 * Following rfc 3530 14.2.16, and rfc 5661 18.16.4
   478			 * use the returned bitmask to indicate which attributes
   479			 * we used to store the verifier:
   480			 */
   481			if (nfsd4_create_is_exclusive(open->op_createmode) && status == 0)
   482				open->op_bmval[1] |= (FATTR4_WORD1_TIME_ACCESS |
   483							FATTR4_WORD1_TIME_MODIFY);
   484		} else {
   485			status = nfsd_lookup(rqstp, current_fh,
   486					     open->op_fname, open->op_fnamelen, *resfh);
   487			if (status == nfs_ok)
   488				/* NFSv4 protocol requires change attributes even though
   489				 * no change happened.
   490				 */
   491				status = fh_fill_both_attrs(current_fh);
   492		}
   493		if (status)
   494			goto out;
   495		status = nfsd_check_obj_isreg(*resfh, cstate->minorversion);
   496		if (status)
   497			goto out;
   498	
   499		nfsd4_set_open_owner_reply_cache(cstate, open, *resfh);
   500		accmode = NFSD_MAY_NOP;
   501		if (open->op_created ||
   502				open->op_claim_type == NFS4_OPEN_CLAIM_DELEGATE_CUR)
   503			accmode |= NFSD_MAY_OWNER_OVERRIDE;
   504		status = do_open_permission(rqstp, *resfh, open, accmode);
   505		set_change_info(&open->op_cinfo, current_fh);
   506	out:
   507		return status;
   508	}
   509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
