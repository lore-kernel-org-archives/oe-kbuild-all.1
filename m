Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12189A38
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 02:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717986001; cv=none; b=ee1XUjgbaFP7RmlZw1Qzu/zLjbKwUUmgrQZYm4qWJzzgIj+4GecMKuHBPkvlAIHJQM6QtHYuIv2p3LWjlzy8KLKEcP3oiuph3fssD6lFiiS729UOQVVHY31rGuABHGM5Vq/kxietVE+iBCgqxjspGcY/HSMsK1AdzUJB1QwiJu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717986001; c=relaxed/simple;
	bh=UWM72VsyFG7zS1tukIYGp/JQRFJ2A+Gn5ClknSJ/1FI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EN/LYdCNap6hMvUIXA4NF1x/YMZ7zCq5tM4wFktPJn3pBMnmPjUI9rZEmkgynyDtvrkRyYBc48vZCsYIYLUn3UZnGG4hxnBcpnKeOi+hugJiD63v+CXPCF1oLROzIDBXfzEAhdaKt2ZVuNHpgKz0+cAxHXg804i3DIv9YRv8Pdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXZwARG7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXZwARG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717986000; x=1749522000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UWM72VsyFG7zS1tukIYGp/JQRFJ2A+Gn5ClknSJ/1FI=;
  b=LXZwARG73FPsiSyN2vo5OMAF2B1tPeF+qbeKmLAeyNffJqLbvqNG2+wP
   nr1Q1IVcjUE6XddLc2z/o2iO8YJjsFNQCDoyUwISa5XhOfpVxeaevLXuP
   k4M6m7YkwxqbTNg+chojl3pu3hND9VPJhEJIszR5JoG2gpH/5OGw1UnHv
   OahNZ0K7FGYkwwiAphJDAu0ZytXR1JDNH7iDxwLYebCnpXpP/BrFjXh1u
   8EHcO6J+0BHb9dZEsdGJ25+HvkEdDB/RjAXNHNxR5RsvtPtn3NcCxPO8Z
   JAlMHithsD/lrkXdgrqHSRWEud4UuKGrei/fCIc16t6BhHRzG2HtVA0w7
   w==;
X-CSE-ConnectionGUID: 7ehqvALfTTCTiFeZPU/FBg==
X-CSE-MsgGUID: b4ZGNKOxRuicqba0SlzbvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="32124221"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="32124221"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 19:20:00 -0700
X-CSE-ConnectionGUID: F1NS5OmaTvyNmEl3nuAr3Q==
X-CSE-MsgGUID: SdHtTkCUSnqFj1S0UB6Z7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="38999412"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Jun 2024 19:19:59 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGUdY-0001la-0p;
	Mon, 10 Jun 2024 02:19:56 +0000
Date: Mon, 10 Jun 2024 10:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip 8/10] drivers/soc/renesas/pwc-rzv2m.c:111:11:
 error: no member named 'of_node' in 'struct gpio_chip'
Message-ID: <202406101042.GHzToyPP-lkp@intel.com>
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
config: hexagon-randconfig-002-20240610 (https://download.01.org/0day-ci/archive/20240610/202406101042.GHzToyPP-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406101042.GHzToyPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406101042.GHzToyPP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/soc/renesas/pwc-rzv2m.c:8:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:1527:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/soc/renesas/pwc-rzv2m.c:111:11: error: no member named 'of_node' in 'struct gpio_chip'
     111 |         priv->gp.of_node = pdev->dev.of_node;
         |         ~~~~~~~~ ^
   1 warning and 1 error generated.


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
