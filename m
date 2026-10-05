Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8702F6577
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 20:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791230922; cv=none; b=lPT0vcKBlemybW+F7gbcrXbygmj6tTbFCs8FpUloEEe9k99P9uybRqtJ2m/3dGnGgP1zAZJ6OLro+Eyl8hfYftJeItpAo3JWugaMhW8zZgxeVbgrfUDfQDwnGVLuadVkQQtXcWzIHxG7Rlp8ragojb5JRb7SeXjQ5+WKvx/+gKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791230922; c=relaxed/simple;
	bh=mSQ10vsvnLZfqIJ999gZd8a6PhWkvBoXGU8LVbrJsN8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QW3aazView3+4NbVorbQkkvI3MH/LJ1e4/q1q9pD8xiz3tm3DUWIxjBBaRtVZIpyPlKshJYDLhkYmMfzW9VA4tuit1BlnbbAhuv2iU0coeo7PdCXAIroAd9tCN/meMVAAoUgGFtt5WF3OYs/AzqDZEf1V0f/uC/jQwQF8/XIW4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWSSOgRN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWSSOgRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791230919; x=1822766919;
  h=date:from:to:cc:subject:message-id;
  bh=mSQ10vsvnLZfqIJ999gZd8a6PhWkvBoXGU8LVbrJsN8=;
  b=XWSSOgRNcg5p/7SP2fFaduzfuqxfFawymwOQjy31UqZGdvA4/yD/GIiU
   rX4rEIZgrGkbfJdAs+9qlfLWQkdz8fH0BFRYz5L+zU6raplGjOr3UDATy
   82sdVv2/d6reMMXctLXNB+wbwiGaiMeNHiD57WogkFoDaqCHFJdbKNKHq
   VUaedGmfVfrCn1N14V33i4WddG59QvkODoPM2Shc62SCnxdkbJiPxZ24K
   muQ/edxHgoKDuMGTpnjDA7wFW2ta5SNQNbdGas+fC6tNrZFfnbqvpGvPe
   EEROazVPSqnK2whPEN1248NGXGAzMPg/jlBXVgOn1oPVGgMN+NqDoQHpf
   w==;
X-CSE-ConnectionGUID: p/EN2/JjSUmxJ0jF3Y9HaA==
X-CSE-MsgGUID: qNP81q+nSBGhyJlvhZDwIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="103283440"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="103283440"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 13:08:39 -0700
X-CSE-ConnectionGUID: CBR6e1ZWR6CFbRUdi5pe7g==
X-CSE-MsgGUID: pR0XvjxsSv2HB06s1IuVzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="284806550"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 05 Oct 2026 13:08:37 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDozD-000000000I3-2S3m;
	Mon, 05 Oct 2026 20:08:35 +0000
Date: Mon, 05 Oct 2026 22:07:47 +0200
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/reset/reset-rzg2l-usbphy-ctrl.c:199:undefined
 reference to `devm_pwrseq_get'
Message-ID: <202610052142.gXOJlGh3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Biju/regulator-renesas-usb-vbus-regulator-Rename-platform-device-to-rzg2l-vbus-regulator/20261002-121656
head:   e6018e531312c0a59bb0b6540141285405702707
commit: 71dd4a1d8943b8c05cc88a34b162a2eacd3aba46 reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
date:   3 days ago
config: xtensa-randconfig-r2103-20261005 (https://download.01.org/0day-ci/archive/20261005/202610052142.gXOJlGh3-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610052142.gXOJlGh3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610052142.gXOJlGh3-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   xtensa-linux-ld: drivers/reset/reset-rzg2l-usbphy-ctrl.o: in function `rzg2l_usbphy_ctrl_pwrrdy_syscon_init':
>> drivers/reset/reset-rzg2l-usbphy-ctrl.c:199:(.text+0x440): undefined reference to `devm_pwrseq_get'
>> xtensa-linux-ld: drivers/reset/reset-rzg2l-usbphy-ctrl.c:199:(.text+0x444): undefined reference to `pwrseq_enable'
   xtensa-linux-ld: drivers/reset/reset-rzg2l-usbphy-ctrl.o: in function `rzg2l_usbphy_ctrl_probe':
   drivers/reset/reset-rzg2l-usbphy-ctrl.c:248:(.text+0x53b): undefined reference to `devm_pwrseq_get'
   xtensa-linux-ld: drivers/reset/reset-rzg2l-usbphy-ctrl.o: in function `devm_reset_control_get_exclusive':
>> include/linux/reset.h:620:(.text+0x56b): undefined reference to `pwrseq_enable'


vim +199 drivers/reset/reset-rzg2l-usbphy-ctrl.c

78f2d64e484753b Claudiu Beznea 2025-10-23  167  
71dd4a1d8943b8c Biju Das       2026-10-02  168  static int rzg2l_usbphy_ctrl_pwrrdy_syscon_init(struct device *dev,
c5b7cd9adefc5c0 Claudiu Beznea 2026-01-09  169  						struct rzg2l_usbphy_ctrl_priv *priv)
78f2d64e484753b Claudiu Beznea 2025-10-23  170  {
78f2d64e484753b Claudiu Beznea 2025-10-23  171  	struct reg_field field;
78f2d64e484753b Claudiu Beznea 2025-10-23  172  	struct regmap *regmap;
78f2d64e484753b Claudiu Beznea 2025-10-23  173  	u32 args[2];
2289ccd753deeb2 Claudiu Beznea 2026-01-09  174  	int ret;
78f2d64e484753b Claudiu Beznea 2025-10-23  175  
78f2d64e484753b Claudiu Beznea 2025-10-23  176  	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
78f2d64e484753b Claudiu Beznea 2025-10-23  177  						      "renesas,sysc-pwrrdy",
78f2d64e484753b Claudiu Beznea 2025-10-23  178  						      ARRAY_SIZE(args), args);
78f2d64e484753b Claudiu Beznea 2025-10-23  179  	if (IS_ERR(regmap))
78f2d64e484753b Claudiu Beznea 2025-10-23  180  		return PTR_ERR(regmap);
78f2d64e484753b Claudiu Beznea 2025-10-23  181  
78f2d64e484753b Claudiu Beznea 2025-10-23  182  	/* Don't allow more than one bit in mask. */
78f2d64e484753b Claudiu Beznea 2025-10-23  183  	if (hweight32(args[1]) != 1)
78f2d64e484753b Claudiu Beznea 2025-10-23  184  		return -EINVAL;
78f2d64e484753b Claudiu Beznea 2025-10-23  185  
78f2d64e484753b Claudiu Beznea 2025-10-23  186  	field.reg = args[0];
78f2d64e484753b Claudiu Beznea 2025-10-23  187  	field.lsb = __ffs(args[1]);
78f2d64e484753b Claudiu Beznea 2025-10-23  188  	field.msb = __fls(args[1]);
78f2d64e484753b Claudiu Beznea 2025-10-23  189  
c5b7cd9adefc5c0 Claudiu Beznea 2026-01-09  190  	priv->pwrrdy = devm_regmap_field_alloc(dev, regmap, field);
c5b7cd9adefc5c0 Claudiu Beznea 2026-01-09  191  	if (IS_ERR(priv->pwrrdy))
c5b7cd9adefc5c0 Claudiu Beznea 2026-01-09  192  		return PTR_ERR(priv->pwrrdy);
78f2d64e484753b Claudiu Beznea 2025-10-23  193  
2289ccd753deeb2 Claudiu Beznea 2026-01-09  194  	ret = rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
2289ccd753deeb2 Claudiu Beznea 2026-01-09  195  	if (ret)
2289ccd753deeb2 Claudiu Beznea 2026-01-09  196  		return ret;
78f2d64e484753b Claudiu Beznea 2025-10-23  197  
c5b7cd9adefc5c0 Claudiu Beznea 2026-01-09  198  	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, priv->pwrrdy);
78f2d64e484753b Claudiu Beznea 2025-10-23 @199  }
78f2d64e484753b Claudiu Beznea 2025-10-23  200  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
