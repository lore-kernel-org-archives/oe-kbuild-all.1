Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640E625B0AA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Sep 2026 03:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790046056; cv=none; b=DnOzL9OACXj4yi4A3LPT507QzjdFNUQyQ4BbYebz1Zyx6Snd/WqX4JjrzTlgPo2B1d6UljLU9rD01PKIGaOy9/pehyRACmz/y9xp/XVV97AUGjMffUXC1REkas4k0Dg9Q2BoMhgdo4apD6trt5KXPUxFZx9ustmJ8BdDEjXtbv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790046056; c=relaxed/simple;
	bh=1ZU0+X1d2cywrx86Fqj9z6rYYmAHzboHymdOUv/toEQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=llL20hq0Y/ZNbzenaFK/rDDm5D0cKuA/UxSUyRlthtl0gajj+5XnyGrp6VJ+snY5TTmPGzRGNZ+6jBMdGO0zUPSooPvzlRbx/pprbhfS61lfpxdGS4bll6w8MKO/KyLAKkf69IB/GV7zWiA64OAUCaodrvwS5KDQnlffAZjAafs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcEl7JVg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcEl7JVg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790046055; x=1821582055;
  h=date:from:to:cc:subject:message-id;
  bh=1ZU0+X1d2cywrx86Fqj9z6rYYmAHzboHymdOUv/toEQ=;
  b=bcEl7JVgQRoZDY0t0xnwAmXr0GbiPwHG7XJfjTtgJEX9Qw+36QDeTEB+
   voWreq8YzYkQVPntTTJwtWxxw3IuBwI30rvTB1Hs+SoWDjMYbw1EaiK2I
   IC5qGrJRmHVkpNSg1A4xgBOtoSrBXAmbXYQ0ojz6Rl2V3o4KQ4Wr6nAfX
   zrKIJmVOWseDZu5UrJ+BQ5joQ7kteBipHK3OeGriwucd48YJEJQ5KDh0W
   JMF8IKmDc8h6jIaHjLmgseLfBfJakBB8KNcC5FC9hcW/6FLARzoJ8rruJ
   kuAm/GrorLjp6t3/pEClIyzsPrQDKILLsKKquPT2kWsWgWNezooef8Z5P
   A==;
X-CSE-ConnectionGUID: rGWBtMFlQDic+XOSbvIb5w==
X-CSE-MsgGUID: mRc51Qo8S0+uhFNQWWPUlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="94441426"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="94441426"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 20:00:54 -0700
X-CSE-ConnectionGUID: w3K8kQykSn6giFZIW09LUQ==
X-CSE-MsgGUID: PcWx9JMgSc26dEcK7XGPog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="277716378"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Sep 2026 20:00:51 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8qkS-00000000EqH-2dIM;
	Tue, 22 Sep 2026 03:00:48 +0000
Date: Tue, 22 Sep 2026 10:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Lucero <alucerop@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dave Jiang <dave.jiang@intel.com>
Subject: efx_cxl.c:undefined reference to `devm_cxl_probe_mem'
Message-ID: <202609221035.8i5jprQK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: 0418860ef2ca8ab4e696ce3913fd76660c881c0e sfc: obtain and map cxl range using devm_cxl_probe_mem
date:   3 months ago
config: powerpc64-randconfig-1000-20260922 (https://download.01.org/0day-ci/archive/20260922/202609221035.8i5jprQK-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221035.8i5jprQK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0418860ef2ca ("sfc: obtain and map cxl range using devm_cxl_probe_mem")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609221035.8i5jprQK-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: drivers/net/ethernet/sfc/efx_cxl.o: in function `efx_cxl_init':
>> efx_cxl.c:(.text+0x100): undefined reference to `devm_cxl_probe_mem'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
