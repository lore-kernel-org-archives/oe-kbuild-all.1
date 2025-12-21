Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1952264CB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 19:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766345711; cv=none; b=lkLxWe4+AtMOPe5nDdJN9FkvT+L04tJyMabeUONeDl15HcBW3qpVmJJVO/1N+ylcjrh4Fd2/+U0KFPt7HZZ37pfkjKXxjkj2rXH06Lq9/QNpeNvjB5yLsmg9WlUjcJO9HRRTSvSQeVfUpQwlBoPeHGQWVP87xDZhIbhM95dtFRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766345711; c=relaxed/simple;
	bh=bjvNxDKdDJdtqWLcrfva/adOGqLFS5kKVTRiQ+x2HFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nn2Ape9imhPnqPMxlamYpgVss1CmG9oglob3HE7jGqM2nVrWO1LBqIQ62D6+Eh3dfj4Lhn0Lkg1RJT8O9luLuhV6vXBTJAPJXPKBBC/Wci8mObEcVWW0rM1pDLsqVEuv+H3iIs5hBmpG65Oe9BwLXNSdW7bYnFiP2z+ki4cgm/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LV6+7D+6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LV6+7D+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766345710; x=1797881710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bjvNxDKdDJdtqWLcrfva/adOGqLFS5kKVTRiQ+x2HFc=;
  b=LV6+7D+6fyJprHmFsdWSWSDxLmRVhwMOAfRFdN3EWBvvlhSDjUtmjo0e
   ks2Ga2NkJmjXLlthZJG2WcON7PXuTxwWy8eVhBgmFx9LgVc1KX0/o53Is
   h5jYtHdGMrbZilHY8IllnqphMi9qGVZVkx6wjmQF8CxzIA4lPWl9brked
   cPRO98al3rvYNCUkERQWBmT0I5zsz+vUVVdeW4aNKi3sMGzjV7Yl7M94V
   CSA8DtZ1mJABM/4FRmdU8jOSjQVjixLpmyiTaSqgR9o0zsrYiPrKC8GvW
   ei3euEsUc3GFhsSkmi44JRhU4UmKjshNrFUmViowfl/ip2VeRFIndLp5X
   w==;
X-CSE-ConnectionGUID: RAG7CuTkQhmr/baV/QQ1nw==
X-CSE-MsgGUID: thmDyJVLRg+Ie0DaTqJZMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67414303"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="67414303"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 11:35:08 -0800
X-CSE-ConnectionGUID: IbdutkoXTOSBj+KJO26rEw==
X-CSE-MsgGUID: P3ijK+YMSlObiez8mAakmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="204422579"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 21 Dec 2025 11:35:06 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXPCq-000000005DE-2wDG;
	Sun, 21 Dec 2025 19:35:04 +0000
Date: Sun, 21 Dec 2025 20:34:19 +0100
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 36/62] 19 | use crate::error::to_result;
Message-ID: <202512212059.DxqmsrQ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   e08116e258e28774a3770a80debc819b89928f45
commit: 3edfa200c39f0b92170fc23da2662f1a1faf6080 [36/62] rust: of: Add reserved_mem_region_to_resource_byname()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251221/202512212059.DxqmsrQ0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512212059.DxqmsrQ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212059.DxqmsrQ0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> warning: unused import: `crate::error::to_result`
   --> rust/kernel/of.rs:19:5
   |
>> 19 | use crate::error::to_result;
   |     ^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
