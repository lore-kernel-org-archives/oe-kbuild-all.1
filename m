Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11123D1A8F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 06:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784789282; cv=none; b=p9XXbbQbIhIPU67Vo6UW6XHXZzUi1xhKdzsD6K/Ux2HO4/VK5JhWNA6QrYr3DHJCPANW5HAhHtBZv2+6XyLF5XFF5DUPsNxW0T0VHbrynmlzodQbFii06oJL+RbyOoiAD766dzHnZPuzidUvYhmOxZqBu/rftqCtSWxpfpbh2WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784789282; c=relaxed/simple;
	bh=IwzxSbVsFS5qEeR0yNE9Uw7SN/5JVjg/YN509dfJ2qQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uYNLUIguy3Lqg9JRgSMbCpU+3M1T1L/jbgK6szxwF42aIT2Uah6RnQe2ysZV0FY10qZxtnsPaJ9btzxpXS7/h0DDljg18PvM5S9p9Bi3eb2SY8EEZI161ayBIDWWX2bOmevrP7DMgIRu6A+mnwbf1rsphNo9Zl2AV48MUMINNxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGIwrT9l; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGIwrT9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784789280; x=1816325280;
  h=date:from:to:cc:subject:message-id;
  bh=IwzxSbVsFS5qEeR0yNE9Uw7SN/5JVjg/YN509dfJ2qQ=;
  b=ZGIwrT9lg7BPXz6BZu6HpEYvhLZ5OQ8hp+1cCiu54Vj2G72WpYaNFTLt
   swQCU5WUaUBlxqmWCNOgKaUswLx1k5pOBndx4rZLPDXdt2xskMn635lrw
   xmyJgoWpVtZvD4h3DbxKhGZdHqwRwVkcUaPzCe8aLt/cFt1qRKIVDGBsv
   JrDhv1Y8J4VMxXPE1kjiYr72HZc6A/5Tou+VEfimIkvUG59XaOJGVU4Cd
   8Krg2ihYFhh0Yu5FBk0R9viHWQKE93BKyKwN36UzEY0NNig0LTfVliTup
   g1A3csrxT8oMqr9HaPVABM3cSbFLKSJIp4crI9HWy3DeWZnuvp5c0ds4m
   g==;
X-CSE-ConnectionGUID: BN8SUJVJSaGTGBTGtaXtHw==
X-CSE-MsgGUID: /pbwTKZKTKaRw7ygn3q2eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96952294"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="96952294"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 23:48:00 -0700
X-CSE-ConnectionGUID: IddvhtkbRgO6e2rw2KzNZQ==
X-CSE-MsgGUID: s7YVCPyMRB2+GmfA5tnH5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="257074416"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Jul 2026 23:47:57 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmnDn-00000000ZPN-1RIy;
	Thu, 23 Jul 2026 06:47:55 +0000
Date: Thu, 23 Jul 2026 14:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: drivers/mmc/host/mxcmmc.c:557:21: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202607231423.2GquEh7Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: 7cd8db0fb0b2bf309163d56fec585c0f9e0964d1 mmc: add COMPILE_TEST to multiple drivers
date:   10 months ago
config: m68k-randconfig-r112-20260723 (https://download.01.org/0day-ci/archive/20260723/202607231423.2GquEh7Y-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607231423.2GquEh7Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7cd8db0fb0b2 ("mmc: add COMPILE_TEST to multiple drivers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607231423.2GquEh7Y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/mmc/host/mxcmmc.c:545:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/mmc/host/mxcmmc.c:545:24: sparse:     expected unsigned int [usertype]
   drivers/mmc/host/mxcmmc.c:545:24: sparse:     got restricted __le32 [usertype]
>> drivers/mmc/host/mxcmmc.c:557:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] tmp @@     got restricted __le32 [usertype] @@
   drivers/mmc/host/mxcmmc.c:557:21: sparse:     expected unsigned int [usertype] tmp
   drivers/mmc/host/mxcmmc.c:557:21: sparse:     got restricted __le32 [usertype]
>> drivers/mmc/host/mxcmmc.c:572:37: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/mmc/host/mxcmmc.c:572:37: sparse:     expected unsigned int [usertype] val
   drivers/mmc/host/mxcmmc.c:572:37: sparse:     got restricted __le32 [usertype]
   drivers/mmc/host/mxcmmc.c:585:37: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/mmc/host/mxcmmc.c:585:37: sparse:     expected unsigned int [usertype] val
   drivers/mmc/host/mxcmmc.c:585:37: sparse:     got restricted __le32 [usertype]

vim +557 drivers/mmc/host/mxcmmc.c

d96be879ff46975 Sascha Hauer       2009-01-06  535  
12658af54f2ed10 Linus Walleij      2024-01-27  536  static int mxcmci_pull(struct mxcmci_host *host, u32 *buf, int bytes)
d96be879ff46975 Sascha Hauer       2009-01-06  537  {
d96be879ff46975 Sascha Hauer       2009-01-06  538  	unsigned int stat;
d96be879ff46975 Sascha Hauer       2009-01-06  539  
d96be879ff46975 Sascha Hauer       2009-01-06  540  	while (bytes > 3) {
d96be879ff46975 Sascha Hauer       2009-01-06  541  		stat = mxcmci_poll_status(host,
d96be879ff46975 Sascha Hauer       2009-01-06  542  				STATUS_BUF_READ_RDY | STATUS_READ_OP_DONE);
d96be879ff46975 Sascha Hauer       2009-01-06  543  		if (stat)
d96be879ff46975 Sascha Hauer       2009-01-06  544  			return stat;
c7ceab02543f8a0 Anatolij Gustschin 2013-04-08  545  		*buf++ = cpu_to_le32(mxcmci_readl(host, MMC_REG_BUFFER_ACCESS));
d96be879ff46975 Sascha Hauer       2009-01-06  546  		bytes -= 4;
d96be879ff46975 Sascha Hauer       2009-01-06  547  	}
d96be879ff46975 Sascha Hauer       2009-01-06  548  
d96be879ff46975 Sascha Hauer       2009-01-06  549  	if (bytes) {
d96be879ff46975 Sascha Hauer       2009-01-06  550  		u8 *b = (u8 *)buf;
d96be879ff46975 Sascha Hauer       2009-01-06  551  		u32 tmp;
d96be879ff46975 Sascha Hauer       2009-01-06  552  
d96be879ff46975 Sascha Hauer       2009-01-06  553  		stat = mxcmci_poll_status(host,
d96be879ff46975 Sascha Hauer       2009-01-06  554  				STATUS_BUF_READ_RDY | STATUS_READ_OP_DONE);
d96be879ff46975 Sascha Hauer       2009-01-06  555  		if (stat)
d96be879ff46975 Sascha Hauer       2009-01-06  556  			return stat;
c7ceab02543f8a0 Anatolij Gustschin 2013-04-08 @557  		tmp = cpu_to_le32(mxcmci_readl(host, MMC_REG_BUFFER_ACCESS));
d96be879ff46975 Sascha Hauer       2009-01-06  558  		memcpy(b, &tmp, bytes);
d96be879ff46975 Sascha Hauer       2009-01-06  559  	}
d96be879ff46975 Sascha Hauer       2009-01-06  560  
d96be879ff46975 Sascha Hauer       2009-01-06  561  	return 0;
d96be879ff46975 Sascha Hauer       2009-01-06  562  }
d96be879ff46975 Sascha Hauer       2009-01-06  563  
12658af54f2ed10 Linus Walleij      2024-01-27  564  static int mxcmci_push(struct mxcmci_host *host, u32 *buf, int bytes)
d96be879ff46975 Sascha Hauer       2009-01-06  565  {
d96be879ff46975 Sascha Hauer       2009-01-06  566  	unsigned int stat;
d96be879ff46975 Sascha Hauer       2009-01-06  567  
d96be879ff46975 Sascha Hauer       2009-01-06  568  	while (bytes > 3) {
d96be879ff46975 Sascha Hauer       2009-01-06  569  		stat = mxcmci_poll_status(host, STATUS_BUF_WRITE_RDY);
d96be879ff46975 Sascha Hauer       2009-01-06  570  		if (stat)
d96be879ff46975 Sascha Hauer       2009-01-06  571  			return stat;
c7ceab02543f8a0 Anatolij Gustschin 2013-04-08 @572  		mxcmci_writel(host, cpu_to_le32(*buf++), MMC_REG_BUFFER_ACCESS);
d96be879ff46975 Sascha Hauer       2009-01-06  573  		bytes -= 4;
d96be879ff46975 Sascha Hauer       2009-01-06  574  	}
d96be879ff46975 Sascha Hauer       2009-01-06  575  
d96be879ff46975 Sascha Hauer       2009-01-06  576  	if (bytes) {
d96be879ff46975 Sascha Hauer       2009-01-06  577  		u8 *b = (u8 *)buf;
d96be879ff46975 Sascha Hauer       2009-01-06  578  		u32 tmp;
d96be879ff46975 Sascha Hauer       2009-01-06  579  
d96be879ff46975 Sascha Hauer       2009-01-06  580  		stat = mxcmci_poll_status(host, STATUS_BUF_WRITE_RDY);
d96be879ff46975 Sascha Hauer       2009-01-06  581  		if (stat)
d96be879ff46975 Sascha Hauer       2009-01-06  582  			return stat;
d96be879ff46975 Sascha Hauer       2009-01-06  583  
d96be879ff46975 Sascha Hauer       2009-01-06  584  		memcpy(&tmp, b, bytes);
c7ceab02543f8a0 Anatolij Gustschin 2013-04-08  585  		mxcmci_writel(host, cpu_to_le32(tmp), MMC_REG_BUFFER_ACCESS);
d96be879ff46975 Sascha Hauer       2009-01-06  586  	}
d96be879ff46975 Sascha Hauer       2009-01-06  587  
6d91641613a6668 Fabio Estevam      2015-05-09  588  	return mxcmci_poll_status(host, STATUS_BUF_WRITE_RDY);
d96be879ff46975 Sascha Hauer       2009-01-06  589  }
d96be879ff46975 Sascha Hauer       2009-01-06  590  

:::::: The code at line 557 was first introduced by commit
:::::: c7ceab02543f8a03b4df3d4465b089c8117a5e09 mmc: mxcmmc: add mpc512x SDHC support

:::::: TO: Anatolij Gustschin <agust@denx.de>
:::::: CC: Chris Ball <cjb@laptop.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
