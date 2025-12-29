Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49F2347C6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Dec 2025 04:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766981485; cv=none; b=p3QLJSSViOMu7PTvF8Sv6rC+afi1jrqhs1qXDirBpLwHOBzBVeq3Jq7YN3f/adnlOnMEXtsSN90RB7+lUxAdSN+s0CG05yF5VCu04RUzblvVsQyqaqyWNLJpRlF3MQm4CV0ytoG6RDPEkhEzALWmfsjvz7s3vCvgwAlOjUwo8Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766981485; c=relaxed/simple;
	bh=fMnsAlKWQXWLHVr3JmrlzxsnepCXcA/RGnkmhfw8Jvo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ksa0vkCAKyDznB3J14EFeu+mToByPauexX/wjHScdXAy7E3hY8qnJyt6b382tJDXCxIynUL8k0tUN0p/jlyOImBIm6BZFWrwhAMeVbxpMPGeWl0lX945Q6u59DDEJARPWmOxZ/z2dy6w9KfHAp7MWAHY7pC86XKQgAq683rjzMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYyUbHVI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYyUbHVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766981484; x=1798517484;
  h=date:from:to:cc:subject:message-id;
  bh=fMnsAlKWQXWLHVr3JmrlzxsnepCXcA/RGnkmhfw8Jvo=;
  b=GYyUbHVICmgKvkbXrCDC563Ptzx5s7ruP6Cx5EnqSJag94VXyZwU+G73
   t8UHhTDwVeAo0GSmsuH3RuzBHr/JljColyjjtTmsnCZowmLqUhdc48/Jy
   Cl8hPOShoMx8lKr0XgusZ3eL9AAYXorPX7RaAqDO4vbYkkNPlYhFdO8RU
   gl3hcrcSvZEQ82Ov0OsMVcy/r960bM1tDy50ztwsCw5vPN/vjmCDHLv3j
   SYys9P2biqvFztw9h5rPX4pQixVEUG5qkYCg33W8bCJ4P1fUP3tYPUpZn
   th8A6wyGdynxhjftpv55Q5bdl0ChY+3lLEb00+K9uXv5aP89UGnHb2Fnf
   A==;
X-CSE-ConnectionGUID: ETOEVWHsR5KZJScsrybN5Q==
X-CSE-MsgGUID: 6ODo4w6nS9SGLPvpI5zVNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="72448695"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="72448695"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 20:11:23 -0800
X-CSE-ConnectionGUID: m2nHOn2SSPKA7xqEXMC33g==
X-CSE-MsgGUID: 40CmezFYSsGlmus8UxRiLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="200558679"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Dec 2025 20:11:22 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1va4bH-000000006ux-3J5I;
	Mon, 29 Dec 2025 04:11:19 +0000
Date: Mon, 29 Dec 2025 12:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/v4h/wwdt 1/13]
 drivers/watchdog/renesas_wwdt.c:99 wwdt_probe() warn: inconsistent indenting
Message-ID: <202512291245.kJ1LNMYR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v4h/wwdt
head:   4d13c04a7a5190685177e8af3a0627205298fa2c
commit: 45e7bccb141fea293ed3a5218f7780c782849e02 [1/13] HACK: setup WWDT
config: m68k-randconfig-r073-20251229 (https://download.01.org/0day-ci/archive/20251229/202512291245.kJ1LNMYR-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512291245.kJ1LNMYR-lkp@intel.com/

smatch warnings:
drivers/watchdog/renesas_wwdt.c:99 wwdt_probe() warn: inconsistent indenting

vim +99 drivers/watchdog/renesas_wwdt.c

    71	
    72	static int wwdt_probe(struct platform_device *pdev)
    73	{
    74		struct device *dev = &pdev->dev;
    75		struct wwdt_priv *priv;
    76		struct watchdog_device *wdev;
    77		struct clk *clk;
    78		unsigned long rate;
    79		unsigned int interval, window_size;
    80		int ret;
    81		u8 val;
    82	
    83		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
    84		if (!priv)
    85			return -ENOMEM;
    86	
    87		priv->base = devm_platform_ioremap_resource(pdev, 0);
    88		if (IS_ERR(priv->base))
    89			return PTR_ERR(priv->base);
    90	
    91		clk = devm_clk_get(dev, "cnt");
    92		if (IS_ERR(clk))
    93			return PTR_ERR(clk);
    94	
    95		rate = clk_get_rate(clk);
    96		if (!rate)
    97			return -EINVAL;
    98	
  > 99	writeb(0x7b, priv->base + WDTA0MD);
   100	//writeb(0xac, priv->base + WDTA0WDTE);
   101	
   102		wdev = &priv->wdev;
   103	
   104		val = readb(priv->base + WDTA0WDTE);
   105		if (val & WDTA0RUN)
   106			set_bit(WDOG_HW_RUNNING, &wdev->status);
   107	
   108		val = readb(priv->base + WDTA0MD);
   109		interval = 1 << (9 + WDTA0OVF(val));
   110		/* size of the closed(!) window per mille */
   111		window_size = 250 * (3 - WDTA0WS(val));
   112	
   113		wdev->info = &wwdt_ident;
   114		wdev->ops = &wwdt_ops;
   115		wdev->parent = dev;
   116		wdev->min_hw_heartbeat_ms = window_size * interval / rate;
   117		wdev->max_hw_heartbeat_ms = 1000 * interval / rate;
   118		wdev->timeout = DIV_ROUND_UP(wdev->max_hw_heartbeat_ms, 1000);
   119		watchdog_set_nowayout(wdev, true);
   120	
   121		if (!(val & WDTA0ERM)) {
   122			ret = platform_get_irq_byname(pdev, "error");
   123			if (ret < 0)
   124				return ret;
   125	
   126			ret = devm_request_threaded_irq(dev, ret, NULL, wwdt_error_irq,
   127							IRQF_ONESHOT, NULL, dev);
   128			if (ret < 0)
   129				return ret;
   130		}
   131	
   132		if (val & WDTA0WIE) {
   133			ret = platform_get_irq_byname(pdev, "pretimeout");
   134			if (ret < 0)
   135				return ret;
   136	
   137			ret = devm_request_threaded_irq(dev, ret, NULL, wwdt_pretimeout_irq,
   138							IRQF_ONESHOT, NULL, wdev);
   139			if (ret < 0)
   140				return ret;
   141		}
   142	
   143		devm_watchdog_register_device(dev, wdev);
   144	
   145		return 0;
   146	}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
