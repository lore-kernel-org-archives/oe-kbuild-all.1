Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFFA3451CB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 10:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756291603; cv=none; b=DWTe55x2lQs2791wqbmDKVRVVc20VCIXb6ZDewYf1uHUHYopwCKAq7TNJZ6eEUlpWwuJDP6L3gtrwd+WUsUTHLLXQM/2lo27xkw1005bzT8cTli7GYWd6qKELXW73ptaA1UApTNEPYw2Lim1d3X3b1lORUtH2pCmj4SDVuajR0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756291603; c=relaxed/simple;
	bh=1lqDUZYPhSeeQrEJJCkBRHCyQX+56Rw/Xe3dfVO2xWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MgVswi0WOXsFPRPaaP//xAJJKTezhMCQKiMxc5X24/Ut0JM8REpvCqUCnmziITE4MN3oTbfbTgYDoJCIAR8tUDpHUjQYRBdhqF0FKP4sWpJ1ZUKbCC2C2VljV1LI/TKfHHcGxCQyGD08d0KKTQPzBBaXsWHEKZkRWMsyZpnIwog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqNADzNz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqNADzNz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756291602; x=1787827602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1lqDUZYPhSeeQrEJJCkBRHCyQX+56Rw/Xe3dfVO2xWQ=;
  b=lqNADzNzyPAheGx+NeJTr1fMu/Bmq7IwJ7x/ir0u/0TQfJUD5J1Mhm5u
   bH0sDkeRSp33gd3ICgDkZyqs+sUG+BYVqyBPT5cZKQGtGW6ho3VCuo6QR
   qKE04gVSFctnrHN8m1X8+c/YBcoDwfFgR3n5k7djmBtvS50p0XAtxOA90
   EVcsqik5qiNwSRIC5CSdDHuNIm+zBvHoI4FtPmaCW0hU48UBWF7owy/Yb
   jW2aMPWqnHcK/KsHWbuBl4bEYESpZwutRTpEpDz6whfF+93NciaT8s7+P
   o4ZcjKPTApkbwix1KxYMar8t/sQjTsXDCgLIkdsIjRwIdm+eMQfjsauUd
   A==;
X-CSE-ConnectionGUID: 8ZH75FXhSpiAXCkgRh8tig==
X-CSE-MsgGUID: zSZhy0VQS+uyMM+dPVNprQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57559054"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="57559054"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 03:46:41 -0700
X-CSE-ConnectionGUID: Zm6JJQdJR0alZKMgGVW6ZQ==
X-CSE-MsgGUID: BxBXqw+iSr+urSCV55j8Qw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 27 Aug 2025 03:46:40 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urDfp-0002dP-39;
	Wed, 27 Aug 2025 10:46:37 +0000
Date: Wed, 27 Aug 2025 12:46:20 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3164/3164] drivers/crypto/ccp/hygon/hct.c:46:
 warning: Function parameter or member 'fmt' not described in 'pr_fmt'
Message-ID: <202508271204.tfohm9Mj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   2631a43115d05f216c64dbf901afa2b4bfdf13f5
commit: b7a218b5c46200f323ac0fe07589e0bf0d648069 [3164/3164] crypto: hct: provides hygon crypto technology ccp device driver.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250827/202508271204.tfohm9Mj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271204.tfohm9Mj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508271204.tfohm9Mj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/hct.c:46: warning: Function parameter or member 'fmt' not described in 'pr_fmt'


vim +46 drivers/crypto/ccp/hygon/hct.c

    34	
    35	/**
    36	 * VERSION_STRING modification instructions:
    37	 * 0.1 -- support hct/mdev mode.
    38	 * 0.2 -- supoort qemu virtualization.
    39	 * 0.3 -- support host-noiommu mode memory encryption function,
    40	 *        and performance optimization in virtual machines (enable caching).
    41	 * 0.4 -- support compiling hct.ko when mdev module is disabled.
    42	 * 0.5 -- change the maximum number of supported ccps from 16 to 48.
    43	 */
    44	
    45	#undef  pr_fmt
  > 46	#define pr_fmt(fmt)				"hct: " fmt
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
