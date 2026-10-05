Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737A23093D8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 18:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226059; cv=none; b=rCRWNkzS/1s073p5K3A44iKWn1GmukMspVi1iIv4XZVzLz6uJjjmfLlEFw5xDyxzQdHKTcXytSoieXCzkh6grpWAwzhhMp7ldDOT7Nh97nTWQSVXvl/iPe+wG7eGwf2Sc0WYQ3bHmkO3tUmOMNZ7TP8zjgNudZFIxNyaQXNJaE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226059; c=relaxed/simple;
	bh=qb7Ir6bD3NpbGYRoUWU4sCt6pX/MqIZnDHaLQzL3g3c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BNQprx+1Iv1+qsN5YF+Cqy6EZhrgRkZYP4kPeeZi33Xh4dUSHDN58GglI+ncjXzcCZGe61yRNk32o6AzsPx06qOyd4Om0Q+LN8str7BuNNWUdWledGlgltGaLo0rQ58eFEEoiE5mL2ma+1UaaWYH8tRQNJLsBIQAXudJ+hqDcEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEpytsV6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEpytsV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791226058; x=1822762058;
  h=date:from:to:cc:subject:message-id;
  bh=qb7Ir6bD3NpbGYRoUWU4sCt6pX/MqIZnDHaLQzL3g3c=;
  b=nEpytsV6i7OMVrUW45K/aOsIDMnRLyqETRHXyh/xk4IZA9490pt6IDMF
   rp1FCaeasOTqf+M7uFY4+G1C0NxLjQcEvyrHH3oM1DW3twZ5A1hMq8C/y
   aXQEoPi0A8OdYdcJ5VjfIer90HTn+K9O3w9JDWS4DYjVX5wk7OvA2DU02
   hEq5htrSUwBOhfeNbRY36hvELsknpmUi43OVTdoD8ZsnvhDfqLTaiPR4a
   EUT9OBtMULbUddFQvz/fv7kHOCzRr72eE1PVi6vpNLNQZQbKNIN1SueDG
   IN6j6xHpyBlodvXb7ZNasXg/09OqyHmAgaz8CUsAJhcPnD3hyfhkqG7hb
   Q==;
X-CSE-ConnectionGUID: RDHJLHPbTly4k4VdVlXElg==
X-CSE-MsgGUID: fM0oYTIES7ir2iqEkrUwHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94616165"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="94616165"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:47:38 -0700
X-CSE-ConnectionGUID: swVHdDjvSWW+T3teiic9HQ==
X-CSE-MsgGUID: OtbAnlTURvuGh0ybU8YmLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="273294834"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 05 Oct 2026 11:47:36 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDnio-000000000Gf-2Mp5;
	Mon, 05 Oct 2026 18:47:34 +0000
Date: Mon, 05 Oct 2026 20:46:42 +0200
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:llm-fixes-23 65/95]
 fs/xfs/scrub/inode_repair.c:1773:undefined reference to `xfs_qm_dqget_inode'
Message-ID: <202610052000.DNFCy2r1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git llm-fixes-23
head:   cfeb0e609481f4df242684d426d8972e120e1826
commit: d1a9d46e808953ae087cdd9dd7ff545f491064c5 [65/95] xfs: reattach dquots after changing inode ids
config: x86_64-randconfig-r2100-20261005 (https://download.01.org/0day-ci/archive/20261005/202610052000.DNFCy2r1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610052000.DNFCy2r1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610052000.DNFCy2r1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `xrep_inode_switch_dquot':
>> fs/xfs/scrub/inode_repair.c:1773:(.text+0x1a2b796): undefined reference to `xfs_qm_dqget_inode'
>> ld: fs/xfs/scrub/inode_repair.c:1773:(.text+0x1a2b83d): undefined reference to `xfs_qm_dqget_inode'
   ld: fs/xfs/scrub/inode_repair.c:1773:(.text+0x1a2b918): undefined reference to `xfs_qm_dqget_inode'


vim +1773 fs/xfs/scrub/inode_repair.c

  1752	
  1753	static void
  1754	xrep_inode_switch_dquot(
  1755		struct xfs_scrub	*sc,
  1756		xfs_dqtype_t		type,
  1757		struct xfs_dquot	**dqp)
  1758	{
  1759		/*
  1760		 * We changed one of the file IDs, so we must detach the dquots to
  1761		 * prevent further changes from being accounted to them, and try to
  1762		 * attach the dquot for the new id to absorb any other block usage
  1763		 * changes.  Schedule a quotacheck so the accounting discrepancies will
  1764		 * get fixed eventually.
  1765		 */
  1766		xrep_force_quotacheck(sc, type);
  1767	
  1768		if (*dqp != NULL) {
  1769			xfs_qm_dqrele(*dqp);
  1770			*dqp = NULL;
  1771		}
  1772	
> 1773		xfs_qm_dqget_inode(sc->ip, type, false, dqp);
  1774	}
  1775	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
