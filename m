Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61E8ECA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 00:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689727774; x=1721263774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xSKqg7FO5RCqSFt6EGbWpfzRG5YkNCvxq8/mZoBVZAQ=;
  b=OuLwHp9CNpfvRg5KWBMyHwTuhwaadFxBDEoUeOiJUBcwWEjaD9m/S63v
   QPaHuQmYM94IA0V0QJHI8GIwg1HjsODiQ1nHstezGvKzpvb2yDfjhiSHe
   fEASuvvyz3Ul4wgcgwSNaJFT7QXzPTe4yDB8nFZaKXXfJOhUyEBBJgOOo
   BIbWPg7A4e0HvObK/oi+pocUyqPHi6MteGaqFgMU7LrNEeqNUvoXnACkl
   mwKPwVgD6fLmXJGB5pt7DrmGlzvgQ6T1Al9NuazyzkuwDa46XrfObDh1x
   QLd+i2QRFOOAgTmfFxQA0C51myqoFZH6vucIel7LjF2LtN9AuxLkGH1Lg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="430107609"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="430107609"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 17:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="897736584"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="897736584"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 18 Jul 2023 17:49:32 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLvNe-0003zb-1M;
	Wed, 19 Jul 2023 00:49:27 +0000
Date: Wed, 19 Jul 2023 08:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: Wang Ming <machel@vivo.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] reset: hisilicon: Use dev_err_probe instead of dev_err
Message-ID: <202307190847.UjE7NAlJ-lkp@intel.com>
References: <20230718030511.16065-1-machel@vivo.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718030511.16065-1-machel@vivo.com>

Hi Wang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pza/reset/next]
[also build test WARNING on pza/imx-drm/next linus/master v6.5-rc2 next-20230718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wang-Ming/reset-hisilicon-Use-dev_err_probe-instead-of-dev_err/20230718-203055
base:   https://git.pengutronix.de/git/pza/linux reset/next
patch link:    https://lore.kernel.org/r/20230718030511.16065-1-machel%40vivo.com
patch subject: [PATCH v1] reset: hisilicon: Use dev_err_probe instead of dev_err
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230719/202307190847.UjE7NAlJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190847.UjE7NAlJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190847.UjE7NAlJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/reset/hisilicon/reset-hi3660.c: In function 'hi3660_reset_probe':
>> drivers/reset/hisilicon/reset-hi3660.c:93:36: warning: passing argument 2 of 'dev_err_probe' makes integer from pointer without a cast [-Wint-conversion]
      93 |                 dev_err_probe(dev, "failed to get hisilicon,rst-syscon\n");
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    |
         |                                    char *
   In file included from include/linux/platform_device.h:13,
                    from include/linux/of_device.h:5,
                    from drivers/reset/hisilicon/reset-hi3660.c:9:
   include/linux/device.h:1091:64: note: expected 'int' but argument is of type 'char *'
    1091 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                            ~~~~^~~
   drivers/reset/hisilicon/reset-hi3660.c:93:17: error: too few arguments to function 'dev_err_probe'
      93 |                 dev_err_probe(dev, "failed to get hisilicon,rst-syscon\n");
         |                 ^~~~~~~~~~~~~
   include/linux/device.h:1091:20: note: declared here
    1091 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                    ^~~~~~~~~~~~~


vim +/dev_err_probe +93 drivers/reset/hisilicon/reset-hi3660.c

    75	
    76	static int hi3660_reset_probe(struct platform_device *pdev)
    77	{
    78		struct hi3660_reset_controller *rc;
    79		struct device_node *np = pdev->dev.of_node;
    80		struct device *dev = &pdev->dev;
    81	
    82		rc = devm_kzalloc(dev, sizeof(*rc), GFP_KERNEL);
    83		if (!rc)
    84			return -ENOMEM;
    85	
    86		rc->map = syscon_regmap_lookup_by_phandle(np, "hisilicon,rst-syscon");
    87		if (rc->map == ERR_PTR(-ENODEV)) {
    88			/* fall back to the deprecated compatible */
    89			rc->map = syscon_regmap_lookup_by_phandle(np,
    90								  "hisi,rst-syscon");
    91		}
    92		if (IS_ERR(rc->map)) {
  > 93			dev_err_probe(dev, "failed to get hisilicon,rst-syscon\n");
    94			return PTR_ERR(rc->map);
    95		}
    96	
    97		rc->rst.ops = &hi3660_reset_ops,
    98		rc->rst.of_node = np;
    99		rc->rst.of_reset_n_cells = 2;
   100		rc->rst.of_xlate = hi3660_reset_xlate;
   101	
   102		return reset_controller_register(&rc->rst);
   103	}
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
