Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D1933689D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 03:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783480595; cv=none; b=BmVWJc4qeEFM5ilIt/nWWrtvl72lnOchL1euK48DkzNmR+IyGFNsBpbde/+t2tgebs9AhA+M8OZTGkFfWIHhPkp5d6S4ncU65tDZnLyfCrR7M6fr4sIqZjQbBZKGrmyP0P448AL+QuMq4N0fCr4smmtCySc8EYgcedGFKd2qnM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783480595; c=relaxed/simple;
	bh=REnFGJght/wSlnKaYf4ngFx4Al8iL9uUm/ds/lj9Jbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mhd8vAMtx6nzuM0U8LDEt022qCe4KdxV9dwCE+OirIwGPq0XUpYGFQgXU/WyG8NvHs3AW7cejgAAeuoVmnP/z/+tEre2EswB1Aw6G9kp/iQTngQysU6wZ4745AXvqt9Xbzj89md+U6urI0EerTjOl8gNZ6g+o2UG9uIad948Pk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLs+SpZ/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLs+SpZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783480592; x=1815016592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=REnFGJght/wSlnKaYf4ngFx4Al8iL9uUm/ds/lj9Jbc=;
  b=SLs+SpZ/NCZJ/wEbq7D7ltImlbbLz6hOWe2KDyGl0TmthzJWoOSs+VWM
   MAb4bdaSNLHpYDgOndKkn0HVejhumhYfdqGCFqvL9Uc9hxfjVHJpx74nb
   pDdtaErXVKf/4Lh6NBGy0INeZdwQUGV2ab7BhHKW1paq/3YYBPqcNZBT+
   AQMD5Rj0T5FEpUDD/cGeDFToWmxdbo45QIRIJfPmDVHNKbY1ek6cQ23qD
   Egi+jqXotHSGwCiC55mhYNM/5m8lTI4Leyyq8GFtnUe1s+9DU85WDqj43
   M7IqZVUfy+i1UQd8sxwZHvBe9qHr51krVutAqSiQAfiZSPjhbuYFu47wX
   g==;
X-CSE-ConnectionGUID: QP7i0NhwS7iXdR0o5JKACw==
X-CSE-MsgGUID: 7iENzctaTquD8On/2no1FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84232709"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84232709"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 20:16:31 -0700
X-CSE-ConnectionGUID: rmnqPEYaTLeAHnu6a3MNvA==
X-CSE-MsgGUID: 02RVjFpETEWIt21U50CC7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="277372451"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jul 2026 20:16:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whIlu-00000000Fz1-1DrL;
	Wed, 08 Jul 2026 03:16:26 +0000
Date: Wed, 08 Jul 2026 11:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Pali =?utf-8?Q?Roh=C3=A1r"?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [samba-ksmbd:pali-patch8 1/1]
 fs/smb/client/reparse.c:430:48: error: passing argument 4 of
 'tcon->ses->server->ops->set_EA' makes pointer from integer without a cast
Message-ID: <202607081136.udiythqY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   git://git.samba.org/ksmbd.git pali-patch8
head:   7ad4ba8846086dd14f26bed6dd56de6d0050dfb4
commit: 7ad4ba8846086dd14f26bed6dd56de6d0050dfb4 [1/1] cifs: Create native Window socket file compatible also with WSL subsystem
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260708/202607081136.udiythqY-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081136.udiythqY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081136.udiythqY-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/client/reparse.c: In function 'create_native_socket':
>> fs/smb/client/reparse.c:430:48: error: passing argument 4 of 'tcon->ses->server->ops->set_EA' makes pointer from integer without a cast [-Wint-conversion]
     430 |                                                true /* open reparse point */,
         |                                                ^~~~
         |                                                |
         |                                                int
   fs/smb/client/reparse.c:430:48: note: expected 'const char *' but argument is of type 'int'
>> fs/smb/client/reparse.c:432:48: error: passing argument 6 of 'tcon->ses->server->ops->set_EA' makes integer from pointer without a cast [-Wint-conversion]
     432 |                                                &xattr_mode_val,
         |                                                ^~~~~~~~~~~~~~~
         |                                                |
         |                                                const __le64 * {aka const long long unsigned int *}
   fs/smb/client/reparse.c:432:48: note: expected '__u16' {aka 'const short unsigned int'} but argument is of type 'const __le64 *' {aka 'const long long unsigned int *'}
   In file included from fs/smb/client/cifsglob.h:30,
                    from fs/smb/client/reparse.c:9:
>> fs/smb/client/smb2pdu.h:323:41: error: passing argument 7 of 'tcon->ses->server->ops->set_EA' makes pointer from integer without a cast [-Wint-conversion]
     323 | #define SMB2_WSL_XATTR_MODE_SIZE        4
         |                                         ^
         |                                         |
         |                                         int
   fs/smb/client/reparse.c:433:48: note: in expansion of macro 'SMB2_WSL_XATTR_MODE_SIZE'
     433 |                                                SMB2_WSL_XATTR_MODE_SIZE,
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/smb2pdu.h:323:41: note: expected 'const struct nls_table *' but argument is of type 'int'
   fs/smb/client/reparse.c:433:48: note: in expansion of macro 'SMB2_WSL_XATTR_MODE_SIZE'
     433 |                                                SMB2_WSL_XATTR_MODE_SIZE,
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/reparse.c:434:55: error: passing argument 8 of 'tcon->ses->server->ops->set_EA' from incompatible pointer type [-Wincompatible-pointer-types]
     434 |                                                cifs_sb->local_nls, cifs_sb);
         |                                                ~~~~~~~^~~~~~~~~~~
         |                                                       |
         |                                                       struct nls_table *
   fs/smb/client/reparse.c:434:55: note: expected 'struct cifs_sb_info *' but argument is of type 'struct nls_table *'
>> fs/smb/client/reparse.c:429:17: error: too many arguments to function 'tcon->ses->server->ops->set_EA'; expected 8, have 9
     429 |                 tcon->ses->server->ops->set_EA(xid, tcon, full_path,
         |                 ^~~~
   ......
     434 |                                                cifs_sb->local_nls, cifs_sb);
         |                                                                    ~~~~~~~
   fs/smb/client/cifsglob.h:571:15: note: declared here
     571 |         int (*set_EA)(const unsigned int, struct cifs_tcon *, const char *,
         |               ^~~~~~


vim +430 fs/smb/client/reparse.c

   384	
   385	static int create_native_socket(const unsigned int xid, struct inode *inode,
   386					struct dentry *dentry, struct cifs_tcon *tcon,
   387					const char *full_path, umode_t mode)
   388	{
   389		struct reparse_data_buffer buf = {
   390			.ReparseTag = cpu_to_le32(IO_REPARSE_TAG_AF_UNIX),
   391			.ReparseDataLength = cpu_to_le16(0),
   392		};
   393		struct cifs_open_info_data data = {
   394			.reparse_point = true,
   395			.reparse = { .tag = IO_REPARSE_TAG_AF_UNIX, .buf = &buf, },
   396		};
   397		struct kvec iov = {
   398			.iov_base = &buf,
   399			.iov_len = sizeof(buf),
   400		};
   401	#ifdef CONFIG_CIFS_XATTR
   402		const __le64 xattr_mode_val = cpu_to_le64(mode);
   403		struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
   404	#endif
   405		struct inode *new;
   406		int rc = 0;
   407	
   408		new = tcon->ses->server->ops->create_reparse_inode(
   409					     &data, inode->i_sb, xid,
   410					     tcon, full_path, false, &iov, NULL);
   411		if (!IS_ERR(new))
   412			d_instantiate(dentry, new);
   413		else
   414			rc = PTR_ERR(new);
   415	
   416		/*
   417		 * Try to set also optional WSL EA $LXMOD but ignore errors.
   418		 * WSL socket and native Win32/NT sockets uses same reparse point
   419		 * tag IO_REPARSE_TAG_AF_UNIX. WSL subsystem additionally requires
   420		 * EA $LXMOD to be set with the S_IFSOCK value. So setting this EA
   421		 * allows native socket to be recognized also by WSL subsystem.
   422		 * Note that setting of both EAs and reparse points is not supported
   423		 * by NTFS filesystem on Windows 8 / Windows Server 2012 and always
   424		 * fails. So ignore failures from this set_EA call.
   425		 */
   426	#ifdef CONFIG_CIFS_XATTR
   427		if (!rc && tcon->ses->server->ops->set_EA &&
   428		    (le32_to_cpu(tcon->fsAttrInfo.Attributes) & FILE_SUPPORTS_EXTENDED_ATTRIBUTES))
 > 429			tcon->ses->server->ops->set_EA(xid, tcon, full_path,
 > 430						       true /* open reparse point */,
   431						       SMB2_WSL_XATTR_MODE,
 > 432						       &xattr_mode_val,
   433						       SMB2_WSL_XATTR_MODE_SIZE,
   434						       cifs_sb->local_nls, cifs_sb);
   435	#endif
   436	
   437		cifs_free_open_info(&data);
   438		return rc;
   439	}
   440	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
