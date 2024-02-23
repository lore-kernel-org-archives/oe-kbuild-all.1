Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C3B42ABC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 09:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708680371; cv=none; b=iJkw0beUFUNsKYjWC9omUFLw2T8+gDLUiKAUYxixjHhTX0bcnwKBZDyMMF+cjTROi58NRzl6u7DcSyGGO+HEe9UocLVNYJxiS3n2yKJLS4Y3oS2bJcSjmKIpMLqQAD7qsKRUl22NpsknGa6G/8FW9c2ZgSnBF57ZKUg0fKcnGfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708680371; c=relaxed/simple;
	bh=Z5WipXfA4SzsAp5MsAQExPMbvhM3nYt3Qdd3KyHV8QI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SbwgABF3fb2dw9RZSKvdglLX/RPruTpHLR0sLRjsU7kY0SCHHPmqRSc/pXt+6BA0rfzmKWr1aT5aUqxLxDnSEF3TnfGDvv9BklTeumxc2sb1lJyhIxATyZSIt7oQiMieqtZ3IbzRWhD3DG9D2S7a0IxCZuXtmTb6bEmLm2jLlTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVY1EEho; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVY1EEho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708680371; x=1740216371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z5WipXfA4SzsAp5MsAQExPMbvhM3nYt3Qdd3KyHV8QI=;
  b=mVY1EEholAcRAnfglczdVZUUFDwb4Jomq5fUs/LBVeyEp8b5ct3sRoUX
   8YLMkCAV+15UWnQWb667Ghrwt8kpS1/Nod9eBpKvGO1ISx7nnNI126Lhz
   t2EsY0fO/uf7Y/4pp8bbUdeaEpRfqu/U+DLNt6av4aNzx+uFLo6mX+0el
   D+UmNoDcLVcIWBqI4JSWbHNyNiJOHQ169wBzaGlNXPRzKMByfhj8JZCAz
   +14k6FJ0TDG5GiR2+vxaTLfHn4FMndYwfTC8NHEvXpNaF6Nx8oaxZMGui
   Hk8bfNjmG454cR31LRpmNoxHhrJAGa3j4lDGzmrc41q9dZvT3bRqZv5u8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="14111788"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="14111788"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 01:26:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="10546464"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 23 Feb 2024 01:26:08 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdRoJ-0007H4-0t;
	Fri, 23 Feb 2024 09:25:50 +0000
Date: Fri, 23 Feb 2024 17:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [broonie-ci:20240221_rf_alsa_cs35l56_apply_calibration_from_efi 9/9]
 sound/soc/codecs/cs-amp-lib.c:131: undefined reference to
 `efi_status_to_err'
Message-ID: <202402231748.bNjPdYeM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20240221_rf_alsa_cs35l56_apply_calibration_from_efi
head:   2a7d62930c8ddceb404f3de3afe3754527fd576c
commit: 2a7d62930c8ddceb404f3de3afe3754527fd576c [9/9] ASoC: cs-amp-lib: Add KUnit test for calibration helpers
config: i386-randconfig-012-20240223 (https://download.01.org/0day-ci/archive/20240223/202402231748.bNjPdYeM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402231748.bNjPdYeM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402231748.bNjPdYeM-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/codecs/cs-amp-lib.o: in function `cs_amp_get_cal_efi_buffer':
>> sound/soc/codecs/cs-amp-lib.c:131: undefined reference to `efi_status_to_err'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +131 sound/soc/codecs/cs-amp-lib.c

bda99c4e364bc10 Richard Fitzgerald 2024-02-21  105  
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  106  static struct cirrus_amp_efi_data *cs_amp_get_cal_efi_buffer(struct device *dev)
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  107  {
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  108  	struct cirrus_amp_efi_data *efi_data;
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  109  	unsigned long data_size = 0;
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  110  	u8 *data;
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  111  	efi_status_t status;
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  112  	int ret;
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  113  
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  114  	/* Get real size of UEFI variable */
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  115  	status = cs_amp_get_efi_variable(CS_AMP_CAL_NAME, &CS_AMP_CAL_GUID, &data_size, NULL);
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  116  	if (status != EFI_BUFFER_TOO_SMALL)
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  117  		return ERR_PTR(-ENOENT);
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  118  
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  119  	if (data_size < sizeof(*efi_data)) {
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  120  		dev_err(dev, "EFI cal variable truncated\n");
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  121  		return ERR_PTR(-EOVERFLOW);
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  122  	}
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  123  
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  124  	/* Get variable contents into buffer */
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  125  	data = kmalloc(data_size, GFP_KERNEL);
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  126  	if (!data)
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  127  		return ERR_PTR(-ENOMEM);
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  128  
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  129  	status = cs_amp_get_efi_variable(CS_AMP_CAL_NAME, &CS_AMP_CAL_GUID, &data_size, data);
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  130  	if (status != EFI_SUCCESS) {
bda99c4e364bc10 Richard Fitzgerald 2024-02-21 @131  		ret = efi_status_to_err(status);
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  132  		goto err;
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  133  	}
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  134  
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  135  	efi_data = (struct cirrus_amp_efi_data *)data;
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  136  	dev_dbg(dev, "Calibration: Size=%d, Amp Count=%d\n", efi_data->size, efi_data->count);
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  137  
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  138  	if ((efi_data->count > 128) ||
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  139  	    offsetof(struct cirrus_amp_efi_data, data[efi_data->count]) > data_size) {
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  140  		dev_err(dev, "EFI cal variable truncated\n");
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  141  		ret = -EOVERFLOW;
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  142  		goto err;
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  143  	}
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  144  
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  145  	return efi_data;
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  146  
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  147  err:
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  148  	kfree(data);
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  149  	dev_err(dev, "Failed to read calibration data from EFI: %d\n", ret);
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  150  
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  151  	return ERR_PTR(ret);
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  152  }
bda99c4e364bc10 Richard Fitzgerald 2024-02-21  153  

:::::: The code at line 131 was first introduced by commit
:::::: bda99c4e364bc10c4878c4c9f2239d6d082b69eb ASoC: cs-amp-lib: Add helpers for factory calibration data

:::::: TO: Richard Fitzgerald <rf@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
