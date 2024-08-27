Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F03B34CDD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 07:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724743446; cv=none; b=NU7qNQRglwpTBYjMn9/Av9i5en/rtbKXWD3FCo4iAwqzwYBX2C6O6h3wL8pvVEUEsi/Z0q5bf/IMjhgjnaJHGokuzYsOZtIF+fo0rWx+jmGpp3hYygX8/WjAIjFsoDvvI0iYqmNDng55imRG7oC8MhNHwgu+kNaSTy6k3ohIO5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724743446; c=relaxed/simple;
	bh=CmAEHmdNY372YYGRlSDiF87NPY+C419Qi1N72n8+vAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d7fSSy+EeflpUtV4cF/rTWkK9jBjioVzWbBW1EESjeNaupRW9rrjy6uoaSbzMEGjfMdYcI/6Azj3fDrlDB4pw51UY9eb4Had5b3ABSLuB8N5u7dZ5cmZC5Rq/uZhB76z3FUAoAucHB5hYAIgEZv0kxrUTnOWrraugsCMmC8nHPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuDiJJWt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuDiJJWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724743444; x=1756279444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CmAEHmdNY372YYGRlSDiF87NPY+C419Qi1N72n8+vAw=;
  b=VuDiJJWtTkSkk9hzLWgRdATCDpsp0/3MeQxSZIU4NiPOc8VdrP6EoKM7
   ieowMxs7Zpt0I3T+Vfe1tPYmR/CIRXuyqJTEfX646+0RHCjLJdEPuEGo+
   aq8BEbz8L/Oyw4qjA6S+EYiHLO3NGGOC7EoLgAB8BVCXC1L8NeNrM4RYF
   hsCj3za3K4InQDKRhqRrmjCPHw8QcsuEr6Pr/SxjLYoEGfkX6GC6heuU1
   dSlp/WH7GzGwjYvO+bH3GH0s0JMs8M6WrX7Ce7dsEQPxi+eyBeGiFBnn4
   6pesyIh+zhjCJj0AYGTYEA+9D5WnM6wLTicFoq0Z2FIcepwuAyBfxZ2xh
   A==;
X-CSE-ConnectionGUID: Lf7pFyZWTrqc40FQsN10Tw==
X-CSE-MsgGUID: NEbz0itGQb+vODlAaQdIoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26998402"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="26998402"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 00:24:03 -0700
X-CSE-ConnectionGUID: hN9JsKL2RTOIz1OROTxihg==
X-CSE-MsgGUID: jFCPbgRPQKaUIB6OqpMIvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="62448277"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Aug 2024 00:24:02 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siqYa-000IEU-0r;
	Tue, 27 Aug 2024 07:24:00 +0000
Date: Tue, 27 Aug 2024 15:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6490/6966]
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c:141:13: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202408271555.kpOmi9I8-lkp@intel.com>
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
commit: 9b82ec85ebb326d20553220945bad1cc203b8805 [6490/6966] Merge branch 'ib-sophgo-pintrl' into devel
config: m68k-randconfig-r111-20240827 (https://download.01.org/0day-ci/archive/20240827/202408271555.kpOmi9I8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240827/202408271555.kpOmi9I8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408271555.kpOmi9I8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/sophgo/pinctrl-cv18xx.c:141:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *reg @@     got void [noderef] __iomem * @@
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:141:13: sparse:     expected void *reg
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:141:13: sparse:     got void [noderef] __iomem *
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:146:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *reg @@     got void [noderef] __iomem * @@
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:146:21: sparse:     expected void *reg
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:146:21: sparse:     got void [noderef] __iomem *
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:152:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *reg @@     got void [noderef] __iomem * @@
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:152:21: sparse:     expected void *reg
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:152:21: sparse:     got void [noderef] __iomem *
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c: note: in included file (through include/linux/mmzone.h, arch/m68k/include/asm/virtconvert.h, arch/m68k/include/asm/io_no.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

vim +141 drivers/pinctrl/sophgo/pinctrl-cv18xx.c

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
a29d8e93e710e9 Inochi Amaoto 2024-08-02 @141  	reg = cv1800_pinctrl_get_component_addr(pctrl, &pin->mux);
a29d8e93e710e9 Inochi Amaoto 2024-08-02  142  	value = readl(reg);
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

:::::: The code at line 141 was first introduced by commit
:::::: a29d8e93e710e97863d5bb4e4b6079d6c7daab81 pinctrl: sophgo: add support for CV1800B SoC

:::::: TO: Inochi Amaoto <inochiama@outlook.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
