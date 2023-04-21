Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1457417D3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 06:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682057771; x=1713593771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xGtkrDkYDBOZRk6JD8cYN/feDgrtJL3rCvw61scSVnA=;
  b=hfVvYEXuiRKLuoaYHqj0PimEcOeJ5a0LMKfFPyi4XX7E5hV0I6IjSLJS
   vVT2iVgXlFTnjqw7ar25OH4LUxOf2b3vaL+pV51n8lKuoBEYPZQVPVIuI
   dIp+/pJrJek5DXcWOA2UvigKB22+GcyXj8bUuft/VDE9kZvjh/uIr7Osv
   2ZuCJR9aWcZC85DlBl+7LGHdJkCCoLQ6xLlDYrBpX3GJVlTEYXGtOcFER
   gTP08MDAH5knfiXleozMGy/93ex30nmCehpDJ9jCcPQ/MlNxMy88MdlTc
   emC5WysIpe24l6yfb8v/wxz+UEpF2b99kgQ792TqfPuuRpPpNSmMYUMSb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="330124519"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="330124519"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 23:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="1021816704"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="1021816704"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2023 23:16:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppk3w-000gNQ-2s;
	Fri, 21 Apr 2023 06:16:04 +0000
Date: Fri, 21 Apr 2023 14:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, jdelvare@suse.com,
	linux@roeck-us.net, manio@skyboo.net
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v2 2/2] hwmon: (adt7475) Convert to use device_property
 APIs
Message-ID: <202304211315.wHZGWO8S-lkp@intel.com>
References: <20230418233656.869055-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418233656.869055-3-chris.packham@alliedtelesis.co.nz>

Hi Chris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.3-rc7]
[cannot apply to next-20230420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Packham/hwmon-adt7475-Use-device_property-APIs-when-configuring-polarity/20230419-074117
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230418233656.869055-3-chris.packham%40alliedtelesis.co.nz
patch subject: [PATCH v2 2/2] hwmon: (adt7475) Convert to use device_property APIs
config: i386-randconfig-s002-20230417 (https://download.01.org/0day-ci/archive/20230421/202304211315.wHZGWO8S-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/59836340c66130951595e2adebf284eca3063ccd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chris-Packham/hwmon-adt7475-Use-device_property-APIs-when-configuring-polarity/20230419-074117
        git checkout 59836340c66130951595e2adebf284eca3063ccd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hwmon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304211315.wHZGWO8S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/adt7475.c:1471:44: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct device *dev @@     got struct device const * @@
   drivers/hwmon/adt7475.c:1471:44: sparse:     expected struct device *dev
   drivers/hwmon/adt7475.c:1471:44: sparse:     got struct device const *
   drivers/hwmon/adt7475.c:1497:44: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct device *dev @@     got struct device const * @@
   drivers/hwmon/adt7475.c:1497:44: sparse:     expected struct device *dev
   drivers/hwmon/adt7475.c:1497:44: sparse:     got struct device const *
   drivers/hwmon/adt7475.c:1559:45: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct device *dev @@     got struct device const * @@
   drivers/hwmon/adt7475.c:1559:45: sparse:     expected struct device *dev
   drivers/hwmon/adt7475.c:1559:45: sparse:     got struct device const *

vim +1471 drivers/hwmon/adt7475.c

  1464	
  1465	static int load_config3(const struct i2c_client *client, const char *propname)
  1466	{
  1467		const char *function;
  1468		u8 config3;
  1469		int ret;
  1470	
> 1471		ret = device_property_read_string(&client->dev, propname, &function);
  1472		if (!ret) {
  1473			ret = adt7475_read(REG_CONFIG3);
  1474			if (ret < 0)
  1475				return ret;
  1476	
  1477			config3 = ret & ~CONFIG3_SMBALERT;
  1478			if (!strcmp("pwm2", function))
  1479				;
  1480			else if (!strcmp("smbalert#", function))
  1481				config3 |= CONFIG3_SMBALERT;
  1482			else
  1483				return -EINVAL;
  1484	
  1485			return i2c_smbus_write_byte_data(client, REG_CONFIG3, config3);
  1486		}
  1487	
  1488		return 0;
  1489	}
  1490	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
