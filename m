Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05E51DDC33
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jul 2026 04:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783397310; cv=none; b=bcyHirS8peTAkf4FOqpmoHwe3QT80tTqsdQ0qLBVCJnFpZzT7HO6MSs0AoMnlDMxR5r1jzgYQX83ehr5p8oMiHQuZ3z2JcH59+Gm3P9yuNjZgQmhm8CUfcam+6UhCp1MOsfAKg2ZP+UuDyy1DMBx/ZQIt6GbHRwOtjtdrswHSvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783397310; c=relaxed/simple;
	bh=BkgKExhA+8f3svUKc+OZEZdzbRlII/nigVy1hSFY+AY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mtppw8ElUxxFBWYmWY8L72P5b95otHQyOy72EtCcHuyJ2jztOaiP8BtxHWSzw7znl6rnD11OXeQl9ImbzM2Fw4jb+j+4NIVqkuS/y+NCE3Vt3YM8dhusOKjTgmo5toydBeoq7kkqxbFzDCj7ndillcP7OrAx81ZJWFdF8VMMGwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYh8p4gE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYh8p4gE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783397309; x=1814933309;
  h=date:from:to:cc:subject:message-id;
  bh=BkgKExhA+8f3svUKc+OZEZdzbRlII/nigVy1hSFY+AY=;
  b=XYh8p4gEXrQANMv0y7knkvaDAWghVm23OBwbLTulUMKlYcViRd4C12Q7
   Gx3P52JpUCzKs1ENhujGunw7l3Kg/NKRsD7vQQd3hCZPZadnfK7inHBWF
   5I1kj/kgEXWzbtfsdN2Hw13PoNjN7uj73pox0i1BL+eUYTQdAqJERXHY2
   cA0+HXVpynw5meJyiFocZq6W8EpU7dhi6hzXuVRhP5DpjpUZMviX8zeT5
   leLszjl6lLz5oMnXgnpFScyMuXNSFZr3YMhoG61yZD5sUJb+NWyobyLRq
   nEPmhTQQaMCt6goX8LeAx2ZFJaULUWXLgcItNkkhKYlRLvy7NJlL2YPeU
   w==;
X-CSE-ConnectionGUID: FADJQrbWTHWtxM2DU/h5eA==
X-CSE-MsgGUID: lhx3E/BOQ1+XAObnzJBfEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="87718217"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="87718217"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 21:08:29 -0700
X-CSE-ConnectionGUID: edb5gea0TlK3N3NhSUJmVg==
X-CSE-MsgGUID: 2a4pJqrMSnW5+gROqF5Fkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="253976033"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 06 Jul 2026 21:08:27 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgx6d-000000002SH-15Z0;
	Tue, 07 Jul 2026 04:08:23 +0000
Date: Tue, 07 Jul 2026 06:07:37 +0200
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:pr/255 1/1] fs/smb/client/reparse.c:434:33:
 error: too many arguments to function call, expected 8, have 9
Message-ID: <202607070617.CHVxp8by-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git pr/255
head:   7ad4ba8846086dd14f26bed6dd56de6d0050dfb4
commit: 7ad4ba8846086dd14f26bed6dd56de6d0050dfb4 [1/1] cifs: Create native Window socket file compatible also with WSL subsystem
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260707/202607070617.CHVxp8by-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607070617.CHVxp8by-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607070617.CHVxp8by-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/client/reparse.c:434:33: error: too many arguments to function call, expected 8, have 9
     429 |                 tcon->ses->server->ops->set_EA(xid, tcon, full_path,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     430 |                                                true /* open reparse point */,
     431 |                                                SMB2_WSL_XATTR_MODE,
     432 |                                                &xattr_mode_val,
     433 |                                                SMB2_WSL_XATTR_MODE_SIZE,
     434 |                                                cifs_sb->local_nls, cifs_sb);
         |                                                                    ^~~~~~~
   1 error generated.


vim +434 fs/smb/client/reparse.c

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
   429			tcon->ses->server->ops->set_EA(xid, tcon, full_path,
   430						       true /* open reparse point */,
   431						       SMB2_WSL_XATTR_MODE,
   432						       &xattr_mode_val,
   433						       SMB2_WSL_XATTR_MODE_SIZE,
 > 434						       cifs_sb->local_nls, cifs_sb);
   435	#endif
   436	
   437		cifs_free_open_info(&data);
   438		return rc;
   439	}
   440	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
