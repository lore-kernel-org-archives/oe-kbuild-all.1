Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AD2BA3F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 11:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735730328; cv=none; b=akq3N0HvjPCPb2Z682MnmVgXf03qwS84pKl1i9j8iHJUR/vN0tqYRaaguHoWI9JOv5NI1QTM/jwzg3c9ixS5xyJ6OBsLrq0lhrdgsyeiLtViOyUXRtoXn7hQJi5/nbXIqBDeP/NPkHpOSJ9Vjp2onjdqyELtkl/eNqi2Ps+PT7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735730328; c=relaxed/simple;
	bh=notjCmS1T4UZrr+XGEIfRM7k47XjNiInAh93Zr8tN40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7qqmb00884UAzlpz5Vl8v3CymQIaDeVgJ6H5pRBpOmWFIIUGli8aY7djNXUYCfhDW8dqQMJZslu3IMjsE3Trc/TxcCZ75x2yu9ZLF+khNepjfWvZg6b21i/drUJyIDQdYcrGxKjosSca0DSH1/4UzeuWpdNRLEXrdb3LjqdWCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KNQoGTG3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNQoGTG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735730326; x=1767266326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=notjCmS1T4UZrr+XGEIfRM7k47XjNiInAh93Zr8tN40=;
  b=KNQoGTG3wZ+GlSBfDV38Tffc+vSiRG1S5TyryeiDU+o5KwL0qTawihFZ
   Tzw87XhLKdxct+CY9x+ruQi4Y4FsYwswjqCUfJXztTWrTs8XJfVQYCZl5
   VTPRrh6FxHgp0y2g306eY1VSyhBofs8GSVZTdl7FMX30MnZtzXBtQC6Bk
   bhOxQNJSI9XteDs4l4+Pr3Ss/nSqqmc8r0YHvQD8Pw4wcG/wBR5TQaenr
   27+f5vt0XszEX5RcolBPHHjxDBkxiFyXdNJmIHct014tNsioDIF6haiZo
   Rvps/q1LZsS2zth1xGWnuTLT6bIYbmDqgZwqkB17SAiIB6gm6YQv8qLQQ
   g==;
X-CSE-ConnectionGUID: cyEX7SSdSqu2kad6UuDrqQ==
X-CSE-MsgGUID: GMRy9NvNRZaPIieItsARIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46661123"
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; 
   d="scan'208";a="46661123"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 03:18:46 -0800
X-CSE-ConnectionGUID: uh7evBfzRYO7gYWts8fJVA==
X-CSE-MsgGUID: jXM0pTwGQAuDn4HmYlBECQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124514988"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jan 2025 03:18:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSwkM-0007m9-1J;
	Wed, 01 Jan 2025 11:18:42 +0000
Date: Wed, 1 Jan 2025 19:18:36 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 66/68] fs/smb/client/smb1ops.c:994:66: sparse: sparse:
 restricted __le32 degrades to integer
Message-ID: <202501011945.PpT1i7RN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pali/linux.git cifs
head:   f3a886a6c4f999b4a40aa9d107d9364b335ffe49
commit: e40f924ba05522b1b8a3958c4acc19afdbea2c8c [66/68] cifs: Fix changing times and read-only attr over SMB1 smb_set_file_info() function
config: x86_64-randconfig-122-20250101 (https://download.01.org/0day-ci/archive/20250101/202501011945.PpT1i7RN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011945.PpT1i7RN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501011945.PpT1i7RN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/smb/client/smb1ops.c:983:22: sparse: sparse: cast to restricted __le32
>> fs/smb/client/smb1ops.c:994:66: sparse: sparse: restricted __le32 degrades to integer
>> fs/smb/client/smb1ops.c:994:61: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __le32 [usertype] attributes @@     got unsigned int @@
   fs/smb/client/smb1ops.c:994:61: sparse:     expected restricted __le32 [usertype] attributes
   fs/smb/client/smb1ops.c:994:61: sparse:     got unsigned int
   fs/smb/client/smb1ops.c:1297:42: sparse: sparse: cast to restricted __le32
--
   fs/smb/client/cifssmb.c:2913:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] ByteCount @@     got restricted __le32 [usertype] @@
   fs/smb/client/cifssmb.c:2913:27: sparse:     expected restricted __le16 [usertype] ByteCount
   fs/smb/client/cifssmb.c:2913:27: sparse:     got restricted __le32 [usertype]
>> fs/smb/client/cifssmb.c:5331:40: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le64 [usertype] utc_nanoseconds_since_1601 @@     got unsigned long long [usertype] @@
   fs/smb/client/cifssmb.c:5331:40: sparse:     expected restricted __le64 [usertype] utc_nanoseconds_since_1601
   fs/smb/client/cifssmb.c:5331:40: sparse:     got unsigned long long [usertype]
>> fs/smb/client/cifssmb.c:5337:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] ByteCount @@     got restricted __le16 [usertype] @@
   fs/smb/client/cifssmb.c:5337:25: sparse:     expected unsigned short [usertype] ByteCount
   fs/smb/client/cifssmb.c:5337:25: sparse:     got restricted __le16 [usertype]

vim +994 fs/smb/client/smb1ops.c

   872	
   873	static int
   874	smb_set_file_info(struct inode *inode, const char *full_path,
   875			  FILE_BASIC_INFO *buf, const unsigned int xid)
   876	{
   877		int oplock = 0;
   878		int rc;
   879		__u32 netpid;
   880		struct cifs_fid fid;
   881		struct cifs_open_parms oparms;
   882		struct cifsFileInfo *open_file;
   883		FILE_BASIC_INFO new_buf;
   884		struct cifs_open_info_data query_data;
   885		__le64 write_time = buf->LastWriteTime;
   886		struct cifsInodeInfo *cinode = CIFS_I(inode);
   887		struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
   888		struct tcon_link *tlink = NULL;
   889		struct cifs_tcon *tcon;
   890	
   891		/* if the file is already open for write, just use that fileid */
   892		open_file = find_writable_file(cinode, FIND_WR_FSUID_ONLY);
   893	
   894		if (open_file) {
   895			fid.netfid = open_file->fid.netfid;
   896			netpid = open_file->pid;
   897			tcon = tlink_tcon(open_file->tlink);
   898		} else {
   899			tlink = cifs_sb_tlink(cifs_sb);
   900			if (IS_ERR(tlink)) {
   901				rc = PTR_ERR(tlink);
   902				tlink = NULL;
   903				goto out;
   904			}
   905			tcon = tlink_tcon(tlink);
   906		}
   907	
   908		/*
   909		 * Non-NT servers interprets zero time value in SMB_SET_FILE_BASIC_INFO
   910		 * over TRANS2_SET_FILE_INFORMATION as a valid time value. NT servers
   911		 * interprets zero time value as do not change existing value on server.
   912		 * API of ->set_file_info() callback expects that zero time value has
   913		 * the NT meaning - do not change. Therefore if server is non-NT and
   914		 * some time values in "buf" are zero, then fetch missing time values.
   915		 */
   916		if (!(tcon->ses->capabilities & CAP_NT_SMBS) &&
   917		    (!buf->CreationTime || !buf->LastAccessTime ||
   918		     !buf->LastWriteTime || !buf->ChangeTime)) {
   919			rc = cifs_query_path_info(xid, tcon, cifs_sb, full_path, &query_data);
   920			if (rc) {
   921				if (open_file) {
   922					cifsFileInfo_put(open_file);
   923					open_file = NULL;
   924				}
   925				goto out;
   926			}
   927			/*
   928			 * Original write_time from buf->LastWriteTime is preserved
   929			 * as SMBSetInformation() interprets zero as do not change.
   930			 */
   931			new_buf = *buf;
   932			buf = &new_buf;
   933			if (!buf->CreationTime)
   934				buf->CreationTime = query_data.fi.CreationTime;
   935			if (!buf->LastAccessTime)
   936				buf->LastAccessTime = query_data.fi.LastAccessTime;
   937			if (!buf->LastWriteTime)
   938				buf->LastWriteTime = query_data.fi.LastWriteTime;
   939			if (!buf->ChangeTime)
   940				buf->ChangeTime = query_data.fi.ChangeTime;
   941		}
   942	
   943		if (open_file)
   944			goto set_via_filehandle;
   945	
   946		rc = CIFSSMBSetPathInfo(xid, tcon, full_path, buf, cifs_sb->local_nls,
   947					cifs_sb);
   948		if (rc == 0) {
   949			cinode->cifsAttrs = le32_to_cpu(buf->Attributes);
   950			goto out;
   951		} else if (rc != -EOPNOTSUPP && rc != -EINVAL) {
   952			goto out;
   953		}
   954	
   955		oparms = (struct cifs_open_parms) {
   956			.tcon = tcon,
   957			.cifs_sb = cifs_sb,
   958			.desired_access = SYNCHRONIZE | FILE_WRITE_ATTRIBUTES,
   959			.create_options = cifs_create_options(cifs_sb, 0),
   960			.disposition = FILE_OPEN,
   961			.path = full_path,
   962			.fid = &fid,
   963		};
   964	
   965		if (S_ISDIR(inode->i_mode) && !(tcon->ses->capabilities & CAP_NT_SMBS)) {
   966			/* Opening directory path is not possible on non-NT servers. */
   967			rc = -EOPNOTSUPP;
   968		} else {
   969			/*
   970			 * Use cifs_open_file() instead of CIFS_open() as the
   971			 * cifs_open_file() selects the correct function which
   972			 * works also on non-NT servers.
   973			 */
   974			rc = cifs_open_file(xid, &oparms, &oplock, NULL);
   975			/*
   976			 * Opening path for writing on non-NT servers is not
   977			 * possible when the read-only attribute is already set.
   978			 * Non-NT server in this case returns -EACCES. For those
   979			 * servers the only possible way how to clear the read-only
   980			 * bit is via SMB_COM_SETATTR command.
   981			 */
   982			if (rc == -EACCES &&
 > 983			    (le32_to_cpu(cinode->cifsAttrs) & ATTR_READONLY) &&
   984			     le32_to_cpu(buf->Attributes) != 0 && /* 0 = do not change attrs */
   985			     !(le32_to_cpu(buf->Attributes) & ATTR_READONLY) &&
   986			     !(tcon->ses->capabilities & CAP_NT_SMBS))
   987				rc = -EOPNOTSUPP;
   988		}
   989	
   990		/* Fallback to SMB_COM_SETATTR command when absolutelty needed. */
   991		if (rc == -EOPNOTSUPP) {
   992			cifs_dbg(FYI, "calling SetInformation since SetPathInfo for attrs/times not supported by this server\n");
   993			rc = SMBSetInformation(xid, tcon, full_path,
 > 994					       buf->Attributes != 0 ? buf->Attributes : cinode->cifsAttrs,
   995					       write_time,
   996					       cifs_sb->local_nls, cifs_sb);
   997			if (rc == 0)
   998				cinode->cifsAttrs = le32_to_cpu(buf->Attributes);
   999			else
  1000				rc = -EACCES;
  1001			goto out;
  1002		}
  1003	
  1004		if (rc != 0) {
  1005			if (rc == -EIO)
  1006				rc = -EINVAL;
  1007			goto out;
  1008		}
  1009	
  1010		netpid = current->tgid;
  1011		cifs_dbg(FYI, "calling SetFileInfo since SetPathInfo for attrs/times not supported by this server\n");
  1012	
  1013	set_via_filehandle:
  1014		rc = CIFSSMBSetFileInfo(xid, tcon, buf, fid.netfid, netpid);
  1015		if (!rc)
  1016			cinode->cifsAttrs = le32_to_cpu(buf->Attributes);
  1017	
  1018		if (open_file == NULL)
  1019			CIFSSMBClose(xid, tcon, fid.netfid);
  1020		else
  1021			cifsFileInfo_put(open_file);
  1022	
  1023		/*
  1024		 * Setting the read-only bit is not honered on non-NT servers when done
  1025		 * via open-semantics. So for setting it, use SMB_COM_SETATTR command.
  1026		 * This command works only after the file is closed, so use it only when
  1027		 * operation was called without the filehandle.
  1028		 */
  1029		if (open_file == NULL &&
  1030		    !(tcon->ses->capabilities & CAP_NT_SMBS) &&
  1031		    le32_to_cpu(buf->Attributes) & ATTR_READONLY) {
  1032			SMBSetInformation(xid, tcon, full_path,
  1033					  buf->Attributes,
  1034					  0 /* do not change write time */,
  1035					  cifs_sb->local_nls, cifs_sb);
  1036		}
  1037	out:
  1038		if (tlink != NULL)
  1039			cifs_put_tlink(tlink);
  1040		return rc;
  1041	}
  1042	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
