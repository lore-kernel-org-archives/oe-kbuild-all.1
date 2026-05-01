Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E6F287503
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 22:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777673042; cv=none; b=uDHkOZabWRC3TxBXZfyLIpKHeoYtR93y37APfegmXf1+xE8f8IHtZQUpAbi5/twJ2pnz/PdNfP/FgNfvCj4fHr4MGeftZnscN4R2q43YiuxVsHbH+hPcBh9UQewd7727inWk4dDOacLeIj6UxeYhwDngwxPJq3MNxnc/3SUO22Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777673042; c=relaxed/simple;
	bh=lcPJeo6DArDowkNTA3zFkLrkFChUecHJGwfYIuLP75k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N0p7itOllHPMZpFxbJxBtPiYopmEtfKFYucm6krA+3MrdZmBciCMg837qlzA6wMRimel8Yk4HxvfbNYc8JA/OXpAQmh35NF4TZUqoDBxqhu6bZMCT2vMCQB1GgbZ7kMftCOo7RPBz+lrTjlaOx0BflgWFDZ6QXBzFClSqCylzbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UFFB9KPN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UFFB9KPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777673040; x=1809209040;
  h=date:from:to:cc:subject:message-id;
  bh=lcPJeo6DArDowkNTA3zFkLrkFChUecHJGwfYIuLP75k=;
  b=UFFB9KPNDz8U8UMUTUl2+bOtjRIS+g9PJIOjOm9O3mZqIBPdXNLn213b
   iPeGYmK3BsShSX2pIdOp6naG81h+g65DtVT2fDIbT6NGdXKGXr2WWjsYu
   Ojra7DUIAPG5Kfh6RayuD1/Fb6F0diVYF/3cJj2+SSPBJ93Ld1KXEqFp5
   MxraBx5WfADLGTHJ4Jm3PLxrs5x0xg73hadz5kNhYV8LvSS1LEGJy7HHH
   zqvr7/7+z9uAzprn+jnZ1T/lBqASDbnDWaOQqrSDYtsNeOetOlZcj8ka5
   djOKh5zxme86uU5AolT/iMpE3+U5hQ3Nobxz4GjwlnDTlpFBQGk1+PXyc
   w==;
X-CSE-ConnectionGUID: 92hD5xR9RJCjtg3wcfGBQw==
X-CSE-MsgGUID: V8Ei93XlQzGMlBkiCE08tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="82487372"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="82487372"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 15:04:00 -0700
X-CSE-ConnectionGUID: iQL1grRnR9qshp5/sPi5MA==
X-CSE-MsgGUID: 3N5lVQW4Rb+hDCTd0O917Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="234860140"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 May 2026 15:03:58 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIvxj-000000000tQ-1M2j;
	Fri, 01 May 2026 22:03:55 +0000
Date: Sat, 02 May 2026 06:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, Aleksa Sarai <aleksa@amutable.com>
Subject: fs/smb/client/dir.c:248:33: error: label 'out' used but not
 defined
Message-ID: <202605020512.8DNwzYZU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git vfs-7.2.openat.regular
head:   be7728badbd230f1ee7beba4162383fa022ae767
commit: 93306cec35846eebf467d63a775fa711d7106b2e openat2: new OPENAT2_REGULAR flag support
date:   2 weeks ago
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260502/202605020512.8DNwzYZU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605020512.8DNwzYZU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605020512.8DNwzYZU-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/client/dir.c: In function '__cifs_do_create':
>> fs/smb/client/dir.c:248:33: error: label 'out' used but not defined
     248 |                                 goto out;
         |                                 ^~~~


vim +/out +248 fs/smb/client/dir.c

   199	
   200	/* Inode operations in similar order to how they appear in Linux file fs.h */
   201	static int __cifs_do_create(struct inode *dir, struct dentry *direntry,
   202				    const char *full_path, unsigned int xid,
   203				    struct tcon_link *tlink, unsigned int oflags,
   204				    umode_t mode, __u32 *oplock, struct cifs_fid *fid,
   205				    struct cifs_open_info_data *buf,
   206				    struct inode **inode)
   207	{
   208		int rc = -ENOENT;
   209		int create_options = CREATE_NOT_DIR;
   210		int desired_access;
   211		struct cifs_sb_info *cifs_sb = CIFS_SB(dir);
   212		struct cifs_tcon *tcon = tlink_tcon(tlink);
   213		struct inode *newinode = NULL;
   214		unsigned int sbflags = cifs_sb_flags(cifs_sb);
   215		int disposition;
   216		struct TCP_Server_Info *server = tcon->ses->server;
   217		struct cifs_open_parms oparms;
   218		struct cached_fid *parent_cfid = NULL;
   219		int rdwr_for_fscache = 0;
   220		__le32 lease_flags = 0;
   221	
   222		*inode = NULL;
   223		*oplock = 0;
   224		if (tcon->ses->server->oplocks)
   225			*oplock = REQ_OPLOCK;
   226	
   227		/* If we're caching, we need to be able to fill in around partial writes. */
   228		if (cifs_fscache_enabled(dir) && (oflags & O_ACCMODE) == O_WRONLY)
   229			rdwr_for_fscache = 1;
   230	
   231	#ifdef CONFIG_CIFS_ALLOW_INSECURE_LEGACY
   232		if (tcon->unix_ext && cap_unix(tcon->ses) && !tcon->broken_posix_open &&
   233		    (CIFS_UNIX_POSIX_PATH_OPS_CAP &
   234				le64_to_cpu(tcon->fsUnixInfo.Capability))) {
   235			rc = cifs_posix_open(full_path, &newinode, dir->i_sb, mode,
   236					     oflags, oplock, &fid->netfid, xid);
   237			switch (rc) {
   238			case 0:
   239				if (newinode == NULL) {
   240					/* query inode info */
   241					goto cifs_create_get_file_info;
   242				}
   243	
   244				if ((oflags & OPENAT2_REGULAR) && !S_ISREG(newinode->i_mode)) {
   245					CIFSSMBClose(xid, tcon, fid->netfid);
   246					iput(newinode);
   247					rc = -EFTYPE;
 > 248					goto out;
   249				}
   250	
   251				if (S_ISDIR(newinode->i_mode)) {
   252					CIFSSMBClose(xid, tcon, fid->netfid);
   253					iput(newinode);
   254					return -EISDIR;
   255				}
   256	
   257				if (!S_ISREG(newinode->i_mode)) {
   258					/*
   259					 * The server may allow us to open things like
   260					 * FIFOs, but the client isn't set up to deal
   261					 * with that. If it's not a regular file, just
   262					 * close it and proceed as if it were a normal
   263					 * lookup.
   264					 */
   265					CIFSSMBClose(xid, tcon, fid->netfid);
   266					goto cifs_create_get_file_info;
   267				}
   268				/* success, no need to query */
   269				goto cifs_create_set_dentry;
   270	
   271			case -ENOENT:
   272				goto cifs_create_get_file_info;
   273	
   274			case -EIO:
   275			case -EINVAL:
   276				/*
   277				 * EIO could indicate that (posix open) operation is not
   278				 * supported, despite what server claimed in capability
   279				 * negotiation.
   280				 *
   281				 * POSIX open in samba versions 3.3.1 and earlier could
   282				 * incorrectly fail with invalid parameter.
   283				 */
   284				tcon->broken_posix_open = true;
   285				break;
   286	
   287			case -EREMOTE:
   288			case -EOPNOTSUPP:
   289				/*
   290				 * EREMOTE indicates DFS junction, which is not handled
   291				 * in posix open.  If either that or op not supported
   292				 * returned, follow the normal lookup.
   293				 */
   294				break;
   295	
   296			default:
   297				return rc;
   298			}
   299			/*
   300			 * fallthrough to retry, using older open call, this is case
   301			 * where server does not support this SMB level, and falsely
   302			 * claims capability (also get here for DFS case which should be
   303			 * rare for path not covered on files)
   304			 */
   305		}
   306	#endif /* CONFIG_CIFS_ALLOW_INSECURE_LEGACY */
   307	
   308		desired_access = 0;
   309		if (OPEN_FMODE(oflags) & FMODE_READ)
   310			desired_access |= GENERIC_READ; /* is this too little? */
   311		if (OPEN_FMODE(oflags) & FMODE_WRITE)
   312			desired_access |= GENERIC_WRITE;
   313		if (rdwr_for_fscache == 1)
   314			desired_access |= GENERIC_READ;
   315		if (oflags & O_TMPFILE)
   316			desired_access |= DELETE;
   317	
   318		disposition = FILE_OVERWRITE_IF;
   319		if (oflags & O_CREAT) {
   320			if (oflags & O_EXCL)
   321				disposition = FILE_CREATE;
   322			else if (oflags & O_TRUNC)
   323				disposition = FILE_OVERWRITE_IF;
   324			else
   325				disposition = FILE_OPEN_IF;
   326		} else if (oflags & O_TMPFILE) {
   327			disposition = FILE_CREATE;
   328		} else {
   329			cifs_dbg(FYI, "Create flag not set in create function\n");
   330		}
   331	
   332		/*
   333		 * BB add processing to set equivalent of mode - e.g. via CreateX with
   334		 * ACLs
   335		 */
   336	
   337		if (!server->ops->open)
   338			return -EOPNOTSUPP;
   339	
   340		create_options |= cifs_open_create_options(oflags, create_options);
   341		/*
   342		 * if we're not using unix extensions, see if we need to set
   343		 * ATTR_READONLY on the create call
   344		 */
   345		if (!tcon->unix_ext && (mode & S_IWUGO) == 0)
   346			create_options |= CREATE_OPTION_READONLY;
   347	
   348	
   349	retry_open:
   350		if (tcon->cfids && direntry->d_parent && server->dialect >= SMB30_PROT_ID) {
   351			parent_cfid = NULL;
   352			spin_lock(&tcon->cfids->cfid_list_lock);
   353			list_for_each_entry(parent_cfid, &tcon->cfids->entries, entry) {
   354				if (parent_cfid->dentry == direntry->d_parent) {
   355					cifs_dbg(FYI, "found a parent cached file handle\n");
   356					if (is_valid_cached_dir(parent_cfid)) {
   357						lease_flags
   358							|= SMB2_LEASE_FLAG_PARENT_LEASE_KEY_SET_LE;
   359						memcpy(fid->parent_lease_key,
   360						       parent_cfid->fid.lease_key,
   361						       SMB2_LEASE_KEY_SIZE);
   362						parent_cfid->dirents.is_valid = false;
   363						parent_cfid->dirents.is_failed = true;
   364					}
   365					break;
   366				}
   367			}
   368			spin_unlock(&tcon->cfids->cfid_list_lock);
   369		}
   370	
   371		oparms = (struct cifs_open_parms) {
   372			.tcon = tcon,
   373			.cifs_sb = cifs_sb,
   374			.desired_access = desired_access,
   375			.create_options = cifs_create_options(cifs_sb, create_options),
   376			.disposition = disposition,
   377			.path = full_path,
   378			.fid = fid,
   379			.lease_flags = lease_flags,
   380			.mode = mode,
   381		};
   382		rc = server->ops->open(xid, &oparms, oplock, buf);
   383		if (rc) {
   384			cifs_dbg(FYI, "cifs_create returned 0x%x\n", rc);
   385			if (rc == -EACCES && rdwr_for_fscache == 1) {
   386				desired_access &= ~GENERIC_READ;
   387				rdwr_for_fscache = 2;
   388				goto retry_open;
   389			}
   390			return rc;
   391		}
   392		if (rdwr_for_fscache == 2)
   393			cifs_invalidate_cache(dir, FSCACHE_INVAL_DIO_WRITE);
   394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
