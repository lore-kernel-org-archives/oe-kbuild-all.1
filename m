Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100FF1D47A2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743842883; cv=none; b=NoClyIR4jFJVCea9yp1cUAKadWHloF1kfh4lm1ArwnR9nhGvmtp22n7Xf8OIs2HXtIquIOHT6A4c+Z94N2m8OIArHsy+GKflwAXWTxL3Ao0/nZymX7dRrVjf8a03pCiFDQKehoOSH81TCcfDbtMgXqiZNT8iqnAO/otF7KnU1QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743842883; c=relaxed/simple;
	bh=oVTRKNU6NBgFKdrLJijNeQ8/JMkc77aiuN7SbAQEshc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=miYY0Bf+IlOvF2SpSj0Hj4dmbJ/LbpI7PsNRBblYTeDKAg9znvciXwcKm9gEfx9QwPueNyiLtMJBLiuR3lHo8GDfDgona415wuxOXSjz9iskoNoGhUY5qo7IS974H1+HRNB5+g6mLF/+nNEW5vcc2Wc8zfxFs1NCbvWdfVlhetw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXAbOAet; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXAbOAet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743842882; x=1775378882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oVTRKNU6NBgFKdrLJijNeQ8/JMkc77aiuN7SbAQEshc=;
  b=LXAbOAetgOdrOy58w04et/zfKxkBI5WYJIMQjlgH5mWbs03FuxEh4YEs
   hTxuXMkMUK82nnixKT+diaPAb7MQf06OEN+JsqdWiavvD7Y2z0qznpekq
   KIQhmxKyRxPJE3SQPLBxfCT6jj9JC3qSFGyKvwmPFLeLbgkk67WXRg7Ek
   f7a35k6sdtkXD9+PdiLO05oiTix/m+GLWxRFBhJQafAzeycWFHiOX+bYB
   UvPrpk6MRNKxpOMehu4M8i+8UdN1dT1WOMIjDZkiq9neLl575maeMDqGS
   J8Xa5ny6DWZKq9RROwNRDhDP50hBLopIkYpfODbLC87DNO+FiKMgk90Jg
   A==;
X-CSE-ConnectionGUID: N1AZY0mGSQKeLX/serBfrQ==
X-CSE-MsgGUID: MmKdAvQuTbaHfRc69LSGRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45377144"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="45377144"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 01:48:02 -0700
X-CSE-ConnectionGUID: Rt8BRf46TneCynwZNyOYcQ==
X-CSE-MsgGUID: RmA9L3glQweMEAWbQhLpDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="128004754"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Apr 2025 01:48:00 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0zC2-0001ud-16;
	Sat, 05 Apr 2025 08:47:58 +0000
Date: Sat, 5 Apr 2025 16:47:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 6/6] ld.lld: error: undefined
 symbol: __aeabi_uldivmod
Message-ID: <202504051635.dc2iLN2l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mohan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   aeb2c9cc1c66ef1baed03766392396ef8e5c9d3d
commit: 68811c928f88828f188656dd3c9c184eeec2ce86 [6/6] dmaengine: tegra210-adma: Support channel page
config: arm-randconfig-004-20250405 (https://download.01.org/0day-ci/archive/20250405/202504051635.dc2iLN2l-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051635.dc2iLN2l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051635.dc2iLN2l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __aeabi_uldivmod
   >>> referenced by tegra210-adma.c
   >>>               drivers/dma/tegra210-adma.o:(tegra_adma_probe) in archive vmlinux.a
   >>> did you mean: __aeabi_uidivmod
   >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
