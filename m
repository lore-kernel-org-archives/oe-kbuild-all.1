Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F117C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 00:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690504989; x=1722040989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h9RIEKdtMKJJvpXeouPZ4LZnC9egXWdvmffwv1zqkOc=;
  b=Xe1W9Wp+ojvUVzWlvEBo+4hdwvD+JYy24uG832WoRN3uKYc0ugCKevrI
   7l/kDOXe2XcQTACqDBcR5UgvERi6qGneasq7a1mBmI2ejKcGQXyQ6lUFV
   fLGpkn19SqW/ljs8jTBji9gvDSM1fl50IdPLkxegb32jvX7ZRvWL1FZS+
   xvzHGfy7ZzAhO69H2CKaNhm4fLU5HPslNZXrWmgnKlSfu4PoNVPRDxdLQ
   yKwHx6FoFgUWYhmSL8NKGSAylNRYOIo+FykBBkdiKIraHBQh56eWzsc0W
   9hYrFp1eFch4ccIlVnr30seXpOOVTXG8CQp5JNTNI/z3J/jyh66SPHUzv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="358492633"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="358492633"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 17:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="817284523"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="817284523"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2023 17:43:04 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPBZP-0002j8-1Z;
	Fri, 28 Jul 2023 00:43:03 +0000
Date: Fri, 28 Jul 2023 08:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 08/11] iio: adc: sd modulator: add scale and offset
 support
Message-ID: <202307280851.AdNONS92-lkp@intel.com>
References: <20230727150324.1157933-9-olivier.moysan@foss.st.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727150324.1157933-9-olivier.moysan@foss.st.com>

Hi Olivier,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on atorgue-stm32/stm32-next robh/for-next linus/master v6.5-rc3 next-20230727]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Olivier-Moysan/iio-introduce-iio-backend-device/20230727-231112
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20230727150324.1157933-9-olivier.moysan%40foss.st.com
patch subject: [RFC v2 08/11] iio: adc: sd modulator: add scale and offset support
config: i386-randconfig-i013-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280851.AdNONS92-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280851.AdNONS92-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307280851.AdNONS92-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/iio/adc/sd_adc_modulator.o: in function `iio_sd_mod_probe':
>> drivers/iio/adc/sd_adc_modulator.c:91: undefined reference to `iio_backend_alloc'
>> ld: drivers/iio/adc/sd_adc_modulator.c:100: undefined reference to `iio_backend_register'
>> ld: drivers/iio/adc/sd_adc_modulator.c:109: undefined reference to `iio_backend_free'


vim +91 drivers/iio/adc/sd_adc_modulator.c

    70	
    71	static int iio_sd_mod_probe(struct platform_device *pdev)
    72	{
    73		struct device *dev = &pdev->dev;
    74		struct regulator *vref;
    75		struct iio_backend *backend;
    76		struct iio_sd_mod_priv *priv;
    77		int ret;
    78	
    79		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
    80		if (!priv)
    81			return -ENOMEM;
    82	
    83		vref = devm_regulator_get_optional(dev, "vref");
    84		if (IS_ERR(vref)) {
    85			if (PTR_ERR(vref) != -ENODEV)
    86				return dev_err_probe(dev, PTR_ERR(vref), "Failed to get vref\n");
    87		} else {
    88			priv->vref = vref;
    89		}
    90	
  > 91		backend = iio_backend_alloc(dev);
    92		if (!backend) {
    93			dev_err(dev, "Failed to allocate sd modulator backend data\n");
    94			return -ENOMEM;
    95		}
    96	
    97		backend->priv = priv;
    98		backend->ops = &sd_mod_ops;
    99	
 > 100		ret = iio_backend_register(backend);
   101		if (ret) {
   102			dev_err(dev, "Failed to register backend: %d\n", ret);
   103			goto err_free_backend;
   104		}
   105	
   106		return 0;
   107	
   108	err_free_backend:
 > 109		iio_backend_free(&backend->dev);
   110	
   111		return ret;
   112	};
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
