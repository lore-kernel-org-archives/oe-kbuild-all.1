Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807BDA23
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 01:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710984093; cv=none; b=Ck/xfQreADUbWmSO7onEr9bqjkWxNRSO1drEaUfxYY14n17v5/OBGfFB8QNrBZune2usjRAzh7xtR3Cm+zhvn04Gf6PkkWY6+Lfuu75HihihDVH78fGVkd/EBdcRx9nF61NqJSJoV/KOzEDXLuWOmMPzXAvZWSiqYopAbfsSHTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710984093; c=relaxed/simple;
	bh=0YRo7z7jFJx4JiwV7cu/2DtGmeBxLK/AKJZTh0DqObc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uQm4g9FU5ktHKWDNm1neNzzWjSN9c0CylNYTH+QRzMhbtB1QjwaPikfYXL8snWY1ajfFgH+JtWLSOh45zuJO9LGQD5OVHUXWvB32JtizbiOdpL+Bsml4A7sY+ZHLQ6blMBhTnyQXienIvVQLyf3/HzMUjGMH96DorvyTqej+/lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZbzH3AS9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZbzH3AS9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710984092; x=1742520092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0YRo7z7jFJx4JiwV7cu/2DtGmeBxLK/AKJZTh0DqObc=;
  b=ZbzH3AS9CiodzRIJYCVelQfj0OKIZHpZ8lnRJOuUwQopUZk1H0MeQSST
   w3WHHKVuZii1xeY9xsxluIL2Q8ciH9+jKy1rFnB+VMbvKeivlJd7RBLr1
   Um9WYbNaJUlPzVh60QVWyQm0MpwOo2XSdDQdpjpm/sHPLaIucEhtnfm/h
   3D97j6sEfgawWUEYW/91xVZ0OYoFD5jPU8O+SaHVfwJoIga6htb+SRjR4
   pXzLJHDZQ2EoHn7L1u7d3QV0k5l5//Ok6t8khbb91SkrOJdFaoSOXVZVd
   th3CBE9P6IC2IOMOV0iPUgIL4InxLbBIxTYC4PHNxDO6uO2YNJtmB2je/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="17398872"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="17398872"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 18:21:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="14407655"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Mar 2024 18:21:29 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rn77X-000J3r-0G;
	Thu, 21 Mar 2024 01:21:27 +0000
Date: Thu, 21 Mar 2024 09:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:6.5-full-backport 68/167]
 fs/smb/client/xattr.c:158:33: error: implicit declaration of function
 'inode_set_ctime_current'
Message-ID: <202403210940.86wPdiss-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/smfrench/smb3-kernel.git 6.5-full-backport
head:   9aa9166e03ff319eedbf774305097ad3c499dd7d
commit: 2e5e6a15c1fb06139d2c8a3a9739ac03800ffe6d [68/167] smb3: fix caching of ctime on setxattr
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240321/202403210940.86wPdiss-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403210940.86wPdiss-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403210940.86wPdiss-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/client/xattr.c: In function 'cifs_xattr_set':
>> fs/smb/client/xattr.c:158:33: error: implicit declaration of function 'inode_set_ctime_current' [-Werror=implicit-function-declaration]
     158 |                                 inode_set_ctime_current(inode);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/inode_set_ctime_current +158 fs/smb/client/xattr.c

    90	
    91	static int cifs_xattr_set(const struct xattr_handler *handler,
    92				  struct mnt_idmap *idmap,
    93				  struct dentry *dentry, struct inode *inode,
    94				  const char *name, const void *value,
    95				  size_t size, int flags)
    96	{
    97		int rc = -EOPNOTSUPP;
    98		unsigned int xid;
    99		struct super_block *sb = dentry->d_sb;
   100		struct cifs_sb_info *cifs_sb = CIFS_SB(sb);
   101		struct tcon_link *tlink;
   102		struct cifs_tcon *pTcon;
   103		const char *full_path;
   104		void *page;
   105	
   106		tlink = cifs_sb_tlink(cifs_sb);
   107		if (IS_ERR(tlink))
   108			return PTR_ERR(tlink);
   109		pTcon = tlink_tcon(tlink);
   110	
   111		xid = get_xid();
   112		page = alloc_dentry_path();
   113	
   114		full_path = build_path_from_dentry(dentry, page);
   115		if (IS_ERR(full_path)) {
   116			rc = PTR_ERR(full_path);
   117			goto out;
   118		}
   119		/* return dos attributes as pseudo xattr */
   120		/* return alt name if available as pseudo attr */
   121	
   122		/* if proc/fs/cifs/streamstoxattr is set then
   123			search server for EAs or streams to
   124			returns as xattrs */
   125		if (size > MAX_EA_VALUE_SIZE) {
   126			cifs_dbg(FYI, "size of EA value too large\n");
   127			rc = -EOPNOTSUPP;
   128			goto out;
   129		}
   130	
   131		switch (handler->flags) {
   132		case XATTR_USER:
   133			cifs_dbg(FYI, "%s:setting user xattr %s\n", __func__, name);
   134			if ((strcmp(name, CIFS_XATTR_ATTRIB) == 0) ||
   135			    (strcmp(name, SMB3_XATTR_ATTRIB) == 0)) {
   136				rc = cifs_attrib_set(xid, pTcon, inode, full_path,
   137						value, size);
   138				if (rc == 0) /* force revalidate of the inode */
   139					CIFS_I(inode)->time = 0;
   140				break;
   141			} else if ((strcmp(name, CIFS_XATTR_CREATETIME) == 0) ||
   142				   (strcmp(name, SMB3_XATTR_CREATETIME) == 0)) {
   143				rc = cifs_creation_time_set(xid, pTcon, inode,
   144						full_path, value, size);
   145				if (rc == 0) /* force revalidate of the inode */
   146					CIFS_I(inode)->time = 0;
   147				break;
   148			}
   149	
   150			if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_NO_XATTR)
   151				goto out;
   152	
   153			if (pTcon->ses->server->ops->set_EA) {
   154				rc = pTcon->ses->server->ops->set_EA(xid, pTcon,
   155					full_path, name, value, (__u16)size,
   156					cifs_sb->local_nls, cifs_sb);
   157				if (rc == 0)
 > 158					inode_set_ctime_current(inode);
   159			}
   160			break;
   161	
   162		case XATTR_CIFS_ACL:
   163		case XATTR_CIFS_NTSD:
   164		case XATTR_CIFS_NTSD_FULL: {
   165			struct cifs_ntsd *pacl;
   166	
   167			if (!value)
   168				goto out;
   169			pacl = kmalloc(size, GFP_KERNEL);
   170			if (!pacl) {
   171				rc = -ENOMEM;
   172			} else {
   173				memcpy(pacl, value, size);
   174				if (pTcon->ses->server->ops->set_acl) {
   175					int aclflags = 0;
   176					rc = 0;
   177	
   178					switch (handler->flags) {
   179					case XATTR_CIFS_NTSD_FULL:
   180						aclflags = (CIFS_ACL_OWNER |
   181							    CIFS_ACL_GROUP |
   182							    CIFS_ACL_DACL |
   183							    CIFS_ACL_SACL);
   184						break;
   185					case XATTR_CIFS_NTSD:
   186						aclflags = (CIFS_ACL_OWNER |
   187							    CIFS_ACL_GROUP |
   188							    CIFS_ACL_DACL);
   189						break;
   190					case XATTR_CIFS_ACL:
   191					default:
   192						aclflags = CIFS_ACL_DACL;
   193					}
   194	
   195					rc = pTcon->ses->server->ops->set_acl(pacl,
   196						size, inode, full_path, aclflags);
   197				} else {
   198					rc = -EOPNOTSUPP;
   199				}
   200				if (rc == 0) /* force revalidate of the inode */
   201					CIFS_I(inode)->time = 0;
   202				kfree(pacl);
   203			}
   204			break;
   205		}
   206		}
   207	
   208	out:
   209		free_dentry_path(page);
   210		free_xid(xid);
   211		cifs_put_tlink(tlink);
   212		return rc;
   213	}
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
