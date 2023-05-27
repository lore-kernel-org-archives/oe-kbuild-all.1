Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50E5D52C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 21:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685222656; x=1716758656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ig5fa3iviXekJ9GWD0OhLcgrEs0110aHVX+/BUsA6vw=;
  b=mjDb5f4IWT4XNbpjMK6mv9ePaXNHLH+MEBvzVck2bKIYoehL7U6ixeij
   +ohvAEDqtZp4gCKn1Zw8nAPCb+ibhWJY5yinPV0n9b/LZkrprFdM94WJU
   ajmo/z+TBJDQ12bH2uvJdIBC/Puo0c9Gg6iMIiCffnhSn41LPqEFVWYL0
   +I3Vwd/vtkL3wYXHLFR/HlE/cipTbJEDt0Ofp5nGuBnx5gDWQutM7N15G
   eTH1P5mlsD5BDFm5NzbCfXcqaC+cHaM8mYHPLivpBsRki71exSyOs8s7R
   x7V7CZpmP76EtWL6PBPKEHkGZ6ERbdHI5G5zYH1253hTsatVh3r9sJLaq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="353290127"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="353290127"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 14:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="817938401"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="817938401"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 May 2023 14:24:15 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q31OY-000KC3-1I;
	Sat, 27 May 2023 21:24:14 +0000
Date: Sun, 28 May 2023 05:23:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:arcvm12-5.10 5031/27651]
 sound/soc/hisilicon/hi3660-i2s.c:377:22: error: implicit declaration of
 function 'devm_pinctrl_get'; did you mean 'of_pinctrl_get'?
Message-ID: <202305280552.lDQ1cTln-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common arcvm12-5.10
head:   fb8d4193a852c7d62938aaf3a8c58bbc7888bb23
commit: b4b11198edb99eb17a4d032c3a80854d3a817b0d [5031/27651] ANDROID: sound: Add hikey960 i2s audio driver
config: i386-randconfig-s003-20230528 (https://download.01.org/0day-ci/archive/20230528/202305280552.lDQ1cTln-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common arcvm12-5.10
        git checkout b4b11198edb99eb17a4d032c3a80854d3a817b0d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/ sound/soc/hisilicon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305280552.lDQ1cTln-lkp@intel.com/

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
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


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
