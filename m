Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AF724550
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 11:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692878298; x=1724414298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MwNEq1k7q4gN76Wb9UOvKOunQOp8TdmsIBWV4s6hXZg=;
  b=OXBIGCD2dL4aOzSqmTzctNgVroEHmPvGpWIOpUC2zeLVi82PFYRsAao+
   Jd2H/OnJkaNvKjVltTOh/rpEF8R3eJ+yQBgAIStqsv0Ye2edEmX2yVD3A
   N81b0gg8N4GOY9xdOOvSd0jTjMKaSmNSaegEgApcUYJHSfjaQjbhGK+Vx
   ml2Qv2TciOMvk2+DGBFSLuP4qQoXBv5f8h6boBAVmYvQBE2Mux20MtRTR
   1z/23z1pfhAbnABgKrkjbJyb/bPBNyBT0yeuyWmwEmicpgN8p/sNxhAI3
   y6JuFSDavQ0cyvdGBK6qDLMihXGJoiAe8qCHvrQ2aXOJ/p7cXQJDFr4f4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="373298941"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="373298941"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 04:58:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="880774493"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2023 04:58:21 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ8ye-0002Gh-0o;
	Thu, 24 Aug 2023 11:58:16 +0000
Date: Thu, 24 Aug 2023 19:57:12 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_2 11434/11472]
 drivers/mtd/mtdsplit/mtdsplit_uimage.c:122: warning: Function parameter or
 member 'master' not described in '__mtdsplit_parse_uimage'
Message-ID: <202308241920.n43a3Dr5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_2
head:   765ced40ad936e2be7291aa23b2433a3c7df658c
commit: 5d223b90700e4682e6263d8bdedd6c490c2b2e5a [11434/11472] OWRT BUILD: mtd: mtdsplit support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230824/202308241920.n43a3Dr5-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241920.n43a3Dr5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241920.n43a3Dr5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/mtdsplit/mtdsplit_uimage.c:122: warning: Function parameter or member 'master' not described in '__mtdsplit_parse_uimage'
>> drivers/mtd/mtdsplit/mtdsplit_uimage.c:122: warning: Function parameter or member 'pparts' not described in '__mtdsplit_parse_uimage'
>> drivers/mtd/mtdsplit/mtdsplit_uimage.c:122: warning: Function parameter or member 'data' not described in '__mtdsplit_parse_uimage'
>> drivers/mtd/mtdsplit/mtdsplit_uimage.c:122: warning: Excess function parameter 'find_header' description in '__mtdsplit_parse_uimage'
--
>> drivers/mtd/mtdsplit/mtdsplit_jimage.c:97: warning: Function parameter or member 'master' not described in '__mtdsplit_parse_jimage'
>> drivers/mtd/mtdsplit/mtdsplit_jimage.c:97: warning: Function parameter or member 'pparts' not described in '__mtdsplit_parse_jimage'
>> drivers/mtd/mtdsplit/mtdsplit_jimage.c:97: warning: Function parameter or member 'data' not described in '__mtdsplit_parse_jimage'


vim +122 drivers/mtd/mtdsplit/mtdsplit_uimage.c

   112	
   113	/**
   114	 * __mtdsplit_parse_uimage - scan partition and create kernel + rootfs parts
   115	 *
   116	 * @find_header: function to call for a block of data that will return offset
   117	 *      and tail padding length of a valid uImage header if found
   118	 */
   119	static int __mtdsplit_parse_uimage(struct mtd_info *master,
   120					   const struct mtd_partition **pparts,
   121					   struct mtd_part_parser_data *data)
 > 122	{
   123		struct mtd_partition *parts;
   124		u_char *buf;
   125		int nr_parts;
   126		size_t offset;
   127		size_t uimage_offset;
   128		size_t uimage_size = 0;
   129		size_t rootfs_offset;
   130		size_t rootfs_size = 0;
   131		size_t buflen;
   132		int uimage_part, rf_part;
   133		int ret;
   134		int extralen = 0;
   135		u32 ih_magic = IH_MAGIC;
   136		u32 ih_type = IH_TYPE_KERNEL;
   137		u32 header_offset = 0;
   138		u32 part_magic = 0;
   139		enum mtdsplit_part_type type;
   140	
   141		nr_parts = 2;
   142		parts = kzalloc(nr_parts * sizeof(*parts), GFP_KERNEL);
   143		if (!parts)
   144			return -ENOMEM;
   145	
   146		uimage_parse_dt(master, &extralen, &ih_magic, &ih_type, &header_offset, &part_magic);
   147		buflen = sizeof(struct uimage_header) + header_offset;
   148		buf = vmalloc(buflen);
   149		if (!buf) {
   150			ret = -ENOMEM;
   151			goto err_free_parts;
   152		}
   153	
   154		/* find uImage on erase block boundaries */
   155		for (offset = 0; offset < master->size; offset += master->erasesize) {
   156			struct uimage_header *header;
   157	
   158			uimage_size = 0;
   159	
   160			ret = read_uimage_header(master, offset, buf, buflen);
   161			if (ret)
   162				continue;
   163	
   164			/* verify optional partition magic before uimage header */
   165			if (header_offset && part_magic && (be32_to_cpu(*(u32 *)buf) != part_magic))
   166				continue;
   167	
   168			ret = uimage_verify_default(buf + header_offset, ih_magic, ih_type);
   169			if (ret < 0) {
   170				pr_debug("no valid uImage found in \"%s\" at offset %llx\n",
   171					 master->name, (unsigned long long) offset);
   172				continue;
   173			}
   174	
   175			header = (struct uimage_header *)(buf + header_offset);
   176	
   177			uimage_size = sizeof(*header) +
   178					be32_to_cpu(header->ih_size) + header_offset + extralen;
   179	
   180			if ((offset + uimage_size) > master->size) {
   181				pr_debug("uImage exceeds MTD device \"%s\"\n",
   182					 master->name);
   183				continue;
   184			}
   185			break;
   186		}
   187	
   188		if (uimage_size == 0) {
   189			pr_debug("no uImage found in \"%s\"\n", master->name);
   190			ret = -ENODEV;
   191			goto err_free_buf;
   192		}
   193	
   194		uimage_offset = offset;
   195	
   196		if (uimage_offset == 0) {
   197			uimage_part = 0;
   198			rf_part = 1;
   199	
   200			/* find the roots after the uImage */
   201			ret = mtd_find_rootfs_from(master, uimage_offset + uimage_size,
   202						   master->size, &rootfs_offset, &type);
   203			if (ret) {
   204				pr_debug("no rootfs after uImage in \"%s\"\n",
   205					 master->name);
   206				goto err_free_buf;
   207			}
   208	
   209			rootfs_size = master->size - rootfs_offset;
   210			uimage_size = rootfs_offset - uimage_offset;
   211		} else {
   212			rf_part = 0;
   213			uimage_part = 1;
   214	
   215			/* check rootfs presence at offset 0 */
   216			ret = mtd_check_rootfs_magic(master, 0, &type);
   217			if (ret) {
   218				pr_debug("no rootfs before uImage in \"%s\"\n",
   219					 master->name);
   220				goto err_free_buf;
   221			}
   222	
   223			rootfs_offset = 0;
   224			rootfs_size = uimage_offset;
   225		}
   226	
   227		if (rootfs_size == 0) {
   228			pr_debug("no rootfs found in \"%s\"\n", master->name);
   229			ret = -ENODEV;
   230			goto err_free_buf;
   231		}
   232	
   233		parts[uimage_part].name = KERNEL_PART_NAME;
   234		parts[uimage_part].offset = uimage_offset;
   235		parts[uimage_part].size = uimage_size;
   236	
   237		if (type == MTDSPLIT_PART_TYPE_UBI)
   238			parts[rf_part].name = UBI_PART_NAME;
   239		else
   240			parts[rf_part].name = ROOTFS_PART_NAME;
   241		parts[rf_part].offset = rootfs_offset;
   242		parts[rf_part].size = rootfs_size;
   243	
   244		vfree(buf);
   245	
   246		*pparts = parts;
   247		return nr_parts;
   248	
   249	err_free_buf:
   250		vfree(buf);
   251	
   252	err_free_parts:
   253		kfree(parts);
   254		return ret;
   255	}
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
