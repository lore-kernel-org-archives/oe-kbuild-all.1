Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD3119ABAB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 22:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739660148; cv=none; b=P+O6AArMIdAibKZTt37pVHkie85enGq45EQtG+PQmrkPP/FZR4gJkUJTbWCgsfbP2wFuS6n3zueMbdSf/pU31h+UKXZ+8n4dN5J0Y5iVzdjInHE8BLqEmTJq2n4F/KnrW4yWLEx7Dmb010zcFpPARHzlpp+0EKzvLLvgsHo3STw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739660148; c=relaxed/simple;
	bh=NnhSSsPPl/dmbApfLi5E0unYWrORZOdIfSut+2DnTrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4wz2ysz3D8D3yRZJu/MylsIF4RA8KjjbQ1iM93fz3yDdMtitoC35XA7GFEDBQVQ60IWq9Iqa3KooB8/1WHG/vX0DFgBjrwwT/kMLBAI8hzNx1RSB6vSXrzU8gcNcjQ6Mlci1DdnX1373VJrNQQQIBeaf4Mm96G6gxXt5ZoEyLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXlIXOsv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXlIXOsv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739660146; x=1771196146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NnhSSsPPl/dmbApfLi5E0unYWrORZOdIfSut+2DnTrY=;
  b=IXlIXOsvd8d9aUms5He9B/NvuMWx1FWWJc28WNmSW/Tg8zv7beenZAZG
   h3Fq3fElcYbGGoMvASBVdJlR6WnlzkZjhZ+liO/htEXvs3GhnMS8aZqbw
   loG9HCzfE8dMk9LzL16tfqiGh6L4UKSDQ2nkMDOjLmGx/qHGmKXcZs1M2
   0IjWLlwqkls1o+WNhrXfYT5QYAhOCcUKFfWUJWn+T9KszTuXnUW7jWCCL
   V/9qocD1gekas2ppOATBO4PIp4/6twdaCWG+yBp8Z9XOVd1H5gojueFyO
   tmvTNok0JyEJYQF8lJmRDV+iLUbGJvj2XhYPbRq9N7m7khJOueU0t9Q5X
   g==;
X-CSE-ConnectionGUID: /AC9bTDGQbSUpR7IABFrUw==
X-CSE-MsgGUID: F+GVPqAPRRWvIOmMjCBc2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="40650620"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="40650620"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 14:55:45 -0800
X-CSE-ConnectionGUID: 3tX1Z5hSS/+hd7M0WEnm2Q==
X-CSE-MsgGUID: 5zT8fF7dQDK3uxJSDMRlLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="113959827"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Feb 2025 14:55:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjR4Y-001BJL-0X;
	Sat, 15 Feb 2025 22:55:42 +0000
Date: Sun, 16 Feb 2025 06:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/3] ASoC: tas2781: Support dsp firmware Alpha and
 Beta seaies
Message-ID: <202502160632.u0zxG7yD-lkp@intel.com>
References: <20250212145601.1279-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212145601.1279-1-shenghao-ding@ti.com>

Hi Shenghao,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.14-rc2 next-20250214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenghao-Ding/ASoC-tas2781-Support-dsp-firmware-Alpha-and-Beta-seaies/20250212-230044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250212145601.1279-1-shenghao-ding%40ti.com
patch subject: [PATCH v1 1/3] ASoC: tas2781: Support dsp firmware Alpha and Beta seaies
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250216/202502160632.u0zxG7yD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502160632.u0zxG7yD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502160632.u0zxG7yD-lkp@intel.com/

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

bb5f86ea50ffb29 Baojun Xu 2024-12-16  361  
bb5f86ea50ffb29 Baojun Xu 2024-12-16  362  /* fixed m68k compiling issue: mapping table can save code field */
bb5f86ea50ffb29 Baojun Xu 2024-12-16  363  static unsigned char map_dev_idx(struct tasdevice_fw *tas_fmw,
bb5f86ea50ffb29 Baojun Xu 2024-12-16  364  	struct tasdev_blk *block)
bb5f86ea50ffb29 Baojun Xu 2024-12-16  365  {
bb5f86ea50ffb29 Baojun Xu 2024-12-16  366  	struct blktyp_devidx_map *p =
bb5f86ea50ffb29 Baojun Xu 2024-12-16  367  		(struct blktyp_devidx_map *)non_ppc3_mapping_table;
bb5f86ea50ffb29 Baojun Xu 2024-12-16  368  	struct tasdevice_dspfw_hdr *fw_hdr = &tas_fmw->fw_hdr;
bb5f86ea50ffb29 Baojun Xu 2024-12-16  369  	struct tasdevice_fw_fixed_hdr *fw_fixed_hdr = &fw_hdr->fixed_hdr;
bb5f86ea50ffb29 Baojun Xu 2024-12-16  370  	int i, n = ARRAY_SIZE(non_ppc3_mapping_table);
bb5f86ea50ffb29 Baojun Xu 2024-12-16  371  	unsigned char dev_idx = 0;
bb5f86ea50ffb29 Baojun Xu 2024-12-16  372  
bb5f86ea50ffb29 Baojun Xu 2024-12-16 @373  	if (fw_fixed_hdr->ppcver >= PPC3_VERSION_TAS2781) {
bb5f86ea50ffb29 Baojun Xu 2024-12-16  374  		p = (struct blktyp_devidx_map *)ppc3_tas2781_mapping_table;
bb5f86ea50ffb29 Baojun Xu 2024-12-16  375  		n = ARRAY_SIZE(ppc3_tas2781_mapping_table);
bb5f86ea50ffb29 Baojun Xu 2024-12-16 @376  	} else if (fw_fixed_hdr->ppcver >= PPC3_VERSION) {
bb5f86ea50ffb29 Baojun Xu 2024-12-16  377  		p = (struct blktyp_devidx_map *)ppc3_mapping_table;
bb5f86ea50ffb29 Baojun Xu 2024-12-16  378  		n = ARRAY_SIZE(ppc3_mapping_table);
bb5f86ea50ffb29 Baojun Xu 2024-12-16  379  	}
bb5f86ea50ffb29 Baojun Xu 2024-12-16  380  
bb5f86ea50ffb29 Baojun Xu 2024-12-16  381  	for (i = 0; i < n; i++) {
bb5f86ea50ffb29 Baojun Xu 2024-12-16  382  		if (block->type == p[i].blktyp) {
bb5f86ea50ffb29 Baojun Xu 2024-12-16  383  			dev_idx = p[i].dev_idx;
bb5f86ea50ffb29 Baojun Xu 2024-12-16  384  			break;
bb5f86ea50ffb29 Baojun Xu 2024-12-16  385  		}
bb5f86ea50ffb29 Baojun Xu 2024-12-16  386  	}
bb5f86ea50ffb29 Baojun Xu 2024-12-16  387  
bb5f86ea50ffb29 Baojun Xu 2024-12-16  388  	return dev_idx;
bb5f86ea50ffb29 Baojun Xu 2024-12-16  389  }
bb5f86ea50ffb29 Baojun Xu 2024-12-16  390  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
