Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9F739769A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 22:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778711681; cv=none; b=fP16MEnZqh1mzY7s1A3aNEDFqvy2mMfMY3crK7b9zGbuS8x6yKnaWzqPGPcNCsh+FcWBrhxuPuZfw097JpWAe5Ki2zuEFsw7a/7k4qfKNiI8Z67kjqCSzhVmRuB4dL1+D5IpPmSRK4lkqip0jbB9pWhNr+KmWBZ0HpRSY/76EUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778711681; c=relaxed/simple;
	bh=Su54Qj9QrJE/r7OrRuF7Y5v8ecvzJCfISV8H4KHyrOs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D0t6o5yB0W0U2KaQnrFqBCNnGVYOFhBrpxL7IXtUAvRSPNh+C4phSYCBFo87EJ3Aes8ie5FK5e4b/+wU7MxzxPsWo5a8+OiNJQzPJ1/ZR6EwXPE0tP0YlfYpbdpBIoZvGfsKFU5yr+HoIZLUFbuVJzWfgBKO2SpTlZJv8hwYq7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghylwSMH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghylwSMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778711680; x=1810247680;
  h=date:from:to:cc:subject:message-id;
  bh=Su54Qj9QrJE/r7OrRuF7Y5v8ecvzJCfISV8H4KHyrOs=;
  b=ghylwSMHP4c5xxvf2fZvJoGGsulJe9RS29eVApQUKG7GumVf9/4FJow1
   OFhv6i8T6zLdbnbDIc4238ubruoDpIOahEiLcxUP53UzwtE83F6kQ7pJk
   cf+pinytPWP/X7SLu6t406AkBKlCrhfQ7Oac9f0LGXJQXKBDpgxwfXs0Z
   PvadbsgyYYtvEEoYB8DbseMfOoG/2xqHtV2+iFIdHmbde1ehDmwfo4xbH
   ZvgYz4PKvAIiTC9Bqm5LCTvxeUMYZx9EPQhDRBX5tcznV3Yq5cFg25vXA
   hGh76yeDnfSNl7KC1EF9u5VbENffQYdM9Y5rwi+FKlsg+Rr30JUOZv/MV
   Q==;
X-CSE-ConnectionGUID: kY2ytQuvROmPm1NAZNgO2A==
X-CSE-MsgGUID: tUnODqk4QG2oDsKKqWKP9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="67179690"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="67179690"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 15:34:40 -0700
X-CSE-ConnectionGUID: UPjwbR4HSf+YoZvq2Zv7xA==
X-CSE-MsgGUID: ENswomeERPOAtPJrcxY1ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="233764505"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 May 2026 15:34:38 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNI9z-000000005F1-30Yf;
	Wed, 13 May 2026 22:34:35 +0000
Date: Thu, 14 May 2026 06:34:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/pci/pwrctrl/slot.c:39:undefined reference to
 `of_regulator_bulk_get_all'
Message-ID: <202605140655.awi5CT4m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   57adfe632c001900e948b572914f0068854ee50e
commit: c61d3053974a917407ce02ff923505d45dd5b5bd [1/1] UPSTREAM: PCI/pwrctrl: Add pwrctrl driver for PCI slots
config: x86_64-randconfig-003-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140655.awi5CT4m-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140655.awi5CT4m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140655.awi5CT4m-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pci/pwrctrl/slot.o: in function `pci_pwrctrl_slot_probe':
>> drivers/pci/pwrctrl/slot.c:39:(.text+0xbe): undefined reference to `of_regulator_bulk_get_all'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]


vim +39 drivers/pci/pwrctrl/slot.c

    28	
    29	static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
    30	{
    31		struct pci_pwrctrl_slot_data *slot;
    32		struct device *dev = &pdev->dev;
    33		int ret;
    34	
    35		slot = devm_kzalloc(dev, sizeof(*slot), GFP_KERNEL);
    36		if (!slot)
    37			return -ENOMEM;
    38	
  > 39		ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
    40						&slot->supplies);
    41		if (ret < 0) {
    42			dev_err_probe(dev, ret, "Failed to get slot regulators\n");
    43			return ret;
    44		}
    45	
    46		slot->num_supplies = ret;
    47		ret = regulator_bulk_enable(slot->num_supplies, slot->supplies);
    48		if (ret < 0) {
    49			dev_err_probe(dev, ret, "Failed to enable slot regulators\n");
    50			goto err_regulator_free;
    51		}
    52	
    53		ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_slot_power_off,
    54					       slot);
    55		if (ret)
    56			goto err_regulator_disable;
    57	
    58		pci_pwrctrl_init(&slot->ctx, dev);
    59	
    60		ret = devm_pci_pwrctrl_device_set_ready(dev, &slot->ctx);
    61		if (ret)
    62			return dev_err_probe(dev, ret, "Failed to register pwrctrl driver\n");
    63	
    64		return 0;
    65	
    66	err_regulator_disable:
    67		regulator_bulk_disable(slot->num_supplies, slot->supplies);
    68	err_regulator_free:
    69		regulator_bulk_free(slot->num_supplies, slot->supplies);
    70	
    71		return ret;
    72	}
    73	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
