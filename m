Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316901BDAA0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 14:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728917308; cv=none; b=TMXKj17hNx8BMJoNCqoAgWw4iWC5HB96TBA10e6al+PipoRljrJyluMvx1lnFJsvCWtEad7ooOZo+RLjEtbLfe/JfKv+zzz0+mkuWeaNCipqHTG7IXYELOj8s7o5uVDrr2FB+EjqNevNDfhUDeM/d0JsC9y6He3B3GKpWll2gsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728917308; c=relaxed/simple;
	bh=3mwMTHgAHxUv46c3Tf9NLY2pyjg2ZSEokJNlq+Z+riQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sig3MNSjjbVg2L6UnNrEVFOAflam9L9b6C20ymcroedk74rEe/xEaHjEW1EnGUJ+1wU9kLeeJKfKBmh3WDWgp0YHCzo+eJmGKcxgE2xkcE9eWEtHLs43iuUFSvFKrutdKVUGboJ79C9G6Xj7anbF8A9EmmvNgLsV6+kK08WJGxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dOh5s4ES; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dOh5s4ES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728917306; x=1760453306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3mwMTHgAHxUv46c3Tf9NLY2pyjg2ZSEokJNlq+Z+riQ=;
  b=dOh5s4ESEi3wt9j7BEwRhy7QGJTBLPof9FL+cN/AxzS2s9hSY7Rkopui
   kNAE7ZGp2tYA5PipMdEjrA/jti3T48RGA+r8+lRGkDrMDVOMbUAGfA6Mv
   O4eMYW/Zet0csu04Z3j8V5HGXGrjnqN7bMB4oCG89mGKN9j1nSm8joumo
   /oYt9Mgcf7Bl3sh5F+nRECl6xFH/2RAFNfZVz5OAmoGHndZ1KFw10D82k
   48G6cwHX28O67PiS2C61G3j5KrtsKUGKtplgx1i/PE8VoIRtXffuZD7hU
   zshVWLnLvo/KyrZIogUzg/8aun8qbWtDZ7d+M+tYi7U1zq+lKyhuJfky7
   w==;
X-CSE-ConnectionGUID: fG95jRuNTMiTb3ueKGeDrA==
X-CSE-MsgGUID: SmD6b2mHQ3m0ArCDIoObOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28152651"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="28152651"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 07:48:24 -0700
X-CSE-ConnectionGUID: ZS80EkwIQj2/d0xSmAxhtA==
X-CSE-MsgGUID: lvSlDYKAQCiYybP8FV/iyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="77700377"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Oct 2024 07:48:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0MMv-000Fou-19;
	Mon, 14 Oct 2024 14:48:21 +0000
Date: Mon, 14 Oct 2024 22:48:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip-rebase 633/1105]
 drivers/soc/renesas/pwc-rzv2m.c:111:11: error: no member named 'of_node' in
 'struct gpio_chip'
Message-ID: <202410142249.peaFau3K-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-006-20241014 (https://download.01.org/0day-ci/archive/20241014/202410142249.peaFau3K-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410142249.peaFau3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410142249.peaFau3K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/renesas/pwc-rzv2m.c:111:11: error: no member named 'of_node' in 'struct gpio_chip'
     111 |         priv->gp.of_node = pdev->dev.of_node;
         |         ~~~~~~~~ ^
   1 error generated.


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
