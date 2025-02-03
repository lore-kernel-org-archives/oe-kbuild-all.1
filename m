Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C521D95A9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 07:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738567368; cv=none; b=abZrl6QLdchjnpS0FyF4LsGJ7mRrAZI+RQdJS8hu/Pc8qWg7p4/CCZ9RstFBKKcZDtFyuxXF1p0NmSX/PWoLJdi9YkEaSXTn70jyC5A24RP4u69NIOQWV1hw26zoDt4LRal1z684v+MmdAQVjMdYd7J2GLXOxwlLdU2A6AtpnSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738567368; c=relaxed/simple;
	bh=iUgyJlyvA+uVELchAG6zPI9SQ+pAL66XQBBS/zeAl2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h6a60dT1xOwqCa8TA3GnXl8YLoOZ8u2mfo02q8fjYyF20Ek9r9Uo6ubuNg8mu80AK9OZ2TUTbOUR9X8IT++rkTKrKx/6RGlFnRZH54zokYsiiIpzUxG2kS0uSCNib1IRfgNCqe7BjBEnqT3Dk1fV4uq5XJomFIptiydXAn0UsqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mk5TsmXt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mk5TsmXt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738567366; x=1770103366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iUgyJlyvA+uVELchAG6zPI9SQ+pAL66XQBBS/zeAl2Y=;
  b=Mk5TsmXtby3uTCfL1/QFYPzu3AQNv1JCrohQH0Z9RqyYzoFEGmylfhZH
   oedCBpUoleVps7XwLV0Qg837zKR/tVf2IZJqTJR4ww5OdfXK4lBTBHun5
   8de4WlJBkbjrd/vjrcKusMNiEk+uH3BCkYHx4/MvBefJlALvO7WirFcTR
   EHGcJOGak+l+1RopZWlzCK6Cid98oWr86o9hhPYVKacGml5fLkf+mu+dm
   WsKNpeFDlQlWAvN/b9Rs7soxGbvggWuNJbmbjKPQUbWvaMUK2YQxIK/U4
   bQ3k7qU29n2HrEQXi2SNFmDja1YCKBpeLY2nAUmhe40bD7Am9BTWQQYPC
   A==;
X-CSE-ConnectionGUID: DO23j8YxQa2v6Mwgux5oIA==
X-CSE-MsgGUID: 4QYMIp8TRGyjBLXuc9eOXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="39313276"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39313276"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 23:22:45 -0800
X-CSE-ConnectionGUID: HlBU0BktSFml0Z0Q1Twi0Q==
X-CSE-MsgGUID: 0RWG1MlYT+qYYDSSTjs/ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110657240"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Feb 2025 23:22:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teqn4-000qbb-0A;
	Mon, 03 Feb 2025 07:22:42 +0000
Date: Mon, 3 Feb 2025 15:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:fileaMnh6H 2/9]
 sound/pci/hda/tas2781_spi_fwlib.c:373:37: error: 'PPC3_VERSION_TAS2781'
 undeclared; did you mean 'PPC3_VERSION_BASE'?
Message-ID: <202502031529.bBIBN8Qx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileaMnh6H
head:   500aea53057a952d584cbe1fa461c7adaaa9f655
commit: 66789ed82adcd9c42118004e0fc5ff2b3d72d959 [2/9] ASoC: tas2781: Support dsp firmware Alpha and Beta seaies
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250203/202502031529.bBIBN8Qx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502031529.bBIBN8Qx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502031529.bBIBN8Qx-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/pci/hda/tas2781_spi_fwlib.c: In function 'map_dev_idx':
>> sound/pci/hda/tas2781_spi_fwlib.c:373:37: error: 'PPC3_VERSION_TAS2781' undeclared (first use in this function); did you mean 'PPC3_VERSION_BASE'?
     373 |         if (fw_fixed_hdr->ppcver >= PPC3_VERSION_TAS2781) {
         |                                     ^~~~~~~~~~~~~~~~~~~~
         |                                     PPC3_VERSION_BASE
   sound/pci/hda/tas2781_spi_fwlib.c:373:37: note: each undeclared identifier is reported only once for each function it appears in
>> sound/pci/hda/tas2781_spi_fwlib.c:376:44: error: 'PPC3_VERSION' undeclared (first use in this function); did you mean 'GCC_VERSION'?
     376 |         } else if (fw_fixed_hdr->ppcver >= PPC3_VERSION) {
         |                                            ^~~~~~~~~~~~
         |                                            GCC_VERSION
   sound/pci/hda/tas2781_spi_fwlib.c: In function 'dspfw_default_callback':
   sound/pci/hda/tas2781_spi_fwlib.c:1608:31: error: 'PPC3_VERSION' undeclared (first use in this function); did you mean 'GCC_VERSION'?
    1608 |                 if (ppcver >= PPC3_VERSION) {
         |                               ^~~~~~~~~~~~
         |                               GCC_VERSION


vim +373 sound/pci/hda/tas2781_spi_fwlib.c

bb5f86ea50ffb2 Baojun Xu 2024-12-16  361  
bb5f86ea50ffb2 Baojun Xu 2024-12-16  362  /* fixed m68k compiling issue: mapping table can save code field */
bb5f86ea50ffb2 Baojun Xu 2024-12-16  363  static unsigned char map_dev_idx(struct tasdevice_fw *tas_fmw,
bb5f86ea50ffb2 Baojun Xu 2024-12-16  364  	struct tasdev_blk *block)
bb5f86ea50ffb2 Baojun Xu 2024-12-16  365  {
bb5f86ea50ffb2 Baojun Xu 2024-12-16  366  	struct blktyp_devidx_map *p =
bb5f86ea50ffb2 Baojun Xu 2024-12-16  367  		(struct blktyp_devidx_map *)non_ppc3_mapping_table;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  368  	struct tasdevice_dspfw_hdr *fw_hdr = &tas_fmw->fw_hdr;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  369  	struct tasdevice_fw_fixed_hdr *fw_fixed_hdr = &fw_hdr->fixed_hdr;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  370  	int i, n = ARRAY_SIZE(non_ppc3_mapping_table);
bb5f86ea50ffb2 Baojun Xu 2024-12-16  371  	unsigned char dev_idx = 0;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  372  
bb5f86ea50ffb2 Baojun Xu 2024-12-16 @373  	if (fw_fixed_hdr->ppcver >= PPC3_VERSION_TAS2781) {
bb5f86ea50ffb2 Baojun Xu 2024-12-16  374  		p = (struct blktyp_devidx_map *)ppc3_tas2781_mapping_table;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  375  		n = ARRAY_SIZE(ppc3_tas2781_mapping_table);
bb5f86ea50ffb2 Baojun Xu 2024-12-16 @376  	} else if (fw_fixed_hdr->ppcver >= PPC3_VERSION) {
bb5f86ea50ffb2 Baojun Xu 2024-12-16  377  		p = (struct blktyp_devidx_map *)ppc3_mapping_table;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  378  		n = ARRAY_SIZE(ppc3_mapping_table);
bb5f86ea50ffb2 Baojun Xu 2024-12-16  379  	}
bb5f86ea50ffb2 Baojun Xu 2024-12-16  380  
bb5f86ea50ffb2 Baojun Xu 2024-12-16  381  	for (i = 0; i < n; i++) {
bb5f86ea50ffb2 Baojun Xu 2024-12-16  382  		if (block->type == p[i].blktyp) {
bb5f86ea50ffb2 Baojun Xu 2024-12-16  383  			dev_idx = p[i].dev_idx;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  384  			break;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  385  		}
bb5f86ea50ffb2 Baojun Xu 2024-12-16  386  	}
bb5f86ea50ffb2 Baojun Xu 2024-12-16  387  
bb5f86ea50ffb2 Baojun Xu 2024-12-16  388  	return dev_idx;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  389  }
bb5f86ea50ffb2 Baojun Xu 2024-12-16  390  

:::::: The code at line 373 was first introduced by commit
:::::: bb5f86ea50ffb292f42eb1ebdb99991d5c5ac3ba ALSA: hda/tas2781: Add tas2781 hda SPI driver

:::::: TO: Baojun Xu <baojun.xu@ti.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
