Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763A91377
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 21:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694294703; x=1725830703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i9VDhlGdPHBryGn/qMlHZnNW5Zm2ls/KWaEM/7bqDiw=;
  b=iRFlLVKUdb4cNCxmAO0VPTs9swbrioi4JSq4vzG1QTwDGnEvKEwxXXLM
   uzL3gQCiHwuKRVBkM6P3r1usHwoBBVdQPKa4P3D2LZzVLGi4/id7qz31m
   kcYsjMOm6yaepU2tMSEQJXZNYxdsoyqT51eTZq4JfPJ3kryOUHIZ9rzgN
   CtEa/ZGdR4RJwmnbwwm5+yThasGoaV6s8B5oUi5vaaFsaxvxpQQVSRU6g
   C7GzyPqUigHiMcidGPmlCNbBITyhWQONTofbtfiMRfzhpIQUWrosYcEnb
   bBnQUloTtkDTYTIxkh8wZ+KPuxNyRKYg5fQjdFbswoigFgRQzE+arSpJf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="444275765"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="444275765"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 14:24:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="857811915"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="857811915"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Sep 2023 14:24:50 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qf5Rg-0003xK-0U;
	Sat, 09 Sep 2023 21:24:48 +0000
Date: Sun, 10 Sep 2023 05:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-lvts 14474/14520]
 drivers/mtd/mtdsplit/mtdsplit_fit.c:303:undefined reference to
 `fdt_path_offset'
Message-ID: <202309100525.tCcJHNvM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-lvts
head:   f57e179d55d63bf610762bac281150fed3113091
commit: 5faa51c4316aeefc510197b28bdd6c5a16446f73 [14474/14520] OWRT BUILD: mtd: mtdsplit support
config: s390-randconfig-r011-20230910 (https://download.01.org/0day-ci/archive/20230910/202309100525.tCcJHNvM-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309100525.tCcJHNvM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309100525.tCcJHNvM-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `mtdsplit_fit_parse':
>> drivers/mtd/mtdsplit/mtdsplit_fit.c:303:(.text+0x2cc): undefined reference to `fdt_path_offset'
>> s390-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.c:305:(.text+0x2dc): undefined reference to `fdt_strerror'
>> s390-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.c:311:(.text+0x312): undefined reference to `fdt_next_node'
   s390-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `fit_image_get_data_position':
>> drivers/mtd/mtdsplit/mtdsplit_fit.c:110:(.text+0x3b4): undefined reference to `fdt_getprop'
   s390-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `fit_image_get_data_offset':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:85:(.text+0x3d4): undefined reference to `fdt_getprop'
   s390-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `fit_image_get_data':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:59:(.text+0x3fa): undefined reference to `fdt_getprop'
   s390-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `mtdsplit_fit_parse':
>> drivers/mtd/mtdsplit/mtdsplit_fit.c:313:(.text+0x42c): undefined reference to `fdt_next_node'
   s390-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `fit_image_get_data_size':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:134:(.text+0x44c): undefined reference to `fdt_getprop'


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
 > 313			     noffset = fdt_next_node(fit, noffset, &ndepth)) {
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
