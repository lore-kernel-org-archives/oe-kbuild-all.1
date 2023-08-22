Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D0D2B544
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 17:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692727009; x=1724263009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qLjMrNAZhcAwr377uXbTD0md2h4hJtPnB9JstIGcK0w=;
  b=PiKJalIeIYN9L3Q0Q5S1IUTxosHjJNCqWjsMxdkXlUC5I4zcS16Nn3gR
   bgA9H6d9ve4zg2FuwkH4XNRa2fgukvTkR1O6J4KHsqLUrDSIS7wE4hsKv
   W2DpW1si2+sPsrDdd43fMg9BD4lex9o59EugjSLKkolom8x15xQB54N0M
   /Z0+VAaFHrBMZjN+u/e3RY6ZAvfQHMi04MgVF3ML9YTNqIJJK/rgY7B9/
   pEqsCCGHfmYrhSuPBGl+wcM4rXtBJUfqO9Orfz5AmA4iuNuZcjAGSxPNe
   zw9m///BkgV0KvTRjwYFOqF28rKwC2/MfVbPpMwi5HPmm9iADP1ai7wiN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437887924"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="437887924"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 10:56:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="686139921"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="686139921"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 22 Aug 2023 10:56:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYVcU-0000Ot-2w;
	Tue, 22 Aug 2023 17:56:46 +0000
Date: Wed, 23 Aug 2023 01:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Ninad Naik <quic_ninanaik@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] soc: qcom: Add driver to read secondary
 bootloader (XBL) log
Message-ID: <202308230111.OULKrBXJ-lkp@intel.com>
References: <20230822121512.8631-2-quic_ninanaik@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822121512.8631-2-quic_ninanaik@quicinc.com>

Hi Ninad,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5-rc7 next-20230822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ninad-Naik/soc-qcom-Add-driver-to-read-secondary-bootloader-XBL-log/20230822-201747
base:   linus/master
patch link:    https://lore.kernel.org/r/20230822121512.8631-2-quic_ninanaik%40quicinc.com
patch subject: [RFC PATCH 1/1] soc: qcom: Add driver to read secondary bootloader (XBL) log
config: parisc-randconfig-r112-20230823 (https://download.01.org/0day-ci/archive/20230823/202308230111.OULKrBXJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230111.OULKrBXJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230111.OULKrBXJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/qcom/dump_xbl_log.c:48:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *xbl_buf @@     got void * @@
   drivers/soc/qcom/dump_xbl_log.c:48:27: sparse:     expected void [noderef] __iomem *xbl_buf
   drivers/soc/qcom/dump_xbl_log.c:48:27: sparse:     got void *
>> drivers/soc/qcom/dump_xbl_log.c:82:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *data @@     got void [noderef] __iomem *xbl_buf @@
   drivers/soc/qcom/dump_xbl_log.c:82:33: sparse:     expected void *data
   drivers/soc/qcom/dump_xbl_log.c:82:33: sparse:     got void [noderef] __iomem *xbl_buf

vim +48 drivers/soc/qcom/dump_xbl_log.c

    23	
    24	static int map_addr_range(struct device_node **parent, const char *name,
    25				  struct xbl_log_data *xbl_data)
    26	{
    27		struct device_node *node;
    28		struct resource res;
    29		int ret;
    30	
    31		node = of_find_node_by_name(*parent, name);
    32		if (!node)
    33			return -ENODEV;
    34	
    35		ret = of_address_to_resource(node, 0, &res);
    36		if (ret) {
    37			dev_err(xbl_data->dev, "Failed to parse memory region\n");
    38			return ret;
    39		}
    40		of_node_put(node);
    41	
    42		if (!resource_size(&res)) {
    43			dev_err(xbl_data->dev, "Failed to parse memory region size\n");
    44			return -ENODEV;
    45		}
    46	
    47		xbl_data->buf_size = resource_size(&res) - 1;
  > 48		xbl_data->xbl_buf = devm_memremap(xbl_data->dev, res.start,
    49						  xbl_data->buf_size, MEMREMAP_WB);
    50		if (!xbl_data->xbl_buf) {
    51			dev_err(xbl_data->dev, "%s: memory remap failed\n", name);
    52			return -ENOMEM;
    53		}
    54	
    55		return 0;
    56	}
    57	
    58	static int xbl_log_probe(struct platform_device *pdev)
    59	{
    60		struct device *dev = &pdev->dev;
    61		struct xbl_log_data *xbl_data;
    62		struct device_node *parent;
    63		int ret;
    64	
    65		xbl_data = devm_kzalloc(dev, sizeof(*xbl_data), GFP_KERNEL);
    66		if (!xbl_data)
    67			return -ENOMEM;
    68	
    69		xbl_data->dev = &pdev->dev;
    70		platform_set_drvdata(pdev, xbl_data);
    71	
    72		parent = of_find_node_by_path("/reserved-memory");
    73		if (!parent) {
    74			dev_err(xbl_data->dev, "reserved-memory node missing\n");
    75			return -ENODEV;
    76		}
    77	
    78		ret = map_addr_range(&parent, "uefi-log", xbl_data);
    79		if (ret)
    80			goto put_node;
    81	
  > 82		xbl_data->dbg_data.data = xbl_data->xbl_buf;
    83		xbl_data->dbg_data.size = xbl_data->buf_size;
    84		xbl_data->dbg_file = debugfs_create_blob("xbl_log", 0400, NULL,
    85							 &xbl_data->dbg_data);
    86		if (IS_ERR(xbl_data->dbg_file)) {
    87			dev_err(xbl_data->dev, "failed to create debugfs entry\n");
    88			ret = PTR_ERR(xbl_data->dbg_file);
    89		}
    90	
    91	put_node:
    92		of_node_put(parent);
    93		return ret;
    94	}
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
