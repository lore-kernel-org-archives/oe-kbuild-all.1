Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059022472AE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 21:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790543273; cv=none; b=bcF6A78QIQZR9QoXi5kZf0bJq5J7pdsly4VwzwNct+JXaLhY8MRBi5PuBW7dEKRIn0uvR+lTUbiCAhT+oCScOzcOPMJR0QV+bqepUCMu8m3BVXVdYhjbiwzstcG4+MtM4YA0sFTEn+fT7Fu8kCw0iIJ1LcWAqzuM8ZgOvoqx+Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790543273; c=relaxed/simple;
	bh=KORdfDSGIEMYU7IZaUWy6X9r22s98dYJcsJE6FWzkfU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B8JWxRKVEi3Us41Ku1FRrzOf1j0LbkXPDq/PDWs1DrRtwFpQTQ+v7j434rKMmUAYzypL6KkhZx31kuNwStdUi3j2KQsCWJvNsIdLjyv+xFu9vPNuFODJrjgoyuHPxnK1klX4rA+iWeiX4/FYwIA4i4W5G4sYx4HZyR67II1KbH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TrM/aPOK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TrM/aPOK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790543272; x=1822079272;
  h=date:from:to:cc:subject:message-id;
  bh=KORdfDSGIEMYU7IZaUWy6X9r22s98dYJcsJE6FWzkfU=;
  b=TrM/aPOKy30uxg04p33aqKByOsGSdugMbsBaVRZ6Ml6Pz3P1hGsy7bn9
   9b0+kjSLypBqUyY6f0JQHN81nrLFqQv4Db5kwYTwT1cZ+l4SOKPpz8GLc
   YFAhOztQD3QUdwW3KdIJEkIzVjJy2F3xIvWlYRGo2NxM1BYE7xI6EEDLD
   GXqAoIFh/zb2T/L4ElHEOq+0uqnMVzvEJIXSUUhaqygFil5JZtdq7sErp
   RiMPUSxhpnzEizixUOJiewJ2pKVDwKLlzz3BicGAHcMNMnNQvJUdALhZs
   D4DLDKCKAhD6AstMHl42t8chFRoPOS9CZ+LG/6hatjoTGsLBC9utHIXcN
   A==;
X-CSE-ConnectionGUID: Fmz/zXkVS2GvJTXpBsQ5PA==
X-CSE-MsgGUID: 0j5GZnW+RZ2NLqwkh2MyfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="108735815"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="108735815"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 14:07:51 -0700
X-CSE-ConnectionGUID: eQsAI9dGTBysnoR/EAcb5w==
X-CSE-MsgGUID: SBKpHdSNSr+sE1ZD759d0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="274397211"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Sep 2026 14:07:49 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAw66-00000000NAm-3ck4;
	Sun, 27 Sep 2026 21:07:46 +0000
Date: Mon, 28 Sep 2026 05:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [xilinx-xlnx:master 1071/1090]
 drivers/remoteproc/amd_mbv_bram_rproc.c:73:36: error:
 'rproc_mem_entry_ioremap_wc' undeclared; did you mean 'rproc_mem_entry_init'?
Message-ID: <202609280429.w3wWX2w0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   235bd5e49f53bfea681cfd6c489ca1e0eab0b061
commit: dfff428d04b81b2cfd96007517cf9c85a38f427f [1071/1090] remoteproc: Add AMD MicroBlaze/V BRAM-based remote processor driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260928/202609280429.w3wWX2w0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609280429.w3wWX2w0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609280429.w3wWX2w0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/remoteproc/amd_mbv_bram_rproc.c: In function 'amd_bram_rproc_prepare':
>> drivers/remoteproc/amd_mbv_bram_rproc.c:73:36: error: 'rproc_mem_entry_ioremap_wc' undeclared (first use in this function); did you mean 'rproc_mem_entry_init'?
      73 |                                    rproc_mem_entry_ioremap_wc,
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    rproc_mem_entry_init
   drivers/remoteproc/amd_mbv_bram_rproc.c:73:36: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/remoteproc/amd_mbv_bram_rproc.c:74:36: error: 'rproc_mem_entry_iounmap' undeclared (first use in this function); did you mean 'rproc_mem_entry_init'?
      74 |                                    rproc_mem_entry_iounmap,
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    rproc_mem_entry_init
   drivers/remoteproc/amd_mbv_bram_rproc.c: In function 'amd_bram_rproc_parse_fw':
>> drivers/remoteproc/amd_mbv_bram_rproc.c:129:9: error: implicit declaration of function 'rproc_elf_load_rsc_table_optional'; did you mean 'rproc_elf_load_rsc_table'? [-Wimplicit-function-declaration]
     129 |         rproc_elf_load_rsc_table_optional(rproc, fw, dev_dbg,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         rproc_elf_load_rsc_table
>> drivers/remoteproc/amd_mbv_bram_rproc.c:129:54: error: 'dev_dbg' undeclared (first use in this function)
     129 |         rproc_elf_load_rsc_table_optional(rproc, fw, dev_dbg,
         |                                                      ^~~~~~~


vim +73 drivers/remoteproc/amd_mbv_bram_rproc.c

    40	
    41	static int amd_bram_rproc_prepare(struct rproc *rproc)
    42	{
    43		struct amd_bram_rproc *priv = rproc->priv;
    44		struct rproc_mem_entry *mem;
    45		struct resource res;
    46		u64 da, size;
    47		int ret;
    48	
    49		ret = of_property_read_reg(priv->dev->of_node, 0, &da, &size);
    50		if (ret) {
    51			dev_err(priv->dev, "failed to parse executable memory reg\n");
    52			return ret;
    53		}
    54	
    55		if (!size || size > U32_MAX) {
    56			dev_err(priv->dev, "invalid executable memory size\n");
    57			return -EINVAL;
    58		}
    59	
    60		if (da > U32_MAX) {
    61			dev_err(priv->dev, "invalid executable memory address\n");
    62			return -EINVAL;
    63		}
    64	
    65		ret = of_address_to_resource(priv->dev->of_node, 0, &res);
    66		if (ret) {
    67			dev_err(priv->dev, "failed to translate executable memory reg\n");
    68			return ret;
    69		}
    70	
    71		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
    72					   resource_size(&res), da,
  > 73					   rproc_mem_entry_ioremap_wc,
  > 74					   rproc_mem_entry_iounmap,
    75					   dev_name(priv->dev));
    76		if (!mem)
    77			return -ENOMEM;
    78	
    79		rproc_add_carveout(rproc, mem);
    80		rproc_coredump_add_segment(rproc, da, resource_size(&res));
    81	
    82		return 0;
    83	}
    84	
    85	static int amd_bram_rproc_start(struct rproc *rproc)
    86	{
    87		struct amd_bram_rproc *priv = rproc->priv;
    88		int ret;
    89	
    90		/* Enable clock before releasing reset */
    91		ret = clk_prepare_enable(priv->clk);
    92		if (ret) {
    93			dev_err(priv->dev, "failed to enable clock: %d\n", ret);
    94			return ret;
    95		}
    96	
    97		/* Deassert reset and let the processor run. */
    98		ret = gpiod_set_value_cansleep(priv->reset, 0);
    99		if (ret) {
   100			dev_err(priv->dev, "failed to deassert reset: %d\n", ret);
   101			clk_disable_unprepare(priv->clk);
   102			return ret;
   103		}
   104	
   105		return 0;
   106	}
   107	
   108	static int amd_bram_rproc_stop(struct rproc *rproc)
   109	{
   110		struct amd_bram_rproc *priv = rproc->priv;
   111		int ret;
   112	
   113		/* Assert reset before disabling the processor clock. */
   114		ret = gpiod_set_value_cansleep(priv->reset, 1);
   115		if (ret) {
   116			dev_err(priv->dev, "failed to assert reset: %d\n", ret);
   117			return ret;
   118		}
   119	
   120		/* Disable clock after asserting reset */
   121		clk_disable_unprepare(priv->clk);
   122	
   123		return 0;
   124	}
   125	
   126	static int amd_bram_rproc_parse_fw(struct rproc *rproc,
   127					   const struct firmware *fw)
   128	{
 > 129		rproc_elf_load_rsc_table_optional(rproc, fw, dev_dbg,
   130						  "no resource table found\n");
   131		return 0;
   132	}
   133	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
