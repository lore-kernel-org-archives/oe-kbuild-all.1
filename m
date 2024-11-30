Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B313A132103
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 19:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732993584; cv=none; b=dGc8oyYZezosZdcrZ9OIHWpugU8EGPEOS5/9U4dDn7xRTJcjPb5AbeMz4vyUKiO+BtdkPtgA56f1vQIPaOPy1Exh8Pu4hb/WawUA9SbHkSm2mV4jrlItGUg4PGPqLQ6H+U+rf0binrj66wKOtZdlk36zjmOc6rE76ljPNvJZNHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732993584; c=relaxed/simple;
	bh=Ow6s/w7/jUdW3MHvRH7zQ+9z8ziEIvR5MZj1Uu+wiqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SyTUiLpYcUoEXE/9oV7AIX+CFZVM88nDNs9nRprhCVZOSIMYN2+x/47SYRTT5OEo6MIV9A4fOfByTqIIUnnHGf6PCE7H5mvarDNBUFATnH+QTIBDT0peIXWVQS0M39fjrz6jP1t0N6jLUWv4V9ecdjosDuFcVU7k66c8qyKIuCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f95OV8Dv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f95OV8Dv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732993583; x=1764529583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ow6s/w7/jUdW3MHvRH7zQ+9z8ziEIvR5MZj1Uu+wiqg=;
  b=f95OV8DvLqm3MUO5opEFq9n/wzsCAJNm2efSYfQZTbmTu8d6qWNSsApX
   pT9/4gYUwM/YqB/SE/BMiQnLUZrR8ROiXZ1IWlOI6XrFo+yDVsfwF1rne
   vs0DZAXURDibtkO8BXpLQK74FTWtkz+buBKvqM0F/zc0cU7sVm2676ZeN
   Z1iFnU98rkbXbac4VO9JI33ba4l89R/a0UasVbOrNRYYrpN1cBcnGLFue
   OIadOT7DYeBZNhabNzYn7g5rfmtyVATkskr6JIeIIl2Tca9oT8utRW0ww
   TmyaYbMtnz2UAwtVMXaGch/mxQuUKNwPHnlPknCduxU9lN1UwJKNLM4Cl
   g==;
X-CSE-ConnectionGUID: Pq4M25/tRACwCnudkYlMVg==
X-CSE-MsgGUID: ntnRAeQyTJmlX8pxIn1yuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33321644"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="33321644"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 11:06:23 -0800
X-CSE-ConnectionGUID: k8n+/4AQRbqqjyHYr9XL4w==
X-CSE-MsgGUID: dCD4voNSTQGy5XD20p481A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="92640562"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 30 Nov 2024 11:06:21 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHSnK-0000vT-1c;
	Sat, 30 Nov 2024 19:06:18 +0000
Date: Sun, 1 Dec 2024 03:05:52 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?unknown-8bit?B?Um9ow6Fy?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 5/20] fs/smb/client/reparse.c:145:25: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202412010219.3x9WzZpP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pali/linux.git cifs
head:   f36b8c5bb788de2feea99660389db8e290cb36c5
commit: 5801c666d8325f01e5ab138fd3a0f8760df43f21 [5/20] cifs: Fix creating and resolving absolute NT-style symlinks
config: x86_64-randconfig-122-20241117 (https://download.01.org/0day-ci/archive/20241201/202412010219.3x9WzZpP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010219.3x9WzZpP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010219.3x9WzZpP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/client/reparse.c:145:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got int @@
   fs/smb/client/reparse.c:145:25: sparse:     expected restricted __le16 [usertype]
   fs/smb/client/reparse.c:145:25: sparse:     got int
   fs/smb/client/reparse.c:146:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got int @@
   fs/smb/client/reparse.c:146:35: sparse:     expected restricted __le16 [usertype]
   fs/smb/client/reparse.c:146:35: sparse:     got int
   fs/smb/client/reparse.c:147:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got int @@
   fs/smb/client/reparse.c:147:25: sparse:     expected restricted __le16 [usertype]
   fs/smb/client/reparse.c:147:25: sparse:     got int
   fs/smb/client/reparse.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false

vim +145 fs/smb/client/reparse.c

    16	
    17	static int detect_directory_symlink_target(struct cifs_sb_info *cifs_sb,
    18						   const unsigned int xid,
    19						   const char *full_path,
    20						   const char *symname,
    21						   bool *directory);
    22	
    23	int smb2_create_reparse_symlink(const unsigned int xid, struct inode *inode,
    24					struct dentry *dentry, struct cifs_tcon *tcon,
    25					const char *full_path, const char *symname)
    26	{
    27		struct reparse_symlink_data_buffer *buf = NULL;
    28		struct cifs_open_info_data data = {};
    29		struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
    30		struct inode *new;
    31		struct kvec iov;
    32		__le16 *path = NULL;
    33		bool directory;
    34		char *symlink_target = NULL;
    35		char *sym = NULL;
    36		char sep = CIFS_DIR_SEP(cifs_sb);
    37		u16 len, plen, poff, slen;
    38		int rc = 0;
    39	
    40		symlink_target = kstrdup(symname, GFP_KERNEL);
    41		if (!symlink_target) {
    42			rc = -ENOMEM;
    43			goto out;
    44		}
    45	
    46		data = (struct cifs_open_info_data) {
    47			.reparse_point = true,
    48			.reparse = { .tag = IO_REPARSE_TAG_SYMLINK, },
    49			.symlink_target = symlink_target,
    50		};
    51	
    52		if (!(cifs_sb->mnt_cifs_flags & CIFS_MOUNT_POSIX_PATHS) && symname[0] == '/') {
    53			/*
    54			 * This is a request to create an absolute symlink on the server
    55			 * which does not support POSIX paths, and expects symlink in
    56			 * NT-style path. So convert absolute Linux symlink target path
    57			 * to the absolute NT-style path. Root of the NT-style path for
    58			 * symlinks is specified in "symlinkroot" mount option. This will
    59			 * ensure compatibility of this symlink stored in absolute form
    60			 * on the SMB server.
    61			 */
    62			if (!strstarts(symname, cifs_sb->ctx->symlinkroot)) {
    63				/*
    64				 * If the absolute Linux symlink target path is not
    65				 * inside "symlinkroot" location then there is no way
    66				 * to convert such Linux symlink to NT-style path.
    67				 */
    68				cifs_dbg(VFS,
    69					 "absolute symlink '%s' cannot be converted to NT format "
    70					 "because it is outside of symlinkroot='%s'\n",
    71					 symname, cifs_sb->ctx->symlinkroot);
    72				rc = -EINVAL;
    73				goto out;
    74			}
    75			len = strlen(cifs_sb->ctx->symlinkroot);
    76			if (cifs_sb->ctx->symlinkroot[len-1] != '/')
    77				len++;
    78			if (symname[len] >= 'a' && symname[len] <= 'z' &&
    79			    (symname[len+1] == '/' || symname[len+1] == '\0')) {
    80				/*
    81				 * Symlink points to Linux target /symlinkroot/x/path/...
    82				 * where 'x' is the lowercase local Windows drive.
    83				 * NT-style path for 'x' has common form \??\X:\path\...
    84				 * with uppercase local Windows drive.
    85				 */
    86				int common_path_len = strlen(symname+len+1)+1;
    87				sym = kzalloc(6+common_path_len, GFP_KERNEL);
    88				if (!sym) {
    89					rc = -ENOMEM;
    90					goto out;
    91				}
    92				memcpy(sym, "\\??\\", 4);
    93				sym[4] = symname[len] - ('a'-'A');
    94				sym[5] = ':';
    95				memcpy(sym+6, symname+len+1, common_path_len);
    96			} else {
    97				/* Unhandled absolute symlink. Report an error. */
    98				cifs_dbg(
    99					 VFS,
   100					 "absolute symlink '%s' cannot be converted to NT format "
   101					 "because it points to unknown target\n",
   102					 symname);
   103				rc = -EINVAL;
   104				goto out;
   105			}
   106		} else {
   107			/*
   108			 * This is request to either create an absolute symlink on
   109			 * server which expects POSIX paths or it is an request to
   110			 * create a relative symlink from the current directory.
   111			 * These paths have same format as relative SMB symlinks,
   112			 * so no conversion is needed. So just take symname as-is.
   113			 */
   114			sym = kstrdup(symname, GFP_KERNEL);
   115			if (!sym) {
   116				rc = -ENOMEM;
   117				goto out;
   118			}
   119		}
   120	
   121		if (sep == '\\')
   122			convert_delimiter(sym, sep);
   123	
   124		/*
   125		 * For absolute NT symlinks it is required to pass also leading
   126		 * backslash and to not mangle NT object prefix "\\??\\" and not to
   127		 * mangle colon in drive letter. But cifs_convert_path_to_utf16()
   128		 * removes leading backslash and replaces '?' and ':'. So temporary
   129		 * mask these characters in NT object prefix by '_' and then change
   130		 * them back.
   131		 */
   132		if (!(cifs_sb->mnt_cifs_flags & CIFS_MOUNT_POSIX_PATHS) && symname[0] == '/')
   133			sym[0] = sym[1] = sym[2] = sym[5] = '_';
   134	
   135		path = cifs_convert_path_to_utf16(sym, cifs_sb);
   136		if (!path) {
   137			rc = -ENOMEM;
   138			goto out;
   139		}
   140	
   141		if (!(cifs_sb->mnt_cifs_flags & CIFS_MOUNT_POSIX_PATHS) && symname[0] == '/') {
   142			sym[0] = '\\';
   143			sym[1] = sym[2] = '?';
   144			sym[5] = ':';
 > 145			path[0] = '\\';
   146			path[1] = path[2] = '?';
   147			path[5] = ':';
   148		}
   149	
   150		/*
   151		 * SMB distinguish between symlink to directory and symlink to file.
   152		 * They cannot be exchanged (symlink of file type which points to
   153		 * directory cannot be resolved and vice-versa). Try to detect if
   154		 * the symlink target could be a directory or not. When detection
   155		 * fails then treat symlink as a file (non-directory) symlink.
   156		 */
   157		directory = false;
   158		rc = detect_directory_symlink_target(cifs_sb, xid, full_path, symname, &directory);
   159		if (rc < 0)
   160			goto out;
   161	
   162		slen = 2 * UniStrnlen((wchar_t *)path, PATH_MAX);
   163		poff = 0;
   164		plen = slen;
   165		if (!(cifs_sb->mnt_cifs_flags & CIFS_MOUNT_POSIX_PATHS) && symname[0] == '/') {
   166			/*
   167			 * For absolute NT symlinks skip leading "\\??\\" in PrintName as
   168			 * PrintName is user visible location in DOS/Win32 format (not in NT format).
   169			 */
   170			poff = 4;
   171			plen -= 2 * poff;
   172		}
   173		len = sizeof(*buf) + plen + slen;
   174		buf = kzalloc(len, GFP_KERNEL);
   175		if (!buf) {
   176			rc = -ENOMEM;
   177			goto out;
   178		}
   179	
   180		buf->ReparseTag = cpu_to_le32(IO_REPARSE_TAG_SYMLINK);
   181		buf->ReparseDataLength = cpu_to_le16(len - sizeof(struct reparse_data_buffer));
   182	
   183		buf->SubstituteNameOffset = cpu_to_le16(plen);
   184		buf->SubstituteNameLength = cpu_to_le16(slen);
   185		memcpy(&buf->PathBuffer[plen], path, slen);
   186	
   187		buf->PrintNameOffset = 0;
   188		buf->PrintNameLength = cpu_to_le16(plen);
   189		memcpy(buf->PathBuffer, path+poff, plen);
   190	
   191		buf->Flags = cpu_to_le32(*symname != '/' ? SYMLINK_FLAG_RELATIVE : 0);
   192	
   193		iov.iov_base = buf;
   194		iov.iov_len = len;
   195		new = smb2_get_reparse_inode(&data, inode->i_sb, xid,
   196					     tcon, full_path, directory,
   197					     &iov, NULL);
   198		if (!IS_ERR(new))
   199			d_instantiate(dentry, new);
   200		else
   201			rc = PTR_ERR(new);
   202	out:
   203		kfree(sym);
   204		kfree(path);
   205		cifs_free_open_info(&data);
   206		kfree(buf);
   207		return rc;
   208	}
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
