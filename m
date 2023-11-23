Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441AE8BFC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Nov 2023 03:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvENcO2O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700709439; x=1732245439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xk7K/t49UcCQ2lkViGSfs0l4DKpmdigHKOJ2fuZnWOo=;
  b=bvENcO2OpDrYqN3X+7qnHmCdwGxM3YCoEqq83tbQ9EgpIVRyMI1ddTMV
   XNovGLELoCr+tdmNQxf+h2ZoeAJaeu/kWHOqPFuR7/E8jQBfts2ZzkTj1
   SGuZI5W1uYkqGN+X4wxjD+Twwsb8pKb5P853gl6WypPG/KdE8OWo31qqt
   BpSOrY9pNjSPgR58ssA5DZ79Z4k/wBhHMDKG2YDGtTc6zH/Q3bn5XPlRe
   ldgVdARfYjE1PxKByDb6k2ouJ69YhWEP9mzmLq4uwqFiM4antJqKDGz1X
   j+17+xJ+Kz5Qv6fS/HKt1Hb6rDiAEGQKUYZj8rL+0VamDENF7kCP9nDHb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="372348533"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="372348533"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 19:17:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="8521853"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Nov 2023 19:17:15 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r60DH-0001Ae-39;
	Thu, 23 Nov 2023 03:17:11 +0000
Date: Thu, 23 Nov 2023 11:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-dango 7044/7095]
 drivers/block/fitblk.c:400:19: warning: comparison of distinct pointer types
 ('typeof (bytes_left) *' (aka 'unsigned int *') and 'typeof
 (folio_size(folio) - ((unsigned long)(0) & (folio_size(folio) - 1))) *' (aka
 'unsigned long *'))
Message-ID: <202311231021.p3FAJFWx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-dango
head:   c3f5b3f22933d3fdfdaced4da77348154240d88b
commit: 14d32a797cdfdc739acb14b0efab9f1c3c1ea478 [7044/7095] block: add uImage.FIT subimage block driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20231123/202311231021.p3FAJFWx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311231021.p3FAJFWx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311231021.p3FAJFWx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/block/fitblk.c:24:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/block/fitblk.c:24:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/block/fitblk.c:24:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/block/fitblk.c:400:19: warning: comparison of distinct pointer types ('typeof (bytes_left) *' (aka 'unsigned int *') and 'typeof (folio_size(folio) - ((unsigned long)(0) & (folio_size(folio) - 1))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
     400 |                 bytes_to_copy = min(bytes_left, folio_size(folio) - offset_in_folio(folio, 0));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:70:19: note: expanded from macro 'min'
      70 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:24: note: expanded from macro '__careful_cmp'
      39 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:29:4: note: expanded from macro '__safe_cmp'
      29 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:23:28: note: expanded from macro '__typecheck'
      23 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
>> drivers/block/fitblk.c:485:6: warning: variable 'found' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     485 |         if (images < 0) {
         |             ^~~~~~~~~~
   drivers/block/fitblk.c:590:7: note: uninitialized use occurs here
     590 |         if (!found || ret)
         |              ^~~~~
   drivers/block/fitblk.c:485:2: note: remove the 'if' if its condition is always false
     485 |         if (images < 0) {
         |         ^~~~~~~~~~~~~~~~~
     486 |                 pr_err("FIT: Cannot find %s node: %d\n", FIT_IMAGES_PATH, images);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     487 |                 ret = -EINVAL;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     488 |                 goto out_bootconf;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     489 |         }
         | ~~~~~~~~~
   drivers/block/fitblk.c:476:6: warning: variable 'found' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     476 |         if (!config_loadables || !config_loadables_len) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/fitblk.c:590:7: note: uninitialized use occurs here
     590 |         if (!found || ret)
         |              ^~~~~
   drivers/block/fitblk.c:476:2: note: remove the 'if' if its condition is always false
     476 |         if (!config_loadables || !config_loadables_len) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     477 |                 pr_err("FIT: No loadables configured in \"%s\"\n",
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     478 |                         bootconf ?: config_default);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     479 |                 ret = -ENOENT;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     480 |                 goto out_bootconf;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     481 |         }
         | ~~~~~~~~~
>> drivers/block/fitblk.c:476:6: warning: variable 'found' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     476 |         if (!config_loadables || !config_loadables_len) {
         |             ^~~~~~~~~~~~~~~~~
   drivers/block/fitblk.c:590:7: note: uninitialized use occurs here
     590 |         if (!found || ret)
         |              ^~~~~
   drivers/block/fitblk.c:476:6: note: remove the '||' if its condition is always false
     476 |         if (!config_loadables || !config_loadables_len) {
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/block/fitblk.c:452:6: warning: variable 'found' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     452 |         if (node < 0) {
         |             ^~~~~~~~
   drivers/block/fitblk.c:590:7: note: uninitialized use occurs here
     590 |         if (!found || ret)
         |              ^~~~~
   drivers/block/fitblk.c:452:2: note: remove the 'if' if its condition is always false
     452 |         if (node < 0) {
         |         ^~~~~~~~~~~~~~~
     453 |                 pr_err("FIT: Cannot find %s node: %d\n",
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     454 |                         bootconf ?: config_default, node);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     455 |                 ret = -ENOENT;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     456 |                 goto out_bootconf;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     457 |         }
         | ~~~~~~~~~
   drivers/block/fitblk.c:444:6: warning: variable 'found' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     444 |         if (!config_default && !bootconf) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/fitblk.c:590:7: note: uninitialized use occurs here
     590 |         if (!found || ret)
         |              ^~~~~
   drivers/block/fitblk.c:444:2: note: remove the 'if' if its condition is always false
     444 |         if (!config_default && !bootconf) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     445 |                 pr_err("FIT: Cannot find default configuration\n");
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     446 |                 ret = -ENOENT;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     447 |                 goto out_bootconf;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     448 |         }
         | ~~~~~~~~~
   drivers/block/fitblk.c:432:6: warning: variable 'found' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     432 |         if (config < 0) {
         |             ^~~~~~~~~~
   drivers/block/fitblk.c:590:7: note: uninitialized use occurs here
     590 |         if (!found || ret)
         |              ^~~~~
   drivers/block/fitblk.c:432:2: note: remove the 'if' if its condition is always false
     432 |         if (config < 0) {
         |         ^~~~~~~~~~~~~~~~~
     433 |                 pr_err("FIT: Cannot find %s node: %d\n",
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     434 |                         FIT_CONFS_PATH, config);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     435 |                 ret = -ENOENT;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     436 |                 goto out_bootconf;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     437 |         }
         | ~~~~~~~~~
   drivers/block/fitblk.c:407:8: warning: variable 'found' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     407 |                         if (IS_ERR(folio)) {
         |                             ^~~~~~~~~~~~~
   drivers/block/fitblk.c:590:7: note: uninitialized use occurs here
     590 |         if (!found || ret)
         |              ^~~~~
   drivers/block/fitblk.c:407:4: note: remove the 'if' if its condition is always false
     407 |                         if (IS_ERR(folio)) {
         |                         ^~~~~~~~~~~~~~~~~~~~
     408 |                                 ret = PTR_ERR(folio);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     409 |                                 goto out_blkdev;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     410 |                         };
         | ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/fitblk.c:391:6: warning: variable 'found' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     391 |         if (!fit) {
         |             ^~~~
   drivers/block/fitblk.c:590:7: note: uninitialized use occurs here
     590 |         if (!found || ret)
         |              ^~~~~
   drivers/block/fitblk.c:391:2: note: remove the 'if' if its condition is always false
     391 |         if (!fit) {
         |         ^~~~~~~~~~~
     392 |                 ret = -ENOMEM;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     393 |                 folio_put(folio);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     394 |                 goto out_blkdev;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     395 |         }
         | ~~~~~~~~~
   drivers/block/fitblk.c:384:6: warning: variable 'found' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     384 |         if (size >= dsize) {
         |             ^~~~~~~~~~~~~
   drivers/block/fitblk.c:590:7: note: uninitialized use occurs here
     590 |         if (!found || ret)


vim +400 drivers/block/fitblk.c

   318	
   319	static int parse_fit_on_dev(struct device *dev)
   320	{
   321		struct block_device *bdev;
   322		struct address_space *mapping;
   323		struct folio *folio;
   324		pgoff_t f_index = 0;
   325		size_t bytes_left, bytes_to_copy;
   326		void *pre_fit, *fit, *fit_c;
   327		u64 dsize, dsectors, imgmaxsect = 0;
   328		u32 size, image_pos, image_len;
   329		const __be32 *image_offset_be, *image_len_be, *image_pos_be;
   330		int ret = 0, node, images, config;
   331		const char *image_name, *image_type, *image_description,
   332			*config_default, *config_description, *config_loadables;
   333		u32 image_name_len, image_type_len, image_description_len,
   334			bootconf_len, config_default_len, config_description_len,
   335			config_loadables_len;
   336		sector_t start_sect, nr_sects;
   337		struct device_node *np = NULL;
   338		const char *bootconf_c;
   339		const char *loadable;
   340		char *bootconf = NULL, *bootconf_term;
   341		bool found;
   342		int loadables_rem_len, loadable_len;
   343		u16 loadcnt;
   344		unsigned int slot = 0;
   345	
   346		/* Exclusive open the block device to receive holder notifications */
   347		bdev = blkdev_get_by_dev(dev->devt, FMODE_READ, &_fitblk_claim_ptr, &fitblk_hops);
   348		if (!bdev)
   349			return -ENODEV;
   350	
   351		if (IS_ERR(bdev))
   352			return PTR_ERR(bdev);
   353	
   354		mapping = bdev->bd_inode->i_mapping;
   355	
   356		/* map first page */
   357		folio = read_mapping_folio(mapping, f_index++, NULL);
   358		if (IS_ERR(folio)) {
   359			ret = PTR_ERR(folio);
   360			goto out_blkdev;
   361		}
   362		pre_fit = folio_address(folio) + offset_in_folio(folio, 0);
   363	
   364		/* uImage.FIT is based on flattened device tree structure */
   365		if (fdt_check_header(pre_fit)) {
   366			ret = -EINVAL;
   367			folio_put(folio);
   368			goto out_blkdev;
   369		}
   370	
   371		size = fdt_totalsize(pre_fit);
   372	
   373		if (size > PAGE_SIZE * FIT_MAX_PAGES) {
   374			ret = -EOPNOTSUPP;
   375			folio_put(folio);
   376			goto out_blkdev;
   377		}
   378	
   379		/* acquire disk size */
   380		dsectors = bdev_nr_sectors(bdev);
   381		dsize = dsectors << SECTOR_SHIFT;
   382	
   383		/* abort if FIT structure is larger than disk or partition size */
   384		if (size >= dsize) {
   385			ret = -EFBIG;
   386			folio_put(folio);
   387			goto out_blkdev;
   388		}
   389	
   390		fit = kmalloc(size, GFP_KERNEL);
   391		if (!fit) {
   392			ret = -ENOMEM;
   393			folio_put(folio);
   394			goto out_blkdev;
   395		}
   396	
   397		bytes_left = size;
   398		fit_c = fit;
   399		while (bytes_left > 0) {
 > 400			bytes_to_copy = min(bytes_left, folio_size(folio) - offset_in_folio(folio, 0));
   401			memcpy(fit_c, pre_fit, bytes_to_copy);
   402			fit_c += bytes_to_copy;
   403			bytes_left -= bytes_to_copy;
   404			if (bytes_left) {
   405				folio_put(folio);
   406				folio = read_mapping_folio(mapping, f_index++, NULL);
   407				if (IS_ERR(folio)) {
   408					ret = PTR_ERR(folio);
   409					goto out_blkdev;
   410				};
   411				pre_fit = folio_address(folio) + offset_in_folio(folio, 0);
   412			}
   413		}
   414		folio_put(folio);
   415	
   416		/* set boot config node name U-Boot may have added to the device tree */
   417		np = of_find_node_by_path("/chosen");
   418		if (np) {
   419			bootconf_c = of_get_property(np, "u-boot,bootconf", &bootconf_len);
   420			if (bootconf_c && bootconf_len)
   421				bootconf = kmemdup_nul(bootconf_c, bootconf_len, GFP_KERNEL);
   422		}
   423	
   424		if (bootconf) {
   425			bootconf_term = strchr(bootconf, '#');
   426			if (bootconf_term)
   427				*bootconf_term = '\0';
   428		}
   429	
   430		/* find configuration path in uImage.FIT */
   431		config = fdt_path_offset(fit, FIT_CONFS_PATH);
   432		if (config < 0) {
   433			pr_err("FIT: Cannot find %s node: %d\n",
   434				FIT_CONFS_PATH, config);
   435			ret = -ENOENT;
   436			goto out_bootconf;
   437		}
   438	
   439		/* get default configuration node name */
   440		config_default =
   441			fdt_getprop(fit, config, FIT_DEFAULT_PROP, &config_default_len);
   442	
   443		/* make sure we got either default or selected boot config node name */
   444		if (!config_default && !bootconf) {
   445			pr_err("FIT: Cannot find default configuration\n");
   446			ret = -ENOENT;
   447			goto out_bootconf;
   448		}
   449	
   450		/* find selected boot config node, fallback on default config node */
   451		node = fdt_subnode_offset(fit, config, bootconf ?: config_default);
   452		if (node < 0) {
   453			pr_err("FIT: Cannot find %s node: %d\n",
   454				bootconf ?: config_default, node);
   455			ret = -ENOENT;
   456			goto out_bootconf;
   457		}
   458	
   459		pr_info("FIT: Detected U-Boot %s\n", ubootver);
   460	
   461		/* get selected configuration data */
   462		config_description =
   463			fdt_getprop(fit, node, FIT_DESC_PROP, &config_description_len);
   464		config_loadables = fdt_getprop(fit, node, FIT_LOADABLE_PROP,
   465					       &config_loadables_len);
   466	
   467		pr_info("FIT: %s configuration: \"%.*s\"%s%.*s%s\n",
   468			bootconf ? "Selected" : "Default",
   469			bootconf ? bootconf_len : config_default_len,
   470			bootconf ?: config_default,
   471			config_description ? " (" : "",
   472			config_description ? config_description_len : 0,
   473			config_description ?: "",
   474			config_description ? ")" : "");
   475	
 > 476		if (!config_loadables || !config_loadables_len) {
   477			pr_err("FIT: No loadables configured in \"%s\"\n",
   478				bootconf ?: config_default);
   479			ret = -ENOENT;
   480			goto out_bootconf;
   481		}
   482	
   483		/* get images path in uImage.FIT */
   484		images = fdt_path_offset(fit, FIT_IMAGES_PATH);
 > 485		if (images < 0) {
   486			pr_err("FIT: Cannot find %s node: %d\n", FIT_IMAGES_PATH, images);
   487			ret = -EINVAL;
   488			goto out_bootconf;
   489		}
   490	
   491		/* iterate over images in uImage.FIT */
   492		fdt_for_each_subnode(node, fit, images) {
   493			image_name = fdt_get_name(fit, node, &image_name_len);
   494			image_type = fdt_getprop(fit, node, FIT_TYPE_PROP, &image_type_len);
   495			image_offset_be = fdt_getprop(fit, node, FIT_DATA_OFFSET_PROP, NULL);
   496			image_pos_be = fdt_getprop(fit, node, FIT_DATA_POSITION_PROP, NULL);
   497			image_len_be = fdt_getprop(fit, node, FIT_DATA_SIZE_PROP, NULL);
   498	
   499			if (!image_name || !image_type || !image_len_be ||
   500			    !image_name_len || !image_type_len)
   501				continue;
   502	
   503			image_len = be32_to_cpu(*image_len_be);
   504			if (!image_len)
   505				continue;
   506	
   507			if (image_offset_be)
   508				image_pos = be32_to_cpu(*image_offset_be) + size;
   509			else if (image_pos_be)
   510				image_pos = be32_to_cpu(*image_pos_be);
   511			else
   512				continue;
   513	
   514			image_description = fdt_getprop(fit, node, FIT_DESC_PROP,
   515							&image_description_len);
   516	
   517			pr_info("FIT: %16s sub-image 0x%08x..0x%08x \"%.*s\"%s%.*s%s\n",
   518				image_type, image_pos, image_pos + image_len - 1,
   519				image_name_len, image_name, image_description ? " (" : "",
   520				image_description ? image_description_len : 0,
   521				image_description ?: "", image_description ? ") " : "");
   522	
   523			/* only 'filesystem' images should be mapped as partitions */
   524			if (strncmp(image_type, FIT_FILESYSTEM_PROP, image_type_len))
   525				continue;
   526	
   527			/* check if sub-image is part of configured loadables */
   528			found = false;
   529			loadable = config_loadables;
   530			loadables_rem_len = config_loadables_len;
   531			for (loadcnt = 0; loadables_rem_len > 1 &&
   532					  loadcnt < MAX_FIT_LOADABLES; ++loadcnt) {
   533				loadable_len =
   534					strnlen(loadable, loadables_rem_len - 1) + 1;
   535				loadables_rem_len -= loadable_len;
   536				if (!strncmp(image_name, loadable, loadable_len)) {
   537					found = true;
   538					break;
   539				}
   540				loadable += loadable_len;
   541			}
   542			if (!found)
   543				continue;
   544	
   545			if (image_pos % (1 << PAGE_SHIFT)) {
   546				dev_err(dev, "FIT: image %.*s start not aligned to page boundaries, skipping\n",
   547					image_name_len, image_name);
   548				continue;
   549			}
   550	
   551			if (image_len % (1 << PAGE_SHIFT)) {
   552				dev_err(dev, "FIT: sub-image %.*s end not aligned to page boundaries, skipping\n",
   553					image_name_len, image_name);
   554				continue;
   555			}
   556	
   557			start_sect = image_pos >> SECTOR_SHIFT;
   558			nr_sects = image_len >> SECTOR_SHIFT;
   559			imgmaxsect = max_t(sector_t, imgmaxsect, start_sect + nr_sects);
   560	
   561			if (start_sect + nr_sects > dsectors) {
   562				dev_err(dev, "FIT: sub-image %.*s disk access beyond EOD\n",
   563					image_name_len, image_name);
   564				continue;
   565			}
   566	
   567			add_fit_subimage_device(bdev, slot++, start_sect, nr_sects, true);
   568		}
   569	
   570		if (!found)
   571			goto out_bootconf;
   572	
   573		if (slot)
   574			dev_info(dev, "mapped %u uImage.FIT filesystem sub-image%s as /dev/fit%s%u%s\n",
   575				 slot, (slot > 1)?"s":"", (slot > 1)?"[0...":"", slot - 1,
   576				 (slot > 1)?"]":"");
   577	
   578		/* in case uImage.FIT is stored in a partition, map the remaining space */
   579		if (!bdev->bd_read_only && bdev_is_partition(bdev) &&
   580		    (imgmaxsect + MIN_FREE_SECT) < dsectors) {
   581			add_fit_subimage_device(bdev, slot++, imgmaxsect,
   582						dsectors - imgmaxsect, false);
   583			dev_info(dev, "mapped remaing space as /dev/fitrw\n");
   584		}
   585	
   586	out_bootconf:
   587		kfree(bootconf);
   588		kfree(fit);
   589	out_blkdev:
   590		if (!found || ret)
   591			blkdev_put(bdev, &_fitblk_claim_ptr);
   592	
   593		return ret;
   594	}
   595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
