Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A732C142623
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 11:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728903842; cv=none; b=lE2hAUIkjh5RljE2PNmRHuR96GTlgcw6to/88EG6KocFLVin/I7tM/hQ0hQ8Ctkoym6k3NxI8zLTlp7zJ988S0b8dgukkFnBoLOR/7kYVpWdFSaGjvBT2worcch3VgartVi6312RHyi1JScZXG0JhNt3nfIeTf2r3ALD4ILkm88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728903842; c=relaxed/simple;
	bh=6Z4qVQURxf1SBvWmJUcKVMoh9gyQmgUmfiRwicDgfn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ODNlmZRo5o/Qe9M3hGbnGT8JJaaXS0sFekQLcHvR0X6zW86NB6EYYIoldldLe3QjAxe25lHpZWnP+iEr96ucG76o8QViRyKL8YyUJloowxvIqG2eW6inP53PPWzJPt3GWI62WGMqETAs4oyOK3RutBchiEBVPKFGhld/G0bqooM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hAnqO4oK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hAnqO4oK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728903841; x=1760439841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Z4qVQURxf1SBvWmJUcKVMoh9gyQmgUmfiRwicDgfn4=;
  b=hAnqO4oKIWyebM1+0gjduuGmy/UoMX4Lc41zn/yiJx4ze5k1kc2bQZCi
   YqXLwEK4FZ1S8QYvSGSRT+6NRgKffiWmyZfkAVoU/5OczsM1TkGCDMCSo
   quydF15fNZG97TuLCsVgZoltFBU0ep35Rwt0KKWNDanPK5vQhZ7zwZXuv
   QLLXpxbaY4fbEijWx0A+La0jw+Sd2QKiIFY6QuMKmkIZRWhxhKovHclKq
   ephY0WrIxjwdBgdIW1n9pWbkV2vRFh0mhjkIO6ut2ccYEskb0rwr5Qx3H
   p3ZyRb65JCEbeHqFHk6V3MJXWudBi4XNXkNHPhWDIkiOSkU3l838MY81F
   A==;
X-CSE-ConnectionGUID: 9PBGQz9+Sji4//xby2nYxQ==
X-CSE-MsgGUID: iMckNntHTfSWQ3oyUSFULA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="53666299"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="53666299"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:04:00 -0700
X-CSE-ConnectionGUID: qlm+E1GxRrmupCF6mIpLsQ==
X-CSE-MsgGUID: IaUQYsy5TkKiHthimQwC3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="82169098"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Oct 2024 04:03:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Irl-000FD1-0h;
	Mon, 14 Oct 2024 11:03:57 +0000
Date: Mon, 14 Oct 2024 19:03:54 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip-rebase 633/1105]
 drivers/soc/renesas/pwc-rzv2m.c:111:17: error: 'struct gpio_chip' has no
 member named 'of_node'
Message-ID: <202410141826.TibBqlDg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rebase
head:   3cdd0cc9c0e53917e2c4e56b1e7256ae8923845e
commit: 3d9a05a9222314475269b92d395182af60e878b7 [633/1105] soc: renesas: Add PWC support for RZ/V2M
config: sh-randconfig-001-20241014 (https://download.01.org/0day-ci/archive/20241014/202410141826.TibBqlDg-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410141826.TibBqlDg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141826.TibBqlDg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/soc/renesas/pwc-rzv2m.c: In function 'rzv2m_pwc_probe':
>> drivers/soc/renesas/pwc-rzv2m.c:111:17: error: 'struct gpio_chip' has no member named 'of_node'
     111 |         priv->gp.of_node = pdev->dev.of_node;
         |                 ^
   drivers/soc/renesas/pwc-rzv2m.c: At top level:
>> drivers/soc/renesas/pwc-rzv2m.c:134:34: warning: 'rzv2m_pwc_of_match' defined but not used [-Wunused-const-variable=]
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
 > 134	static const struct of_device_id rzv2m_pwc_of_match[] = {
   135		{ .compatible = "renesas,rzv2m-pwc" },
   136		{ /* sentinel */ }
   137	};
   138	MODULE_DEVICE_TABLE(of, rzv2m_pwc_of_match);
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
