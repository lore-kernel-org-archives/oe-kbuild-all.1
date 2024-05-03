Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F5A5B05E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714742977; cv=none; b=FOwZ5wvxkWOBh8IwcZX03lv0OWhxJMyalBOlOtw+SNrVtT65QlfBCZ/1anAnM1NxSwaEeILtSgWsayJ/d3NFIoB4BlFhFLiXjgeHNTq/R1ey1FlaTW6jpHSuF2DYJYqKz5Sl9MmQwKFlPsLMiUonU7Z23vAA1mvJECEfdt40QrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714742977; c=relaxed/simple;
	bh=zkPL1flifX1GeK+WKthJaBsZkLvmZA8NuIRr/1z+rDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DLJKvhadhdzqrTf+QEZyiEVdKHLswss2/XH6LQhrSEZvdOOD7IYlqm4NmR2HIa5IYCER6GLDqNcXg1gchDfPozfyc9Ey8+nAhQ8n+hEjINR4f3cNKf0TQfq7di7zT0DVV7coXC+Op6wJjC24HEk382Y7DNHfMZfVjQnZzEulanY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhKxir9z; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhKxir9z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714742975; x=1746278975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zkPL1flifX1GeK+WKthJaBsZkLvmZA8NuIRr/1z+rDo=;
  b=mhKxir9zeiYvFyf1el7vRj8USxZ+ADgVZdMLusickDFYvlWd8NrIGPgQ
   S0MbamMdrVKng//ERfoJ0C0xGB9CU7FS29rBdazKM71iWJNfcvyT6dFs6
   VjwhdhGYQ3IqP+iXJ18B7ud+iQRUoTC6GoIhlN460wiztDt+G8KstlJn7
   N9rAI/maSMyDQyuxlET+LCIvCtDEQ3ojQ8w2GSwDv3b2neibTOLX4pU0t
   /XX16o262GG46qIm8rwfuifR/SX/hj8ZsJ1gtVdN0SWGjh+GGWhSexssv
   FeqPmUDwLRz9pHZ0ZU1xFVEzsYGAsqj/+wf6ZO0SaVYHELYWvzkeLtX23
   g==;
X-CSE-ConnectionGUID: HSAnABI9QYCM6qqVIsUFqA==
X-CSE-MsgGUID: okLWKnHiRf+xg5EP6AuECg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10402537"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10402537"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:29:35 -0700
X-CSE-ConnectionGUID: ECj7B+plT4e8EA6JUx6uXQ==
X-CSE-MsgGUID: G1j5F9xXSI6/m4VmpjdWPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27857589"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 May 2024 06:29:34 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2syh-000Biy-2h;
	Fri, 03 May 2024 13:29:31 +0000
Date: Fri, 3 May 2024 21:28:50 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 531/1143]
 drivers/gpio/gpio-aspeed.c:1933:1: error: redefinition of '__inittest'
Message-ID: <202405032137.qrGWWbAk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 7392e5986bb9b125be146a6c3d12d994af58412e [531/1143] gpio: aspeed: Support the aspeed g7 gpio controller
config: arm-randconfig-003-20240503 (https://download.01.org/0day-ci/archive/20240503/202405032137.qrGWWbAk-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405032137.qrGWWbAk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032137.qrGWWbAk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-aspeed.c:1490:48: error: too few arguments to function call, expected 3, have 2
    1490 |                 return pinctrl_gpio_set_config(offset, config);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~               ^
   include/linux/pinctrl/consumer.h:36:5: note: 'pinctrl_gpio_set_config' declared here
      36 | int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
         |     ^                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      37 |                                 unsigned long config);
         |                                 ~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-aspeed.c:1933:1: error: redefinition of '__inittest'
    1933 | module_platform_driver_probe(aspeed_g7_gpio_driver, aspeed_g7_gpio_probe);
         | ^
   include/linux/platform_device.h:325:3: note: expanded from macro 'module_platform_driver_probe'
     325 | } \
         |   ^
   include/linux/module.h:131:42: note: expanded from macro '\
   module_init'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
   drivers/gpio/gpio-aspeed.c:1932:1: note: previous definition is here
    1932 | module_platform_driver_probe(aspeed_gpio_driver, aspeed_gpio_probe);
         | ^
   include/linux/platform_device.h:325:3: note: expanded from macro 'module_platform_driver_probe'
     325 | } \
         |   ^
   include/linux/module.h:131:42: note: expanded from macro '\
   module_init'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
>> drivers/gpio/gpio-aspeed.c:1933:1: error: redefinition of 'init_module'
    1933 | module_platform_driver_probe(aspeed_g7_gpio_driver, aspeed_g7_gpio_probe);
         | ^
   include/linux/platform_device.h:325:3: note: expanded from macro 'module_platform_driver_probe'
     325 | } \
         |   ^
   include/linux/module.h:133:6: note: expanded from macro '\
   module_init'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^
   drivers/gpio/gpio-aspeed.c:1932:1: note: previous definition is here
    1932 | module_platform_driver_probe(aspeed_gpio_driver, aspeed_gpio_probe);
         | ^
   include/linux/platform_device.h:325:3: note: expanded from macro 'module_platform_driver_probe'
     325 | } \
         |   ^
   include/linux/module.h:133:6: note: expanded from macro '\
   module_init'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^
>> drivers/gpio/gpio-aspeed.c:1933:1: error: redefinition of '__exittest'
    1933 | module_platform_driver_probe(aspeed_g7_gpio_driver, aspeed_g7_gpio_probe);
         | ^
   include/linux/platform_device.h:330:3: note: expanded from macro 'module_platform_driver_probe'
     330 | } \
         |   ^
   include/linux/module.h:139:42: note: expanded from macro '\
   module_exit'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^
   drivers/gpio/gpio-aspeed.c:1932:1: note: previous definition is here
    1932 | module_platform_driver_probe(aspeed_gpio_driver, aspeed_gpio_probe);
         | ^
   include/linux/platform_device.h:330:3: note: expanded from macro 'module_platform_driver_probe'
     330 | } \
         |   ^
   include/linux/module.h:139:42: note: expanded from macro '\
   module_exit'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^
>> drivers/gpio/gpio-aspeed.c:1933:1: error: redefinition of 'cleanup_module'
    1933 | module_platform_driver_probe(aspeed_g7_gpio_driver, aspeed_g7_gpio_probe);
         | ^
   include/linux/platform_device.h:330:3: note: expanded from macro 'module_platform_driver_probe'
     330 | } \
         |   ^
   include/linux/module.h:141:7: note: expanded from macro '\
   module_exit'
     141 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^
   drivers/gpio/gpio-aspeed.c:1932:1: note: previous definition is here
    1932 | module_platform_driver_probe(aspeed_gpio_driver, aspeed_gpio_probe);
         | ^
   include/linux/platform_device.h:330:3: note: expanded from macro 'module_platform_driver_probe'
     330 | } \
         |   ^
   include/linux/module.h:141:7: note: expanded from macro '\
   module_exit'
     141 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^
   5 errors generated.


vim +/__inittest +1933 drivers/gpio/gpio-aspeed.c

  1931	
  1932	module_platform_driver_probe(aspeed_gpio_driver, aspeed_gpio_probe);
> 1933	module_platform_driver_probe(aspeed_g7_gpio_driver, aspeed_g7_gpio_probe);
  1934	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
