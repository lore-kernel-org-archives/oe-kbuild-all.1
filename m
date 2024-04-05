Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA1C256D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 01:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712280684; cv=none; b=MpDTyIDioKkqWjpk0/qgceinxviQtFj3/CTLnMW/2oQYowu+NqA5PLOBeNwEcnsdg1HXvI9rMHuXjlQinhdMgqE39kf95oMt+ouKV85mfKgNEOEqAuC8ynatyBHT5fG7Bwb5Hn+2XMlXzvMz1EcI3jwZl7T72vcBI1ExHkAOioI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712280684; c=relaxed/simple;
	bh=DkRLFPOQiPoqydkw1504qxi84eiAjRnNE4Wks5H5yAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VBngYPDy/0/+wXhnYy74URyK2lSfOwx+hbKUTi2M3NluTpYCw8ToHoS+uZf0SRgV4usMsdtEgDSrAIYQE7dL0Mtr9xqZIkdrUyNNOMWmgRN+FNo0fIEIPOs44YHWn5TF8Ictr/xRV6eObLFVD3hxzvj2fpWGpKdrPAIBj6Yti4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FuCbZrKe; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FuCbZrKe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712280681; x=1743816681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DkRLFPOQiPoqydkw1504qxi84eiAjRnNE4Wks5H5yAg=;
  b=FuCbZrKeDoFwpmrP8TVWuwxAXsk0uV50NcXzqsmYzABTST30NJ0Nr5gT
   KOYgUdA2A9FBT4QyqANQfabuYc203cCeAFIPuJPv6jXXDRsYJriGj7pv7
   ZDfr+TJFBwKCw/JSMWuHC2PKhccvH0lD66ctRxIJt+Ph9v7U+5CQC/hFe
   EF5OhbsDX7lEb5+4N572Q6nbV7AzChSvKUfpqpbiJuA+UeQGqVbyCmQGc
   zBpTeQyWJREgMyyj05+oYncC1x8Cz+flTkxKfZPTIljYpBRt2Mfb9ylUz
   HUsuz3IT+J6yq32yn8NLXCV748UjO52WcGoyrlmsq6Wrd/8M1/KRAiwnD
   A==;
X-CSE-ConnectionGUID: SJZV0PT/TC+FPN/EFGqPfQ==
X-CSE-MsgGUID: 5TCKmjfiTymGcwhJ78jSjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11375460"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="11375460"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 18:31:20 -0700
X-CSE-ConnectionGUID: o7S5dmAoRQuTPSrkx9lBYw==
X-CSE-MsgGUID: m6Oc6QoASJCjX4xlinSXhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18877172"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Apr 2024 18:31:19 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsYQG-0001j8-1L;
	Fri, 05 Apr 2024 01:31:16 +0000
Date: Fri, 5 Apr 2024 09:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jon Hunter <jonathanh@nvidia.com>
Subject: [jonhunter:tegra/for-next 5/6] drivers/memory/tegra/tegra186.c:54:1:
 warning: label 'populate' defined but not used
Message-ID: <202404050930.8Ju2liyN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jonhunter/linux tegra/for-next
head:   08b469fe97a56ff7b6b7fd442f709d671aee1be6
commit: 580301916c56b9542a107777e592135f74b768ca [5/6] memory: tegra: make sid and broadcast regions optional
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240405/202404050930.8Ju2liyN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050930.8Ju2liyN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050930.8Ju2liyN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/memory/tegra/tegra186.c: In function 'tegra186_mc_probe':
>> drivers/memory/tegra/tegra186.c:54:1: warning: label 'populate' defined but not used [-Wunused-label]
      54 | populate:
         | ^~~~~~~~


vim +/populate +54 drivers/memory/tegra/tegra186.c

393d66fd2cacba Thierry Reding 2021-06-03  25  
7355c7b9ae0d45 Thierry Reding 2021-06-02  26  static int tegra186_mc_probe(struct tegra_mc *mc)
7355c7b9ae0d45 Thierry Reding 2021-06-02  27  {
a7cffa11fa9232 Ashish Mhetre  2022-05-06  28  	struct platform_device *pdev = to_platform_device(mc->dev);
580301916c56b9 Sumit Gupta    2024-03-05  29  	struct resource *res;
a7cffa11fa9232 Ashish Mhetre  2022-05-06  30  	unsigned int i;
a7cffa11fa9232 Ashish Mhetre  2022-05-06  31  	char name[8];
7355c7b9ae0d45 Thierry Reding 2021-06-02  32  	int err;
7355c7b9ae0d45 Thierry Reding 2021-06-02  33  
580301916c56b9 Sumit Gupta    2024-03-05  34  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "broadcast");
580301916c56b9 Sumit Gupta    2024-03-05  35  	if (res) {
580301916c56b9 Sumit Gupta    2024-03-05  36  		mc->bcast_ch_regs = devm_ioremap_resource(&pdev->dev, res);
580301916c56b9 Sumit Gupta    2024-03-05  37  		if (IS_ERR(mc->bcast_ch_regs))
a7cffa11fa9232 Ashish Mhetre  2022-05-06  38  			return PTR_ERR(mc->bcast_ch_regs);
a7cffa11fa9232 Ashish Mhetre  2022-05-06  39  	}
a7cffa11fa9232 Ashish Mhetre  2022-05-06  40  
a7cffa11fa9232 Ashish Mhetre  2022-05-06  41  	mc->ch_regs = devm_kcalloc(mc->dev, mc->soc->num_channels, sizeof(*mc->ch_regs),
a7cffa11fa9232 Ashish Mhetre  2022-05-06  42  				   GFP_KERNEL);
a7cffa11fa9232 Ashish Mhetre  2022-05-06  43  	if (!mc->ch_regs)
a7cffa11fa9232 Ashish Mhetre  2022-05-06  44  		return -ENOMEM;
a7cffa11fa9232 Ashish Mhetre  2022-05-06  45  
a7cffa11fa9232 Ashish Mhetre  2022-05-06  46  	for (i = 0; i < mc->soc->num_channels; i++) {
a7cffa11fa9232 Ashish Mhetre  2022-05-06  47  		snprintf(name, sizeof(name), "ch%u", i);
a7cffa11fa9232 Ashish Mhetre  2022-05-06  48  
a7cffa11fa9232 Ashish Mhetre  2022-05-06  49  		mc->ch_regs[i] = devm_platform_ioremap_resource_byname(pdev, name);
a7cffa11fa9232 Ashish Mhetre  2022-05-06  50  		if (IS_ERR(mc->ch_regs[i]))
a7cffa11fa9232 Ashish Mhetre  2022-05-06  51  			return PTR_ERR(mc->ch_regs[i]);
a7cffa11fa9232 Ashish Mhetre  2022-05-06  52  	}
a7cffa11fa9232 Ashish Mhetre  2022-05-06  53  
a7cffa11fa9232 Ashish Mhetre  2022-05-06 @54  populate:
7355c7b9ae0d45 Thierry Reding 2021-06-02  55  	err = of_platform_populate(mc->dev->of_node, NULL, NULL, mc->dev);
7355c7b9ae0d45 Thierry Reding 2021-06-02  56  	if (err < 0)
7355c7b9ae0d45 Thierry Reding 2021-06-02  57  		return err;
7355c7b9ae0d45 Thierry Reding 2021-06-02  58  
7355c7b9ae0d45 Thierry Reding 2021-06-02  59  	return 0;
7355c7b9ae0d45 Thierry Reding 2021-06-02  60  }
7355c7b9ae0d45 Thierry Reding 2021-06-02  61  

:::::: The code at line 54 was first introduced by commit
:::::: a7cffa11fa9232eabf0c4f441dc53002978ab526 memory: tegra: Add memory controller channels support

:::::: TO: Ashish Mhetre <amhetre@nvidia.com>
:::::: CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
