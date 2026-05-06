Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEE936B076
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 10:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778062058; cv=none; b=cC4oli+5V8kfsuknr0nSnSowcF2jEa9OV+a8AymuByjw9ZKZIBJUkjigdy/GMYMS89xt79nkDUudwrCFgZmvJG6RYaWvB4f/bSDKz/gbWaqsQTX79jX02N0Qbme+6kw3tmt9lFDhfWRqLwfrVjYPFK06qjJ1nKYkzS31ha9eWuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778062058; c=relaxed/simple;
	bh=/IeviTFof+MZ2L+5VFj+ZTOpD4jmyD4VGdEWP5CBbXo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UjvLoWPzfSDG1avByrA4/DscDQh94Cy4QnkLW3/E9rG7E2vYK4oRnALqqhx2OGKVQVrbcxxMp8KdHypuXaUdVNCPh/9LXEqn5HEuC62iVyfUqBe3muR7nCG+XB/3xDPOxerhhGZogYXIWUpCigW+nL6EY7egi2PoclozAET/T0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCrzPL8P; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCrzPL8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778062055; x=1809598055;
  h=date:from:to:cc:subject:message-id;
  bh=/IeviTFof+MZ2L+5VFj+ZTOpD4jmyD4VGdEWP5CBbXo=;
  b=FCrzPL8PKmMChxXRU1PE91AhkmMQO4UdskLQ1gMllelRnZgwSNUcDZUI
   h5254Qou6JGQBp6wFP8ao5cqkzAZcttnSIplbvxy1btRoZFtdB/1+aHY4
   V4YcJpxB76XgHnBxdK/BzsgiTjDaWyQR4k3fSWSSTJDwNauR9HGgbl91x
   L+HWXyZPd/zc/WPHI5a1t1VrmY9bqZypqhHXD40Zk1UZhzaimfQ1ZBCU2
   KwQFKC67dnWz5R26XYQivuYebE5c/j+6njjgQ2usKF4t9LLQzDH/q6Kas
   Ad+VTAFQLa2e5TwxpCJpqvIMpuO9uy9LRPdlvcLICv1xKhdnPbqswNAN/
   Q==;
X-CSE-ConnectionGUID: FgcjbOxbSkmud/vELzGsCA==
X-CSE-MsgGUID: bbWXAJP7TC2bT3eitqAHhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78878802"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78878802"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 03:07:34 -0700
X-CSE-ConnectionGUID: 0Jf2FEtRTiCaakPtsyz72Q==
X-CSE-MsgGUID: ZoesmGKvSWq5YC5c/AHVAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="235092161"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 May 2026 03:07:32 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKZA9-000000000s5-42Th;
	Wed, 06 May 2026 10:07:29 +0000
Date: Wed, 06 May 2026 18:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 28/37] ERROR: modpost:
 "get_cycles" [crypto/jitterentropy_rng.ko] undefined!
Message-ID: <202605061833.K0dVdotC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   53bcd35f2ff331adc7277b797333287028c91655
commit: 203f72b726b1e5e108ab89bd03f2cbbf32a49f2a [28/37] nios2: Select ARCH_HAS_RANDOM_ENTROPY
config: nios2-randconfig-r071-20260506 (https://download.01.org/0day-ci/archive/20260506/202605061833.K0dVdotC-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9065-ge9cc34fd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061833.K0dVdotC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061833.K0dVdotC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "get_cycles" [crypto/jitterentropy_rng.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
