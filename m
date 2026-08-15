Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930D2301486
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 20:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786827451; cv=none; b=N8ZJTHpUdRHfe2AZ7hfp9VM/Gbjw1cs7N2iXKQFQimjCjMWM5T3o6LSj5rOzzbgDh/wW4U7+7E9tQGy2bCqrZfKc1X2quZjdHUf6YkMLOc7mVzNs9pOM3l4TMTG6PV+rdl9nUjWD4+LZhDcf+8uN64Er6If4hyhIDWH9ct2VkFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786827451; c=relaxed/simple;
	bh=GYoizn+npjX4s/e5J3h/DarEotlVsO/l7y5r59f2jrc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r8f+bVPSpEF3Y2qC0fvFUYeTwG+iMWHBe7ZMlkeLNigSWDKXKcTfJFW//D7hg3BZ3ueKJIwMiCdvHvPjYJDl6jpEBPwipuVpY/xl5xr2cEK3c+ZtbRi9k2iX7XyQSuugdJ7/yHqsaHPTE5lx47Yw3gt0bDsnVOy7NWzWe2OaTY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0J0wmt6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0J0wmt6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786827448; x=1818363448;
  h=date:from:to:cc:subject:message-id;
  bh=GYoizn+npjX4s/e5J3h/DarEotlVsO/l7y5r59f2jrc=;
  b=d0J0wmt61JtRh/HzQ0vwc+RSeMjOvtuYRknTPJtMKUTmZQ2zDbOgqdhJ
   jUatv+WcdZ7SPwRY3ZacROUq3+HyxsxJ+1Vx8SVvEVXHTPQndnF0iqkFb
   03C2PJReDWDQYz4//rJEusoGOfeC/ilgyxoOI4lGTCpAMdVg5xit/dmeC
   5g7VjHY/q051ZvTwMMQO20qMIxyPuvPBHlFg010Ry6pJ4G4EvGk3E7IFl
   TWH6jILjayoWFIJw2Kvyw/ffh2kGTY58Kp93Q3A2TWm0bIx/ovSJLxFhx
   2aEOTI4V2H9f1kA/2SrjKK+FYKsw4cuQLAESP2lPw1OPevEPSiK7UKbJ2
   Q==;
X-CSE-ConnectionGUID: /bnXugT3ScuwKTCWCD+j3g==
X-CSE-MsgGUID: 99caH5B1RF61XHZOvoiTYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="98877934"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="98877934"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 13:57:28 -0700
X-CSE-ConnectionGUID: qfFIyavvSfS8D1gbZ+JiEQ==
X-CSE-MsgGUID: T25c3oEYQZCuhSFzFpvB2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="268385754"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Aug 2026 13:57:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvLRU-00000000cU8-0xUs;
	Sat, 15 Aug 2026 20:57:24 +0000
Date: Sun, 16 Aug 2026 04:56:39 +0800
From: kernel test robot <lkp@intel.com>
To: Huiwen He <hehuiwen@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Steve French <stfrench@microsoft.com>,
 ChenXiaoSong <chenxiaosong@kylinos.cn>
Subject: fs/smb/client/ioctl.c:135:2-7: WARNING: NULL check before
 some freeing functions is not needed.
Message-ID: <202608160402.0ffQDoCg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3eb40771c00a8488fa6ed2cc1fe203477908bf38
commit: 5693347de107a26f68d1f43b25ff2e348c7229a9 smb/client: use writable handle for FS_IOC_SETFLAGS compression
date:   9 weeks ago
config: powerpc-randconfig-r053-20260812 (https://download.01.org/0day-ci/archive/20260816/202608160402.0ffQDoCg-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5693347de107 ("smb/client: use writable handle for FS_IOC_SETFLAGS compression")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160402.0ffQDoCg-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/client/ioctl.c:135:2-7: WARNING: NULL check before some freeing functions is not needed.

vim +135 fs/smb/client/ioctl.c

    69	
    70	static int cifs_set_compression_by_path(unsigned int xid, struct file *filep,
    71						struct cifs_tcon *tcon)
    72	{
    73		struct inode *inode = file_inode(filep);
    74		struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
    75		struct TCP_Server_Info *server = tcon->ses->server;
    76		struct cifs_open_parms oparms;
    77		struct cifs_open_info_data data = {};
    78		struct cifsFileInfo *tmp_cfile = NULL;
    79		struct cifs_fid fid = {};
    80		const char *full_path;
    81		__u32 oplock = 0;
    82		u64 uniqueid;
    83		void *page;
    84		int rc;
    85	
    86		if (!server->ops->open || !server->ops->close ||
    87		    !server->ops->query_file_info)
    88			return -EOPNOTSUPP;
    89	
    90		if (!(cifs_sb_flags(cifs_sb) & CIFS_MOUNT_SERVER_INUM) ||
    91		    cifs_sb->mnt_cifs_serverino_autodisabled)
    92			return -EOPNOTSUPP;
    93	
    94		if (d_unhashed(filep->f_path.dentry))
    95			return -ESTALE;
    96	
    97		page = alloc_dentry_path();
    98		full_path = build_path_from_dentry(filep->f_path.dentry, page);
    99		if (IS_ERR(full_path)) {
   100			free_dentry_path(page);
   101			return PTR_ERR(full_path);
   102		}
   103	
   104		oparms = CIFS_OPARMS(cifs_sb, tcon, full_path, FILE_WRITE_DATA |
   105				     FILE_READ_ATTRIBUTES,
   106				     FILE_OPEN, 0, ACL_NO_MODE);
   107		oparms.fid = &fid;
   108	
   109		rc = server->ops->open(xid, &oparms, &oplock, NULL);
   110		if (rc)
   111			goto out;
   112	
   113		tmp_cfile = kzalloc_obj(*tmp_cfile);
   114		if (!tmp_cfile) {
   115			rc = -ENOMEM;
   116			goto close;
   117		}
   118	
   119		tmp_cfile->fid = fid;
   120		rc = server->ops->query_file_info(xid, tcon, tmp_cfile, &data);
   121		if (rc)
   122			goto close;
   123	
   124		uniqueid = le64_to_cpu(data.fi.IndexNumber);
   125		if (uniqueid != CIFS_I(inode)->uniqueid) {
   126			rc = -ESTALE;
   127			goto close;
   128		}
   129	
   130		rc = server->ops->set_compression(xid, tcon, tmp_cfile);
   131	
   132	close:
   133		server->ops->close(xid, tcon, &fid);
   134		if (tmp_cfile)
 > 135			kfree(tmp_cfile);
   136		cifs_free_open_info(&data);
   137	out:
   138		free_dentry_path(page);
   139		return rc;
   140	}
   141	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
