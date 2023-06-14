Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7670E11184
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 16:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686759401; x=1718295401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hNRyqUyJwPRgDx83ggrfVP33lL+susjiOlT7HtsU1sA=;
  b=cHg8YP55Wx5qS+MREcq4xQEuI48PLKGuCrD12S1KfNw92LpykyvjSl9G
   F27/5QyXWPmAcHizSXeqmGNrgqqo1JpFMahMqR7nKtsLAV2EB+tbcwtaf
   LZ7w2mpgp/2CFarww7KYprdOQFCbcCCkA+vRI8hMzPacLgLoecAu9d84P
   tWh/iA4f+0WBeW4hBDPQ+juQzsLu+oHeWpwXYmgP+r2dA0ewvn33Tv9aq
   Prm488GEbv/kfM90akUtoLbQAN2IsLjZtxveCPacamBE/CeyUbCvI5zk7
   EIUW7v2mxh3CCz+zmlbNamUrHmzoWN+xHfp1gz0vl3E6UGhJwY0IrQ9/x
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="424546803"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="424546803"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 09:14:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="824872060"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="824872060"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Jun 2023 09:14:36 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9T8l-0000qX-10;
	Wed, 14 Jun 2023 16:14:35 +0000
Date: Thu, 15 Jun 2023 00:13:21 +0800
From: kernel test robot <lkp@intel.com>
To: Stanley Chang <stanley_chang@realtek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Stanley Chang <stanley_chang@realtek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Matthias Kaehlcke <mka@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Flavio Suligoi <f.suligoi@asem.it>, Ray Chi <raychi@google.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 3/5] phy: realtek: usb: Add driver for the Realtek SoC
 USB 3.0 PHY
Message-ID: <202306142340.nvui81i4-lkp@intel.com>
References: <20230614092850.21460-3-stanley_chang@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614092850.21460-3-stanley_chang@realtek.com>

Hi Stanley,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus robh/for-next linus/master v6.4-rc6 next-20230614]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanley-Chang/phy-realtek-usb-Add-driver-for-the-Realtek-SoC-USB-2-0-PHY/20230614-173349
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230614092850.21460-3-stanley_chang%40realtek.com
patch subject: [PATCH v4 3/5] phy: realtek: usb: Add driver for the Realtek SoC USB 3.0 PHY
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230614/202306142340.nvui81i4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch usb usb-testing
        git checkout usb/usb-testing
        b4 shazam https://lore.kernel.org/r/20230614092850.21460-3-stanley_chang@realtek.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/phy/realtek/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306142340.nvui81i4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/realtek/phy-rtk-usb3.c: In function 'rtk_usb3phy_probe':
>> drivers/phy/realtek/phy-rtk-usb3.c:779:29: warning: variable 'node' set but not used [-Wunused-but-set-variable]
     779 |         struct device_node *node;
         |                             ^~~~


vim +/node +779 drivers/phy/realtek/phy-rtk-usb3.c

   774	
   775	static int rtk_usb3phy_probe(struct platform_device *pdev)
   776	{
   777		struct rtk_phy *rtk_phy;
   778		struct device *dev = &pdev->dev;
 > 779		struct device_node *node;
   780		struct phy *generic_phy;
   781		struct phy_provider *phy_provider;
   782		const struct phy_cfg *phy_cfg;
   783		int ret;
   784	
   785		phy_cfg = of_device_get_match_data(dev);
   786		if (!phy_cfg) {
   787			dev_err(dev, "phy config are not assigned!\n");
   788			return -EINVAL;
   789		}
   790	
   791		rtk_phy = devm_kzalloc(dev, sizeof(*rtk_phy), GFP_KERNEL);
   792		if (!rtk_phy)
   793			return -ENOMEM;
   794	
   795		rtk_phy->dev			= &pdev->dev;
   796		rtk_phy->phy.dev		= rtk_phy->dev;
   797		rtk_phy->phy.label		= "rtk-usb3phy";
   798		rtk_phy->phy.notify_port_status = rtk_phy_notify_port_status;
   799	
   800		rtk_phy->phy_cfg = devm_kzalloc(dev, sizeof(*phy_cfg), GFP_KERNEL);
   801	
   802		memcpy(rtk_phy->phy_cfg, phy_cfg, sizeof(*phy_cfg));
   803	
   804		node = dev->of_node;
   805	
   806		rtk_phy->num_phy = 1;
   807	
   808		ret = parse_phy_data(rtk_phy);
   809		if (ret)
   810			goto err;
   811	
   812		platform_set_drvdata(pdev, rtk_phy);
   813	
   814		generic_phy = devm_phy_create(rtk_phy->dev, NULL, &ops);
   815		if (IS_ERR(generic_phy))
   816			return PTR_ERR(generic_phy);
   817	
   818		phy_set_drvdata(generic_phy, rtk_phy);
   819	
   820		phy_provider = devm_of_phy_provider_register(rtk_phy->dev, of_phy_simple_xlate);
   821		if (IS_ERR(phy_provider))
   822			return PTR_ERR(phy_provider);
   823	
   824		ret = usb_add_phy_dev(&rtk_phy->phy);
   825		if (ret)
   826			goto err;
   827	
   828		create_debug_files(rtk_phy);
   829	
   830	err:
   831		return ret;
   832	}
   833	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
