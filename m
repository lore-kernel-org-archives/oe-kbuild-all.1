Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB18C7E1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 01:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706145863; cv=none; b=eGCfwFuLUqwl2rBBC8WarKVsZ5vPmYDVSLTAD6zim/cCiBhTxDIhs1gHPXseVAuqgQkRa5TRztwWkwnn6tx9FTN+fjAc55il9QdujXF04at0WGNYua7N8rWfWHGPPLd8hs0aQGJUjedGTIq9WHBkeggnYd9mGbzzOUrL/xOGPKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706145863; c=relaxed/simple;
	bh=FQ1nB7rpxsXdB0XJ3QlOn5ePWo7JiIbvqnck1455Klg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r0AeJWTonGhMl9Kltgex0ivw3AdUqJI7VtFtw9La5pj4O2lchvXAkRDZlmS6BPOHMZYfBcG+6QiBNDMJi8o5Psb7w0UE1BiJz5OgNIUuCk6b/jdV9UJeMJ0fD3HlzkQLB/OyZd82fQmZYIQOdrOo9KGwsMSOWhHMu4UCyUXiYNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayu1ve3S; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayu1ve3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706145862; x=1737681862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FQ1nB7rpxsXdB0XJ3QlOn5ePWo7JiIbvqnck1455Klg=;
  b=ayu1ve3SNoWPyxxKODXRCVtoDUQHgcqzleX83q18MpRl/XK2NqHiXOQh
   jLoasOzy3gORnkc7jZ1fMJXJkAVyoQ0P8ZxSGk6j1/U3JXqEYrIz77SPZ
   8057jYTb6qNAgfYhHJBYzQjbqA4fTkg6691u4yxhVuw96rV5Ts0gpIFPT
   35IsuvbI6qjLfTERDO2yRmu7+/v6R6PBXGemfAt7hUy2eWlg50Ck4SXCE
   kzBDiV/kcbZARNgrDGe7VkUXfMQOZSIiZb1DUb3vl2Gf04Zh9xPEhgChE
   eXLAfsNC2iavfeZUwz8RvefhxejKEJFBi1Hd5bG1SMSEQE2YFQQ70X4sB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9136545"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9136545"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 17:24:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2237561"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Jan 2024 17:24:19 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSoTZ-0008Yz-1l;
	Thu, 25 Jan 2024 01:24:17 +0000
Date: Thu, 25 Jan 2024 09:23:17 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/gpio-reset-controller-shared-v5 11/13]
 drivers/reset/core.c:865:21: error: implicit declaration of function
 'gpio_device_get_label'; did you mean 'gpio_device_get_chip'?
Message-ID: <202401250958.YksQmnWj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/gpio-reset-controller-shared-v5
head:   67c4a68a4ab782b98c8ad267675d9ef98efd21d2
commit: d220c91423ca627a5573e2d645ddf7a6715828b2 [11/13] reset: Instantiate reset GPIO controller for shared reset-gpios
config: um-randconfig-001-20240125 (https://download.01.org/0day-ci/archive/20240125/202401250958.YksQmnWj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401250958.YksQmnWj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401250958.YksQmnWj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/reset/core.c: In function '__reset_add_reset_gpio_lookup':
>> drivers/reset/core.c:865:21: error: implicit declaration of function 'gpio_device_get_label'; did you mean 'gpio_device_get_chip'? [-Werror=implicit-function-declaration]
     865 |         label_tmp = gpio_device_get_label(gdev);
         |                     ^~~~~~~~~~~~~~~~~~~~~
         |                     gpio_device_get_chip
>> drivers/reset/core.c:865:19: warning: assignment to 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     865 |         label_tmp = gpio_device_get_label(gdev);
         |                   ^
   cc1: some warnings being treated as errors


vim +865 drivers/reset/core.c

   841	
   842	static int __reset_add_reset_gpio_lookup(int id, struct device_node *np,
   843						 unsigned int gpio,
   844						 unsigned int of_flags)
   845	{
   846		const struct fwnode_handle *fwnode = of_fwnode_handle(np);
   847		unsigned int lookup_flags;
   848		const char *label_tmp;
   849	
   850		/*
   851		 * Later we map GPIO flags between OF and Linux, however not all
   852		 * constants from include/dt-bindings/gpio/gpio.h and
   853		 * include/linux/gpio/machine.h match each other.
   854		 */
   855		if (of_flags > GPIO_ACTIVE_LOW) {
   856			pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
   857			       of_flags, gpio);
   858			return -EINVAL;
   859		}
   860	
   861		struct gpio_device *gdev __free(gpio_device_put) = gpio_device_find_by_fwnode(fwnode);
   862		if (!gdev)
   863			return -EPROBE_DEFER;
   864	
 > 865		label_tmp = gpio_device_get_label(gdev);
   866		if (!label_tmp)
   867			return -EINVAL;
   868	
   869		char *label __free(kfree) = kstrdup(label_tmp, GFP_KERNEL);
   870		if (!label)
   871			return -ENOMEM;
   872	
   873		/* Size: one lookup entry plus sentinel */
   874		struct gpiod_lookup_table *lookup __free(kfree) = kzalloc(struct_size(lookup, table, 2),
   875									  GFP_KERNEL);
   876		if (!lookup)
   877			return -ENOMEM;
   878	
   879		lookup->dev_id = kasprintf(GFP_KERNEL, "reset-gpio.%d", id);
   880		if (!lookup->dev_id)
   881			return -ENOMEM;
   882	
   883		lookup_flags = GPIO_PERSISTENT;
   884		lookup_flags |= of_flags & GPIO_ACTIVE_LOW;
   885		lookup->table[0] = GPIO_LOOKUP(no_free_ptr(label), gpio, "reset",
   886					       lookup_flags);
   887	
   888		/* Not freed on success, because it is persisent subsystem data. */
   889		gpiod_add_lookup_table(no_free_ptr(lookup));
   890	
   891		return 0;
   892	}
   893	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
