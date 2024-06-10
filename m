Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74528A935
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 05:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717995762; cv=none; b=R3KVhNe7RVTgHlxKYOgUEtYfvVBrrBFoQJDdklnoeSNlJzQZeeP6ToauGTANZNLK+xxa5u9akDlL/nv8nHIDF8Qax37FdGMHY92LG00h8fRpFOtu1KvgpbJLOOECBmNjex7iBwaWM5jMbndn/5lrlnup+radD6K2be/btq1hZXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717995762; c=relaxed/simple;
	bh=rgrG4Xt9+RsaUyzfoKQ/gAQT11xJTKMRvKTjUH++FX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cMCWueDzi5Q0sH6D/S8nvvgVa5ZVP2T4YfyBPnueHTrRKqApvzR9o+gXSeQef2QAQhKkCfQkTi+bPIIdaNGMc+Oh8/+v4TsZy8HYFmxsROFuL3wyxXz0ItKpPOKYNpXhNyZ/3RG0tGtSux3MDzO5ovu0u241fTkZlHEm32QeeVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8dyQsmw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8dyQsmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717995760; x=1749531760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rgrG4Xt9+RsaUyzfoKQ/gAQT11xJTKMRvKTjUH++FX0=;
  b=e8dyQsmwnumQ3KIu/6pg/Ftpj9k6Z7vLjAWvlS1JMJVmFIgIW0paY7vv
   4C3DmtQVNolCtSCBdcLlon8rWikpt5M+wh0RmBQVONZLO2Vto9hh3afbO
   FvX/y6YxOWW62CO0oOAmnPTHnydfm8030ZgfeSBha9WU6PKh9d5LW0YLM
   SkpIEza9ngWvS4jPaCzsqpPl/KwWaCIjtXuc4VsDaGVKvjW+GTlYocwXS
   Lv+KeFxl4iUypuac2R2119Q1JqzTAkBLfUB5VZbXFyeM00CLYcRzcGZac
   sjnDrOiDKhw6STpVlzuL1NW/d9EeaUGJsYU42x5T+bPge4cvhuwRaiKyF
   A==;
X-CSE-ConnectionGUID: kUPJb6CRTmOBomysScAx5A==
X-CSE-MsgGUID: 4oK/3/gVT6e8yyZneQAyaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="18466906"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="18466906"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 22:02:39 -0700
X-CSE-ConnectionGUID: ruBvDUF5TuCLtadxNdTSKA==
X-CSE-MsgGUID: 2bX+ItxqTry44h9CxhSygQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="38775247"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jun 2024 22:02:38 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGXAy-0001sD-29;
	Mon, 10 Jun 2024 05:02:36 +0000
Date: Mon, 10 Jun 2024 13:02:25 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip 8/10] drivers/soc/renesas/pwc-rzv2m.c:111:17:
 error: 'struct gpio_chip' has no member named 'of_node'
Message-ID: <202406101227.PdqvY2pt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip
head:   9b6b51fe8dad7c7e6e091bd99901171e42b1b80c
commit: 173ce1029d0279450c67d72286625014fa30c3e1 [8/10] soc: renesas: Add PWC support for RZ/V2M
config: sh-randconfig-001-20240610 (https://download.01.org/0day-ci/archive/20240610/202406101227.PdqvY2pt-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406101227.PdqvY2pt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406101227.PdqvY2pt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/renesas/pwc-rzv2m.c: In function 'rzv2m_pwc_probe':
>> drivers/soc/renesas/pwc-rzv2m.c:111:17: error: 'struct gpio_chip' has no member named 'of_node'
     111 |         priv->gp.of_node = pdev->dev.of_node;
         |                 ^
   drivers/soc/renesas/pwc-rzv2m.c: At top level:
   drivers/soc/renesas/pwc-rzv2m.c:134:34: warning: 'rzv2m_pwc_of_match' defined but not used [-Wunused-const-variable=]
     134 | static const struct of_device_id rzv2m_pwc_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~


vim +111 drivers/soc/renesas/pwc-rzv2m.c

    86	
    87	static int rzv2m_pwc_probe(struct platform_device *pdev)
    88	{
    89		struct rzv2m_pwc_priv *priv;
    90		int ret;
    91	
    92		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
    93		if (!priv)
    94			return -ENOMEM;
    95	
    96		priv->base = devm_platform_ioremap_resource(pdev, 0);
    97		if (IS_ERR(priv->base))
    98			return PTR_ERR(priv->base);
    99	
   100		/*
   101		 * The register used by this driver cannot be read, therefore set the
   102		 * outputs to their default values and initialize priv->ch_en_bits
   103		 * accordingly. BIT 16 enables write to BIT 0, BIT 17 enables write to
   104		 * BIT 1, and the default value of both BIT 0 and BIT 1 is 0.
   105		 */
   106		writel(BIT(17) | BIT(16), priv->base + PWC_GPIO);
   107		bitmap_zero(priv->ch_en_bits, 2);
   108	
   109		priv->gp = rzv2m_pwc_gc;
   110		priv->gp.parent = pdev->dev.parent;
 > 111		priv->gp.of_node = pdev->dev.of_node;
   112	
   113		ret = devm_gpiochip_add_data(&pdev->dev, &priv->gp, priv);
   114		if (ret)
   115			return ret;
   116	
   117		if (device_property_read_bool(&pdev->dev, "renesas,rzv2m-pwc-power")) {
   118			if (pm_power_off) {
   119				char symname[KSYM_NAME_LEN];
   120	
   121				lookup_symbol_name((ulong)pm_power_off, symname);
   122				dev_err(&pdev->dev, "pm_power_off already claimed %p %s",
   123					pm_power_off, symname);
   124				return -EBUSY;
   125	
   126			}
   127			priv_pwc = priv;
   128			pm_power_off = rzv2m_pwc_poweroff;
   129		}
   130	
   131		return ret;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
