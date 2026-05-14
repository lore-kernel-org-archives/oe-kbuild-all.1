Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1DB199FAB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 01:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778721420; cv=none; b=STPxuGRo80ZrsXM7HCX+7zSNjKneucpCrSe1s0VsECiGlW5OM3WvCQMDtBykUNWeQKrc9w3gIfTM9f0m+yy+zyCgJIkAK2jcRd6x1narsFXeiTsjEUYdBPHak/IJITKXkay2e3y/h05RAuyAo5hFF9aA/bLsAfard0Fok23tXnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778721420; c=relaxed/simple;
	bh=F2wT7xOY2xmPhGpLCUwD/p3nluJkgqS+NBFNHH5y5SQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rEjf6F8Jxoozcab2FT9Ooay9MN2cZ7BCNJPASC8wK+INdSx18MHY3V5ssJ9e2VTTvI200O92YF18z9nI+bQCunMTlRF88RM8lK95Mo4eSFTQpay/pCbFYINnQYA065/0kz6ZduIuAd3nhhAkRSiw5fm1scjKoiS8195fYxGhZ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPTpu+TI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPTpu+TI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778721417; x=1810257417;
  h=date:from:to:cc:subject:message-id;
  bh=F2wT7xOY2xmPhGpLCUwD/p3nluJkgqS+NBFNHH5y5SQ=;
  b=GPTpu+TIeGz11IbJrlNGW/C9/coK4fztM3HwaaEKNZQBM/RBkL+pz3Eu
   SieZgeklzu1nVb0dhqPg0f1FRSwkA5zxDrXCUVISTCVfLzP3yhpjZIhT0
   yqyR7WSwitKHdnn6iteTkeWDe8JZ8dgRNFtpThc8IbtnoUO9S2dRnVo8D
   ErU3eVpE8AP9n3Do5vwrME+ppAnoTaUZU4zgfGw1kBFYM3PUI9fZBeVM2
   81xvBez9iP+X8rexCIJNhgYPKHn511YCG8F0hpTHB7xWDjfqFxq85efnz
   I/NeF1apT0L7wr98O+rv1d7gUaEzdptGyDLyC21Z1NJuEUbfOpOopkw+b
   w==;
X-CSE-ConnectionGUID: gygXV+mbR/6WUlBzVcF96A==
X-CSE-MsgGUID: 5X1C2GQDS2WoGfnFSkV6rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="102326662"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="102326662"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 18:16:57 -0700
X-CSE-ConnectionGUID: nY6K6HOMSB2KplTwTPWcZQ==
X-CSE-MsgGUID: dnz1LcPKRoeEtFthOMip7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="242243383"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 May 2026 18:16:56 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNKh3-000000005V7-0Vjr;
	Thu, 14 May 2026 01:16:53 +0000
Date: Thu, 14 May 2026 09:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>
Subject: [linuxsecuritymodule:next 7/11]
 security/hornet/hornet_lsm.c:52:1: warning: control reaches end of non-void
 function
Message-ID: <202605140941.UsMxcqGo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/LinuxSecurityModule/kernel next
head:   7cd0da3c29d22e2a8dcbc995b12199bc3d2704a8
commit: c62310df81899f7e14d632271aba08d0a55e2318 [7/11] lsm: introduce the Hornet LSM
config: arc-randconfig-r072-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140941.UsMxcqGo-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140941.UsMxcqGo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140941.UsMxcqGo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/hornet/hornet_lsm.c: In function 'hornet_bpf_prog_security':
   security/hornet/hornet_lsm.c:51:18: error: 'struct bpf_prog_aux' has no member named 'security'
     return prog->aux->security + hornet_blob_sizes.lbs_bpf_prog;
                     ^~
>> security/hornet/hornet_lsm.c:52:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +52 security/hornet/hornet_lsm.c

    47	
    48	static inline struct hornet_prog_security_struct *
    49	hornet_bpf_prog_security(struct bpf_prog *prog)
    50	{
    51		return prog->aux->security + hornet_blob_sizes.lbs_bpf_prog;
  > 52	}
    53	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
