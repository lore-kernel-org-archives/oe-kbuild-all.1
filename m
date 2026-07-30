Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F46468C17
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 23:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785452414; cv=none; b=ATrRTQxKBTduvnnxoOgQo8ZeHZuLPe4Zeu2twz52zDhcTfZ2/TGO8L5OuMxlNsW/g6g4ZwjEJINunqfE62J9hHJ3EsGYE4BptBH+osCOQ+IXzRCiebPQQFS6y+7pmLGyeCqTZlTWSu6BZEPC3NtVYgIwtc2enPX1iHDRXYSrXYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785452414; c=relaxed/simple;
	bh=nhhdsQlVfK0ediEJ8ETmowv/lgxSJMHJiedXL7bN7no=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UeFzys1opNT6GFJjOFEr5MMLtR91g0W4cko1LWOypdUaC/bDtILwnP9R5vt5BY3rdhWXhppfzVxMx27KXpnMxqKwv5L6xkY0rZmsFwsu1VdgCJkDc1/cUGsbt+DR/qAhXHgu3+UoMt+EkIQs5PqbYVIdQruNcfiZNYjJfs1lQfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=akl4YrtL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akl4YrtL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785452412; x=1816988412;
  h=date:from:to:cc:subject:message-id;
  bh=nhhdsQlVfK0ediEJ8ETmowv/lgxSJMHJiedXL7bN7no=;
  b=akl4YrtLqge066uFhuzG+2Er1qGa1eE5AsXKwELumwJaNxXDp7wXfrDy
   zlIvk7v2nkrOi+/sE1mjPEL4CVZPMQNBsSghz7I4QhSMtYpbH5O4HYkWn
   D5nMemTmhjumLDlp3w6fP8WgY4cmDlT1H4zryefUn681MpMBJt+fs9FZp
   d6J49CA7qg/3vjsUw6PUBmWZsqhTwFB3Kk9KM2oVbAJIY7nOHbw0fc6Qg
   tIAr1kG+sMfg1qkmdgJgE4oTgWQnKf4wvjnG6er9DxbHWW0Rbpn9fVmMC
   gfytd0VWRSl0LpmxxDKc5JTb6cRTKrMUiCxL531rfKK7DJwrcT1c8l5Xh
   g==;
X-CSE-ConnectionGUID: xyzTIHagQWOU+gf5mvYqFQ==
X-CSE-MsgGUID: 1E16LLMiTNSBYpwdgHBIzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="89893717"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="89893717"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 16:00:11 -0700
X-CSE-ConnectionGUID: rKhiYg5mQKyfY13ofiTDhQ==
X-CSE-MsgGUID: dvAZC4J8RSuI0tvyIJvdxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="285024849"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jul 2026 16:00:09 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpZjT-00000000hgn-0Iyr;
	Thu, 30 Jul 2026 23:00:07 +0000
Date: Fri, 31 Jul 2026 06:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neil@brown.name>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <cel@kernel.org>,
 Jeff Layton <jlayton@kernel.org>
Subject: [cel:nfsd-testing 198/222] fs/nfsd/nfs4proc.c:179:24:
 sparse: sparse: incorrect type in return expression (different base types)
Message-ID: <202607310652.yD0h0jyw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   67be65963a6470b667125cc648b56161ed3dfdce
commit: 6f6cc614db9825508ef60da80deb5190cf813c75 [198/222] nfsd: move v0 checking out of nfsd_check_obj_isreg()
config: m68k-randconfig-r122-20260730 (https://download.01.org/0day-ci/archive/20260731/202607310652.yD0h0jyw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310652.yD0h0jyw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310652.yD0h0jyw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfsd/nfs4proc.c:179:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __be32 @@     got int @@
   fs/nfsd/nfs4proc.c:179:24: sparse:     expected restricted __be32
   fs/nfsd/nfs4proc.c:179:24: sparse:     got int
   fs/nfsd/nfs4proc.c:181:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __be32 @@     got int @@
   fs/nfsd/nfs4proc.c:181:24: sparse:     expected restricted __be32
   fs/nfsd/nfs4proc.c:181:24: sparse:     got int
   fs/nfsd/nfs4proc.c:182:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __be32 @@     got int @@
   fs/nfsd/nfs4proc.c:182:16: sparse:     expected restricted __be32
   fs/nfsd/nfs4proc.c:182:16: sparse:     got int
>> fs/nfsd/nfs4proc.c:350:55: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected int errno @@     got restricted __be32 @@
   fs/nfsd/nfs4proc.c:350:55: sparse:     expected int errno
   fs/nfsd/nfs4proc.c:350:55: sparse:     got restricted __be32
   fs/nfsd/nfs4proc.c:530:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected int errno @@     got restricted __be32 @@
   fs/nfsd/nfs4proc.c:530:47: sparse:     expected int errno
   fs/nfsd/nfs4proc.c:530:47: sparse:     got restricted __be32

vim +179 fs/nfsd/nfs4proc.c

   171	
   172	static __be32 nfsd_check_obj_isreg(struct dentry *child)
   173	{
   174		umode_t mode = d_inode(child)->i_mode;
   175	
   176		if (S_ISREG(mode))
   177			return 0;
   178		if (S_ISDIR(mode))
 > 179			return -EISDIR;
   180		if (S_ISLNK(mode))
   181			return -ELOOP;
   182		return -EFTYPE;
   183	}
   184	
   185	static void nfsd4_set_open_owner_reply_cache(struct nfsd4_compound_state *cstate, struct nfsd4_open *open, struct svc_fh *resfh)
   186	{
   187		if (nfsd4_has_session(cstate))
   188			return;
   189		fh_copy_shallow(&open->op_openowner->oo_owner.so_replay.rp_openfh,
   190				&resfh->fh_handle);
   191	}
   192	
   193	static inline bool nfsd4_create_is_exclusive(int createmode)
   194	{
   195		return createmode == NFS4_CREATE_EXCLUSIVE ||
   196			createmode == NFS4_CREATE_EXCLUSIVE4_1;
   197	}
   198	
   199	/*
   200	 * Implement NFSv4's unchecked, guarded, and exclusive create
   201	 * semantics for regular files. Open state for this new file is
   202	 * subsequently fabricated in nfsd4_process_open2().
   203	 *
   204	 * Upon return, caller must release @fhp and @resfhp.
   205	 */
   206	static __be32
   207	nfsd4_create_file(struct svc_rqst *rqstp, struct svc_fh *fhp,
   208			  struct svc_fh *resfhp, struct nfsd4_open *open)
   209	{
   210		struct iattr *iap = &open->op_iattr;
   211		struct nfsd_attrs attrs = {
   212			.na_iattr	= iap,
   213			.na_seclabel	= &open->op_label,
   214		};
   215		int oflags = O_CREAT | O_LARGEFILE;
   216		struct dentry *parent, *child = ERR_PTR(-EINVAL);
   217		struct path path = {
   218			.mnt = fhp->fh_export->ex_path.mnt,
   219		};
   220		__u32 v_mtime, v_atime;
   221		struct inode *inode;
   222		__be32 status, create_status;
   223		int want_write_err;
   224	
   225		if (name_is_dot_dotdot(open->op_fname, open->op_fnamelen))
   226			return nfserr_exist;
   227		if (!(iap->ia_valid & ATTR_MODE))
   228			iap->ia_mode = 0;
   229	
   230		status = fh_verify(rqstp, fhp, S_IFDIR, NFSD_MAY_EXEC);
   231		if (status != nfs_ok)
   232			return status;
   233		parent = fhp->fh_dentry;
   234		inode = d_inode(parent);
   235	
   236		if (open->op_createmode == NFS4_CREATE_UNCHECKED) {
   237			/*
   238			 * If name is already in dcache we need to check for mountpoints
   239			 */
   240			child = try_lookup_noperm(&QSTR_LEN(open->op_fname,
   241							    open->op_fnamelen),
   242						  parent);
   243			if (child && !IS_ERR(child) && d_is_reg(child) &&
   244			    unlikely(nfsd_mountpoint(child, fhp->fh_export))) {
   245				struct svc_export *exp = exp_get(fhp->fh_export);
   246	
   247				status = nfsd_cross_mnt(rqstp, &child, &exp);
   248				if (status == nfs_ok)
   249					status = fh_compose(resfhp, exp,
   250							    child, fhp);
   251				fh_fill_post_noop(fhp);
   252				open->op_truncate =
   253					(iap->ia_valid & ATTR_SIZE) &&
   254					!iap->ia_size;
   255				dput(child);
   256				exp_put(exp);
   257				return status;
   258			}
   259			if (!IS_ERR(child))
   260				dput(child);
   261		}
   262	
   263		if (!IS_POSIXACL(inode))
   264			iap->ia_mode &= ~current_umask();
   265	
   266		/*
   267		 * For the EXCLUSIVE modes we do our own uniqueness tests
   268		 * so don't want O_EXCL.
   269		 */
   270		if (open->op_createmode == NFS4_CREATE_GUARDED)
   271			oflags |= O_EXCL;
   272	
   273		switch (open->op_share_access & NFS4_SHARE_ACCESS_BOTH) {
   274		case NFS4_SHARE_ACCESS_WRITE:
   275			oflags |= O_WRONLY;
   276			break;
   277		case NFS4_SHARE_ACCESS_BOTH:
   278			oflags |= O_RDWR;
   279			break;
   280		default:
   281			oflags |= O_RDONLY;
   282		}
   283	
   284		if (!is_create_with_attrs(open)) {
   285			/* No attrs to check */
   286		} else if (open->op_acl) {
   287			if (open->op_dpacl || open->op_pacl) {
   288				/* Cannot specify both NFSv4 and Posix ACLs */
   289				return nfserr_inval;
   290			}
   291			status = nfsd4_acl_to_attr(NF4REG, open->op_acl,
   292							   &attrs);
   293			if (status)
   294				return status;
   295		} else {
   296			/* The dpacl and pacl will get released by nfsd_attrs_free(). */
   297			attrs.na_dpacl = open->op_dpacl;
   298			attrs.na_pacl = open->op_pacl;
   299			open->op_dpacl = NULL;
   300			open->op_pacl = NULL;
   301		}
   302	
   303		v_mtime = 0;
   304		v_atime = 0;
   305		if (nfsd4_create_is_exclusive(open->op_createmode)) {
   306			u32 *verifier = (u32 *)open->op_verf.data;
   307	
   308			/*
   309			 * Solaris 7 gets confused (bugid 4218508) if these have
   310			 * the high bit set, as do xfs filesystems without the
   311			 * "bigtime" feature. So just clear the high bits. If this
   312			 * is ever changed to use different attrs for storing the
   313			 * verifier, then do_open_lookup() will also need to be
   314			 * fixed accordingly.
   315			 */
   316			v_mtime = verifier[0] & 0x7fffffff;
   317			v_atime = verifier[1] & 0x7fffffff;
   318	
   319			iap->ia_valid |= ATTR_MTIME | ATTR_ATIME |
   320					 ATTR_MTIME_SET|ATTR_ATIME_SET;
   321			iap->ia_mtime.tv_sec = v_mtime;
   322			iap->ia_atime.tv_sec = v_atime;
   323			iap->ia_mtime.tv_nsec = 0;
   324			iap->ia_atime.tv_nsec = 0;
   325		}
   326	
   327		create_status = fh_verify(rqstp, fhp, S_IFDIR, NFSD_MAY_CREATE);
   328	
   329		want_write_err = fh_want_write(fhp);
   330		if (want_write_err)
   331			/* Might still succeed if no create is needed */
   332			create_status = nfserrno(want_write_err);
   333	
   334		child = start_creating(&nop_mnt_idmap, parent,
   335				       &QSTR_LEN(open->op_fname, open->op_fnamelen));
   336		if (IS_ERR(child)) {
   337			status = nfserrno(PTR_ERR(child));
   338			if (!want_write_err)
   339				fh_drop_write(fhp);
   340			goto out;
   341		}
   342		path.dentry = child;
   343	
   344		if (d_really_is_positive(child)) {
   345			/*
   346			 * open the file so that we consistently have a valid
   347			 * op_filp and consequently a valid ->f_path.dentry.
   348			 */
   349	
 > 350			status = nfserrno(nfsd_check_obj_isreg(child));
   351			if (!status) {
   352				open->op_filp = dentry_open(&path, oflags,
   353							    current_cred());
   354				if (IS_ERR(open->op_filp)) {
   355					status = nfserrno(PTR_ERR(open->op_filp));
   356					open->op_filp = NULL;
   357				}
   358			}
   359		} else if (create_status) {
   360			status = create_status;
   361		} else {
   362			open->op_filp = dentry_create(&path, oflags, open->op_iattr.ia_mode,
   363						      current_cred());
   364			child = path.dentry;
   365	
   366			if (IS_ERR(open->op_filp)) {
   367				status = nfserrno(PTR_ERR(open->op_filp));
   368				open->op_filp = NULL;
   369			} else {
   370				open->op_created = open->op_filp->f_mode & FMODE_CREATED;
   371			}
   372		}
   373		end_creating(child);
   374		if (!want_write_err)
   375			fh_drop_write(fhp);
   376		if (status != nfs_ok)
   377			goto out;
   378	
   379		child = open->op_filp->f_path.dentry;
   380	
   381		status = fh_compose(resfhp, fhp->fh_export, child, fhp);
   382		if (status != nfs_ok)
   383			goto out;
   384	
   385		if (!open->op_created &&
   386		    nfsd4_create_is_exclusive(open->op_createmode) &&
   387		    inode_get_mtime_sec(d_inode(child)) == v_mtime &&
   388		    inode_get_atime_sec(d_inode(child)) == v_atime &&
   389		    d_inode(child)->i_size == 0)
   390			open->op_created = true;
   391	
   392		if (!open->op_created) {
   393			if (open->op_createmode == NFS4_CREATE_UNCHECKED) {
   394				/* NFSv4 protocol requires change attributes
   395				 * even though no change happened.
   396				 */
   397				fh_fill_post_noop(fhp);
   398	
   399				/*
   400				 * In NFSv4, we don't want to truncate the file
   401				 * now. This would be wrong if the OPEN fails for
   402				 * some other reason. Furthermore, if the size is
   403				 * nonzero, we should ignore it according to spec!
   404				 */
   405				open->op_truncate = (d_is_reg(child) &&
   406						     (iap->ia_valid & ATTR_SIZE) &&
   407						     !iap->ia_size);
   408			} else
   409				status = nfserr_exist;
   410			goto out;
   411		}
   412		/* file was created */
   413		fh_fill_post_attrs(fhp);
   414	
   415		/* A newly created file already has a file size of zero. */
   416		if ((iap->ia_valid & ATTR_SIZE) && (iap->ia_size == 0))
   417			iap->ia_valid &= ~ATTR_SIZE;
   418	
   419		/* We will need write access to set the attrs */
   420		want_write_err = fh_want_write(fhp);
   421		if (!want_write_err) {
   422			status = nfsd_create_setattr(rqstp, fhp,
   423						     resfhp, &attrs);
   424			fh_drop_write(fhp);
   425		} else if (nfsd_attrs_valid(&attrs)) {
   426			/* Needed write access */
   427			status = nfserrno(want_write_err);
   428		}
   429	
   430		if (attrs.na_labelerr)
   431			open->op_bmval[2] &= ~FATTR4_WORD2_SECURITY_LABEL;
   432		if (attrs.na_paclerr || attrs.na_dpaclerr)
   433			open->op_bmval[0] &= ~FATTR4_WORD0_ACL;
   434		if (attrs.na_dpaclerr)
   435			open->op_bmval[2] &= ~FATTR4_WORD2_POSIX_DEFAULT_ACL;
   436		if (attrs.na_paclerr)
   437			open->op_bmval[2] &= ~FATTR4_WORD2_POSIX_ACCESS_ACL;
   438	out:
   439		nfsd_attrs_free(&attrs);
   440		return status;
   441	}
   442	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
