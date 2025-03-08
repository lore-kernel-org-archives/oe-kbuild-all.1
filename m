Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2E413CA9C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741447938; cv=none; b=SAaGikyUMWk1AESPib1cAugE5Wz3HNUxwqk3JHewrppWRQ9AyZcd5p1oIhfNu/5DgCIXi/1Koe7mVUSEduNtTPCdxION32BYcTMmcvtr1S1oAQUKjEg/ByTmFDXIdFYt9ZWrymegDBgXeB1vAyaSW+OqBeD5bgQF+eVZcd09dEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741447938; c=relaxed/simple;
	bh=Kzejc+wXN5y5MKWQR8dH9bHK6PPe0WLmbmBYIB8erM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lbCMEmIjH9uuKKvqPGmIIqAAbQj8BrqdOL8CP0mzyts09U5L1NZN6/OUttLhXqzk9+cXpqe751EWeHRCI+zby5vPwUA9IX13XNXC8O3N3fDR3QZJtrjLXmw9boE5LeRSY6FYcKXEddFeteqaWswFHinXeGVQp8h5M+0jsbj61EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hmItoU+4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hmItoU+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741447935; x=1772983935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kzejc+wXN5y5MKWQR8dH9bHK6PPe0WLmbmBYIB8erM8=;
  b=hmItoU+4FsHvhUzc5YKp7BmplnFyBQciri2LOIEviyN6Jh+IGdGqvObq
   xY1sDewqq279CFIJmes9K1aBcvW7xBDgdS5bpqfvlC1LEQKinPxTUgFss
   GQ3PF+l+Kgou3PPZSSv1hnuaItHpbuxrhk5dw8OxlK4lkM1sX1SsCikCx
   hPubKJZdj0D2uxZ3FaLUauPyQORUecn1xAmHT29etA+tG2ARQKlU0q1KI
   phaCuLe/HHvhDxdNaB9G6FlhT5CzSOrdaBlkH7WVNeFZbtg5lEt4gzZl1
   7+UOi4b6BVH2M9ADqgNqG08BZrrQF02igvZCvQYjiC7PhaPKBcLFgTrka
   w==;
X-CSE-ConnectionGUID: 0/+hL57wSVGMVHvTGaQuyw==
X-CSE-MsgGUID: rJFMBV9gQ9++WYjMl/BzDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="30067500"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="30067500"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 07:32:14 -0800
X-CSE-ConnectionGUID: ojnZRe9iSLSQ6Hv2WIxTzQ==
X-CSE-MsgGUID: m0BJR9ibQXGgW2hxCCzoWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="119754184"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 08 Mar 2025 07:32:13 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqw9r-000201-31;
	Sat, 08 Mar 2025 15:32:11 +0000
Date: Sat, 8 Mar 2025 23:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] fs/xfs/xfs_mount.c:1087:1:
 warning: no previous prototype for 'xfs_atomic_staging_cancel_all'
Message-ID: <202503082327.MdnbYDxR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   797aae63f086cf8250bfbb8395ab310c525ac4a6
commit: bb45aa897d6fc9eb24c04228746be0f10ed3b356 [1/1] anolis: xfs: release atomic staging extents when unmounting
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250308/202503082327.MdnbYDxR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503082327.MdnbYDxR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503082327.MdnbYDxR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_mount.c:1087:1: warning: no previous prototype for 'xfs_atomic_staging_cancel_all' [-Wmissing-prototypes]
    1087 | xfs_atomic_staging_cancel_all(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/xfs_atomic_staging_cancel_all +1087 fs/xfs/xfs_mount.c

  1085	
  1086	void
> 1087	xfs_atomic_staging_cancel_all(
  1088		struct xfs_mount	*mp)
  1089	{
  1090		xfs_agnumber_t		agno;
  1091	
  1092		for (agno = 0; agno < mp->m_sb.sb_agcount; agno++) {
  1093			struct xfs_perag *pag = xfs_perag_get(mp, agno);
  1094			struct xfs_trans *tp = NULL;
  1095	
  1096			while (1) {
  1097				struct xfs_atomic_staging *as;
  1098				int error;
  1099	
  1100				spin_lock(&pag->atomic_staging_lock);
  1101				as = pag->atomic_staging;
  1102				if (!as) {
  1103					spin_unlock(&pag->atomic_staging_lock);
  1104					break;
  1105				}
  1106				pag->atomic_staging = as->next;
  1107				spin_unlock(&pag->atomic_staging_lock);
  1108	
  1109				if (!tp) {
  1110					/* Start a rolling transaction to remove the mappings */
  1111					error = xfs_trans_alloc(mp, &M_RES(mp)->tr_write,
  1112								0, 0, 0, &tp);
  1113					if (error)
  1114						break;
  1115				}
  1116	
  1117				while (as->aglen) {
  1118					xfs_fsblock_t fsbno =
  1119						XFS_AGB_TO_FSB(mp, agno, as->agbno);
  1120	
  1121					xfs_refcount_free_cow_extent(tp, fsbno,
  1122							XFS_ATOMIC_WRITE_EXTSZ_HINT);
  1123					as->agbno += XFS_ATOMIC_WRITE_EXTSZ_HINT;
  1124					as->aglen -= XFS_ATOMIC_WRITE_EXTSZ_HINT;
  1125				}
  1126				kfree(as);
  1127			}
  1128			if (tp)
  1129				xfs_trans_commit(tp);
  1130			xfs_perag_put(pag);
  1131		}
  1132	}
  1133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
