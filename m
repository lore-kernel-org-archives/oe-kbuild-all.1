Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D2B7E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Aug 2023 01:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691890590; x=1723426590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X8wRByXx/lbXnTIdrUTeBN28pRKlgyy6DikYYrZ9z+I=;
  b=ioS/VJor8FSq+uCgb5pn9GjaWYfqa+MXs3Pp2pp1yryRWRdI6tiqfCfn
   zjdP5FOBgmG46ntR6PDfRaafzBvnTw2dNAev3ny5iW4WPvCtRLync1GHe
   wWEaY6AdfgKiH8N9Ffgkut7wv+Y6P+aJq+e1e1fKzhTHV+tWQf5ZTPJKI
   FEns7b4uCDjBNY815EFQVJreZ+f1ucEgY5cSf7HilQxHoT1v+6jRVfjX0
   pmjcnodFiQclabD+N1KnjO0gDWsfs3//sAvn2obcmijlwTn1N+60vNHAx
   3geWonTmx6YNmyvI2vExnmv5qGvO5ZLSZRC3L5EL0ImOci2xmOazVdi63
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="458226953"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="458226953"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 18:36:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="762562056"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="762562056"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Aug 2023 18:36:28 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qV01r-0008su-1l;
	Sun, 13 Aug 2023 01:36:27 +0000
Date: Sun, 13 Aug 2023 09:35:54 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.5 65/93]
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:139:9: error: implicit declaration
 of function 'seq_printf'; did you mean 'bstr_printf'?
Message-ID: <202308130946.RV1MNTE5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux dev-6.5
head:   e874a83263bd783e23411cf6ab12622ac36362f5
commit: 0b62918c17f34944f5d285b32e36f05803e205bb [65/93] pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230813/202308130946.RV1MNTE5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308130946.RV1MNTE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308130946.RV1MNTE5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c: In function 'npcmgpio_dbg_show':
>> drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:139:9: error: implicit declaration of function 'seq_printf'; did you mean 'bstr_printf'? [-Werror=implicit-function-declaration]
     139 |         seq_printf(s, "DIN :%.8x DOUT:%.8x IE  :%.8x OE  :%.8x\n",
         |         ^~~~~~~~~~
         |         bstr_printf
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c: In function 'npcmgpio_direction_input':
>> drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:173:15: error: implicit declaration of function 'pinctrl_gpio_direction_input'; did you mean 'npcmgpio_direction_input'? [-Werror=implicit-function-declaration]
     173 |         ret = pinctrl_gpio_direction_input(offset + chip->base);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               npcmgpio_direction_input
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c: In function 'npcmgpio_direction_output':
>> drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:186:15: error: implicit declaration of function 'pinctrl_gpio_direction_output'; did you mean 'npcmgpio_direction_output'? [-Werror=implicit-function-declaration]
     186 |         ret = pinctrl_gpio_direction_output(offset + chip->base);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               npcmgpio_direction_output
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c: In function 'npcmgpio_gpio_request':
>> drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:198:15: error: implicit declaration of function 'pinctrl_gpio_request'; did you mean 'npcmgpio_gpio_request'? [-Werror=implicit-function-declaration]
     198 |         ret = pinctrl_gpio_request(offset + chip->base);
         |               ^~~~~~~~~~~~~~~~~~~~
         |               npcmgpio_gpio_request
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c: In function 'npcmgpio_gpio_free':
>> drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:207:9: error: implicit declaration of function 'pinctrl_gpio_free' [-Werror=implicit-function-declaration]
     207 |         pinctrl_gpio_free(offset + chip->base);
         |         ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +139 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c

   134	
   135	static void npcmgpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
   136	{
   137		struct npcm8xx_gpio *bank = gpiochip_get_data(chip);
   138	
 > 139		seq_printf(s, "DIN :%.8x DOUT:%.8x IE  :%.8x OE	 :%.8x\n",
   140			   ioread32(bank->base + NPCM8XX_GP_N_DIN),
   141			   ioread32(bank->base + NPCM8XX_GP_N_DOUT),
   142			   ioread32(bank->base + NPCM8XX_GP_N_IEM),
   143			   ioread32(bank->base + NPCM8XX_GP_N_OE));
   144		seq_printf(s, "PU  :%.8x PD  :%.8x DB  :%.8x POL :%.8x\n",
   145			   ioread32(bank->base + NPCM8XX_GP_N_PU),
   146			   ioread32(bank->base + NPCM8XX_GP_N_PD),
   147			   ioread32(bank->base + NPCM8XX_GP_N_DBNC),
   148			   ioread32(bank->base + NPCM8XX_GP_N_POL));
   149		seq_printf(s, "ETYP:%.8x EVBE:%.8x EVEN:%.8x EVST:%.8x\n",
   150			   ioread32(bank->base + NPCM8XX_GP_N_EVTYP),
   151			   ioread32(bank->base + NPCM8XX_GP_N_EVBE),
   152			   ioread32(bank->base + NPCM8XX_GP_N_EVEN),
   153			   ioread32(bank->base + NPCM8XX_GP_N_EVST));
   154		seq_printf(s, "OTYP:%.8x OSRC:%.8x ODSC:%.8x\n",
   155			   ioread32(bank->base + NPCM8XX_GP_N_OTYP),
   156			   ioread32(bank->base + NPCM8XX_GP_N_OSRC),
   157			   ioread32(bank->base + NPCM8XX_GP_N_ODSC));
   158		seq_printf(s, "OBL0:%.8x OBL1:%.8x OBL2:%.8x OBL3:%.8x\n",
   159			   ioread32(bank->base + NPCM8XX_GP_N_OBL0),
   160			   ioread32(bank->base + NPCM8XX_GP_N_OBL1),
   161			   ioread32(bank->base + NPCM8XX_GP_N_OBL2),
   162			   ioread32(bank->base + NPCM8XX_GP_N_OBL3));
   163		seq_printf(s, "SLCK:%.8x MLCK:%.8x\n",
   164			   ioread32(bank->base + NPCM8XX_GP_N_SPLCK),
   165			   ioread32(bank->base + NPCM8XX_GP_N_MPLCK));
   166	}
   167	
   168	static int npcmgpio_direction_input(struct gpio_chip *chip, unsigned int offset)
   169	{
   170		struct npcm8xx_gpio *bank = gpiochip_get_data(chip);
   171		int ret;
   172	
 > 173		ret = pinctrl_gpio_direction_input(offset + chip->base);
   174		if (ret)
   175			return ret;
   176	
   177		return bank->direction_input(chip, offset);
   178	}
   179	
   180	static int npcmgpio_direction_output(struct gpio_chip *chip,
   181					     unsigned int offset, int value)
   182	{
   183		struct npcm8xx_gpio *bank = gpiochip_get_data(chip);
   184		int ret;
   185	
 > 186		ret = pinctrl_gpio_direction_output(offset + chip->base);
   187		if (ret)
   188			return ret;
   189	
   190		return bank->direction_output(chip, offset, value);
   191	}
   192	
   193	static int npcmgpio_gpio_request(struct gpio_chip *chip, unsigned int offset)
   194	{
   195		struct npcm8xx_gpio *bank = gpiochip_get_data(chip);
   196		int ret;
   197	
 > 198		ret = pinctrl_gpio_request(offset + chip->base);
   199		if (ret)
   200			return ret;
   201	
   202		return bank->request(chip, offset);
   203	}
   204	
   205	static void npcmgpio_gpio_free(struct gpio_chip *chip, unsigned int offset)
   206	{
 > 207		pinctrl_gpio_free(offset + chip->base);
   208	}
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
