Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054FF2222B4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Sep 2025 21:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758232027; cv=none; b=tpmcFT/AxwDT2qSNq3+ar0pLpr7AuZ4v+ONCMBkKUSISxhs240675Eb+WVsoL+InmaSfL7VsnyT6R4/amsiw0hSVQpIetftdgHgKtiWXJ00J6Fi52+iKk4Re713v6gtfUL1Xca48uqiKKp9QjaimA79KCWwNRPX7DTKcTKp9/ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758232027; c=relaxed/simple;
	bh=Ks99BZmC5KCDcgoGCGGsT267lTg3Lgdu3ya3GFyf1HA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JkTy2N1VvKN12T9XwSH7Haj1Ib/nJQr8tRFRJtQFkI1wf637TuOQ4m74JUvbr5oDDGvmGLsjcvJzjSUj9vn9nzFZ5az5XNvhRSCzb8sBmEWFkGgKLyJONx5eA12/PF4jqBv6q6T1TJ71zuhnbRRtO6WHe+swzFcmOJXBZozSYio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H82rdvW8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H82rdvW8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758232026; x=1789768026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ks99BZmC5KCDcgoGCGGsT267lTg3Lgdu3ya3GFyf1HA=;
  b=H82rdvW8v4rx9fXEL2am67Q0y7Uqe3821v/bSbG7c6B67EAuUxNsEskq
   RMO0uTG5ddsWHLk6Iju+ahASXDPgac3ewyCZGcnT7GmT1khdnnKzVNpj4
   B1FgzLqS46QqkQx8ocTi1hTRQh91OgxBM6Np59ZZqkY+Wbaqy48lzSUKW
   HjbmQd3PwzmZLH7PeBIxHYNgLziOehd7Kerx+dv3qf7BvCMWjyx2kq7gg
   T0PzNCWg/nP8MJZrY4fsed0sZOujtwnxorRtX0a54tM7ymVkBOcWaru4H
   TZmYizGLXnJp9soxWh84ReJJZfmYHlZ//5UiABU0iFs0qDRC2CrNZYpwn
   Q==;
X-CSE-ConnectionGUID: G24/kyKQRt2wkQzUe0itZg==
X-CSE-MsgGUID: uTBS3D7hQGqhPfmCoBchXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="78020268"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="78020268"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 14:47:06 -0700
X-CSE-ConnectionGUID: LdA21R51Sji+M+7p0FO4Jg==
X-CSE-MsgGUID: I2X+1NKoTwWs8Iy/nojzyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="176071046"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Sep 2025 14:47:04 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzMT0-0003lT-0g;
	Thu, 18 Sep 2025 21:47:02 +0000
Date: Fri, 19 Sep 2025 05:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 9394/10654]
 drivers/i3c/master/adi-i3c-master.c:134:25: warning: variable 'm' set but
 not used
Message-ID: <202509190505.fKGvEJRa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
commit: 3ab1da2614e616ea62f32e4d695f1cc449089f07 [9394/10654] i3c: master: adi: fix header location
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250919/202509190505.fKGvEJRa-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509190505.fKGvEJRa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509190505.fKGvEJRa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i3c/master/adi-i3c-master.c: In function 'adi_i3c_master_wr_to_tx_fifo':
>> drivers/i3c/master/adi-i3c-master.c:134:25: warning: variable 'm' set but not used [-Wunused-but-set-variable]
     134 |         unsigned int n, m;
         |                         ^


vim +/m +134 drivers/i3c/master/adi-i3c-master.c

a79ac2cdc91d6b Jorge Marques 2025-08-27  130  
a79ac2cdc91d6b Jorge Marques 2025-08-27  131  static void adi_i3c_master_wr_to_tx_fifo(struct adi_i3c_master *master,
a79ac2cdc91d6b Jorge Marques 2025-08-27  132  					 const u8 *buf, unsigned int nbytes)
a79ac2cdc91d6b Jorge Marques 2025-08-27  133  {
a79ac2cdc91d6b Jorge Marques 2025-08-27 @134  	unsigned int n, m;
a79ac2cdc91d6b Jorge Marques 2025-08-27  135  
a79ac2cdc91d6b Jorge Marques 2025-08-27  136  	n = readl(master->regs + REG_SDO_FIFO_ROOM);
a79ac2cdc91d6b Jorge Marques 2025-08-27  137  	m = min(n, nbytes);
a79ac2cdc91d6b Jorge Marques 2025-08-27  138  	i3c_writel_fifo(master->regs + REG_SDO_FIFO, buf, nbytes);
a79ac2cdc91d6b Jorge Marques 2025-08-27  139  }
a79ac2cdc91d6b Jorge Marques 2025-08-27  140  

:::::: The code at line 134 was first introduced by commit
:::::: a79ac2cdc91d6be3010f2e9a3b2a2ccfc26e2086 i3c: master: Add driver for Analog Devices I3C Controller IP

:::::: TO: Jorge Marques <jorge.marques@analog.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
