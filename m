Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83E743C048
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 13:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916292; cv=none; b=GeKdVRh/zlIgRQ+2KCbW/41y+ihrKNyekhp2g1/5TO8QBmTTyPcxqeTceMcHyq5d+wYKQu9suISw/f/gHO1ldLI4lRlWFze8E5bxJuC/Lu9OX5hRD2mriJLeljk9Qc7C6qbrSP126fTyfH3eIUWQ6Kau4uxMCSCeAyj/rKEB8ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916292; c=relaxed/simple;
	bh=CciXpCrvwRixS1KVp5uYF39gNf/Yfy9/7+eUp+7djaQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RLpu/uttmsDBOH8FGlSCQshNh/DKI2uy1PrgHum53tRQARb20Eee8+Lx+c4QakAuYgr4+RyLdKvvoDWNv3n5OxOKKyJjzr4tsIIt0a0WxksuLKN2zTaCES2Zv+sMebnKjfKY0R8LDoBi3lAkx9gBoMJZbWRbQBKPly0Ct3ncFAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGhhI/CU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGhhI/CU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768916291; x=1800452291;
  h=date:from:to:cc:subject:message-id;
  bh=CciXpCrvwRixS1KVp5uYF39gNf/Yfy9/7+eUp+7djaQ=;
  b=UGhhI/CUS0oTr5akWgNkGFl82v5wL5Ke1W1J4rrBxs1MwvhnSHzeoxdb
   zAeEurvGAK2YRpNjsRIFY42x5kLES13cLF5HgQWve0wblA0xkD7dkk1Ie
   TFEJ5J/QvIDRCAcaLwLZwineNwdAqSLSJO/Oiv+ZnQvXxBPjb9ulQAtN0
   Q06YJrBtILxu1a8xkbxST+iHhp3h7HTxdPkZL0srQSPEhFzTk4a1shAeQ
   2JhDSztvm9HZbQFWspdZkirRyJMF+qFipGUoG6YCf32aEV/ZLGNdFBPAZ
   c/ijVjuQzPPhr9Si6H1s1NEaaEMs1aC9f4WUjiJwz6KQ8KYIKl7seTPVg
   w==;
X-CSE-ConnectionGUID: vh3L0J4fRUySWU6afmVWow==
X-CSE-MsgGUID: KGnQfd62StWoDSuUgVoE4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="72709629"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="72709629"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:38:10 -0800
X-CSE-ConnectionGUID: iw6e0QeLTeqY3BHqkgJ3tQ==
X-CSE-MsgGUID: UdQHu0t8SfCNLhQShMJaog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="206030052"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jan 2026 05:38:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viBvq-00000000P1v-2yE0;
	Tue, 20 Jan 2026 13:38:06 +0000
Date: Tue, 20 Jan 2026 21:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1093/7987] lib/xarray.c:2473:25: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202601202102.uotE2V9e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
commit: 863810caeb3cf04ee479f3944a678574001af7a9 [1093/7987] XArray: Add CONFIG_DEBUG_XARRAY
config: loongarch-randconfig-r122-20260120 (https://download.01.org/0day-ci/archive/20260120/202601202102.uotE2V9e-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601202102.uotE2V9e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601202102.uotE2V9e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/xarray.c:2453:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu * @@
   lib/xarray.c:2453:58: sparse:     expected void const *entry
   lib/xarray.c:2453:58: sparse:     got void [noderef] __rcu *
>> lib/xarray.c:2473:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *entry @@     got void [noderef] __rcu *const xa_head @@
   lib/xarray.c:2473:25: sparse:     expected void *entry
   lib/xarray.c:2473:25: sparse:     got void [noderef] __rcu *const xa_head

vim +2473 lib/xarray.c

ad3d6c7263e368a Matthew Wilcox 2017-11-07  2470  
ad3d6c7263e368a Matthew Wilcox 2017-11-07  2471  void xa_dump(const struct xarray *xa)
ad3d6c7263e368a Matthew Wilcox 2017-11-07  2472  {
ad3d6c7263e368a Matthew Wilcox 2017-11-07 @2473  	void *entry = xa->xa_head;

:::::: The code at line 2473 was first introduced by commit
:::::: ad3d6c7263e368abdc151e1cc13dc78aa39cc7a7 xarray: Add XArray load operation

:::::: TO: Matthew Wilcox <willy@infradead.org>
:::::: CC: Matthew Wilcox <willy@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
