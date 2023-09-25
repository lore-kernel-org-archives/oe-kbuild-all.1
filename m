Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033AD224D8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 18:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695666280; x=1727202280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lbo6Vdh8Fhr9MzblTNI3gvybVho69lKVlQi3IByJG+8=;
  b=FEPq7Wb4TO6SSWUmxAvBj3Q9MtKF3l2LTj8/4zsn/SbU5NAAFJnoA2OR
   S6F7Z0My4I+v49ptIMpde0XdN2yCkStVcFYqQ9gVLtQK5EoHqg1r8g/lt
   A7IlnuE7wgHW71nGApDVt5T969jtHoVQLsPtvaNyls0cX5FEvJC/pU7pm
   eCWHnlZ0T9MOCxW3O7iwb4JJomiJJT2b5//7DGp5WzVpOJqKUm9mwGLae
   3qBl7Q38tBcN4n2azVQJhd2XqSfwnaRu3dpQQmgbsbxRghXh77iqo9P3c
   t350o8Oly3xOQ4+fDg/PEoPdMGvw+gTl517Q9JnPPO/KnNvRTyv2fdPfJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360709220"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="360709220"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 11:24:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="838642139"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="838642139"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Sep 2023 11:24:39 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkqG5-0001uJ-00;
	Mon, 25 Sep 2023 18:24:37 +0000
Date: Tue, 26 Sep 2023 02:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 5031/29496]
 sound/soc/hisilicon/hi3660-i2s.c:377:20: warning: assignment to 'struct
 pinctrl *' from 'int' makes pointer from integer without a cast
Message-ID: <202309260246.FR0WKf1E-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   38375ed3e0c57f2cc82efa1d7ee46ef8c74ea8dc
commit: b4b11198edb99eb17a4d032c3a80854d3a817b0d [5031/29496] ANDROID: sound: Add hikey960 i2s audio driver
config: i386-randconfig-012-20230926 (https://download.01.org/0day-ci/archive/20230926/202309260246.FR0WKf1E-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260246.FR0WKf1E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260246.FR0WKf1E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/hisilicon/hi3660-i2s.c: In function 'hi3660_i2s_probe':
   sound/soc/hisilicon/hi3660-i2s.c:377:22: error: implicit declaration of function 'devm_pinctrl_get'; did you mean 'of_pinctrl_get'? [-Werror=implicit-function-declaration]
     377 |         i2s->pctrl = devm_pinctrl_get(dev);
         |                      ^~~~~~~~~~~~~~~~
         |                      of_pinctrl_get
>> sound/soc/hisilicon/hi3660-i2s.c:377:20: warning: assignment to 'struct pinctrl *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
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
