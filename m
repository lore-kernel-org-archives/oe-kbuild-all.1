Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794105239;
	b=jr2yhk+ItY2V7MHNVyZR2JzPHTNh3iwxLbvsTrsk3GAF+e1y1w/sG3e1JNfNKq6k+rSw
	 RRIf648LSs7MoZd/ux3fA2UgOsvvJ7egijQwEGIlOfFGwfR1yHSoC+RxXmbIYnLrN6TUk
	 zMP5W+ZiDCf3N8YaHjfdH2ODbWSyUPHde4JtakMCcCwOQdMDNQtNDrffweo+Yudn7MGCX
	 2Hmxez5XMDf52XHi+D2zFmY9WamwTXRiHhQJGd2p7sz2Q67XHSy5F21oDNXR50JuXK3ul
	 H83obFSiKsvjtTiwzorjiELfYssYy7ui3wkNN23u4ZlZvDBLveq9lrkfE9bOOR9OaNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794105239;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=phliogDzS0oa8mEsQucNqaoumjNhwq0ZAuCXATv7PsQ=;
	b=OATw9uHEhZ0GWmuuYpPe+gRQ/yaEKGUHOB6ToHXu0otKiq+RFmNz/GTVjCtdfPrz3PMk
	 SIl0OqX7tKCaXtjYPdE7aqbRutaKAo9COBmMFaMbCeLMGHwXkkcMIfYa8rFG8RsDUNZeG
	 LzuNeYRQRSBw5HTbitQp95dSdFPJyhIPCdsQdieV5h1P5rQSXV44ga2kSxpK2u/G1elMk
	 xdvzjc/vq4me/0+pFPhxXEKsQzu4llvOlaUS0W7ac3pNPBirKl1KbD+Q/5miyT1AIRgRG
	 YG62AmRk3ev19HiDyeFPrHGEk6A7MCB7NDXK3iYc+Lq5yUDaxxu+Wsu7csdvMg+b+6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KPriszBQ;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DDE606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 02:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72DDE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KPriszBQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794105238; x=1825641238;
  h=date:from:to:cc:subject:message-id;
  bh=YQYpWk1BRURnqQbravIoZe83Z2exp4/w+9aC1Mpv6lo=;
  b=KPriszBQ93RWCZD8QSX7SkagsDNwdScDuj1afcgaRzX7dxRwXSE+x8zU
   4CHhSCybkmMH/u5/zoGu/HUFiYpGmmMiP44kScrOwq7zJVyupNBOew/Cs
   3DqZlgLx3/DxnhhAC16NywRqieEfT3B/NUp1dXK2vhZRQ6S5jmPz7xGYD
   BNfmWlaAA3vbNTXNOjyppNM/POI6bLHxU6KzkHMyve3UuwIvOGf7mnWS3
   pbkA0Ww3yKVFC178VmyEGpE3pr2dMBW2Kk3h5t6TdVXHQ/d4mE0+0b88d
   476CzIAqC8Nm4AqYOwVR3J4cNfIR7sIr2HNEjsSUachNvuxemqJm29Oru
   Q==;
X-CSE-ConnectionGUID: mTdRsaKMR3S2qIsgYTrHwg==
X-CSE-MsgGUID: dHqzSKAqSjaZOiwL4Bq6oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2904816"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2904816"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 18:33:57 -0800
X-CSE-ConnectionGUID: ado9xX7ORT+F+kzgVzD4hw==
X-CSE-MsgGUID: LzNRcbyZTnCKDJSmkxe9lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9443783"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 07 Nov 2026 18:33:55 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPsjB-00000000Axl-1Ask;
	Sun, 08 Nov 2026 02:33:53 +0000
Date: Sun, 08 Nov 2026 03:33:33 +0100
From: kernel test robot <lkp@intel.com>
To: Alyssa Milburn <amilburn@zall.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
 Sasha Finkelstein <k@chaosmail.tech>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [asahilinux:bits/260-spmi-typec 11/15]
 drivers/usb/typec/tipd/i2c.c:21:12: warning: cast to smaller integer type
 'enum tipd_hw_variant' from 'const void *'
Message-ID: <202611080342.Vlxm0G4M-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/260-spmi-typec
head:   c062a0671e439cd6cfa9df139ad50ce6d70222bf
commit: ff0724a0fa1915b8019391edd1e78cb159a2797f [11/15] usb: typec: tipd: Factor out i2c specifics
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20261108/202611080342.Vlxm0G4M-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080342.Vlxm0G4M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080342.Vlxm0G4M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/tipd/i2c.c:21:12: warning: cast to smaller integer type 'enum tipd_hw_variant' from 'const void *' [-Wvoid-pointer-to-enum-cast]
      21 |         variant = (enum tipd_hw_variant)i2c_get_match_data(client);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +21 drivers/usb/typec/tipd/i2c.c

    13	
    14	static int tps6598x_probe_i2c(struct i2c_client *client)
    15	{
    16		enum tipd_hw_variant variant;
    17		const struct tipd_data *data;
    18		struct tps6598x *tps;
    19		int ret;
    20	
  > 21		variant = (enum tipd_hw_variant)i2c_get_match_data(client);
    22		if (!variant || variant >= TIPD_VARIANT_MAX)
    23			return -EINVAL;
    24		data = tipd_hw_variants[variant];
    25	
    26		tps = devm_kzalloc(&client->dev, data->tps_struct_size, GFP_KERNEL);
    27		if (!tps)
    28			return -ENOMEM;
    29	
    30		mutex_init(&tps->lock);
    31		tps->dev = &client->dev;
    32		tps->data = data;
    33		tps->irq = client->irq;
    34	
    35		tps->regmap = devm_regmap_init_i2c(client, &tps6598x_regmap_config);
    36		if (IS_ERR(tps->regmap))
    37			return PTR_ERR(tps->regmap);
    38	
    39		/*
    40		 * Checking can the adapter handle SMBus protocol. If it can not, the
    41		 * driver needs to take care of block reads separately.
    42		 */
    43		if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
    44			tps->i2c_protocol = true;
    45	
    46		ret = tipd_init(tps);
    47	
    48		if (ret == 0)
    49			i2c_set_clientdata(client, tps);
    50	
    51		return ret;
    52	}
    53	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
