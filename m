Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3012FC01B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jun 2026 20:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780779583; cv=none; b=RFMwfqgCnE7q128JAG23O4IQyjjQwq1YC+52jXBZDvNMb5gL0EYe+aJA6qVhtd8/ddye5/RDARuy32C3HhiwQjG1tiClC9ApmRoWzZIgu2bVRb+QjG8D2Z+KoAVwkDOgznLxC3k415HVyKX9xeHnQnIri8vNc0kRtx7uc2RCwBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780779583; c=relaxed/simple;
	bh=GpimwXV8bqKKT+qwwoj86WYulUWjtTdcCPFaH20HJAc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RgHLIi+Pmg9inmlhofBvrn25He7GFtHH47YmjaxnHj92IiOGoiJmyXtBBnmf5CIGoCz4ZXiLEY/s7i0ON50vTCERTLZm1Jp+jQZKkMze2xd/wjK1sqJEKewjwdjQI1OHVxShuIGogXV+ucjhoaax8cCRYrg96aB2A1uOcsmAOrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqRiEYgM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqRiEYgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780779581; x=1812315581;
  h=date:from:to:cc:subject:message-id;
  bh=GpimwXV8bqKKT+qwwoj86WYulUWjtTdcCPFaH20HJAc=;
  b=CqRiEYgMDxRXTEweQeYStwEeaPMTV1vSkAWbtKD9eq1N5HnKGSCBH197
   3Gwu3KpscGyKzT5bSTO+xTfz4afeeXoEitM3OPWv3AOLo+mROsdNrRdim
   DTqN2kV148L8vPAmuQdyOBDWSEGq9ez03I5XRTQDKhAniQNqelMGrfFdH
   4hbTXgLNZ7w0L0p7oFhOAfo9LHXkVbSxe/2ZXGebqc0KyY8UspVjjqXPg
   zdF/zo+aYmZ9NvwqgMzciJxONpcZN1zfyfKTeyZ++0tmreIBJb2x7Hsf+
   NfAJS6JaV4kNPzEaqe+zI8oFqF80r28vvZZDi4UAEbCU/hc8zXST6XM1J
   Q==;
X-CSE-ConnectionGUID: 2TKpy1sGRhKTidLQxFhk+w==
X-CSE-MsgGUID: AgjL361BTeO3TaLnU4ByDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="92254206"
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="92254206"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 13:59:40 -0700
X-CSE-ConnectionGUID: 5pbeFibCQ+uj4VSqi8BMLA==
X-CSE-MsgGUID: 3g5Vp31RSeey7rq/qfcA5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="238792956"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jun 2026 13:59:39 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVy7E-000000002sz-31Fv;
	Sat, 06 Jun 2026 20:59:36 +0000
Date: Sat, 06 Jun 2026 22:59:07 +0200
From: kernel test robot <lkp@intel.com>
To: Huiwen He <hehuiwen@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 ChenXiaoSong <chenxiaosong@kylinos.cn>
Subject: fs/smb/client/ioctl.c:143:1: warning: the frame size of 1408
 bytes is larger than 1280 bytes
Message-ID: <202606062208.YpkscAEE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Huiwen-He/smb-client-always-return-a-value-for-FS_IOC_GETFLAGS/20260606-224725
head:   dc7484df7a039c599359ce9f7fc6e04c17fd335e
commit: 65d3d221c837a2b9eba1fdcd8301e28bdaffb4a9 smb/client: use writable handle for FS_IOC_SETFLAGS compression
date:   6 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260606/202606062208.YpkscAEE-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606062208.YpkscAEE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606062208.YpkscAEE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/client/ioctl.c: In function 'cifs_set_compression_by_path':
>> fs/smb/client/ioctl.c:143:1: warning: the frame size of 1408 bytes is larger than 1280 bytes [-Wframe-larger-than=]
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
