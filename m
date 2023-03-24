Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC03A954
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 17:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679677587; x=1711213587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o5mUISulh/MDnqWYRdYZ/FehlZoB6mAyPtoR7nzFgBE=;
  b=PqNpUyBZssmFHf3XA39ZbsW5aKkRzWxjWn4Qr4coBVVtrGfLrZaK/gGS
   CLFLCcYWaESnUS2qxb758NwR+2Lw6u2RY6n3uZHcvfieUs59HWMkucJaO
   jm0969rqbrN84CPUg4LgTNv9F1bCI0AZOb4WWTBGchasSb86OTr2mtCdy
   QIqZ/HWto4ZgxSPgypvfWdCAItUfJWdSRdj6iWsTLQQXLRJ5To2PSLgiO
   GEmzGuuSo5p47zNVJGtFnqdoDeJCq12VBKPqBirGGIsrqP+Rpcnn8PajW
   bONoIoU55IQN8SGZ0TzkBR4iVCIDGPYlhWJpOdfcZIdOgDkMQOPfnAl/E
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="367566269"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="367566269"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 10:06:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="682754219"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="682754219"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Mar 2023 10:06:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfkrw-000FUe-1I;
	Fri, 24 Mar 2023 17:06:24 +0000
Date: Sat, 25 Mar 2023 01:05:58 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 2/2] pinctrl: mcp23s08: Implement gpio bulk functions
Message-ID: <202303250001.YzK908so-lkp@intel.com>
References: <20230324140148.479125-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324140148.479125-2-u.kleine-koenig@pengutronix.de>

Hi Uwe,

I love your patch! Perhaps something to improve:

[auto build test WARNING on fe15c26ee26efa11741a7b632e9f23b01aca4cc6]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/pinctrl-mcp23s08-Implement-gpio-bulk-functions/20230324-220530
base:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
patch link:    https://lore.kernel.org/r/20230324140148.479125-2-u.kleine-koenig%40pengutronix.de
patch subject: [PATCH 2/2] pinctrl: mcp23s08: Implement gpio bulk functions
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230325/202303250001.YzK908so-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/0e7980f9275391601f384ff6fe0c4713114f0f0b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Uwe-Kleine-K-nig/pinctrl-mcp23s08-Implement-gpio-bulk-functions/20230324-220530
        git checkout 0e7980f9275391601f384ff6fe0c4713114f0f0b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303250001.YzK908so-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-mcp23s08.c: In function 'mcp23s08_set_multiple':
>> drivers/pinctrl/pinctrl-mcp23s08.c:351:13: warning: unused variable 'ret' [-Wunused-variable]
     351 |         int ret;
         |             ^~~


vim +/ret +351 drivers/pinctrl/pinctrl-mcp23s08.c

   346	
   347	static void mcp23s08_set_multiple(struct gpio_chip *chip,
   348					  unsigned long *mask, unsigned long *bits)
   349	{
   350		struct mcp23s08	*mcp = gpiochip_get_data(chip);
 > 351		int ret;
   352	
   353		mutex_lock(&mcp->lock);
   354		mcp_update_bits(mcp, MCP_OLAT, *mask, *bits);
   355		mutex_unlock(&mcp->lock);
   356	}
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
