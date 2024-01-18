Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57DB8F40
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 05:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705556659; cv=none; b=ED/Hl7PrQ3ysf7oQVPef/8vggTAWPWQLcSOQ1OFri4UkKol1C7qYLO9edBYqtRYwJ+3bdMAx7URoGwfGhrIZOcDW/opfHiISgQ27CyVZ0iwGSt8vAAx9USHfGQa9a5Yt03suf5puWkB6MPTk6av1IDkbFBnuXMmFJLTwWlau2F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705556659; c=relaxed/simple;
	bh=Elw4njlevuCWoYk0RiOyLd0hBmKy1nXgxVcUv3r2jlk=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=LmDCAHXYoGsBHyvJ8BZ94+sn7L+Qwh+wXrX7Egey4AVYCkOHRBSRL0fcjoTTdKBU5t0BOgrt8HjMvGCnoqtW4lnaHnBErhTL6BrSXKTz7d7o0CBhAKFfZ5L1fwjFo0eywXXzZRi6pKkNDv43SZ/CypWQrk3GBhqLtOft4e7QHuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BymU+3tf; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BymU+3tf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705556657; x=1737092657;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Elw4njlevuCWoYk0RiOyLd0hBmKy1nXgxVcUv3r2jlk=;
  b=BymU+3tf7D1WcN8k+P20PHngsCOMaQ13UJXJra9njAdIQQokC3nz19Vm
   tkoBHIUT6OrMbeIVU116OXk+Hd1P7y8OB2gCZFMD9zScD0rvfSc1oHx3M
   JrSuG6f5V6+Z5N7RR7dQ33KIIia9AAdeizvpdlPCErPKpH6KIX35OsGrq
   RlOt9I4DhOlupddJ4sw9rft//0gM2e/dg1XxjNdL12fkzVtt6HMe6l8/X
   4gP0x2Au4cjr+rsSa3OTkKDlKQ2RUUg3Lq/J4e+6S3BnKj1UJGwQBmxZC
   pSZ5dmFU2lG7G98H9ZHgGMWv25rZ0p4i1t/0jmz/4OMRtPtwRKAz5bPXl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="464635745"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="464635745"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 21:44:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="238124"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jan 2024 21:44:16 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQLCH-0002go-1L
	for oe-kbuild-all@lists.linux.dev;
	Thu, 18 Jan 2024 05:44:13 +0000
Date: Thu, 18 Jan 2024 13:43:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.14 8743/9354]
 drivers/soc/tegra/pmc.c:577:1: warning: the frame size of 1192 bytes is
 larger than 1024 bytes
Message-ID: <202401181313.EvaigORf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14
head:   6f750b16c322c9191168a3a97c427c90581d9144
commit: 475748fe0956ae57d9b85a01d4deacbe6f4f7217 [8743/9354] UPSTREAM: PM / Domain: Add struct device to genpd
config: arm-randconfig-004-20240118 (https://download.01.org/0day-ci/archive/20240118/202401181313.EvaigORf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401181313.EvaigORf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401181313.EvaigORf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/tegra/pmc.c: In function 'tegra_powergate_sequence_power_up':
>> drivers/soc/tegra/pmc.c:577:1: warning: the frame size of 1192 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    }
    ^


vim +577 drivers/soc/tegra/pmc.c

7232398abc6a71 Thierry Reding 2014-07-11  548  
7232398abc6a71 Thierry Reding 2014-07-11  549  /**
7232398abc6a71 Thierry Reding 2014-07-11  550   * tegra_powergate_sequence_power_up() - power up partition
7232398abc6a71 Thierry Reding 2014-07-11  551   * @id: partition ID
7232398abc6a71 Thierry Reding 2014-07-11  552   * @clk: clock for partition
7232398abc6a71 Thierry Reding 2014-07-11  553   * @rst: reset for partition
7232398abc6a71 Thierry Reding 2014-07-11  554   *
7232398abc6a71 Thierry Reding 2014-07-11  555   * Must be called with clk disabled, and returns with clk enabled.
7232398abc6a71 Thierry Reding 2014-07-11  556   */
70293ed09decd1 Jon Hunter     2016-02-11  557  int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
7232398abc6a71 Thierry Reding 2014-07-11  558  				      struct reset_control *rst)
7232398abc6a71 Thierry Reding 2014-07-11  559  {
a38045121bf421 Jon Hunter     2016-03-30  560  	struct tegra_powergate pg;
a38045121bf421 Jon Hunter     2016-03-30  561  	int err;
7232398abc6a71 Thierry Reding 2014-07-11  562  
403db2d21c8f85 Jon Hunter     2016-06-28  563  	if (!tegra_powergate_is_available(id))
403db2d21c8f85 Jon Hunter     2016-06-28  564  		return -EINVAL;
403db2d21c8f85 Jon Hunter     2016-06-28  565  
a38045121bf421 Jon Hunter     2016-03-30  566  	pg.id = id;
a38045121bf421 Jon Hunter     2016-03-30  567  	pg.clks = &clk;
a38045121bf421 Jon Hunter     2016-03-30  568  	pg.num_clks = 1;
a38045121bf421 Jon Hunter     2016-03-30  569  	pg.resets = &rst;
a38045121bf421 Jon Hunter     2016-03-30  570  	pg.num_resets = 1;
7232398abc6a71 Thierry Reding 2014-07-11  571  
a38045121bf421 Jon Hunter     2016-03-30  572  	err = tegra_powergate_power_up(&pg, false);
a38045121bf421 Jon Hunter     2016-03-30  573  	if (err)
a38045121bf421 Jon Hunter     2016-03-30  574  		pr_err("failed to turn on partition %d: %d\n", id, err);
7232398abc6a71 Thierry Reding 2014-07-11  575  
a38045121bf421 Jon Hunter     2016-03-30  576  	return err;
7232398abc6a71 Thierry Reding 2014-07-11 @577  }
7232398abc6a71 Thierry Reding 2014-07-11  578  EXPORT_SYMBOL(tegra_powergate_sequence_power_up);
7232398abc6a71 Thierry Reding 2014-07-11  579  

:::::: The code at line 577 was first introduced by commit
:::::: 7232398abc6a7186e315425638c367d50c674718 ARM: tegra: Convert PMC to a driver

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
