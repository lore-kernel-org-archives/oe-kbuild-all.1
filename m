Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7521548C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 00:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765411275; cv=none; b=TBRyQIPfuTotbqOvGMCy1iKtgb4fiCz99FoIAUtb2AgqCPxYY7QlQiDiJY6mVe6Pla2l4mDovrBQHBT+s8z/b0D6z6fUpzSMWHLyCnShgM3BabPuFW/9sg5OBfR89TNFnRFiWUia4FjK1Z5kMfOQe0g0HlmSs0ywKmESuyoaDwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765411275; c=relaxed/simple;
	bh=U6wNkDsO9OuEk1pMbNGWjJfV9bqkgghZPtIfSz18if8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wc19ca9u9KNMDphWWmNBpmXinuIGZqfbeY32fyY3fWoiyTIhd97+afpIjRg6rz0UiV9okZTKay/SBtnlrBi8lObt8XaQWanAuB7gLZM1ndiIpAPE/9T0iILRP6oHlHDnAXRRgBkRjNO6+q+CyTAG7W2Z4Cw+/2PO2/LHzAhN3uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAAnhhHU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAAnhhHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765411272; x=1796947272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U6wNkDsO9OuEk1pMbNGWjJfV9bqkgghZPtIfSz18if8=;
  b=HAAnhhHUrNJwE8JHAbJX3Nh9+6sGYiID6UF+9EeK44N0PqkJKzlCA+Pd
   BDY1bYQZJoBLCkt/8HAzKh8GsXS6OI6707ttAO+P98bJaAhHSYUrN1EWN
   uZW18vbeg8NC8hRGUw5mrtoxCt/JSxUaiXRlNXZ0N90n/l6k+z2xFKF0c
   NXyuaTlFfayS4a5+A3tT+gi04Vzs/bk6jV4n9hmo9BQBOZjEG/CwuYat6
   JAG1PAG2wTsfNfhj/846dGLltGLxXOZ0PiRb0F+qxxUtx3o915W4ofbvy
   T+yEiTTkatFS5KrD5+AbkcvFEqyl7EkSAv8j7F0CmQD8jR1iGrKS2Rg/l
   w==;
X-CSE-ConnectionGUID: RDzfIom2SgGdsVkCPkTNtw==
X-CSE-MsgGUID: 7PZSelYNQ2a3hhBCnpyVEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67560994"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67560994"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 16:01:11 -0800
X-CSE-ConnectionGUID: o3ALHsZAQeO68OX2B3395w==
X-CSE-MsgGUID: u7WOmFXlT7+Uu0B4DU3y6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201741171"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Dec 2025 16:01:10 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTU7H-000000003tV-49Ep;
	Thu, 11 Dec 2025 00:01:07 +0000
Date: Thu, 11 Dec 2025 08:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3514/3514] fs/resctrl/monitor.c:51: warning:
 Cannot understand  * @closid_num_dirty_rmid    The number of dirty RMID each
 CLOSID has.
Message-ID: <202512110706.bkOqQiMM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d281438782e3c28a3df71a64513a3312d43dcf01
commit: 13e249bf4944afceae17195b7bb77c767ff61384 [3514/3514] x86/resctrl: Move the filesystem portions of resctrl to live in '/fs/'
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251211/202512110706.bkOqQiMM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110706.bkOqQiMM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110706.bkOqQiMM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/resctrl/monitor.c:51: warning: Cannot understand  * @closid_num_dirty_rmid    The number of dirty RMID each CLOSID has.
    on line 51 - I thought it was a doc line


vim +51 fs/resctrl/monitor.c

    49	
    50	/**
  > 51	 * @closid_num_dirty_rmid    The number of dirty RMID each CLOSID has.
    52	 *     Only allocated when CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is defined.
    53	 *     Indexed by CLOSID. Protected by rdtgroup_mutex.
    54	 */
    55	static u32 *closid_num_dirty_rmid;
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
