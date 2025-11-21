Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373221B042E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 03:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763696585; cv=none; b=Wv2IDQhJVzQJk71+Xpaks7g+abZPrRgvAAmW0D1gpNezIfpl8BiqQA6OT9wtBQukGW+aYbZd2gTTGvxIIfB1VhghchWcvdr+HnNjlU+5XCeai/aTNXro4fZqUa1GSzJ77Cx78NElc+6cREl9Su8p/Nv4q/UmBTPwuHNOOAh7UH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763696585; c=relaxed/simple;
	bh=SML5Og0MOLD6AjopYpCWIv+QbCfsfEcI31qve+iHlR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZOM9yDO6gV44ochDx+FrBCipngORzJc2zgLLCmuspK/ZFm3gAtPhAWgY+x1uKWxH8+hh4eVXB0ukQO4ZT4RHdvfcsqhSkvj/r56vAaDbQAoKoAB65mlXEsOgg1ganab2DOEFjfpNLDaPwXn2CYpzg01MpmyJ2paNE9Z6Am0+eZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q9Bp3rm/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q9Bp3rm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763696583; x=1795232583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SML5Og0MOLD6AjopYpCWIv+QbCfsfEcI31qve+iHlR4=;
  b=Q9Bp3rm/ySG4OGDMmYW+doxIYQ1YYNAbWDduaWjYpOERIpJAISAHGqmn
   nIOtcQqv+7y6g1QZrW9zgS68hN8hw1vMbyZJhG4sPMkLjOiNAGiuhNg6d
   SikrdZ0jJEm7QWwLrR9MTmvssJo7kn7Hi31hgu+mou6kd+6wkQt3txNkw
   cHRn9xfDLaO22ljNO2nic8nkh21F/mzs6Gsen+YRVtKJ1DJxxYlIUwfRt
   jhXIpf56LI4j3TaPslU89/myZkj9h8BpymUzjcludQezjoYiTdL4SOmZc
   YVcqR7GVkz8C/g2S5kINAYdXKlw2RRedLxUprcRXUGAuGrGgGGxmvhwjj
   A==;
X-CSE-ConnectionGUID: 4uWst/JBTt6tHGzWWnqmcg==
X-CSE-MsgGUID: bto22qVPTdi+iv4x2f4DRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="88435735"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="88435735"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 19:43:03 -0800
X-CSE-ConnectionGUID: lP08XPpbSsSdsjYKgk+43w==
X-CSE-MsgGUID: xGW7j+sFSzyCghifLl+FLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="191587453"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Nov 2025 19:43:01 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMI31-0004tn-2C;
	Fri, 21 Nov 2025 03:42:59 +0000
Date: Fri, 21 Nov 2025 11:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3297/3297]
 drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:779:41: error: invalid use of
 undefined type 'struct acpi_device'
Message-ID: <202511211110.IldThlOV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7fb5c993b2b055db83a6c5eb3cf23051f0d62b43
commit: 5d01c9ec4f3b95b0629a38d936f69bc05e494cc9 [3297/3297] pinctrl: Zhaoxin: Add KH-50000 support
config: x86_64-buildonly-randconfig-003-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211110.IldThlOV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211110.IldThlOV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211110.IldThlOV-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c: In function 'zhaoxin_gpio_set_gpio_mode_and_pull':
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:123:13: warning: variable 'value_back' set but not used [-Wunused-but-set-variable]
     123 |         u16 value_back = 0;
         |             ^~~~~~~~~~
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c: In function 'zhaoxin_gpio_get':
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:249:13: warning: variable 'pin' set but not used [-Wunused-but-set-variable]
     249 |         int pin;
         |             ^~~
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c: In function 'zhaoxin_gpio_set':
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:270:13: warning: variable 'pin' set but not used [-Wunused-but-set-variable]
     270 |         int pin;
         |             ^~~
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c: In function 'zhaoxin_gpio_irq_ack':
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:330:13: warning: variable 'base_offset' set but not used [-Wunused-but-set-variable]
     330 |         int base_offset = 0;
         |             ^~~~~~~~~~~
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c: In function 'zhaoxin_gpio_irq_mask_unmask':
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:363:13: warning: variable 'base_offset' set but not used [-Wunused-but-set-variable]
     363 |         int base_offset = 0;
         |             ^~~~~~~~~~~
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c: In function 'zhaoxin_gpio_irq_type':
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:487:13: warning: variable 'test_mask' set but not used [-Wunused-but-set-variable]
     487 |         u16 test_mask;
         |             ^~~~~~~~~
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c: In function 'zhaoxin_pinctrl_get_soc_data':
>> drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:779:41: error: invalid use of undefined type 'struct acpi_device'
     779 |                         if (!strcmp(adev->pnp.unique_id, table[i]->uid)) {
         |                                         ^~


vim +779 drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c

996e18349e58a3 leoliu-oc 2024-02-04  765  
996e18349e58a3 leoliu-oc 2024-02-04  766  const struct zhaoxin_pinctrl_soc_data *zhaoxin_pinctrl_get_soc_data(struct platform_device *pdev)
996e18349e58a3 leoliu-oc 2024-02-04  767  {
996e18349e58a3 leoliu-oc 2024-02-04  768  	const struct zhaoxin_pinctrl_soc_data *data = NULL;
996e18349e58a3 leoliu-oc 2024-02-04  769  	const struct zhaoxin_pinctrl_soc_data **table;
996e18349e58a3 leoliu-oc 2024-02-04  770  	struct acpi_device *adev;
996e18349e58a3 leoliu-oc 2024-02-04  771  	unsigned int i;
996e18349e58a3 leoliu-oc 2024-02-04  772  
996e18349e58a3 leoliu-oc 2024-02-04  773  	adev = ACPI_COMPANION(&pdev->dev);
996e18349e58a3 leoliu-oc 2024-02-04  774  	if (adev) {
996e18349e58a3 leoliu-oc 2024-02-04  775  		const void *match = device_get_match_data(&pdev->dev);
996e18349e58a3 leoliu-oc 2024-02-04  776  
996e18349e58a3 leoliu-oc 2024-02-04  777  		table = (const struct zhaoxin_pinctrl_soc_data **)match;
996e18349e58a3 leoliu-oc 2024-02-04  778  		for (i = 0; table[i]; i++) {
996e18349e58a3 leoliu-oc 2024-02-04 @779  			if (!strcmp(adev->pnp.unique_id, table[i]->uid)) {
996e18349e58a3 leoliu-oc 2024-02-04  780  				data = table[i];
996e18349e58a3 leoliu-oc 2024-02-04  781  				break;
996e18349e58a3 leoliu-oc 2024-02-04  782  			}
996e18349e58a3 leoliu-oc 2024-02-04  783  		}
996e18349e58a3 leoliu-oc 2024-02-04  784  	} else {
996e18349e58a3 leoliu-oc 2024-02-04  785  		const struct platform_device_id *id;
996e18349e58a3 leoliu-oc 2024-02-04  786  
996e18349e58a3 leoliu-oc 2024-02-04  787  		id = platform_get_device_id(pdev);
996e18349e58a3 leoliu-oc 2024-02-04  788  		if (!id)
996e18349e58a3 leoliu-oc 2024-02-04  789  			return ERR_PTR(-ENODEV);
996e18349e58a3 leoliu-oc 2024-02-04  790  
996e18349e58a3 leoliu-oc 2024-02-04  791  		table = (const struct zhaoxin_pinctrl_soc_data **)id->driver_data;
996e18349e58a3 leoliu-oc 2024-02-04  792  		data = table[pdev->id];
996e18349e58a3 leoliu-oc 2024-02-04  793  	}
996e18349e58a3 leoliu-oc 2024-02-04  794  
996e18349e58a3 leoliu-oc 2024-02-04  795  	return data ?: ERR_PTR(-ENODATA);
996e18349e58a3 leoliu-oc 2024-02-04  796  }
996e18349e58a3 leoliu-oc 2024-02-04  797  EXPORT_SYMBOL_GPL(zhaoxin_pinctrl_get_soc_data);
996e18349e58a3 leoliu-oc 2024-02-04  798  

:::::: The code at line 779 was first introduced by commit
:::::: 996e18349e58a3ace519f9c0f32f4e62fc46ec2c Add support Zhaoxin GPIO pinctrl

:::::: TO: leoliu-oc <leoliu-oc@zhaoxin.com>
:::::: CC: leoliu-oc <leoliu-oc@zhaoxin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
