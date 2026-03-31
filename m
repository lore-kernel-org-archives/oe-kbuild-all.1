Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1E73590A9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 20:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774989586; cv=none; b=TD8UkMB+J+D/ueiyYTUUWDd5l/YDucwtP0MavW1/lj7ZIJ9D1OdnCVNGDvD/0bcmW9WKVgoIl1JXEXt9KHxUJqr0mZSYn7Dl0aWurpr7RbzILvKxw7xzxXxWsAUb1oFKfat9re/Ax+ZWqG/y/5eFC3KL7RIl5HcvxVrl6L86txY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774989586; c=relaxed/simple;
	bh=Hx+3cvUMUejAbOqb7/PMAlGDbKHVhYfGs7d/FkUFFw8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mUEZ25kEqtxRUya7g4uyigsoUqc95IDhvepHP6gWSFUy4QQMTpf46tFtZZD4o6S7XmRp1bSAu8cGhPNIxRNq6QToxj6NghXKY+HB6VKqjHNpWenSHLsYQxWy1RRug4VMJ7Of8u5h/wp9iMYY2Nomx74C3yKwO0zLjeQl16rcIUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D1IvC75A; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1IvC75A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774989583; x=1806525583;
  h=date:from:to:cc:subject:message-id;
  bh=Hx+3cvUMUejAbOqb7/PMAlGDbKHVhYfGs7d/FkUFFw8=;
  b=D1IvC75AXLBl7TGVeb7mevXD7RuAjOzbUU4TdbxjoTMAgrvToEkLLTkU
   aESXZ+LmPpmqfRVil8TkpsdEkCjTvx/hfJEjcxgwG+gA7jO9w96QbQnAV
   PaR9Kf6NyLimzJ5UzekddTQHAX966tkgHZvpxUzKi8vreXLQdC6hTGRnO
   ga9PIAjG9bmq6J97oX3IL2kBmhvKwhrBC+bETButuBKzl9z6sKpCgSliz
   TE2UbGetfk6a1It3jMMl+ugntP0OSBtRBXPHInIz6QkQ+DpC0SXJLpeta
   jKYmBVh6TDNpImAQb3LofyRh7R0OgzGkZTBNBAMDGjH+6n3D8ehl2Zywr
   Q==;
X-CSE-ConnectionGUID: QF6XC80yQyKfE+k24Izerg==
X-CSE-MsgGUID: EJeku/CrT0SkiDkkWTWNGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87091639"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="87091639"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 13:39:43 -0700
X-CSE-ConnectionGUID: zgA/cmJ0QQWH3uTEWKH7Dw==
X-CSE-MsgGUID: p4J9Q50aSDiLM3tbQYeeTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="228071198"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Mar 2026 13:39:41 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7fsA-000000004Ej-4Bi3;
	Tue, 31 Mar 2026 20:39:39 +0000
Date: Wed, 01 Apr 2026 04:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-09 0/1]
 sound/soc/hisilicon/hi3660-i2s.c:384:26: warning: assignment to 'struct
 pinctrl_state *' from 'int' makes pointer from integer without a cast
Message-ID: <202604010402.AiRkWes1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Youlin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-09
head:   9e4026c962c3d8db024264b8c2c370a7e7941fc4
commit: b4b11198edb99eb17a4d032c3a80854d3a817b0d [0/1] ANDROID: sound: Add hikey960 i2s audio driver
config: i386-buildonly-randconfig-001-20260401 (https://download.01.org/0day-ci/archive/20260401/202604010402.AiRkWes1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010402.AiRkWes1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010402.AiRkWes1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/hisilicon/hi3660-i2s.c: In function 'hi3660_i2s_probe':
   sound/soc/hisilicon/hi3660-i2s.c:377:22: error: implicit declaration of function 'devm_pinctrl_get'; did you mean 'of_pinctrl_get'? [-Werror=implicit-function-declaration]
     377 |         i2s->pctrl = devm_pinctrl_get(dev);
         |                      ^~~~~~~~~~~~~~~~
         |                      of_pinctrl_get
   sound/soc/hisilicon/hi3660-i2s.c:377:20: warning: assignment to 'struct pinctrl *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     377 |         i2s->pctrl = devm_pinctrl_get(dev);
         |                    ^
   sound/soc/hisilicon/hi3660-i2s.c:384:28: error: implicit declaration of function 'pinctrl_lookup_state' [-Werror=implicit-function-declaration]
     384 |         i2s->pin_default = pinctrl_lookup_state(i2s->pctrl,
         |                            ^~~~~~~~~~~~~~~~~~~~
>> sound/soc/hisilicon/hi3660-i2s.c:384:26: warning: assignment to 'struct pinctrl_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     384 |         i2s->pin_default = pinctrl_lookup_state(i2s->pctrl,
         |                          ^
   sound/soc/hisilicon/hi3660-i2s.c:394:13: error: implicit declaration of function 'pinctrl_select_state' [-Werror=implicit-function-declaration]
     394 |         if (pinctrl_select_state(i2s->pctrl, i2s->pin_default)) {
         |             ^~~~~~~~~~~~~~~~~~~~
   sound/soc/hisilicon/hi3660-i2s.c: In function 'hi3660_i2s_remove':
   sound/soc/hisilicon/hi3660-i2s.c:422:9: error: implicit declaration of function 'pinctrl_put'; did you mean 'of_pinctrl_get'? [-Werror=implicit-function-declaration]
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
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
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


vim +384 sound/soc/hisilicon/hi3660-i2s.c

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
   377		i2s->pctrl = devm_pinctrl_get(dev);
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
   394		if (pinctrl_select_state(i2s->pctrl, i2s->pin_default)) {
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
