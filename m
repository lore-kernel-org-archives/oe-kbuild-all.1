Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B2D208D0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 01:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771981594; cv=none; b=mVfLsJkC6IhCPEYW4y4TcUyEUOwkGDiyafqQmpoSk0FDrMT7ZMPnml+CiE+42fWtHuIThm/SkYD0AqNjFBPoH124OKSvPrJyZvrRRw/H4//qg9/C16mvlFZKcwLnmwgAuNau24AOOjf7F2j2r9KqAIjECV7Qrglm076bkk/v/is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771981594; c=relaxed/simple;
	bh=C0UFHh3sFEUQTk4YE7GIr25LN2zaqLuswh9Xi4b5ptI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WpXp9OWoDZLLvJ5fxCPo/4eqMsuFqpHHQvcA2xo0SjFucJ0ki4Tb0XTF8a+MNvf35XozAjC6sVSr4yCKSa5v9cCz8OG5F1Ir6DSB83TyGCvdVtZ+nHAe9RYewcjPQGKe7LjAUgIfmAR0IvJENsSA2s1xME1+3rJW2N2zayvwN0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ca7ZnH/t; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ca7ZnH/t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771981591; x=1803517591;
  h=date:from:to:cc:subject:message-id;
  bh=C0UFHh3sFEUQTk4YE7GIr25LN2zaqLuswh9Xi4b5ptI=;
  b=ca7ZnH/tz+2snCwF0NCSSm2B00b5/ded4IMp4cbrtRBVeJaoOJRF3sEY
   vwOUy0OaQYldjbTqH4+umJjQT+aES55JSUgtjQ/aOf1Rd0xriOQKdMfrh
   awCyl3FfXB+5GiUbIxA+Ed3382hfRfYstWsAmJMnsNDe9i6BnyD5dmk5D
   ICPbFQd+A2Ul+qJAIo9Rm2eyxPYxtHyYn3PvlGQZEr4O997HlGFTPn0t+
   cqEG3bapKVXbhm0RRix/9muoXR92yRUKgNS16y88bc2vDyCNEsBxaHYGy
   g9tmaJwsfGUecroAdwgZ53wP+AcX1cnTI/8+Txog7dEfLeWTcJ6oMArxh
   g==;
X-CSE-ConnectionGUID: 9RBKLozbSPSl7lZbiiYyNg==
X-CSE-MsgGUID: JjxMV1q5QnmOnpnzkpLtWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="84471019"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="84471019"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 17:06:30 -0800
X-CSE-ConnectionGUID: faf+7XZcSM++taoH6gE+9A==
X-CSE-MsgGUID: eQ6dN/nbTsWipQMqmXLFbg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Feb 2026 17:06:29 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv3MA-000000002gr-2k2F;
	Wed, 25 Feb 2026 01:06:26 +0000
Date: Wed, 25 Feb 2026 09:05:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 13/1658] lib/xarray.c:2473:25: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202602250843.bhgBP3QW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
commit: 863810caeb3cf04ee479f3944a678574001af7a9 [13/1658] XArray: Add CONFIG_DEBUG_XARRAY
config: mips-randconfig-r123-20260225 (https://download.01.org/0day-ci/archive/20260225/202602250843.bhgBP3QW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602250843.bhgBP3QW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602250843.bhgBP3QW-lkp@intel.com/

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
