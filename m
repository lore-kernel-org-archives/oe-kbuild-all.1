Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F646A953
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 22:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677106062; x=1708642062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CB+NjMKBoFvmUWo0g2Xg0pI9sWKjtp2EYEggAtaqXGY=;
  b=IaYvI7I4d3OitAHfDREceQ+nX/9uDYVOW57nVNj/DP93cne4lkpCRCeR
   q8i18Xj+nnVyhkH6WKmmHNt8u5E9IP09QXvnQu6D/8UNGmw9ZZWDc7JgK
   jwCKQrnqLwSWstYqO6T0vULTe3Z1RdSbZYLjj6fJvULJMW7Jfdy2eA+72
   ulMx6kFhyJL2bClrhBO0giWu+ag6KByoTBpP/ut7DTPmzsLsRXaJdN1tA
   Vxyf1O3Y4FAPC7dVQw315ChbhXQbT3qYDE+AVidlkNlFNifrWeqMEc38A
   3wWnnknFzUHCviLEwewfiVpy9apNaUDuLeDV3t4IfMkqw8hhcJGWEUVgN
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="312681584"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="312681584"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 14:47:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="761110228"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="761110228"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2023 14:47:34 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUxte-0000mn-09;
	Wed, 22 Feb 2023 22:47:34 +0000
Date: Thu, 23 Feb 2023 06:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vincent Shih <vincent.sunplus@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] nvmem: add explicit config option to read OF fixed cells
Message-ID: <202302230639.7JlcJLAq-lkp@intel.com>
References: <20230221145021.31993-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230221145021.31993-1-zajec5@gmail.com>

Hi Rafał,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2]
[cannot apply to shawnguo/for-next mtd/mtd/next mtd/mtd/fixes rockchip/for-next atorgue-stm32/stm32-next abelloni/rtc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rafa-Mi-ecki/nvmem-add-explicit-config-option-to-read-OF-fixed-cells/20230221-225141
patch link:    https://lore.kernel.org/r/20230221145021.31993-1-zajec5%40gmail.com
patch subject: [PATCH] nvmem: add explicit config option to read OF fixed cells
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230223/202302230639.7JlcJLAq-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/30315eacb555aa6f98042503c5044d70c0480627
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rafa-Mi-ecki/nvmem-add-explicit-config-option-to-read-OF-fixed-cells/20230221-225141
        git checkout 30315eacb555aa6f98042503c5044d70c0480627
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302230639.7JlcJLAq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvmem/stm32-romem.c: In function 'stm32_romem_probe':
>> drivers/nvmem/stm32-romem.c:164:15: error: 'struct stm32_romem_priv' has no member named 'cfe'; did you mean 'cfg'?
     164 |         priv->cfe.use_fixed_of_cells = true;
         |               ^~~
         |               cfg


vim +164 drivers/nvmem/stm32-romem.c

   140	
   141	static int stm32_romem_probe(struct platform_device *pdev)
   142	{
   143		const struct stm32_romem_cfg *cfg;
   144		struct device *dev = &pdev->dev;
   145		struct stm32_romem_priv *priv;
   146		struct resource *res;
   147	
   148		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   149		if (!priv)
   150			return -ENOMEM;
   151	
   152		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   153		priv->base = devm_ioremap_resource(dev, res);
   154		if (IS_ERR(priv->base))
   155			return PTR_ERR(priv->base);
   156	
   157		priv->cfg.name = "stm32-romem";
   158		priv->cfg.word_size = 1;
   159		priv->cfg.stride = 1;
   160		priv->cfg.dev = dev;
   161		priv->cfg.priv = priv;
   162		priv->cfg.owner = THIS_MODULE;
   163		priv->cfg.type = NVMEM_TYPE_OTP;
 > 164		priv->cfe.use_fixed_of_cells = true;
   165	
   166		priv->lower = 0;
   167	
   168		cfg = (const struct stm32_romem_cfg *)
   169			of_match_device(dev->driver->of_match_table, dev)->data;
   170		if (!cfg) {
   171			priv->cfg.read_only = true;
   172			priv->cfg.size = resource_size(res);
   173			priv->cfg.reg_read = stm32_romem_read;
   174		} else {
   175			priv->cfg.size = cfg->size;
   176			priv->lower = cfg->lower;
   177			priv->cfg.reg_read = stm32_bsec_read;
   178			priv->cfg.reg_write = stm32_bsec_write;
   179		}
   180	
   181		return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &priv->cfg));
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
