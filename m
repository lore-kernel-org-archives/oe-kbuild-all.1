Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC96EBA53
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 04:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732337170; cv=none; b=G3+MtglOc5+CM6teU/3lr2bCYpx6bUnY/CUW4dzGatklmu2ALBKRqEhhQBeruzSjxzuHQhPSNUT3yAdMRveaqj233WTcIGW4gsHOWlgN2ku8go0v4DOF7ypSCe0avDA14Py/wesnYdtUmcfprtSkFFFLRbvOaXrIAbgboloFbCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732337170; c=relaxed/simple;
	bh=ljyiqI+WW7ShmpAAAqVuZSIOZQaEWFfYcm45VkunNPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m7yfgHInvGfN/Kpomw+edryLF39zkk6FGKKSNSfrCu5AqmPYFpS5FpMS+/aYp3MGlKrXBz1QJonDo5vdm4JWQn+Jy/EJASciD46Bzg3jBnkJsnQDeeJlokUM1+XxEcjWIZFe1aBvb0QwoouY04FSYT6giOdh6HnEjQNN6+qufYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMXz/nER; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMXz/nER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732337169; x=1763873169;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ljyiqI+WW7ShmpAAAqVuZSIOZQaEWFfYcm45VkunNPU=;
  b=cMXz/nER3GJ+hMiWnKsqwQL/KrOJJjKe8/5fdQVeHMHNrQDD2zTjhWE7
   wndZwP+6zF/zc9mKEQ/4UMyT3wXJ2NgZnQBBR795Dso84HWC4KOknhCPo
   oRz0BSreZXcg6HVOkVJu8Mg9EUdwuF0HGwJ6rEHHOmzY6qSDoZFDZ427f
   ydOK2PFzqyJHxjEWT+RXHvDDbKFwGkIJDuOpRZPNcKXC4896FwSP6tL1z
   xHZ9+JwyWzcnfVSU3LplfTe58g9cnmR+NvrwWJ8HA+mal/Hatl3t6E4a0
   TluEaV1EzsejLCULDerOD0XYC0ylvt7wkpt4aWBJQLJc6W+46Jjop0UMH
   g==;
X-CSE-ConnectionGUID: jCCCgtQtQcek2Yj3nusIBQ==
X-CSE-MsgGUID: 4u6fzwwNSq6IkKcY4vpXrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="49920490"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="49920490"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 20:46:08 -0800
X-CSE-ConnectionGUID: QDvU6EV6SrKDeOoLC1AHQw==
X-CSE-MsgGUID: aCpBVTbHQyCUws91Z4xj3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="90675781"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Nov 2024 20:46:08 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEi21-0004R9-06;
	Sat, 23 Nov 2024 04:46:05 +0000
Date: Sat, 23 Nov 2024 12:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?unknown-8bit?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 7/111] sound/soc/codecs/tas2764.c:783:34:
 warning: 'tas2764_of_match' defined but not used
Message-ID: <202411231203.q4KT7sG5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   b02ae8e18297a2240eb9166ee35f0b227ddd407b
commit: 1a8e1a3a0c6d4aa5bafc4b4bd26cd57c01192b7a [7/111] ASoC: tas2764: Extend driver to SN012776
config: x86_64-buildonly-randconfig-001-20241123 (https://download.01.org/0day-ci/archive/20241123/202411231203.q4KT7sG5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231203.q4KT7sG5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231203.q4KT7sG5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/tas2764.c:783:34: warning: 'tas2764_of_match' defined but not used [-Wunused-const-variable=]
     783 | static const struct of_device_id tas2764_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~


vim +/tas2764_of_match +783 sound/soc/codecs/tas2764.c

827ed8a0fa50bd Dan Murphy     2020-10-07  782  
827ed8a0fa50bd Dan Murphy     2020-10-07 @783  static const struct of_device_id tas2764_of_match[] = {
1a8e1a3a0c6d4a Martin Povišer 2022-03-11  784  	{ .compatible = "ti,tas2764",  },
1a8e1a3a0c6d4a Martin Povišer 2022-03-11  785  	{ .compatible = "ti,sn012776", },
827ed8a0fa50bd Dan Murphy     2020-10-07  786  	{},
827ed8a0fa50bd Dan Murphy     2020-10-07  787  };
827ed8a0fa50bd Dan Murphy     2020-10-07  788  MODULE_DEVICE_TABLE(of, tas2764_of_match);
827ed8a0fa50bd Dan Murphy     2020-10-07  789  

:::::: The code at line 783 was first introduced by commit
:::::: 827ed8a0fa50bdd365c9f4c9f6ef561ca7032e49 ASoC: tas2764: Add the driver for the TAS2764

:::::: TO: Dan Murphy <dmurphy@ti.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
