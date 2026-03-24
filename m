Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECB3393DD1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 11:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774351626; cv=none; b=gAX9SfyK9mvowXjLlalqv5ASnvqlvHAPAZ54ayfBCccG7E85Iuv04OEO8C7Nzbm5jTGwpd1UWl3t/mWKxB3Yx0GG0yB95q9fJo2H2ag8b1yj+PFE242lH3hFsZ54lYfpRw3NXCvoKqkmdQAg9K9eVBG70SGoBnQzsMf/OKkMlQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774351626; c=relaxed/simple;
	bh=+h4FMVRqeGWOQRuIRqNzUNGW6iI1kQhbOWcQjzGux/0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D/EJLl+gQgiSMXNHzon1D0+i6gTuUosk6w78EX95gh/LefS4e+cfPiIP/V2lolWkwUOQkw1wzemt9BsmaEYr79+mfGJ3YqrDqvoACtakPi/qtwy2XEof4SD/9epcUeYfMNRCDt8TKep5584kmOA/G1SLC14+HGmvVSKP2IvJ2tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLxchCub; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLxchCub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774351625; x=1805887625;
  h=date:from:to:cc:subject:message-id;
  bh=+h4FMVRqeGWOQRuIRqNzUNGW6iI1kQhbOWcQjzGux/0=;
  b=cLxchCubwmuOuOOAb8tGSZLRB5LXsdWxm321LZAEs6vrpvacq3OBrTLs
   0gUyNBt04EUc+Dqhpr5FUvchZd5CiTpTbVYffRXleV4M8YQap9Z12yt8F
   e6bRF7y36M74fdFzBtLItf+0cDaWN6AkqYa6x56mD1l6tqzNH3OztdL8/
   NY5eY9iWH8vnYYVkiAMQSmKmC6wsXvW6ne+iTngEYf3+mNCYxUOXuhRJw
   x5xwIEAP8mDkfZItRyKueE2vFObG5T/Kuo/utclxXyce8rf6aAVGsydox
   BxVG8SBgMTghoo/dDzVwiYNxgRNeqDBIvPc5f+RMUEQjC1MMol0hxpeI7
   Q==;
X-CSE-ConnectionGUID: GyQD6IgTTc2+SYnoyv41vw==
X-CSE-MsgGUID: COrqHdSsShq9F8PhQupKTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="62915510"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="62915510"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:27:04 -0700
X-CSE-ConnectionGUID: SuORM+VRS96MfH44MmnLxQ==
X-CSE-MsgGUID: Beq0BJhJScOVA93Ykvsg3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="229248749"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Mar 2026 04:27:02 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4zuW-000000004Tt-1Z0m;
	Tue, 24 Mar 2026 11:27:00 +0000
Date: Tue, 24 Mar 2026 19:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 36/36]
 sound/soc/codecs/tas2764.c:745:19: warning: cast to smaller integer type
 'enum tas2764_devid' from 'const void *'
Message-ID: <202603241926.F7ZovF5a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Martin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2d13a0e00b4d9cf3601b0e0d2c1838ec962f4e88
commit: d1f8358c5d359c0563d5cf788265a617d338cb26 [36/36] ASoC: tas2764: Extend driver to SN012776
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260324/202603241926.F7ZovF5a-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241926.F7ZovF5a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241926.F7ZovF5a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/tas2764.c:745:19: warning: cast to smaller integer type 'enum tas2764_devid' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     745 |         tas2764->devid = (enum tas2764_devid)of_device_get_match_data(&client->dev);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +745 sound/soc/codecs/tas2764.c

   734	
   735	static int tas2764_i2c_probe(struct i2c_client *client)
   736	{
   737		struct tas2764_priv *tas2764;
   738		int result;
   739	
   740		tas2764 = devm_kzalloc(&client->dev, sizeof(struct tas2764_priv),
   741				       GFP_KERNEL);
   742		if (!tas2764)
   743			return -ENOMEM;
   744	
 > 745		tas2764->devid = (enum tas2764_devid)of_device_get_match_data(&client->dev);
   746	
   747		tas2764->dev = &client->dev;
   748		tas2764->irq = client->irq;
   749		i2c_set_clientdata(client, tas2764);
   750		dev_set_drvdata(&client->dev, tas2764);
   751	
   752		tas2764->regmap = devm_regmap_init_i2c(client, &tas2764_i2c_regmap);
   753		if (IS_ERR(tas2764->regmap)) {
   754			result = PTR_ERR(tas2764->regmap);
   755			dev_err(&client->dev, "Failed to allocate register map: %d\n",
   756						result);
   757			return result;
   758		}
   759	
   760		if (client->dev.of_node) {
   761			result = tas2764_parse_dt(&client->dev, tas2764);
   762			if (result) {
   763				dev_err(tas2764->dev, "%s: Failed to parse devicetree\n",
   764					__func__);
   765				return result;
   766			}
   767		}
   768	
   769		return devm_snd_soc_register_component(tas2764->dev,
   770						       &soc_component_driver_tas2764,
   771						       tas2764_dai_driver,
   772						       ARRAY_SIZE(tas2764_dai_driver));
   773	}
   774	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
