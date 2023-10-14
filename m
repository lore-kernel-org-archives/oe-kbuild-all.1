Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0E71803B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 18:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpVrZm6E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697307066; x=1728843066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8b1IzwbUZ4dubuxPRPyPIpC+NMXo/A6E8VbLXIofGUA=;
  b=SpVrZm6ERjeM+Dw+feIeSfeZ0LagK6K343RCiDSGeOe8nCDcSv3CQj96
   l6QIuxGbGm8xbmBzbW4xl0F6oBV8zLuQAGWeizkOnJuEQeIueelX/r5Kf
   kCYQmJ68if9HJ89ENSJF0L82Gu/67YyjwMcpcnsGTwPstWENwgYKQk3jT
   vnH6SeQ0J/2igBq+6On0xWWJ4Lb7IWNFDm6tW/MNmgEWgltvPURj1vSg+
   JT7VkcGX5K+Q7N/AwMBhmSZcECHyZwe3Bl+z03SJmz8nm/2pGIbIbao04
   YFgXzZUEeycqj+yhOcC+kU5LpLj1Fh9C0d+MVeT64NnGISGoiHhrFIho/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="385180112"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="385180112"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 11:11:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="898928704"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="898928704"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2023 11:09:10 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrj6L-0006U1-39;
	Sat, 14 Oct 2023 18:11:01 +0000
Date: Sun, 15 Oct 2023 02:11:00 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 551/30000]
 drivers/video/fbdev/mxc/mxsfb_sii902x.c:492:1: warning: the frame size of
 1096 bytes is larger than 1024 bytes
Message-ID: <202310150208.INRp210Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 1907d4da81900dd1b86cbf4e657fafc02d9360ac [551/30000] video: fbdev: add sii902x hdmi driver code
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310150208.INRp210Y-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150208.INRp210Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150208.INRp210Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/mxc/mxsfb_sii902x.c: In function 'sii902x_probe':
>> drivers/video/fbdev/mxc/mxsfb_sii902x.c:492:1: warning: the frame size of 1096 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     492 | }
         | ^


vim +492 drivers/video/fbdev/mxc/mxsfb_sii902x.c

   389	
   390	static int sii902x_probe(struct i2c_client *client,
   391			const struct i2c_device_id *id)
   392	{
   393		int i, dat, ret;
   394		struct fb_info edid_fbi;
   395		struct fb_info *init_fbi = sii902x.fbi;
   396	
   397		memset(&sii902x, 0, sizeof(sii902x));
   398	
   399		sii902x.client = client;
   400	
   401		dev_dbg(&sii902x.client->dev, "%s\n", __func__);;
   402	
   403		/* Reset sii902x */
   404		ret = device_reset(&sii902x.client->dev);
   405		if (ret)
   406			dev_warn(&sii902x.client->dev, "No reset pin found\n");
   407		if (ret == -EPROBE_DEFER)
   408			return ret;
   409	
   410		/* Set 902x in hardware TPI mode on and jump out of D3 state */
   411		if (i2c_smbus_write_byte_data(sii902x.client, 0xc7, 0x00) < 0) {
   412			dev_err(&sii902x.client->dev,
   413				"Sii902x: cound not find device\n");
   414			return -ENODEV;
   415		}
   416	
   417		/* read device ID */
   418		for (i = 10; i > 0; i--) {
   419			dat = i2c_smbus_read_byte_data(sii902x.client, 0x1B);
   420			dev_dbg(&sii902x.client->dev, "Sii902x: read id = 0x%02X", dat);
   421			if (dat == 0xb0) {
   422				dat = i2c_smbus_read_byte_data(sii902x.client, 0x1C);
   423				dev_dbg(&sii902x.client->dev, "-0x%02X", dat);
   424				dat = i2c_smbus_read_byte_data(sii902x.client, 0x1D);
   425				dev_dbg(&sii902x.client->dev, "-0x%02X", dat);
   426				dat = i2c_smbus_read_byte_data(sii902x.client, 0x30);
   427				dev_dbg(&sii902x.client->dev, "-0x%02X\n", dat);
   428				break;
   429			}
   430		}
   431		if (i == 0) {
   432			dev_err(&sii902x.client->dev,
   433				"Sii902x: cound not find device\n");
   434			return -ENODEV;
   435		}
   436	
   437		/* enable hmdi audio */
   438		sii902x_audio_setup();
   439	
   440		/* try to read edid, only if cable is plugged in */
   441		dat = i2c_smbus_read_byte_data(sii902x.client, 0x3D);
   442		if (dat & 0x04) {
   443			ret = sii902x_read_edid(&edid_fbi);
   444			if (ret < 0)
   445				dev_warn(&sii902x.client->dev, "Can not read edid\n");
   446		}
   447	
   448		if (sii902x.client->irq) {
   449			ret = request_irq(sii902x.client->irq, sii902x_detect_handler,
   450					IRQF_TRIGGER_FALLING,
   451					"SII902x_det", &sii902x);
   452			if (ret < 0)
   453				dev_warn(&sii902x.client->dev,
   454					"Sii902x: cound not request det irq %d\n",
   455					sii902x.client->irq);
   456			else {
   457				/*enable cable hot plug irq*/
   458				i2c_smbus_write_byte_data(sii902x.client, 0x3c, 0x01);
   459				INIT_DELAYED_WORK(&(sii902x.det_work), det_worker);
   460			}
   461			ret = device_create_file(&sii902x.client->dev, &dev_attr_fb_name);
   462			if (ret < 0)
   463				dev_warn(&sii902x.client->dev,
   464					"Sii902x: cound not create sys node for fb name\n");
   465			ret = device_create_file(&sii902x.client->dev, &dev_attr_cable_state);
   466			if (ret < 0)
   467				dev_warn(&sii902x.client->dev,
   468					"Sii902x: cound not create sys node for cable state\n");
   469			ret = device_create_file(&sii902x.client->dev, &dev_attr_edid);
   470			if (ret < 0)
   471				dev_warn(&sii902x.client->dev,
   472					"Sii902x: cound not create sys node for edid\n");
   473	
   474		}
   475	
   476		mxsfb_get_of_property();
   477	
   478		if (init_fbi) {
   479			sii902x.fbi = init_fbi;
   480	
   481			/* Manually trigger a plugin/plugout interrupter to check cable state */
   482			schedule_delayed_work(&(sii902x.det_work), msecs_to_jiffies(50));
   483		}
   484	
   485		sii902x_in_init_state = 0;
   486	
   487		dev_set_drvdata(&sii902x.client->dev, &sii902x);
   488	
   489		sii902x_register_audio_driver(&sii902x.client->dev);
   490	
   491		return 0;
 > 492	}
   493	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
