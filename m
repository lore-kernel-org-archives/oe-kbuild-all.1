Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EC12B9A5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 06:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754895585; cv=none; b=Sci/BXvHJoKIRgVAwl2Q+Z1SdReCNUfUr3wM/7kkcXZbMd8B9BbCPLhya7PbBVX/3nfQUkKU1CYWssEPKsoivzuGmiUrXr9SW8ydds9bj2j82q7VlPPkrwNvG/YCeQxoM8wHcVcVPFXKi6rfuM+bsKJyvhj5rVbVUU59s5MitqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754895585; c=relaxed/simple;
	bh=zW/4WhH8NpNnPAl1fUU2At299jr2RXFC8+DZkhc1GXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ooj4SfoxzNkHKEAKJREqHL+CmIFRe0zANJq97xtXS9dfg+CLi3jiBsH5tlbthTTi8a6grIwLyNvPpCKKt4tVeU7n0dV41hzPFxTOcJfVx9zeutNjSlLOKC8Fk7wmNwCOKCC+25qawpkDWP8qQVnX0JfYDEq6BQ/uSew+mCQ49QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ps9nbc0L; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ps9nbc0L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754895584; x=1786431584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zW/4WhH8NpNnPAl1fUU2At299jr2RXFC8+DZkhc1GXQ=;
  b=Ps9nbc0LC5J8pFanXApNVPOOXOGEaJOkYTOZSpt9CKPdimg27iTaffUu
   Z+OSuuLslRaXk1Y+p9w6jFAGOA0x93AnaUt43rlpSqQAY2Z6ZnZ2kA1ml
   WcsJPb+O/5w1zBVQFO/PckVzQokQ6pkyuLWYIafRalLwN8QVO0f5W3+S9
   oYVn/uJuZ9h856Euk/rTDkZtdTsa6hryACoGObvfW1Iexny+c8OC0fBEL
   49oY/+JuzOCRQsdLbizINheSMwXMgfbVpppHuvGVdw6SVICXpRjYP2DTg
   f+Zkm3xgtwtSXFJ+c75EVn/ATvNKR8GtRksBiKwHELD+8A+TjPyA+Env/
   g==;
X-CSE-ConnectionGUID: 4xH63fwMQx2MEwMgMCIb6w==
X-CSE-MsgGUID: 9lBDVpPzSH+fu8q4vebcMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="74728066"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="74728066"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 23:59:43 -0700
X-CSE-ConnectionGUID: WMoYGD3KQSGG9jXbjPP1eQ==
X-CSE-MsgGUID: Gm5VC/aOSQewGyyeipo3Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165831942"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 10 Aug 2025 23:59:43 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulMVQ-00031T-0N;
	Mon, 11 Aug 2025 06:59:40 +0000
Date: Mon, 11 Aug 2025 08:59:35 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1]
 sound/soc/codecs/tas2764.c:745:19: warning: cast to smaller integer type
 'enum tas2764_devid' from 'const void *'
Message-ID: <202508110819.VMS7zcgy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   8ff877aa637efdfd6e8bfca1f0e5565e3103a628
commit: d1f8358c5d359c0563d5cf788265a617d338cb26 [0/1] ASoC: tas2764: Extend driver to SN012776
config: x86_64-buildonly-randconfig-2001-20250811 (https://download.01.org/0day-ci/archive/20250811/202508110819.VMS7zcgy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508110819.VMS7zcgy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508110819.VMS7zcgy-lkp@intel.com/

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
