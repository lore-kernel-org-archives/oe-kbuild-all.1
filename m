Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5364A2A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 19:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710012700; cv=none; b=TC02GfvC53kUlvkCmPRiu8caZQNM3ZnAsjcGGsGlUayi4/5Vnu60RK4Rc7hVT+lN6iOPVRYowQLMlmF86rmkvzin+6De/3e0IAhQ1i3Q66IXbWoWGDZr3KFDYm0GwEv+FwihYeEBnxUjO8lhDvQHcoYMkljM20qFRELS89TXp6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710012700; c=relaxed/simple;
	bh=5Xo2SJPNJfCUtSp5MmZxKMQWzDqhN3Wryme0gO5miqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hVqQBav0SwU0GbVduxY4/+g80cvKit0p/Oa5fzFk0nlCHeXr/C2+TWOfFT1DOO4ATTcaD5IZauZBHSkDq3pNh1hd/5G/5cNkfS9wJv7Kut7mIYcsJ4pHPyhNwPs+dV2gufAKAseU4Qnyo07O5zGtKYbb2QCXqXvdgQc2FQBWtYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQydpNmB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQydpNmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710012699; x=1741548699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Xo2SJPNJfCUtSp5MmZxKMQWzDqhN3Wryme0gO5miqU=;
  b=OQydpNmBFnk/8q5/sb5a37DYZEzs2K51657YSr7g0DJ4RRbI9q0z8JgO
   azl0R0PYaTuKmoG8DRlIkjiX6+gWPRU7VwfOUvTRSbe5EWzDzQKBGASY3
   hlx0oa1ctzOPnVJ02pY/8itt+DJlyNqkKPGGKL6vnObrN0TmvzosE3wzC
   3xXrILOZeTqeG9F9whN/P9q7+Fo5hA1ydhihJuhkP0SAiovLJY42bNc4r
   093OylvSVk8Fkg9vYc16Np+EsEnKcHMzyW1EBx4FrFjNkVyulnMMJOv6M
   KpIMzqrWaoAmFt07nO2OLoQ9Y9PVD+m3WYrZYT4W8z0kuAZC12F89xiyI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="7671354"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="7671354"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 11:31:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="48231131"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Mar 2024 11:31:36 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj2Pu-0007bb-08;
	Sat, 09 Mar 2024 19:31:34 +0000
Date: Sun, 10 Mar 2024 03:31:11 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Adam Ford <aford173@gmail.com>
Subject: [pinchartl:nxp/v6.8/compulab 10/20] sh4-linux-ld:
 phy-fsl-samsung-hdmi.c:undefined reference to `of_clk_add_provider'
Message-ID: <202403100351.AEy18IlC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git nxp/v6.8/compulab
head:   baaf6f492f51fcffbad4ab0e8d43731d2f3b43b2
commit: 010f4175dffe95ebabb2078b34ea802d0db1df65 [10/20] phy: freescale: add Samsung HDMI PHY
config: sh-randconfig-r063-20240309 (https://download.01.org/0day-ci/archive/20240310/202403100351.AEy18IlC-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403100351.AEy18IlC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403100351.AEy18IlC-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/phy/freescale/phy-fsl-samsung-hdmi.o: in function `fsl_samsung_hdmi_phy_remove':
   phy-fsl-samsung-hdmi.c:(.text+0xd0): undefined reference to `of_clk_del_provider'
   sh4-linux-ld: drivers/phy/freescale/phy-fsl-samsung-hdmi.o: in function `fsl_samsung_hdmi_phy_probe':
   phy-fsl-samsung-hdmi.c:(.text+0x2ec): undefined reference to `__clk_get_name'
   sh4-linux-ld: phy-fsl-samsung-hdmi.c:(.text+0x2f8): undefined reference to `devm_clk_register'
>> sh4-linux-ld: phy-fsl-samsung-hdmi.c:(.text+0x2fc): undefined reference to `of_clk_add_provider'
>> sh4-linux-ld: phy-fsl-samsung-hdmi.c:(.text+0x300): undefined reference to `of_clk_src_simple_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
