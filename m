Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551337C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 03:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686107555; x=1717643555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WiFC6YvL5rA1t1eMycSJSOTVx0Qiae3us0hvxtQLgS8=;
  b=NeK8rdlNTYJV/QLvRA8AWQf2Gg71lySpV4IvJA8C7iwuLefZbaquR1se
   VUmJ8Vhu1oaVFWazpZqThHB+GLJbQNXzl8xf3SF5zWBMgceYXDVQI09N3
   WbDtr+4FlhpwOu4o8+q8bD3j46zTmWFuBRnzhiP7xEPoIQLEXE+hIBXzh
   ihrfD+tXyHyPk7qKfxp2mE+ZnTWl7PPRhkWnq5ikg4dTlIjZHnZ/j+q2G
   W5sX4SI6hMIZxHmbZ7rgmw9U1NTqsrBM3x+/s4ROnwSOUbb1Fqw6xU93I
   rTB7Bt8x6Nonomok6pC8ElJCzEH9kmlPC79oZ8BnlBSZ4rJDdJbCtfeUc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="420414272"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="420414272"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 20:12:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="853658610"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="853658610"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Jun 2023 20:12:33 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6jb6-000639-0q;
	Wed, 07 Jun 2023 03:12:32 +0000
Date: Wed, 7 Jun 2023 11:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/4] input: touchscreen: add I2C support for Goodix
 Berlin Touchscreen IC
Message-ID: <202306071032.a6w1pPW3-lkp@intel.com>
References: <20230606-topic-goodix-berlin-upstream-initial-v1-3-4a0741b8aefd@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606-topic-goodix-berlin-upstream-initial-v1-3-4a0741b8aefd@linaro.org>

Hi Neil,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 6db29e14f4fb7bce9eb5290288e71b05c2b0d118]

url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/dt-bindings-input-document-Goodix-Berlin-Touchscreen-IC/20230606-223332
base:   6db29e14f4fb7bce9eb5290288e71b05c2b0d118
patch link:    https://lore.kernel.org/r/20230606-topic-goodix-berlin-upstream-initial-v1-3-4a0741b8aefd%40linaro.org
patch subject: [PATCH RFC 3/4] input: touchscreen: add I2C support for Goodix Berlin Touchscreen IC
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230607/202306071032.a6w1pPW3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 6db29e14f4fb7bce9eb5290288e71b05c2b0d118
        b4 shazam https://lore.kernel.org/r/20230606-topic-goodix-berlin-upstream-initial-v1-3-4a0741b8aefd@linaro.org
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/input/touchscreen/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306071032.a6w1pPW3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/touchscreen/goodix_berlin_core.c:816:5: warning: no previous prototype for 'goodix_berlin_pm_suspend' [-Wmissing-prototypes]
     816 | int goodix_berlin_pm_suspend(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/goodix_berlin_core.c:823:5: warning: no previous prototype for 'goodix_berlin_pm_resume' [-Wmissing-prototypes]
     823 | int goodix_berlin_pm_resume(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/goodix_berlin_core.c: In function 'goodix_berlin_get_ic_info':
>> drivers/input/touchscreen/goodix_berlin_core.c:519:1: warning: the frame size of 1044 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     519 | }
         | ^


vim +519 drivers/input/touchscreen/goodix_berlin_core.c

fe0f04f551c222 Neil Armstrong 2023-06-06  452  
fe0f04f551c222 Neil Armstrong 2023-06-06  453  static int goodix_berlin_get_ic_info(struct goodix_berlin_core *cd,
fe0f04f551c222 Neil Armstrong 2023-06-06  454  				     struct goodix_ic_info *ic_info)
fe0f04f551c222 Neil Armstrong 2023-06-06  455  {
fe0f04f551c222 Neil Armstrong 2023-06-06  456  	int ret, i;
fe0f04f551c222 Neil Armstrong 2023-06-06  457  	u16 length = 0;
fe0f04f551c222 Neil Armstrong 2023-06-06  458  	u32 ic_addr;
fe0f04f551c222 Neil Armstrong 2023-06-06  459  	u8 afe_data[GOODIX_IC_INFO_MAX_LEN] = { 0 };
fe0f04f551c222 Neil Armstrong 2023-06-06  460  
fe0f04f551c222 Neil Armstrong 2023-06-06  461  	ic_addr = GOODIX_IC_INFO_ADDR;
fe0f04f551c222 Neil Armstrong 2023-06-06  462  
fe0f04f551c222 Neil Armstrong 2023-06-06  463  	for (i = 0; i < 3; i++) {
fe0f04f551c222 Neil Armstrong 2023-06-06  464  		ret = regmap_raw_read(cd->regmap, ic_addr, (u8 *)&length, sizeof(length));
fe0f04f551c222 Neil Armstrong 2023-06-06  465  		if (ret) {
fe0f04f551c222 Neil Armstrong 2023-06-06  466  			dev_info(cd->dev, "failed get ic info length, %d\n", ret);
fe0f04f551c222 Neil Armstrong 2023-06-06  467  			usleep_range(5000, 5100);
fe0f04f551c222 Neil Armstrong 2023-06-06  468  			continue;
fe0f04f551c222 Neil Armstrong 2023-06-06  469  		}
fe0f04f551c222 Neil Armstrong 2023-06-06  470  
fe0f04f551c222 Neil Armstrong 2023-06-06  471  		length = le16_to_cpu(length);
fe0f04f551c222 Neil Armstrong 2023-06-06  472  		if (length >= GOODIX_IC_INFO_MAX_LEN) {
fe0f04f551c222 Neil Armstrong 2023-06-06  473  			dev_info(cd->dev, "invalid ic info length %d, retry %d\n", length, i);
fe0f04f551c222 Neil Armstrong 2023-06-06  474  			continue;
fe0f04f551c222 Neil Armstrong 2023-06-06  475  		}
fe0f04f551c222 Neil Armstrong 2023-06-06  476  
fe0f04f551c222 Neil Armstrong 2023-06-06  477  		ret = regmap_raw_read(cd->regmap, ic_addr, afe_data, length);
fe0f04f551c222 Neil Armstrong 2023-06-06  478  		if (ret) {
fe0f04f551c222 Neil Armstrong 2023-06-06  479  			dev_info(cd->dev, "failed get ic info data, %d\n", ret);
fe0f04f551c222 Neil Armstrong 2023-06-06  480  			usleep_range(5000, 5100);
fe0f04f551c222 Neil Armstrong 2023-06-06  481  			continue;
fe0f04f551c222 Neil Armstrong 2023-06-06  482  		}
fe0f04f551c222 Neil Armstrong 2023-06-06  483  
fe0f04f551c222 Neil Armstrong 2023-06-06  484  		/* judge whether the data is valid */
fe0f04f551c222 Neil Armstrong 2023-06-06  485  		if (goodix_berlin_is_risk_data(cd, (const uint8_t *)afe_data,
fe0f04f551c222 Neil Armstrong 2023-06-06  486  					       length)) {
fe0f04f551c222 Neil Armstrong 2023-06-06  487  			dev_info(cd->dev, "fw info data invalid\n");
fe0f04f551c222 Neil Armstrong 2023-06-06  488  			usleep_range(5000, 5100);
fe0f04f551c222 Neil Armstrong 2023-06-06  489  			continue;
fe0f04f551c222 Neil Armstrong 2023-06-06  490  		}
fe0f04f551c222 Neil Armstrong 2023-06-06  491  
fe0f04f551c222 Neil Armstrong 2023-06-06  492  		if (!goodix_berlin_check_checksum((const uint8_t *)afe_data, length)) {
fe0f04f551c222 Neil Armstrong 2023-06-06  493  			dev_info(cd->dev, "fw info checksum error\n");
fe0f04f551c222 Neil Armstrong 2023-06-06  494  			usleep_range(5000, 5100);
fe0f04f551c222 Neil Armstrong 2023-06-06  495  			continue;
fe0f04f551c222 Neil Armstrong 2023-06-06  496  		}
fe0f04f551c222 Neil Armstrong 2023-06-06  497  
fe0f04f551c222 Neil Armstrong 2023-06-06  498  		break;
fe0f04f551c222 Neil Armstrong 2023-06-06  499  	}
fe0f04f551c222 Neil Armstrong 2023-06-06  500  	if (i == 3) {
fe0f04f551c222 Neil Armstrong 2023-06-06  501  		dev_err(cd->dev, "failed get ic info\n");
fe0f04f551c222 Neil Armstrong 2023-06-06  502  		return -EINVAL;
fe0f04f551c222 Neil Armstrong 2023-06-06  503  	}
fe0f04f551c222 Neil Armstrong 2023-06-06  504  
fe0f04f551c222 Neil Armstrong 2023-06-06  505  	ret = goodix_berlin_convert_ic_info(cd, ic_info, afe_data);
fe0f04f551c222 Neil Armstrong 2023-06-06  506  	if (ret) {
fe0f04f551c222 Neil Armstrong 2023-06-06  507  		dev_err(cd->dev, "error converting ic info\n");
fe0f04f551c222 Neil Armstrong 2023-06-06  508  		return ret;
fe0f04f551c222 Neil Armstrong 2023-06-06  509  	}
fe0f04f551c222 Neil Armstrong 2023-06-06  510  
fe0f04f551c222 Neil Armstrong 2023-06-06  511  	/* check some key info */
fe0f04f551c222 Neil Armstrong 2023-06-06  512  	if (!ic_info->misc.cmd_addr || !ic_info->misc.fw_buffer_addr ||
fe0f04f551c222 Neil Armstrong 2023-06-06  513  	    !ic_info->misc.touch_data_addr) {
fe0f04f551c222 Neil Armstrong 2023-06-06  514  		dev_err(cd->dev, "cmd_addr fw_buf_addr and touch_data_addr is null\n");
fe0f04f551c222 Neil Armstrong 2023-06-06  515  		return -EINVAL;
fe0f04f551c222 Neil Armstrong 2023-06-06  516  	}
fe0f04f551c222 Neil Armstrong 2023-06-06  517  
fe0f04f551c222 Neil Armstrong 2023-06-06  518  	return 0;
fe0f04f551c222 Neil Armstrong 2023-06-06 @519  }
fe0f04f551c222 Neil Armstrong 2023-06-06  520  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
