Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A267462
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 03:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710128537; cv=none; b=WFUBsgHPpu6a6irdbGzJ7STWttHJcNQqg3dlxV+wKDv3HFjuigdc3lgXiQ1dp7LoNK7rmVBjqjKM0IcuOhqZisshO8V3Dp1fkQINxq9vs/uPdKc0zFObIIxhOipq3Cz+a019gp7tOFD/BNdwXgMAZH4Re29XmeBDESMtz2B4Zy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710128537; c=relaxed/simple;
	bh=Z4Yycwi6Nq6jitC3pqlodo+sPPikQGY5439XRmN/V4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VcXh7laCHvc1EVd7Td+bnJp+S2VYHxwSdDBqtA1f+hNfqb1v4i4T9QPb+5OdmNZkYBSc9UmoL/DNP4oTSI2Fd7jcQeWD2/REomVhMOFRYe2/49fEs/WA2v3/toNZmSYvzys2aQAQlwnBJvhiSF4u/DpZWnr3q2qbfNsMXTjSOaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HH1CjcUm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HH1CjcUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710128536; x=1741664536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z4Yycwi6Nq6jitC3pqlodo+sPPikQGY5439XRmN/V4c=;
  b=HH1CjcUmFg94dl9RuZ2I61jX6fEHGAkLiGkA4WRheB6hxkyiaFfMxli6
   jpzY2Kpsap5dd7d2Tft99K+KAA3Hn8xdb7n4C5GsbLkJIPG4tSgp6wTc7
   /5ONkBcz/aU0+z2HdTiuAs3g7q5QgVrz6JcN3APcxxE2IfX+GgOrNkxuI
   dk/V4BuO4zQ2gTSVAaC3i+T17P8+mFxeqQUji32V19VOPAsDy/u0Ljjfb
   PBSZD/MSxWZYsF1eWFG82ntnyzN2MPw27cX9YoEoNPGzx0M8gnCU8CUv5
   amkk1aAJyVvsU3pla6hZ72YmpGPjf9nFEVRSdDZNLrNRa6fX0HFCzSh+F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4891188"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="4891188"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 20:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15684509"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Mar 2024 20:42:12 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjWYD-0008rt-0k;
	Mon, 11 Mar 2024 03:42:09 +0000
Date: Mon, 11 Mar 2024 11:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 25673/27506] fs/xfs/xfs_mount.c:1129:1:
 sparse: sparse: symbol 'xfs_atomic_staging_cancel_all' was not declared.
 Should it be static?
Message-ID: <202403111144.53DKRDR3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   3ba333344123321f5f312e69966bbc8e5533561f
commit: accdf85fe11b16491509a6b7ca0a9c37d10d37be [25673/27506] anolis: xfs: release atomic staging extents when unmounting
config: x86_64-randconfig-r113-20240305 (https://download.01.org/0day-ci/archive/20240311/202403111144.53DKRDR3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403111144.53DKRDR3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403111144.53DKRDR3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_mount.c:1129:1: sparse: sparse: symbol 'xfs_atomic_staging_cancel_all' was not declared. Should it be static?

vim +/xfs_atomic_staging_cancel_all +1129 fs/xfs/xfs_mount.c

  1127	
  1128	void
> 1129	xfs_atomic_staging_cancel_all(
  1130		struct xfs_mount	*mp)
  1131	{
  1132		xfs_agnumber_t		agno;
  1133	
  1134		for (agno = 0; agno < mp->m_sb.sb_agcount; agno++) {
  1135			struct xfs_perag *pag = xfs_perag_get(mp, agno);
  1136			struct xfs_trans *tp = NULL;
  1137	
  1138			while (1) {
  1139				struct xfs_atomic_staging *as;
  1140				int error;
  1141	
  1142				spin_lock(&pag->atomic_staging_lock);
  1143				as = pag->atomic_staging;
  1144				if (!as) {
  1145					spin_unlock(&pag->atomic_staging_lock);
  1146					break;
  1147				}
  1148				pag->atomic_staging = as->next;
  1149				spin_unlock(&pag->atomic_staging_lock);
  1150	
  1151				if (!tp) {
  1152					/* Start a rolling transaction to remove the mappings */
  1153					error = xfs_trans_alloc(mp, &M_RES(mp)->tr_write,
  1154								0, 0, 0, &tp);
  1155					if (error)
  1156						break;
  1157				}
  1158	
  1159				while (as->aglen) {
  1160					xfs_fsblock_t fsbno =
  1161						XFS_AGB_TO_FSB(mp, agno, as->agbno);
  1162	
  1163					xfs_refcount_free_cow_extent(tp, fsbno,
  1164							XFS_ATOMIC_WRITE_EXTSZ_HINT);
  1165					as->agbno += XFS_ATOMIC_WRITE_EXTSZ_HINT;
  1166					as->aglen -= XFS_ATOMIC_WRITE_EXTSZ_HINT;
  1167				}
  1168				kfree(as);
  1169			}
  1170			if (tp)
  1171				xfs_trans_commit(tp);
  1172			xfs_perag_put(pag);
  1173		}
  1174	}
  1175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
