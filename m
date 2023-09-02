Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBE719A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Sep 2023 03:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693624866; x=1725160866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9NYXL0pKVxwc3tJA/lubRIlvABp9DlPktkAs4IKaB+Q=;
  b=mlgBZznbU/45Jhf5m4gsj+guYCtJHKkz/ydieFredWuenX3bEFIIwNOI
   8vNizj+kuzXb/EAVcANyOw1oVsn+vKHWazAV6ql3Z+gjTf2Cb3jggVOjt
   FUxMymDSjGnnw+6V60kVEx8U3XHFeF9LNgvekLEsn59eI7+/IKQJMA5jV
   bvgA10wz+RJSbq2yRUfQb7Eoxp85yOkQ6qJh7shKAM2von5gOYAM18pnb
   JJcjw+7enS2xtfdZdd6kQPH0ibRgVaCzNZEeStPjTB5pLG/G3CYqWN7hA
   335skaXdans+u6Blhuzy3WSmcXAUimImmediN2SqUCKstlYCkmx6BaJUI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="380133811"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="380133811"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 20:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805653882"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="805653882"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Sep 2023 20:21:04 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcHC2-0001uc-1r;
	Sat, 02 Sep 2023 03:21:02 +0000
Date: Sat, 2 Sep 2023 11:20:56 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 35/68] drivers/mfd/wm831x-i2c.c:30:27: error:
 implicit declaration of function 'i2c_device_get_match_data'; did you mean
 'of_device_get_match_data'?
Message-ID: <202309021149.AMAD3uEb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   9ece0c059fa7600e46d8e2deecc2fa1bd86cde7e
commit: 3d460ef8fac8644d12f84dacdc46cdfa981880c5 [35/68] mfd: Use device_get_match_data()
config: x86_64-buildonly-randconfig-002-20230902 (https://download.01.org/0day-ci/archive/20230902/202309021149.AMAD3uEb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021149.AMAD3uEb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309021149.AMAD3uEb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/wm831x-i2c.c: In function 'wm831x_i2c_probe':
>> drivers/mfd/wm831x-i2c.c:30:27: error: implicit declaration of function 'i2c_device_get_match_data'; did you mean 'of_device_get_match_data'? [-Werror=implicit-function-declaration]
      30 |         type = (uintptr_t)i2c_device_get_match_data(i2c);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                           of_device_get_match_data
   cc1: some warnings being treated as errors


vim +30 drivers/mfd/wm831x-i2c.c

    22	
    23	static int wm831x_i2c_probe(struct i2c_client *i2c)
    24	{
    25		struct wm831x_pdata *pdata = dev_get_platdata(&i2c->dev);
    26		struct wm831x *wm831x;
    27		enum wm831x_parent type;
    28		int ret;
    29	
  > 30		type = (uintptr_t)i2c_device_get_match_data(i2c);
    31		if (!type) {
    32			dev_err(&i2c->dev, "Failed to match device\n");
    33			return -ENODEV;
    34		}
    35	
    36		wm831x = devm_kzalloc(&i2c->dev, sizeof(struct wm831x), GFP_KERNEL);
    37		if (wm831x == NULL)
    38			return -ENOMEM;
    39	
    40		i2c_set_clientdata(i2c, wm831x);
    41		wm831x->dev = &i2c->dev;
    42		wm831x->type = type;
    43	
    44		wm831x->regmap = devm_regmap_init_i2c(i2c, &wm831x_regmap_config);
    45		if (IS_ERR(wm831x->regmap)) {
    46			ret = PTR_ERR(wm831x->regmap);
    47			dev_err(wm831x->dev, "Failed to allocate register map: %d\n",
    48				ret);
    49			return ret;
    50		}
    51	
    52		if (pdata)
    53			memcpy(&wm831x->pdata, pdata, sizeof(*pdata));
    54	
    55		return wm831x_device_init(wm831x, i2c->irq);
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
