Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E1039948
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 16:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFaMNCen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698164645; x=1729700645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+n1qPH4vrHP2kR+bbs48XwN/8n1d9jlcd6QnuD/dU0Y=;
  b=SFaMNCenTWUp33jkqK+7EV9DwViV/JX6GwJ0nFXurZT/7X5u6U8vPLty
   DE0/hwXXShGh3R3Lia+sv8LThybjPJlMAg1pb4H+4xfchIEWlfWwg+d7b
   fu/RhecU6ofM189pVJrUYCdHd4d/w/VJWr4B/8MrIbCG0OtFYtQJT6Ezg
   9h08UdVt1NRUPAN62waio8cuIlckbNszJcpd4+5Fra12+henEo6Yh69rM
   IPgCFrhoH0Qtcz/bBm45NBRg9YYHsS7NI3YYwobV4yVb94rGthcyrUSkV
   A1X1dZplIcd+OGjhoqBBvw0to36XaxyEJzvmJLPyMEsFUdSQw/fiI7uLO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="473334671"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="473334671"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 09:17:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="708369080"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="708369080"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Oct 2023 09:17:10 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvK5b-00081l-2w;
	Tue, 24 Oct 2023 16:17:07 +0000
Date: Wed, 25 Oct 2023 00:16:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Liu <jim.t90615@gmail.com>, JJLIU0@nuvoton.com,
	linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org,
	brgl@bgdev.pl
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v6 3/3] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
Message-ID: <202310250031.1SKs6CHt-lkp@intel.com>
References: <20231024090631.3359592-4-jim.t90615@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024090631.3359592-4-jim.t90615@gmail.com>

Hi Jim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on robh/for-next linus/master v6.6-rc7 next-20231024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jim-Liu/dt-bindings-gpio-add-NPCM-sgpio-driver-bindings/20231024-170835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20231024090631.3359592-4-jim.t90615%40gmail.com
patch subject: [PATCH v6 3/3] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231025/202310250031.1SKs6CHt-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250031.1SKs6CHt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310250031.1SKs6CHt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-npcm-sgpio.c: In function 'bank_reg':
>> drivers/gpio/gpio-npcm-sgpio.c:150:24: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     150 |                 return -EINVAL;
         |                        ^
   drivers/gpio/gpio-npcm-sgpio.c: In function 'npcm_sgpio_setup_irqs':
>> drivers/gpio/gpio-npcm-sgpio.c:506:19: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     506 |         irq->chip = &sgpio_irq_chip;
         |                   ^
   drivers/gpio/gpio-npcm-sgpio.c: In function 'npcm_sgpio_probe':
>> drivers/gpio/gpio-npcm-sgpio.c:559:36: warning: unused variable 'sgpio_freq' [-Wunused-variable]
     559 |         u32 nin_gpios, nout_gpios, sgpio_freq;
         |                                    ^~~~~~~~~~


vim +150 drivers/gpio/gpio-npcm-sgpio.c

   133	
   134	static void __iomem *bank_reg(struct npcm_sgpio *gpio,
   135				      const struct npcm_sgpio_bank *bank,
   136					const enum npcm_sgpio_reg reg)
   137	{
   138		switch (reg) {
   139		case READ_DATA:
   140			return gpio->base + bank->rdata_reg;
   141		case WRITE_DATA:
   142			return gpio->base + bank->wdata_reg;
   143		case EVENT_CFG:
   144			return gpio->base + bank->event_config;
   145		case EVENT_STS:
   146			return gpio->base + bank->event_status;
   147		default:
   148			/* actually if code runs to here, it's an error case */
   149			WARN(true, "Getting here is an error condition");
 > 150			return -EINVAL;
   151		}
   152	}
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
