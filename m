Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A31E16C855
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 15:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718379729; cv=none; b=gHSXAYCqAJlS0MiI/yal1Bczh9qF5L8T5s7n8Z/uL0fJpEDw3TNcQSd6b/AJWSvomvplR4Gftg5TYHTueuQvfWR9GPDoNMv8QcDyaNLN7u7/UxgcTfO+ELH37gHRe0KVPqBhXO/7Xty4dROENGz16xN9vEQI6C/8KBXP72kxbsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718379729; c=relaxed/simple;
	bh=nUZMtDrhlZ8RnHNzGYwu2/CsZ7TLgk8RiSKhzJo77n0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VkekMdhZlMynvf/YjngM6B++8ke7RJ5xbKrrrvQd0+3pWwR+1AV5YdeqkUExtGRAUSszgHZ71P0gtoQrXfRgzbNbu2dWi3Z3uLOU3FvcByTjs/DkYTr5PV90dkFONtc3Wmhqedky+rSnXxpNQiiI1to9Udm4mvxN9gJqHuJmUNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cG2VYByZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cG2VYByZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718379727; x=1749915727;
  h=date:from:cc:subject:message-id:mime-version;
  bh=nUZMtDrhlZ8RnHNzGYwu2/CsZ7TLgk8RiSKhzJo77n0=;
  b=cG2VYByZfNR3i35791rHiGokMq8r3hXDCydKkZMTd7R5v/Lqgoow/B1Z
   Y/Ds6QADg7es79Ik0U0vXLzrEOjf5q82tS/IbtmMxsZKp6MM8Mw91BPX/
   D3+knnguAQa7S071mICH8Cld4iIEbWXMgpvUiq4LQfbx/99MQ5D/ewc+w
   6XaidR5XvQREwbwolHF82NbKWsBblF8+/igUUqBniOklUJHSIxHJZ4aPK
   4nqBRTIu731F7FBmg6sqbLD7o4xzBMYYuiRLm6JRfFxxnYgDpqvA4pTIf
   AZJ27iKwZWq1hsOmqo/af3fPx1OnmqQe64PVwjy1Pr813pM7mnUZbf/Yg
   w==;
X-CSE-ConnectionGUID: lqHb+71vS2SfSxa3OeVw9w==
X-CSE-MsgGUID: RzFqYjdNR2WYiO2p4z8elg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15240108"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="15240108"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 08:42:07 -0700
X-CSE-ConnectionGUID: y4LcRaqVTwuWEzFwDv5b+w==
X-CSE-MsgGUID: PEcnynbPTzu2/XZ62ynf2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="40458283"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jun 2024 08:42:06 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI940-0001S0-02
	for oe-kbuild-all@lists.linux.dev;
	Fri, 14 Jun 2024 15:42:04 +0000
Date: Fri, 14 Jun 2024 23:41:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 4465/9999]
 rockchip_drm_vop.c:(.text+0x35e4): relocation truncated to fit:
 R_AARCH64_CALL26 against undefined symbol `rockchip_dmc_put'
Message-ID: <202406142308.PMxPIk5H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 9f1383e6af7ad2dfc24741c481957c1ced2a4aea [4465/9999] BACKPORT: FROMLIST: drm: rockchip: Add DDR devfreq support
config: arm64-randconfig-003-20240614 (https://download.01.org/0day-ci/archive/20240614/202406142308.PMxPIk5H-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406142308.PMxPIk5H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406142308.PMxPIk5H-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/gpu/drm/rockchip/rockchip_drm_vop.o: in function `vop_crtc_atomic_disable':
   rockchip_drm_vop.c:(.text+0x35e4): undefined reference to `rockchip_dmc_put'
>> rockchip_drm_vop.c:(.text+0x35e4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `rockchip_dmc_put'
   aarch64-linux-ld: drivers/gpu/drm/rockchip/rockchip_drm_vop.o: in function `vop_crtc_atomic_enable':
   rockchip_drm_vop.c:(.text+0x4404): undefined reference to `rockchip_dmc_get'
>> rockchip_drm_vop.c:(.text+0x4404): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `rockchip_dmc_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
