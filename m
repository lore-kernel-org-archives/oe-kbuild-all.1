Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB602AD3D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 03:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765511542; cv=none; b=Uquj0CczFh/mNVQB3MvTPt46g0A4o2DPPpCvN4uRHYllD+3SPytqnq8WJtqreB11UIaGXr82Y7dOHAuXwX6h/Fkj2oI/tvixHcx7obM8+NGSi2OlExOlPYaBG6J74Px2nWydDBIRSYnXkC6AvM7bT4qSpeguvY6YWzFB2YwsoCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765511542; c=relaxed/simple;
	bh=gtoqmrsfRbO3CmMNWxr3z5QxUL7yvczxbSdanPcLOLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EzYxyVQyqSsRm3bO4QkYxvOqH8eKhvoFJwVhLbgtodJr+MftwzgdOa0PGeIZ8C7ud2fT8px5Dn8kNf8tlP8iicMIluyCAd6et4nMe2LFCwruGU67dmk7kKrTdSM8TAlw8L97tvEvgPFJ1OiQqT9/cFFfkTShaqDXezC1wbrUzuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oKG4hYfR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oKG4hYfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765511541; x=1797047541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gtoqmrsfRbO3CmMNWxr3z5QxUL7yvczxbSdanPcLOLg=;
  b=oKG4hYfREmcHhMcRbixf3TPUsSp2cf8EVGxUYDPfFk/bkeIp/s2lJHgY
   bhllvJ06YCTyS8zDAn43d3oAQLqbLnlbspF02QPlRkP8GPTwIvSeXV/Fr
   RNX5mdRUtrhMU1s96V/k85bvJh048k0uxdx6vL/aYEVVWvc0yuPhMmYhB
   BCnh/q/cE/8wmfipJ9xgK6qlTt8Kn9utszp+B4Ac8ZTXhMrgt5KS9aYgG
   SU0z0Ihjwh7TgkPUK6syFI3AXoqCON9Dt3AuNqUhtLgaaQhjIxxOrSoA1
   3oIJAEKTFmav1sps6hvdyuQkIO3Etu3TZHRWt17S7RNyIjAHPWzcXxJGM
   w==;
X-CSE-ConnectionGUID: ImDPA0vOSYyzlh7YU2rkYQ==
X-CSE-MsgGUID: +sk9fPOeQoezbj4OuQF8cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="77817185"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="77817185"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 19:52:21 -0800
X-CSE-ConnectionGUID: 5e3k2vhMRC2RPPMNWrbsXA==
X-CSE-MsgGUID: sCgs+9k2QYidO6VkADZtCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197450859"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Dec 2025 19:52:19 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTuCX-000000005T3-28DV;
	Fri, 12 Dec 2025 03:52:17 +0000
Date: Fri, 12 Dec 2025 11:52:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/5]
 drivers/gpu/drm/xe/xe_pxp_multi_session.c:34: warning: Function parameter or
 struct member 'res' not described in 'xe_pxp_client'
Message-ID: <202512121101.259Cx8vm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   aede8f2a23afdacd71bb57369610179a20e859a7
commit: 6c20834df647ecc1e5510340e4139e99d9d64841 [0/5] ANDROID: drm/xe/pxp_multi: Add ioctl to initialize and query client handle
config: i386-randconfig-002-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121101.259Cx8vm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121101.259Cx8vm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121101.259Cx8vm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_pxp_multi_session.c:34: warning: Function parameter or struct member 'res' not described in 'xe_pxp_client'
   drivers/gpu/drm/xe/xe_pxp_multi_session.c:34: warning: Excess struct member 'exec' description in 'xe_pxp_client'


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
