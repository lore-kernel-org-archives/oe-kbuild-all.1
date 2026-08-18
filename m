Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6CB36A03A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 04:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787026472; cv=none; b=YTCefX5oLhuXmr3VSNuCzw6LQEc7dtjMUQ3wKNzzsC137COybt6x3QwpItGpRD4c9dP+7GtI1Baof4ME+bylf+NVLmuCe1hyODIkfRc/bSRJ3sxhqWyAR0XeUjpwq9jgYSo1JoWzf/vX9fkWSqIA1VS1qOAeMeB8hSyZ2EMzsjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787026472; c=relaxed/simple;
	bh=A9K5UVNRK65wUQoVxBO2w+uY+7241BWUFdn5G49wz6w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qdnQbtFseImAradwyE2Mm4ZLmkRiBjkgVUrbpg7NYn+l5f9fpy5g8fXh2cBhNyXdXSZzudshMocr831gAJDlrVDZ5eJzhL97Hkowg4lyzORQGztNZwOBF6LV3k9klqCisd+UYpPmWsfvwjQ9AzLCAFpBm0nXOARORbWM+Pe9xVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zqzutyr9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zqzutyr9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787026471; x=1818562471;
  h=date:from:to:cc:subject:message-id;
  bh=A9K5UVNRK65wUQoVxBO2w+uY+7241BWUFdn5G49wz6w=;
  b=Zqzutyr9Ah7fkTGGbxCl1DvNDIRDKTQlX9QlNmPFaxXCipayWx/l1911
   1peVsCCga4N1BxDpAeKGOitS5O7+0sg3LFlidS7aFFwr8vMoV4/xaWZNm
   rYpJ/dRrAwB7rcddPlRawjxH3tj9MqRrqhukHq5ZmQbwSVbIEBu60RME6
   1ZyCATzWWWoHHlApfEQCBnwzHTeSSKdv/QBiOnOMfq21Ktez8wmGvQFab
   Pa0WgIFlxMBdjjOSQsPfaRQQhQPFAOgzBAdAbaYpKyayjZJDa7j8NhTty
   ZXydNr27Spf61fdfIVpzKm8PyLLlcbfNeiT2aniAP8rai24LGT+2COrZp
   Q==;
X-CSE-ConnectionGUID: EX6uQBZaQ3WtqZW3NjkkpA==
X-CSE-MsgGUID: tcGfTkxKSyuX1BICRD8etA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="110293221"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="110293221"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 21:14:31 -0700
X-CSE-ConnectionGUID: 3O0VjNlgTMeq51WH1Cuxjw==
X-CSE-MsgGUID: IXGBxBQdQsuwuEsbv/Y0oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="263367012"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Aug 2026 21:14:29 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwBDW-00000000e60-4B78;
	Tue, 18 Aug 2026 04:14:26 +0000
Date: Tue, 18 Aug 2026 12:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 171/217] drivers/mfd/tc3589x.c:335:24:
 error: returning 'void *' from a function with return type 'int' makes
 integer from pointer without a cast
Message-ID: <202608181210.YG2HmdEf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 9220687cca8bad538843ff5a1a062b10e008e238 [171/217] mfd: tc3589x: remove pdata based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260818/202608181210.YG2HmdEf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181210.YG2HmdEf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181210.YG2HmdEf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/tc3589x.c: In function 'tc3589x_of_probe':
>> drivers/mfd/tc3589x.c:335:24: error: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     335 |                 return ERR_PTR(-ENODEV);
         |                        ^~~~~~~~~~~~~~~~
   drivers/mfd/tc3589x.c: In function 'tc3589x_probe':
   drivers/mfd/tc3589x.c:351:37: warning: unused variable 'id' [-Wunused-variable]
     351 |         const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
         |                                     ^~


vim +335 drivers/mfd/tc3589x.c

a381b13e2aa064 Linus Walleij       2014-01-23  324  
9220687cca8bad Arnd Bergmann       2026-08-07  325  static int
9220687cca8bad Arnd Bergmann       2026-08-07  326  tc3589x_of_probe(struct device *dev, enum tc3589x_version *version,
9220687cca8bad Arnd Bergmann       2026-08-07  327  		 unsigned int *block)
a435ae1d51e2f1 Lee Jones           2012-09-07  328  {
a381b13e2aa064 Linus Walleij       2014-01-23  329  	struct device_node *np = dev->of_node;
a435ae1d51e2f1 Lee Jones           2012-09-07  330  	struct device_node *child;
a381b13e2aa064 Linus Walleij       2014-01-23  331  	const struct of_device_id *of_id;
a381b13e2aa064 Linus Walleij       2014-01-23  332  
a381b13e2aa064 Linus Walleij       2014-01-23  333  	of_id = of_match_device(tc3589x_match, dev);
a381b13e2aa064 Linus Walleij       2014-01-23  334  	if (!of_id)
a381b13e2aa064 Linus Walleij       2014-01-23 @335  		return ERR_PTR(-ENODEV);
a2ce000265b780 Krzysztof Kozlowski 2023-08-10  336  	*version = (uintptr_t) of_id->data;
a435ae1d51e2f1 Lee Jones           2012-09-07  337  
9220687cca8bad Arnd Bergmann       2026-08-07  338  	*block = 0;
a435ae1d51e2f1 Lee Jones           2012-09-07  339  	for_each_child_of_node(np, child) {
a381b13e2aa064 Linus Walleij       2014-01-23  340  		if (of_device_is_compatible(child, "toshiba,tc3589x-gpio"))
9220687cca8bad Arnd Bergmann       2026-08-07  341  			*block |= TC3589x_BLOCK_GPIO;
a381b13e2aa064 Linus Walleij       2014-01-23  342  		if (of_device_is_compatible(child, "toshiba,tc3589x-keypad"))
9220687cca8bad Arnd Bergmann       2026-08-07  343  			*block |= TC3589x_BLOCK_KEYPAD;
a435ae1d51e2f1 Lee Jones           2012-09-07  344  	}
a435ae1d51e2f1 Lee Jones           2012-09-07  345  
9220687cca8bad Arnd Bergmann       2026-08-07  346  	return 0;
a381b13e2aa064 Linus Walleij       2014-01-23  347  }
a435ae1d51e2f1 Lee Jones           2012-09-07  348  

:::::: The code at line 335 was first introduced by commit
:::::: a381b13e2aa064122325de9deaec51d6e4765ad7 mfd: tc3589x: Reform device tree probing

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Lee Jones <lee.jones@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
