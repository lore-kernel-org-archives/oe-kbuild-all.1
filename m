Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46661A28
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 06:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693290995; x=1724826995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aHERigYO/l39DPVWerFvkRKq6FhvZZaPh6TbDTweSOg=;
  b=JlQ0oYzxvaSpS7U3HFL4XPDIQKsFMMPGb/OHG5bfP/1XH7Mis+Cz13xe
   UOCgiI30cD5MpABrevThHXDhgAgAVmJgESP7pB6qezEGCKmGZvFpm2g9h
   Iw55os0+ETy6JC+qscQcgY4QpPMxYlQp6ILzSjVXyblRBI74u/0a39JDW
   C2xcXsf4ONQ0DxVRxyNwxOKs2WOPyn0XR+5clPeEdeXptDeTheO+HChJZ
   7axdOpAmRifzHgjqc93h5J2zI9NbwmrIkRepyBf9mocrFQZCTVyc+yc0i
   6SVAjmXYIy9hrnkhCC+nyxIQskxEGylA2K5nn3OVXBNDOeP2+Hn/T1o9r
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="439239550"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="439239550"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 23:36:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="808566253"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="808566253"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 28 Aug 2023 23:36:32 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qasL1-0008UJ-0n;
	Tue, 29 Aug 2023 06:36:31 +0000
Date: Tue, 29 Aug 2023 14:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:spb1-hacking 8176/9113]
 drivers/hwmon/pmbus/tda38640.c:117:14: error:
 'CONFIG_SENSORS_TDA38640_REGULATOR' undeclared; did you mean
 'CONFIG_SENSORS_LM25066_REGULATOR'?
Message-ID: <202308291406.wh0Eeucr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux spb1-hacking
head:   b3de99e1aeeeae3e96ffc4c34afae3d2ef4c8175
commit: b2d16420d16568d3ae60f56b32ba0fe8df813f40 [8176/9113] hwmon: (pmbus/tda38640) Add workaround for bug in SVID mode
config: x86_64-randconfig-002-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291406.wh0Eeucr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291406.wh0Eeucr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291406.wh0Eeucr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/pmbus/tda38640.c: In function 'tda38640_probe':
>> drivers/hwmon/pmbus/tda38640.c:117:14: error: 'CONFIG_SENSORS_TDA38640_REGULATOR' undeclared (first use in this function); did you mean 'CONFIG_SENSORS_LM25066_REGULATOR'?
     117 |         if (!CONFIG_SENSORS_TDA38640_REGULATOR || !np ||
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |              CONFIG_SENSORS_LM25066_REGULATOR
   drivers/hwmon/pmbus/tda38640.c:117:14: note: each undeclared identifier is reported only once for each function it appears in


vim +117 drivers/hwmon/pmbus/tda38640.c

   105	
   106	static int tda38640_probe(struct i2c_client *client)
   107	{
   108		struct device *dev = &client->dev;
   109		struct device_node *np = dev_of_node(dev);
   110		struct tda38640_data *data;
   111	
   112		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
   113		if (!data)
   114			return -ENOMEM;
   115		memcpy(&data->info, &tda38640_info, sizeof(tda38640_info));
   116	
 > 117		if (!CONFIG_SENSORS_TDA38640_REGULATOR || !np ||
   118		    of_property_read_u32(np, "infineon,en-pin-fixed-level", &data->en_pin_lvl))
   119			return pmbus_do_probe(client, &data->info);
   120	
   121		/*
   122		 * Apply ON_OFF_CONFIG workaround as enabling the regulator using the
   123		 * OPERATION register doesn't work in SVID mode.
   124		 */
   125		data->info.read_byte_data = tda38640_read_byte_data;
   126		data->info.write_byte_data = tda38640_write_byte_data;
   127		/*
   128		 * One should configure PMBUS_ON_OFF_CONFIG here, but
   129		 * PB_ON_OFF_CONFIG_POWERUP_CONTROL, PB_ON_OFF_CONFIG_EN_PIN_REQ and
   130		 * PB_ON_OFF_CONFIG_EN_PIN_REQ are ignored by the device.
   131		 * Only PB_ON_OFF_CONFIG_POLARITY_HIGH has an effect.
   132		 */
   133	
   134		return pmbus_do_probe(client, &data->info);
   135	}
   136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
