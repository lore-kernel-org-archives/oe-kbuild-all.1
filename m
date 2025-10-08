Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DE71F95C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Oct 2025 17:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945725; cv=none; b=GQe8T3isYNtbhwDCQezUAl1rggUcO0DL/vktWy79OC7g9XLNpFRnwd9aMvfnySUl+phq+/Ii0CJzMgBZHZvmpmn6gfYxFwK9453ypSP5Aszn32gVB7OSs4jErcLm7vtM0RhgjYkAvGd87xV/eaSVv0sh6I8B/jgn49HKeOFH+24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945725; c=relaxed/simple;
	bh=WDAiRzHmojqzOcC3MsRDsmV2v1aT9CtVDnuftkHvvbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kxpkJIL4wqgg5yfikTConU5S5qTWX+5UIMfduVUg9PHBZJDsGkvJLEfkS3LfSIyk++w98Sw2PExaHA87eGIXGarXLgM1raOk2oqksGSXlffCRzumJ7+IGnqPe3I4+ltfynP3LGC2ix3DBu2jJJyMk4xSwYJjd2wtYZXlX5gxQxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PO2/gYHl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PO2/gYHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759945725; x=1791481725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WDAiRzHmojqzOcC3MsRDsmV2v1aT9CtVDnuftkHvvbg=;
  b=PO2/gYHl1A/hmGcDDtm6uP4KUuJ6doTB10rrFuLUHrdPFPEee44Wa/R6
   NwzrrqnfvkBG3R/+hSO8R5qZgmB+oaVS+4V0PjwjxJ+zECqFtgn8Zc8XT
   2C7YKBOzCRNdJgGctlut974pUQ9XfFWQpJpCUUcwkM11oEC4Zgs0N9LC4
   JN+e/IpHMfMuvGcepO7j1I5gxpB4aedoxM+Zli3F5dfIBJ4/fbOECDDTv
   SXD7QVGM2t4kxBCHLVTjsLoi/WkL/1sTuwMGnLyQd7WdxfjYbMXPPOXCT
   lj/A/d7ReWWMIkfpg/OtF5caUjtAmJaPje/ycIs5nYXE5RXOG2n97kuE6
   w==;
X-CSE-ConnectionGUID: BDOMyxcQSt+hkDE9bv8EEw==
X-CSE-MsgGUID: pRkUV4Q0S6CD8glI+g2LAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="84766849"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; 
   d="scan'208";a="84766849"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 10:48:44 -0700
X-CSE-ConnectionGUID: jD+zO6DnRmKVQ8EHVm7P8w==
X-CSE-MsgGUID: vfeHJhXETueaxnfnBXF5dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; 
   d="scan'208";a="180096384"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 08 Oct 2025 10:48:42 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v6YHI-0000000083N-0QCi;
	Wed, 08 Oct 2025 17:48:40 +0000
Date: Wed, 8 Oct 2025 19:48:09 +0200
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:pr/91 4/4] fs/smb/client/smb2inode.c:1397:26:
 warning: variable 'tcon' is uninitialized when used here
Message-ID: <202510081951.yrBMvAbp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/smfrench/smb3-kernel.git pr/91
head:   b9459df0524e1ee0415a262275465fe0422010f0
commit: b9459df0524e1ee0415a262275465fe0422010f0 [4/4] smb: client: fix missing timestamp updates after utime(2)
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251008/202510081951.yrBMvAbp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251008/202510081951.yrBMvAbp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510081951.yrBMvAbp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/smb2inode.c:1397:26: warning: variable 'tcon' is uninitialized when used here [-Wuninitialized]
    1397 |                 cifs_get_writable_path(tcon, full_path, FIND_WR_ANY, &cfile);
         |                                        ^~~~
   fs/smb/client/smb2inode.c:1390:24: note: initialize the variable 'tcon' to silence this warning
    1390 |         struct cifs_tcon *tcon;
         |                               ^
         |                                = NULL
   1 warning generated.


vim +/tcon +1397 fs/smb/client/smb2inode.c

  1380	
  1381	int
  1382	smb2_set_file_info(struct inode *inode, const char *full_path,
  1383			   FILE_BASIC_INFO *buf, const unsigned int xid)
  1384	{
  1385		struct kvec in_iov = { .iov_base = buf, .iov_len = sizeof(*buf), };
  1386		struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
  1387		struct cifsFileInfo *cfile = NULL;
  1388		struct cifs_open_parms oparms;
  1389		struct tcon_link *tlink;
  1390		struct cifs_tcon *tcon;
  1391		int rc;
  1392	
  1393		if ((buf->CreationTime == 0) && (buf->LastAccessTime == 0) &&
  1394		    (buf->LastWriteTime == 0) && (buf->ChangeTime == 0)) {
  1395			if (buf->Attributes == 0)
  1396				return 0; /* would be a no op, no sense sending this */
> 1397			cifs_get_writable_path(tcon, full_path, FIND_WR_ANY, &cfile);
  1398		}
  1399	
  1400		tlink = cifs_sb_tlink(cifs_sb);
  1401		if (IS_ERR(tlink))
  1402			return PTR_ERR(tlink);
  1403		tcon = tlink_tcon(tlink);
  1404	
  1405		oparms = CIFS_OPARMS(cifs_sb, tcon, full_path, FILE_WRITE_ATTRIBUTES,
  1406				     FILE_OPEN, 0, ACL_NO_MODE);
  1407		rc = smb2_compound_op(xid, tcon, cifs_sb,
  1408				      full_path, &oparms, &in_iov,
  1409				      &(int){SMB2_OP_SET_INFO}, 1,
  1410				      cfile, NULL, NULL, NULL);
  1411		cifs_put_tlink(tlink);
  1412		return rc;
  1413	}
  1414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
