Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E5E3BB10D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 07:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531080; cv=none; b=o/SUzk7J173ekJuHYtTXjqCb1Z25gZAI4DbzulVxCkjtfVpdg02gw/w1doMBsq2OOZhMP4Wp3RGFeEZP2Dataqp2VkFiNKbhZfzOIbi4kdmXa/widDJgqJT/+YWtyjKC4HqhY0URzVF9euFVPh/b8Sbw+eNieg87fDkZxdDwS6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531080; c=relaxed/simple;
	bh=w1NEj3dvXL/Pqbcj5NSs4p6rtK4IYg7GFQY2YtFHhjI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bmhfQpf9/o21CCqRf0KbclkBIqnB/j0u+Q6ZY0RAVoPbXp8qrx5biup4qHUP8PxJHSGXCPwppWXKVoXtENmeOB4ifzIJhJj5mBu9HWyuya44d+sSetiEEm+z2CK+qrEIUy6SmmtUQAUgnJfqyNTdrWe9OdC0EaSciaP1nWHUMDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFm5cSvf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFm5cSvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791531079; x=1823067079;
  h=date:from:to:cc:subject:message-id;
  bh=w1NEj3dvXL/Pqbcj5NSs4p6rtK4IYg7GFQY2YtFHhjI=;
  b=OFm5cSvfaeQ3LymZc140Xgz/N8AMigw1PmihhFCXiBFkmaPP3Ohi71Eq
   GZK2bPn+2sR+wr299r3qW3V2aHviBiILGeta7cu92LlI+BLsYF0KnizXu
   Ef/sYrUWSvUVXp/zqtUagaBKaNw2XXOI8k/I6Wyk9Nx6VRLTE9eNBGfzv
   aDo3sHTSoI/9dhF4aB54ujDayRDPRq5VcMEOO8+0DfTtDowZNVFQeGgBM
   HQrREgqD83shNfpCbMmRzYJyl8k1JQi8uJUrwR2Re3NHt0fS0VQFBUiKp
   OyvU67CoSxXt9wJwV8Ukp3Day2fnD64Ezu4zUGjDqdTt+vQi+fk7atZPe
   g==;
X-CSE-ConnectionGUID: sg1o0xQEQuaqYZOOoiOw3w==
X-CSE-MsgGUID: +hDCWXiuRimuSPIuApdZeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="201904"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="201904"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 00:31:18 -0700
X-CSE-ConnectionGUID: KIGbXtCdTpyzKoby9H/EIA==
X-CSE-MsgGUID: Bu+oNr9hQfeywP2TrVa3nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="340195"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 09 Oct 2026 00:31:17 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF54V-000000006qx-2nRx;
	Fri, 09 Oct 2026 07:31:15 +0000
Date: Fri, 09 Oct 2026 09:30:54 +0200
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:llm-fixes-23 65/96]
 fs/xfs/scrub/inode_repair.c:2100:5: warning: 'CONFIG_XFS_QUOTA' is not
 defined, evaluates to 0
Message-ID: <202610090936.4Hy7cfcf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git llm-fixes-23
head:   33d783380636b9433e2b276334edd43c1dda1268
commit: a5bf930d0f3f00e0f4c9be140ea4935adb729855 [65/96] xfs: reattach dquots after changing inode ids
config: mips-randconfig-r2107-20261009 (https://download.01.org/0day-ci/archive/20261009/202610090936.4Hy7cfcf-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 63d485c3ddee18e2838ba7235a4c519eb8fe08b9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610090936.4Hy7cfcf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610090936.4Hy7cfcf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/scrub/inode_repair.c:2100:5: warning: 'CONFIG_XFS_QUOTA' is not defined, evaluates to 0 [-Wundef]
    2100 | #if CONFIG_XFS_QUOTA
         |     ^
   1 warning generated.


vim +/CONFIG_XFS_QUOTA +2100 fs/xfs/scrub/inode_repair.c

  2099	
> 2100	#if CONFIG_XFS_QUOTA
  2101	/* Switch dquot, return dqtype if we need quotacheck */
  2102	static xfs_dqtype_t
  2103	xrep_inode_switch_dquot(
  2104		struct xfs_scrub	*sc,
  2105		xfs_dqtype_t		type,
  2106		struct xfs_dquot	**dqp)
  2107	{
  2108		xfs_dqtype_t		ret = 0;
  2109		xfs_dqid_t		id = xfs_qm_id_for_quotatype(sc->ip, type);
  2110	
  2111		if (*dqp != NULL && (*dqp)->q_id != id) {
  2112			xfs_qm_dqrele(*dqp);
  2113			*dqp = NULL;
  2114		}
  2115	
  2116		if (!*dqp) {
  2117			xfs_qm_dqget_inode(sc->ip, type, true, dqp);
  2118			ret = type;
  2119		}
  2120		return ret;
  2121	}
  2122	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
