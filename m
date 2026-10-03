Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC54D3A4521
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 21:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791061707; cv=none; b=k8h+rlrw4Ou8LnKkMYyzEipBA9PmZ0GixqsSz7QG5aBuKp+w3EqOvJ7NI15iTsltyfX3ffJkrSJ1pkU+07KmRcfsrCsMmfDzFvL5bjHUqvKPjNMN36EpkZah6t3h6GScUHnomSq0nzi4stQFNBqjyZZ4KNIuUTWGkQEJ7y7uMsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791061707; c=relaxed/simple;
	bh=LxDVLQXCn/aGa+BVtglR6FWiVnr/V8uVjmYHMpRSCro=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eu2D6Fw3ROexFgvreBW8H2Vd9ehB5bOhsdwIIgmOageMZy12uDYp7X/5WZiW5vPHDSCFzJ7JgM5tZM+x7Ui4fJRuNydbvLeAZrWyIP70XhA6mPOqECwReL4qX1ew3ADsxTh2fEioj4GNLoGJrTQXsdHIxOEEXhWeyErF98rRxD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLFaNp8N; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLFaNp8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791061706; x=1822597706;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=LxDVLQXCn/aGa+BVtglR6FWiVnr/V8uVjmYHMpRSCro=;
  b=dLFaNp8Nu+F1zGGldwdFTBzoEUsp9g98hOea7LNbgZyBmkZv/jcoq14g
   0Kt+WHcpfW4Xj8XCHnrxv428fIlb6sxjBJim1yrZS3azeBksivXniZ0Uo
   lbjYFBvebuYjY64oPRvZFNMUDwQoJqf/XUwHGRBUPXsdCJZQezkc27oLx
   50x/rEBNiTMdIN/f7bY7hTPd8MAUoF4Qr3XfNo+TBC1zGOjVtqh4mZ88E
   ZlI/A/jAHAjallRz2PDOz7pLchaWR6ZFmig+yOtOkHhink5AVM/VZHrZy
   sYkY50dHkT26Vusp8jIgbZwmrrdumhqLfqOSpcCTvy0PoeA9txN8tWtrh
   g==;
X-CSE-ConnectionGUID: ElAwAgJ0Qc6WL7Vc8ulRBw==
X-CSE-MsgGUID: FPWIH5JOQLyuVwvM0ZBkdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="79346741"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="79346741"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 14:08:25 -0700
X-CSE-ConnectionGUID: c2plxEXET1eeIqhLBIiz5g==
X-CSE-MsgGUID: xM5G7F3RTaq976Z0wZXWXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="284567863"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Oct 2026 14:08:24 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xD6xy-00000000UDL-0Fon
	for oe-kbuild-all@lists.linux.dev;
	Sat, 03 Oct 2026 21:08:22 +0000
Date: Sun, 4 Oct 2026 05:07:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: wifi: mt76: mt7996: add thermal zone device registration
Message-ID: <202610040543.prBb5HzA-lkp@intel.com>
References: <202610040543.prBb5HzA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610040543.prBb5HzA-lkp@intel.com>

Hi Ryan,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Leung-via-B4-Relay/wifi-mt76-mt7996-add-thermal-zone-device-registration/20261003-041935
base:   
patch link:    https://lore.kernel.org/r/202610040543.prBb5HzA-lkp%40intel.com
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20261004/202610040543.prBb5HzA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610040543.prBb5HzA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610040543.prBb5HzA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7996/init.c: In function 'mt7996_unregister_thermal':
>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:262:17: error: implicit declaration of function 'thermal_of_zone_unregister'; did you mean 'devm_thermal_of_zone_unregister'? [-Wimplicit-function-declaration]
     262 |                 thermal_of_zone_unregister(phy->tzone);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 devm_thermal_of_zone_unregister
   drivers/net/wireless/mediatek/mt76/mt7996/init.c: In function 'mt7996_thermal_init':
>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:303:22: error: implicit declaration of function 'thermal_of_zone_register'; did you mean 'devm_thermal_of_zone_register'? [-Wimplicit-function-declaration]
     303 |         phy->tzone = thermal_of_zone_register(phy->dev->mt76.dev,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
         |                      devm_thermal_of_zone_register
>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:303:20: error: assignment to 'struct thermal_zone_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     303 |         phy->tzone = thermal_of_zone_register(phy->dev->mt76.dev,
         |                    ^


vim +262 drivers/net/wireless/mediatek/mt76/mt7996/init.c

   255	
   256	static void mt7996_unregister_thermal(struct mt7996_phy *phy)
   257	{
   258		struct wiphy *wiphy = phy->mt76->hw->wiphy;
   259		char name[sizeof("cooling_deviceXXX")];
   260	
   261		if (phy->tzone) {
 > 262			thermal_of_zone_unregister(phy->tzone);
   263			phy->tzone = NULL;
   264		}
   265	
   266		if (!phy->cdev)
   267			return;
   268	
   269		snprintf(name, sizeof(name), "cooling_device%d", phy->mt76->band_idx);
   270		sysfs_remove_link(&wiphy->dev.kobj, name);
   271		thermal_cooling_device_unregister(phy->cdev);
   272		phy->cdev = NULL;
   273	}
   274	
   275	static int mt7996_thermal_init(struct mt7996_phy *phy)
   276	{
   277		struct wiphy *wiphy = phy->mt76->hw->wiphy;
   278		char cname[sizeof("cooling_deviceXXX")];
   279		struct thermal_cooling_device *cdev;
   280		struct device *hwmon;
   281		const char *name;
   282	
   283		name = devm_kasprintf(&wiphy->dev, GFP_KERNEL, "mt7996_%s.%d",
   284				      wiphy_name(wiphy), phy->mt76->band_idx);
   285		if (!name)
   286			return -ENOMEM;
   287	
   288		snprintf(cname, sizeof(cname), "cooling_device%d", phy->mt76->band_idx);
   289	
   290		cdev = thermal_cooling_device_register(name, phy, &mt7996_thermal_ops);
   291		if (!IS_ERR(cdev)) {
   292			if (sysfs_create_link(&wiphy->dev.kobj, &cdev->device.kobj,
   293					      cname) < 0)
   294				thermal_cooling_device_unregister(cdev);
   295			else
   296				phy->cdev = cdev;
   297		}
   298	
   299		/* initialize critical/maximum high temperature */
   300		phy->throttle_temp[MT7996_CRIT_TEMP_IDX] = MT7996_CRIT_TEMP;
   301		phy->throttle_temp[MT7996_MAX_TEMP_IDX] = MT7996_MAX_TEMP;
   302	
 > 303		phy->tzone = thermal_of_zone_register(phy->dev->mt76.dev,
   304						      phy->mt76->band_idx, phy,
   305						      &mt7996_tz_ops);
   306		if (IS_ERR(phy->tzone)) {
   307			if (PTR_ERR(phy->tzone) != -ENODEV)
   308				dev_warn(phy->dev->mt76.dev,
   309					 "failed to register thermal zone %d: %ld\n",
   310					 phy->mt76->band_idx, PTR_ERR(phy->tzone));
   311			phy->tzone = NULL;
   312		}
   313	
   314		if (!IS_REACHABLE(CONFIG_HWMON))
   315			return 0;
   316	
   317		hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev, name, phy,
   318							       mt7996_hwmon_groups);
   319	
   320		if (IS_ERR(hwmon)) {
   321			mt7996_unregister_thermal(phy);
   322			return PTR_ERR(hwmon);
   323		}
   324	
   325		return 0;
   326	}
   327	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
