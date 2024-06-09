Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6C61CF9B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 23:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717976867; cv=none; b=k6cJwLBDPsWzGJBgUvQhFfs+Fw0R8nm0nPzesqL6OYeiCBeUcQ3dSGuF+LWiV8jGefzZzeithOSkrhv+kUvZXlQFa/bvj3zZqI2l6421i7Y946JjmpR6auu9z4kLudOXu117d+c6frzNxmuSLedFSfwurTbFZgUKJixakDExsr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717976867; c=relaxed/simple;
	bh=GS8XFzlrkFswcWbsfQh6crnTT7KHogs5TCDybdh2Oxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XbG+rCknMpFWAQxyO+yr+ogBUDVhcL2FDBIRt4WvD5QeqLW/sO/AuhnEGXgmi7BDiWvtB/w4gvlssXBM1JVzio5B5+he/QSI14IEZgW9zE8UTzCPYwQ7P7BI2XSuExsWVyFpZExAQTvEtwsD5W9kSHz3jkSQAjfDGpSpGKaZDKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWeUF1S3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWeUF1S3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717976865; x=1749512865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GS8XFzlrkFswcWbsfQh6crnTT7KHogs5TCDybdh2Oxw=;
  b=NWeUF1S3RYBobMXjIdzK2ZvhUIWEbcYQ2zke+HofYrqO3WzyVrGG1rNE
   n+ZKNAxlVx1701WDGHMJ/qx74nqVV6xDvlGOZxupXGgAj6+FnmNxu+hmt
   Ntskoirz2fNvVN2wXwliuZyx7653YESEMAaV4Wj5z2Kv2jBor832iBI0b
   iiozcQUocYE0nj6StnKiD2jVjVRbj9N6Oum5xNNLWcKRqVF1SJVVJQVxv
   yc5GVa4e4ztCEs9CqpWLqw8jFufbPHjBpi10fCX6s+/QRftz643Fz9mJK
   qZC7ZHU8WiDHVHOF97JBsQyHyXqrfl+W7aaCZpgi90OML2roHadYUMcbm
   g==;
X-CSE-ConnectionGUID: cXtEpnBETMWcCxxU3mijhQ==
X-CSE-MsgGUID: TKI/2MR+TXK7hcg5BLUqAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14860016"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="14860016"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 16:47:44 -0700
X-CSE-ConnectionGUID: hoPlyxl8TmC2UPoH7jQzXg==
X-CSE-MsgGUID: QgHfD8mVQZKIEK/4ZsZwMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="43454876"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jun 2024 16:47:43 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGSGD-0001gM-0e;
	Sun, 09 Jun 2024 23:47:41 +0000
Date: Mon, 10 Jun 2024 07:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [samba-ksmbd:for-next 526/600] fs/cifs/xattr.c:158:33: error:
 implicit declaration of function 'inode_set_ctime_current'
Message-ID: <202406100758.rakE6kvQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git for-next
head:   3fe4ba20003290acf0547625cccc34db928d156e
commit: 74269d02d02f9ff7dc5b3c869d5d037a0dcc33a2 [526/600] smb3: fix caching of ctime on setxattr
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240610/202406100758.rakE6kvQ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100758.rakE6kvQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100758.rakE6kvQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/cifs/xattr.c:14:
   fs/cifs/cifspdu.h:512:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2289:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2289 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2328:9: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2328 |         DECLARE_FLEX_ARRAY(char, LinkDest);
         |         ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2377:9: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2377 |         DECLARE_FLEX_ARRAY(__u8, alt_name);
         |         ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2488:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2488 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   In file included from fs/cifs/cifsglob.h:26,
                    from fs/cifs/xattr.c:15:
   fs/cifs/../smbfs_common/smb2pdu.h:842:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     842 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:1682:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    1682 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/xattr.c: In function 'cifs_xattr_set':
>> fs/cifs/xattr.c:158:33: error: implicit declaration of function 'inode_set_ctime_current' [-Werror=implicit-function-declaration]
     158 |                                 inode_set_ctime_current(inode);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/inode_set_ctime_current +158 fs/cifs/xattr.c

    90	
    91	static int cifs_xattr_set(const struct xattr_handler *handler,
    92				  struct user_namespace *mnt_userns,
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
   206	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
