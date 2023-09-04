Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3DC65D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 05:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693804756; x=1725340756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zYd4uZTiDJKCxYqspAemLAET6iMBbQMuYLA6axt8s8c=;
  b=VdvIw6do/hU1TrozLPkqoFB/hX966iHGYJfyUHB74QxVfF5WWvpho+am
   JZI4hdStlFZ1YbagRr4Oc5b6b0Delu99puu/pe9YBXCpQyw19TO1r31k/
   D5d8b+H0GazM2z4K6/o7tKkGuu5lKOZ74id73PR/JVVNXVL2j+4xQh3ZJ
   KkUi6uX9OhFJUIcFLXKahy09UZINC7aURv/m1KWXT3BvsZ3WSP8+EgC3U
   4nPHTZEXHXirGgWN3CLicjUJYGqdnmDx/NaeS7cz9GrWfd4H4YTQLo5eQ
   zea4wOgmJUHMzZrXy3mVnSUW+xIF9fXWDDrlCfb25rh+kD2XnL9f+hwKy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="380311631"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="380311631"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 22:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="864213215"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="864213215"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 03 Sep 2023 22:19:08 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qd1zO-0000C3-03;
	Mon, 04 Sep 2023 05:19:06 +0000
Date: Mon, 4 Sep 2023 13:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
	arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
	wsa@kernel.org, kfting@nuvoton.com, broonie@kernel.org,
	linus.walleij@linaro.org, hdegoede@redhat.com, maz@kernel.org,
	brgl@bgdev.pl, linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
	andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
	andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
	bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com
Cc: oe-kbuild-all@lists.linux.dev, zhifeng.wang@intel.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v13 2/4] i2c: Add support for Intel LJCA USB I2C driver
Message-ID: <202309041328.xzeaJFiO-lkp@intel.com>
References: <1693797462-4833-3-git-send-email-wentong.wu@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1693797462-4833-3-git-send-email-wentong.wu@intel.com>

Hi Wentong,

kernel test robot noticed the following build errors:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on broonie-spi/for-next linus/master v6.5 next-20230831]
[cannot apply to usb/usb-testing usb/usb-next usb/usb-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentong-Wu/usb-Add-support-for-Intel-LJCA-device/20230904-112200
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/1693797462-4833-3-git-send-email-wentong.wu%40intel.com
patch subject: [PATCH v13 2/4] i2c: Add support for Intel LJCA USB I2C driver
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20230904/202309041328.xzeaJFiO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230904/202309041328.xzeaJFiO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309041328.xzeaJFiO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-ljca.c: In function 'ljca_i2c_probe':
>> drivers/i2c/busses/i2c-ljca.c:311:17: error: implicit declaration of function 'acpi_dev_clear_dependencies' [-Werror=implicit-function-declaration]
     311 |                 acpi_dev_clear_dependencies(ACPI_COMPANION(&ljca_i2c->adap.dev));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/acpi_dev_clear_dependencies +311 drivers/i2c/busses/i2c-ljca.c

   270	
   271	static int ljca_i2c_probe(struct auxiliary_device *auxdev,
   272				  const struct auxiliary_device_id *aux_dev_id)
   273	{
   274		struct ljca_client *ljca = auxiliary_dev_to_ljca_client(auxdev);
   275		struct ljca_i2c_dev *ljca_i2c;
   276		int ret;
   277	
   278		ljca_i2c = devm_kzalloc(&auxdev->dev, sizeof(*ljca_i2c), GFP_KERNEL);
   279		if (!ljca_i2c)
   280			return -ENOMEM;
   281	
   282		ljca_i2c->ljca = ljca;
   283		ljca_i2c->i2c_info = dev_get_platdata(&auxdev->dev);
   284	
   285		ljca_i2c->adap.owner = THIS_MODULE;
   286		ljca_i2c->adap.class = I2C_CLASS_HWMON;
   287		ljca_i2c->adap.algo = &ljca_i2c_algo;
   288		ljca_i2c->adap.quirks = &ljca_i2c_quirks;
   289		ljca_i2c->adap.dev.parent = &auxdev->dev;
   290	
   291		snprintf(ljca_i2c->adap.name, sizeof(ljca_i2c->adap.name), "%s-%s-%d",
   292			 dev_name(&auxdev->dev), dev_name(auxdev->dev.parent),
   293			 ljca_i2c->i2c_info->id);
   294	
   295		device_set_node(&ljca_i2c->adap.dev, dev_fwnode(&auxdev->dev));
   296	
   297		i2c_set_adapdata(&ljca_i2c->adap, ljca_i2c);
   298		auxiliary_set_drvdata(auxdev, ljca_i2c);
   299	
   300		ret = ljca_i2c_init(ljca_i2c, ljca_i2c->i2c_info->id);
   301		if (ret)
   302			return dev_err_probe(&auxdev->dev, -EIO,
   303					     "i2c init failed id: %d\n",
   304					     ljca_i2c->i2c_info->id);
   305	
   306		ret = devm_i2c_add_adapter(&auxdev->dev, &ljca_i2c->adap);
   307		if (ret)
   308			return ret;
   309	
   310		if (has_acpi_companion(&ljca_i2c->adap.dev))
 > 311			acpi_dev_clear_dependencies(ACPI_COMPANION(&ljca_i2c->adap.dev));
   312	
   313		return 0;
   314	}
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
