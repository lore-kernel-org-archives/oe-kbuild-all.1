Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9BE156E4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 20:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceTR5lxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698267337; x=1729803337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lKymT8dn29pVUfM5bRV73Fc7Nn7ad0urn/OWCmCrmJA=;
  b=ceTR5lxPkaKlCqaUl/cQ10px2JbNTSWcqVmsc8hMT9JpMbHULIxBDG9Q
   hD73i7Fh0DJOZrsFpMiTsLQEP/X4DZRYZza6d1yUfRZu8oF5KVtXYTQAF
   JGlYBE8CGQQlTJoMZmOSkX5BDOa/csRLmT6wDbG6+vaTX50x4zONN13Zi
   s7jYbRJ41mmH0inDWZvOAduZ4MCKreH4tvoEvoo6fjgoY5hH0+Jtybf7D
   Tlw6U02viRs7Rxa0XvJrDIt78xCSevKNlkQNelW2bzro2vAeIKLjd7aIr
   U0cJsDojClFC+Kct+ZtxUeHQ4v1A0U7qMquu0hE4fbWAJhs9y9f/cJqQD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="8953139"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="8953139"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 13:55:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="1090346306"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="1090346306"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Oct 2023 13:55:34 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvkua-0009Bu-2K;
	Wed, 25 Oct 2023 20:55:32 +0000
Date: Thu, 26 Oct 2023 04:55:25 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-dango 7046/7095]
 drivers/mtd/mtdsplit/mtdsplit_fit.c:303: undefined reference to
 `fdt_path_offset'
Message-ID: <202310260414.0EkQogIV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-dango
head:   7c273a7526ad5e3284b1763207b1d8d6178d9ca4
commit: 6604af5f4286bbaa8e4c624410208cdc2f5cd309 [7046/7095] OWRT BUILD: mtd: mtdsplit support
config: x86_64-randconfig-014-20231026 (https://download.01.org/0day-ci/archive/20231026/202310260414.0EkQogIV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310260414.0EkQogIV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310260414.0EkQogIV-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `mtdsplit_fit_parse':
>> drivers/mtd/mtdsplit/mtdsplit_fit.c:303: undefined reference to `fdt_path_offset'
>> ld: drivers/mtd/mtdsplit/mtdsplit_fit.c:311: undefined reference to `fdt_next_node'
   ld: drivers/mtd/mtdsplit/mtdsplit_fit.c:313: undefined reference to `fdt_next_node'
   ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `fit_image_get_data_position':
>> drivers/mtd/mtdsplit/mtdsplit_fit.c:110: undefined reference to `fdt_getprop'
   ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `fit_image_get_data_size':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:134: undefined reference to `fdt_getprop'
   ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `fit_image_get_data_offset':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:85: undefined reference to `fdt_getprop'
   ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `fit_image_get_data':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:59: undefined reference to `fdt_getprop'
   ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `mtdsplit_fit_parse':
>> drivers/mtd/mtdsplit/mtdsplit_fit.c:305: undefined reference to `fdt_strerror'


vim +303 drivers/mtd/mtdsplit/mtdsplit_fit.c

    93	
    94	/**
    95	 * Get 'data-position' property from a given image node.
    96	 *
    97	 * @fit: pointer to the FIT image header
    98	 * @noffset: component image node offset
    99	 * @data_position: holds the data-position property
   100	 *
   101	 * returns:
   102	 *     0, on success
   103	 *     -ENOENT if the property could not be found
   104	 */
   105	static int fit_image_get_data_position(const void *fit, int noffset,
   106					int *data_position)
   107	{
   108		const fdt32_t *val;
   109	
 > 110		val = fdt_getprop(fit, noffset, FIT_DATA_POSITION_PROP, NULL);
   111		if (!val)
   112			return -ENOENT;
   113	
   114		*data_position = fdt32_to_cpu(*val);
   115	
   116		return 0;
   117	}
   118	
   119	/**
   120	 * Get 'data-size' property from a given image node.
   121	 *
   122	 * @fit: pointer to the FIT image header
   123	 * @noffset: component image node offset
   124	 * @data_size: holds the data-size property
   125	 *
   126	 * returns:
   127	 *     0, on success
   128	 *     -ENOENT if the property could not be found
   129	 */
   130	static int fit_image_get_data_size(const void *fit, int noffset, int *data_size)
   131	{
   132		const fdt32_t *val;
   133	
   134		val = fdt_getprop(fit, noffset, FIT_DATA_SIZE_PROP, NULL);
   135		if (!val)
   136			return -ENOENT;
   137	
   138		*data_size = fdt32_to_cpu(*val);
   139	
   140		return 0;
   141	}
   142	
   143	/**
   144	 * fit_image_get_data_and_size - get data and its size including
   145	 *				 both embedded and external data
   146	 * @fit: pointer to the FIT format image header
   147	 * @noffset: component image node offset
   148	 * @data: double pointer to void, will hold data property's data address
   149	 * @size: pointer to size_t, will hold data property's data size
   150	 *
   151	 * fit_image_get_data_and_size() finds data and its size including
   152	 * both embedded and external data. If the property is found
   153	 * its data start address and size are returned to the caller.
   154	 *
   155	 * returns:
   156	 *     0, on success
   157	 *     otherwise, on failure
   158	 */
   159	static int fit_image_get_data_and_size(const void *fit, int noffset,
   160					const void **data, size_t *size)
   161	{
   162		bool external_data = false;
   163		int offset;
   164		int len;
   165		int ret;
   166	
   167		if (!fit_image_get_data_position(fit, noffset, &offset)) {
   168			external_data = true;
   169		} else if (!fit_image_get_data_offset(fit, noffset, &offset)) {
   170			external_data = true;
   171			/*
   172			 * For FIT with external data, figure out where
   173			 * the external images start. This is the base
   174			 * for the data-offset properties in each image.
   175			 */
   176			offset += ((fdt_totalsize(fit) + 3) & ~3);
   177		}
   178	
   179		if (external_data) {
   180			ret = fit_image_get_data_size(fit, noffset, &len);
   181			if (!ret) {
   182				*data = fit + offset;
   183				*size = len;
   184			}
   185		} else {
   186			ret = fit_image_get_data(fit, noffset, data, size);
   187		}
   188	
   189		return ret;
   190	}
   191	
   192	static int
   193	mtdsplit_fit_parse(struct mtd_info *mtd,
   194			   const struct mtd_partition **pparts,
   195		           struct mtd_part_parser_data *data)
   196	{
   197		struct device_node *np = mtd_get_of_node(mtd);
   198		const char *cmdline_match = NULL;
   199		struct fdt_header hdr;
   200		size_t hdr_len, retlen;
   201		size_t offset;
   202		u32 offset_start = 0;
   203		size_t fit_offset, fit_size;
   204		size_t rootfs_offset, rootfs_size;
   205		size_t data_size, img_total, max_size = 0;
   206		struct mtd_partition *parts;
   207		int ret, ndepth, noffset, images_noffset;
   208		const void *img_data;
   209		void *fit;
   210	
   211		of_property_read_string(np, "openwrt,cmdline-match", &cmdline_match);
   212		if (cmdline_match && !strstr(saved_command_line, cmdline_match))
   213			return -ENODEV;
   214	
   215		of_property_read_u32(np, "openwrt,fit-offset", &offset_start);
   216	
   217		hdr_len = sizeof(struct fdt_header);
   218	
   219		/* Parse the MTD device & search for the FIT image location */
   220		for(offset = 0; offset + hdr_len <= mtd->size; offset += mtd->erasesize) {
   221			ret = mtd_read(mtd, offset + offset_start, hdr_len, &retlen, (void*) &hdr);
   222			if (ret) {
   223				pr_err("read error in \"%s\" at offset 0x%llx\n",
   224				       mtd->name, (unsigned long long) offset);
   225				return ret;
   226			}
   227	
   228			if (retlen != hdr_len) {
   229				pr_err("short read in \"%s\"\n", mtd->name);
   230				return -EIO;
   231			}
   232	
   233			/* Check the magic - see if this is a FIT image */
   234			if (be32_to_cpu(hdr.magic) != OF_DT_HEADER) {
   235				pr_debug("no valid FIT image found in \"%s\" at offset %llx\n",
   236					 mtd->name, (unsigned long long) offset);
   237				continue;
   238			}
   239	
   240			/* We found a FIT image. Let's keep going */
   241			break;
   242		}
   243	
   244		fit_offset = offset;
   245		fit_size = be32_to_cpu(hdr.totalsize);
   246	
   247		if (fit_size == 0) {
   248			pr_err("FIT image in \"%s\" at offset %llx has null size\n",
   249			       mtd->name, (unsigned long long) fit_offset);
   250			return -ENODEV;
   251		}
   252	
   253		/*
   254		 * Classic uImage.FIT has all data embedded into the FDT
   255		 * data structure. Hence the total size of the image equals
   256		 * the total size of the FDT structure.
   257		 * Modern uImage.FIT may have only references to data in FDT,
   258		 * hence we need to parse FDT structure to find the end of the
   259		 * last external data refernced.
   260		 */
   261		if (fit_size > 0x1000) {
   262			enum mtdsplit_part_type type;
   263	
   264			/* Search for the rootfs partition after the FIT image */
   265			ret = mtd_find_rootfs_from(mtd, fit_offset + fit_size + offset_start, mtd->size,
   266						   &rootfs_offset, &type);
   267			if (ret) {
   268				pr_info("no rootfs found after FIT image in \"%s\"\n",
   269					mtd->name);
   270				return ret;
   271			}
   272	
   273			rootfs_size = mtd->size - rootfs_offset;
   274	
   275			parts = kzalloc(2 * sizeof(*parts), GFP_KERNEL);
   276			if (!parts)
   277				return -ENOMEM;
   278	
   279			parts[0].name = KERNEL_PART_NAME;
   280			parts[0].offset = fit_offset;
   281			parts[0].size = mtd_rounddown_to_eb(fit_size + offset_start, mtd) + mtd->erasesize;
   282	
   283			if (type == MTDSPLIT_PART_TYPE_UBI)
   284				parts[1].name = UBI_PART_NAME;
   285			else
   286				parts[1].name = ROOTFS_PART_NAME;
   287			parts[1].offset = rootfs_offset;
   288			parts[1].size = rootfs_size;
   289	
   290			*pparts = parts;
   291	
   292			return 2;
   293		} else {
   294			/* Search for rootfs_data after FIT external data */
   295			fit = kzalloc(fit_size, GFP_KERNEL);
   296			ret = mtd_read(mtd, offset, fit_size + offset_start, &retlen, fit);
   297			if (ret) {
   298				pr_err("read error in \"%s\" at offset 0x%llx\n",
   299				       mtd->name, (unsigned long long) offset);
   300				return ret;
   301			}
   302	
 > 303			images_noffset = fdt_path_offset(fit, FIT_IMAGES_PATH);
   304			if (images_noffset < 0) {
 > 305				pr_err("Can't find images parent node '%s' (%s)\n",
   306				FIT_IMAGES_PATH, fdt_strerror(images_noffset));
   307				return -ENODEV;
   308			}
   309	
   310			for (ndepth = 0,
 > 311			     noffset = fdt_next_node(fit, images_noffset, &ndepth);
   312			     (noffset >= 0) && (ndepth > 0);
   313			     noffset = fdt_next_node(fit, noffset, &ndepth)) {
   314				if (ndepth == 1) {
   315					ret = fit_image_get_data_and_size(fit, noffset, &img_data, &data_size);
   316					if (ret)
   317						return 0;
   318	
   319					img_total = data_size + (img_data - fit);
   320	
   321					max_size = (max_size > img_total) ? max_size : img_total;
   322				}
   323			}
   324	
   325			parts = kzalloc(sizeof(*parts), GFP_KERNEL);
   326			if (!parts)
   327				return -ENOMEM;
   328	
   329			parts[0].name = ROOTFS_SPLIT_NAME;
   330			parts[0].offset = fit_offset + mtd_rounddown_to_eb(max_size, mtd) + mtd->erasesize;
   331			parts[0].size = mtd->size - parts[0].offset;
   332	
   333			*pparts = parts;
   334	
   335			kfree(fit);
   336	
   337			return 1;
   338		}
   339	}
   340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
