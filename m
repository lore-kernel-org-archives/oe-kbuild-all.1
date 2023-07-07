Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9A5C13C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 11:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688728139; x=1720264139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4lISRVET6Z8VawbPPb1j5FwFUCZ4l0Owh4M0nH5kx2I=;
  b=aQpn/aQtS1Qqp+h47J4D7ZtGzviABbXdIlN78UbO9s3JWyZtZvufzU16
   cfuqpS942mTdeGkCj2kY3lnZSHTnsL64gbbZggCW91JvN4zJNM4jtVeuW
   OU/SeCoIjn60ZrIUtLaV84QLZAvzrThDM+NlLeKzBwS6NK++iS2BWDWwz
   bnQK3TIy/u+T3yDj5kmj0gK9Y5aKF8ZMZvIojjOsjul65ZTmVwYl5UQtk
   7ZaMQ87mRr2DIaHZs8Th981nI7jDsTxFtuwJZZkmeYdM8/um1MlSBZvXN
   8jGkmWcoRwVFEc6wP6jf46svDtE1bGHE5e9IiNqsuNPaZCqWmOPagO26r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394629756"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="394629756"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 04:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="785334534"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="785334534"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Jul 2023 04:08:57 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHjKa-0001xG-1C;
	Fri, 07 Jul 2023 11:08:56 +0000
Date: Fri, 7 Jul 2023 19:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 223/266]
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1871:9: error: implicit
 declaration of function 'for_each_gpiochip_node'; did you mean
 'for_each_matching_node'?
Message-ID: <202307071824.HASB2j34-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   b4323aff06a7923128031fc9af5b8e33e8fef08a
commit: 223290ba65db09a86bced2ce35474c60212e100f [223/266] pinctrl: npcm7xx: Switch to use for_each_gpiochip_node() helper
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230707/202307071824.HASB2j34-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071824.HASB2j34-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071824.HASB2j34-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c: In function 'npcm7xx_gpio_of':
>> drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1871:9: error: implicit declaration of function 'for_each_gpiochip_node'; did you mean 'for_each_matching_node'? [-Werror=implicit-function-declaration]
    1871 |         for_each_gpiochip_node(dev, child) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         for_each_matching_node
>> drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1871:43: error: expected ';' before '{' token
    1871 |         for_each_gpiochip_node(dev, child) {
         |                                           ^~
         |                                           ;
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1869:13: warning: unused variable 'id' [-Wunused-variable]
    1869 |         int id = 0;
         |             ^~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1867:38: warning: unused variable 'args' [-Wunused-variable]
    1867 |         struct fwnode_reference_args args;
         |                                      ^~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1865:25: warning: unused variable 'res' [-Wunused-variable]
    1865 |         struct resource res;
         |                         ^~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c: At top level:
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:334:30: warning: 'npcmgpio_irqchip' defined but not used [-Wunused-const-variable=]
     334 | static const struct irq_chip npcmgpio_irqchip = {
         |                              ^~~~~~~~~~~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:209:13: warning: 'npcmgpio_gpio_free' defined but not used [-Wunused-function]
     209 | static void npcmgpio_gpio_free(struct gpio_chip *chip, unsigned int offset)
         |             ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:196:12: warning: 'npcmgpio_gpio_request' defined but not used [-Wunused-function]
     196 | static int npcmgpio_gpio_request(struct gpio_chip *chip, unsigned int offset)
         |            ^~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:180:12: warning: 'npcmgpio_direction_output' defined but not used [-Wunused-function]
     180 | static int npcmgpio_direction_output(struct gpio_chip *chip,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:130:13: warning: 'npcmgpio_dbg_show' defined but not used [-Wunused-function]
     130 | static void npcmgpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
         |             ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1871 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c

  1861	
  1862	static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
  1863	{
  1864		int ret = -ENXIO;
  1865		struct resource res;
  1866		struct device *dev = pctrl->dev;
  1867		struct fwnode_reference_args args;
  1868		struct fwnode_handle *child;
  1869		int id = 0;
  1870	
> 1871		for_each_gpiochip_node(dev, child) {
  1872			struct device_node *np = to_of_node(child);
  1873	
  1874			ret = of_address_to_resource(np, 0, &res);
  1875			if (ret < 0) {
  1876				dev_err(dev, "Resource fail for GPIO bank %u\n", id);
  1877				return ret;
  1878			}
  1879	
  1880			pctrl->gpio_bank[id].base = ioremap(res.start, resource_size(&res));
  1881	
  1882			ret = bgpio_init(&pctrl->gpio_bank[id].gc, dev, 4,
  1883					 pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DIN,
  1884					 pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DOUT,
  1885					 NULL,
  1886					 NULL,
  1887					 pctrl->gpio_bank[id].base + NPCM7XX_GP_N_IEM,
  1888					 BGPIOF_READ_OUTPUT_REG_SET);
  1889			if (ret) {
  1890				dev_err(dev, "bgpio_init() failed\n");
  1891				return ret;
  1892			}
  1893	
  1894			ret = fwnode_property_get_reference_args(child, "gpio-ranges", NULL, 3, 0, &args);
  1895			if (ret < 0) {
  1896				dev_err(dev, "gpio-ranges fail for GPIO bank %u\n", id);
  1897				return ret;
  1898			}
  1899	
  1900			ret = irq_of_parse_and_map(np, 0);
  1901			if (ret < 0) {
  1902				dev_err(dev, "No IRQ for GPIO bank %u\n", id);
  1903				return ret;
  1904			}
  1905			pctrl->gpio_bank[id].irq = ret;
  1906			pctrl->gpio_bank[id].irq_chip = npcmgpio_irqchip;
  1907			pctrl->gpio_bank[id].irqbase = id * NPCM7XX_GPIO_PER_BANK;
  1908			pctrl->gpio_bank[id].pinctrl_id = args.args[0];
  1909			pctrl->gpio_bank[id].gc.base = args.args[1];
  1910			pctrl->gpio_bank[id].gc.ngpio = args.args[2];
  1911			pctrl->gpio_bank[id].gc.owner = THIS_MODULE;
  1912			pctrl->gpio_bank[id].gc.parent = dev;
  1913			pctrl->gpio_bank[id].gc.fwnode = child;
  1914			pctrl->gpio_bank[id].gc.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", child);
  1915			if (pctrl->gpio_bank[id].gc.label == NULL)
  1916				return -ENOMEM;
  1917	
  1918			pctrl->gpio_bank[id].gc.dbg_show = npcmgpio_dbg_show;
  1919			pctrl->gpio_bank[id].direction_input = pctrl->gpio_bank[id].gc.direction_input;
  1920			pctrl->gpio_bank[id].gc.direction_input = npcmgpio_direction_input;
  1921			pctrl->gpio_bank[id].direction_output = pctrl->gpio_bank[id].gc.direction_output;
  1922			pctrl->gpio_bank[id].gc.direction_output = npcmgpio_direction_output;
  1923			pctrl->gpio_bank[id].request = pctrl->gpio_bank[id].gc.request;
  1924			pctrl->gpio_bank[id].gc.request = npcmgpio_gpio_request;
  1925			pctrl->gpio_bank[id].gc.free = npcmgpio_gpio_free;
  1926			id++;
  1927		}
  1928	
  1929		pctrl->bank_num = id;
  1930		return ret;
  1931	}
  1932	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
