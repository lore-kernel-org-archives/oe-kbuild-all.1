Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4599B27447
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 02:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732933808; cv=none; b=NPPpCgGNwN/UiviiZXLC7+6if1Szw7vjtkA1XJUQxeyPT7V+jbbUuhKUYIMV4s3L9CJBP/zzj8f7VGB3qqkneU+MyKSjB2n28fQp3VtPDNboqyiLArGI6YglHAlL/kcNdSiCNPB7qHx9mGFsRVThDewOjbsfBejthPetjF8x+W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732933808; c=relaxed/simple;
	bh=lK+TzXRHgRRsWqPRHMqrzFwlErxLapxQJJGtk7ALLMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WWAnechNjAjKC3V1ca7yhPdjQZDhEhOS68AK89T47z8+lcJjyZtx8Niy408INA1PGFe9aBm4oBRph6hs55mOeklUkHpV4yAve8g/bqpBUcOll+pP3FhOK9c7d9tXvMvD+n3fBCxavkLeTQg1cZhNdaTYNdL2HVHVDUvbmMC8JVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QpOheM/y; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpOheM/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732933806; x=1764469806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lK+TzXRHgRRsWqPRHMqrzFwlErxLapxQJJGtk7ALLMY=;
  b=QpOheM/y5ovp8DgpYJFyndhiCdX9yfDQadr4AYJnqzFWQti7rbZ86jfE
   BWhNjNr4PGQ+VaH5AXN3Qip9sKbLYB9DVV3AHKDCl9+f7IpDCgsbSyYji
   0k/ZNj0wkXtpHofawmyV0yWSH/Xc87tRTC1p429fxF0SWWeRA6bO/apm7
   MiQ89OXkGC/bIoPNv+UdipZVP1aaqOJg4CtfmbXOMKDUWax9Lje0o+b9/
   lGVX2LZhYrB5tZFkRBe5ou55BTQHJSOTBB/sSls2KeU7vkahZLA/PpT9c
   6U8V95iI5sv7wCeGR9Rtg8xxEtRwpbdbUDdX0eVLp/W+NfLyJgaQJsUe0
   A==;
X-CSE-ConnectionGUID: /6ZMHF71S8WI43UtVoj53A==
X-CSE-MsgGUID: QPGmiH4KTcmLfwYrrK4Vmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="58564483"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="58564483"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 18:30:05 -0800
X-CSE-ConnectionGUID: gFiFaB9STMiWmiEwFiDBLA==
X-CSE-MsgGUID: KBwJ8akoTjGZxFluBLWdUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="97380629"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Nov 2024 18:30:02 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHDEh-00001r-13;
	Sat, 30 Nov 2024 02:29:48 +0000
Date: Sat, 30 Nov 2024 10:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.12.0-scu4-dt-overlay 24/30]
 drivers/gpio/gpiolib-of.c:1191:6: error: redefinition of
 'of_gpiochip_remove_dev_node'
Message-ID: <202411301047.R1m9MUEW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.12.0-scu4-dt-overlay
head:   6a87eb702125c86f68c9c466c941b914713c8252
commit: 3003e9eae5cddbc635a165d44194a95e1d26b5be [24/30] gpio: Dynamically add OF nodes if not present
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241130/202411301047.R1m9MUEW-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411301047.R1m9MUEW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301047.R1m9MUEW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpiolib-of.c:1191:6: error: redefinition of 'of_gpiochip_remove_dev_node'
    1191 | void of_gpiochip_remove_dev_node(struct gpio_chip *chip)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpio/gpiolib-of.c:26:
   drivers/gpio/gpiolib-of.h:50:20: note: previous definition of 'of_gpiochip_remove_dev_node' with type 'void(struct gpio_chip *)'
      50 | static inline void of_gpiochip_remove_dev_node(struct gpio_chip *chip) {};
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c: In function 'of_gpiochip_remove_dev_node':
>> drivers/gpio/gpiolib-of.c:1201:9: error: implicit declaration of function 'of_changeset_revert' [-Wimplicit-function-declaration]
    1201 |         of_changeset_revert(np->data);
         |         ^~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpiolib-of.c:1202:9: error: implicit declaration of function 'of_changeset_destroy' [-Wimplicit-function-declaration]
    1202 |         of_changeset_destroy(np->data);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c: In function 'of_gpiochip_add_properties':
>> drivers/gpio/gpiolib-of.c:1217:15: error: implicit declaration of function 'of_changeset_add_prop_bool' [-Wimplicit-function-declaration]
    1217 |         ret = of_changeset_add_prop_bool(ocs, np, "gpio-controller");
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpiolib-of.c:1221:16: error: implicit declaration of function 'of_changeset_add_prop_u32' [-Wimplicit-function-declaration]
    1221 |         return of_changeset_add_prop_u32(ocs, np, "#gpio-cells", 2);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c: At top level:
>> drivers/gpio/gpiolib-of.c:1224:6: error: redefinition of 'of_gpiochip_make_dev_node'
    1224 | void of_gpiochip_make_dev_node(struct gpio_chip *chip)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.h:49:20: note: previous definition of 'of_gpiochip_make_dev_node' with type 'void(struct gpio_chip *)'
      49 | static inline void of_gpiochip_make_dev_node(struct gpio_chip *chip) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c: In function 'of_gpiochip_make_dev_node':
>> drivers/gpio/gpiolib-of.c:1241:9: error: implicit declaration of function 'of_changeset_init' [-Wimplicit-function-declaration]
    1241 |         of_changeset_init(cset);
         |         ^~~~~~~~~~~~~~~~~
>> drivers/gpio/gpiolib-of.c:1243:14: error: implicit declaration of function 'of_changeset_create_node' [-Wimplicit-function-declaration]
    1243 |         np = of_changeset_create_node(cset, of_root, chip->label);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpiolib-of.c:1243:12: error: assignment to 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1243 |         np = of_changeset_create_node(cset, of_root, chip->label);
         |            ^
>> drivers/gpio/gpiolib-of.c:1251:15: error: implicit declaration of function 'of_changeset_apply' [-Wimplicit-function-declaration]
    1251 |         ret = of_changeset_apply(cset);
         |               ^~~~~~~~~~~~~~~~~~


vim +/of_gpiochip_remove_dev_node +1191 drivers/gpio/gpiolib-of.c

  1190	
> 1191	void of_gpiochip_remove_dev_node(struct gpio_chip *chip)
  1192	{
  1193		struct device_node *np;
  1194	
  1195		np = dev_of_node(&chip->gpiodev->dev);
  1196		if (!np || !of_node_check_flag(np, OF_DYNAMIC))
  1197			return;
  1198	
  1199		chip->gpiodev->dev.of_node = NULL;
  1200	
> 1201		of_changeset_revert(np->data);
> 1202		of_changeset_destroy(np->data);
  1203		of_node_put(np);
  1204	}
  1205	
  1206	static int of_gpiochip_add_properties(struct gpio_chip *chip,
  1207					      struct of_changeset *ocs,
  1208					      struct device_node *np)
  1209	{
  1210		int ret;
  1211	
  1212		/*
  1213		 * The added properties will be released when the
  1214		 * changeset is destroyed.
  1215		 */
  1216	
> 1217		ret = of_changeset_add_prop_bool(ocs, np, "gpio-controller");
  1218		if (ret)
  1219			return ret;
  1220	
> 1221		return of_changeset_add_prop_u32(ocs, np, "#gpio-cells", 2);
  1222	}
  1223	
> 1224	void of_gpiochip_make_dev_node(struct gpio_chip *chip)
  1225	{
  1226		struct device_node *np = NULL;
  1227		struct of_changeset *cset;
  1228		int ret;
  1229	
  1230		/*
  1231		 * If there is already a device tree node linked to this device,
  1232		 * return immediately.
  1233		 */
  1234		if (chip->gpiodev->dev.of_node)
  1235			return;
  1236	
  1237		cset = kmalloc(sizeof(*cset), GFP_KERNEL);
  1238		if (!cset)
  1239		       return;
  1240	
> 1241		of_changeset_init(cset);
  1242	
> 1243		np = of_changeset_create_node(cset, of_root, chip->label);
  1244		if (!np)
  1245			goto out_destroy_cset;
  1246	
  1247		ret = of_gpiochip_add_properties(chip, cset, np);
  1248		if (ret)
  1249			goto out_free_node;
  1250	
> 1251		ret = of_changeset_apply(cset);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
