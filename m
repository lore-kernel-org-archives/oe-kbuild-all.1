Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CF0A53
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 05:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696225651; x=1727761651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3iJ9IhEU+dJFfSib5G6zxDoE9Bp+GIT/VAYZSUfC/YI=;
  b=dTLSyKx8XAqdxs9g3BZh23kdMfPvOQcsBOxDypb1u/IByNW3G3F3onXH
   jWZ16Zaj3y03FnmJfB8xhQCG2YOMa6KJyjvfOhDLlk9FZ60lGixC9RVvR
   R6zdVq7NGIkajcLWhytUAH2EW67MhlTZh7G3eaXYMBnptIqrPnmMZRYiN
   16AO4unr++c1jE1t437VeIQX12Tf/h5i/sSPGMkM5aa23LXxFNSV8a5KI
   L+bOlFyDzmKusJUTichhEhSK3iNN1tZItI+MpAiDsCMOnVIsq9IwjU87V
   O0NLE8Bv6zNL+w0Kq4bSQ+4+SbF04AeN1QmpoOAyJI4u2lCqaHNYlyYkB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="449076057"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="449076057"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 22:47:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="1421087"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Oct 2023 22:46:51 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnBmB-0005mz-1W;
	Mon, 02 Oct 2023 05:47:27 +0000
Date: Mon, 2 Oct 2023 13:47:26 +0800
From: kernel test robot <lkp@intel.com>
To: AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/4] pinctrl: add pinctrl_gpio_get_config()
Message-ID: <202310021320.gYfm1nLQ-lkp@intel.com>
References: <20231002021602.260100-3-takahiro.akashi@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002021602.260100-3-takahiro.akashi@linaro.org>

Hi AKASHI,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next brgl/gpio/for-next robh/for-next linus/master v6.6-rc4 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AKASHI-Takahiro/pinctrl-define-PIN_CONFIG_INPUT/20231002-101835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20231002021602.260100-3-takahiro.akashi%40linaro.org
patch subject: [RFC 2/4] pinctrl: add pinctrl_gpio_get_config()
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20231002/202310021320.gYfm1nLQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310021320.gYfm1nLQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310021320.gYfm1nLQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/core.c: In function 'pinctrl_gpio_get_config':
>> drivers/pinctrl/core.c:941:15: error: implicit declaration of function 'pin_config_get_for_pin' [-Werror=implicit-function-declaration]
     941 |         ret = pin_config_get_for_pin(pctldev, pin, config);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/pin_config_get_for_pin +941 drivers/pinctrl/core.c

   928	
   929	int pinctrl_gpio_get_config(unsigned int gpio, unsigned long *config)
   930	{
   931		struct pinctrl_gpio_range *range;
   932		struct pinctrl_dev *pctldev;
   933		int ret, pin;
   934	
   935		ret = pinctrl_get_device_gpio_range(gpio, &pctldev, &range);
   936		if (ret)
   937			return ret;
   938	
   939		mutex_lock(&pctldev->mutex);
   940		pin = gpio_to_pin(range, gpio);
 > 941		ret = pin_config_get_for_pin(pctldev, pin, config);
   942		mutex_unlock(&pctldev->mutex);
   943	
   944		return ret;
   945	}
   946	EXPORT_SYMBOL_GPL(pinctrl_gpio_get_config);
   947	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
