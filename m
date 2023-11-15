Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7890418030
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 22:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXpjzufZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700086245; x=1731622245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=maROREaxhbzhyCN/dQeXE9u69LyEk85z7I+70hvwi10=;
  b=nXpjzufZ+hp614irxDiVLOESga9QXf37f3PnkymdGxpiG0fhNnpqKoft
   2dYNHX3SFOboFYGoT5fPeyxclgOCdtnHVGE45cfh4pq9636JWgb9/uLS7
   GJPySi4NUNmC1YKqx44vKR7CD+MLhpWsIXIxqGRQh9ZjkteaFktF182m0
   1wAVpXc4Q5sZ2G/OO9lHr6ZfwvCSqoQJFIv0QxDoRf0LGQpENXS9AGRP9
   UQzy35SL92j5n0YjsApzaS1tAFVIm8cJXjCCPP72yORILyxHceNww3F3I
   tgbkqFJUZFLK4C9AgVWVmluxqA2gHy170d5pot3TZa6ps2FAYHCg47X2v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="12518798"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="12518798"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 14:10:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="765107993"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="765107993"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Nov 2023 14:10:39 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3O5l-0000ti-1X;
	Wed, 15 Nov 2023 22:10:37 +0000
Date: Thu, 16 Nov 2023 06:09:29 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [samba-ksmbd:ksmbd-for-next-next 5/5] fs/smb/server/vfs.c:921:
 warning: Function parameter or member 'get_write' not described in
 'ksmbd_vfs_setxattr'
Message-ID: <202311160659.VdkloROy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   8445423a0a7af953b7f01a9898a91f3ac0082cb5
commit: 8445423a0a7af953b7f01a9898a91f3ac0082cb5 [5/5] ksmbd: fix possible deadlock in smb2_open
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231116/202311160659.VdkloROy-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160659.VdkloROy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160659.VdkloROy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/server/vfs.c:54: warning: Function parameter or member 'parent' not described in 'ksmbd_vfs_lock_parent'
   fs/smb/server/vfs.c:54: warning: Function parameter or member 'child' not described in 'ksmbd_vfs_lock_parent'
   fs/smb/server/vfs.c:372: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_read'
   fs/smb/server/vfs.c:372: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_read'
   fs/smb/server/vfs.c:489: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_write'
   fs/smb/server/vfs.c:489: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_write'
   fs/smb/server/vfs.c:552: warning: Function parameter or member 'path' not described in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:552: warning: Function parameter or member 'stat' not described in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:552: warning: Excess function parameter 'work' description in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:552: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:552: warning: Excess function parameter 'attrs' description in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:569: warning: Function parameter or member 'p_id' not described in 'ksmbd_vfs_fsync'
   fs/smb/server/vfs.c:592: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_remove_file'
   fs/smb/server/vfs.c:592: warning: Function parameter or member 'path' not described in 'ksmbd_vfs_remove_file'
   fs/smb/server/vfs.c:592: warning: Excess function parameter 'name' description in 'ksmbd_vfs_remove_file'
   fs/smb/server/vfs.c:630: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_link'
   fs/smb/server/vfs.c:802: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_truncate'
   fs/smb/server/vfs.c:802: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_truncate'
   fs/smb/server/vfs.c:843: warning: Excess function parameter 'size' description in 'ksmbd_vfs_listxattr'
>> fs/smb/server/vfs.c:921: warning: Function parameter or member 'get_write' not described in 'ksmbd_vfs_setxattr'
   fs/smb/server/vfs.c:949: warning: Function parameter or member 'option' not described in 'ksmbd_vfs_set_fadvise'
   fs/smb/server/vfs.c:949: warning: Excess function parameter 'options' description in 'ksmbd_vfs_set_fadvise'
   fs/smb/server/vfs.c:1163: warning: Function parameter or member 'um' not described in 'ksmbd_vfs_lookup_in_dir'
   fs/smb/server/vfs.c:1199: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_kern_path_locked'


vim +921 fs/smb/server/vfs.c

f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  905  
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  906  /**
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  907   * ksmbd_vfs_setxattr() - vfs helper for smb set extended attributes value
4609e1f18e19c3 fs/ksmbd/vfs.c      Christian Brauner 2023-01-13  908   * @idmap:	idmap of the relevant mount
3354db668808d5 fs/smb/server/vfs.c Namjae Jeon       2023-10-10  909   * @path:	path of dentry to set XATTR at
63f09a9986eb58 fs/ksmbd/vfs.c      Jiapeng Chong     2023-02-08  910   * @attr_name:	xattr name for setxattr
63f09a9986eb58 fs/ksmbd/vfs.c      Jiapeng Chong     2023-02-08  911   * @attr_value:	xattr value to set
63f09a9986eb58 fs/ksmbd/vfs.c      Jiapeng Chong     2023-02-08  912   * @attr_size:	size of xattr value
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  913   * @flags:	destination buffer length
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  914   *
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  915   * Return:	0 on success, otherwise error
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  916   */
4609e1f18e19c3 fs/ksmbd/vfs.c      Christian Brauner 2023-01-13  917  int ksmbd_vfs_setxattr(struct mnt_idmap *idmap,
40b268d384a222 fs/smb/server/vfs.c Namjae Jeon       2023-06-15  918  		       const struct path *path, const char *attr_name,
8445423a0a7af9 fs/smb/server/vfs.c Namjae Jeon       2023-11-15  919  		       void *attr_value, size_t attr_size, int flags,
8445423a0a7af9 fs/smb/server/vfs.c Namjae Jeon       2023-11-15  920  		       bool get_write)
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16 @921  {
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  922  	int err;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  923  
8445423a0a7af9 fs/smb/server/vfs.c Namjae Jeon       2023-11-15  924  	if (get_write == true) {
40b268d384a222 fs/smb/server/vfs.c Namjae Jeon       2023-06-15  925  		err = mnt_want_write(path->mnt);
40b268d384a222 fs/smb/server/vfs.c Namjae Jeon       2023-06-15  926  		if (err)
40b268d384a222 fs/smb/server/vfs.c Namjae Jeon       2023-06-15  927  			return err;
8445423a0a7af9 fs/smb/server/vfs.c Namjae Jeon       2023-11-15  928  	}
40b268d384a222 fs/smb/server/vfs.c Namjae Jeon       2023-06-15  929  
4609e1f18e19c3 fs/ksmbd/vfs.c      Christian Brauner 2023-01-13  930  	err = vfs_setxattr(idmap,
40b268d384a222 fs/smb/server/vfs.c Namjae Jeon       2023-06-15  931  			   path->dentry,
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  932  			   attr_name,
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  933  			   attr_value,
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  934  			   attr_size,
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  935  			   flags);
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  936  	if (err)
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  937  		ksmbd_debug(VFS, "setxattr failed, err %d\n", err);
8445423a0a7af9 fs/smb/server/vfs.c Namjae Jeon       2023-11-15  938  	if (get_write == true)
40b268d384a222 fs/smb/server/vfs.c Namjae Jeon       2023-06-15  939  		mnt_drop_write(path->mnt);
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  940  	return err;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  941  }
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  942  

:::::: The code at line 921 was first introduced by commit
:::::: f44158485826c076335d6860d35872271a83791d cifsd: add file operations

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
