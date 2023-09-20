Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA44FBE6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 08:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695198438; x=1726734438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HO/hObCYowlkqa0IMHNwu/FGnScYhoIZrLcXLahpGPU=;
  b=HBHEWWUiQTdJc/DMkiDmB/gJ37RIcY8ryMoDVAYRLytShTRd3lEHanu4
   pYl6dS0JR9U3cIlUs7Vj6lZijNF+Rixszhi+99YzJPsewDHUnpUCP2/kK
   67PVQnQg/3cQSDGDi2rSyQ4Dv7Koyt9yb0gezvZHyhD/VYJjsmTJy/aXy
   5wEAXHGeswIeCyebLAMGDYN7C+v9jgBPUHbtqNXkAtNDJSwc1Hi/V+axF
   zcE5d1eh8my1lEzBq5IUm3EJ+5IrTDYV4p3hsSnuLBq1DBtXNCydbm9Ls
   DpvAuNxAE8FTzJC54kRx0qmiNYDQelrltk6X7qNWl89EebhU7kuomaZrg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="382908533"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="382908533"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 01:27:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="1077339442"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="1077339442"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 01:27:01 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qisXy-0008Va-2F;
	Wed, 20 Sep 2023 08:26:58 +0000
Date: Wed, 20 Sep 2023 16:26:07 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 5683/6619] sound/pci/hda/cirrus_scodec_test.c:40:
 undefined reference to `gpiochip_get_data'
Message-ID: <202309201646.NnjfKPWk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   926f75c8a5ab70567eb4c2d82fbc96963313e564
commit: 2144833e7b41459fa2d52bb0676f0ab4920cf32c [5683/6619] ALSA: hda: cirrus_scodec: Add KUnit test
config: x86_64-randconfig-016-20230822 (https://download.01.org/0day-ci/archive/20230920/202309201646.NnjfKPWk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201646.NnjfKPWk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201646.NnjfKPWk-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `cirrus_scodec_test_gpio_get':
>> sound/pci/hda/cirrus_scodec_test.c:40: undefined reference to `gpiochip_get_data'
   ld: vmlinux.o: in function `cirrus_scodec_test_gpio_probe':
>> sound/pci/hda/cirrus_scodec_test.c:94: undefined reference to `gpiochip_generic_request'
>> ld: sound/pci/hda/cirrus_scodec_test.c:94: undefined reference to `gpiochip_generic_free'
>> ld: sound/pci/hda/cirrus_scodec_test.c:95: undefined reference to `devm_gpiochip_add_data_with_key'


vim +40 sound/pci/hda/cirrus_scodec_test.c

    37	
    38	static int cirrus_scodec_test_gpio_get(struct gpio_chip *chip, unsigned int offset)
    39	{
  > 40		struct cirrus_scodec_test_gpio *gpio_priv = gpiochip_get_data(chip);
    41	
    42		return !!(gpio_priv->pin_state & BIT(offset));
    43	}
    44	
    45	static int cirrus_scodec_test_gpio_direction_out(struct gpio_chip *chip,
    46							 unsigned int offset, int value)
    47	{
    48		return -EOPNOTSUPP;
    49	}
    50	
    51	static void cirrus_scodec_test_gpio_set(struct gpio_chip *chip, unsigned int offset,
    52						int value)
    53	{
    54	}
    55	
    56	static int cirrus_scodec_test_gpio_set_config(struct gpio_chip *gc,
    57						      unsigned int offset,
    58						      unsigned long config)
    59	{
    60		switch (pinconf_to_config_param(config)) {
    61		case PIN_CONFIG_OUTPUT:
    62		case PIN_CONFIG_OUTPUT_ENABLE:
    63			return -EOPNOTSUPP;
    64		default:
    65			return 0;
    66		}
    67	}
    68	
    69	static const struct gpio_chip cirrus_scodec_test_gpio_chip = {
    70		.label			= "cirrus_scodec_test_gpio",
    71		.owner			= THIS_MODULE,
    72		.request		= gpiochip_generic_request,
    73		.free			= gpiochip_generic_free,
    74		.get_direction		= cirrus_scodec_test_gpio_get_direction,
    75		.direction_input	= cirrus_scodec_test_gpio_direction_in,
    76		.get			= cirrus_scodec_test_gpio_get,
    77		.direction_output	= cirrus_scodec_test_gpio_direction_out,
    78		.set			= cirrus_scodec_test_gpio_set,
    79		.set_config		= cirrus_scodec_test_gpio_set_config,
    80		.base			= -1,
    81		.ngpio			= 32,
    82	};
    83	
    84	static int cirrus_scodec_test_gpio_probe(struct platform_device *pdev)
    85	{
    86		struct cirrus_scodec_test_gpio *gpio_priv;
    87		int ret;
    88	
    89		gpio_priv = devm_kzalloc(&pdev->dev, sizeof(*gpio_priv), GFP_KERNEL);
    90		if (!gpio_priv)
    91			return -ENOMEM;
    92	
    93		/* GPIO core modifies our struct gpio_chip so use a copy */
  > 94		gpio_priv->chip = cirrus_scodec_test_gpio_chip;
  > 95		ret = devm_gpiochip_add_data(&pdev->dev, &gpio_priv->chip, gpio_priv);
    96		if (ret)
    97			return dev_err_probe(&pdev->dev, ret, "Failed to add gpiochip\n");
    98	
    99		dev_set_drvdata(&pdev->dev, gpio_priv);
   100	
   101		return 0;
   102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
