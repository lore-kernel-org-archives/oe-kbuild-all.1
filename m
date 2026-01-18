Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B1C2DA779
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 23:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768778073; cv=none; b=l5oX8cCDXyM3R6khQrmOK0p9y9mwYM98SY7eWRotFKsl1+z6SdHroz3x+mEq3IoYXmcGyKnYSTSfM2m5321RyOc67S5V1Jhd2ffbJEbA2qwnk+zr+DVUpJJJxl7o71EQquXSHB+0NoKo0wioZE3mWLNKxX5KZaubr+7kD3HaLcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768778073; c=relaxed/simple;
	bh=u3DXBPVyBK6NZpcF8rn4Ok8RvppFuIXTzxk1EKaurRM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TLU78yT8yrW/tNlT+GiI88IM6LV3ZvVpOaxDvYl+RV95i1lvBovH/S4dE8VyLY6ejB40So+VkvQfTqydOFiYUy8CXdWOpD6Sed31Li9RRyllvQpu2lqGHr7yoUiAbvARbcNCNA6Y4x6iKY6btByybaS8TcrXKc53nvd/Rko2h1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYt6q2UK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYt6q2UK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768778068; x=1800314068;
  h=date:from:to:cc:subject:message-id;
  bh=u3DXBPVyBK6NZpcF8rn4Ok8RvppFuIXTzxk1EKaurRM=;
  b=YYt6q2UKOxWWCA48JF44MvmKoTHMLnVLto283C7/x0BrrPdnH5mQTERW
   dLd1WbrkDhBcgBUaPbyYo/XIdWsGW0aCQTxEPCNl7F8b2G3xnBL0Gc9fF
   R1jmJvZ2WcEPyslfRykeWvWm//oo3Z2qZJHnJV8OyowPSRNFTuk73yki4
   T4Fuxsx4gwnkXT8CcdAfLdJglqE/vXVvZjHzLa15zCzNqiBwf3KwMOvSA
   J37M6jdfrat/ZF5nIdxOyRGVSm6KtL+hClUhbYcG0YiJuv1Dg9Sv7xLBW
   OX7kdzM5lH/AR0IIe0Qv0DYv0pmjHPsWCw+44RIleeYx/VMD206NvTtRO
   g==;
X-CSE-ConnectionGUID: BySCS3aFTrGgA1rsTVnDTA==
X-CSE-MsgGUID: OlAaFAACRWe2wbFxuUgGCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69905330"
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="69905330"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 15:14:27 -0800
X-CSE-ConnectionGUID: DhxRIYknTxSYFNmDPcYqWg==
X-CSE-MsgGUID: FAc6myWTQlawKP/+qkXXFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="204868913"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jan 2026 15:14:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhbyS-00000000NHZ-18jK;
	Sun, 18 Jan 2026 23:14:24 +0000
Date: Mon, 19 Jan 2026 07:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 1612/6849]
 sound/soc/codecs/tas2783-sdw.c:1171:34: error: 'pci_bus_type' undeclared; did
 you mean 'ac97_bus_type'?
Message-ID: <202601190756.IpoMY5AJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: 2bc4b4f77cb70df3ef05b80d0cb19edba17f04a6 [1612/6849] ASoc: tas2783A: fw name based on system details
config: i386-buildonly-randconfig-003-20260119 (https://download.01.org/0day-ci/archive/20260119/202601190756.IpoMY5AJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601190756.IpoMY5AJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601190756.IpoMY5AJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/tas2783-sdw.c: In function 'tas_get_pci_dev':
>> sound/soc/codecs/tas2783-sdw.c:1171:34: error: 'pci_bus_type' undeclared (first use in this function); did you mean 'ac97_bus_type'?
    1171 |                 if (dev->bus == &pci_bus_type)
         |                                  ^~~~~~~~~~~~
         |                                  ac97_bus_type
   sound/soc/codecs/tas2783-sdw.c:1171:34: note: each undeclared identifier is reported only once for each function it appears in

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]


vim +1171 sound/soc/codecs/tas2783-sdw.c

  1165	
  1166	static struct pci_dev *tas_get_pci_dev(struct sdw_slave *peripheral)
  1167	{
  1168		struct device *dev = &peripheral->dev;
  1169	
  1170		for (; dev; dev = dev->parent)
> 1171			if (dev->bus == &pci_bus_type)
  1172				return to_pci_dev(dev);
  1173	
  1174		return NULL;
  1175	}
  1176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
