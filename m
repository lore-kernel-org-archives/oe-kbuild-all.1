Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCED3CC7D3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 11:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289463; cv=none; b=XneqX2ltUebutlLJPe+W+Wc3wI5x9Gv+6fbVhF+OgtGlMzqS1R5bIZjhRyXWLgMeleaAdvtfmMrEaol4jh0qUI3Iol2r+pRur66NqCgVzd8BxL+VOo2CbcWCXoAc6gH79S4YyUEKDfro/yitHwe4QrkSI/Al+gq1CMe3EALdRFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289463; c=relaxed/simple;
	bh=WmuTw2ODrFBivc9MD9vQntjzuN4yJHaPt3B6T/L57X8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AbY1hq7dr7f1qRs8bLnzcSWXcW+qEOlGEesh90y0zoslvclx3ZDgHSM5s2ndeDPqprZqbvAMlo30YlFL8em4UWecfaeZCmr3lUczchVKG7fSsFJpc9glhtygbWaJXxewzy0ABylxc8iOfpIOvE98wT/ZL384sPlXAw3ks1y3DyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEOlwT+8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEOlwT+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784289458; x=1815825458;
  h=date:from:to:cc:subject:message-id;
  bh=WmuTw2ODrFBivc9MD9vQntjzuN4yJHaPt3B6T/L57X8=;
  b=NEOlwT+8I3BpuCXflWdZ7SXOVRu+QVWREFNY1/K3ghU72hJ7eEJM+B+W
   SqOa5MNSRd6aYCxy493MlJw4jy7N3XO47qQp3zGOiiOrUfSfVgQAFPXoB
   1MtqwKpvxqYdopFKM0k+UTMIIlbf5jzJ+kGIR16GQxxDsCKXq4FiUjN37
   EJTWKpe0mE2pJbx91p2UfGLT68QvT5eGXObVfxVNH0q12mDm3+TkGGtuT
   VYlVt3Ig5BuLZTT85DThpqsWvct9wtQkDT9PWcZM3/AD0F+O215J5VxRX
   +Oj8F4JPF38y0VrtjRtbAIy3OpePV1lvv0eXVLfNb8ZDtF7cHbsPZRjVe
   A==;
X-CSE-ConnectionGUID: hUhHh1BjSvqv47c66RPFBw==
X-CSE-MsgGUID: /4OHwk/0TE6JaOqUOVo6Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85157936"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="85157936"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 04:57:33 -0700
X-CSE-ConnectionGUID: wJh1/da9QG+kt1gkg65fcw==
X-CSE-MsgGUID: zrChz4zVQB6DDoqN9HUThA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="258759626"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jul 2026 04:57:31 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkhC2-00000000Si6-0uCf;
	Fri, 17 Jul 2026 11:57:26 +0000
Date: Fri, 17 Jul 2026 19:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 1/1]
 drivers/vfio/vfio_main.c:65:6: sparse: sparse: symbol 'allow_non_coherent'
 was not declared. Should it be static?
Message-ID: <202607171935.pzIPaD2n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   9a6f48bb2f89b94bc6857fece1131c450c0d5bee
commit: 88e59f90e918a5d074d07e6f6c5af7a58317a1d4 [1/1] ANDROID: drivers/vfio: Allow non-coherent device for pKVM
config: i386-randconfig-r133-20260717 (https://download.01.org/0day-ci/archive/20260717/202607171935.pzIPaD2n-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171935.pzIPaD2n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607171935.pzIPaD2n-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vfio/vfio_main.c:65:6: sparse: sparse: symbol 'allow_non_coherent' was not declared. Should it be static?

vim +/allow_non_coherent +65 drivers/vfio/vfio_main.c

    64	
  > 65	bool allow_non_coherent __read_mostly;
    66	module_param(allow_non_coherent, bool, 0444);
    67	MODULE_PARM_DESC(allow_non_coherent, "Allow binding of non-coherent devices, not supported with type1 IOMMU. (default: false)");
    68	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
