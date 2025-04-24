Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC491BD9E3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 22:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745533744; cv=none; b=iPKbGZbZC1wZcNVQoJIB6po116xxxpkR15E7IvC6jxV/8xdKxI7+p2n073cJ1e8ZlmMPpociS1UFuCfL8JOvdzokohi6CiHJ9pJMxp+NzuQFXBGh7htcIiQsZBw5wCeqNAC9Kp9owRaHQ6/HXRxzelGEJ7zX2zdoTceCllM4ApE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745533744; c=relaxed/simple;
	bh=Ba0Xqvhi3hjcskVLjlMUMG6M9gd95fltDoDtzg1JzkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eM+6ePvmHzcndNMnPGfpIjM0ljtnuW4+vw8c67mOvG2CmJcZIDBIEOXzKKtUEZzgMwS6qDjznnY9YjJCtcl7SO5wOjh+gkhev5MQzEKVrvzsJ9WQCFZluB1ZXuFzBN4grszdE7Ekjmq6QMDPfSKJc9Ykb6E37leKp5gUx7cZ1uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJECdPXz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJECdPXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745533742; x=1777069742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ba0Xqvhi3hjcskVLjlMUMG6M9gd95fltDoDtzg1JzkY=;
  b=XJECdPXzxEfUPtTsDnF1BSWQyLugclRqWIlUUBzPZHp5kbxfmRdq0tbJ
   mT27OsuV0VZetMF9UYylSBR5xE4sHCKlDVHkcqnIkvYo860ZDmS+9TVX+
   YbT+h+rKnNgS6+HzVTmOuse7tEHrWHivgxqy7WsroKKwUZZsE/Z3oM9Ah
   YBns4WbohzMhz2M0bg6t3p0YuSEC4/K990ineGSB4ZrUcuoL2Ju8bTjsN
   g8gNbjO7CyhDos6aWfFRw6rHYK0HPLk9KEe1JIIz+lu5qSKL661dIVuIS
   slDXEUQVvXiL5nhTBwb03NNeB1018lnY2YZou09XwELmVJJZAS+4/q2k3
   w==;
X-CSE-ConnectionGUID: tHOadGnkTwiQJLWgVvnRfQ==
X-CSE-MsgGUID: RkQIyUNrRA28cSHMUNWthA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47204036"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="47204036"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 15:29:01 -0700
X-CSE-ConnectionGUID: aT9tOOS3Tf+xlTm6hZPTUA==
X-CSE-MsgGUID: /gf5KFf/R8+gxJdsRHk/Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="137904463"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Apr 2025 15:29:00 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u853x-0004dh-2o;
	Thu, 24 Apr 2025 22:28:57 +0000
Date: Fri, 25 Apr 2025 06:28:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3] drivers/pci/pwrctrl/slot.c:39:
 undefined reference to `of_regulator_bulk_get_all'
Message-ID: <202504250654.cYVEfMqu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   b01e71951e32bcf55e252da941d55692247d1a5c
commit: c61d3053974a917407ce02ff923505d45dd5b5bd [0/3] UPSTREAM: PCI/pwrctrl: Add pwrctrl driver for PCI slots
config: x86_64-buildonly-randconfig-006-20250425 (https://download.01.org/0day-ci/archive/20250425/202504250654.cYVEfMqu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250654.cYVEfMqu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250654.cYVEfMqu-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pci/pwrctrl/slot.o: in function `pci_pwrctrl_slot_probe':
>> drivers/pci/pwrctrl/slot.c:39: undefined reference to `of_regulator_bulk_get_all'


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
