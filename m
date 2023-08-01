Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5765D46A0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 10:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690887174; x=1722423174;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R4XkrarTgZuo38V9iicKTMOiRb0ZWj5WdxYcBnYtuvM=;
  b=XEPy3a7ra7DbHP6qjGOvg7WAouo2eT35wTBqUk+Xf3hANUA6kpNijSRB
   GlFYj2SIjVdCjp7ucbPluKwU7PR4QjosmRkd8/BH4ADXeBSJ2OUwQDhdW
   CqDcSQYngqY8aFc7qPhoMWni12d+D/Etp+OR32KLGHLhsUxYgHGJHZwcE
   kCM5aPr+ahQzmEsLeg/DD46bkZMObRQsB6q5Iebx7r/htvfO6i57N/m+Z
   MqZ5FHZOhlv1blCQ8bBguqh9+0t+vqB7keTQjLYXqOo4g+pDHOJkQvMk1
   cbOBCDGQEA8zsxF/fu3o9VTxwxdi2gCYNKv8UOkfoLc5MZ2eZgkItQ9hr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="348860165"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="348860165"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 03:52:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="678654752"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="678654752"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Aug 2023 03:52:45 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQmzc-0000D7-2c;
	Tue, 01 Aug 2023 10:52:44 +0000
Date: Tue, 1 Aug 2023 18:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: Shenwei Wang <shenwei.wang@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Simon Horman <simon.horman@corigine.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Wong Vee Khee <veekhee@apple.com>
Subject: Re: [PATCH v3 net 1/2] net: stmmac: add new mode parameter for
 fix_mac_speed
Message-ID: <202308011831.Ndat5994-lkp@intel.com>
References: <20230731161929.2341584-2-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731161929.2341584-2-shenwei.wang@nxp.com>

Hi Shenwei,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenwei-Wang/net-stmmac-add-new-mode-parameter-for-fix_mac_speed/20230801-002328
base:   net/main
patch link:    https://lore.kernel.org/r/20230731161929.2341584-2-shenwei.wang%40nxp.com
patch subject: [PATCH v3 net 1/2] net: stmmac: add new mode parameter for fix_mac_speed
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230801/202308011831.Ndat5994-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308011831.Ndat5994-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308011831.Ndat5994-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c: In function 'sti_dwmac_probe':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c:296:33: error: assignment to 'void (*)(void *, uint,  uint)' {aka 'void (*)(void *, unsigned int,  unsigned int)'} from incompatible pointer type 'void (*)(void *, unsigned int)' [-Werror=incompatible-pointer-types]
     296 |         plat_dat->fix_mac_speed = data->fix_retime_src;
         |                                 ^
   cc1: some warnings being treated as errors


vim +296 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c

d15891ca1fdd7f Srinivas Kandagatla 2014-02-11  258  
8387ee21f972de Joachim Eastwood    2015-07-29  259  static int sti_dwmac_probe(struct platform_device *pdev)
d15891ca1fdd7f Srinivas Kandagatla 2014-02-11  260  {
8387ee21f972de Joachim Eastwood    2015-07-29  261  	struct plat_stmmacenet_data *plat_dat;
07ca3749cec2b8 Joachim Eastwood    2015-07-29  262  	const struct sti_dwmac_of_data *data;
8387ee21f972de Joachim Eastwood    2015-07-29  263  	struct stmmac_resources stmmac_res;
d15891ca1fdd7f Srinivas Kandagatla 2014-02-11  264  	struct sti_dwmac *dwmac;
d15891ca1fdd7f Srinivas Kandagatla 2014-02-11  265  	int ret;
d15891ca1fdd7f Srinivas Kandagatla 2014-02-11  266  
149adedd7696cb Joachim Eastwood    2015-07-29  267  	data = of_device_get_match_data(&pdev->dev);
149adedd7696cb Joachim Eastwood    2015-07-29  268  	if (!data) {
149adedd7696cb Joachim Eastwood    2015-07-29  269  		dev_err(&pdev->dev, "No OF match data provided\n");
149adedd7696cb Joachim Eastwood    2015-07-29  270  		return -EINVAL;
149adedd7696cb Joachim Eastwood    2015-07-29  271  	}
149adedd7696cb Joachim Eastwood    2015-07-29  272  
8387ee21f972de Joachim Eastwood    2015-07-29  273  	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
8387ee21f972de Joachim Eastwood    2015-07-29  274  	if (ret)
8387ee21f972de Joachim Eastwood    2015-07-29  275  		return ret;
8387ee21f972de Joachim Eastwood    2015-07-29  276  
83216e3988cd19 Michael Walle       2021-04-12  277  	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
8387ee21f972de Joachim Eastwood    2015-07-29  278  	if (IS_ERR(plat_dat))
8387ee21f972de Joachim Eastwood    2015-07-29  279  		return PTR_ERR(plat_dat);
8387ee21f972de Joachim Eastwood    2015-07-29  280  
d15891ca1fdd7f Srinivas Kandagatla 2014-02-11  281  	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
d2ed0a7755fe14 Johan Hovold        2016-11-30  282  	if (!dwmac) {
d2ed0a7755fe14 Johan Hovold        2016-11-30  283  		ret = -ENOMEM;
d2ed0a7755fe14 Johan Hovold        2016-11-30  284  		goto err_remove_config_dt;
d2ed0a7755fe14 Johan Hovold        2016-11-30  285  	}
d15891ca1fdd7f Srinivas Kandagatla 2014-02-11  286  
d15891ca1fdd7f Srinivas Kandagatla 2014-02-11  287  	ret = sti_dwmac_parse_data(dwmac, pdev);
d15891ca1fdd7f Srinivas Kandagatla 2014-02-11  288  	if (ret) {
d15891ca1fdd7f Srinivas Kandagatla 2014-02-11  289  		dev_err(&pdev->dev, "Unable to parse OF data\n");
d2ed0a7755fe14 Johan Hovold        2016-11-30  290  		goto err_remove_config_dt;
d15891ca1fdd7f Srinivas Kandagatla 2014-02-11  291  	}
d15891ca1fdd7f Srinivas Kandagatla 2014-02-11  292  
16b1adbb16c8a5 Joachim Eastwood    2015-07-29  293  	dwmac->fix_retime_src = data->fix_retime_src;
16b1adbb16c8a5 Joachim Eastwood    2015-07-29  294  
8387ee21f972de Joachim Eastwood    2015-07-29  295  	plat_dat->bsp_priv = dwmac;
16b1adbb16c8a5 Joachim Eastwood    2015-07-29 @296  	plat_dat->fix_mac_speed = data->fix_retime_src;
8387ee21f972de Joachim Eastwood    2015-07-29  297  
b89cbfb01a2855 Joachim Eastwood    2016-11-04  298  	ret = clk_prepare_enable(dwmac->clk);
8387ee21f972de Joachim Eastwood    2015-07-29  299  	if (ret)
d2ed0a7755fe14 Johan Hovold        2016-11-30  300  		goto err_remove_config_dt;
8387ee21f972de Joachim Eastwood    2015-07-29  301  
0eebedc2fd284e Joachim Eastwood    2016-11-04  302  	ret = sti_dwmac_set_mode(dwmac);
b89cbfb01a2855 Joachim Eastwood    2016-11-04  303  	if (ret)
b89cbfb01a2855 Joachim Eastwood    2016-11-04  304  		goto disable_clk;
b89cbfb01a2855 Joachim Eastwood    2016-11-04  305  
b89cbfb01a2855 Joachim Eastwood    2016-11-04  306  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
b89cbfb01a2855 Joachim Eastwood    2016-11-04  307  	if (ret)
b89cbfb01a2855 Joachim Eastwood    2016-11-04  308  		goto disable_clk;
b89cbfb01a2855 Joachim Eastwood    2016-11-04  309  
b89cbfb01a2855 Joachim Eastwood    2016-11-04  310  	return 0;
b89cbfb01a2855 Joachim Eastwood    2016-11-04  311  
b89cbfb01a2855 Joachim Eastwood    2016-11-04  312  disable_clk:
b89cbfb01a2855 Joachim Eastwood    2016-11-04  313  	clk_disable_unprepare(dwmac->clk);
d2ed0a7755fe14 Johan Hovold        2016-11-30  314  err_remove_config_dt:
d2ed0a7755fe14 Johan Hovold        2016-11-30  315  	stmmac_remove_config_dt(pdev, plat_dat);
0a9e22715ee384 Johan Hovold        2016-11-30  316  
b89cbfb01a2855 Joachim Eastwood    2016-11-04  317  	return ret;
d15891ca1fdd7f Srinivas Kandagatla 2014-02-11  318  }
d15891ca1fdd7f Srinivas Kandagatla 2014-02-11  319  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
