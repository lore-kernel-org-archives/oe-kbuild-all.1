Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D907E6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 00:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBtGToSC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697242643; x=1728778643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MuMfZaA8vAiNj/fgdCDpee+7atDD2SBt4W8/cA8LtSY=;
  b=UBtGToSCSf6hEGLagyr3TPCymepS78b4ygaH7CrHLjjtbHRaSWzUrGfi
   elpY/yEw25Weq43GtGcr4j8Yht/fb6uKk8JwN/Qz4q6Hw3vlYnk37S/wm
   r1PPmocRRMGX6H4c9HGzd8GPVdG67A26OiMwgkjSe2vIlNLZPrH934BCl
   gRPUaUFAuHVdFgmr/ScfyfT3uRgNQfrJwHOruE01kwnxmqC2frGHxxM3U
   BYZQ8XQFStJCIxxo49Zo5hDSU67ziTl1y1ebJBhSfq3Oc/iTQE4XYrtE/
   dATewfS9WSUqCY7u/SuvXoOgXf+GgIE7Zcg+BaR+/6zVyL9BX1bTdzhW6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364653877"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="364653877"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 17:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="878701250"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="878701250"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Oct 2023 17:17:17 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrSLD-0005Xr-0s;
	Sat, 14 Oct 2023 00:17:15 +0000
Date: Sat, 14 Oct 2023 08:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: benl <ben.li@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [agd5f:drm-next-6.7 38/644] checkpatch: WARNING: Missing or
 malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310140832.4yW5oyjL-lkp@intel.com>
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
commit: e44d856eaa3dbcf1f5237525baff14111e05d940 [38/644] drm/amdgpu: add nbio 7.11 support
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310140832.4yW5oyjL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140832.4yW5oyjL-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#37: FILE: drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c:1:
+/*

ERROR:CODE_INDENT: code indent should use tabs where possible
#70: FILE: drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c:34:
+         printk("%s, getid\n",__func__);$

ERROR:SPACING: space required after that ',' (ctx:VxV)
#70: FILE: drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c:34:
+         printk("%s, getid\n",__func__);
                              ^

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#135: FILE: drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c:99:
+/*	u32 tmp = 0;
+

ERROR:TRAILING_WHITESPACE: trailing whitespace
#160: FILE: drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c:124:
+{    $

ERROR:SPACING: space required after that ',' (ctx:VxV)
#161: FILE: drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c:125:
+	u32 ih_doorbell_range = RREG32_SOC15(NBIO, 0,regGDC0_BIF_IH_DOORBELL_RANGE);
 	                                            ^

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#251: FILE: drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c:215:
+/*	uint32_t def, data;
+

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#286: FILE: drivers/gpu/drm/amd/amdgpu/nbio_v7_11.h:1:
+/*

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
