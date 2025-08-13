Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1B02F4A06
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755081547; cv=none; b=pu7HUekoagCtfpxgUB2FphX3uI4lxV5/P3edzPNXJjxRYA/HHtxIVYAC1XrQoYo5NcceVfvzjYBZ69ooLuhXqow4ShAFvMhptyCHKVfbCaeWA4F4dexYYae92J1gsC3t0kpA5+2XJ77vLQz5Ms6gbZ/rA7sCeZ/h4QfV22CuGOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755081547; c=relaxed/simple;
	bh=mJUvygBYNkfECl5DVxHgQ9AQ7K1SaDqDeE5QeO0UqsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h1foIC0NToNNTqo3ZkL3+XCvhwrxFSTjHu8wlX/DPfy8V0js4kudefSFX2jp3hrEmxnPx0VE/K9jXvLct+UwWOViPM/tEJ2l3mFwHUORv9HHFMSbU4UaSIL9zYwQMjP6dUgePfZAukAQbqF6bl3ZzE6UW8lliWQgSKt3NrszHXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IycHsv1M; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IycHsv1M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755081546; x=1786617546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mJUvygBYNkfECl5DVxHgQ9AQ7K1SaDqDeE5QeO0UqsM=;
  b=IycHsv1ME5v7qPwkLrQ7qcuUm2odr50KyU4zPhEQF2WqQqLX0CmbEEHU
   0lzjjP1Mk015aLrY1Na5F4m/U0tYp+Z0XwujZcdv1ndZQw+UDfQCUdd22
   xzGZaKA8vfxxafcf+TEC8pW0MOG2lRXue02zMwP3Q7FzQYsFk9q7xpGju
   T6hWecmmeR5Vk5MStPO/kUWhJsTgVZyminxfq3gh+pMA1/KhTAV3cu1Zc
   3Fg9tR5hoUVSnRkohxP1SfKWOTXw9np9LkPm7zBBL5DvVeFuHCLNCClVL
   c5tTaS9jGFzI6cGjrb++fE8WWAQ3ZVGXcXqeP77f3e3cY4XRFrTvU4OCp
   Q==;
X-CSE-ConnectionGUID: fn1Cq5jgTYivFChuoMdp8w==
X-CSE-MsgGUID: ASrK827dT+enwFSiMK9lzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56580147"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="56580147"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 03:39:05 -0700
X-CSE-ConnectionGUID: ROlTToPzTz+u3aV+CSlYBw==
X-CSE-MsgGUID: snFWUJ15QomJYAOQqn24xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="190145465"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 13 Aug 2025 03:39:04 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um8so-00002l-0F;
	Wed, 13 Aug 2025 10:39:02 +0000
Date: Wed, 13 Aug 2025 12:38:23 +0200
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 18/21] fs/smb/client/reparse.c:399:30: warning: unused
 variable 'cifs_sb'
Message-ID: <202507232241.nmhX4WWd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pali/linux.git cifs
head:   26ef98c6708ac92c515a4592138345359222b847
commit: 6b988dfe26bcb2e050b20f8903ef09be4fdf467b [18/21] cifs: Create native Window socket file compatible also with WSL subsystem
config: riscv-randconfig-2001-20250723 (https://download.01.org/0day-ci/archive/20250723/202507232241.nmhX4WWd-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507232241.nmhX4WWd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507232241.nmhX4WWd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/client/reparse.c: In function 'create_native_socket':
>> fs/smb/client/reparse.c:399:30: warning: unused variable 'cifs_sb' [-Wunused-variable]
     399 |         struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
         |                              ^~~~~~~
>> fs/smb/client/reparse.c:398:22: warning: unused variable 'xattr_mode_val' [-Wunused-variable]
     398 |         const __le64 xattr_mode_val = cpu_to_le64(mode);
         |                      ^~~~~~~~~~~~~~


vim +/cifs_sb +399 fs/smb/client/reparse.c

   381	
   382	static int create_native_socket(const unsigned int xid, struct inode *inode,
   383					struct dentry *dentry, struct cifs_tcon *tcon,
   384					const char *full_path, umode_t mode)
   385	{
   386		struct reparse_data_buffer buf = {
   387			.ReparseTag = cpu_to_le32(IO_REPARSE_TAG_AF_UNIX),
   388			.ReparseDataLength = cpu_to_le16(0),
   389		};
   390		struct cifs_open_info_data data = {
   391			.reparse_point = true,
   392			.reparse = { .tag = IO_REPARSE_TAG_AF_UNIX, .buf = &buf, },
   393		};
   394		struct kvec iov = {
   395			.iov_base = &buf,
   396			.iov_len = sizeof(buf),
   397		};
 > 398		const __le64 xattr_mode_val = cpu_to_le64(mode);
 > 399		struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
   400		struct inode *new;
   401		int rc = 0;
   402	
   403		new = tcon->ses->server->ops->create_reparse_inode(
   404					     &data, inode->i_sb, xid,
   405					     tcon, full_path, false, &iov, NULL);
   406		if (!IS_ERR(new))
   407			d_instantiate(dentry, new);
   408		else
   409			rc = PTR_ERR(new);
   410	
   411		/*
   412		 * Try to set also optional WSL EA $LXMOD but ignore errors.
   413		 * WSL socket and native Win32/NT sockets uses same reparse point
   414		 * tag IO_REPARSE_TAG_AF_UNIX. WSL subsystem additionally requires
   415		 * EA $LXMOD to be set with the S_IFSOCK value. So setting this EA
   416		 * allows native socket to be recognized also by WSL subsystem.
   417		 * Note that setting of both EAs and reparse points is not supported
   418		 * by NTFS filesystem on Windows 8 / Windows Server 2012 and always
   419		 * fails. So ignore failures from this set_EA call.
   420		 */
   421	#ifdef CONFIG_CIFS_XATTR
   422		if (!rc && tcon->ses->server->ops->set_EA &&
   423		    (le32_to_cpu(tcon->fsAttrInfo.Attributes) & FILE_SUPPORTS_EXTENDED_ATTRIBUTES))
   424			tcon->ses->server->ops->set_EA(xid, tcon, full_path,
   425						       true /* open reparse point */,
   426						       SMB2_WSL_XATTR_MODE,
   427						       &xattr_mode_val,
   428						       SMB2_WSL_XATTR_MODE_SIZE,
   429						       cifs_sb->local_nls, cifs_sb);
   430	#endif
   431	
   432		cifs_free_open_info(&data);
   433		return rc;
   434	}
   435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
