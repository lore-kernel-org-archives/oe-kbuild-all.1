Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6128117D343
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 18:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717179875; cv=none; b=hSa6HVEDfTvdulKnIIyFy/GaQkSKPkep1fjKJjEsA1/zqhY4g0tq8cMDGmC1A1AgPopz5d+RHiQMMhYea1Fv501kvsF4BXE8/6WtdcvsKrtzI98kQRB5J+CZJe+jbMF4HMnEo8bj78y9sotrxyrXM7ZJfYL8Ay8XjwGsUgLrSI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717179875; c=relaxed/simple;
	bh=Kj5sO0tO+SS4IGk9qEgowIouzew053YcxKdve9i29SE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a+e8wcUx1Z/NjPtZWtnMO+rhWqW9h/zw71YfaicIcn6rERsHAIajnqz6mJTX/oBF90HSvarsGuhx7DxeV+GBybNkCLrs949vxL+SNM28e87T5L7kOIQsY/qTfpPGpVvIhaUJsj12RwhStYLNa0MJ/u2m+jpvLJPdRSLPouakimA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/u+zco3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/u+zco3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717179874; x=1748715874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kj5sO0tO+SS4IGk9qEgowIouzew053YcxKdve9i29SE=;
  b=A/u+zco3dMFD+AOPO/MIrnFHMNJ+0k5zmOkzez6GHoC06J0czqAlFrZA
   fjh0mm3UgMDUh23SyOvFEtYhOX0yHpopNbl4MYkDLiO4NV9N+Ff6vB+PB
   j6UMP0wy43WdT5Tuf1pgXj++IO58sZ/8kfp+htfTbBR4D3bAek3W+D52m
   CQUldkwv4IEfNjsxIRD6qJA3+o6337LB4vba3HI9vV3G19nxkBwHQ6/kU
   Ebrqc0nReWXGikIHgYjc5SGRkxz2yp1r4UyBXKI8IvVA04u2SnYLaEcVT
   NVzK+YGpdRNIdurpK3EeJBaBCYk7lFKq0tGHn7ySdXoaNgLZNSlQYFZBy
   w==;
X-CSE-ConnectionGUID: 6NtYr+wkR86nXpyU69KF8A==
X-CSE-MsgGUID: POZZAWX6RFWHv8hcc+qLiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="24312314"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="24312314"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 11:24:33 -0700
X-CSE-ConnectionGUID: tGoxt94OSjOGWtgUhrb4yw==
X-CSE-MsgGUID: PorzmambTAG5ENPwD8FnGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="67079231"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 31 May 2024 11:24:31 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD6vV-000HdZ-1E;
	Fri, 31 May 2024 18:24:29 +0000
Date: Sat, 1 Jun 2024 02:24:10 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/sdca-interrupt-handler 27/27]
 drivers/soundwire/Kconfig:6:error: recursive dependency detected!
Message-ID: <202406010214.nQ64G0fc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/sdca-interrupt-handler
head:   b603b9e3b988191695dfa2291443700daf32c124
commit: b603b9e3b988191695dfa2291443700daf32c124 [27/27] ASoC: rt711-sdca: use generic SDCA interrupt handler
config: x86_64-rhel-8.3-rust (attached as .config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010214.nQ64G0fc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010214.nQ64G0fc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soundwire/Kconfig:6:error: recursive dependency detected!
   drivers/soundwire/Kconfig:6:	symbol SOUNDWIRE depends on SND_SOC_SDCA_OPTIONAL
   sound/soc/sdca/Kconfig:11:	symbol SND_SOC_SDCA_OPTIONAL default value contains SND_SOC_SDCA
   sound/soc/sdca/Kconfig:3:	symbol SND_SOC_SDCA is implied by SND_SOC_RT711_SDCA_SDW
   sound/soc/codecs/Kconfig:1680:	symbol SND_SOC_RT711_SDCA_SDW depends on SOUNDWIRE
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"


vim +6 drivers/soundwire/Kconfig

9251345dca24b6 Vinod Koul           2017-12-14   5  
9251345dca24b6 Vinod Koul           2017-12-14  @6  menuconfig SOUNDWIRE
8676b3ca467351 Pierre-Louis Bossart 2019-07-18   7  	tristate "SoundWire support"
0f8c0f8a778217 Michal Suchanek      2019-10-03   8  	depends on ACPI || OF
fdb6ccf70eb592 Pierre-Louis Bossart 2024-05-14   9  	depends on SND_SOC_SDCA_OPTIONAL
9d7cd9d500826a Pierre-Louis Bossart 2019-05-01  10  	help
9251345dca24b6 Vinod Koul           2017-12-14  11  	  SoundWire is a 2-Pin interface with data and clock line ratified
9251345dca24b6 Vinod Koul           2017-12-14  12  	  by the MIPI Alliance. SoundWire is used for transporting data
9251345dca24b6 Vinod Koul           2017-12-14  13  	  typically related to audio functions. SoundWire interface is
9251345dca24b6 Vinod Koul           2017-12-14  14  	  optimized to integrate audio devices in mobile or mobile inspired
9251345dca24b6 Vinod Koul           2017-12-14  15  	  systems. Say Y to enable this subsystem, N if you do not have such
9251345dca24b6 Vinod Koul           2017-12-14  16  	  a device
9251345dca24b6 Vinod Koul           2017-12-14  17  

:::::: The code at line 6 was first introduced by commit
:::::: 9251345dca24b62b14e4e53e6ee3387ae7d9c790 soundwire: Add SoundWire bus type

:::::: TO: Vinod Koul <vinod.koul@intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
