Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E0E944F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 04:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771044974; cv=none; b=b+BDIEkGHToG1yGpR0DfFpbDPTtpqv8N6JlZ5R0LAhfREavNljPnJlJqS/QArLsjSF44cdf/1i91juTOPgvkSEVjswebemirkOvLfP8/iAnP+c0MIj8APxojNThRN+eS4I6nMv3dlQWTJAfoHTV25DAKfP93RJTYXsZQhgTMvZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771044974; c=relaxed/simple;
	bh=Q2EbDIpqkTZaRHiBdzzubmvfaFX23rqW3OKeFjC3/Oc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gteP+2coiy7avZ7cjfX7vYMA/PIosohisPr3SSRsJ63fJqkWIC1tJp+ZhQjMddb8/oXQe//BT4V/IPY4VdR2kfN6q14Ikk5RJiuojvsbz0SlGVDwf+URP9WSDKNymjuQnBm2aWxk0gk5iSc0CosUyEkxdRtx6P4eiqwBKNSh2U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GqdjM2YC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GqdjM2YC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771044973; x=1802580973;
  h=date:from:to:cc:subject:message-id;
  bh=Q2EbDIpqkTZaRHiBdzzubmvfaFX23rqW3OKeFjC3/Oc=;
  b=GqdjM2YCrup2hFvip2XAleKxQyKphr+tcL/ws3cgIoERROabxil2U54X
   XRgsLC4KhDknmVWjvoMYLjTJZWkQN3Cj52KAStSaHeAqcImOIFJLyadg2
   V2GFSzr8Hv9UL3Oa03n0Z8BztA5EzlpgRoG8q/lYwzb5G62dxqrP5eA4o
   IxCYKoPR7u6mr4+qco1FybUCQXhkSVvRL46OW9lJeDUBXhKELR44Xaoqt
   HaalbIzHQ3iwgu0sze4mQOn3yiqo/bj8NkgT6Biga318M3P9ewm3ztSoU
   Vcbs4x8ZvNuKEyRCMlu7KJWINGBgGIdmuTGNdAFmUc33W0fFEqDXiG9c5
   g==;
X-CSE-ConnectionGUID: NqHjYBSFSa2AmNIxT/TDpQ==
X-CSE-MsgGUID: 6seBWOgmRxqPrlwY7aVDHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72215592"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72215592"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 20:56:13 -0800
X-CSE-ConnectionGUID: bVPLV1smTGapOTAcpwa+pg==
X-CSE-MsgGUID: qINiES4sQ/OLfJv8xeDRMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="211755809"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Feb 2026 20:56:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr7hR-00000000wEr-0pOC;
	Sat, 14 Feb 2026 04:56:09 +0000
Date: Sat, 14 Feb 2026 12:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 270/590] Warning:
 drivers/gpu/drm/xlnx/xlnx_fb.c:58 function parameter 'info' not described in
 'xlnx_fb_create'
Message-ID: <202602141207.rACBRtpb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: e7a2098dcaaf134657039735fcbf91e7d69a00f4 [270/590] drm: xlnx: Xilinx DRM KMS driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260214/202602141207.rACBRtpb-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141207.rACBRtpb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141207.rACBRtpb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/xlnx/xlnx_fb.c:58 function parameter 'info' not described in 'xlnx_fb_create'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
