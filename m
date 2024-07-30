Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63BE4A2D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 01:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722302000; cv=none; b=Tc7oWN8W/ZimCwGU9GZqSNZeT99RCyep9Bg/NEBmIbll9vpYvDFMQ8zbd/TZhSOYLXQhwjmOkjmFzURRAac+Z4tpVH69aKJJGnoEAUG6WGhzr17Yxu4mQLLMudh5pSu73BP3/h5ik9BTITN3bR+BEo6MygUIMSrP9vZk2dU1E0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722302000; c=relaxed/simple;
	bh=j0HFy8Wk6xFPhWa9EoSVdUugRGAsx9MmxBxcWU/NWTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZWIIRP3QoFGsgiTx5dMP1EqJb+TFWViqwg38Fc4RWPGEAvKUisvA8FB8keh09rZabbG8aFoHIR0Zn/TyH27OeB/o7UGFxKOvHxX6Se/JL1kGa1Qf6ZatYH1Kemqfc3T7tSt5mH9B4H61IHWmU8T84PRp+RrTEClYnKKJ0DRFVis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5UCF8Yr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5UCF8Yr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722301998; x=1753837998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j0HFy8Wk6xFPhWa9EoSVdUugRGAsx9MmxBxcWU/NWTs=;
  b=a5UCF8YrWfoFSrgUJyHa4yxTULPOalHywvpk/6ouJj8aeigfJ3YNnYYv
   9iXgakDO/+0wL4T4k6S2UOzQhydSVu2eIxcsdfx7XuD6W84+EOclS9Whj
   noRgFx+b90TjiyMGGirPwR0H0QwqRT9Gr8pp/zL4V9M/vEtRKJ76Q7URk
   LA+Jit+vsVabuVAYqktdR1XuyfyfmgTfpzVGUmhXJTi4JkDdKCg3C7K3B
   hhiPA+JpeXNhzWrhPSsqVjJbGOYJ1Up23cdIhYybZOgvBBsoZrqUljSPb
   N0o5UcW56JIihzPpdBA6rvIhWM77FUlIvYPiQjHuPWcGrpgFGYgmR8Xe2
   Q==;
X-CSE-ConnectionGUID: 6JFgv+jXThabTD7GYl1MXQ==
X-CSE-MsgGUID: eI22qFJBTVuc50SpnSCL1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20274895"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="20274895"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 18:13:17 -0700
X-CSE-ConnectionGUID: Ca1NiYgDSUuKZSelrZfGyA==
X-CSE-MsgGUID: imwY7VWGR0u+iGv8wm/ySg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="54129256"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Jul 2024 18:13:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYbQM-000sI0-1a;
	Tue, 30 Jul 2024 01:13:10 +0000
Date: Tue, 30 Jul 2024 09:12:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Manorit Chawdhry <m-chawdhry@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 92/339] kismet: WARNING: unmet direct
 dependencies detected for GENERIC_PHY_MIPI_DPHY when selected by
 VIDEO_CADENCE_CSI2RX
Message-ID: <202407300915.fdw3Wgec-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   04a9ad081f0f255a046f398abf6faf1d4374267f
commit: 7149fb6fface964718d99db0070c5cc5a2bae81a [92/339] media: platform: cadence: select MIPI_DPHY dependency
config: x86_64-kismet-CONFIG_GENERIC_PHY_MIPI_DPHY-CONFIG_VIDEO_CADENCE_CSI2RX-0-0 (https://download.01.org/0day-ci/archive/20240730/202407300915.fdw3Wgec-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240730/202407300915.fdw3Wgec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300915.fdw3Wgec-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY when selected by VIDEO_CADENCE_CSI2RX
   WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY
     Depends on [n]: GENERIC_PHY [=n]
     Selected by [y]:
     - VIDEO_CADENCE_CSI2RX [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
