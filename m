Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C656E18EBE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 05:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dnctj1vP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704345082; x=1735881082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Pe7bU41VDPnqmba7Brp3BGw7tLwqdhe2HPMqhtSiPk=;
  b=Dnctj1vPEvBr+3CJBRVaJp8bv+PwDOHMtk+JCH88SZKUG9THWnHY5RzX
   5DrX9z64M4gufrPPIWWul8cuVqIwLYG8ZCX1UN2gbMz4rhLPqnuoJ6WrM
   io1oVrdFoBB3KPqU8tUJDLff0KN4vOcTTbNMba7RWGOuUBsNqpTt7OhHL
   KZUZs7ASG3GU0pOSuc6irg8QKm5EKkgK5yUXrPeR9H50ijnFASlKVZyVC
   EWqb0As5pSJTSs8bvfytdqtMbYJ9aT62UruWCpIs5Gremw3voTuxoE1o4
   XXh45OFyU/bO7Bgb6tQzlDtS2UHwQJKVVXS1vWvKam8obDc3+9dBJtTsb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="394297619"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; 
   d="scan'208";a="394297619"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 21:11:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="773375282"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; 
   d="scan'208";a="773375282"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 03 Jan 2024 21:11:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLG0V-000MvA-1x;
	Thu, 04 Jan 2024 05:11:08 +0000
Date: Thu, 4 Jan 2024 13:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.7-dango-lro 8175/8194]
 drivers/mtd/mtdsplit/mtdsplit_fit.c:313: undefined reference to
 `fdt_next_node'
Message-ID: <202401041300.ePqzYN0k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.7-dango-lro
head:   4eab55caf474fb07bebdf8e563483b219dcee3b0
commit: 7751d76829e58287b083282c9fc83c153e6f2d3a [8175/8194] OWRT BUILD: mtd: mtdsplit support
config: i386-randconfig-001-20240104 (https://download.01.org/0day-ci/archive/20240104/202401041300.ePqzYN0k-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401041300.ePqzYN0k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401041300.ePqzYN0k-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `mtdsplit_fit_parse':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:303: undefined reference to `fdt_path_offset'
   ld: drivers/mtd/mtdsplit/mtdsplit_fit.c:311: undefined reference to `fdt_next_node'
>> ld: drivers/mtd/mtdsplit/mtdsplit_fit.c:313: undefined reference to `fdt_next_node'
   ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `fit_image_get_data_position':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:110: undefined reference to `fdt_getprop'
   ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `fit_image_get_data_size':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:134: undefined reference to `fdt_getprop'
   ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `mtdsplit_fit_parse':
>> drivers/mtd/mtdsplit/mtdsplit_fit.c:313: undefined reference to `fdt_next_node'
   ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `fit_image_get_data_offset':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:85: undefined reference to `fdt_getprop'
   ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `mtdsplit_fit_parse':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:305: undefined reference to `fdt_strerror'
   ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `fit_image_get_data':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:59: undefined reference to `fdt_getprop'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHY_MTK_PEXTP
   Depends on [n]: (ARCH_MEDIATEK || COMPILE_TEST [=n]) && OF [=n] && OF_ADDRESS [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - PCS_MTK_USXGMII [=y] && NETDEVICES [=y]


vim +313 drivers/mtd/mtdsplit/mtdsplit_fit.c

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
   303			images_noffset = fdt_path_offset(fit, FIT_IMAGES_PATH);
   304			if (images_noffset < 0) {
   305				pr_err("Can't find images parent node '%s' (%s)\n",
   306				FIT_IMAGES_PATH, fdt_strerror(images_noffset));
   307				return -ENODEV;
   308			}
   309	
   310			for (ndepth = 0,
   311			     noffset = fdt_next_node(fit, images_noffset, &ndepth);
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
