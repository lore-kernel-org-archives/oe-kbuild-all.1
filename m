Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9C018DB0C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 07:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743750839; cv=none; b=sltE8wfe8+MxpGbTSH9jaz6CJLKuiCwTjNwuB7O1DGu87fR1qgm0R/+aJaQyhbjCXUrWZU2+7/RRsD6gc7t8uczc/Y+G9Zhbx+ipv1dRQJdDA5IPTyDCKmkevmjCJijlM+/tQmR/EgXfctXrSV37xSrcBQqTFVZwaB9hzMwFkDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743750839; c=relaxed/simple;
	bh=6Zd0QkeN/5EhwaOPCIp2aYWl503Ch90RMX9tpRtU45Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iavutAwKlxolx0FSyYJADTbd0G7r0UQzNMVvAs50k3U57zk08Fn/1DdA+iFWKB9M37Yo7lbYcH8aWea4v/cvfx8rd1nDhOTm8iDFprtq/0meOwGlQDlWvSIPeZxxiWMCwwF1oC8CxA6CjDmXfepkSPxBzGkXzw/fhKKvq1XXIB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ar+k/TSl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ar+k/TSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743750837; x=1775286837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Zd0QkeN/5EhwaOPCIp2aYWl503Ch90RMX9tpRtU45Q=;
  b=ar+k/TSl7qbxo27uYFFX1wgqip5eK0lProCC5ipZJ/aWFK2hgTyaqkfE
   7aiukJGzvGDBNLedA3V8fYP1i+nvnN2lMEvqm+nVVBheVKOBrVln7Rbcg
   SoZbCoh0jhEab2Ew0rIgHc9jGh80aCQGBwMhB9Ft9cX2e6fXUKpLGIyOS
   Oal2n/HXkgkwjBLDaUC1MtpFJO1BdY/s3GDBxrs8AnUlV3tLxWMA/IZTP
   rI6l3mSEbDw1To51tXi66wLzetjxm/inyVcQgWqy17r9hvxQfevb/DRt4
   91WFp4dS8v/Nzf10nHNCxyR2mu94EqEkTam71NN5nOGAMfM0pvzBsJ7K3
   A==;
X-CSE-ConnectionGUID: gVcSLMj8SCmlrKTg2RFy+A==
X-CSE-MsgGUID: KL3pfCbeRWO3X1XVFJHR3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="56170108"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="56170108"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 00:13:54 -0700
X-CSE-ConnectionGUID: a330aC0VRVK4/5egbNvdyQ==
X-CSE-MsgGUID: t1BzENuZQz++OTzF111PBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="132094174"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Apr 2025 00:13:54 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0bFP-00013P-0T;
	Fri, 04 Apr 2025 07:13:51 +0000
Date: Fri, 4 Apr 2025 15:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2024-05 17/17]
 sound/soc/hisilicon/hi3660-i2s.c:377:15: error: implicit declaration of
 function 'devm_pinctrl_get'
Message-ID: <202504041532.U1umWlVx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Youlin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10-2024-05
head:   2387d220c2a30a75a6b9335d405ec66cb4821617
commit: b4b11198edb99eb17a4d032c3a80854d3a817b0d [17/17] ANDROID: sound: Add hikey960 i2s audio driver
config: i386-randconfig-051-20250404 (https://download.01.org/0day-ci/archive/20250404/202504041532.U1umWlVx-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504041532.U1umWlVx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504041532.U1umWlVx-lkp@intel.com/

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
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
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
