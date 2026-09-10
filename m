Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8DB4AB1D9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054779; cv=none; b=Oc42o02LDap1t131i1LAbKA1Xs1G6wFXl7/09nJ0S1F8ph7aOPMYFK2cRUATUjm1zwKIcSOHVKQiSpZQaipL4+yRuzXkGU3nqRiyCV1VbyLxqB1aOmCjO/ijac24HIpY+qZiVs1Ikw7iuPAotuYcGF5F1HvWDQq//WSZ8u/lM9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054779; c=relaxed/simple;
	bh=NIKZz5V50Zpqw+jem8f0Faa9stHpJMtHPcZ+KE4ygWo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VqCLeB/021Ff0yWnsodrdvgLPEPhT5FLeL2mTyvwJH+syrYblDhePdXCiPGztrjhfVPb4J9LG9g3dBdYk1EBbYZo6+hq61ysgKkFqsOo0OYFZHw+TzXPDO1Hz8V4VDPnPkuT1XpaDDqy4MR4g80qRNcVX+jiv1MlLPAnGKzxRjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGa5IMKh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGa5IMKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054777; x=1820590777;
  h=date:from:to:cc:subject:message-id;
  bh=NIKZz5V50Zpqw+jem8f0Faa9stHpJMtHPcZ+KE4ygWo=;
  b=GGa5IMKhAysZQzdqSApnlJUc5YeHua238iHtDDknJGufJa7xUlPb2Fv7
   vDIO7WINPMXZE8mJ4t06zlpdXOu3Nb9/reSG7rwCI4yLKQ4Cu1nJS4All
   YmaKhQ0CBvTXYRaTl1amy0+dhjO7j8/NxJaBIaUcikhZAlpiTpH+4VzfW
   Q4SEWuunIWIzaDv3hon94i/JVJ4NHtGVJrzTV5Vh6pDEOMvN4G14CI5vh
   BagMqpg2QboViYsmtlzSLXC5xcNa4kkcnw7Y5p1Hij3kG0gZP435oQ1L0
   ggIb/BSv4en0fLc/uwe5aVzwNbT+haOAdTdw9qaWvq6lNCVeF5CpHKTGt
   w==;
X-CSE-ConnectionGUID: Erbe+q+uTMOnlJg+MNnHuA==
X-CSE-MsgGUID: 4/3hmV53Q8qnWVEqj9tXZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89271590"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89271590"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:39:32 -0700
X-CSE-ConnectionGUID: 1EQtcK2gQXuaoioe7z9kKg==
X-CSE-MsgGUID: itVuushlQW6p0SF4QdUaLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="267395193"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2026 08:39:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gs4-000000000Pz-3hPg;
	Thu, 10 Sep 2026 15:39:28 +0000
Date: Thu, 10 Sep 2026 17:39:13 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 213/213] kismet: WARNING:
 unmet direct dependencies detected for FWNODE_PCS when selected by PCS_AIROHA
Message-ID: <202609091704.76F8BBxk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   e2b8c6a7a01daa29f0109ecfd5d0fa93e27da8bf
commit: eb8a2e426e129ae588cac53b3d3b272abeaa6216 [213/213] net: pcs: airoha: add PCS driver for Airoha SoC
config: sparc-kismet-CONFIG_FWNODE_PCS-CONFIG_PCS_AIROHA-0-0 (https://download.01.org/0day-ci/archive/20260909/202609091704.76F8BBxk-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260909/202609091704.76F8BBxk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609091704.76F8BBxk-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FWNODE_PCS when selected by PCS_AIROHA
   WARNING: unmet direct dependencies detected for FWNODE_PCS
     Depends on [n]: NETDEVICES [=y] && (ACPI || OF [=y]) && PHYLINK [=n]
     Selected by [y]:
     - PCS_AIROHA [=y] && NETDEVICES [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
