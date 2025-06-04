Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8B517C224
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 22:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749076183; cv=none; b=nKfDOcEVKejuJ/RDpdBq+xIdN6C47kIrqzx27KO1BWIs5xQVacDTPNkOiK0LGoSsiSTtz+buqhKgr597IKGKog/Y2/PnrLJBdPui6hnOKt+J/duTfsTcLwkUJ8YIc0zR2RllG3jVPsNz9eJBb3sl5th6/VNjPcVk7f0HN+qgTaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749076183; c=relaxed/simple;
	bh=WF0JE8yj4h2OwfDxMFiYmoB3MnLv2foJVqtpM4qIppI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GD1MXrAAL1sZHLAmkzekpW8PvHfOlDmdni4wjOeWeOOzl/C4vIO3nvcJuGSTf+wttVrwRq6upSKLfpQsu4JQU6pX78FF6iv6GnIFbkgHnesygusl/60/GonV6qGhkpuSPLVV3dGmkzp2SOMgbla+Vf/JZ9BC1+xrjE3EweJWCeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YikV50hw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YikV50hw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749076182; x=1780612182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WF0JE8yj4h2OwfDxMFiYmoB3MnLv2foJVqtpM4qIppI=;
  b=YikV50hwaYnGR1KNGfI10ZG7y/xcJAzJdARRkOGYFLGjRSA+Q2VGNNkK
   pzMhh3YOAry/nlj/xVTasRJRAt4YQMk8SC5jcli1D59sxjH4xoWQ2JzJR
   E/xZBQaxolwIYi/QKT0TThWbedMvj+xDl5ZO+oCcZQzT31fHYaQlJPZpP
   FFUENina2E72koeKQI/86BFpw2q+A8v6IH7+/PNejVepltshdkYPBEuPH
   YKJlI0prsMrLy7jjjDDVoTz/Zp1C3Z7td6+9tzQ9anBh3ebg/SS/cDIoE
   Jp5QRJq6FhcFD+lGH/XdOum/2HTsqJrEX12szyA6fxz7HzB0Oxwi4Aw6R
   A==;
X-CSE-ConnectionGUID: ilVVHePURE62MCdQa4DIaQ==
X-CSE-MsgGUID: wAlHoKn/Q0+pcEoaE2F3Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50872414"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="50872414"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 15:29:42 -0700
X-CSE-ConnectionGUID: +ER+Imc0SBO0fQBbmsNbcA==
X-CSE-MsgGUID: uRPsvi5UTsqEhnCKD2g8Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="145802763"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Jun 2025 15:29:40 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMwc6-0003Vv-0z;
	Wed, 04 Jun 2025 22:29:38 +0000
Date: Thu, 5 Jun 2025 06:29:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2357/2357]
 arch/arm64/kernel/virtcca_cvm_guest.c:20:1: sparse: sparse: symbol
 'cvm_tsi_present' was not declared. Should it be static?
Message-ID: <202506050630.B3psnujg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a9e6ec001662a376522f36604dfec47c30530549
commit: 721f4ea899ff2ab4e3283767cf125dc5952c1d15 [2357/2357] cvm_tsi: add support virtcca attestation
config: arm64-randconfig-r123-20250605 (https://download.01.org/0day-ci/archive/20250605/202506050630.B3psnujg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250605/202506050630.B3psnujg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050630.B3psnujg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/virtcca_cvm_guest.c:20:1: sparse: sparse: symbol 'cvm_tsi_present' was not declared. Should it be static?
--
>> arch/arm64/kernel/virtcca_cvm_tsi.c:79:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct virtcca_cvm_tsi_version [noderef] __user *arg @@     got struct virtcca_cvm_tsi_version * @@
   arch/arm64/kernel/virtcca_cvm_tsi.c:79:44: sparse:     expected struct virtcca_cvm_tsi_version [noderef] __user *arg
   arch/arm64/kernel/virtcca_cvm_tsi.c:79:44: sparse:     got struct virtcca_cvm_tsi_version *
>> arch/arm64/kernel/virtcca_cvm_tsi.c:82:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct virtcca_cvm_attestation_cmd [noderef] __user *arg @@     got struct virtcca_cvm_attestation_cmd * @@
   arch/arm64/kernel/virtcca_cvm_tsi.c:82:50: sparse:     expected struct virtcca_cvm_attestation_cmd [noderef] __user *arg
   arch/arm64/kernel/virtcca_cvm_tsi.c:82:50: sparse:     got struct virtcca_cvm_attestation_cmd *
>> arch/arm64/kernel/virtcca_cvm_tsi.c:85:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct virtcca_device_cert [noderef] __user *arg @@     got struct virtcca_device_cert * @@
   arch/arm64/kernel/virtcca_cvm_tsi.c:85:44: sparse:     expected struct virtcca_device_cert [noderef] __user *arg
   arch/arm64/kernel/virtcca_cvm_tsi.c:85:44: sparse:     got struct virtcca_device_cert *

vim +/cvm_tsi_present +20 arch/arm64/kernel/virtcca_cvm_guest.c

    18	
    19	static bool cvm_guest_enable __read_mostly;
  > 20	DEFINE_STATIC_KEY_FALSE_RO(cvm_tsi_present);
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
