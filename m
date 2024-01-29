Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20955C5E2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706527949; cv=none; b=T6IzZSolyr1BZI1O4ep4wQvszcTzbGzZhQzUgqAaNk45YVbd1BqsdDYUHLKXs5eOyPZVW10bTonmsUPkaEOllczLYUx/PAHzHFkyvKtMuk2+6x8INerLV1/CcAU6lBubjPvS3E3L/ocNgU0cwyl21PLIhM4jEupWlgcHlEqSWTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706527949; c=relaxed/simple;
	bh=GmrdZWjzbASPYvSMUdWp7wADmOcVJLZMUyygS+MyNak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FlusvOQPvYqqaPH/cPPnPBfhi792BhAt//7j4rEB4WKydJYj4Jl5Tb6WkQ599GwMlD44dk++5HtLejLDOMHeEyfsOWe511TwBHGXCv4D5TaMraWzQJrlHOnprdkffg6cJGl20D8ikN9EZrGEk4UJMNzPYaH6fcej29LN0IfOerA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PD83WDsP; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PD83WDsP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706527947; x=1738063947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GmrdZWjzbASPYvSMUdWp7wADmOcVJLZMUyygS+MyNak=;
  b=PD83WDsPrqYJZClueGu8x06hWyzf4M9OpdRIja/aZhxG+ipZpRAPH1ro
   GHYJ+VTtq8Dd0MYDKmINJ2F/ZK+6u+uvzmhzYrbcGHO7uSMcHrjkdGRkP
   kuA0tdjbdROm/UEytbKAHIasaoVKVmrnY+rLJGjOYJHI0xfEw7O4DH2Ba
   JxMrcNTvjLs1bBO6+BbtXOLOCApu5fcIXDcnVZgV5Kdcho+rKSLVaTx1V
   nBuR+MbuAYgY1SDxsn1DTSuHymT8JQE1+ze6tS4uX9wDMFy8e0yvFq8Zw
   HSspRWP6KL4IxQnuv9zQGzpd5TgW6qiUlPa0gaOfrg1YaJAeoMHlyoiys
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="393359926"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="393359926"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 03:32:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="36099568"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jan 2024 03:32:26 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUPsF-0004Fs-2U;
	Mon, 29 Jan 2024 11:32:23 +0000
Date: Mon, 29 Jan 2024 19:32:11 +0800
From: kernel test robot <lkp@intel.com>
To: Danielle Ratson <danieller@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 23/43] net/ethtool/module.c:305:33:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202401291923.QO7fZAn0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   98264e4927dcea3362f83db36d9ef80ac758b3c1
commit: ec2f004c2e35ee0a53889987a357a0518da69e6c [23/43] ethtool: Add ability to flash transceiver modules' firmware
config: x86_64-randconfig-123-20240129 (https://download.01.org/0day-ci/archive/20240129/202401291923.QO7fZAn0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291923.QO7fZAn0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401291923.QO7fZAn0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ethtool/module.c:305:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] password @@     got restricted __be32 [usertype] @@
   net/ethtool/module.c:305:33: sparse:     expected unsigned int [assigned] [usertype] password
   net/ethtool/module.c:305:33: sparse:     got restricted __be32 [usertype]

vim +305 net/ethtool/module.c

   286	
   287	static int module_flash_fw(struct net_device *dev, struct nlattr **tb,
   288				   struct netlink_ext_ack *extack)
   289	{
   290		struct ethtool_module_fw_flash_params params = {};
   291		struct nlattr *attr;
   292	
   293		if (!tb[ETHTOOL_A_MODULE_FW_FLASH_FILE_NAME]) {
   294			NL_SET_ERR_MSG_ATTR(extack,
   295					    tb[ETHTOOL_A_MODULE_FW_FLASH_FILE_NAME],
   296					    "File name attribute is missing");
   297			return -EINVAL;
   298		}
   299	
   300		params.file_name =
   301			nla_data(tb[ETHTOOL_A_MODULE_FW_FLASH_FILE_NAME]);
   302	
   303		attr = tb[ETHTOOL_A_MODULE_FW_FLASH_PASSWORD];
   304		if (attr) {
 > 305			params.password = cpu_to_be32(nla_get_u32(attr));
   306			params.password_valid = true;
   307		}
   308	
   309		return module_flash_fw_schedule(dev, &params, extack);
   310	}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
