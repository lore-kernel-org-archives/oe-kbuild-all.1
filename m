Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E60121930B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 21:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744839115; cv=none; b=dvfkGabqpyBQu8eJJq5+jWtBYk2020iCrmbRhIqFvBnKJTitxENspmBvYPonifWPYyHNy2bMJPeqtde8y8Qu+lqTMAakdudsnFcyduVsppYTBqpSyyo2IHahJSNrLw0ECyR94guUQKWWgARUBpWjqLBc24rft7CEn0xCxNfNAS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744839115; c=relaxed/simple;
	bh=LmdW2t+M323QlfUmbribNM+W/9/z9IWVt/IEbTPQnXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cC1PKCseNPpRC+3SVAaBSiEYLKvD023KfIG5auW4dlQgx/Ibcqm+3WG+sOScGDxoyQqbQCbSL/i6xo4YjfBP8PHPTgAIGxd6GaAKRo2bEVhRhSEsm79uI6IxC3C+wYEOj/ehUok1wzHaOZ1xfPN2wilfnrXYKAziz8vsVndetlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ioo1U8aZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ioo1U8aZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744839113; x=1776375113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LmdW2t+M323QlfUmbribNM+W/9/z9IWVt/IEbTPQnXs=;
  b=Ioo1U8aZ5qdIBQNlFe/QsbnmX79/HXkWEzOFn6APQITdRqSP3/vuP/NH
   1i23LKh/XGsUTFCYtRWIFH72CIyDY/rQpGZJcYl5aIBstJjP71Lms0Jvl
   mvZ0fyZ47+gUJQNVa5XsXYu/KtyR+FkG0nJj7362WHYqWsjhNZpos2juA
   Jv+pk7SJu3POeaT8wvgt1Vs2R/kRCEzKMOoSxJT2pCqwpUHiXhZ0lsg93
   6xi4yUBr6HwD4liOnUzI89e21GldYWrisYXS2JA0I/zBysd15quhw4HZH
   je/njBPaLfD219Z+ZdbMWZ6+pwBTo4MDNdwEiX0R46ulRoNFEFXJruUGk
   A==;
X-CSE-ConnectionGUID: f9FACRjwTuiva/qi8PFIug==
X-CSE-MsgGUID: lyajGboNShOvZwMRJnIpMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="56588951"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="56588951"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 14:31:52 -0700
X-CSE-ConnectionGUID: dR51iEJaSoioqqMwqIciOA==
X-CSE-MsgGUID: wt0jXpewRfOpO0/Rbhpj9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="167790596"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Apr 2025 14:31:50 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5AMG-000KKg-1T;
	Wed, 16 Apr 2025 21:31:48 +0000
Date: Thu, 17 Apr 2025 05:31:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.15-rc1-next-next-inband 24/24] kismet: WARNING: unmet
 direct dependencies detected for IGB when selected by ZII_RAP
Message-ID: <202504170536.gZQ8Fmcs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.15-rc1-next-next-inband
head:   9e2d85243a79cbf10ea6538b605260e3199fda1a
commit: 9e2d85243a79cbf10ea6538b605260e3199fda1a [24/24] platform/x86: Add Zodiac Radio Access Point platform driver
config: x86_64-kismet-CONFIG_IGB-CONFIG_ZII_RAP-0-0 (https://download.01.org/0day-ci/archive/20250417/202504170536.gZQ8Fmcs-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250417/202504170536.gZQ8Fmcs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170536.gZQ8Fmcs-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IGB when selected by ZII_RAP
   WARNING: unmet direct dependencies detected for NET_DSA
     Depends on [n]: NET [=y] && (BRIDGE [=n] || BRIDGE [=n]=n [=n]) && (HSR [=y] || HSR [=y]=n [=n]) && INET [=y] && NETDEVICES [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for IGB
     Depends on [n]: NETDEVICES [=n] && ETHERNET [=n] && NET_VENDOR_INTEL [=n] && PCI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for NET_DSA_MV88E6XXX
     Depends on [n]: NETDEVICES [=n] && NET_DSA [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for PHYLIB
     Depends on [n]: NETDEVICES [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for MDIO_BITBANG
     Depends on [n]: NETDEVICES [=n] && MDIO_DEVICE [=n] && MDIO_BUS [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for MARVELL_PHY
     Depends on [n]: NETDEVICES [=n] && PHYLIB [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for MDIO_GPIO
     Depends on [n]: NETDEVICES [=n] && MDIO_DEVICE [=n] && MDIO_BUS [=n] && MDIO_BITBANG [=y] && (GPIOLIB [=y] || COMPILE_TEST [=n])
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
