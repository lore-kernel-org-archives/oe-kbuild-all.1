Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0353D22068F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 11:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765626879; cv=none; b=hi231zDQwtLE5lT8PrP7456qN3UeejajWwRRf5OerYCBSa4Vw4M24BjQaUL5Miqu7eGxN9ppL7Zc5Res5zFYG1387tSIw9v8knuHxWc7jjo7KLSPbGVU/v9wYTtxCITxJkCFR1oXEH+33hkRpEw5Yb5poBWiDhJqb0SGy0PoF3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765626879; c=relaxed/simple;
	bh=5kQ+TIwPN+qRadcrX439Zd4oYrEpuhYHw3LAEZodr3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZaKGYBdYa3kFtYDzyrV7NDcoTGXA/kHHUFrqWljEgNX5peBJR1wADYUjG7xIZ/iMoilHOah3Eta4lWlS7vtUuwZsLO7m5/zgygmHrJSEEa5+OTq5SGHAA+5RQvJEL0RsSMqBZpynYsF1o/SYBYyVTGu7tSM4mO9Y+eimgVMzV2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DX2m2CRn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DX2m2CRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765626877; x=1797162877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5kQ+TIwPN+qRadcrX439Zd4oYrEpuhYHw3LAEZodr3Y=;
  b=DX2m2CRnN2XHwUKrXgWypoQX1nZM5Np5ENcYtJFHsKI2QMGbianXfNGG
   /XB/24rro9nBPYNvSXIfiQdZ64gAt3tcgvuACdUsaL/coM8A9Ex63q5s/
   wx0rJ6172DtH/g6FqUXO5tQB7/2o373fnCfshQbG0qkgTKUWr7XuU/5vA
   xZqDAtZVyorhzAWgZlfP3xiU9K/XlvR23MZNEoj5ru0IIzd7foiKVu+8b
   puu90dOEwUPcqRABppOfO8IChFRHf43jstIztd0d5eWqRjduUnPI6Y4dy
   KwfGk6hbASmESqA8g9vvr8j0RR9y4KNa8dnSeZBs09BXCPtVM6ibOp0rD
   A==;
X-CSE-ConnectionGUID: 68/oETjkTKmffNcjzAH1yw==
X-CSE-MsgGUID: aVb02UVzTmS42FbX4kTg5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67569773"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67569773"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 03:54:37 -0800
X-CSE-ConnectionGUID: qSc4szEzRrGpexcSJQ5fXA==
X-CSE-MsgGUID: BQ7heyBaTkm7Kzv33gnRpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197365732"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Dec 2025 03:54:36 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUOCn-000000007ZZ-15Ux;
	Sat, 13 Dec 2025 11:54:33 +0000
Date: Sat, 13 Dec 2025 19:53:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 5/5]
 drivers/gpu/drm/xe/xe_pxp_multi_session.c:34: warning: Excess struct member
 'exec' description in 'xe_pxp_client'
Message-ID: <202512131930.S5SYCs5G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: 6c20834df647ecc1e5510340e4139e99d9d64841 [5/5] ANDROID: drm/xe/pxp_multi: Add ioctl to initialize and query client handle
config: x86_64-randconfig-123-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131930.S5SYCs5G-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131930.S5SYCs5G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131930.S5SYCs5G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_pxp_multi_session.c:34: warning: Function parameter or struct member 'res' not described in 'xe_pxp_client'
>> drivers/gpu/drm/xe/xe_pxp_multi_session.c:34: warning: Excess struct member 'exec' description in 'xe_pxp_client'


vim +34 drivers/gpu/drm/xe/xe_pxp_multi_session.c

    19	
    20	/**
    21	 * struct xe_pxp_client
    22	 *
    23	 * We dont need to allocate multiple execution resources (above struct)
    24	 * for a single drm_client that is executing multiple PXP sessions.
    25	 * So we use a link list of nodes indexed by the drmclient handle
    26	 */
    27	struct xe_pxp_client {
    28		/** @link: achor for linked list. */
    29		struct list_head link;
    30		/** @exec: session execution resource for a given client. */
    31		struct xe_pxp_gsc_client_resources res;
    32		/** @drmfile: drm_file handle for a given client. */
    33		struct drm_file *drmfile;
  > 34	};
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
