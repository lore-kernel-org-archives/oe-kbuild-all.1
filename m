Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD022853F9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760091563; cv=none; b=b59tLQKdS4m9Ey1SHzWwJNEDWfhSJbiRBEcGVqnx9YgoNRqiFvuMmE25DD5ORNBkF+WWLsipmJtVCFIfeqZhd1ckR1bpHrWF2ZId2XbEZvbvusHHbVOEMPTwY2yPF3nHRTcVjuwxSyZoshzRAJh3C62HNWfCK8TRa1+PE63VCoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760091563; c=relaxed/simple;
	bh=MfEqwzFcW5DmEu6d1CPq9n+tGve4jyPK60iOCBqHgI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mLqmCgGWGQ4HZl2SGyCpLNfrsMZClFu0jqyyPbwU++uU8cnV7w79WLUqJpPHwFcC4f5CYWjWL4OgZ8s2jxs9xo2XdU0a+WdcDhLB3jWQPA4dbEjvnqgzU+AyFeCwi41qhoYC36zunAVyZqAPgcrNv2EEIu2BZblD5FvJDmu3/qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOzp6skP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOzp6skP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760091561; x=1791627561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MfEqwzFcW5DmEu6d1CPq9n+tGve4jyPK60iOCBqHgI8=;
  b=SOzp6skP4OxbHOWAYbDehHeG091YeF0vjHBR7dNzbwbKpuAXywtKxytZ
   hMdhTnB9lgfF4GKa9NSYGS5Qn+DqXCOwSRj6zqq5EQUte8hWz/AImUvzF
   uYY6nfYDdf4m8Gct1ki4KMXxSpyiwXA820n+UlBmtzDDxjO59dRWWsdpc
   BZucrCuDA1zRM6RKtJsPIxtLSn9SCt5qS7UcTLMNA/ddkdO/kr/pj8Sjq
   AzbWE2ceMQ9KmS1VmLDtogvVuaxijAw6HFr22rbmu5iqsiJmtL09GhQAa
   0D6Q8o2Vt89vok6lYPEpDeqXF8B1UkYDxBKBixarLQ1+rhomzjmPFUod7
   g==;
X-CSE-ConnectionGUID: BPHUoBncTTGHtU0/7VVSnw==
X-CSE-MsgGUID: QYZ9NH4KQZOUKxleu8VeeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73411850"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="73411850"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 03:19:21 -0700
X-CSE-ConnectionGUID: hPXM8aWsSmSz1GDaqwhH8g==
X-CSE-MsgGUID: kPamFaHmTteWMHE4UJzdFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="184977477"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Oct 2025 03:19:20 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7ADV-0002Xx-1n;
	Fri, 10 Oct 2025 10:19:17 +0000
Date: Fri, 10 Oct 2025 18:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:pr/91 4/4] fs/smb/client/smb2inode.c:1397:26:
 warning: variable 'tcon' is uninitialized when used here
Message-ID: <202510101851.TniDPnmr-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20251010 (https://download.01.org/0day-ci/archive/20251010/202510101851.TniDPnmr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101851.TniDPnmr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101851.TniDPnmr-lkp@intel.com/

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
