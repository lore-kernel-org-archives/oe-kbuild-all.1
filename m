Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C99625
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Apr 2024 02:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713580824; cv=none; b=l3NbtmJvlF5mKREsQ8QClpGEFiE9/MJLYyeMP2Ega68Lwcc9NuIQ6s8VKgrUI4bEuE59mm2kMVvkNc+wcEYu8o9b1hcjCvMuZKrgkoY9t3Wk07FNp5vmT/8htnEq8J2Kj1OsMsfAfeIQq51hZu3/aGWXRAMkhhD6cID/zOBjQYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713580824; c=relaxed/simple;
	bh=JR8K+sKrv3jAnvvXYeuOwy6Am6lqs8QLgYt4lR5Vy3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jgFwhiH9TiHCT5HN++hwC6694d4eM+h0Ybwox/4Yyfp64aFABd8L/oqkMREBIyRoXI4JbHRBac+L2zteFAf9Z57+m5acDkaqImS5QWwBUTNAM8aR9lgRoaj/Aijg9aSDh4/ixQQ6Q0fRg7V0l6b+JdQQYoNiSki5bbTLXoa0QGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAs80Wgm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAs80Wgm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713580821; x=1745116821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JR8K+sKrv3jAnvvXYeuOwy6Am6lqs8QLgYt4lR5Vy3E=;
  b=KAs80WgmG1P7CLWAFg+YG1NQU2Yubtobdq0jBOAwG+5Jsd7fJN3tGuKZ
   oNOYWDPZak4oPszMM40TwusDs2JMROtiVQs8bqnteKS2KRGdkP11h5uWT
   fm33kHLR1WN5WnlyvKZSg73+qj+HpYsPBOnJj1kzUDPLvZhcFj4NiDF+r
   Nv1kj8nLbajTbMjtUJPXpSPhEwdLpFQLK1CZFb9RJANCEnrM9bKKkgDjd
   fAF4az0LWF9eu1lvTdPpyXmmo5IZN+xgdMBqYEyVDZyPyZjbpfKl/shDh
   LTgju/L5bkTYLrqsfk6+hAPoAPXsVK0gRZ9gzTcm3q0mPK+j0UtUFBTKd
   A==;
X-CSE-ConnectionGUID: vnsUtW9QQEmf0gAPMBvSOA==
X-CSE-MsgGUID: qUDDQ4CwSjieV9VkOQOVmA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="26718421"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="26718421"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 19:40:20 -0700
X-CSE-ConnectionGUID: YRlxpXtoS4ORORm1YnhB3w==
X-CSE-MsgGUID: /5gKXhN0QrGh9ElXQvtZig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="24011173"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 19 Apr 2024 19:40:19 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ry0eG-000Afs-20;
	Sat, 20 Apr 2024 02:40:16 +0000
Date: Sat, 20 Apr 2024 10:39:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Kory Maincent (Dent Project)" <kory.maincent@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Subject: [net-next:main 19/25] undefined reference to `rdev_get_drvdata'
Message-ID: <202404201020.mqX2IOu7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git main
head:   4cad4efa6eb209cea88175e545020de55fe3c737
commit: d83e13761d5b0568376963729abcccf6de5a43ba [19/25] net: pse-pd: Use regulator framework within PSE framework
config: parisc-randconfig-001-20240419 (https://download.01.org/0day-ci/archive/20240420/202404201020.mqX2IOu7-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404201020.mqX2IOu7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404201020.mqX2IOu7-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/net/pse-pd/pse_core.o: in function `pse_pi_is_enabled':
>> (.text+0x1e0): undefined reference to `rdev_get_drvdata'
>> hppa-linux-ld: (.text+0x1fc): undefined reference to `rdev_get_id'
   hppa-linux-ld: drivers/net/pse-pd/pse_core.o: in function `pse_pi_disable':
   (.text+0x2a4): undefined reference to `rdev_get_drvdata'
   hppa-linux-ld: (.text+0x2c0): undefined reference to `rdev_get_id'
   hppa-linux-ld: drivers/net/pse-pd/pse_core.o: in function `pse_pi_enable':
   (.text+0x388): undefined reference to `rdev_get_drvdata'
   hppa-linux-ld: (.text+0x3a4): undefined reference to `rdev_get_id'
   hppa-linux-ld: drivers/net/pse-pd/pse_core.o: in function `pse_controller_register.part.0':
>> (.text+0xd28): undefined reference to `devm_regulator_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
