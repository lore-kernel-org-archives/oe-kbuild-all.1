Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3256FA5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 14:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693490546; x=1725026546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oFgD2uOthW5VTJgcCMxkO1gKkuaE4PhGVeDpwplazmQ=;
  b=cB+rbr+TrW0oehKR6S9gq5sP8HmKA3N2Q+uwuuI23MGGGzkS03yTod0i
   4saFCavG/AgSAG9DFFSvtf7E02EylB7+QKW2cqvvshYtQdI8662W1uRVL
   sTr3/U+/65rNcU9oHbL/vFL/T1OcRbHS73NSA3W1Q2FNJ8cawgTHTmzJT
   vr8Wms9XGoeoQaxk/BA4TfofE5QJg4MyJvCKstVlmCTiqdrqxHCRt35to
   vnDtw2An9hlM81WjfIbsLaJZGn8rXDqV9/Riv1yOo4ZwBZHtE3aJsll76
   ubqZ2+TVdNHHQdtqaBT1J+eJeFB6ZeJTiV2rMFulcXXYTjBuipi8+MU4Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="355452052"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="355452052"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 07:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="689367104"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="689367104"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 31 Aug 2023 07:01:52 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbiF3-0000DT-2f;
	Thu, 31 Aug 2023 14:01:49 +0000
Date: Thu, 31 Aug 2023 22:01:33 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.5 63/91]
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:139:9: error: implicit declaration
 of function 'seq_printf'; did you mean 'bstr_printf'?
Message-ID: <202308312146.GGNIF8pS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux dev-6.5
head:   f8eab14a32e81c6841991fdfe0d16e0f5c00d10f
commit: d1b688bc9da56fbc2462b9a2066f90859c66f386 [63/91] pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230831/202308312146.GGNIF8pS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312146.GGNIF8pS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312146.GGNIF8pS-lkp@intel.com/

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
