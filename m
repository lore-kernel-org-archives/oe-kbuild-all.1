Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0E73FD960
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 20:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505591; cv=none; b=ik7a/4OszpnxAhPLMQ1NUDAgBaGeoGhH3cy9nMSQHzS8bv2BGH9E9GchJeWczMDXUeP0k+fe2eaWpK5KOrs9XmHCd9smpZdCiSMIGxNe6thZsrHxeVbpHoDN95NxkFXkGh2FXMzL4AMiT7hml3oAxlGjyT45blsYi+T1qzTTtMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505591; c=relaxed/simple;
	bh=LIJwXIW0JVrY91CwlEc6HBl7mIA4XtMaH9X5IOxcMR8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YfcA1l0Zsndi13WI7vzHIA+ux4yNHJuXCAdmwVvR4PW7XptQhHbLAuVjOKjfAomDVTJVbklL9JTo+TKtv9At8kdqOs5ABcAOMK3e49dRfx74fj3uhFd+qoeXJvk1WIDWIhrBe3ZIbdzMtKli3n+cMOQ1Bd7B3x2Qa/RR9WqRSg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avipu92q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avipu92q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789505589; x=1821041589;
  h=date:from:to:cc:subject:message-id;
  bh=LIJwXIW0JVrY91CwlEc6HBl7mIA4XtMaH9X5IOxcMR8=;
  b=avipu92qvqpV0xbHdSq7Qptjg0YhCSfyEvd5afPJTRgNtQjb6Kx4zlws
   Q/aLu45crvgrrYpPeBzTohc3jFrQuJYgvRXtpl0qFxMMKZLFceJiTWqbv
   WPnxuSmqeYMd73RxCO69Wi2u7LrNWe+dTdO6pRinID2hygI4C6R6OldVM
   q6e9nV1v5NIQ304XlNVvpHZC/ta81YmCGYFmhIHiGS6vyHDVlg88+Simt
   x+LJ58mlcdv0agi/AnM9l3bW74l/yk6lsJoFH1ATwJa5TM9zJJnmg7Fm9
   molooIXRAyj3fP7QsWc1YDzhqPPfPt82EaViSePhh1wKfVpzm9GAvboyD
   A==;
X-CSE-ConnectionGUID: TeC3/C/KTca5+iLLrWsF0w==
X-CSE-MsgGUID: ZTH3/8SoTVSbha5sha/E6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100480484"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100480484"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 13:53:09 -0700
X-CSE-ConnectionGUID: gGYkR41aRo2iqadG77RsJQ==
X-CSE-MsgGUID: tuZ7AdmHS9eFN4NIRY6XMQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Sep 2026 13:53:07 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6a9J-0000000053d-0Spy;
	Tue, 15 Sep 2026 20:53:05 +0000
Date: Wed, 16 Sep 2026 04:52:20 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [frank-li:imx/ele 3/7] drivers/firmware/imx/se_ctrl.c:490:1:
 sparse: sparse: symbol 'se_pm' was not declared. Should it be static?
Message-ID: <202609160436.jbMmOGw8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/ele
head:   211dcfe620fc1038ac5de521d170ea2390c15aea
commit: 400e503ecc6186f626535d0755892f55a2572122 [3/7] firmware: imx: add driver for NXP EdgeLock Enclave
config: sparc64-randconfig-r112-20260916 (https://download.01.org/0day-ci/archive/20260916/202609160436.jbMmOGw8-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160436.jbMmOGw8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160436.jbMmOGw8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/imx/se_ctrl.c:490:1: sparse: sparse: symbol 'se_pm' was not declared. Should it be static?

vim +/se_pm +490 drivers/firmware/imx/se_ctrl.c

   489	
 > 490	DEFINE_SIMPLE_DEV_PM_OPS(se_pm, se_suspend, se_resume);
   491	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
