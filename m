Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1141A4AA1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 11:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732103625; cv=none; b=byT2nBODTGQ6LYVT0OhXZl9OQGK4pheHJdJUDcSAr0lRR1UZRbw4wcWyZ+fj/MBcnxlxfKa0S2q6afB8Bjx6tVAHuXOvj3DJrBsfeIXyVp+WVowETjOLZjX/KsCc9rZZ8U5oLvBY4R50zK7dRsYSEuRXolMc9ju0rF5vLZNaTBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732103625; c=relaxed/simple;
	bh=Cm+o1rKjbY1CSsnSt/c8c+weOUIqnBAFz+amjYWyeMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X0q2DiWUiPHzagpcVtdts8yC7+GRuXpkJB5UN1Of1Uc7XcnO/0zrhWE5NafPPgqHiWnfPyPJgALnLiCZbS+/OJ/HYghb/BoJx3VFjNpBbdJfU31TcXm27//vYM3/DFl7doWLaUK4/M59P1owq90OOWS6nyrQprw1BDN+Fmi3a4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTPt4iFi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTPt4iFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732103624; x=1763639624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cm+o1rKjbY1CSsnSt/c8c+weOUIqnBAFz+amjYWyeMc=;
  b=YTPt4iFiVTWYGNYdahtQy5hnNP4QUG4HWWG8Wp0o3r2gtqXQCvvF/Kuh
   1tti8cza/WkteET5ZlSBHguOHvhCBbkceLjDknudza1SdS2qC68pk1uuh
   O2nKdop2VRwQP6F1TTU8yFMn6wLCg5qUYXeqUdxr4OAM+NrB020xkmL8Z
   6Bn6B2RkUpzUAwJKI3lFKlDQ+o7OUl14yQOhZyCKiFKAdAXNy5ejk4fHn
   3tr/4Lkcm/NHXD5tRw5YzNtFCTgr6kLVdWZlX5yPID2Hjv1QRcsHY54qz
   q+2kj7rXyMadHFUdyRRoeEClJggOr8Iybu4G7EuinLqkQq6pdCuUoCBEq
   w==;
X-CSE-ConnectionGUID: Vug/i7tiSPOVH0Xxs6/WcQ==
X-CSE-MsgGUID: ZShNEG8PSQWriTA3ud/gPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="54657240"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="54657240"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 03:53:43 -0800
X-CSE-ConnectionGUID: eNpOscwLRMenla1dotQRfg==
X-CSE-MsgGUID: LLQrDFU0Sf2bEO/ySeCFiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="90048227"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Nov 2024 03:53:42 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDjH9-0000pR-1W;
	Wed, 20 Nov 2024 11:53:39 +0000
Date: Wed, 20 Nov 2024 19:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] arch/x86/kernel/early-quirks.c:720:22:
 sparse: sparse: symbol 'zhaoxin_kh40000' was not declared. Should it be
 static?
Message-ID: <202411201915.hYUwc9VU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cce003012298a00277187319a2527882a18278c1
commit: 11557c1ae4529f133483879b7ee00b7d8c653be7 [1474/1474] x86/cpu/zhaoxin: Encapsulate access to kh40000_dma_direct_ops within function
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241120/202411201915.hYUwc9VU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411201915.hYUwc9VU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201915.hYUwc9VU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kernel/early-quirks.c:680:49: sparse: sparse: restricted pci_power_t degrades to integer
   arch/x86/kernel/early-quirks.c:686:57: sparse: sparse: restricted pci_power_t degrades to integer

vim +/zhaoxin_kh40000 +720 arch/x86/kernel/early-quirks.c

62187910b0fc7a Feng Tang 2014-04-24  719  
8eaba08b2d7271 leoliu-oc 2024-06-03 @720  bool __ro_after_init zhaoxin_kh40000;
8eaba08b2d7271 leoliu-oc 2024-06-03  721  

:::::: The code at line 720 was first introduced by commit
:::::: 8eaba08b2d72718a40cafe3402ab4f26b0dc62eb x86/cpu/zhaoxin: Encapsulate access to global variables within functions

:::::: TO: leoliu-oc <leoliu-oc@zhaoxin.com>
:::::: CC: leoliu-oc <leoliu-oc@zhaoxin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
