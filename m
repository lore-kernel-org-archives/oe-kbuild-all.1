Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF8BED7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 08:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674547256; x=1706083256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qUGuKaZvBfqjNUIdYqTEL0o9E/zbk6hrDyEdGSTYCv4=;
  b=TX3s+QTrZxDEGuU5yQouXImC9XJfjIuFJSNczZ8cHBG0HBJpkC9qVEMw
   4VkUmERov8EXxJglzWuByqu4iwy22qgaXe57LHpwcGI1PoCvKzdRp+XSI
   /6Rf73gMv+9wZGWPfVXhWLesHFMVwUbJ3GCLhuRt52j3iDseCFXYpEV1q
   jQBYDX+7/bqijkEWqd3vDmFkp4PRt4MV4mp4vAwGcSHFbNfinjMj6+cjp
   +q+9UQamJUjNsqav7iXHZE+9vf2+BnfPUTDTQBpAKtx7X8BNasS/B2HMn
   /0d+4BXlEm9hFsuTLg2UxVpNvdlWXd1bgha+e5NOPJLsAE8lgc4ueCHDg
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="324920720"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="324920720"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 00:00:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="692510300"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="692510300"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Jan 2023 00:00:51 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKEEX-0006Fw-1z;
	Tue, 24 Jan 2023 08:00:45 +0000
Date: Tue, 24 Jan 2023 15:59:56 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Ranostay <mranostay@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-linux-5.10.y 17348/20446]
 drivers/phy/ti/phy-j721e-wiz.c:731:18: warning: assignment to 'char *' from
 'int' makes pointer from integer without a cast
Message-ID: <202301241512.d5c19xDp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matt,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y
head:   90976f615b7ec6d31eba0db18c5b6844a3371e10
commit: 00c06b1206b933de1d62b89db8b6846dc885eb5f [17348/20446] phy: ti: phy-j721e-wiz: stop name conflict if multiple serdes are initialized
config: h8300-buildonly-randconfig-r001-20230123 (https://download.01.org/0day-ci/archive/20230124/202301241512.d5c19xDp-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y
        git checkout 00c06b1206b933de1d62b89db8b6846dc885eb5f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=h8300 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=h8300 SHELL=/bin/bash drivers/phy/ti/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/phy/ti/phy-j721e-wiz.c: In function 'wiz_phy_en_refclk_register':
   drivers/phy/ti/phy-j721e-wiz.c:731:20: error: implicit declaration of function 'kzalloc'; did you mean 'vzalloc'? [-Werror=implicit-function-declaration]
     731 |         clk_name = kzalloc(sz, GFP_KERNEL);
         |                    ^~~~~~~
         |                    vzalloc
>> drivers/phy/ti/phy-j721e-wiz.c:731:18: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     731 |         clk_name = kzalloc(sz, GFP_KERNEL);
         |                  ^
   drivers/phy/ti/phy-j721e-wiz.c:743:9: error: implicit declaration of function 'kfree'; did you mean 'vfree'? [-Werror=implicit-function-declaration]
     743 |         kfree(clk_name);
         |         ^~~~~
         |         vfree
   drivers/phy/ti/phy-j721e-wiz.c: In function 'wiz_mux_clk_register':
   drivers/phy/ti/phy-j721e-wiz.c:796:22: warning: assignment to 'const char **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     796 |         parent_names = kzalloc((sizeof(char *) * num_parents), GFP_KERNEL);
         |                      ^
   cc1: some warnings being treated as errors


vim +731 drivers/phy/ti/phy-j721e-wiz.c

   710	
   711	static int wiz_phy_en_refclk_register(struct wiz *wiz)
   712	{
   713		struct wiz_phy_en_refclk *wiz_phy_en_refclk;
   714		struct device *dev = wiz->dev;
   715		struct clk_init_data *init;
   716		struct clk *clk;
   717		char *clk_name;
   718		unsigned int sz;
   719	
   720		wiz_phy_en_refclk = devm_kzalloc(dev, sizeof(*wiz_phy_en_refclk), GFP_KERNEL);
   721		if (!wiz_phy_en_refclk)
   722			return -ENOMEM;
   723	
   724		init = &wiz_phy_en_refclk->clk_data;
   725	
   726		init->ops = &wiz_phy_en_refclk_ops;
   727		init->flags = 0;
   728	
   729		sz = strlen(dev_name(dev)) + strlen(output_clk_names[TI_WIZ_PHY_EN_REFCLK]) + 2;
   730	
 > 731		clk_name = kzalloc(sz, GFP_KERNEL);
   732		if (!clk_name)
   733			return -ENOMEM;
   734	
   735		snprintf(clk_name, sz, "%s_%s", dev_name(dev), output_clk_names[TI_WIZ_PHY_EN_REFCLK]);
   736		init->name = clk_name;
   737	
   738		wiz_phy_en_refclk->phy_en_refclk = wiz->phy_en_refclk;
   739		wiz_phy_en_refclk->hw.init = init;
   740	
   741		clk = devm_clk_register(dev, &wiz_phy_en_refclk->hw);
   742	
   743		kfree(clk_name);
   744	
   745		if (IS_ERR(clk))
   746			return PTR_ERR(clk);
   747	
   748		wiz->output_clks[TI_WIZ_PHY_EN_REFCLK] = clk;
   749	
   750		return 0;
   751	}
   752	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
