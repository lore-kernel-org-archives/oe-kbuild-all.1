Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2D018F36D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 16:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710348660; cv=none; b=OvxlMq6uHcAJSSCgElaOtsjKqY5oVHKlNkxvyAmHpCYjxTwh+511yCPyqyvFfJNcIJeGfW6qRSLAZlkiO6ASsX0+dUMnGgfkO6Slaj415ehBUPpvHPYEvoE6QRFgxeoYdhLkKdWpHpbq1yP+s6w8Vb5DzszzIkgKkKLZPGjgd18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710348660; c=relaxed/simple;
	bh=e9O79voelSr6oj/Cf19ECfUfgx1vqGNK252holjMdWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jNsOdnJgfk24dn+mCE7NyLkyxCmjz61QTNlh1UYBpXpaieqFqqTQDPhc9VXnIFupIzrJzfWn85UDjxRfeZXztvj/Ju2ifXge7v3k2nMOUdsoQicxZQXKFQ/DZX9qasJaGKhS4NUq+PXAehgJZopVwV0kDgwgYZmpPUmKdqsYKpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9tepJOo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9tepJOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710348659; x=1741884659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e9O79voelSr6oj/Cf19ECfUfgx1vqGNK252holjMdWE=;
  b=V9tepJOo9GZ7J6rCtdNEuLPNDHaRClhtzo8hPyArupEwKB+afN3rRh/n
   Qcd7PyoB3nSuVtnj5V0OakCYJavvMylgj+Qlcb+DoJ9JQPaq1eIkUBEue
   wxiYkBhL3QjXTocHBSACLnfmZrfXmn+Qu/Cg1kenyXzjcrnm/U+X7b66U
   HK38GnfcN9uY5ENjK5dyjr8MNZCu0X51RkrBJe1gv0ra+dXHPF8bfQ7KO
   ixccbZLHf6si0gPpnlGOPn64DNULfCKm4adosP5pctLb7YFptFTPTRCsT
   guT2KP5LfGTnFAgY515ru+RWorqL3E1uzUMOgOSJJBF8GKtw/WyPHubCz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="8903937"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="8903937"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 09:49:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="35117384"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Mar 2024 09:49:55 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkRnd-000CZV-1m;
	Wed, 13 Mar 2024 16:49:53 +0000
Date: Thu, 14 Mar 2024 00:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:test 1/1] drivers/mtd/maps/physmap-core.c:527:39:
 warning: format '%x' expects argument of type 'unsigned int', but argument 3
 has type 'void *'
Message-ID: <202403140017.bcnzO7ba-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git test
head:   0d7231b62906aa3562554714aa708ac0b452c0a5
commit: 0d7231b62906aa3562554714aa708ac0b452c0a5 [1/1] CFI debug code
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240314/202403140017.bcnzO7ba-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140017.bcnzO7ba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140017.bcnzO7ba-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31,
                    from drivers/mtd/chips/chipreg.c:7:
   include/linux/mtd/map.h: In function 'inline_map_write':
>> include/linux/kern_levels.h:5:25: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'void *' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   include/linux/mtd/map.h:413:9: note: in expansion of macro 'pr_info'
     413 |         pr_info("%s map->virt=%08x\n", __func__, map->virt);
         |         ^~~~~~~
--
   In file included from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/mtd/chips/cfi_probe.c:7:
   include/linux/mtd/map.h: In function 'inline_map_write':
>> include/linux/kern_levels.h:5:25: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'void *' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   include/linux/mtd/map.h:413:9: note: in expansion of macro 'pr_info'
     413 |         pr_info("%s map->virt=%08x\n", __func__, map->virt);
         |         ^~~~~~~
   drivers/mtd/chips/cfi_probe.c: In function 'cfi_probe_chip':
   include/linux/kern_levels.h:5:25: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/mtd/chips/cfi_probe.c:101:9: note: in expansion of macro 'pr_info'
     101 |         pr_info("%s: base=%08x, size=%08x\n", __func__, base, map->size);
         |         ^~~~~~~
--
   In file included from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/mtd/chips/cfi_util.c:10:
   include/linux/mtd/map.h: In function 'inline_map_write':
>> include/linux/kern_levels.h:5:25: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'void *' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   include/linux/mtd/map.h:413:9: note: in expansion of macro 'pr_info'
     413 |         pr_info("%s map->virt=%08x\n", __func__, map->virt);
         |         ^~~~~~~
   drivers/mtd/chips/cfi_util.c: In function 'cfi_build_cmd_addr':
>> include/linux/kern_levels.h:5:25: warning: format '%s' expects argument of type 'char *', but argument 2 has type 'uint32_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/mtd/chips/cfi_util.c:58:17: note: in expansion of macro 'pr_info'
      58 |                 pr_info("%s: addr %08x | (type %08x >> 1) * interleave %08x\n",
         |                 ^~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%x' expects a matching 'unsigned int' argument [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/mtd/chips/cfi_util.c:58:17: note: in expansion of macro 'pr_info'
      58 |                 pr_info("%s: addr %08x | (type %08x >> 1) * interleave %08x\n",
         |                 ^~~~~~~
   drivers/mtd/chips/cfi_util.c: In function 'cfi_send_gen_cmd':
>> include/linux/kern_levels.h:5:25: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'map_word' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/mtd/chips/cfi_util.c:222:9: note: in expansion of macro 'pr_info'
     222 |         pr_info("%s: write %08x into %08x\n", __func__, val, addr);
         |         ^~~~~~~
--
   In file included from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/mtd/maps/physmap-core.c:26:
   include/linux/mtd/map.h: In function 'inline_map_write':
>> include/linux/kern_levels.h:5:25: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'void *' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   include/linux/mtd/map.h:413:9: note: in expansion of macro 'pr_info'
     413 |         pr_info("%s map->virt=%08x\n", __func__, map->virt);
         |         ^~~~~~~
   In file included from include/linux/device.h:15,
                    from drivers/mtd/maps/physmap-core.c:31:
   drivers/mtd/maps/physmap-core.c: In function 'physmap_flash_probe':
>> drivers/mtd/maps/physmap-core.c:527:39: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'void *' [-Wformat=]
     527 |                 dev_notice(&dev->dev, "remapped to %08x-%08x\n", info->maps[i].virt,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:148:62: note: in expansion of macro 'dev_fmt'
     148 |         dev_printk_index_wrap(_dev_notice, KERN_NOTICE, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                              ^~~~~~~
   drivers/mtd/maps/physmap-core.c:527:17: note: in expansion of macro 'dev_notice'
     527 |                 dev_notice(&dev->dev, "remapped to %08x-%08x\n", info->maps[i].virt,
         |                 ^~~~~~~~~~
   drivers/mtd/maps/physmap-core.c:527:55: note: format string is defined here
     527 |                 dev_notice(&dev->dev, "remapped to %08x-%08x\n", info->maps[i].virt,
         |                                                    ~~~^
         |                                                       |
         |                                                       unsigned int
         |                                                    %08p
   drivers/mtd/maps/physmap-core.c:527:39: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'void *' [-Wformat=]
     527 |                 dev_notice(&dev->dev, "remapped to %08x-%08x\n", info->maps[i].virt,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:148:62: note: in expansion of macro 'dev_fmt'
     148 |         dev_printk_index_wrap(_dev_notice, KERN_NOTICE, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                              ^~~~~~~
   drivers/mtd/maps/physmap-core.c:527:17: note: in expansion of macro 'dev_notice'
     527 |                 dev_notice(&dev->dev, "remapped to %08x-%08x\n", info->maps[i].virt,
         |                 ^~~~~~~~~~
   drivers/mtd/maps/physmap-core.c:527:60: note: format string is defined here
     527 |                 dev_notice(&dev->dev, "remapped to %08x-%08x\n", info->maps[i].virt,
         |                                                         ~~~^
         |                                                            |
         |                                                            unsigned int
         |                                                         %08p


vim +527 drivers/mtd/maps/physmap-core.c

   445	
   446	static int physmap_flash_probe(struct platform_device *dev)
   447	{
   448		struct physmap_flash_info *info;
   449		int err = 0;
   450		int i;
   451	
   452		if (!dev->dev.of_node && !dev_get_platdata(&dev->dev))
   453			return -EINVAL;
   454	
   455		info = devm_kzalloc(&dev->dev, sizeof(*info), GFP_KERNEL);
   456		if (!info)
   457			return -ENOMEM;
   458	
   459		while (platform_get_resource(dev, IORESOURCE_MEM, info->nmaps))
   460			info->nmaps++;
   461	
   462		if (!info->nmaps)
   463			return -ENODEV;
   464	
   465		info->maps = devm_kzalloc(&dev->dev,
   466					  sizeof(*info->maps) * info->nmaps,
   467					  GFP_KERNEL);
   468		if (!info->maps)
   469			return -ENOMEM;
   470	
   471		info->mtds = devm_kzalloc(&dev->dev,
   472					  sizeof(*info->mtds) * info->nmaps,
   473					  GFP_KERNEL);
   474		if (!info->mtds)
   475			return -ENOMEM;
   476	
   477		platform_set_drvdata(dev, info);
   478	
   479		info->gpios = devm_gpiod_get_array_optional(&dev->dev, "addr",
   480							    GPIOD_OUT_LOW);
   481		if (IS_ERR(info->gpios))
   482			return PTR_ERR(info->gpios);
   483	
   484		if (info->gpios && info->nmaps > 1) {
   485			dev_err(&dev->dev, "addr-gpios only supported for nmaps == 1\n");
   486			return -EINVAL;
   487		}
   488	
   489		pm_runtime_enable(&dev->dev);
   490		pm_runtime_get_sync(&dev->dev);
   491	
   492		if (dev->dev.of_node) {
   493			pr_info("%s: call physmap_flash_of_init()\n", __func__);
   494			err = physmap_flash_of_init(dev);
   495		} else
   496			err = physmap_flash_pdata_init(dev);
   497	
   498		if (err) {
   499			pm_runtime_put(&dev->dev);
   500			pm_runtime_disable(&dev->dev);
   501			return err;
   502		}
   503	
   504		for (i = 0; i < info->nmaps; i++) {
   505			struct resource *res;
   506	
   507			info->maps[i].virt = devm_platform_get_and_ioremap_resource(dev, i, &res);
   508			if (IS_ERR(info->maps[i].virt)) {
   509				err = PTR_ERR(info->maps[i].virt);
   510				goto err_out;
   511			}
   512	
   513			dev_notice(&dev->dev, "physmap platform flash device: %pR\n",
   514				   res);
   515	
   516			if (!info->maps[i].name)
   517				info->maps[i].name = dev_name(&dev->dev);
   518	
   519			if (!info->maps[i].phys)
   520				info->maps[i].phys = res->start;
   521	
   522			info->win_order = get_bitmask_order(resource_size(res)) - 1;
   523			info->maps[i].size = BIT(info->win_order +
   524						 (info->gpios ?
   525						  info->gpios->ndescs : 0));
   526	
 > 527			dev_notice(&dev->dev, "remapped to %08x-%08x\n", info->maps[i].virt,
   528				   info->maps[i].virt + info->maps[i].size - 1);
   529	
   530			info->maps[i].map_priv_1 = (unsigned long)dev;
   531	
   532			if (info->gpios) {
   533				pr_info("%s: gpios map init\n", __func__);
   534				err = physmap_addr_gpios_map_init(&info->maps[i]);
   535				if (err)
   536					goto err_out;
   537			}
   538	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
