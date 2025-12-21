Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA542CCC5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 00:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766277174; cv=none; b=Iv15UYm5KsY6tZkoUqOtkqxJhvRtw6UlJFkQ54W9XVo7SVV+a8DsttIAwVjOX4W2rHOCwBTdNtdZd/KTVdH9f/IhSqpBdQRMdVMO+RZbMAt2Kd+gE6LT5QFKYN1fopYvUyXerCZVdUTrhQP/pBtcHPrwi9YET/Zd33b6kANkByE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766277174; c=relaxed/simple;
	bh=FWb8Fz0qFXIr5+t9H+JcsDSnJGwcw3UMZiTgwpwfjdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sNEBpC+21VNhiNwaL025R4buNzLxzgotl7c5SSTm+T4Gn5u//4IvB0M9pVBS3joNECwng2XgxOQ8COxnIz1SWzu3ZF7/249N/zgarOciq636cmS4rQeu56wx5DbALUW/i8I0wL20DJ5PRT0tyuD+BpRRxElitZBeyvLjTOoOPDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFB9ByZW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFB9ByZW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766277173; x=1797813173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FWb8Fz0qFXIr5+t9H+JcsDSnJGwcw3UMZiTgwpwfjdc=;
  b=OFB9ByZWTrMflOTMvdYfgWEThL/XZvYFDjThkYAunkFmfhWnNRiiL420
   KJHx9PhcBK1pc1/IbQFob+s1LlVmo2mdRntkSGaf4O0MnLYMYwKPPo1au
   TjtcD2720J2De/ytDcCNaJmOeKJVkz8izCnRMGrBYEMb5Gk/wx7Cd1Lb0
   X14GwcV9mXNGoD8iKC1OkBMq5hjJTU4rBjXFniHl0AiU7fKWtUTD2+ZVE
   lv3qU9orxDXGOta+39/tQqQ/eD93VCLbJeLIuqCbi6tyWwifG68bqzYx5
   NfEEmRiIeAApYC7E6rhnN/9+z/fcoDfwqyZ0waUaUcl60biag4WD4CyaI
   Q==;
X-CSE-ConnectionGUID: iyaHOKyESg628fAV6lgAVg==
X-CSE-MsgGUID: G5xnxIlWRJi0jU2riatGBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="71821857"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="71821857"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 16:32:52 -0800
X-CSE-ConnectionGUID: dPi8M8SaRjix748yPAhAKw==
X-CSE-MsgGUID: iZ5hqsTWRG+5bd3MFVuqSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198815402"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 20 Dec 2025 16:32:51 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX7NQ-000000004r2-2JrX;
	Sun, 21 Dec 2025 00:32:48 +0000
Date: Sun, 21 Dec 2025 01:32:03 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 26/26] kismet: WARNING: unmet direct
 dependencies detected for PHY_DW_DPHY when selected by
 VERISILICON_DW_MIPI_DSI
Message-ID: <202512210137.EGWIKOX3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   a9d28381f95a89bdcdd37365e033274ba5247458
commit: 500e70f6113ba8e3d77cbe6c36fb5a5d546e0557 [26/26] anolis: riscv: gpu/drm: add T-HEAD Light support
config: x86_64-kismet-CONFIG_PHY_DW_DPHY-CONFIG_VERISILICON_DW_MIPI_DSI-0-0 (https://download.01.org/0day-ci/archive/20251221/202512210137.EGWIKOX3-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512210137.EGWIKOX3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210137.EGWIKOX3-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PHY_DW_DPHY when selected by VERISILICON_DW_MIPI_DSI
   WARNING: unmet direct dependencies detected for PHY_DW_DPHY
     Depends on [n]: HAS_IOMEM [=y] && OF [=n]
     Selected by [y]:
     - VERISILICON_DW_MIPI_DSI [=y] && HAS_IOMEM [=y] && DRM_VERISILICON [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
