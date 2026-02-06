Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F66258ED5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 02:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770344082; cv=none; b=g/IP2z9NlEKU7zqlcPWvjc/cJ7QACSK2RHjn/Uz6szpu7wQaKlalTqflivNcw+c+83ufL6sb50PF4HLMcerwwqKfLa3IchNk4pVNF/CXD7IAqZpmdjnIVlYlcMyvFnd3QjuNcW39GWlzXGicHk/l8eCrhbNHRLU2rLBKIrCk2XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770344082; c=relaxed/simple;
	bh=am9foO/jX0SBgPDXcnsyvisgPNqucrfsprx/jw5aNi4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CLRU04B0fpbdl4ivDHAwFwaI7HhduVR57M/QoN2Ze39UXOvmF7RfVcaRWS+BMuhPqSxotuAePC983SD72X0RiSap9AAPgbxWkSMdTM9cHBAMEGOuaPcmt3ynugxlzHZXPBu5cSXSBnSB8OkaHANg+u3v1OSakSkxyIFzU9bePsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNZ583hw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNZ583hw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770344083; x=1801880083;
  h=date:from:to:cc:subject:message-id;
  bh=am9foO/jX0SBgPDXcnsyvisgPNqucrfsprx/jw5aNi4=;
  b=nNZ583hwpsRaJPLntI2ZlUMLX6Gs3AZXwypNIzjGpVeaMWAaAWtLL16L
   p5xae3Gxs7UCaZUcTpOdNf72e+cFGjr+2dWDEcEFAEDLrJdlQND5M5Rmp
   ZhmH7EGG5wr38FGjPJDeaU2YcGeDv0BWUZz4s2nl3hi3BNMnHvLClmqX0
   ZF5QUAgIZ1VzDSArasasbNoyJ/2uo9XmvoFmf2DEY744TTxIwUI9Ize2n
   h7GIIr/5cHEeVZcuB+YD1fND8gEo73kozVYq13nI+oFFp/EPGPhHTe8cc
   ID9m04TbMUZqJoi7veuYeKrWtLUN1FOHk8GZPxsk8cI9nXHdl20Jg6H+A
   A==;
X-CSE-ConnectionGUID: IBdzlUmfRR6kTXSGYyR0TQ==
X-CSE-MsgGUID: tDXfDF4gTGSKc9JVM7OnVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82992896"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="82992896"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 18:14:42 -0800
X-CSE-ConnectionGUID: UY6582LFTOSgzeqGTMv0hw==
X-CSE-MsgGUID: m2iOJ/R3Rpie9Lou6XlJgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="210123744"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Feb 2026 18:14:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voBMj-00000000kMi-1hu9;
	Fri, 06 Feb 2026 02:14:37 +0000
Date: Fri, 06 Feb 2026 10:14:18 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:bla 3/3] drivers/soc/microchip/mpfs-irqmux.c:40:17:
 warning: unused variable 'mux_done'
Message-ID: <202602061037.sQqGODh5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git bla
head:   13118e279d8d51d9042fa0abc6e9fcab067b738a
commit: 13118e279d8d51d9042fa0abc6e9fcab067b738a [3/3] wip
config: arm-multi_v4t_defconfig (https://download.01.org/0day-ci/archive/20260206/202602061037.sQqGODh5-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602061037.sQqGODh5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602061037.sQqGODh5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/microchip/mpfs-irqmux.c:40:17: warning: unused variable 'mux_done' [-Wunused-variable]
           DECLARE_BITMAP(mux_done, 32) = {};
                          ^
   1 warning generated.


vim +/mux_done +40 drivers/soc/microchip/mpfs-irqmux.c

    36	
    37	static int mpfs_irqmux_probe(struct platform_device *pdev)
    38	{
    39		DECLARE_BITMAP(line_done, MPFS_IRQMUX_NUM_OUTPUTS) = {};
  > 40		DECLARE_BITMAP(mux_done, 32) = {};
    41		struct device *dev = &pdev->dev;
    42		struct device_node *np = dev->of_node;
    43		struct of_imap_parser imap_parser;
    44		struct of_imap_item imap_item;
    45		struct regmap *regmap;
    46		int ret, direct_mode, line, controller, gpio;
    47		u32 tmp, val = 0;
    48	
    49		regmap = device_node_to_regmap(pdev->dev.parent->of_node);
    50		if (IS_ERR(regmap))
    51			return dev_err_probe(dev, PTR_ERR(regmap), "Failed to find syscon regmap\n");
    52	
    53		/* We support only #interrupt-cells = <1> and #address-cells = <0> */
    54		ret = of_property_read_u32(np, "#interrupt-cells", &tmp);
    55		if (ret)
    56			return ret;
    57		if (tmp != 1)
    58			return -EINVAL;
    59	
    60		ret = of_property_read_u32(np, "#address-cells", &tmp);
    61		if (ret)
    62			return ret;
    63		if (tmp != 0)
    64			return -EINVAL;
    65	
    66		ret = of_imap_parser_init(&imap_parser, np, &imap_item);
    67		if (ret)
    68			return ret;
    69	
    70		for_each_of_imap_item(&imap_parser, &imap_item) {
    71	
    72			direct_mode = mpfs_irqmux_is_direct_mode(dev, &imap_item.parent_args);
    73			if (direct_mode < 0) {
    74				of_node_put(imap_item.parent_args.np); //why?
    75				return direct_mode;
    76			}
    77	
    78			line = imap_item.child_imap[0];
    79			gpio = line % 32;
    80			controller = line / 32;
    81	
    82			if (controller > 2) {
    83				of_node_put(imap_item.parent_args.np);
    84				dev_err(dev, "child interrupt number too large: %d\n", line);
    85				return -EINVAL;
    86			}
    87	
    88			if (test_and_set_bit(line, line_done)) {
    89				of_node_put(imap_item.parent_args.np);
    90				dev_err(dev, "Mux output line %d already defined in interrupt-map\n",
    91					line);
    92				return -EINVAL;
    93			}
    94	
    95			/*
    96			 * There are 41 interrupts assigned to GPIOs, of which 38 are "direct". Since the
    97			 * mux has 32 bits only, 6 of these exclusive/"direct" interrupts remain. These
    98			 * are used by GPIO controller 1's lines 18 to 23. Nothing needs to be done
    99			 * for these interrupts.
   100			 */
   101			if (controller == 1 && line >= 18)
   102				continue;
   103	
   104			/*
   105			 * The mux has a single register, where bits 0 to 13 mux between GPIO controller
   106			 * 1's 14 GPIOs and GPIO controller 2's first 14 GPIOs. The remaining bits mux
   107			 * between the first 18 GPIOs of controller 1 and the last 18 GPIOS of
   108			 * controller 2. If a bit in the mux's control register is set, the
   109			 * corresponding interrupt line for GPIO controller 0 or 1 will be put in
   110			 * "non-direct" mode. If cleared, the "fabric" controller's will.
   111			 *
   112			 * Register layout:
   113			 *    GPIO 1 interrupt line 17 | mux bit 31 | GPIO 2 interrupt line 31
   114			 *    ...                      | ...        | ...
   115			 *    ...                      | ...        | ...
   116			 *    GPIO 1 interrupt line  0 | mux bit 14 | GPIO 2 interrupt line 14
   117			 *    GPIO 0 interrupt line 13 | mux bit 13 | GPIO 2 interrupt line 13
   118			 *    ...                      | ...        | ...
   119			 *    ...                      | ...        | ...
   120			 *    GPIO 0 interrupt line  0 | mux bit  0 | GPIO 2 interrupt line  0
   121			 *
   122			 * As the binding mandates 70 items, one for each GPIO line, there's no need to
   123			 * handle anything for GPIO controller 2, since the bit will be set for the
   124			 * corresponding line in GPIO controller 0 or 1.
   125			 */
   126			if (controller == 2)
   127				continue;
   128	
   129			/*
   130			 * If in direct mode, the bit is cleared, nothing needs to be done as val is zero
   131			 * initialised and that's the direct mode setting for GPIO controller 0 and 1.
   132			 */
   133			if (direct_mode)
   134				continue;
   135	
   136			if (controller == 0)
   137				val |= 1U << gpio;
   138			else
   139				val |= 1U << (gpio + 14);
   140		}
   141	
   142		regmap_write(regmap, MPFS_IRQMUX_CR, val);
   143	
   144		return 0;
   145	}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
