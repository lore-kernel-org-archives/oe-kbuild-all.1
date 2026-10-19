Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1A4238D54
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 02:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376553; cv=none; b=bTXreyADitAxa/Zehri2ZZFtCTezQP7t+hqgRSlDdXA/Hd0t/GSAHPoTrIz4DCQvuEjfLffn86r7GWnVNTspKF2SPOSQm/6iI8aw2ec7sN+1B5+bf+jfkVm2ILU8+HLY7AH1pGtOI6+dLz4FaCfbhkVTLzj2CkZ0u1SOo1jom9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376553; c=relaxed/simple;
	bh=rhBZst3q+4etAzkdEF6+E8ZPEr1mVWwZEvyiavsigFQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ncDeeZPqcrWeyfsXu920Qq8j7oVU4EmhWW+KLjufaVUAnGYCKfYn2Gie/cHilJN2bbNU3AXPl/DmwPOeZ4rnnFdHjCn54Jbut/Y8QqxyyYPizph8wpjphl1dCvKuLKmFCUgbhb4ZTjIDdbnqD2Jrp9vmEfYo27sBLUx5kua94O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CgO6wmUp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CgO6wmUp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792376553; x=1823912553;
  h=date:from:to:cc:subject:message-id;
  bh=rhBZst3q+4etAzkdEF6+E8ZPEr1mVWwZEvyiavsigFQ=;
  b=CgO6wmUpJIWNkzAksbj8sJ4X+uZXYEHcHLz0c/CeQakuZwhK71Q5E28X
   oRdRnF7N2+X/32gmdIPieXvssJSj/jQ5frcOJpKOJtypCtU5+7ysgcyeV
   CTYULkJ0cjFJBCfNZ87CbPIg/0szkvTnAr0BfrL8jRuPjJmc7Djfo4quF
   JhTp3CE+sWcTHC2E2GdTs8VO354eaDF6B35oTobI1QcoWV3Zh/9q7v5rc
   0xFNlgY34mMKpC6OAoCiHk0CFhjJBPHrANzK0N6Kx1xUG/7pJvtOyZWRC
   64ShZdwegqQF40d3vLiJ9W/fg2btNXV1USRSiX2/yw7REP6I94/0VJeK8
   g==;
X-CSE-ConnectionGUID: igAUHyaKRi6n0mIAApCJkQ==
X-CSE-MsgGUID: AfxKxyimQJ6BIlByRwYRuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="925921"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="925921"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 19:22:32 -0700
X-CSE-ConnectionGUID: /eViuyfbQsaUEChV3ykn7Q==
X-CSE-MsgGUID: //W7CfEkTKuSBxpeIo5Juw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2842621"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 18 Oct 2026 19:22:30 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xId1A-000000005R5-11s1;
	Mon, 19 Oct 2026 02:22:28 +0000
Date: Mon, 19 Oct 2026 04:21:41 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-09 0/2]
 sound/soc/codecs/tas2764.c:745:19: warning: cast to smaller integer type
 'enum tas2764_devid' from 'const void *'
Message-ID: <202610190412.m4YF0hsv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Martin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-09
head:   9257cac5f5440a3f5492477d5ac82dd722703da9
commit: d1f8358c5d359c0563d5cf788265a617d338cb26 [0/2] ASoC: tas2764: Extend driver to SN012776
config: x86_64-randconfig-2100-20261018 (https://download.01.org/0day-ci/archive/20261019/202610190412.m4YF0hsv-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190412.m4YF0hsv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190412.m4YF0hsv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> sound/soc/codecs/tas2764.c:745:19: warning: cast to smaller integer type 'enum tas2764_devid' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     745 |         tas2764->devid = (enum tas2764_devid)of_device_get_match_data(&client->dev);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


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
