Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFAF1F09A5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jul 2026 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785058774; cv=none; b=W4PqrVZPm1mac5qHuBVSybZAPs3PzSVjxAaH2iIHNlIHkWQbiRWgOUv3XUpTU4uCNT1SJMNj3v44UE3dPIDbtJzIUs0XsrwDFoOujzFhqe4O4opQFiLlLH6FhDQyCEDglCAQ2+LtPEccF0Fj4pkizZ4ktfNb2t3Vu+SHLTwZIrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785058774; c=relaxed/simple;
	bh=tD6GiIyRvC9kNal7vBir9NaxLU63OWE2kS1MV2YYqC8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WuWKzCEP+EiQQG0Q+S2brsn/QNfKq5stnUyONS2H8xo/z7M54eupZZYE6gqqZPa73Ussi8KEiZXRvksighZ9+ShntA+UyCLaWzaTVtCPB5mI/V2IB2pTAsnKI8QLOX+4siXtBFqqMCKkdXD5Xf8qFkRRTsUfj+aRkqkbMX8El1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4k8mhQI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4k8mhQI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785058771; x=1816594771;
  h=date:from:to:cc:subject:message-id;
  bh=tD6GiIyRvC9kNal7vBir9NaxLU63OWE2kS1MV2YYqC8=;
  b=a4k8mhQImzw6oqN/Z9wFet7MjfINbqlimgtzKAr4EINcjzml+ptqWrg+
   8dTylxG7AVkGEeGQ/u3EBH2RcKSyYp7VhjM1YiBRd6fMpiJXcbMX8G/d1
   mbaLo1SJU3kzDVL0BrpdHMRWx7l4Th4Vf7GwDHikex501lkcFdNCebaso
   dTPFM/OslxHg4RMIT0XYxqcNBD8tSP0mt5BTWqmVZhnLQl8yJxTFvWg9c
   Lrxo6PJ49wPHx3k4FGy/KJxp2FYgDWfrchp8tJYK4N98x0NmtKUMFN5tj
   ma2A+kNixoIehc18xFWNJFDWUmS+wEm3996UT6vO7NJCgeZoKlgWPNoWJ
   A==;
X-CSE-ConnectionGUID: l/iYBlIqQ7St3nPU3SjXdg==
X-CSE-MsgGUID: DykdVw9GR0Sw4FaRBiZlog==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="96808591"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="96808591"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 02:39:31 -0700
X-CSE-ConnectionGUID: S2K6Ny0fTfGtzei5CWm34Q==
X-CSE-MsgGUID: mkr0GM8JSbWxG7zv2j8Vag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="297367323"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Jul 2026 02:39:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnvKG-00000000cRy-3KGX;
	Sun, 26 Jul 2026 09:39:19 +0000
Date: Sun, 26 Jul 2026 17:38:44 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-rng 5/5] WARNING: modpost: vmlinux: section
 mismatch in reference: drbg_selftest+0x50 (section: .text) ->
 drbg_healthcheck_sanity (section: .init.text)
Message-ID: <202607261741.mqPYbCg6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-rng
head:   b3d559623a0829567d9f40d2d71da0e63ba7f549
commit: b3d559623a0829567d9f40d2d71da0e63ba7f549 [5/5] crypto: rng - Remove crypto_rng
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260726/202607261741.mqPYbCg6-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260726/202607261741.mqPYbCg6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607261741.mqPYbCg6-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: "saved_config" [vmlinux] is COMMON symbol
>> WARNING: modpost: vmlinux: section mismatch in reference: drbg_selftest+0x50 (section: .text) -> drbg_healthcheck_sanity (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drbg_selftest+0x54 (section: .text) -> drbg_healthcheck_sanity (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: drbg_selftest+0x60 (section: .text) -> drbg_selftest_one_vec.constprop.0 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: crypto_drbg_alloc+0x50 (section: .text) -> drbg_healthcheck_sanity (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: crypto_drbg_alloc+0x54 (section: .text) -> drbg_healthcheck_sanity (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: crypto_drbg_alloc+0x60 (section: .text) -> drbg_selftest_one_vec.constprop.0 (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
