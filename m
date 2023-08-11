Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9332D8833
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 21:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691790355; x=1723326355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BRpIl6zqLdwAwFzioiPOqtUvsA7xtAiMMoZe3kwzdnY=;
  b=ntEF7GVq9ZZ3f5HEQLCZeWaOyHdQtqjJPFBfFjmLx2qtos39940ibrNK
   Qg1Medn2vNl18R2dzyHkTnBegwzEE7TMxct4KzRQYOMhdoqBii9Gzl20Y
   Q4lzO3/o1wSSybzeehTJloEqjDERG5p7i77zcODWb/gFtP2SGkFGlTBQr
   q0Vis3IWonSJtXeKSnPIBXUHAInz57HOOpaLc+wWM8G0SRl24ydPvuaCf
   /6J7WwDtP6fOqTZA4Or2blYvGXOpNaV59fKdzbWLGhionT0XsIb3RKn5V
   k++bqcTGZKc76TWcQo3t6zKnp3PzbvU4QU0AxqTXhuyRQ/Q2w1s8lbeoM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="375482454"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="375482454"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 14:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="1063435894"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="1063435894"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Aug 2023 14:45:53 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUZxA-00083y-1n;
	Fri, 11 Aug 2023 21:45:52 +0000
Date: Sat, 12 Aug 2023 05:45:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 17/24] drivers/cxl/acpi.c:281:52: warning:
 implicit conversion from 'enum acpi_cedt_type' to 'enum acpi_keyp_type'
Message-ID: <202308120524.ZZSdvZa7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   ee3a63e65f46140bcb484e3d0052d641abceb9da
commit: 7e72c9ad3fa55da9f48f56720b09f5e74e00dc92 [17/24] acpi: Add KEYP support to fw_table parsing
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230812/202308120524.ZZSdvZa7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120524.ZZSdvZa7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120524.ZZSdvZa7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:18,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/cxl/acpi.c:3:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   In file included from drivers/cxl/acpi.c:7:
   include/linux/acpi.h:241:19: error: conflicting types for 'acpi_table_parse_cedt'; have 'int(enum acpi_keyp_type,  int (*)(union acpi_subtable_headers *, void *, const long unsigned int), void *)'
     241 | static inline int acpi_table_parse_cedt(enum acpi_keyp_type id,
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:233:1: note: previous declaration of 'acpi_table_parse_cedt' with type 'int(enum acpi_cedt_type,  int (*)(union acpi_subtable_headers *, void *, const long unsigned int), void *)'
     233 | acpi_table_parse_cedt(enum acpi_cedt_type id,
         | ^~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/acpi.c: In function 'cxl_parse_cfmws':
>> drivers/cxl/acpi.c:281:52: warning: implicit conversion from 'enum acpi_cedt_type' to 'enum acpi_keyp_type' [-Wenum-conversion]
     281 |                         rc = acpi_table_parse_cedt(ACPI_CEDT_TYPE_CXIMS,
         |                                                    ^~~~~~~~~~~~~~~~~~~~
   drivers/cxl/acpi.c: In function 'cxl_get_chbs':
   drivers/cxl/acpi.c:384:31: warning: implicit conversion from 'enum acpi_cedt_type' to 'enum acpi_keyp_type' [-Wenum-conversion]
     384 |         acpi_table_parse_cedt(ACPI_CEDT_TYPE_CHBS, cxl_get_chbs_iter, ctx);
         |                               ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/acpi.c: In function 'cxl_acpi_probe':
   drivers/cxl/acpi.c:693:36: warning: implicit conversion from 'enum acpi_cedt_type' to 'enum acpi_keyp_type' [-Wenum-conversion]
     693 |         rc = acpi_table_parse_cedt(ACPI_CEDT_TYPE_CFMWS, cxl_parse_cfmws, &ctx);
         |                                    ^~~~~~~~~~~~~~~~~~~~


vim +281 drivers/cxl/acpi.c

f4ce1f766f1ebf Dan Williams     2021-10-29  196  
f4ce1f766f1ebf Dan Williams     2021-10-29  197  static int cxl_parse_cfmws(union acpi_subtable_headers *header, void *arg,
f4ce1f766f1ebf Dan Williams     2021-10-29  198  			   const unsigned long end)
3e23d17ce1980c Alison Schofield 2021-06-17  199  {
a5c25802168993 Dan Williams     2021-09-08  200  	int target_map[CXL_DECODER_MAX_INTERLEAVE];
f4ce1f766f1ebf Dan Williams     2021-10-29  201  	struct cxl_cfmws_context *ctx = arg;
f4ce1f766f1ebf Dan Williams     2021-10-29  202  	struct cxl_port *root_port = ctx->root_port;
974854ab072853 Dan Williams     2022-07-12  203  	struct resource *cxl_res = ctx->cxl_res;
f9db85bfec0dcc Alison Schofield 2022-11-30  204  	struct cxl_cxims_context cxims_ctx;
0f157c7fa1a0e1 Dan Williams     2022-07-12  205  	struct cxl_root_decoder *cxlrd;
f4ce1f766f1ebf Dan Williams     2021-10-29  206  	struct device *dev = ctx->dev;
3e23d17ce1980c Alison Schofield 2021-06-17  207  	struct acpi_cedt_cfmws *cfmws;
f9db85bfec0dcc Alison Schofield 2022-11-30  208  	cxl_calc_hb_fn cxl_calc_hb;
3e23d17ce1980c Alison Schofield 2021-06-17  209  	struct cxl_decoder *cxld;
419af595b11891 Dan Williams     2022-05-22  210  	unsigned int ways, i, ig;
974854ab072853 Dan Williams     2022-07-12  211  	struct resource *res;
419af595b11891 Dan Williams     2022-05-22  212  	int rc;
3e23d17ce1980c Alison Schofield 2021-06-17  213  
f4ce1f766f1ebf Dan Williams     2021-10-29  214  	cfmws = (struct acpi_cedt_cfmws *) header;
3e23d17ce1980c Alison Schofield 2021-06-17  215  
3e23d17ce1980c Alison Schofield 2021-06-17  216  	rc = cxl_acpi_cfmws_verify(dev, cfmws);
3e23d17ce1980c Alison Schofield 2021-06-17  217  	if (rc) {
3e23d17ce1980c Alison Schofield 2021-06-17  218  		dev_err(dev, "CFMWS range %#llx-%#llx not registered\n",
f4ce1f766f1ebf Dan Williams     2021-10-29  219  			cfmws->base_hpa,
f4ce1f766f1ebf Dan Williams     2021-10-29  220  			cfmws->base_hpa + cfmws->window_size - 1);
f4ce1f766f1ebf Dan Williams     2021-10-29  221  		return 0;
3e23d17ce1980c Alison Schofield 2021-06-17  222  	}
3e23d17ce1980c Alison Schofield 2021-06-17  223  
c99b2e8cf79616 Dave Jiang       2022-12-05  224  	rc = eiw_to_ways(cfmws->interleave_ways, &ways);
419af595b11891 Dan Williams     2022-05-22  225  	if (rc)
419af595b11891 Dan Williams     2022-05-22  226  		return rc;
83351ddb786b30 Dave Jiang       2022-12-05  227  	rc = eig_to_granularity(cfmws->granularity, &ig);
419af595b11891 Dan Williams     2022-05-22  228  	if (rc)
419af595b11891 Dan Williams     2022-05-22  229  		return rc;
419af595b11891 Dan Williams     2022-05-22  230  	for (i = 0; i < ways; i++)
a5c25802168993 Dan Williams     2021-09-08  231  		target_map[i] = cfmws->interleave_targets[i];
a5c25802168993 Dan Williams     2021-09-08  232  
974854ab072853 Dan Williams     2022-07-12  233  	res = kzalloc(sizeof(*res), GFP_KERNEL);
974854ab072853 Dan Williams     2022-07-12  234  	if (!res)
974854ab072853 Dan Williams     2022-07-12  235  		return -ENOMEM;
974854ab072853 Dan Williams     2022-07-12  236  
974854ab072853 Dan Williams     2022-07-12  237  	res->name = kasprintf(GFP_KERNEL, "CXL Window %d", ctx->id++);
974854ab072853 Dan Williams     2022-07-12  238  	if (!res->name)
974854ab072853 Dan Williams     2022-07-12  239  		goto err_name;
974854ab072853 Dan Williams     2022-07-12  240  
974854ab072853 Dan Williams     2022-07-12  241  	res->start = cfmws->base_hpa;
974854ab072853 Dan Williams     2022-07-12  242  	res->end = cfmws->base_hpa + cfmws->window_size - 1;
974854ab072853 Dan Williams     2022-07-12  243  	res->flags = IORESOURCE_MEM;
974854ab072853 Dan Williams     2022-07-12  244  
974854ab072853 Dan Williams     2022-07-12  245  	/* add to the local resource tracking to establish a sort order */
974854ab072853 Dan Williams     2022-07-12  246  	rc = insert_resource(cxl_res, res);
974854ab072853 Dan Williams     2022-07-12  247  	if (rc)
974854ab072853 Dan Williams     2022-07-12  248  		goto err_insert;
974854ab072853 Dan Williams     2022-07-12  249  
f9db85bfec0dcc Alison Schofield 2022-11-30  250  	if (cfmws->interleave_arithmetic == ACPI_CEDT_CFMWS_ARITHMETIC_MODULO)
f9db85bfec0dcc Alison Schofield 2022-11-30  251  		cxl_calc_hb = cxl_hb_modulo;
f9db85bfec0dcc Alison Schofield 2022-11-30  252  	else
f9db85bfec0dcc Alison Schofield 2022-11-30  253  		cxl_calc_hb = cxl_hb_xor;
f9db85bfec0dcc Alison Schofield 2022-11-30  254  
f9db85bfec0dcc Alison Schofield 2022-11-30  255  	cxlrd = cxl_root_decoder_alloc(root_port, ways, cxl_calc_hb);
0f157c7fa1a0e1 Dan Williams     2022-07-12  256  	if (IS_ERR(cxlrd))
f4ce1f766f1ebf Dan Williams     2021-10-29  257  		return 0;
3e23d17ce1980c Alison Schofield 2021-06-17  258  
0f157c7fa1a0e1 Dan Williams     2022-07-12  259  	cxld = &cxlrd->cxlsd.cxld;
48667f676189ec Dan Williams     2021-09-21  260  	cxld->flags = cfmws_to_decoder_flags(cfmws->restrictions);
5aa39a9165cfc8 Dan Williams     2023-06-14  261  	cxld->target_type = CXL_DECODER_HOSTONLYMEM;
e50fe01e1f2a4a Dan Williams     2022-05-18  262  	cxld->hpa_range = (struct range) {
974854ab072853 Dan Williams     2022-07-12  263  		.start = res->start,
974854ab072853 Dan Williams     2022-07-12  264  		.end = res->end,
e50fe01e1f2a4a Dan Williams     2022-05-18  265  	};
419af595b11891 Dan Williams     2022-05-22  266  	cxld->interleave_ways = ways;
e77483055c325f Dan Williams     2022-07-22  267  	/*
e77483055c325f Dan Williams     2022-07-22  268  	 * Minimize the x1 granularity to advertise support for any
e77483055c325f Dan Williams     2022-07-22  269  	 * valid region granularity
e77483055c325f Dan Williams     2022-07-22  270  	 */
e77483055c325f Dan Williams     2022-07-22  271  	if (ways == 1)
e77483055c325f Dan Williams     2022-07-22  272  		ig = CXL_DECODER_MIN_GRANULARITY;
419af595b11891 Dan Williams     2022-05-22  273  	cxld->interleave_granularity = ig;
48667f676189ec Dan Williams     2021-09-21  274  
f9db85bfec0dcc Alison Schofield 2022-11-30  275  	if (cfmws->interleave_arithmetic == ACPI_CEDT_CFMWS_ARITHMETIC_XOR) {
f9db85bfec0dcc Alison Schofield 2022-11-30  276  		if (ways != 1 && ways != 3) {
f9db85bfec0dcc Alison Schofield 2022-11-30  277  			cxims_ctx = (struct cxl_cxims_context) {
f9db85bfec0dcc Alison Schofield 2022-11-30  278  				.dev = dev,
f9db85bfec0dcc Alison Schofield 2022-11-30  279  				.cxlrd = cxlrd,
f9db85bfec0dcc Alison Schofield 2022-11-30  280  			};
f9db85bfec0dcc Alison Schofield 2022-11-30 @281  			rc = acpi_table_parse_cedt(ACPI_CEDT_TYPE_CXIMS,
f9db85bfec0dcc Alison Schofield 2022-11-30  282  						   cxl_parse_cxims, &cxims_ctx);
f9db85bfec0dcc Alison Schofield 2022-11-30  283  			if (rc < 0)
f9db85bfec0dcc Alison Schofield 2022-11-30  284  				goto err_xormap;
14628aec8415e4 Alison Schofield 2022-12-04  285  			if (!cxlrd->platform_data) {
14628aec8415e4 Alison Schofield 2022-12-04  286  				dev_err(dev, "No CXIMS for HBIG %u\n", ig);
14628aec8415e4 Alison Schofield 2022-12-04  287  				rc = -EINVAL;
14628aec8415e4 Alison Schofield 2022-12-04  288  				goto err_xormap;
14628aec8415e4 Alison Schofield 2022-12-04  289  			}
f9db85bfec0dcc Alison Schofield 2022-11-30  290  		}
f9db85bfec0dcc Alison Schofield 2022-11-30  291  	}
48667f676189ec Dan Williams     2021-09-21  292  	rc = cxl_decoder_add(cxld, target_map);
f9db85bfec0dcc Alison Schofield 2022-11-30  293  err_xormap:
48667f676189ec Dan Williams     2021-09-21  294  	if (rc)
48667f676189ec Dan Williams     2021-09-21  295  		put_device(&cxld->dev);
48667f676189ec Dan Williams     2021-09-21  296  	else
48667f676189ec Dan Williams     2021-09-21  297  		rc = cxl_decoder_autoremove(dev, cxld);
48667f676189ec Dan Williams     2021-09-21  298  	if (rc) {
4cf67d3cc9994a Breno Leitao     2023-07-14  299  		dev_err(dev, "Failed to add decode range: %pr", res);
91019b5bc7c2c5 Breno Leitao     2023-07-14  300  		return rc;
da6aafec3dca61 Alison Schofield 2021-06-17  301  	}
e50fe01e1f2a4a Dan Williams     2022-05-18  302  	dev_dbg(dev, "add: %s node: %d range [%#llx - %#llx]\n",
e50fe01e1f2a4a Dan Williams     2022-05-18  303  		dev_name(&cxld->dev),
e50fe01e1f2a4a Dan Williams     2022-05-18  304  		phys_to_target_node(cxld->hpa_range.start),
e50fe01e1f2a4a Dan Williams     2022-05-18  305  		cxld->hpa_range.start, cxld->hpa_range.end);
da6aafec3dca61 Alison Schofield 2021-06-17  306  
f4ce1f766f1ebf Dan Williams     2021-10-29  307  	return 0;
974854ab072853 Dan Williams     2022-07-12  308  
974854ab072853 Dan Williams     2022-07-12  309  err_insert:
974854ab072853 Dan Williams     2022-07-12  310  	kfree(res->name);
974854ab072853 Dan Williams     2022-07-12  311  err_name:
974854ab072853 Dan Williams     2022-07-12  312  	kfree(res);
974854ab072853 Dan Williams     2022-07-12  313  	return -ENOMEM;
da6aafec3dca61 Alison Schofield 2021-06-17  314  }
da6aafec3dca61 Alison Schofield 2021-06-17  315  

:::::: The code at line 281 was first introduced by commit
:::::: f9db85bfec0dcc01556a41d23aec47b866ab3569 cxl/acpi: Support CXL XOR Interleave Math (CXIMS)

:::::: TO: Alison Schofield <alison.schofield@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
