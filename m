Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F5C15BB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 05:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718170051; cv=none; b=N/qvpbS+uTTUxk93ire+5nGRnp5oFVhuyfSF6E8z9x9RduI6qxGIrZsff52s7fRtRNlzR57aJANI8eluZ7OPOXmX7qHRqhdlRjsVnioOiQPnBRxjuAgWS6uW57Rlpmhn+D5EfmwijpRQtICFh5bOHlki73N25fdf3HpehW/DkD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718170051; c=relaxed/simple;
	bh=nzIMqLfo96+DNezPUlrrGBSnJ6FLUQpmOxc4q9rqhiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KfoJXMcwDWP99uKWSC9AV6+7WCxgpfbYeHV4CCDXsWwsvHsM4FDaoMKXltHUf6sX9jCyExNyVnFQdpd7TaiyZVbRQ1DZLLcFlAUGu1Ht6TRo3Vr+QvkEqVooSZY1F6e9JrvBj73RfhL9+TwwWi2s1ueBn9Oxzl/AxxsquLq3QVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6nzdEet; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6nzdEet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718170050; x=1749706050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nzIMqLfo96+DNezPUlrrGBSnJ6FLUQpmOxc4q9rqhiI=;
  b=X6nzdEetwF9pNAgE5UyPfbEcH0TUdqEqU8AnMLbjqvn4KwbxClSk3lBk
   UNXVCbm39s5Bj7XK+CrCSMqJadhWqDddXztY7nBSJFkeEV9ys0W0BF/gZ
   pHXtqgW+V9SBN1kp4zfcBvaCgGvX/RYTIQQNbmMbWl6VN0JhJmtJuABU1
   G3CyYMjaY3FbLIJrRm1jFa4Rn1Mw4zSkVsKpm4vCRk34W2Rl9eYT3vYHQ
   etGNV+dB9Z2J2r3Fcc6K5/a8jTdAlxjcUrK3PeeiihYd+jPP9yE8/PwgA
   LIhTN0rltz5K9B9maMmTDHc1OpAGirCngCu0VXFA1sApJP5yrfocnnUN8
   A==;
X-CSE-ConnectionGUID: NHsvHzbkQeCnVTnGRqCr4Q==
X-CSE-MsgGUID: MpoBmgvDSqqLPioXxzLVPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14789298"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="14789298"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 22:27:29 -0700
X-CSE-ConnectionGUID: 7D43dPRMRa2DN4AtB0UiEA==
X-CSE-MsgGUID: KRbHJKptTj+6osCNO6bPXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="39781022"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2024 22:27:29 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHGW6-0001Eg-19;
	Wed, 12 Jun 2024 05:27:26 +0000
Date: Wed, 12 Jun 2024 13:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pcie-fix-series 7/10] kismet: WARNING: unmet direct
 dependencies detected for DMA_GLOBAL_POOL when selected by
 ERRATA_POLARFIRE_SOC_DMA_NON_COHERENT
Message-ID: <202406121347.BISKRW6p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pcie-fix-series
head:   91793dfd9508b4d9d7b2922cf1d76012848a7f58
commit: 22d0af9c87707432e9f6bd461486acd29e066110 [7/10] RISC-V: Add an MPFS erratum for PCIe
config: riscv-kismet-CONFIG_DMA_GLOBAL_POOL-CONFIG_ERRATA_POLARFIRE_SOC_DMA_NON_COHERENT-0-0 (https://download.01.org/0day-ci/archive/20240612/202406121347.BISKRW6p-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240612/202406121347.BISKRW6p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121347.BISKRW6p-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DMA_GLOBAL_POOL when selected by ERRATA_POLARFIRE_SOC_DMA_NON_COHERENT
   WARNING: unmet direct dependencies detected for DMA_GLOBAL_POOL
     Depends on [n]: !ARCH_HAS_DMA_SET_UNCACHED [=n] && !DMA_DIRECT_REMAP [=y]
     Selected by [y]:
     - ERRATA_POLARFIRE_SOC_DMA_NON_COHERENT [=y] && NONPORTABLE [=y] && ERRATA_MICROCHIP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
