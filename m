Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB891D61BC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 14:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324019; cv=none; b=AUvkTdyUPJYvuFvbVX/GBjX03iqqFOE9HvIIExu3vTDPkx8IcyfnJqJU0cT6RSwFIFd3ZaQUm/T7WkNW9zEMpvIoVJWdjBzzoFRfj5mAf4M9RyNswpelCwj6OJQlnautyFjWf8wBQO8vL+Y7TnHkMMt21s+kuzOAdAO2IoL/JI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324019; c=relaxed/simple;
	bh=pYjl9sZsnnIncf6MLR611KZ7SOqO7OCYZ8b02IogkQY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q3O3X8TSDQp6Xaej1hQ4MtCjstnx3BH4/eYMB+26j/wcmgY423HwmrLWkThD79LTyvMmVNkbZjRXAoxG8svARUzXSnI/LuS1to5P2IlHjclPCDo6mukeJAYIdBEGm/4bw5lP8OCklEbmE6mbtW0UjHZY5d3b8P4uDwHK1My79n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kl2WFbx5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kl2WFbx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780324018; x=1811860018;
  h=date:from:to:cc:subject:message-id;
  bh=pYjl9sZsnnIncf6MLR611KZ7SOqO7OCYZ8b02IogkQY=;
  b=kl2WFbx5wtoguyajSp+vg75ptkamkaQgPr8v6x4f50ZZ5cZgpeSvAdUA
   CX026cCwmefRSyFL+nu58hl2zHGQBcIvcFuBzaOS5rlZMIVQJz2Xt09S+
   GdY0c9SJzvGzYhIh8hqkOuVMyy4V7GocwT55e3z16V0osCiJ5CY8X+iFI
   ubL5Sb9mKqZK/zH4S6MqRn7BKF2SXdDeSy+20jMMDidTvxZizWNDr7wfr
   PSRoMhOFOaadppAAG7Dy7UvLGNIizVtgoTGzVVQXD+cu3aXG/if46XX7N
   iVw5Ms+hM9upWDsw9NKJ5ITf89PDb9uU5DQUR8acWM51yBhJ2BczZE+EV
   w==;
X-CSE-ConnectionGUID: oTdcGAplRlmovWdV0ZIv5w==
X-CSE-MsgGUID: zRm/dsMoTuSoUN10kmepFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="98498571"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="98498571"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:26:57 -0700
X-CSE-ConnectionGUID: hKG18GCWSV6SzmLrb/+KiA==
X-CSE-MsgGUID: hQtpO6heRy2SgEn66+GAeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="267228566"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jun 2026 07:26:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU3bR-00000000Aes-0pv2;
	Mon, 01 Jun 2026 14:26:53 +0000
Date: Mon, 01 Jun 2026 22:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: drivers/mmc/host/mxcmmc.c:545:24: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202606012253.GJ9WoBvW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: 7cd8db0fb0b2bf309163d56fec585c0f9e0964d1 mmc: add COMPILE_TEST to multiple drivers
date:   9 months ago
config: m68k-randconfig-r111-20260601 (https://download.01.org/0day-ci/archive/20260601/202606012253.GJ9WoBvW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606012253.GJ9WoBvW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7cd8db0fb0b2 ("mmc: add COMPILE_TEST to multiple drivers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606012253.GJ9WoBvW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mmc/host/mxcmmc.c:545:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/mmc/host/mxcmmc.c:545:24: sparse:     expected unsigned int [usertype]
   drivers/mmc/host/mxcmmc.c:545:24: sparse:     got restricted __le32 [usertype]
   drivers/mmc/host/mxcmmc.c:557:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] tmp @@     got restricted __le32 [usertype] @@
   drivers/mmc/host/mxcmmc.c:557:21: sparse:     expected unsigned int [usertype] tmp
   drivers/mmc/host/mxcmmc.c:557:21: sparse:     got restricted __le32 [usertype]
   drivers/mmc/host/mxcmmc.c:572:37: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/mmc/host/mxcmmc.c:572:37: sparse:     expected unsigned int [usertype] val
   drivers/mmc/host/mxcmmc.c:572:37: sparse:     got restricted __le32 [usertype]
   drivers/mmc/host/mxcmmc.c:585:37: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/mmc/host/mxcmmc.c:585:37: sparse:     expected unsigned int [usertype] val
   drivers/mmc/host/mxcmmc.c:585:37: sparse:     got restricted __le32 [usertype]

vim +545 drivers/mmc/host/mxcmmc.c

d96be879ff4697 Sascha Hauer       2009-01-06  535  
12658af54f2ed1 Linus Walleij      2024-01-27  536  static int mxcmci_pull(struct mxcmci_host *host, u32 *buf, int bytes)
d96be879ff4697 Sascha Hauer       2009-01-06  537  {
d96be879ff4697 Sascha Hauer       2009-01-06  538  	unsigned int stat;
d96be879ff4697 Sascha Hauer       2009-01-06  539  
d96be879ff4697 Sascha Hauer       2009-01-06  540  	while (bytes > 3) {
d96be879ff4697 Sascha Hauer       2009-01-06  541  		stat = mxcmci_poll_status(host,
d96be879ff4697 Sascha Hauer       2009-01-06  542  				STATUS_BUF_READ_RDY | STATUS_READ_OP_DONE);
d96be879ff4697 Sascha Hauer       2009-01-06  543  		if (stat)
d96be879ff4697 Sascha Hauer       2009-01-06  544  			return stat;
c7ceab02543f8a Anatolij Gustschin 2013-04-08 @545  		*buf++ = cpu_to_le32(mxcmci_readl(host, MMC_REG_BUFFER_ACCESS));
d96be879ff4697 Sascha Hauer       2009-01-06  546  		bytes -= 4;
d96be879ff4697 Sascha Hauer       2009-01-06  547  	}
d96be879ff4697 Sascha Hauer       2009-01-06  548  
d96be879ff4697 Sascha Hauer       2009-01-06  549  	if (bytes) {
d96be879ff4697 Sascha Hauer       2009-01-06  550  		u8 *b = (u8 *)buf;
d96be879ff4697 Sascha Hauer       2009-01-06  551  		u32 tmp;
d96be879ff4697 Sascha Hauer       2009-01-06  552  
d96be879ff4697 Sascha Hauer       2009-01-06  553  		stat = mxcmci_poll_status(host,
d96be879ff4697 Sascha Hauer       2009-01-06  554  				STATUS_BUF_READ_RDY | STATUS_READ_OP_DONE);
d96be879ff4697 Sascha Hauer       2009-01-06  555  		if (stat)
d96be879ff4697 Sascha Hauer       2009-01-06  556  			return stat;
c7ceab02543f8a Anatolij Gustschin 2013-04-08  557  		tmp = cpu_to_le32(mxcmci_readl(host, MMC_REG_BUFFER_ACCESS));
d96be879ff4697 Sascha Hauer       2009-01-06  558  		memcpy(b, &tmp, bytes);
d96be879ff4697 Sascha Hauer       2009-01-06  559  	}
d96be879ff4697 Sascha Hauer       2009-01-06  560  
d96be879ff4697 Sascha Hauer       2009-01-06  561  	return 0;
d96be879ff4697 Sascha Hauer       2009-01-06  562  }
d96be879ff4697 Sascha Hauer       2009-01-06  563  

:::::: The code at line 545 was first introduced by commit
:::::: c7ceab02543f8a03b4df3d4465b089c8117a5e09 mmc: mxcmmc: add mpc512x SDHC support

:::::: TO: Anatolij Gustschin <agust@denx.de>
:::::: CC: Chris Ball <cjb@laptop.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
