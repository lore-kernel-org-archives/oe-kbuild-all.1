Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D348A377EAF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 15:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326972; cv=none; b=OX1LVqzsDy3TRiHesK2R1grhV66HcJfnvbA/XMdnC1lyp/hmT4yZ8Lo40vj8+6fkeohS6gfeoT6qKEgQ7Hky+BwXriqU054Iyv6CDVCR4QjD+e48zRR2OGZiLYXZKySEsAhhsVpJr2W+cnw7n2Hsr/Xhcgv8tI/TrDFQ2HvdhZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326972; c=relaxed/simple;
	bh=foSzzkGad1LX4Am/cu1katEgfRoMWTRe+kABmqu1rlE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Amp1cpuTsW3hMCsVSgGGTv7Qt7E8GpOZcvovH43LFdvkBV0IIJG2phLa18RSyPaUZPZADeDpVK5OTKDd9nmcCReYA2wrhlmQCTrbZcliMIOqzVI2cpsbo0WzJTmj0icd9TQU4Guk9KsYBnOvVLXjftPKx3UZ8uztnR3YnzDjvz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEE5l6Mp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEE5l6Mp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780326971; x=1811862971;
  h=date:from:to:cc:subject:message-id;
  bh=foSzzkGad1LX4Am/cu1katEgfRoMWTRe+kABmqu1rlE=;
  b=XEE5l6MpfO1w/s2TLEJqdzWHLzcqHcSdOrYTXpzkz42eIB7ViwVRQdmh
   c8ni/6bDCUj1oEM97LT8H5sJUhCkHwzucZgVeORpGmcZFHVkiSX9/ehd2
   wFisiCtVljqqYXFSux5OEO1/lBGJ7tf84Xs03gZC10//CTVlAIIohOeBQ
   dGTYtbyuwKbh6fOptw7ORyVGXcBmCtgrhl4pdNWj5JzvP60fJVLUhmxBi
   Z68ujJInRkhaQWYYoyBd2f94vkU6URWkS/P+AypMRqZjV1UnwqoEn3wu8
   jEOngSb9hkuUXJbDKdbMAG5tNdYE+UHqkjJr8suJQTEARZicK+CAp+q/s
   w==;
X-CSE-ConnectionGUID: oaIN31HXRDKveRtbM8qTUQ==
X-CSE-MsgGUID: E1yOyNyZRRa5J1BzdR4Miw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="68622075"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="68622075"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 08:16:10 -0700
X-CSE-ConnectionGUID: BJcyftg+RJCPNcSclKa6rA==
X-CSE-MsgGUID: cWFJFkkGRpqMVO3v/yXabA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="247564939"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Jun 2026 08:16:08 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU4N3-00000000Ahq-1NPB;
	Mon, 01 Jun 2026 15:16:05 +0000
Date: Mon, 01 Jun 2026 23:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: drivers/mmc/host/wmt-sdmmc.c:241:39: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202606012342.rl7e4RO3-lkp@intel.com>
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
config: s390-randconfig-r131-20260601 (https://download.01.org/0day-ci/archive/20260601/202606012342.rl7e4RO3-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606012342.rl7e4RO3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7cd8db0fb0b2 ("mmc: add COMPILE_TEST to multiple drivers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606012342.rl7e4RO3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mmc/host/wmt-sdmmc.c:241:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/mmc/host/wmt-sdmmc.c:241:39: sparse:     expected unsigned int
   drivers/mmc/host/wmt-sdmmc.c:241:39: sparse:     got restricted __be32 [usertype]

vim +241 drivers/mmc/host/wmt-sdmmc.c

3a96dff0f828ae Tony Prisk 2012-11-18  221  
3a96dff0f828ae Tony Prisk 2012-11-18  222  static void wmt_mci_read_response(struct mmc_host *mmc)
3a96dff0f828ae Tony Prisk 2012-11-18  223  {
3a96dff0f828ae Tony Prisk 2012-11-18  224  	struct wmt_mci_priv *priv;
3a96dff0f828ae Tony Prisk 2012-11-18  225  	int idx1, idx2;
3a96dff0f828ae Tony Prisk 2012-11-18  226  	u8 tmp_resp;
3a96dff0f828ae Tony Prisk 2012-11-18  227  	u32 response;
3a96dff0f828ae Tony Prisk 2012-11-18  228  
3a96dff0f828ae Tony Prisk 2012-11-18  229  	priv = mmc_priv(mmc);
3a96dff0f828ae Tony Prisk 2012-11-18  230  
3a96dff0f828ae Tony Prisk 2012-11-18  231  	for (idx1 = 0; idx1 < 4; idx1++) {
3a96dff0f828ae Tony Prisk 2012-11-18  232  		response = 0;
3a96dff0f828ae Tony Prisk 2012-11-18  233  		for (idx2 = 0; idx2 < 4; idx2++) {
3a96dff0f828ae Tony Prisk 2012-11-18  234  			if ((idx1 == 3) && (idx2 == 3))
3a96dff0f828ae Tony Prisk 2012-11-18  235  				tmp_resp = readb(priv->sdmmc_base + SDMMC_RSP);
3a96dff0f828ae Tony Prisk 2012-11-18  236  			else
3a96dff0f828ae Tony Prisk 2012-11-18  237  				tmp_resp = readb(priv->sdmmc_base + SDMMC_RSP +
3a96dff0f828ae Tony Prisk 2012-11-18  238  						 (idx1*4) + idx2 + 1);
3a96dff0f828ae Tony Prisk 2012-11-18  239  			response |= (tmp_resp << (idx2 * 8));
3a96dff0f828ae Tony Prisk 2012-11-18  240  		}
3a96dff0f828ae Tony Prisk 2012-11-18 @241  		priv->cmd->resp[idx1] = cpu_to_be32(response);
3a96dff0f828ae Tony Prisk 2012-11-18  242  	}
3a96dff0f828ae Tony Prisk 2012-11-18  243  }
3a96dff0f828ae Tony Prisk 2012-11-18  244  

:::::: The code at line 241 was first introduced by commit
:::::: 3a96dff0f828ae9dfb43efd49a9b67a74c6dc360 mmc: SD/MMC Host Controller for Wondermedia WM8505/WM8650

:::::: TO: Tony Prisk <linux@prisktech.co.nz>
:::::: CC: Chris Ball <cjb@laptop.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
