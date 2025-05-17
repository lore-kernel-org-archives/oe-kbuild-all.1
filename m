Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F161E3DFD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 23:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747525172; cv=none; b=oJqOusrXaso9Ib18Sp4KHRiK8p7s5XFkXKmXcZKk9VuBUZuLqY3FINPSdp0uVXU09Um/KHwOQNdA7RwIR2dEKnjGr3io1PZ4Dh8hgoR2CO3DxUcN8Akc/b3S63hmXwtbQxwHUcYiGoJGLGGjOB5xSTqRD+9hUvkFUJjHxVycorc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747525172; c=relaxed/simple;
	bh=/oEX7Lb+Zpm/dEOAYw+bubV5lNXxjvxLM+d+qm8TpZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jmFi1rCAW5jx6bjCKFSfC2uH5GD/A3MFway34WbnHc2MpDTiCiBxWkyj2GX0yduSFnwOC7izb6UIV57Tsyp0pR8kWrpWXB//F0cgeWs77WhKum6iN/4DkWTmzmrCeaNF7FjnIf7lC8atK2vJ9dVbkrkwP4HUaFjYUnQMIfDNZzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFHJbQXQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFHJbQXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747525171; x=1779061171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/oEX7Lb+Zpm/dEOAYw+bubV5lNXxjvxLM+d+qm8TpZU=;
  b=MFHJbQXQeFcfRtUpSa5v7D97VqT7KgCgtFkvW2kf0hIB7xZUbYIljFIU
   tv+9+mic/oRLaZIvcl7lp+xx1w9nhRc0rlK0anEuxrZPNQH+PecK1whxE
   fawzG6nzO+n62IY6+ZmjHEtPwwjCk3fa3UNm2HEStyAYXodz05541ctva
   BUxClNxu2auAugmulgs5nUJBB7KRr3iTLVD62x4H5gGU7+PmQElIdk2w4
   2BEF7/lIiwTpzdqwBuihgNfN1xC2GZxUl6Hi2H4+ISLQCzTZ19yIq8AW5
   yfIuwJAPFC/GSbImiFpZrtH1RVaWa/KVKN1racQ4+AgJoXy+o5HMe1ybH
   w==;
X-CSE-ConnectionGUID: +eLauYtKToGoN671cK2JOw==
X-CSE-MsgGUID: 2AipfNq2SGG5ISlpqXuPSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49569706"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="49569706"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 16:39:31 -0700
X-CSE-ConnectionGUID: RdVfnRveQhu9fNP9UNmngg==
X-CSE-MsgGUID: ijiQfvqaSLSkiLEmQuiAKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="140038041"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 May 2025 16:39:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGR7n-000KUx-2H;
	Sat, 17 May 2025 23:39:27 +0000
Date: Sun, 18 May 2025 07:38:55 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11] fs/xfs/xfs_mount.c:1087:1:
 warning: no previous prototype for function 'xfs_atomic_staging_cancel_all'
Message-ID: <202505180741.Vstkf9s9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   950b90b563b8c87ae35bb6edc4775609bc9471c2
commit: bb45aa897d6fc9eb24c04228746be0f10ed3b356 [11/11] anolis: xfs: release atomic staging extents when unmounting
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250518/202505180741.Vstkf9s9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180741.Vstkf9s9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505180741.Vstkf9s9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_mount.c:1087:1: warning: no previous prototype for function 'xfs_atomic_staging_cancel_all' [-Wmissing-prototypes]
    1087 | xfs_atomic_staging_cancel_all(
         | ^
   fs/xfs/xfs_mount.c:1086:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1086 | void
         | ^
         | static 
   1 warning generated.


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
