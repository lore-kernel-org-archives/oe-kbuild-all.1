Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C367E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 00:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUFpUvOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697242639; x=1728778639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TJyIgb7HAnmtoWKvtHX4PjMDNaZswHeYE1m8YEZIxoI=;
  b=HUFpUvOvx35gH0TMqoiYk5fJPvico1i+Fa+1h8mS+GNgt+F04EBoiVnm
   U4O3elukqOg/gBXeMjp+e0ZWtK0BcUYZjhW50aK+2Gi5gTAi739ZaQwdc
   jK8JhqAoCuFE51l7uxy+OGXcgFobB4SSxD46BiOamVAlpVOu6d6SSqCsQ
   /1s32UXFCosZQm6ZV0kbmwTvi1b3r921TKP3alot8uj4Nlra2LZva2nDK
   4QpHlyFpdDu6iskPcDPJe2ve0Wv7TCkjMQ9zdI/F38iTs8hCfvfcP4sd0
   ft7mz+0JpySIE8F1oGVFIhxoy9JO7qvK0CnkShMQ8909+bkte4pLRxVKq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364653875"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="364653875"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 17:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="878701249"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="878701249"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Oct 2023 17:17:17 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrSLD-0005Xt-0w;
	Sat, 14 Oct 2023 00:17:15 +0000
Date: Sat, 14 Oct 2023 08:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: benl <ben.li@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [agd5f:drm-next-6.7 37/644] checkpatch: WARNING: Missing or
 malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310140817.45GWjFRw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-6.7
head:   cd90511557fdfb394bb4ac4c3b539b007383914c
commit: ca8c68142ad8148a9ee1e3bfbcb916ea5c2b9cf8 [37/644] drm/amdgpu: add nbio 7.11 registers
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310140817.45GWjFRw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140817.45GWjFRw-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#27: FILE: drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_11_0_offset.h:1:
+/*

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#9424: FILE: drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_11_0_sh_mask.h:1:
+/*

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
