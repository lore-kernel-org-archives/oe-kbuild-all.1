Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E2F175A72
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 04:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772684358; cv=none; b=la4G5IUGDisEW4ttXzvigA791GBZIzAzh3JYF3aGIj9bx/PYYdlGc/Jrh+fHwJ2lmB5aXTwU3hooWQ6LP90KlStsTYB4aT53boXY85pgERAuR2KgRUDzH2067ha6t+Tka+1JB9C+759BjepW2jYYWT2D11nSdXYA9kj/9ITr3A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772684358; c=relaxed/simple;
	bh=8k8VxzIJCm3P3XbxgtvGrUeB80nG1xh4D5m6qaQ/hMw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mi5ZPef/STAzCagIzw3XzIhb2woMCqg/AbWLSvZhppgqa7TEBJfr+i5PnBXDuIPhz1IBqUqu5s+6bNRLzUz29ryRQTpOseE7spYKdtMBoNDqFR/JYEUP//UG4NJYOi3Dpw40lxNTGcnpfdsYtd8yXXJF6f8FF6xG6rISC7y4jjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXPYUvcQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXPYUvcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772684356; x=1804220356;
  h=date:from:to:cc:subject:message-id;
  bh=8k8VxzIJCm3P3XbxgtvGrUeB80nG1xh4D5m6qaQ/hMw=;
  b=HXPYUvcQrMIVS4OHDgQD9+rM9ahXNGxf41iVVdWNT/1ICEvt44yGmGQ4
   3Q/D/tWpIwEsZI2Pxl4et5KYvF5IaS4Y/6Ob3wak+m/D2te0Bv0C0VFHQ
   tHEacsLoNM/AgNmUBdDoigFJ7We5lwjTUwg+ZR2y0KNTrAoRB6SjkDpno
   0CZT+h/oNWbaWzHxsgZMT2keMEFiLK943PSpqFmobPPUibSdMjmvc+tk+
   eZWJUY+fkNXPHKD287OhK9RW2w3FJzgHRNCqKjbol4CbUoCGoWWA4IrB/
   gJW4lWdAwqJJlWKBpMjlaqKhWFn8EUnvBQnTzLNRiKtGC4XNo1uPogoeU
   A==;
X-CSE-ConnectionGUID: XRjgnjRwSNOxI+wE+NoJCQ==
X-CSE-MsgGUID: qICeppieQQivnHZLyfLuYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84395060"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="84395060"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 20:19:16 -0800
X-CSE-ConnectionGUID: L9lQNdy9T4eF4NEgGj4zyg==
X-CSE-MsgGUID: cJm2wuOlRJSzBni8DTmM4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="216375829"
Received: from lkp-server02.sh.intel.com (HELO 456988d8841c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 04 Mar 2026 20:19:14 -0800
Received: from kbuild by 456988d8841c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy0B5-0000000005I-3ipt;
	Thu, 05 Mar 2026 04:19:11 +0000
Date: Thu, 05 Mar 2026 12:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/hwspinlock/refactor-alloc-buildtest 9/15]
 drivers/hwspinlock/sun6i_hwspinlock.c:79:37: sparse: sparse: incorrect type
 in initializer (different address spaces)
Message-ID: <202603051126.2x9rC4eq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest
head:   f2fc589840b1a727d4318cd5e9fc99d23fb3a35c
commit: 6cf446cd69a124a4fbb6b76368c566bb8a6ad44e [9/15] hwspinlock: sun6i: use new callback to initialize hwspinlock priv
config: microblaze-randconfig-r121-20260304 (https://download.01.org/0day-ci/archive/20260305/202603051126.2x9rC4eq-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051126.2x9rC4eq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051126.2x9rC4eq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hwspinlock/sun6i_hwspinlock.c:65:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void * @@
   drivers/hwspinlock/sun6i_hwspinlock.c:65:55: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/sun6i_hwspinlock.c:65:55: sparse:     got void *
   drivers/hwspinlock/sun6i_hwspinlock.c:72:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void * @@
   drivers/hwspinlock/sun6i_hwspinlock.c:72:55: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/sun6i_hwspinlock.c:72:55: sparse:     got void *
>> drivers/hwspinlock/sun6i_hwspinlock.c:79:37: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *io_base_ofs @@     got void *init_data @@
   drivers/hwspinlock/sun6i_hwspinlock.c:79:37: sparse:     expected void [noderef] __iomem *io_base_ofs
   drivers/hwspinlock/sun6i_hwspinlock.c:79:37: sparse:     got void *init_data
>> drivers/hwspinlock/sun6i_hwspinlock.c:81:28: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   drivers/hwspinlock/sun6i_hwspinlock.c:81:28: sparse:     expected void *
   drivers/hwspinlock/sun6i_hwspinlock.c:81:28: sparse:     got void [noderef] __iomem *
>> drivers/hwspinlock/sun6i_hwspinlock.c:183:82: sparse: sparse: incorrect type in argument 6 (different address spaces) @@     expected void *init_data @@     got void [noderef] __iomem * @@
   drivers/hwspinlock/sun6i_hwspinlock.c:183:82: sparse:     expected void *init_data
   drivers/hwspinlock/sun6i_hwspinlock.c:183:82: sparse:     got void [noderef] __iomem *

vim +79 drivers/hwspinlock/sun6i_hwspinlock.c

    76	
    77	static void *sun6i_hwspinlock_init_priv(int local_id, void *init_data)
    78	{
  > 79		void __iomem *io_base_ofs = init_data;
    80	
  > 81		return io_base_ofs + sizeof(u32) * local_id;
    82	}
    83	
    84	static const struct hwspinlock_ops sun6i_hwspinlock_ops = {
    85		.trylock	= sun6i_hwspinlock_trylock,
    86		.unlock		= sun6i_hwspinlock_unlock,
    87		.init_priv	= sun6i_hwspinlock_init_priv,
    88	};
    89	
    90	static void sun6i_hwspinlock_disable(void *data)
    91	{
    92		struct sun6i_hwspinlock_data *priv = data;
    93	
    94		debugfs_remove_recursive(priv->debugfs);
    95		clk_disable_unprepare(priv->ahb_clk);
    96		reset_control_assert(priv->reset);
    97	}
    98	
    99	static int sun6i_hwspinlock_probe(struct platform_device *pdev)
   100	{
   101		struct sun6i_hwspinlock_data *priv;
   102		void __iomem *io_base;
   103		u32 num_banks;
   104		int err;
   105	
   106		io_base = devm_platform_ioremap_resource(pdev, SPINLOCK_BASE_ID);
   107		if (IS_ERR(io_base))
   108			return PTR_ERR(io_base);
   109	
   110		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
   111		if (!priv)
   112			return -ENOMEM;
   113	
   114		priv->ahb_clk = devm_clk_get(&pdev->dev, "ahb");
   115		if (IS_ERR(priv->ahb_clk)) {
   116			err = PTR_ERR(priv->ahb_clk);
   117			dev_err(&pdev->dev, "unable to get AHB clock (%d)\n", err);
   118			return err;
   119		}
   120	
   121		priv->reset = devm_reset_control_get(&pdev->dev, "ahb");
   122		if (IS_ERR(priv->reset))
   123			return dev_err_probe(&pdev->dev, PTR_ERR(priv->reset),
   124					     "unable to get reset control\n");
   125	
   126		err = reset_control_deassert(priv->reset);
   127		if (err) {
   128			dev_err(&pdev->dev, "deassert reset control failure (%d)\n", err);
   129			return err;
   130		}
   131	
   132		err = clk_prepare_enable(priv->ahb_clk);
   133		if (err) {
   134			dev_err(&pdev->dev, "unable to prepare AHB clk (%d)\n", err);
   135			goto clk_fail;
   136		}
   137	
   138		/*
   139		 * bit 28 and 29 represents the hwspinlock setup
   140		 *
   141		 * every datasheet (A64, A80, A83T, H3, H5, H6 ...) says the default value is 0x1 and 0x1
   142		 * to 0x4 represent 32, 64, 128 and 256 locks
   143		 * but later datasheets (H5, H6) say 00, 01, 10, 11 represent 32, 64, 128 and 256 locks,
   144		 * but that would mean H5 and H6 have 64 locks, while their datasheets talk about 32 locks
   145		 * all the time, not a single mentioning of 64 locks
   146		 * the 0x4 value is also not representable by 2 bits alone, so some datasheets are not
   147		 * correct
   148		 * one thing have all in common, default value of the sysstatus register is 0x10000000,
   149		 * which results in bit 28 being set
   150		 * this is the reason 0x1 is considered being 32 locks and bit 30 is taken into account
   151		 * verified on H2+ (datasheet 0x1 = 32 locks) and H5 (datasheet 01 = 64 locks)
   152		 */
   153		num_banks = readl(io_base + SPINLOCK_SYSSTATUS_REG) >> 28;
   154		switch (num_banks) {
   155		case 1 ... 4:
   156			priv->nlocks = 1 << (4 + num_banks);
   157			break;
   158		default:
   159			err = -EINVAL;
   160			dev_err(&pdev->dev, "unsupported hwspinlock setup (%d)\n", num_banks);
   161			goto bank_fail;
   162		}
   163	
   164		priv->bank = devm_kzalloc(&pdev->dev, struct_size(priv->bank, lock, priv->nlocks),
   165					  GFP_KERNEL);
   166		if (!priv->bank) {
   167			err = -ENOMEM;
   168			goto bank_fail;
   169		}
   170	
   171		/* failure of debugfs is considered non-fatal */
   172		sun6i_hwspinlock_debugfs_init(priv);
   173		if (IS_ERR(priv->debugfs))
   174			priv->debugfs = NULL;
   175	
   176		err = devm_add_action_or_reset(&pdev->dev, sun6i_hwspinlock_disable, priv);
   177		if (err) {
   178			dev_err(&pdev->dev, "failed to add hwspinlock disable action\n");
   179			goto bank_fail;
   180		}
   181	
   182		return devm_hwspin_lock_register(&pdev->dev, priv->bank, &sun6i_hwspinlock_ops,
 > 183						 SPINLOCK_BASE_ID, priv->nlocks, io_base + SPINLOCK_LOCK_REGN);
   184	
   185	bank_fail:
   186		clk_disable_unprepare(priv->ahb_clk);
   187	clk_fail:
   188		reset_control_assert(priv->reset);
   189	
   190		return err;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
