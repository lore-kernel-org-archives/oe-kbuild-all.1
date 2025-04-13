Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E084E17C98
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Apr 2025 04:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744518885; cv=none; b=R9T0ulq7NW7pvOYUplkOViepBk7kPI8sHb8wjnSkkimYdVdoaZ56WeINuT9csnBmiwfZ1uh4mv3I0JM0ek4IIZJenFPE/g7L0yR5zxNIRbfusUk4bURSOduSJ9cnGbXR9R8/VoHRMRU8tMIhFG9FzSBWyI9tYsSOa0U2QWpwEPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744518885; c=relaxed/simple;
	bh=+YLHUq7qOtVzQyvUF4CsuM80iuX6VgHrrIaQ8WimL3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YgouAFMvdMIEGaHxlmZGJpxveVfi8+xTceDtJ0Wdk6fJIx9u4SQVRuR+ozUa7gwI4hlEAl7Ds5MgZYQP+02YgZ6xdPrGyAOz3YzHMTcuH4j96umlO4h0OmlCxw6vObtqWOLnnKw04gmeeKpSc6DanooLwtsu33Q+ndI2EeXC1qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SHZubhUb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHZubhUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744518883; x=1776054883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+YLHUq7qOtVzQyvUF4CsuM80iuX6VgHrrIaQ8WimL3c=;
  b=SHZubhUbZfoW/h0JlVNgh0lYsSjcyHhx2u5sEQhc0SKA6ref5gHVWaZw
   6x3V/3flwexeYemVRF4VPpCk070mfXhKofHlh4Els18Xr68rZxXq0jyS6
   m3lr9SBh7vbhJHpVA6FoqttRfbCSOw2VB/TT7Yo2LQJf3MYOecdUGp4qH
   mLDR2ISaBSZtAh+PWCtpslELq/4Bdl2wWsBtkuzQND+tELPxsIlayVKne
   Ik3bBVNorb7vpEXOk53bGpVQdzFRNR2yX2LDoVun494vZTlsPUUNeSBt4
   YykrV9uNu54ofJqY0U52jyixm5hn4pr7s8CnbGEkTDrzwNQs7s/GG4uhB
   Q==;
X-CSE-ConnectionGUID: MD/04GuJQKyPadVWGno1ZQ==
X-CSE-MsgGUID: twB+hvvESs2E+QU791hTyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46109414"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="46109414"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 21:34:41 -0700
X-CSE-ConnectionGUID: OGcBVOC6QMuzuGHnTaemhw==
X-CSE-MsgGUID: 1np9wM9WQtmVokM5/fedYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="160495149"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Apr 2025 21:34:40 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3p3G-000CNW-0k;
	Sun, 13 Apr 2025 04:34:38 +0000
Date: Sun, 13 Apr 2025 12:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-next-wip 6647/6651]
 drivers/block/fitblk.c:482:6: warning: variable 'found' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202504131223.RMMNx8Gb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.14-next-wip
head:   c47e22e7e204c4e69cb6eeeb8588809af178bc8c
commit: 0368350d581f93b7044be1be6fb1b8e57b767a19 [6647/6651] block: add uImage.FIT subimage block driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250413/202504131223.RMMNx8Gb-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504131223.RMMNx8Gb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504131223.RMMNx8Gb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/fitblk.c:482:6: warning: variable 'found' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     482 |         if (images < 0) {
         |             ^~~~~~~~~~
   drivers/block/fitblk.c:594:7: note: uninitialized use occurs here
     594 |         if (!found || ret)
         |              ^~~~~
   drivers/block/fitblk.c:482:2: note: remove the 'if' if its condition is always false
     482 |         if (images < 0) {
         |         ^~~~~~~~~~~~~~~~~
     483 |                 pr_err("FIT: Cannot find %s node: %d\n", FIT_IMAGES_PATH, images);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     484 |                 ret = -EINVAL;
         |                 ~~~~~~~~~~~~~~
     485 |                 goto out_bootconf;
         |                 ~~~~~~~~~~~~~~~~~~
     486 |         }
         |         ~
   drivers/block/fitblk.c:473:6: warning: variable 'found' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     473 |         if (!config_loadables || !config_loadables_len) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/fitblk.c:594:7: note: uninitialized use occurs here
     594 |         if (!found || ret)
         |              ^~~~~
   drivers/block/fitblk.c:473:2: note: remove the 'if' if its condition is always false
     473 |         if (!config_loadables || !config_loadables_len) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     474 |                 pr_err("FIT: No loadables configured in \"%s\"\n",
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     475 |                         bootconf ?: config_default);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     476 |                 ret = -ENOENT;
         |                 ~~~~~~~~~~~~~~
     477 |                 goto out_bootconf;
         |                 ~~~~~~~~~~~~~~~~~~
     478 |         }
         |         ~
>> drivers/block/fitblk.c:473:6: warning: variable 'found' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     473 |         if (!config_loadables || !config_loadables_len) {
         |             ^~~~~~~~~~~~~~~~~
   drivers/block/fitblk.c:594:7: note: uninitialized use occurs here
     594 |         if (!found || ret)
         |              ^~~~~
   drivers/block/fitblk.c:473:6: note: remove the '||' if its condition is always false
     473 |         if (!config_loadables || !config_loadables_len) {
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/block/fitblk.c:449:6: warning: variable 'found' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     449 |         if (node < 0) {
         |             ^~~~~~~~
   drivers/block/fitblk.c:594:7: note: uninitialized use occurs here
     594 |         if (!found || ret)
         |              ^~~~~
   drivers/block/fitblk.c:449:2: note: remove the 'if' if its condition is always false
     449 |         if (node < 0) {
         |         ^~~~~~~~~~~~~~~
     450 |                 pr_err("FIT: Cannot find %s node: %d\n",
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     451 |                         bootconf ?: config_default, node);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     452 |                 ret = -ENOENT;
         |                 ~~~~~~~~~~~~~~
     453 |                 goto out_bootconf;
         |                 ~~~~~~~~~~~~~~~~~~
     454 |         }
         |         ~
   drivers/block/fitblk.c:441:6: warning: variable 'found' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     441 |         if (!config_default && !bootconf) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/fitblk.c:594:7: note: uninitialized use occurs here
     594 |         if (!found || ret)
         |              ^~~~~
   drivers/block/fitblk.c:441:2: note: remove the 'if' if its condition is always false
     441 |         if (!config_default && !bootconf) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     442 |                 pr_err("FIT: Cannot find default configuration\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     443 |                 ret = -ENOENT;
         |                 ~~~~~~~~~~~~~~
     444 |                 goto out_bootconf;
         |                 ~~~~~~~~~~~~~~~~~~
     445 |         }
         |         ~
   drivers/block/fitblk.c:429:6: warning: variable 'found' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     429 |         if (config < 0) {
         |             ^~~~~~~~~~
   drivers/block/fitblk.c:594:7: note: uninitialized use occurs here
     594 |         if (!found || ret)
         |              ^~~~~
   drivers/block/fitblk.c:429:2: note: remove the 'if' if its condition is always false
     429 |         if (config < 0) {
         |         ^~~~~~~~~~~~~~~~~
     430 |                 pr_err("FIT: Cannot find %s node: %d\n",
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     431 |                         FIT_CONFS_PATH, config);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~
     432 |                 ret = -ENOENT;
         |                 ~~~~~~~~~~~~~~
     433 |                 goto out_bootconf;
         |                 ~~~~~~~~~~~~~~~~~~
     434 |         }
         |         ~
   drivers/block/fitblk.c:404:8: warning: variable 'found' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     404 |                         if (IS_ERR(folio)) {
         |                             ^~~~~~~~~~~~~
   drivers/block/fitblk.c:594:7: note: uninitialized use occurs here
     594 |         if (!found || ret)
         |              ^~~~~
   drivers/block/fitblk.c:404:4: note: remove the 'if' if its condition is always false
     404 |                         if (IS_ERR(folio)) {
         |                         ^~~~~~~~~~~~~~~~~~~~
     405 |                                 ret = PTR_ERR(folio);
         |                                 ~~~~~~~~~~~~~~~~~~~~~
     406 |                                 goto out_blkdev;
         |                                 ~~~~~~~~~~~~~~~~
     407 |                         };
         |                         ~
   drivers/block/fitblk.c:388:6: warning: variable 'found' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     388 |         if (!fit) {
         |             ^~~~
   drivers/block/fitblk.c:594:7: note: uninitialized use occurs here
     594 |         if (!found || ret)
         |              ^~~~~
   drivers/block/fitblk.c:388:2: note: remove the 'if' if its condition is always false
     388 |         if (!fit) {
         |         ^~~~~~~~~~~
     389 |                 ret = -ENOMEM;
         |                 ~~~~~~~~~~~~~~
     390 |                 folio_put(folio);
         |                 ~~~~~~~~~~~~~~~~~
     391 |                 goto out_blkdev;
         |                 ~~~~~~~~~~~~~~~~
     392 |         }
         |         ~
   drivers/block/fitblk.c:381:6: warning: variable 'found' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     381 |         if (size >= dsize) {
         |             ^~~~~~~~~~~~~
   drivers/block/fitblk.c:594:7: note: uninitialized use occurs here
     594 |         if (!found || ret)


vim +482 drivers/block/fitblk.c

   312	
   313	static int parse_fit_on_dev(struct device *dev)
   314	{
   315		struct file *bdev_file;
   316		struct block_device *bdev;
   317		struct address_space *mapping;
   318		struct folio *folio;
   319		pgoff_t f_index = 0;
   320		size_t bytes_left, bytes_to_copy;
   321		void *pre_fit, *fit, *fit_c;
   322		u64 dsize, dsectors, imgmaxsect = 0;
   323		u32 size, image_pos, image_len;
   324		const __be32 *image_offset_be, *image_len_be, *image_pos_be;
   325		int ret = 0, node, images, config;
   326		const char *image_name, *image_type, *image_description,
   327			*config_default, *config_description, *config_loadables;
   328		u32 image_name_len, image_type_len, image_description_len,
   329			bootconf_len, config_default_len, config_description_len,
   330			config_loadables_len;
   331		sector_t start_sect, nr_sects;
   332		struct device_node *np = NULL;
   333		const char *bootconf_c;
   334		const char *loadable;
   335		char *bootconf = NULL, *bootconf_term;
   336		bool found;
   337		int loadables_rem_len, loadable_len;
   338		u16 loadcnt;
   339		unsigned int slot = 0;
   340	
   341		/* Exclusive open the block device to receive holder notifications */
   342		bdev_file = bdev_file_open_by_dev(dev->devt, BLK_OPEN_READ | BLK_OPEN_RESTRICT_WRITES,
   343						  &_fitblk_claim_ptr, &fitblk_hops);
   344		if (!bdev_file)
   345			return -ENODEV;
   346	
   347		if (IS_ERR(bdev_file))
   348			return PTR_ERR(bdev_file);
   349	
   350		bdev = file_bdev(bdev_file);
   351		mapping = bdev_file->f_mapping;
   352	
   353		/* map first page */
   354		folio = read_mapping_folio(mapping, f_index++, NULL);
   355		if (IS_ERR(folio)) {
   356			ret = PTR_ERR(folio);
   357			goto out_blkdev;
   358		}
   359		pre_fit = folio_address(folio) + offset_in_folio(folio, 0);
   360	
   361		/* uImage.FIT is based on flattened device tree structure */
   362		if (fdt_check_header(pre_fit)) {
   363			ret = -EINVAL;
   364			folio_put(folio);
   365			goto out_blkdev;
   366		}
   367	
   368		size = fdt_totalsize(pre_fit);
   369	
   370		if (size > PAGE_SIZE * FIT_MAX_PAGES) {
   371			ret = -EOPNOTSUPP;
   372			folio_put(folio);
   373			goto out_blkdev;
   374		}
   375	
   376		/* acquire disk size */
   377		dsectors = bdev_nr_sectors(bdev);
   378		dsize = dsectors << SECTOR_SHIFT;
   379	
   380		/* abort if FIT structure is larger than disk or partition size */
   381		if (size >= dsize) {
   382			ret = -EFBIG;
   383			folio_put(folio);
   384			goto out_blkdev;
   385		}
   386	
   387		fit = kmalloc(size, GFP_KERNEL);
   388		if (!fit) {
   389			ret = -ENOMEM;
   390			folio_put(folio);
   391			goto out_blkdev;
   392		}
   393	
   394		bytes_left = size;
   395		fit_c = fit;
   396		while (bytes_left > 0) {
   397			bytes_to_copy = min_t(size_t, bytes_left, folio_size(folio) - offset_in_folio(folio, 0));
   398			memcpy(fit_c, pre_fit, bytes_to_copy);
   399			fit_c += bytes_to_copy;
   400			bytes_left -= bytes_to_copy;
   401			if (bytes_left) {
   402				folio_put(folio);
   403				folio = read_mapping_folio(mapping, f_index++, NULL);
   404				if (IS_ERR(folio)) {
   405					ret = PTR_ERR(folio);
   406					goto out_blkdev;
   407				};
   408				pre_fit = folio_address(folio) + offset_in_folio(folio, 0);
   409			}
   410		}
   411		folio_put(folio);
   412	
   413		/* set boot config node name U-Boot may have added to the device tree */
   414		np = of_find_node_by_path("/chosen");
   415		if (np) {
   416			bootconf_c = of_get_property(np, "u-boot,bootconf", &bootconf_len);
   417			if (bootconf_c && bootconf_len)
   418				bootconf = kmemdup_nul(bootconf_c, bootconf_len, GFP_KERNEL);
   419		}
   420	
   421		if (bootconf) {
   422			bootconf_term = strchr(bootconf, '#');
   423			if (bootconf_term)
   424				*bootconf_term = '\0';
   425		}
   426	
   427		/* find configuration path in uImage.FIT */
   428		config = fdt_path_offset(fit, FIT_CONFS_PATH);
   429		if (config < 0) {
   430			pr_err("FIT: Cannot find %s node: %d\n",
   431				FIT_CONFS_PATH, config);
   432			ret = -ENOENT;
   433			goto out_bootconf;
   434		}
   435	
   436		/* get default configuration node name */
   437		config_default =
   438			fdt_getprop(fit, config, FIT_DEFAULT_PROP, &config_default_len);
   439	
   440		/* make sure we got either default or selected boot config node name */
   441		if (!config_default && !bootconf) {
   442			pr_err("FIT: Cannot find default configuration\n");
   443			ret = -ENOENT;
   444			goto out_bootconf;
   445		}
   446	
   447		/* find selected boot config node, fallback on default config node */
   448		node = fdt_subnode_offset(fit, config, bootconf ?: config_default);
   449		if (node < 0) {
   450			pr_err("FIT: Cannot find %s node: %d\n",
   451				bootconf ?: config_default, node);
   452			ret = -ENOENT;
   453			goto out_bootconf;
   454		}
   455	
   456		pr_info("FIT: Detected U-Boot %s\n", ubootver);
   457	
   458		/* get selected configuration data */
   459		config_description =
   460			fdt_getprop(fit, node, FIT_DESC_PROP, &config_description_len);
   461		config_loadables = fdt_getprop(fit, node, FIT_LOADABLE_PROP,
   462					       &config_loadables_len);
   463	
   464		pr_info("FIT: %s configuration: \"%.*s\"%s%.*s%s\n",
   465			bootconf ? "Selected" : "Default",
   466			bootconf ? bootconf_len : config_default_len,
   467			bootconf ?: config_default,
   468			config_description ? " (" : "",
   469			config_description ? config_description_len : 0,
   470			config_description ?: "",
   471			config_description ? ")" : "");
   472	
 > 473		if (!config_loadables || !config_loadables_len) {
   474			pr_err("FIT: No loadables configured in \"%s\"\n",
   475				bootconf ?: config_default);
   476			ret = -ENOENT;
   477			goto out_bootconf;
   478		}
   479	
   480		/* get images path in uImage.FIT */
   481		images = fdt_path_offset(fit, FIT_IMAGES_PATH);
 > 482		if (images < 0) {
   483			pr_err("FIT: Cannot find %s node: %d\n", FIT_IMAGES_PATH, images);
   484			ret = -EINVAL;
   485			goto out_bootconf;
   486		}
   487	
   488		/* iterate over images in uImage.FIT */
   489		fdt_for_each_subnode(node, fit, images) {
   490			image_name = fdt_get_name(fit, node, &image_name_len);
   491			image_type = fdt_getprop(fit, node, FIT_TYPE_PROP, &image_type_len);
   492			image_offset_be = fdt_getprop(fit, node, FIT_DATA_OFFSET_PROP, NULL);
   493			image_pos_be = fdt_getprop(fit, node, FIT_DATA_POSITION_PROP, NULL);
   494			image_len_be = fdt_getprop(fit, node, FIT_DATA_SIZE_PROP, NULL);
   495	
   496			if (!image_name || !image_type || !image_len_be ||
   497			    !image_name_len || !image_type_len)
   498				continue;
   499	
   500			image_len = be32_to_cpu(*image_len_be);
   501			if (!image_len)
   502				continue;
   503	
   504			if (image_offset_be)
   505				image_pos = be32_to_cpu(*image_offset_be) + size;
   506			else if (image_pos_be)
   507				image_pos = be32_to_cpu(*image_pos_be);
   508			else
   509				continue;
   510	
   511			image_description = fdt_getprop(fit, node, FIT_DESC_PROP,
   512							&image_description_len);
   513	
   514			pr_info("FIT: %16s sub-image 0x%08x..0x%08x \"%.*s\"%s%.*s%s\n",
   515				image_type, image_pos, image_pos + image_len - 1,
   516				image_name_len, image_name, image_description ? " (" : "",
   517				image_description ? image_description_len : 0,
   518				image_description ?: "", image_description ? ") " : "");
   519	
   520			/* only 'filesystem' images should be mapped as partitions */
   521			if (strncmp(image_type, FIT_FILESYSTEM_PROP, image_type_len))
   522				continue;
   523	
   524			/* check if sub-image is part of configured loadables */
   525			found = false;
   526			loadable = config_loadables;
   527			loadables_rem_len = config_loadables_len;
   528			for (loadcnt = 0; loadables_rem_len > 1 &&
   529					  loadcnt < MAX_FIT_LOADABLES; ++loadcnt) {
   530				loadable_len =
   531					strnlen(loadable, loadables_rem_len - 1) + 1;
   532				loadables_rem_len -= loadable_len;
   533				if (!strncmp(image_name, loadable, loadable_len)) {
   534					found = true;
   535					break;
   536				}
   537				loadable += loadable_len;
   538			}
   539			if (!found)
   540				continue;
   541	
   542			if (image_pos % (1 << PAGE_SHIFT)) {
   543				dev_err(dev, "FIT: image %.*s start not aligned to page boundaries, skipping\n",
   544					image_name_len, image_name);
   545				continue;
   546			}
   547	
   548			if (image_len % (1 << PAGE_SHIFT)) {
   549				dev_err(dev, "FIT: sub-image %.*s end not aligned to page boundaries, skipping\n",
   550					image_name_len, image_name);
   551				continue;
   552			}
   553	
   554			start_sect = image_pos >> SECTOR_SHIFT;
   555			nr_sects = image_len >> SECTOR_SHIFT;
   556			imgmaxsect = max_t(sector_t, imgmaxsect, start_sect + nr_sects);
   557	
   558			if (start_sect + nr_sects > dsectors) {
   559				dev_err(dev, "FIT: sub-image %.*s disk access beyond EOD\n",
   560					image_name_len, image_name);
   561				continue;
   562			}
   563	
   564			if (!slot) {
   565				ret = sysfs_create_link_nowarn(&pdev->dev.kobj, bdev_kobj(bdev), "lower_dev");
   566				if (ret && ret != -EEXIST)
   567					goto out_bootconf;
   568	
   569				ret = 0;
   570			}
   571	
   572			add_fit_subimage_device(bdev_file, slot++, start_sect, nr_sects, true);
   573		}
   574	
   575		if (!found || !slot)
   576			goto out_bootconf;
   577	
   578		dev_info(dev, "mapped %u uImage.FIT filesystem sub-image%s as /dev/fit%s%u%s\n",
   579			 slot, (slot > 1)?"s":"", (slot > 1)?"[0...":"", slot - 1,
   580			 (slot > 1)?"]":"");
   581	
   582		/* in case uImage.FIT is stored in a partition, map the remaining space */
   583		if (!bdev_read_only(bdev) && bdev_is_partition(bdev) &&
   584		    (imgmaxsect + MIN_FREE_SECT) < dsectors) {
   585			add_fit_subimage_device(bdev_file, slot++, imgmaxsect,
   586						dsectors - imgmaxsect, false);
   587			dev_info(dev, "mapped remaing space as /dev/fitrw\n");
   588		}
   589	
   590	out_bootconf:
   591		kfree(bootconf);
   592		kfree(fit);
   593	out_blkdev:
   594		if (!found || ret)
   595			fput(bdev_file);
   596	
   597		return ret;
   598	}
   599	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
