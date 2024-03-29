Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E321D3987C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 06:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711695340; cv=none; b=kSz1h/rWKotTL0Mt9FL0Mf4mDlrRof2QLEl+9ivrIcxCn9AxooYk2cH8g5bwKmbVJBH974NP5IIdRjAfT7+LzKumDMqST+HyHtlo4jchONBW2dmhnJhcArmgFJQwHprqFzvw8FMGmXq4urp6i7VbMTlCw9NKwkMHYruTpMcEzSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711695340; c=relaxed/simple;
	bh=zjrk+EUdGWhGiMHTVOS5Pxy7neSJaJpQv87Xm4rFnJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t7oac/bPfgZ0ln4XAzZPJg4w8GB6irnt5Y5Pv0nf0TzMFUH2z3KdFtAPO6cHoSfE5dlbK2ln7FueXwxa1eaCKSGObum1ENu6heLV4NIt+29W+jpZ73+gyrnYGcKM3eHorXJ5+O13rnj/GofOD3FSoIIc2s/VXwWd1RhykcePFis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TL+5xSdG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TL+5xSdG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711695339; x=1743231339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zjrk+EUdGWhGiMHTVOS5Pxy7neSJaJpQv87Xm4rFnJw=;
  b=TL+5xSdGJvbLL1pvgO6CJ8fngwc7r7AKrgH05a5CxZqirdr9zSYU4GBV
   p9sQJV+1/Tqk2KOj2JolwN9Jn4mnhnce9Q3ZerM5ZL0DUfim4pvL+3UzR
   2jdkDObQUZiw787Af4vQjhvUptANNLpcqFc7nV1SGKewhf+Rnp59mIl3g
   236VVpQp+aPu/LnrSuYPxvrdOUK8PiJiKlkm6r0cST20Nyuy6K1L0fl9v
   i1iZllgvIrpzr+EsV2gc+HNRlKtxoyrL7hSqU3+JZxvpnenGtu2LMMYI8
   /mBNpB81X8ix+Y+JZKX3cijcU4sagvWF3dThznMoAfcL7li1V5d4wO7NU
   Q==;
X-CSE-ConnectionGUID: qnn+3MGGQaSn6mo28S8pwg==
X-CSE-MsgGUID: vhEl6U5DTeKxb6QJ0fQufg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="29362330"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="29362330"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 23:55:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="21632205"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Mar 2024 23:55:38 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq69H-0002va-0B;
	Fri, 29 Mar 2024 06:55:35 +0000
Date: Fri, 29 Mar 2024 14:55:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 1986/30000]
 sound/soc/hisilicon/hi3660-i2s.c:377:15: error: implicit declaration of
 function 'devm_pinctrl_get'
Message-ID: <202403291433.TkgiLz0b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   7746001142852a80db54ea04ccb10429ea6d7a01
commit: b4b11198edb99eb17a4d032c3a80854d3a817b0d [1986/30000] ANDROID: sound: Add hikey960 i2s audio driver
config: x86_64-buildonly-randconfig-001-20240329 (https://download.01.org/0day-ci/archive/20240329/202403291433.TkgiLz0b-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291433.TkgiLz0b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291433.TkgiLz0b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/hisilicon/hi3660-i2s.c:377:15: error: implicit declaration of function 'devm_pinctrl_get' [-Werror,-Wimplicit-function-declaration]
     377 |         i2s->pctrl = devm_pinctrl_get(dev);
         |                      ^
   sound/soc/hisilicon/hi3660-i2s.c:377:15: note: did you mean 'of_pinctrl_get'?
   include/linux/pinctrl/pinctrl.h:193:21: note: 'of_pinctrl_get' declared here
     193 | struct pinctrl_dev *of_pinctrl_get(struct device_node *np)
         |                     ^
>> sound/soc/hisilicon/hi3660-i2s.c:377:13: error: incompatible integer to pointer conversion assigning to 'struct pinctrl *' from 'int' [-Wint-conversion]
     377 |         i2s->pctrl = devm_pinctrl_get(dev);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/hisilicon/hi3660-i2s.c:384:21: error: implicit declaration of function 'pinctrl_lookup_state' [-Werror,-Wimplicit-function-declaration]
     384 |         i2s->pin_default = pinctrl_lookup_state(i2s->pctrl,
         |                            ^
>> sound/soc/hisilicon/hi3660-i2s.c:384:19: error: incompatible integer to pointer conversion assigning to 'struct pinctrl_state *' from 'int' [-Wint-conversion]
     384 |         i2s->pin_default = pinctrl_lookup_state(i2s->pctrl,
         |                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     385 |                                         PINCTRL_STATE_DEFAULT);
         |                                         ~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/hisilicon/hi3660-i2s.c:394:6: error: implicit declaration of function 'pinctrl_select_state' [-Werror,-Wimplicit-function-declaration]
     394 |         if (pinctrl_select_state(i2s->pctrl, i2s->pin_default)) {
         |             ^
>> sound/soc/hisilicon/hi3660-i2s.c:422:2: error: implicit declaration of function 'pinctrl_put' [-Werror,-Wimplicit-function-declaration]
     422 |         pinctrl_put(i2s->pctrl);
         |         ^
   6 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for MAC80211_LEDS
   Depends on [n]: NET [=y] && WIRELESS [=y] && MAC80211 [=y] && (LEDS_CLASS [=m]=y || LEDS_CLASS [=m]=MAC80211 [=y])
   Selected by [m]:
   - IWLEGACY [=m] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_INTEL [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/devm_pinctrl_get +377 sound/soc/hisilicon/hi3660-i2s.c

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
