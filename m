Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14E42F37
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 01:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709776487; cv=none; b=DjGBT0L+jgpjEeBf8HSgaO4r0Foo03ltELaWumKDPMc7sx1gW8SihbAC//9MSpVtui+00qS+3VUIC79U4pT4VMxAXTI5qtRSt0GSz43uwdmSjKOO5TMUVuJe73hjmL6ua6kPJXyx2RBgXlsM2Y4my/QH4U+6yXeI/z/4Y+vwRBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709776487; c=relaxed/simple;
	bh=VIgS6sJ3lRbpj4NFVTxaF+uUcenfbtHgPsYhuexD28A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gHQZ1qHLAXfXqbLxgjpYbZlvQ5ajQi2bPiNbCz59nR3YPaD9QIBmvFF3H7ZGaueN0cqvSgh7QwbdM7oh38Ug3VsqaZDBc3hv7mom/oq4qoGmgbGj/C5B3XE+uahLz3PUTT2t3S65jtqEiGKJ07DT2kd6KSwzhtfjos6NSRY3l6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzDYGG84; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzDYGG84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709776485; x=1741312485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VIgS6sJ3lRbpj4NFVTxaF+uUcenfbtHgPsYhuexD28A=;
  b=EzDYGG84vJBT1U3Knkx7qR7AwTprvI0uuMTPDLUUxAQIeeRVz1sO3reC
   VONG8zm8/UGdWTJLz2nHmGw+UbVxWlochwVQf/tMYI9tWJTycN3g/iYoM
   rgUBvfWIsDdP/ecKmO05ds+9BtSh1RyHeB8J2FmXH5anFobmVY7twueQp
   iG2dCOQMrYoh1epliaJcZr0RZJzk+/XeAqSOe+T2DNddt150Rs6Yr1wyn
   Q+/dk7CfPoMYamasqlTL+C3tYhvKOIFh2lu/D1bHTPx9Pp80G9CuI9Zd7
   WMt1IjInAdW0OUXcH9xEcI17b/p6TkxYaJdqEoj4X+VgweHBZk68vVNkh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4593641"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4593641"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:54:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="14606399"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Mar 2024 17:54:40 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri2xx-0004h7-1q;
	Thu, 07 Mar 2024 01:54:37 +0000
Date: Thu, 7 Mar 2024 09:54:33 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 25673/27434] fs/xfs/xfs_mount.c:1129:1:
 warning: no previous prototype for 'xfs_atomic_staging_cancel_all'
Message-ID: <202403070912.42jEIhjf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: accdf85fe11b16491509a6b7ca0a9c37d10d37be [25673/27434] anolis: xfs: release atomic staging extents when unmounting
config: arm64-randconfig-002-20240305 (https://download.01.org/0day-ci/archive/20240307/202403070912.42jEIhjf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403070912.42jEIhjf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403070912.42jEIhjf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_mount.c:1129:1: warning: no previous prototype for 'xfs_atomic_staging_cancel_all' [-Wmissing-prototypes]
    1129 | xfs_atomic_staging_cancel_all(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
