Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0C527603C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 23:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765581402; cv=none; b=EHiSdmNFjPFvC6GbNW+L0hAc3Uwi5AIWMjC56xKNbzdoyOmvGWPwnpCUffzpUxYpjVvUaK7B3hVPdd1Krsy8Z9MnRqTBLdsexbKaTOA9xL31IR9QWDvr0683Ljz9Ya9rP5CVXb5EQQd07srYFlT4L/PxjU5Hdi14vgyim2UntJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765581402; c=relaxed/simple;
	bh=gRPgNyNkcE6rUkVTdhj865bYAddO9FPVwevt1OrIjOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pLMO4rjYuyJxkXovWjnXdhFHGNil3K92sZIXHvGUU5amPf6G8cjlHyzL8bnc0cEbBGSmWqU7lS8CI0f3YfFMj/8umjN8ZZVM5mslXl/pF0qo9/g7pu44b0TaVxrZWFmMYyP8OSVibyv2XKqoMxZ1VRhx9v13JsODjwd1yINwzag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+v5Jp60; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+v5Jp60"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765581400; x=1797117400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gRPgNyNkcE6rUkVTdhj865bYAddO9FPVwevt1OrIjOo=;
  b=S+v5Jp60yubs5iSLfi+jGXFyIK9AYs2bvJmA4yH4AK5oNE6nyk/grHRp
   6+IyO5PgBLD7ypOrPPJhRR/+OQySn0TJxCVMcCL7xmId+/jTURD8GjWti
   U15kFS++nj0JH7HarMcOhQ8mpqM71tCZJ2/OT6AvP7ijUGQziIbwSmal0
   aB48evOcLT1FytokNeFLPi9Z0hKOnwUislM4xa7zRnHDQvayUknFUIKOr
   chJjCiiCi0CFghmtfGeFtBlsOIxGlvA3hB0qDjG2/DsBYhJ+Vb+CF2igg
   evinGNOaG3hoeSDANR/KYGv5qM9+MjVvCMGWFg2EoadE0zD1TbjFGTmza
   Q==;
X-CSE-ConnectionGUID: 6WVqO9J6TT6lWIG/rzoZIA==
X-CSE-MsgGUID: JPEid9BIS9y0EqJXAq91dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66761130"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="66761130"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 15:16:39 -0800
X-CSE-ConnectionGUID: nqpdA2JOQ32ebb5oHECvkw==
X-CSE-MsgGUID: 3LMJKSQZSVOx1LQZwEBPyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="202131453"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2025 15:16:38 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUCNI-000000006kr-1eaY;
	Fri, 12 Dec 2025 23:16:36 +0000
Date: Sat, 13 Dec 2025 07:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Long Li <leo.lilong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] fs/xfs/libxfs/xfs_alloc.c:102:1:
 sparse: sparse: symbol 'xfs_ag_fixup_aside' was not declared. Should it be
 static?
Message-ID: <202512130739.rii7QdtB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 8c6e9756375dff2e96d3b598992b2f0e8b3682ee [3541/3541] xfs: fix xfs shutdown since we reserve more blocks in agfl fixup
config: x86_64-randconfig-r134-20251213 (https://download.01.org/0day-ci/archive/20251213/202512130739.rii7QdtB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130739.rii7QdtB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130739.rii7QdtB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_alloc.c:102:1: sparse: sparse: symbol 'xfs_ag_fixup_aside' was not declared. Should it be static?

vim +/xfs_ag_fixup_aside +102 fs/xfs/libxfs/xfs_alloc.c

    94	
    95	/*
    96	 * Twice fixup for the same ag may happen within exact one tp, and the consume
    97	 * of agfl after first fixup may trigger second fixup's failure, then xfs will
    98	 * shutdown. To avoid that, we reserve blocks which can satisfy the second
    99	 * fixup.
   100	 */
   101	xfs_extlen_t
 > 102	xfs_ag_fixup_aside(
   103			struct xfs_mount	*mp)
   104	{
   105		xfs_extlen_t ret;
   106	
   107		ret = 2 * mp->m_alloc_maxlevels;
   108		if (xfs_has_rmapbt(mp))
   109			ret += mp->m_rmap_maxlevels;
   110	
   111		return ret;
   112	}
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
