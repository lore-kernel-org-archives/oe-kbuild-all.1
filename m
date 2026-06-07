Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7FA280338
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jun 2026 06:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780813639; cv=none; b=U4iUdosq+Q9c7yztw0nf0+kD2zoR7vTtzpBF5qRDQW4OfIAgZvYqoBkwIJXzCgp2fhaqcrtTYah7+pTKDDtqn2btnU/Vb5wQqDZZekZWhv+XlDCiatnsaiX0vHVrv21KlSrKeXpw5rZlIcp/ONxQOsV0Dr9Y65SIRZufMkSAdDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780813639; c=relaxed/simple;
	bh=Ykx+i3SRGy+FCXahNfkUIbGOQEhBpCEdeLhJQAYD5Lk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mj3jOI841uXtGGzT2LLtDKMBTX47gESSWO1QpdKjE8SbjhHkzeC4+wQCvvK1in4c944DMxkNu4F5fYdqUNHRyPmLFmyTLKhkoh0C/dLWrtgN1XBut6NbJtTtauqGSRVD5ImE/r3pkMJTziOh1+054WDmOL/q+KrNvdxEzFRyZw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXRFR9+2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXRFR9+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780813638; x=1812349638;
  h=date:from:to:cc:subject:message-id;
  bh=Ykx+i3SRGy+FCXahNfkUIbGOQEhBpCEdeLhJQAYD5Lk=;
  b=BXRFR9+2YbS1CJu+34uisNeG11Ql77YMQQoPpD/F7Kl56eTiolhPE2xL
   iqdGAy4SGy3N8wozgngVmjqscRd/J4lmg1ZAMkKVMWnJ/CqDywS5mNo9R
   FTO8mun2vVQHqd3na5rmp+FLK9hNCmjlpxyRo35xDY9Swl5zZ8Vkk/9QZ
   apskoe357WwYmCV/Hgpgea7o9o3PGxUQ8erIPhh3K/aliZ/Ns535nV9Vx
   3b9UVVj17xZJfSM7VN5Nxvt0MA0Y18K14JTzhHQsCjtr9arraVtPC+CzE
   INWOBcJs+3MvtDOTXLI/myA3DhZU8LVorkcM2/hgRrnVyppdeP2lGtQjU
   g==;
X-CSE-ConnectionGUID: tOxRqB/6Q8m/yu6J37GdWg==
X-CSE-MsgGUID: R3ikSHp9QsuKBHmnNY0ETA==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="92692056"
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="92692056"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 23:27:17 -0700
X-CSE-ConnectionGUID: +KUM8zNNTMeKuggxfJyiaQ==
X-CSE-MsgGUID: 1/0rZeNhQJiwzY9FPFQUfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="275424631"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Jun 2026 23:27:16 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wW6yX-00000000HfW-2NAt;
	Sun, 07 Jun 2026 06:27:13 +0000
Date: Sun, 07 Jun 2026 14:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:for-next 12/13] fs/smb/client/ioctl.c:143:1:
 warning: the frame size of 1560 bytes is larger than 1280 bytes
Message-ID: <202606071413.o2OyTFlU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git for-next
head:   ad43a9b9e06e2d141147287aebf6aedb39ccfdca
commit: 0b7e58257e3470c587c6cdabade6ca2e85644bc7 [12/13] smb/client: use writable handle for FS_IOC_SETFLAGS compression
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260607/202606071413.o2OyTFlU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260607/202606071413.o2OyTFlU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606071413.o2OyTFlU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/client/ioctl.c: In function 'cifs_set_compression_by_path':
>> fs/smb/client/ioctl.c:143:1: warning: the frame size of 1560 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     143 | }
         | ^


vim +143 fs/smb/client/ioctl.c

    81	
    82	static int cifs_set_compression_by_path(unsigned int xid, struct file *filep,
    83						struct cifs_tcon *tcon)
    84	{
    85		struct inode *inode = file_inode(filep);
    86		struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
    87		struct TCP_Server_Info *server = tcon->ses->server;
    88		struct cifs_open_parms oparms;
    89		struct cifs_open_info_data data = {};
    90		struct cifsFileInfo tmp_cfile = {};
    91		struct cifs_fid fid = {};
    92		const char *full_path;
    93		__u32 oplock = 0;
    94		u64 uniqueid;
    95		void *page;
    96		int rc;
    97	
    98		if (!server->ops->open || !server->ops->close ||
    99		    !server->ops->query_file_info)
   100			return -EOPNOTSUPP;
   101	
   102		if (!(cifs_sb_flags(cifs_sb) & CIFS_MOUNT_SERVER_INUM) ||
   103		    cifs_sb->mnt_cifs_serverino_autodisabled)
   104			return -EOPNOTSUPP;
   105	
   106		if (d_unhashed(filep->f_path.dentry))
   107			return -ESTALE;
   108	
   109		page = alloc_dentry_path();
   110		full_path = build_path_from_dentry(filep->f_path.dentry, page);
   111		if (IS_ERR(full_path)) {
   112			free_dentry_path(page);
   113			return PTR_ERR(full_path);
   114		}
   115	
   116		oparms = CIFS_OPARMS(cifs_sb, tcon, full_path, FILE_WRITE_DATA,
   117				     FILE_OPEN, 0, ACL_NO_MODE);
   118		oparms.fid = &fid;
   119	
   120		rc = server->ops->open(xid, &oparms, &oplock, NULL);
   121		if (rc)
   122			goto out;
   123	
   124		tmp_cfile.fid = fid;
   125		rc = server->ops->query_file_info(xid, tcon, &tmp_cfile, &data);
   126		if (rc)
   127			goto close;
   128	
   129		uniqueid = le64_to_cpu(data.fi.IndexNumber);
   130		if (uniqueid != CIFS_I(inode)->uniqueid) {
   131			rc = -ESTALE;
   132			goto close;
   133		}
   134	
   135		rc = cifs_set_compression_handle(xid, tcon, &tmp_cfile);
   136	
   137	close:
   138		server->ops->close(xid, tcon, &fid);
   139		cifs_free_open_info(&data);
   140	out:
   141		free_dentry_path(page);
   142		return rc;
 > 143	}
   144	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
