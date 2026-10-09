Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E7343BDB0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 11:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543956; cv=none; b=fK+XQrcHBrOq0tHWPPY8cBmkxXgQYazOJIghhNXbTbkGz8VpcQsG6qzODHUugGGlrB+eluUMF4No2JmIClIkHvDQSGyM73Zv97yBjLB/MbysvafddxgJIIL7sY75ss2Ym6jJ8mJMV4GQaQzGWeW5Vyjp2DH8c3PtkjLD72++1FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543956; c=relaxed/simple;
	bh=CQT5QkHlgXs1Rl/m0mtnjSk6RhhzS2HoC7RJkeEjFzw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SWpxwc+fe7pmj87urzamS7lll6tlOXMEr8jnkfz+JLagCbbG1dsjnlbC+fKae1sXu2qI/wwSM3LtgMq9ccfUjC/r8J/UY5WnGszusgr/7fzbSjbzeHmUtczmLa25EdcRjMmP+W2hWyVfpzIk67y81COMuJukM/cbwqtNBKGEojU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ekD+5Zuh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ekD+5Zuh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791543948; x=1823079948;
  h=date:from:to:cc:subject:message-id;
  bh=CQT5QkHlgXs1Rl/m0mtnjSk6RhhzS2HoC7RJkeEjFzw=;
  b=ekD+5Zuhchfse7u7TeP5qrBkO9ovM8fFDC1XO+BRyGU3fHJDj5RDjoUk
   Di3ista9XeKWxaPSALUvVntjwMRf5A26qOyAPGZ+c8aepbHaxeSZGdzLj
   3cwAt2N+S5KptFKRx7HjRaslwohNjOsXiz5UY8Z5oMDjDbP5qBshgpFLi
   IqEzVYsP0dntIDXJVFq2fH4YXbcHHyEEmxdY1ZVFlEaU91xjOs94vVybr
   AaM9lqFtFSAIE980ybh0hwz0gg6JNIzIjO8xGLAJ3oRppeG9eBnmB25QF
   /24fHKXQa3DFDX9k1myN7jJZaU1wqj+2Y6bwgNW2b83eF42fds242CNkj
   Q==;
X-CSE-ConnectionGUID: UZrsw9YHTMWAhUYROvXr/g==
X-CSE-MsgGUID: 0WQMdkadSZWUYWYPB6W/QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="437807"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="437807"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:05:48 -0700
X-CSE-ConnectionGUID: ueoHgO5dT9CnFhP/gZK+gQ==
X-CSE-MsgGUID: 0m6HYN3+Q7umZHhZJGWt9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="278798"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 09 Oct 2026 04:05:47 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF8Q4-000000006zo-2Kow;
	Fri, 09 Oct 2026 11:05:44 +0000
Date: Fri, 09 Oct 2026 13:05:15 +0200
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:dmabuf-size-ceiling-v7.3-rc3 28/41] ld.lld: error:
 undefined symbol: ip_route_output_flow
Message-ID: <202610091336.HM9z3pEj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git dmabuf-size-ceiling-v7.3-rc3
head:   856b6583ab2f4581e81670845eadb69de7a68b30
commit: c5e054ccaedf0778bd70baf19cc9200fe5a7acc1 [28/41] drm/amdkfd: port AMD Infinity Storage file I/O from the amdgpu driver
config: loongarch-randconfig-r2307-20261008 (https://download.01.org/0day-ci/archive/20261009/202610091336.HM9z3pEj-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 63d485c3ddee18e2838ba7235a4c519eb8fe08b9)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091336.HM9z3pEj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091336.HM9z3pEj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ip_route_output_flow
   >>> referenced by kfd_ais.c
   >>>               drivers/gpu/drm/amd/amdkfd/kfd_ais.o:(kfd_ais_rw_file) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
