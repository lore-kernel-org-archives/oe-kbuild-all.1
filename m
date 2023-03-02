Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2295E10FA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 04:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677730324; x=1709266324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=847ox5JmwIqakqmEohRlvHZExh+MdqqFhyPzvfrxUDg=;
  b=F4sjmmydWJtxkc1PNlDbTbjD15gvA2QWV/727o2nUpGc2fPlxsszRuGy
   d6gH3W8VyuF1ATB0dzK8tRoeLKx/37eGvnj5bsYd1OlDZkNBQGbGHgaC6
   vRTer7qfjxHKteBlGumBNksI5Lnc7kA8FykUIEY/6H4wjdFz0rypJOxrU
   RDvYoyDucH07EYAHIeBbuBfHWr+ajUmlk+ZkypaoFTkB/zGyyY8svbeUy
   CMohtm/HIkcvFZN1Wh4xedGcIizqOQdZdDc3Y0C+wAdTcwt+0mi5mfAbm
   pM/bBIuw6VVEhxhaH82P4EP7/tNxA8LdZSCQ3iv9EzYDA9WFKLMhBG7s5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="336111170"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="336111170"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 20:12:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="707266628"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="707266628"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Mar 2023 20:12:00 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXaIQ-0000B5-34;
	Thu, 02 Mar 2023 04:11:58 +0000
Date: Thu, 2 Mar 2023 12:11:08 +0800
From: kernel test robot <lkp@intel.com>
To: Naresh Solanki <naresh.solanki@9elements.com>,
	Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Marcello Sylvester Bauer <sylv@sylv.io>,
	Naresh Solanki <Naresh.Solanki@9elements.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mfd: max597x: Add support for MAX5970 and MAX5978
Message-ID: <202303021248.Bk9jYUb1-lkp@intel.com>
References: <20230301091234.3159953-2-Naresh.Solanki@9elements.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301091234.3159953-2-Naresh.Solanki@9elements.com>

Hi Naresh,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 59c54c59974649b2e7bc92faae4a21e2b2408db2]

url:    https://github.com/intel-lab-lkp/linux/commits/Naresh-Solanki/mfd-max597x-Add-support-for-MAX5970-and-MAX5978/20230301-171527
base:   59c54c59974649b2e7bc92faae4a21e2b2408db2
patch link:    https://lore.kernel.org/r/20230301091234.3159953-2-Naresh.Solanki%409elements.com
patch subject: [PATCH 2/2] mfd: max597x: Add support for MAX5970 and MAX5978
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230302/202303021248.Bk9jYUb1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/68623f7868d887a57422ce2cd6f5dc1ee1510f1e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Naresh-Solanki/mfd-max597x-Add-support-for-MAX5970-and-MAX5978/20230301-171527
        git checkout 68623f7868d887a57422ce2cd6f5dc1ee1510f1e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/regulator/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021248.Bk9jYUb1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/regulator/max597x-regulator.c: In function 'max597x_regulator_probe':
   drivers/regulator/max597x-regulator.c:447:41: error: 'struct max597x_data' has no member named 'dev'
     447 |                     devm_kzalloc(max597x->dev, sizeof(struct max597x_regulator),
         |                                         ^~
   drivers/regulator/max597x-regulator.c:453:39: error: 'struct max597x_data' has no member named 'regmap'
     453 |                 data->regmap = max597x->regmap;
         |                                       ^~
   drivers/regulator/max597x-regulator.c:462:37: error: 'struct max597x_data' has no member named 'dev'
     462 |                 config.dev = max597x->dev;
         |                                     ^~
   drivers/regulator/max597x-regulator.c:465:55: error: 'struct max597x_data' has no member named 'dev'
     465 |                 rdev = devm_regulator_register(max597x->dev,
         |                                                       ^~
   In file included from include/linux/device.h:15,
                    from drivers/regulator/max597x-regulator.c:11:
   drivers/regulator/max597x-regulator.c:468:40: error: 'struct max597x_data' has no member named 'dev'
     468 |                         dev_err(max597x->dev, "failed to register regulator %s\n",
         |                                        ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/regulator/max597x-regulator.c:468:25: note: in expansion of macro 'dev_err'
     468 |                         dev_err(max597x->dev, "failed to register regulator %s\n",
         |                         ^~~~~~~
   drivers/regulator/max597x-regulator.c:476:20: error: 'struct max597x_data' has no member named 'irq'
     476 |         if (max597x->irq) {
         |                    ^~
   drivers/regulator/max597x-regulator.c:478:46: error: 'struct max597x_data' has no member named 'dev'
     478 |                     max597x_setup_irq(max597x->dev, max597x->irq, rdevs, num_switches,
         |                                              ^~
   drivers/regulator/max597x-regulator.c:478:60: error: 'struct max597x_data' has no member named 'irq'
     478 |                     max597x_setup_irq(max597x->dev, max597x->irq, rdevs, num_switches,
         |                                                            ^~
   In file included from include/linux/device.h:15,
                    from drivers/regulator/max597x-regulator.c:11:
   drivers/regulator/max597x-regulator.c:481:40: error: 'struct max597x_data' has no member named 'dev'
     481 |                         dev_err(max597x->dev, "IRQ setup failed");
         |                                        ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/regulator/max597x-regulator.c:481:25: note: in expansion of macro 'dev_err'
     481 |                         dev_err(max597x->dev, "IRQ setup failed");
         |                         ^~~~~~~
   At top level:
>> drivers/regulator/max597x-regulator.c:360:35: warning: 'max597x_regmap_config' defined but not used [-Wunused-const-variable=]
     360 | static const struct regmap_config max597x_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~


vim +/max597x_regmap_config +360 drivers/regulator/max597x-regulator.c

38493f008deb43 Patrick Rudolph 2022-07-05  359  
38493f008deb43 Patrick Rudolph 2022-07-05 @360  static const struct regmap_config max597x_regmap_config = {
38493f008deb43 Patrick Rudolph 2022-07-05  361  	.reg_bits = 8,
38493f008deb43 Patrick Rudolph 2022-07-05  362  	.val_bits = 8,
38493f008deb43 Patrick Rudolph 2022-07-05  363  	.max_register = MAX_REGISTERS,
38493f008deb43 Patrick Rudolph 2022-07-05  364  };
38493f008deb43 Patrick Rudolph 2022-07-05  365  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
