Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191B66FD3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 14:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727016358; cv=none; b=XE8OJgUODEdmkgdh+cKnOSNDYy5kKHndnKqEB4WenpLJEwso9B1A60YWVgSZWuSLIkCw+EW34XXa8azvBJB8pEkVEdbw38rcYmIWjnszvRbUdEf7Zj1iOMkGYnFUUVh9zAJnuwItZ4oAi7/cOVFg6eUVyOle0h1Th/nw4oTGcXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727016358; c=relaxed/simple;
	bh=snn/GiDDg5kxjzwa0NcAgjqZVKOFXzg0sPDvk0z2YSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DND3qsj0kX+oqkR1eEAv2LWS2xk6JqVEA8qW5d8J9ODqDoirhdIoW9OfRwa5SxtVKB7fACW+WCN+N7aZk8GGdlVVQP3k/r9yOuXvMN1uIcGnn/y621Y71qjjQziuIk8Lc3dnPeGhRLk99Sj51XVXCqGNu2HT8BKehBHDeXvjftU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4i6c9Jd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4i6c9Jd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727016357; x=1758552357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=snn/GiDDg5kxjzwa0NcAgjqZVKOFXzg0sPDvk0z2YSY=;
  b=A4i6c9Jd9dd8LQHRo04khrNh8c49URFbenr+6zt+W43jMCmdc33yYLlO
   81+A4Zvcb+dIc7tffxmWlvn/zZxsSDend6liK7MP9QhY4cywx8sJbUGpQ
   aofwZzXuhdkN8pFPSXx2eXd9aq4sEHj/tolCxXirG86pcEiiwo9PFSvv8
   pFJOlAJN2jzVMpYchQ0RXVjnwwQvKuvBXbEZwLiJCSBMnpnlLBHGu49pW
   c1uO7b+xTe8j1ojpkBuDiiESPITsimqfPqlysRtKLbAjQmCXgzN70z63/
   /Tq84i/cPcutDHCcdDIJYSo+QtrDwLzDfV6Jw1ISR/W0KQXR1iyXfVUMh
   A==;
X-CSE-ConnectionGUID: rheeD2RZRRalE1G4Q8osHA==
X-CSE-MsgGUID: 5JCZ0kDfS06c5aOAuxrLbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36538297"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="36538297"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 07:45:56 -0700
X-CSE-ConnectionGUID: Tu18ZyYuTS2fzprVd6iPzA==
X-CSE-MsgGUID: CdPxYdISQCy6w6AydK2TWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="71645350"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Sep 2024 07:45:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssNqT-000GNe-0w;
	Sun, 22 Sep 2024 14:45:53 +0000
Date: Sun, 22 Sep 2024 22:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.1/linux 4/8]
 sound/soc/intel/avs/boards/pcm3168a.c:70:33: warning: 'avs_pcm3168a_ops'
 defined but not used
Message-ID: <202409222231.zmlEi4Hm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   5404e6dd8524e9cc698099c8780a6889e24ecbfd
commit: 18205f4e41775d5f7de02051280bb078d48ac34b [4/8] ASoC: Intel: avs: Add pcm3168a machine board
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240922/202409222231.zmlEi4Hm-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409222231.zmlEi4Hm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409222231.zmlEi4Hm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/intel/avs/boards/pcm3168a.c:70:33: warning: 'avs_pcm3168a_ops' defined but not used [-Wunused-const-variable=]
      70 | static const struct snd_soc_ops avs_pcm3168a_ops = {
         |                                 ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_PMC_CORE
   Depends on [n]: X86_PLATFORM_DEVICES [=n] && PCI [=y] && ACPI
   Selected by [m]:
   - DWMAC_INTEL_PLAT [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_PLATFORM [=m] && OF [=y] && COMMON_CLK [=y] && STMMAC_ETH [=m]


vim +/avs_pcm3168a_ops +70 sound/soc/intel/avs/boards/pcm3168a.c

    69	
  > 70	static const struct snd_soc_ops avs_pcm3168a_ops = {
    71		.hw_params = avs_pcm3168a_hw_params,
    72	};
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
