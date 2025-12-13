Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4F518024
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 13:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765630904; cv=none; b=NcVwcWcFEUyQ6bajBKp+Wt4kqF/wMhHfulGh6YRrfELCHKh1MRUFqf84SSWsFJyVeQFWMDjNQ5kwyJRCyEt7l+Nq90BmRpuZzVxja39UE4yXYJ4vQIU9DaHWFOGETfXLuv3sRSeLEvp3Lw9wZtCq/a5iiMcTQ+ZN+4oFxuC8SgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765630904; c=relaxed/simple;
	bh=Hca/gkWqbI0zV5xk+uezfctUXd+01k0Vc5sf0TzEfyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r/NNhPoWxmqpoyyFjp0U8zsmp08e6eKBrfIm5M2LLKbyuI6PzUkDwAGnyB7ByFfpp8KvoUk4bW3SEPiMiC8M0/v9gtgFNwuhe0cx2PBvvOmBeTWmqkmMJHKHqiEOx5aYdrWiKpYez3sdD1LJIUbYo9TaYBpcQvqz9TYiGzYL+8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ws2IdqoO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ws2IdqoO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765630903; x=1797166903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hca/gkWqbI0zV5xk+uezfctUXd+01k0Vc5sf0TzEfyY=;
  b=Ws2IdqoOeDNMYj2o0fS3CQDbhSqT6mAV0uSFK7nNLq3+0rH/wArhUUP1
   X5e7Sr1n8gOhOBpQEDL7ffuO3WRzHvgSS+iSkEJyn1rwVXcMn/mnclq/h
   Gkk2LDsFWW+pdxwRUlqlZ8U0W5tuJp0gVDM0d7OOnvuSKwB7pLJOpl39Y
   /TC4+lRvu6f2ekexCQehb46b3NXlDTxsCUwMiZL/MIXCyEmLY/UX5jTra
   ObxFKtyz30xP5T/Z1TiOAf+BGUl+60zLuMOKd1h7INCi4uIZYlcCdoAwV
   GG0Nu8VkbAG8en2axhW65JOu5UlIY5OY+K48ju9bZ56kQ44Eg7CXJWaXH
   A==;
X-CSE-ConnectionGUID: v+8JRgjURBeEkSNRQFdZCA==
X-CSE-MsgGUID: y5h1iccKRwG/ZwNQFQNUSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78982274"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="78982274"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 05:01:43 -0800
X-CSE-ConnectionGUID: EDaGoHcJT0G08N5WctifGA==
X-CSE-MsgGUID: 34qufDZiQt2HECz0TlOVsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="198138964"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2025 05:01:42 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUPFj-000000007eh-3CrS;
	Sat, 13 Dec 2025 13:01:39 +0000
Date: Sat, 13 Dec 2025 21:01:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/2] drivers/mmc/core/mmc.c:985:6:
 sparse: sparse: symbol 'mmc_set_bus_speed' was not declared. Should it be
 static?
Message-ID: <202512132042.VW0ICpkS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: a8fe5ae5628fd3e6d29af800e7c63bf58d1380ee [0/2] ANDROID: mmc: core: Export core functions required for clk scaling
config: i386-randconfig-061-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132042.VW0ICpkS-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132042.VW0ICpkS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132042.VW0ICpkS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mmc/core/mmc.c:985:6: sparse: sparse: symbol 'mmc_set_bus_speed' was not declared. Should it be static?

vim +/mmc_set_bus_speed +985 drivers/mmc/core/mmc.c

   981	
   982	/*
   983	 * Set the bus speed for the selected speed mode.
   984	 */
 > 985	void mmc_set_bus_speed(struct mmc_card *card)
   986	{
   987		unsigned int max_dtr = (unsigned int)-1;
   988	
   989		if ((mmc_card_hs200(card) || mmc_card_hs400(card)) &&
   990		     max_dtr > card->ext_csd.hs200_max_dtr)
   991			max_dtr = card->ext_csd.hs200_max_dtr;
   992		else if (mmc_card_hs(card) && max_dtr > card->ext_csd.hs_max_dtr)
   993			max_dtr = card->ext_csd.hs_max_dtr;
   994		else if (max_dtr > card->csd.max_dtr)
   995			max_dtr = card->csd.max_dtr;
   996	
   997		mmc_set_clock(card->host, max_dtr);
   998	}
   999	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
