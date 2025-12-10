Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4C523E334
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 21:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765401298; cv=none; b=Ltoy+lGqK2pUKZD6xl64BseLUToqIOGgVwyCnyQ4WD/Ga5R+SQ1KDK6lCDwnsn23+ZwUFf1WzDmP+tQdGbSDevDx0RdwSF7V+PUJtu+zyg7QNaH+xFYhz250odhmw0AMkNd9O4SNJ+33CDBPiM0ULvtR7E2m7CeVaydCGsU4gz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765401298; c=relaxed/simple;
	bh=lGZGJmY7y2YBfQhj4Ybvoxw3ZkC/wU6Lq9/9X6V3xY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qIWQQ4iZQTN/F/FmZnPeaYCizbVXqpW1IdIWHlx2HlzfeRFtqc0dPzIoScFYLC4ogUjek6FUXOPDI5cKOGf7vY95lGyv07XX0jSjWOaGv0nDpxdThKgUzTIszvv/eAXl9dDvJYePqtCqewSAOqmow40a5tuThMrTI75BZ5PANuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/DemhX8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/DemhX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765401297; x=1796937297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lGZGJmY7y2YBfQhj4Ybvoxw3ZkC/wU6Lq9/9X6V3xY8=;
  b=m/DemhX84UpM6a6RQnUFuue+PXmDJSLwfnIGbGF7JUCcSNakf1CBIdi1
   0tWGe0GFgSQuIuKvR5A3+yXiLBHWHAQhhY+O7QXNIqnqssHEbp7MqDaQY
   u5onmTxrwpgQ6awdcF5auLbPz8rEfrU/GRxQAj65A1mpZSytTOZcq/PRI
   oBjEFnslHu04uuSI+scCdThXgcIc7x8VLwH+zZPrJNIioRqVdyZBcnuJM
   7/kb1wxVX9pl2UMjgjAugiKFv3eaPcF9oVhWJB94d6IkSQmB4luQEtshr
   km3XsC/nLpnAydSNLRzk9w2xlrF7onrYmk4BmNkXquhduOl4t/+DcHHPO
   Q==;
X-CSE-ConnectionGUID: dlBxFsSIRIy9oVl1VRAz4A==
X-CSE-MsgGUID: ioGHYg1iTgSvIgOdbg0ZoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71245878"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="71245878"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 13:14:57 -0800
X-CSE-ConnectionGUID: 6ivdqPuTSuSs7obNJpEPoQ==
X-CSE-MsgGUID: i7IM+ISrRJmiKlwlSQO/aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="227669184"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Dec 2025 13:14:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTRWP-000000003lv-1kvS;
	Wed, 10 Dec 2025 21:14:53 +0000
Date: Thu, 11 Dec 2025 05:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Long Li <leo.lilong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3401/3401] fs/xfs/libxfs/xfs_alloc.c:91:1:
 warning: no previous prototype for 'xfs_ag_fixup_aside'
Message-ID: <202512110538.DUkYagUT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   41baca24098d5757f3aea4d98e63eb9d9f7d43a3
commit: 12a5c9f8f69c682f3aaf799a18f4a3631cc9bfbc [3401/3401] xfs: fix xfs shutdown since we reserve more blocks in agfl fixup
config: x86_64-randconfig-161-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110538.DUkYagUT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110538.DUkYagUT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110538.DUkYagUT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_alloc.c:91:1: warning: no previous prototype for 'xfs_ag_fixup_aside' [-Wmissing-prototypes]
      91 | xfs_ag_fixup_aside(
         | ^~~~~~~~~~~~~~~~~~


vim +/xfs_ag_fixup_aside +91 fs/xfs/libxfs/xfs_alloc.c

    83	
    84	/*
    85	 * Twice fixup for the same ag may happen within exact one tp, and the consume
    86	 * of agfl after first fixup may trigger second fixup's failure, then xfs will
    87	 * shutdown. To avoid that, we reserve blocks which can satisfy the second
    88	 * fixup.
    89	 */
    90	xfs_extlen_t
  > 91	xfs_ag_fixup_aside(
    92		struct xfs_mount	*mp)
    93	{
    94		xfs_extlen_t ret;
    95	
    96		ret = 2 * mp->m_ag_maxlevels;
    97		if (xfs_has_rmapbt(mp))
    98			ret += mp->m_rmap_maxlevels;
    99	
   100		return ret;
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
