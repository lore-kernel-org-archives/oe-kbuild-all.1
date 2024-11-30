Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E011428F3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 07:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732952150; cv=none; b=rXrb5VkY9nO/OcAi+MJFenCOJFsaewmagAhwTzMV7/470VNPacdng9O6mKzxJxcSkLFdmM1egticqabT6lxLfTvvVZaDcgvM17QJuRijZ1kNahUXRchSwwl0zOP2u2jXTsvvL4WgviAwdNpHPnRVXXOaaVkg+v3R+TDLP3OtkgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732952150; c=relaxed/simple;
	bh=kNGgYsBYC68UerCK729SiuyoMYs8evtqO67PR7Bvd54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WMhi9Tz1emBGwNBGwmpY3NKyEg2UUj1o8qCMAIMf3d1RN7Xg6qWWhOwXoBqKXOBUJb41DxKQaz9Emrv7fK1LlakeDZ8UNDKxpXSsVHFGC+4E0tKxELd6wmlntgD1IlJoHjlO4LE6x6aQinb0T/PtClpteUIvW0u49zR6YiBByVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JY0rIdFc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JY0rIdFc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732952148; x=1764488148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kNGgYsBYC68UerCK729SiuyoMYs8evtqO67PR7Bvd54=;
  b=JY0rIdFc0HuwWPVU+cZYQf+cryTeBhh3Iczb6Zm8vgnwpEv4ii3o1Wwx
   GgSPepyoxV+ug27TpthKoIXT9ZPcn5EDkVum6iO/4nJrm2Hw4qxr9NJ55
   32LSQMUp8O8u9XZ5NEz6uT6IxzeXDcC+UnjVcCcMcEKNGqgheAsWw65rp
   bpZIaF9tOyJZlJBHJhbnSVXtNDQj8josvSjrfJwNe7/aGR2OJ+k8g+Jfk
   ZPFkGcQqxhtviPp4Dx1SByqg2G1eDT8ABJgkN1NFvOD4zFdTogDFiYjZD
   UvaUhNSLKSsuvsedNCkogkF4hOMSAoh8uEYc169GINU4826xLlyvxCuyM
   w==;
X-CSE-ConnectionGUID: KZivX5a4RSy21WMxuglaPA==
X-CSE-MsgGUID: CucxzMtqRX+7fB2KM1qfCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="32531417"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="32531417"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 23:35:47 -0800
X-CSE-ConnectionGUID: ISxdjC8ITZ+37D7F/nTO1Q==
X-CSE-MsgGUID: 0HA4bhEYTLeAYMV7LxJYzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="92517454"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Nov 2024 23:35:46 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHI11-0000B6-2y;
	Sat, 30 Nov 2024 07:35:43 +0000
Date: Sat, 30 Nov 2024 15:35:28 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.12.0-scu4-dt-overlay 24/30]
 drivers/gpio/gpiolib-of.c:1243:12: warning: assignment to 'struct
 device_node *' from 'int' makes pointer from integer without a cast
Message-ID: <202411301557.jjSMc67v-lkp@intel.com>
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
config: arc-tb10x_defconfig (https://download.01.org/0day-ci/archive/20241130/202411301557.jjSMc67v-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411301557.jjSMc67v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301557.jjSMc67v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpiolib-of.c:1191:6: error: redefinition of 'of_gpiochip_remove_dev_node'
    1191 | void of_gpiochip_remove_dev_node(struct gpio_chip *chip)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpio/gpiolib-of.c:26:
   drivers/gpio/gpiolib-of.h:50:20: note: previous definition of 'of_gpiochip_remove_dev_node' with type 'void(struct gpio_chip *)'
      50 | static inline void of_gpiochip_remove_dev_node(struct gpio_chip *chip) {};
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c: In function 'of_gpiochip_remove_dev_node':
   drivers/gpio/gpiolib-of.c:1201:9: error: implicit declaration of function 'of_changeset_revert' [-Werror=implicit-function-declaration]
    1201 |         of_changeset_revert(np->data);
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c:1202:9: error: implicit declaration of function 'of_changeset_destroy' [-Werror=implicit-function-declaration]
    1202 |         of_changeset_destroy(np->data);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c: In function 'of_gpiochip_add_properties':
   drivers/gpio/gpiolib-of.c:1217:15: error: implicit declaration of function 'of_changeset_add_prop_bool' [-Werror=implicit-function-declaration]
    1217 |         ret = of_changeset_add_prop_bool(ocs, np, "gpio-controller");
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c:1221:16: error: implicit declaration of function 'of_changeset_add_prop_u32' [-Werror=implicit-function-declaration]
    1221 |         return of_changeset_add_prop_u32(ocs, np, "#gpio-cells", 2);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c: At top level:
   drivers/gpio/gpiolib-of.c:1224:6: error: redefinition of 'of_gpiochip_make_dev_node'
    1224 | void of_gpiochip_make_dev_node(struct gpio_chip *chip)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.h:49:20: note: previous definition of 'of_gpiochip_make_dev_node' with type 'void(struct gpio_chip *)'
      49 | static inline void of_gpiochip_make_dev_node(struct gpio_chip *chip) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c: In function 'of_gpiochip_make_dev_node':
   drivers/gpio/gpiolib-of.c:1241:9: error: implicit declaration of function 'of_changeset_init' [-Werror=implicit-function-declaration]
    1241 |         of_changeset_init(cset);
         |         ^~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c:1243:14: error: implicit declaration of function 'of_changeset_create_node' [-Werror=implicit-function-declaration]
    1243 |         np = of_changeset_create_node(cset, of_root, chip->label);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpiolib-of.c:1243:12: warning: assignment to 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1243 |         np = of_changeset_create_node(cset, of_root, chip->label);
         |            ^
   drivers/gpio/gpiolib-of.c:1251:15: error: implicit declaration of function 'of_changeset_apply' [-Werror=implicit-function-declaration]
    1251 |         ret = of_changeset_apply(cset);
         |               ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1243 drivers/gpio/gpiolib-of.c

  1223	
  1224	void of_gpiochip_make_dev_node(struct gpio_chip *chip)
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
