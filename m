Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48245692
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 14:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691765506; x=1723301506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m7iJ9aPynDqFKzuzCzs/vJGlbcbSjQVmYuO5WuCRPGA=;
  b=kJByKNy01C/AIJi9mVSiKnpqpVqxqrhTRWCjufFXbZugX6lDFSZcYrhE
   dPO4WFqSGogD5RkLD26MBHoGDvyQ/vAI/GiJe1ROsQYlHNrq1/sAXEvln
   HVe327a+5rNXpIO0QYAegkBNdIp2GgYoAgFiLTolQnj5in8oJLa2satQT
   y7VDpRhf8VwKqMylLyEAK+yJpH+QlUnTgNEw/UUfR2kH1LUjt67CalglR
   Dr5TdpSlNpQFMizh2jsi8z9Rn0/hqMS4L0tGlZgHMNDcn5W7oTsq0vwqY
   GA3pYHoskkrgtgMUa6vRpWq8Hi4+7yEt41JXjcVrfO9q2PXbMptE1uzGs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="435584755"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="435584755"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 07:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="735814237"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="735814237"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Aug 2023 07:51:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUTUN-0007qa-1e;
	Fri, 11 Aug 2023 14:51:43 +0000
Date: Fri, 11 Aug 2023 22:51:16 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Takashi Iwai <tiwai@suse.de>, Peter Wu <peter@lekensteyn.nl>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.14.y 3992/9999] sound/pci/hda/hda_intel.c:1079:12:
 warning: 'azx_resume' defined but not used
Message-ID: <202308112225.dBBJSm8B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   4dbbc9b492fb6a28528de6a1958263780693e96c
commit: 0b3377cf6e167e0d40de90e494f3d82f425f4468 [3992/9999] vga_switcheroo: Use device link for HDA controller
config: x86_64-randconfig-x002-20230811 (https://download.01.org/0day-ci/archive/20230811/202308112225.dBBJSm8B-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308112225.dBBJSm8B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308112225.dBBJSm8B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/pci/hda/hda_intel.c:1079:12: warning: 'azx_resume' defined but not used [-Wunused-function]
    static int azx_resume(struct device *dev)
               ^~~~~~~~~~
>> sound/pci/hda/hda_intel.c:1044:12: warning: 'azx_suspend' defined but not used [-Wunused-function]
    static int azx_suspend(struct device *dev)
               ^~~~~~~~~~~


vim +/azx_resume +1079 sound/pci/hda/hda_intel.c

5c0b9bec460c34 Takashi Iwai   2008-12-11  1039  
7ccbde57ce312f Takashi Iwai   2012-08-14  1040  #if defined(CONFIG_PM_SLEEP) || defined(SUPPORT_VGA_SWITCHEROO)
5c0b9bec460c34 Takashi Iwai   2008-12-11  1041  /*
5c0b9bec460c34 Takashi Iwai   2008-12-11  1042   * power management
5c0b9bec460c34 Takashi Iwai   2008-12-11  1043   */
68cb2b55927885 Takashi Iwai   2012-07-02 @1044  static int azx_suspend(struct device *dev)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1045  {
68cb2b55927885 Takashi Iwai   2012-07-02  1046  	struct snd_card *card = dev_get_drvdata(dev);
2d9772ef653ccf Takashi Iwai   2014-07-16  1047  	struct azx *chip;
2d9772ef653ccf Takashi Iwai   2014-07-16  1048  	struct hda_intel *hda;
a41d122449bea3 Takashi Iwai   2015-04-14  1049  	struct hdac_bus *bus;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1050  
2d9772ef653ccf Takashi Iwai   2014-07-16  1051  	if (!card)
2d9772ef653ccf Takashi Iwai   2014-07-16  1052  		return 0;
2d9772ef653ccf Takashi Iwai   2014-07-16  1053  
2d9772ef653ccf Takashi Iwai   2014-07-16  1054  	chip = card->private_data;
2d9772ef653ccf Takashi Iwai   2014-07-16  1055  	hda = container_of(chip, struct hda_intel, chip);
342e84490574cb U. Artie Eoff  2015-07-28  1056  	if (chip->disabled || hda->init_failed || !chip->running)
c5c215232dfb71 Takashi Iwai   2012-12-04  1057  		return 0;
c5c215232dfb71 Takashi Iwai   2012-12-04  1058  
a41d122449bea3 Takashi Iwai   2015-04-14  1059  	bus = azx_bus(chip);
421a12520d4ed4 Takashi Iwai   2005-11-17  1060  	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
9ad593f6d326e7 Takashi Iwai   2008-05-16  1061  	azx_clear_irq_pending(chip);
cb53c626e1145e Takashi Iwai   2007-08-10  1062  	azx_stop_chip(chip);
7295b26438ec01 Mengdong Lin   2013-06-25  1063  	azx_enter_link_reset(chip);
a41d122449bea3 Takashi Iwai   2015-04-14  1064  	if (bus->irq >= 0) {
a41d122449bea3 Takashi Iwai   2015-04-14  1065  		free_irq(bus->irq, chip);
a41d122449bea3 Takashi Iwai   2015-04-14  1066  		bus->irq = -1;
30b35399ceb239 Takashi Iwai   2006-10-11  1067  	}
a07187c992be94 Mengdong Lin   2014-06-26  1068  
68e7fffc0f3e95 Takashi Iwai   2006-10-23  1069  	if (chip->msi)
43001c9515cf87 Takashi Iwai   2006-09-08  1070  		pci_disable_msi(chip->pci);
dba9b7b6ca1af6 Takashi Iwai   2017-06-29  1071  	if ((chip->driver_caps & AZX_DCAPS_I915_POWERWELL)
795614dde4d355 Mengdong Lin   2015-04-29  1072  		&& hda->need_i915_power)
98d8fc6c5d3652 Mengdong Lin   2015-05-19  1073  		snd_hdac_display_power(bus, false);
785d8c4be82b45 Libin Yang     2015-05-12  1074  
785d8c4be82b45 Libin Yang     2015-05-12  1075  	trace_azx_suspend(chip);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1076  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1077  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  1078  
68cb2b55927885 Takashi Iwai   2012-07-02 @1079  static int azx_resume(struct device *dev)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1080  {
68cb2b55927885 Takashi Iwai   2012-07-02  1081  	struct pci_dev *pci = to_pci_dev(dev);
68cb2b55927885 Takashi Iwai   2012-07-02  1082  	struct snd_card *card = dev_get_drvdata(dev);
2d9772ef653ccf Takashi Iwai   2014-07-16  1083  	struct azx *chip;
2d9772ef653ccf Takashi Iwai   2014-07-16  1084  	struct hda_intel *hda;
a52ff34e5ec617 Takashi Iwai   2016-08-04  1085  	struct hdac_bus *bus;
2d9772ef653ccf Takashi Iwai   2014-07-16  1086  
2d9772ef653ccf Takashi Iwai   2014-07-16  1087  	if (!card)
2d9772ef653ccf Takashi Iwai   2014-07-16  1088  		return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1089  
2d9772ef653ccf Takashi Iwai   2014-07-16  1090  	chip = card->private_data;
2d9772ef653ccf Takashi Iwai   2014-07-16  1091  	hda = container_of(chip, struct hda_intel, chip);
a52ff34e5ec617 Takashi Iwai   2016-08-04  1092  	bus = azx_bus(chip);
342e84490574cb U. Artie Eoff  2015-07-28  1093  	if (chip->disabled || hda->init_failed || !chip->running)
c5c215232dfb71 Takashi Iwai   2012-12-04  1094  		return 0;
c5c215232dfb71 Takashi Iwai   2012-12-04  1095  
a52ff34e5ec617 Takashi Iwai   2016-08-04  1096  	if (chip->driver_caps & AZX_DCAPS_I915_POWERWELL) {
a52ff34e5ec617 Takashi Iwai   2016-08-04  1097  		snd_hdac_display_power(bus, true);
a52ff34e5ec617 Takashi Iwai   2016-08-04  1098  		if (hda->need_i915_power)
a52ff34e5ec617 Takashi Iwai   2016-08-04  1099  			snd_hdac_i915_set_bclk(bus);
a07187c992be94 Mengdong Lin   2014-06-26  1100  	}
a52ff34e5ec617 Takashi Iwai   2016-08-04  1101  
68e7fffc0f3e95 Takashi Iwai   2006-10-23  1102  	if (chip->msi)
68e7fffc0f3e95 Takashi Iwai   2006-10-23  1103  		if (pci_enable_msi(pci) < 0)
68e7fffc0f3e95 Takashi Iwai   2006-10-23  1104  			chip->msi = 0;
68e7fffc0f3e95 Takashi Iwai   2006-10-23  1105  	if (azx_acquire_irq(chip, 1) < 0)
30b35399ceb239 Takashi Iwai   2006-10-11  1106  		return -EIO;
cb53c626e1145e Takashi Iwai   2007-08-10  1107  	azx_init_pci(chip);
d804ad9258c146 Maxim Levitsky 2007-09-03  1108  
0a67352153505f Lu, Han        2015-05-05  1109  	hda_intel_init_chip(chip, true);
d804ad9258c146 Maxim Levitsky 2007-09-03  1110  
a52ff34e5ec617 Takashi Iwai   2016-08-04  1111  	/* power down again for link-controlled chips */
a52ff34e5ec617 Takashi Iwai   2016-08-04  1112  	if ((chip->driver_caps & AZX_DCAPS_I915_POWERWELL) &&
a52ff34e5ec617 Takashi Iwai   2016-08-04  1113  	    !hda->need_i915_power)
a52ff34e5ec617 Takashi Iwai   2016-08-04  1114  		snd_hdac_display_power(bus, false);
a52ff34e5ec617 Takashi Iwai   2016-08-04  1115  
421a12520d4ed4 Takashi Iwai   2005-11-17  1116  	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
785d8c4be82b45 Libin Yang     2015-05-12  1117  
785d8c4be82b45 Libin Yang     2015-05-12  1118  	trace_azx_resume(chip);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1119  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1120  }
b8dfc4624162c0 Mengdong Lin   2012-08-23  1121  #endif /* CONFIG_PM_SLEEP || SUPPORT_VGA_SWITCHEROO */
b8dfc4624162c0 Mengdong Lin   2012-08-23  1122  

:::::: The code at line 1079 was first introduced by commit
:::::: 68cb2b559278858ef9f3a7722f95df88797c7840 ALSA: Convert to new pm_ops for PCI drivers

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
