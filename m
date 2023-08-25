Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5DD17E8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 05:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692941160; x=1724477160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VeiQSmyWECcHa26Vjd2sYnyrxqrZYUQfB/LEIP7n220=;
  b=Qqp2OZpD5pYGeOEW3x69nt7p11tp1rI9AjlOSYc1src2LynBwZs/UHdu
   ooHH0hOaSJWPS0lN+Td4B05IDzMI8+PFZf9nQo6PAhORdAyGpLtZBx2Hy
   HOVx1qCupUlPVf9LzenEHQQkX8H7m8JiBEC8mRySpu7SPrd08Idw+l3iF
   Kr+talnOBJN0n+/ItouAZU5ZwUDBYo5zcwBpkdDE6CvjGzPPxyH3CMzdC
   luxSewQlAdNk/iOj36YAq7Qx+butOnzhj/Fcw5TsluQJNzANWnF3POMt5
   7PSVWE30ZOjfv55B5lnV03Be1apjtHSEULtJpZVR6ktafXn4ZAe6NaN/E
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="440978238"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="440978238"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 22:25:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="881045209"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2023 22:26:01 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZPKV-0003Ek-2B;
	Fri, 25 Aug 2023 05:25:55 +0000
Date: Fri, 25 Aug 2023 13:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Linhua Xu <Linhua.xu@unisoc.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	lh xu <xulh0829@gmail.com>, Linhua Xu <Linhua.Xu@unisoc.com>,
	Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: Re: [PATCH 1/6] pinctrl: sprd: Modify the probe function parameters
Message-ID: <202308251318.Xng4apdW-lkp@intel.com>
References: <20230825031826.31599-2-Linhua.xu@unisoc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825031826.31599-2-Linhua.xu@unisoc.com>

Hi Linhua,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.5-rc7 next-20230824]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Linhua-Xu/pinctrl-sprd-Modify-the-probe-function-parameters/20230825-113950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20230825031826.31599-2-Linhua.xu%40unisoc.com
patch subject: [PATCH 1/6] pinctrl: sprd: Modify the probe function parameters
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230825/202308251318.Xng4apdW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251318.Xng4apdW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251318.Xng4apdW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/sprd/pinctrl-sprd.c:156: warning: Function parameter or member 'common_pin_offset' not described in 'sprd_pinctrl'
>> drivers/pinctrl/sprd/pinctrl-sprd.c:156: warning: Function parameter or member 'misc_pin_offset' not described in 'sprd_pinctrl'


vim +156 drivers/pinctrl/sprd/pinctrl-sprd.c

41d32cfce1ae61 Baolin Wang 2017-08-17  141  
41d32cfce1ae61 Baolin Wang 2017-08-17  142  /**
41d32cfce1ae61 Baolin Wang 2017-08-17  143   * struct sprd_pinctrl: represent the pin controller device
41d32cfce1ae61 Baolin Wang 2017-08-17  144   * @dev: pointer to the device structure
41d32cfce1ae61 Baolin Wang 2017-08-17  145   * @pctl: pointer to the pinctrl handle
41d32cfce1ae61 Baolin Wang 2017-08-17  146   * @base: base address of the controller
41d32cfce1ae61 Baolin Wang 2017-08-17  147   * @info: pointer to SoC's pins description information
41d32cfce1ae61 Baolin Wang 2017-08-17  148   */
41d32cfce1ae61 Baolin Wang 2017-08-17  149  struct sprd_pinctrl {
41d32cfce1ae61 Baolin Wang 2017-08-17  150  	struct device *dev;
41d32cfce1ae61 Baolin Wang 2017-08-17  151  	struct pinctrl_dev *pctl;
41d32cfce1ae61 Baolin Wang 2017-08-17  152  	void __iomem *base;
41d32cfce1ae61 Baolin Wang 2017-08-17  153  	struct sprd_pinctrl_soc_info *info;
435130f487a5b7 Linhua Xu   2023-08-25  154  	u32 common_pin_offset;
435130f487a5b7 Linhua Xu   2023-08-25  155  	u32 misc_pin_offset;
41d32cfce1ae61 Baolin Wang 2017-08-17 @156  };
41d32cfce1ae61 Baolin Wang 2017-08-17  157  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
