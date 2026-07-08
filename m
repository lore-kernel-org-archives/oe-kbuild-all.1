Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE82D3E8357
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 21:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783546874; cv=none; b=KCEUEp8MaNEJn45de/lp9Ew8efhYYPXOx5B8j375MRlMchvhRsZwQmfNab1Cv0VDm12Z8nOlMXIL5tKneUy4W3eeAZJyxuUNahuSP7YVVSqLhBeF2x1lbPYgCUoFYVYdzp/LiPR5dYutsfujXuoci7LwucesRCppUA+8M9VoOTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783546874; c=relaxed/simple;
	bh=ZyFPKJ+7rUKza0WrcMPMUtP6q4+UGyT141M4lhbg+No=;
	h=Date:From:Cc:Subject:Message-ID; b=KO7L+bGSKVTwKFLhK/oXfU5lT8xx0LU5a4/bK+9D/2ZWD6v/1Ci7SX02dn680TwPd4t/y6F4dON87DFaglgm5ObXxfMAJRK4z5Pcnv8MCyR5cnJV8MNheV6xBaTAUeEjhw1+9RXIz6ltlqciPZaEmWgzMMrXHwJCvtQoylwVrlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ec+X8AOQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ec+X8AOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783546873; x=1815082873;
  h=date:from:cc:subject:message-id;
  bh=ZyFPKJ+7rUKza0WrcMPMUtP6q4+UGyT141M4lhbg+No=;
  b=Ec+X8AOQ+uDA3X11/CcbZPVEio1jqRcYUYTkfy223WnZsr2wc1y8UwuR
   LxMMvMWelGaeCDU9hAwt1mLSyJXLvd3nIstglGWRLr1vszR9pNvb6lxyn
   5bNnLC0Ccp1VlHkgBwoOq2i0YpI6el+Q37dp8rkiNuIL7j+A51iAN3uSg
   IY6Cpnf6ZqDpR5Gchy95oC6jLnXHxqY8IpHj9i5MSdpzoLqsISSjSIgri
   zw4e81OfB4PxZ3JbwAfEPj5S518nZoVctlQ77qJwS4FJoU6bbeaGJk649
   xYkGlrFWi72qfjqnwmU4iqG57Q/0BFey5UccmqZRuMuFvGsdOSjF7hcwu
   g==;
X-CSE-ConnectionGUID: R1wqLHxeQk29qKK954t3Qg==
X-CSE-MsgGUID: 9k37UrfMSVedFe0rAKFArg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84001823"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84001823"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 14:41:13 -0700
X-CSE-ConnectionGUID: tJeWmBLESwayaJoc5sDInw==
X-CSE-MsgGUID: U1jrb8fPQpCDzX/lqy60fQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jul 2026 14:41:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wha0x-00000000GuC-1xP2;
	Wed, 08 Jul 2026 21:41:08 +0000
Date: Thu, 09 Jul 2026 05:39:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "sys_oak" <sys_oak@intel.com>
Subject: [intel-lts:6.18/linux 1/1] Warning:
 drivers/net/pcs/pcs-xpcs.c:1523 function parameter 'skip_reset' not described
 in 'xpcs_create_mdiodev'
Message-ID: <202607090502.OXXopfUD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Michael,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   5100e1c74efeba843945492f8d5840e6166c0392
commit: 8bc3d99d56e4782d8249523be7ea84dc6c27b4c2 [1/1] net: pcs: xpcs: enable xpcs reset skipping
config: powerpc-randconfig-r121-20260708 (https://download.01.org/0day-ci/archive/20260709/202607090502.OXXopfUD-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090502.OXXopfUD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090502.OXXopfUD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/pcs/pcs-xpcs.c:1523 function parameter 'skip_reset' not described in 'xpcs_create_mdiodev'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
