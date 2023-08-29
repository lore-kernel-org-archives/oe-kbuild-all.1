Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015CDA47
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 03:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693278420; x=1724814420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6uPYAevfcIpq91mMZ5pGIqgvEOSJx9PvMBQon5V+BUY=;
  b=JBrFGTdgpgF4xff0dj9g9XMUhDgtFa4PTBvFvAwgTEv06UsNIFxQfAKr
   0WvCIB3o0hSeeJAyZsv5+ndpu2ZQIRUXqYzrnKVwFQN9wfNk9JpPWg+n9
   sPn2wtYx0ta8mug1f7OEyGb8jjYHvq8/C9OCeo9IH/1FxfRtLkHgxRSUW
   999pbes9zPI/Aq/UfGWOaVC1uSvsB+3tBGbwP2i6Cvi7+vmBqN5K+1sau
   2Q1OBINdGtilHftV6AIU1vnqyuUgI72vsQvmwV1jk+rykiNDPqfAfTs7r
   dLXPcjBH+rueUbyhc0b+ppNskvKS4uHeT1VJIox+OdfCc5QkrLuEsiFxn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="379038954"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="379038954"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 20:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="715373603"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="715373603"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 28 Aug 2023 20:05:35 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qap2s-0008KX-1A;
	Tue, 29 Aug 2023 03:05:34 +0000
Date: Tue, 29 Aug 2023 11:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:spb1-hacking 8176/9113]
 drivers/hwmon/pmbus/tda38640.c:117:7: error: use of undeclared identifier
 'CONFIG_SENSORS_TDA38640_REGULATOR'
Message-ID: <202308291106.IjQwqtse-lkp@intel.com>
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
config: hexagon-randconfig-001-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291106.IjQwqtse-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291106.IjQwqtse-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291106.IjQwqtse-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwmon/pmbus/tda38640.c:10:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/hwmon/pmbus/tda38640.c:10:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/hwmon/pmbus/tda38640.c:10:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/hwmon/pmbus/tda38640.c:117:7: error: use of undeclared identifier 'CONFIG_SENSORS_TDA38640_REGULATOR'
     117 |         if (!CONFIG_SENSORS_TDA38640_REGULATOR || !np ||
         |              ^
   6 warnings and 1 error generated.


vim +/CONFIG_SENSORS_TDA38640_REGULATOR +117 drivers/hwmon/pmbus/tda38640.c

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
