Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FE6C8DF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 14:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727532681; cv=none; b=nh4+hPlaOYyTMai52yPjfn71DKDI/2Kska/eAIgl2LZrLZzKa5KS9s850g9NG19e2svcjMatKTLSLAynYl8WTgfErb7kcrI9qbl/YUiytOJvBLbLTYLUU/upfAZpvm2dt2FWKm5IgUj+8gsxrgIjuStlWoIxNoGA9Us8wKW/vHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727532681; c=relaxed/simple;
	bh=j4WtEn/55tmD7VUXJK4I8n3PSu3KccGovCgkSIn8UQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ifhW5xUb2p/XKzsokfvEa3p7onE83lAd19IJgn+94uVhB37L9g66DG9AobYM9NDzKl/0mjPprmX70pNOQQSwkwYBuCBgOrySDynViIRlxQsz90/m5J1AZn2P7yY4crO9B3ZjhYtqHHnFDDhIXAwblzQsEYHNt61BP419e8fF+j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VEFuLMbm; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEFuLMbm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727532679; x=1759068679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j4WtEn/55tmD7VUXJK4I8n3PSu3KccGovCgkSIn8UQI=;
  b=VEFuLMbmGBnKS0HD5VL6UYLv2pq2ol7PVZ9PFPHrNYAInSgCfA1ovTAR
   SE/PPDD52jZxI9ED53vFOK66DKpw+8kjg2VZ1Xtt/fJ19cpqoVsRvRMDJ
   Fqb8X+TTxKMR0VdkSMnsxDYbTtEsOq3F3EIrXLvKCUsefQycYd7/73j05
   5D3WQW+ratefcYzh8eRrWa9GoowHQsrpK4dVXSL1iU1rROXMN1slHC7JH
   v7GJiAKaQbNhR1TEyUj2dfyOw7QaYXU5YjGTkPnfIVOKoATmdGlM5qSsp
   xi7T50QIcrsIjfwgoApPun+HEH61wirPJrKgPhRo3bGjPOOvu52bHtQ1I
   g==;
X-CSE-ConnectionGUID: Y5G2/4nyTheGu/kSMPeDsQ==
X-CSE-MsgGUID: TBykPT+xTbKeKPIr7Vnt3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26829361"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26829361"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 07:11:17 -0700
X-CSE-ConnectionGUID: Nmgwyl7MQFiMeRf1Bvc5yQ==
X-CSE-MsgGUID: aTDlikqQQ/G7cvPPlvkhnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73139377"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Sep 2024 07:11:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suYAE-000NJU-16;
	Sat, 28 Sep 2024 14:11:14 +0000
Date: Sat, 28 Sep 2024 22:11:07 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 2639/16788]
 drivers/i2c/busses/i2c-imx.c:156:34: warning: 'pinmux_of_match' defined but
 not used
Message-ID: <202409282252.wvHzPVWE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: f97b8a6eae07fc456fd0b870cdf2974ce94f3729 [2639/16788] i2c: imx: implement bus recovery with gpio for Layerscape
config: parisc-randconfig-001-20240928 (https://download.01.org/0day-ci/archive/20240928/202409282252.wvHzPVWE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282252.wvHzPVWE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282252.wvHzPVWE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-imx.c: In function 'i2c_imx_xfer_common':
   drivers/i2c/busses/i2c-imx.c:1342:14: warning: unused variable 'enable_runtime_pm' [-Wunused-variable]
    1342 |         bool enable_runtime_pm = false;
         |              ^~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-imx.c: At top level:
   drivers/i2c/busses/i2c-imx.c:1889:12: warning: 'i2c_imx_resume' defined but not used [-Wunused-function]
    1889 | static int i2c_imx_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-imx.c:1883:12: warning: 'i2c_imx_suspend' defined but not used [-Wunused-function]
    1883 | static int i2c_imx_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-imx.c:156:34: warning: 'pinmux_of_match' defined but not used [-Wunused-const-variable=]
     156 | static const struct of_device_id pinmux_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~


vim +/pinmux_of_match +156 drivers/i2c/busses/i2c-imx.c

   155	
 > 156	static const struct of_device_id pinmux_of_match[] = {
   157		{ .compatible = "fsl,ls1012a-i2c", .data = &ls1012a_pinmux_cfg},
   158		{ .compatible = "fsl,ls1043a-i2c", .data = &ls1043a_pinmux_cfg},
   159		{ .compatible = "fsl,ls1046a-i2c", .data = &ls1046a_pinmux_cfg},
   160		{},
   161	};
   162	MODULE_DEVICE_TABLE(of, pinmux_of_match);
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
