Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCDB44C97
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 13:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721739756; cv=none; b=kIbWPcAFBNMtDipHXAG7zvA+0s05hFl3yVjfA33rS300vOlqTqEVc6daTGhkM8uGA5Sg1F+dnYsQkpFbBtyuMJggHTYQrrU1FXPvrCTW1hMdyvzliszvPs0T1cP0VGWib9dcxMBCZyA23Ow5iJbOufFraSUB73p0S+aJIht2qQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721739756; c=relaxed/simple;
	bh=1kXce0qnCfTV41g4aqE4W8IcOgIGPmL8fiJIr/b7d3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tk18ZPSNsiPdjE7+9KECUqKTh3xPWsjA/0CisD1bJuJAbY9GdmhmEJ1JoEE2ufF7E1f6CZKT+6Twp9MeV7H+GOVtEoLrHAxvoFmSI8WLheO8fELSkCEqYozM23OI6BbyEqLRuj8diGMwkejFjOpLoq1BqI8h7ux62YhflnrBEL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQg3qQXM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQg3qQXM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721739754; x=1753275754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1kXce0qnCfTV41g4aqE4W8IcOgIGPmL8fiJIr/b7d3o=;
  b=XQg3qQXM4ler0hWsXV2JTpC7WIRiAFdnkFP6srciQKPytIMWJsLnBAnN
   xTmrlDqsr0pp9ooujbb2gWkIgI3ELw2SqaHZ1Kh2/m/tX3/nSBVdmhJRT
   3NfWconbBv9bHtY+qJHLqK5toG7zIj0pqdYjAW4tFvcm5HoVe/YkKNLJd
   XVr5ndZ2pdpEew6q1IFDDIOYE0mWW441QFzOTXymB3Z6c+Omi7vDbNgLo
   e0hcsoBFHCnct4XaIlKFoBrwngp5fXIwHsSC0JnBC6w63oP4F9uws2jsZ
   rgYpQrYn5o2pLx7EebJrJYZb3sE9rneiK5RYk+UpaIYYPE/yBCnZIB6BP
   Q==;
X-CSE-ConnectionGUID: MoAeVOk7SyyIL062EYg8uw==
X-CSE-MsgGUID: m6I4Chy4Qv+ZddYOuPgX8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="18976032"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="18976032"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 06:02:33 -0700
X-CSE-ConnectionGUID: SCSKC79RRpi8l4pbb2arOQ==
X-CSE-MsgGUID: 7I/PYQlXRhaCz5p0Xbihsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="56524585"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jul 2024 06:02:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWF9x-000lyS-2x;
	Tue, 23 Jul 2024 13:02:29 +0000
Date: Tue, 23 Jul 2024 21:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 200/326] fs/xfs/scrub/metapath.c:153:25:
 error: passing argument 3 of 'xchk_setup_metapath_scan' makes pointer from
 integer without a cast
Message-ID: <202407232055.2sHdtoZJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   34a8467cd7c47cc944cc6fa11ea4b46671c935d1
commit: d82c6606ab271e45425bae839921ca8963cd8300 [200/326] xfs: scrub the metadir path of rt rmap btree files
config: loongarch-randconfig-002-20240723 (https://download.01.org/0day-ci/archive/20240723/202407232055.2sHdtoZJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407232055.2sHdtoZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407232055.2sHdtoZJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/scrub/metapath.c: In function 'xchk_setup_metapath_rtginode':
   fs/xfs/scrub/metapath.c:153:25: error: implicit declaration of function 'xfs_rtginode_path' [-Wimplicit-function-declaration]
     153 |                         xfs_rtginode_path(rtg->rtg_rgno, type), ip);
         |                         ^~~~~~~~~~~~~~~~~
>> fs/xfs/scrub/metapath.c:153:25: error: passing argument 3 of 'xchk_setup_metapath_scan' makes pointer from integer without a cast [-Wint-conversion]
     153 |                         xfs_rtginode_path(rtg->rtg_rgno, type), ip);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         |
         |                         int
   fs/xfs/scrub/metapath.c:88:34: note: expected 'const char *' but argument is of type 'int'
      88 |         const char              *path,
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~


vim +/xchk_setup_metapath_scan +153 fs/xfs/scrub/metapath.c

   131	
   132	/* Scan a rtgroup inode under the /rtgroups directory. */
   133	static int
   134	xchk_setup_metapath_rtginode(
   135		struct xfs_scrub	*sc,
   136		enum xfs_rtg_inodes	type)
   137	{
   138		struct xfs_rtgroup	*rtg;
   139		struct xfs_inode	*ip;
   140		int			error;
   141	
   142		rtg = xfs_rtgroup_get(sc->mp, sc->sm->sm_agno);
   143		if (!rtg)
   144			return -ENOENT;
   145	
   146		ip = rtg->rtg_inodes[type];
   147		if (!ip) {
   148			error = -ENOENT;
   149			goto out_put_rtg;
   150		}
   151	
   152		error = xchk_setup_metapath_scan(sc, sc->mp->m_rtdirip,
 > 153				xfs_rtginode_path(rtg->rtg_rgno, type), ip);
   154	
   155	out_put_rtg:
   156		xfs_rtgroup_put(rtg);
   157		return error;
   158	}
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
