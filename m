Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792611668;
	b=DsuU9UK/9D0Kf2MgOBx+9af0XC8jgZj3Dm7eCc7ExPxLBT+vyEevqb0zjv0W2bveTa9E
	 0W6Dyw0f5xmiMGw7pX7yRvKkNPTRdwKSk1V6UozXfbYZqoKBvZouCAVCduBl+Ck3fhlqV
	 V2FiP2ThxS4pCkm88D4SU+NLreubZeq/UdFXmaWsWk8iPRQv0KaMwLpqYpNAVzvut9wgH
	 h2FrytvTJu7ZRrvBh9ApHR9PxI5HDl1blbONVwJYb290omy+1E9Op6QgXCtgvac3Nhk1h
	 u2nDOofYl7mqO0L7nNUwnLIwKFwu8qSrOAuwOkLuaQL7PHg2H0ecLPm7uifVVKO+vKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792611668;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cpwZ43acN8LH/ri5353dznILIx+90VxWhqRuvn8qb9o=;
	b=n+baoOjhpVbc0mAPFNlDOTavPtEhEJGXqJ3+54fP3RpuDA5Ki613wjViLr005/+y3dhq
	 AwfBsV724QjFrgZS0hL3mytSx4uCDCKY8GGcPM/94CWyikc/mSFAjrBkBwNe642RNZK6F
	 cTWnqpuo2BeNJqTNvD4Ir3o5hduxPf0izyR7P8npeS1AkdbD1j+9hug516QZ9DqM7vQG3
	 s3UO3kBJMSIRLYFywm7h+e+mMPFAIHVyf8ILIGStZcmDUfwph/V0q/nrRjfPuZ/JBVzR6
	 TiBDKqQwCjUPgtpKA0EExB2+I7luzZanbPYYYZ5uLX+ZIL9n10iCfimSn2KUFJuB82A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tvimorbo;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB3C606A319
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 19:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CB3C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tvimorbo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792611669; x=1824147669;
  h=date:from:to:cc:subject:message-id;
  bh=HkZN96/7tH/EYozDmYuk0K6+tsR7kgP1T9O7eYDNF7A=;
  b=Tvimorbod7mXrrwADXEcRkmegtwLgreMT0ptRVqs16oXsD4uHnfXCfz7
   Nt3Y3AxuXTiZHTari6pxR19o//TemCNnRyuzgVrlrRFgjESkFuy5h/fjq
   y/4dNOVjAuMu0y0ClPdHX3qFznqkngq6ggIJKDN6zZHBwaOOtggEfGcAO
   Ss5RMApG75yTroxFFZigEeoVex9boPuNFpKDP3vWgWC6JoZGlIWpg0g53
   XsDdnnyTINQuvtPAzv3cRY92iV7S8FNV5qY+oVy+wpoPJpXz4qFVeW75T
   VyDznKw/ysA8nxRta/6ylZjzR9BzJrLachTWgJF+Agi8I/3ZI+a0suCvu
   Q==;
X-CSE-ConnectionGUID: fMih1/9/TomKkc7iphu8kQ==
X-CSE-MsgGUID: AwVenDkQT1mjzvibqn2TPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1251286"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1251286"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:41:08 -0700
X-CSE-ConnectionGUID: ck3J89e6QIeo5JKOprtfig==
X-CSE-MsgGUID: 0fTMgZ2DQbazf1xoXnI8CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3570617"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Oct 2026 12:41:07 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJcBM-00000000PzO-1LOX;
	Wed, 21 Oct 2026 19:41:04 +0000
Date: Thu, 22 Oct 2026 03:40:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 0/3]
 sound/soc/hisilicon/hi3660-i2s.c:377:22: error: implicit declaration of
 function 'devm_pinctrl_get'; did you mean 'of_pinctrl_get'?
Message-ID: <202610220315.dPu7aNHz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Youlin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   d071d2b9ad81d1b4a78e728e2eb5664ffcd6635a
commit: b4b11198edb99eb17a4d032c3a80854d3a817b0d [0/3] ANDROID: sound: Add hikey960 i2s audio driver
config: i386-buildonly-randconfig-1005-20261022 (https://download.01.org/0day-ci/archive/20261022/202610220315.dPu7aNHz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610220315.dPu7aNHz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610220315.dPu7aNHz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/hisilicon/hi3660-i2s.c: In function 'hi3660_i2s_probe':
>> sound/soc/hisilicon/hi3660-i2s.c:377:22: error: implicit declaration of function 'devm_pinctrl_get'; did you mean 'of_pinctrl_get'? [-Werror=implicit-function-declaration]
     377 |         i2s->pctrl = devm_pinctrl_get(dev);
         |                      ^~~~~~~~~~~~~~~~
         |                      of_pinctrl_get
>> sound/soc/hisilicon/hi3660-i2s.c:377:20: warning: assignment to 'struct pinctrl *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     377 |         i2s->pctrl = devm_pinctrl_get(dev);
         |                    ^
>> sound/soc/hisilicon/hi3660-i2s.c:384:28: error: implicit declaration of function 'pinctrl_lookup_state' [-Werror=implicit-function-declaration]
     384 |         i2s->pin_default = pinctrl_lookup_state(i2s->pctrl,
         |                            ^~~~~~~~~~~~~~~~~~~~
>> sound/soc/hisilicon/hi3660-i2s.c:384:26: warning: assignment to 'struct pinctrl_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     384 |         i2s->pin_default = pinctrl_lookup_state(i2s->pctrl,
         |                          ^
>> sound/soc/hisilicon/hi3660-i2s.c:394:13: error: implicit declaration of function 'pinctrl_select_state' [-Werror=implicit-function-declaration]
     394 |         if (pinctrl_select_state(i2s->pctrl, i2s->pin_default)) {
         |             ^~~~~~~~~~~~~~~~~~~~
   sound/soc/hisilicon/hi3660-i2s.c: In function 'hi3660_i2s_remove':
>> sound/soc/hisilicon/hi3660-i2s.c:422:9: error: implicit declaration of function 'pinctrl_put'; did you mean 'of_pinctrl_get'? [-Werror=implicit-function-declaration]
     422 |         pinctrl_put(i2s->pctrl);
         |         ^~~~~~~~~~~
         |         of_pinctrl_get
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +377 sound/soc/hisilicon/hi3660-i2s.c

   332	
   333	static int hi3660_i2s_probe(struct platform_device *pdev)
   334	{
   335		struct device *dev = &pdev->dev;
   336		struct hi3660_i2s *i2s;
   337		struct resource *res;
   338		int ret;
   339	
   340		i2s = devm_kzalloc(dev, sizeof(*i2s), GFP_KERNEL);
   341		if (!i2s)
   342			return -ENOMEM;
   343	
   344		i2s->dev = dev;
   345		spin_lock_init(&i2s->lock);
   346	
   347		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   348		if (!res) {
   349			ret = -ENODEV;
   350			return ret;
   351		}
   352		i2s->base_phys = (phys_addr_t)res->start;
   353	
   354		i2s->dai = dai_init;
   355		dev_set_drvdata(&pdev->dev, i2s);
   356	
   357		i2s->base = devm_ioremap_resource(dev, res);
   358		if (IS_ERR(i2s->base)) {
   359			dev_err(&pdev->dev, "ioremap failed\n");
   360			ret = PTR_ERR(i2s->base);
   361			return ret;
   362		}
   363	
   364		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
   365		if (!res) {
   366			ret = -ENODEV;
   367			return ret;
   368		}
   369		i2s->base_syscon = devm_ioremap(dev, res->start, resource_size(res));
   370		if (IS_ERR(i2s->base_syscon)) {
   371			dev_err(&pdev->dev, "ioremap failed\n");
   372			ret = PTR_ERR(i2s->base_syscon);
   373			return ret;
   374		}
   375	
   376		/* i2s iomux config */
 > 377		i2s->pctrl = devm_pinctrl_get(dev);
   378		if (IS_ERR(i2s->pctrl)) {
   379			dev_err(dev, "could not get pinctrl\n");
   380			ret = -EIO;
   381			return ret;
   382		}
   383	
 > 384		i2s->pin_default = pinctrl_lookup_state(i2s->pctrl,
   385						PINCTRL_STATE_DEFAULT);
   386		if (IS_ERR(i2s->pin_default)) {
   387			dev_err(dev,
   388				"could not get default state (%li)\n",
   389				PTR_ERR(i2s->pin_default));
   390			ret = -EIO;
   391			return ret;
   392		}
   393	
 > 394		if (pinctrl_select_state(i2s->pctrl, i2s->pin_default)) {
   395			dev_err(dev, "could not set pins to default state\n");
   396			ret = -EIO;
   397			return ret;
   398		}
   399	
   400		ret = devm_snd_dmaengine_pcm_register(&pdev->dev,
   401					&dmaengine_pcm_config, 0);
   402		if (ret)
   403			return ret;
   404	
   405		ret = snd_soc_register_component(&pdev->dev, &component_driver,
   406					&i2s->dai, 1);
   407		if (ret) {
   408			dev_err(&pdev->dev, "Failed to register dai\n");
   409			return ret;
   410		}
   411	
   412		return 0;
   413	}
   414	
   415	static int hi3660_i2s_remove(struct platform_device *pdev)
   416	{
   417		struct hi3660_i2s *i2s = dev_get_drvdata(&pdev->dev);
   418	
   419		snd_soc_unregister_component(&pdev->dev);
   420		dev_set_drvdata(&pdev->dev, NULL);
   421	
 > 422		pinctrl_put(i2s->pctrl);
   423	
   424		return 0;
   425	}
   426	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
