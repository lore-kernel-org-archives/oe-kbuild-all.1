Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB63C19A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Sep 2023 02:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693623486; x=1725159486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OwhT9V/OUgTWOmOq1TdBL62hifSY0CM30VfqLKsO+1Y=;
  b=AUd4PlHVs/Fx/62RTdGddEvISulY2zZBaQmRC3atqSeevWyrw0xKX1zV
   Fwvo+7CRXziUuxBi6rT3BvnuUZITxh/MQU0PWKQwAc0yW3jx6CiuJ3Iry
   I+rDTzP3bHNkJ8V6/NUA7rQQF8JfYge3VAgUKScQDUHeITZqbp1yFMSn3
   c6IudN5jveC5BgDNVNgTkjCRCFsE6XWxK5SudZ1QJYF8JIl+zFGvsSquN
   Pi6ZSvWQTwornf50rmOGXutWCNenwqyRQtYYmJiD2XNLUVVLPGuV1GAz7
   2AlVCQxT9XRVnMREgm3pStl6nlaRy0Lhg8XhZyWRA0tY2Q8Ryg8aPMQeu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355841375"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="355841375"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 19:58:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="716968656"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="716968656"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Sep 2023 19:58:04 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcGpm-0001tZ-07;
	Sat, 02 Sep 2023 02:58:02 +0000
Date: Sat, 2 Sep 2023 10:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 29/68] drivers/iio/adc/twl6030-gpadc.c:886:15:
 warning: assignment to 'const struct twl6030_gpadc_platform_data *' from
 'int' makes pointer from integer without a cast
Message-ID: <202309021001.3k8m2E9T-lkp@intel.com>
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
commit: 23739ec864c4897c8c599ad2ad2ebe6638061ab5 [29/68] iio: Use device_get_match_data()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230902/202309021001.3k8m2E9T-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021001.3k8m2E9T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309021001.3k8m2E9T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/adc/twl6030-gpadc.c: In function 'twl6030_gpadc_probe':
   drivers/iio/adc/twl6030-gpadc.c:886:17: error: implicit declaration of function 'device_get_match_data'; did you mean 'device_match_any'? [-Werror=implicit-function-declaration]
     886 |         pdata = device_get_match_data(&pdev->dev);
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 device_match_any
>> drivers/iio/adc/twl6030-gpadc.c:886:15: warning: assignment to 'const struct twl6030_gpadc_platform_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     886 |         pdata = device_get_match_data(&pdev->dev);
         |               ^
   cc1: some warnings being treated as errors


vim +886 drivers/iio/adc/twl6030-gpadc.c

   876	
   877	static int twl6030_gpadc_probe(struct platform_device *pdev)
   878	{
   879		struct device *dev = &pdev->dev;
   880		struct twl6030_gpadc_data *gpadc;
   881		const struct twl6030_gpadc_platform_data *pdata;
   882		struct iio_dev *indio_dev;
   883		int irq;
   884		int ret;
   885	
 > 886		pdata = device_get_match_data(&pdev->dev);
   887		if (!pdata)
   888			return -EINVAL;
   889	
   890		indio_dev = devm_iio_device_alloc(dev, sizeof(*gpadc));
   891		if (!indio_dev)
   892			return -ENOMEM;
   893	
   894		gpadc = iio_priv(indio_dev);
   895	
   896		gpadc->twl6030_cal_tbl = devm_kcalloc(dev,
   897						pdata->nchannels,
   898						sizeof(*gpadc->twl6030_cal_tbl),
   899						GFP_KERNEL);
   900		if (!gpadc->twl6030_cal_tbl)
   901			return -ENOMEM;
   902	
   903		gpadc->dev = dev;
   904		gpadc->pdata = pdata;
   905	
   906		platform_set_drvdata(pdev, indio_dev);
   907		mutex_init(&gpadc->lock);
   908		init_completion(&gpadc->irq_complete);
   909	
   910		ret = pdata->calibrate(gpadc);
   911		if (ret < 0) {
   912			dev_err(dev, "failed to read calibration registers\n");
   913			return ret;
   914		}
   915	
   916		irq = platform_get_irq(pdev, 0);
   917		if (irq < 0)
   918			return irq;
   919	
   920		ret = devm_request_threaded_irq(dev, irq, NULL,
   921					twl6030_gpadc_irq_handler,
   922					IRQF_ONESHOT, "twl6030_gpadc", indio_dev);
   923		if (ret)
   924			return ret;
   925	
   926		ret = twl6030_gpadc_enable_irq(TWL6030_GPADC_RT_SW1_EOC_MASK);
   927		if (ret < 0) {
   928			dev_err(dev, "failed to enable GPADC interrupt\n");
   929			return ret;
   930		}
   931	
   932		ret = twl_i2c_write_u8(TWL6030_MODULE_ID1, TWL6030_GPADCS,
   933						TWL6030_REG_TOGGLE1);
   934		if (ret < 0) {
   935			dev_err(dev, "failed to enable GPADC module\n");
   936			return ret;
   937		}
   938	
   939		ret = twl_i2c_write_u8(TWL_MODULE_USB, VBUS_MEAS, USB_VBUS_CTRL_SET);
   940		if (ret < 0) {
   941			dev_err(dev, "failed to wire up inputs\n");
   942			return ret;
   943		}
   944	
   945		ret = twl_i2c_write_u8(TWL_MODULE_USB, ID_MEAS, USB_ID_CTRL_SET);
   946		if (ret < 0) {
   947			dev_err(dev, "failed to wire up inputs\n");
   948			return ret;
   949		}
   950	
   951		ret = twl_i2c_write_u8(TWL6030_MODULE_ID0,
   952					VBAT_MEAS | BB_MEAS | VAC_MEAS,
   953					TWL6030_MISC1);
   954		if (ret < 0) {
   955			dev_err(dev, "failed to wire up inputs\n");
   956			return ret;
   957		}
   958	
   959		indio_dev->name = DRIVER_NAME;
   960		indio_dev->info = &twl6030_gpadc_iio_info;
   961		indio_dev->modes = INDIO_DIRECT_MODE;
   962		indio_dev->channels = pdata->iio_channels;
   963		indio_dev->num_channels = pdata->nchannels;
   964	
   965		return iio_device_register(indio_dev);
   966	}
   967	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
