Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36966188A3A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 23:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765496458; cv=none; b=CDTz0aWrKpeqMle4JCH2GRpGYJttZVlP2ToMghCHl6ifK0xltJ7xE5WVNkn82IEjBojyry5QM194S7pLhrSg3DCVOxRy/YEpzIy6llvMEcp2g5rZ8h6W4MvH7Mx26yk0UIV/eemAgXU1PpyOT68ideOssOc5isDoa1IYzxgTm1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765496458; c=relaxed/simple;
	bh=/0sLdujtRYOKiH3BttgZhY/A6QDMObuAC5PrlKZ8jG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e5oFE75i4U1zSCg5FeNQEfTUG8PkEBynEqOkPTrtz20+HSL+/C9QVtWTDb1wL3b7bX2J4L+zigNU7Z11521D37GolOBF4EjNsyMz/0kj/nu/fusSShEHIGgBrYM8rXuaZfd4HamI+WitovgAUnWJyqqa8PLmfsFBOJjAEj2gvAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4RfObrd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4RfObrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765496456; x=1797032456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/0sLdujtRYOKiH3BttgZhY/A6QDMObuAC5PrlKZ8jG0=;
  b=f4RfObrd1sBpc+QP16zKRl1aYK0kKU5k4sGIwLsjIC50bbf9qMd7/Z5D
   3EsJRNtLYZCaiiWeNLmLW/OOUsi4cVU3Aqt/0uVeVyDXEOHBFcId2A3k/
   7nY0gCWlxb31VLlw0jAhLa3uRC/6shw4z1vZCAIBB/qmw1Yz8/Qmf1qzp
   KEQWPKtgNzx5ml2Sj+RNAUl+M07NHtHTrJfF8Amy54J84QmKgf2qkNzIf
   iE/XOJVgIZklotkUKYdQbVMr45N60pmSNbbrRhPGsrOXUpneojTCUNNYv
   HCbVt6wflvU+MXpoNRJyMqCZvXIGe0ZSmmydENISbmHTPitDYmpbYmfkh
   w==;
X-CSE-ConnectionGUID: rz5JgfaYS5K2LZ5wlAr+XA==
X-CSE-MsgGUID: j7gpmUp6Tn2zAHaNHcl7CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78855725"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78855725"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 15:40:55 -0800
X-CSE-ConnectionGUID: xDhDPGj+RvC0KlQcUAVgiw==
X-CSE-MsgGUID: 42rZORF9SFKcgtKN6MV2nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196702617"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Dec 2025 15:40:54 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTqHE-000000005CR-0ZR3;
	Thu, 11 Dec 2025 23:40:52 +0000
Date: Fri, 12 Dec 2025 07:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 sound/soc/codecs/tas2764.c:745:19: warning: cast to smaller integer type
 'enum tas2764_devid' from 'const void *'
Message-ID: <202512120727.6JdEzjqT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3a6f5d8bb93a24a08c3bcf615b349a5d93e4a265
commit: d1f8358c5d359c0563d5cf788265a617d338cb26 [1/1] ASoC: tas2764: Extend driver to SN012776
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251212/202512120727.6JdEzjqT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120727.6JdEzjqT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120727.6JdEzjqT-lkp@intel.com/

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
