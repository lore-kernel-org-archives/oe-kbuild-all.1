Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9E079950
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 21:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709588797; cv=none; b=bUylw734fqRoUzMh9FN/W3Y/TUGToSeGOKcMGXgHcvi9HX3+qt/Yf3QZGSTJ/7/JVHITiAhf3z1RlKYiduf1GkKOO/itFB6EBzp9MtYbuWJgG2DKgA4cTVMCx7iimaGUwMm3n+3VpJOpalS5iRV/NlQrI0Qkv8G7NWSs7Fh4lYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709588797; c=relaxed/simple;
	bh=dH6gYk2N32sA+rXpTn5/swRGICtn0kJ9mtrqQnXpPbM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DdrwBLqnPYFG3WUd1bBUMt7bVjJ8+mMuWlvWMbuq12KnjaB9LBwslyn5sxrGdXz6JTJtF+oEPondhL2j27ZuOC3TmpvADl81o7hs42ZOoK8HuHOrakr3bz1aU5l1ennSWEz1i0hVOjZES5ZsSXmoWcyDF+HXnzXnasURvGC3O0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HvGurhkI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HvGurhkI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709588795; x=1741124795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dH6gYk2N32sA+rXpTn5/swRGICtn0kJ9mtrqQnXpPbM=;
  b=HvGurhkI87n/PFlup6GzQqLXpHCUmf6yrHPh81/zJhubju52SwM9Mjy4
   YnsVirIlbz3K5uqo5r+SJ2wc+eW8Ma91ZqcFhshcJ6VAYDp6SBaRE58X3
   wphehoTZzIgOrf9PDarsfNWSdVcsY3ggqlUH29RwmhhQFVFis5SRi4Vi1
   ZwItdYugcd+6Q0GgAPsYXPmrKXDaVbjswt3RC6uFhemC+f9aZMqVmp9Ej
   5zm0+rkPhmkShWPw2qPYTqtbNj4fzah1nR3b4XcGMKTDx5GU1vkMoNYBz
   DT7Dm9qPbDDUl69DcZp26dRdPdhNTDEwsJakcXKl04MPuxifrzBcPhP5/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7926354"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="7926354"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 13:46:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="13806644"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Mar 2024 13:46:24 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhG8b-0002nD-1S;
	Mon, 04 Mar 2024 21:46:21 +0000
Date: Tue, 5 Mar 2024 05:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/of/irq.c:625: warning: Function parameter or member 'id' not
 described in 'of_msi_map_get_device_domain'
Message-ID: <202403050529.G4Kav8yV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 4b0a2e06da3d4671a4317349a8b991c3f4ae43b7 of/irq: make of_msi_map_get_device_domain() bus agnostic
date:   9 months ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240305/202403050529.G4Kav8yV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050529.G4Kav8yV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050529.G4Kav8yV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/irq.c:625: warning: Function parameter or member 'id' not described in 'of_msi_map_get_device_domain'
>> drivers/of/irq.c:625: warning: Excess function parameter 'rid' description in 'of_msi_map_get_device_domain'


vim +625 drivers/of/irq.c

^590eaf1fec755 Kaixu Xia     2021-03-16  611  
^590eaf1fec755 Kaixu Xia     2021-03-16  612  /**
^590eaf1fec755 Kaixu Xia     2021-03-16  613   * of_msi_map_get_device_domain - Use msi-map to find the relevant MSI domain
^590eaf1fec755 Kaixu Xia     2021-03-16  614   * @dev: device for which the mapping is to be done.
^590eaf1fec755 Kaixu Xia     2021-03-16  615   * @rid: Requester ID for the device.
4b0a2e06da3d46 Diana Craciun 2020-06-19  616   * @bus_token: Bus token
^590eaf1fec755 Kaixu Xia     2021-03-16  617   *
^590eaf1fec755 Kaixu Xia     2021-03-16  618   * Walk up the device hierarchy looking for devices with a "msi-map"
^590eaf1fec755 Kaixu Xia     2021-03-16  619   * property.
^590eaf1fec755 Kaixu Xia     2021-03-16  620   *
^590eaf1fec755 Kaixu Xia     2021-03-16  621   * Returns: the MSI domain for this device (or NULL on failure)
^590eaf1fec755 Kaixu Xia     2021-03-16  622   */
4b0a2e06da3d46 Diana Craciun 2020-06-19  623  struct irq_domain *of_msi_map_get_device_domain(struct device *dev, u32 id,
4b0a2e06da3d46 Diana Craciun 2020-06-19  624  						u32 bus_token)
^590eaf1fec755 Kaixu Xia     2021-03-16 @625  {
^590eaf1fec755 Kaixu Xia     2021-03-16  626  	struct device_node *np = NULL;
^590eaf1fec755 Kaixu Xia     2021-03-16  627  
4b0a2e06da3d46 Diana Craciun 2020-06-19  628  	__of_msi_map_rid(dev, &np, id);
4b0a2e06da3d46 Diana Craciun 2020-06-19  629  	return irq_find_matching_host(np, bus_token);
^590eaf1fec755 Kaixu Xia     2021-03-16  630  }
^590eaf1fec755 Kaixu Xia     2021-03-16  631  

:::::: The code at line 625 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
