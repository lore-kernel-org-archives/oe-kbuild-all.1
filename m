Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31879165EFB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 09:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724836869; cv=none; b=t5H4GBoug9GT0QdFyx7KuRXTM3IFoFEvqDug7nQouUC46iSaEsKevOTbO/avlMRsRDtJt+d04s6W4X69A4Z1HqaaDMKtHa+0BM3E84EQIISm83cWIRHCLRRL3MY4TZwLzYIhP9PWQfcKiyjrOAvKd/Q6Di8g/4PfcA+aDnqKzPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724836869; c=relaxed/simple;
	bh=ZhDZ+AN6NLSzRJrYTmiKQa7saSWoS+qzLJqQmnJP9wA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nFFjUL0yeWMYEBUUs1hmJiw4bigUN7IOc/0/PwVWloKV5UEUS3ohjcHf9NnWnub/VUYGW1WRNmot/djwX46Nb2cqxHQJXx7l44GccrodNUQBVFCMaJ0Sv1RNbr2IoyMxkoFdSkyh/hwYzYscXmRreLAMrrvosn8vfTP9RNruFp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bn0v8lnA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bn0v8lnA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724836867; x=1756372867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZhDZ+AN6NLSzRJrYTmiKQa7saSWoS+qzLJqQmnJP9wA=;
  b=bn0v8lnAZSAhyqSwUAdQm+OYLCBCnwyoYVR5lbXjro9SpONs8ihYa73x
   fU9tDtiW/0xSwGtiNwpCBT2zK3qQ+Ky2Zw7Pcwt6YMT/GpCMu3SFNjzdA
   6Z2138mdFhppvbJ48FGW7Gu4ShSKam+NP+XSvIUjgPwjQk/AYlGISAzwJ
   uWkllBeR+1uv2GkwdPpvf2fxMMRggzm8UzktWjSDUTD31YUx0TutsMiiz
   l2o+lIq2M+PFD/j8aI2sAhFFCbJ3dMn5XU24n/gkkZAu6b9cA+WRlTJNk
   GQyl3iNDD1o+93QbxBnpltV9RG2vUTivvjuaqw1oTMoUs3e/V1jUtlj3a
   w==;
X-CSE-ConnectionGUID: HnSzzBWFRAmAGKwZsaGy/A==
X-CSE-MsgGUID: dsD3qtwnS9Sxy9QJUrsAww==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="27152057"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="27152057"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 02:21:06 -0700
X-CSE-ConnectionGUID: ueQ00mOmRa2S2RIy/TLb5Q==
X-CSE-MsgGUID: N0Y7kS6FRkqh90jSkDBN4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="67839554"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Aug 2024 02:21:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjErP-000KjO-0m;
	Wed, 28 Aug 2024 09:21:03 +0000
Date: Wed, 28 Aug 2024 17:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6479/7353]
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c:142:23: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202408281749.gNRV7S8v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f923748057a4f6aa187e0d5b22990d633a48d12
commit: 9b82ec85ebb326d20553220945bad1cc203b8805 [6479/7353] Merge branch 'ib-sophgo-pintrl' into devel
config: sparc64-randconfig-r123-20240828 (https://download.01.org/0day-ci/archive/20240828/202408281749.gNRV7S8v-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240828/202408281749.gNRV7S8v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281749.gNRV7S8v-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:141:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *reg @@     got void [noderef] __iomem * @@
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:141:13: sparse:     expected void *reg
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:141:13: sparse:     got void [noderef] __iomem *
>> drivers/pinctrl/sophgo/pinctrl-cv18xx.c:142:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *reg @@
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:142:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:142:23: sparse:     got void *reg
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:146:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *reg @@     got void [noderef] __iomem * @@
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:146:21: sparse:     expected void *reg
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:146:21: sparse:     got void [noderef] __iomem *
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:147:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *reg @@
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:147:31: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:147:31: sparse:     got void *reg
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:152:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *reg @@     got void [noderef] __iomem * @@
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:152:21: sparse:     expected void *reg
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:152:21: sparse:     got void [noderef] __iomem *
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:153:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *reg @@
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:153:31: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:153:31: sparse:     got void *reg

vim +142 drivers/pinctrl/sophgo/pinctrl-cv18xx.c

a29d8e93e710e9 Inochi Amaoto 2024-08-02  120  
a29d8e93e710e9 Inochi Amaoto 2024-08-02  121  static void cv1800_pctrl_dbg_show(struct pinctrl_dev *pctldev,
a29d8e93e710e9 Inochi Amaoto 2024-08-02  122  				  struct seq_file *seq, unsigned int pin_id)
a29d8e93e710e9 Inochi Amaoto 2024-08-02  123  {
a29d8e93e710e9 Inochi Amaoto 2024-08-02  124  	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
a29d8e93e710e9 Inochi Amaoto 2024-08-02  125  	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
a29d8e93e710e9 Inochi Amaoto 2024-08-02  126  	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
a29d8e93e710e9 Inochi Amaoto 2024-08-02  127  	u32 value;
a29d8e93e710e9 Inochi Amaoto 2024-08-02  128  	void *reg;
a29d8e93e710e9 Inochi Amaoto 2024-08-02  129  
a29d8e93e710e9 Inochi Amaoto 2024-08-02  130  	if (pin->pin >> PIN_BGA_ID_OFFSET)
a29d8e93e710e9 Inochi Amaoto 2024-08-02  131  		seq_printf(seq, "pos: %c%u ",
a29d8e93e710e9 Inochi Amaoto 2024-08-02  132  			   'A' + (pin->pin >> PIN_BGA_ID_OFFSET) - 1,
a29d8e93e710e9 Inochi Amaoto 2024-08-02  133  			   pin->pin & PIN_BGA_ID_MASK);
a29d8e93e710e9 Inochi Amaoto 2024-08-02  134  	else
a29d8e93e710e9 Inochi Amaoto 2024-08-02  135  		seq_printf(seq, "pos: %u ", pin->pin);
a29d8e93e710e9 Inochi Amaoto 2024-08-02  136  
a29d8e93e710e9 Inochi Amaoto 2024-08-02  137  	seq_printf(seq, "power-domain: %s ",
a29d8e93e710e9 Inochi Amaoto 2024-08-02  138  		   cv1800_get_power_cfg_desc(pctrl, pin->power_domain));
a29d8e93e710e9 Inochi Amaoto 2024-08-02  139  	seq_printf(seq, "type: %s ", io_type_desc[type]);
a29d8e93e710e9 Inochi Amaoto 2024-08-02  140  
a29d8e93e710e9 Inochi Amaoto 2024-08-02  141  	reg = cv1800_pinctrl_get_component_addr(pctrl, &pin->mux);
a29d8e93e710e9 Inochi Amaoto 2024-08-02 @142  	value = readl(reg);
a29d8e93e710e9 Inochi Amaoto 2024-08-02  143  	seq_printf(seq, "mux: 0x%08x ", value);
a29d8e93e710e9 Inochi Amaoto 2024-08-02  144  
a29d8e93e710e9 Inochi Amaoto 2024-08-02  145  	if (pin->flags & CV1800_PIN_HAVE_MUX2) {
a29d8e93e710e9 Inochi Amaoto 2024-08-02  146  		reg = cv1800_pinctrl_get_component_addr(pctrl, &pin->mux2);
a29d8e93e710e9 Inochi Amaoto 2024-08-02  147  		value = readl(reg);
a29d8e93e710e9 Inochi Amaoto 2024-08-02  148  		seq_printf(seq, "mux2: 0x%08x ", value);
a29d8e93e710e9 Inochi Amaoto 2024-08-02  149  	}
a29d8e93e710e9 Inochi Amaoto 2024-08-02  150  
a29d8e93e710e9 Inochi Amaoto 2024-08-02  151  	if (type == IO_TYPE_1V8_ONLY || type == IO_TYPE_1V8_OR_3V3) {
a29d8e93e710e9 Inochi Amaoto 2024-08-02  152  		reg = cv1800_pinctrl_get_component_addr(pctrl, &pin->conf);
a29d8e93e710e9 Inochi Amaoto 2024-08-02  153  		value = readl(reg);
a29d8e93e710e9 Inochi Amaoto 2024-08-02  154  		seq_printf(seq, "conf: 0x%08x ", value);
a29d8e93e710e9 Inochi Amaoto 2024-08-02  155  	}
a29d8e93e710e9 Inochi Amaoto 2024-08-02  156  }
a29d8e93e710e9 Inochi Amaoto 2024-08-02  157  

:::::: The code at line 142 was first introduced by commit
:::::: a29d8e93e710e97863d5bb4e4b6079d6c7daab81 pinctrl: sophgo: add support for CV1800B SoC

:::::: TO: Inochi Amaoto <inochiama@outlook.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
