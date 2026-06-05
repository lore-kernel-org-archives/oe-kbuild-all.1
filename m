Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C6336D503
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 01:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780623619; cv=none; b=HHAG4dbL6pIy145Ih2fCR9Efq1fqY3YpBlhLEPmSTsMADtzlHniaJ0G2F2mK1Lgy/NVU3Hd0P6eEwJNvIPmrBSuHIRd5TchWO+H9tvVIYrSZ1JvPM0Wb2dD68YcMwV98JUEsWy252uKqLZIZroJwmlV/iwI4LVAryQ6EbCrldOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780623619; c=relaxed/simple;
	bh=zAOaqPRhx6rNenXDjoYbTLpk6snu/7Q7xmUfvwKjTf4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K1bsEjzn02+Sq5cEXVTr7bfA+g0JSjzAXaf+aTb5p/fOjVlOqs2DAFtTZ9eWHyd3mRgQN6Y+74mLOdonpBMBssQGbep8yJ0U98WjbskmlyksHPg7fNhwHyAE8XFdtTW6NmEAVlEn6PscapyLg/SQZMEaSb80oYPCKhE8hn26GbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShbzSSCP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShbzSSCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780623609; x=1812159609;
  h=date:from:to:cc:subject:message-id;
  bh=zAOaqPRhx6rNenXDjoYbTLpk6snu/7Q7xmUfvwKjTf4=;
  b=ShbzSSCPVjt+BaxumDsLK8paHkKwfqgbQiLA8aUT5kr1fOsbfVSwMNG6
   d7kBxkA4hzxPmi81N11VSFKp0RWjUui9ctQg3iFoL0c+/m9R4HILOUPVx
   0Qu/pW6efQvwvy9SEc6YopTQScpPGHCWobI20GjTTFyUNTVcQLD5YWb8N
   lbLSO82lD1fLVDigbFkiMaNWuJbiCwrp9SGmHO0VnEHwzmLRUSyLyib9w
   ym6+Lnmm98eGScGgGox2wr42dkEMJTIWh76MC8zVzp/OaWg9UYqJUaIIA
   cBSFJb2RU3gPOXNeNJbgni9EbP4nuXRqlBiiwW5fhD59lo7pLq/vAFOlN
   w==;
X-CSE-ConnectionGUID: RYqK4cNHSNmFXTThedwMKw==
X-CSE-MsgGUID: /hZFsz+fS6+6zS7F0wxtiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81457281"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81457281"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 18:40:09 -0700
X-CSE-ConnectionGUID: MtIAV8xlRbqKg5q9RmNxzA==
X-CSE-MsgGUID: Sz0Uu1qHTnWoJKjYrDJcZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="240518816"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 04 Jun 2026 18:40:07 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVJXZ-000000002Rx-0QVm;
	Fri, 05 Jun 2026 01:40:05 +0000
Date: Fri, 05 Jun 2026 03:39:21 +0200
From: kernel test robot <lkp@intel.com>
To: Vincent Cloutier <vincent@cloutier.co>
Cc: oe-kbuild-all@lists.linux.dev,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [linux-next:master 10687/11439]
 drivers/power/supply/max17042_battery.c:938:13: warning:
 'max17042_suspend_soc_alerts' defined but not used
Message-ID: <202606050351.Zg7VuSwL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b99ae45861eccff1e1d8c7b05a13650be805d437
commit: 601885ffb5e9a0fd30c40a6c8cffeed2a04d695e [10687/11439] power: supply: max17042_battery: Keep only critical alerts during suspend
config: i386-randconfig-2006-20250804 (https://download.01.org/0day-ci/archive/20260605/202606050351.Zg7VuSwL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050351.Zg7VuSwL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050351.Zg7VuSwL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/power/supply/max17042_battery.c:938:13: warning: 'max17042_suspend_soc_alerts' defined but not used [-Wunused-function]
     938 | static void max17042_suspend_soc_alerts(struct max17042_chip *chip)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/max17042_suspend_soc_alerts +938 drivers/power/supply/max17042_battery.c

   937	
 > 938	static void max17042_suspend_soc_alerts(struct max17042_chip *chip)
   939	{
   940		if (chip->chip_type != MAXIM_DEVICE_TYPE_MAX17055)
   941			return;
   942	
   943		regmap_update_bits(chip->regmap, MAX17055_Config2,
   944				   CFG2_DSOCI_BIT_ENBL, 0);
   945		max17042_set_critical_soc_threshold(chip);
   946	}
   947	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
