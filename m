Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC76119CC0E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 14:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317897; cv=none; b=NbzIH5tqukGPhH7tEBlvrwCXXue2fkAexcZREwVJrTTpXzPNTrxhqjPf9icKvQV4a8ze4HACZ1B6BAeIMWjK69D+ZOnmSocNaeulZ3UR784kfgMXx74Q/d36nnXC2LO3tIDhwuuyVZ8STFV2GtvZzV3HiKNOMVWlK90mhf5xDt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317897; c=relaxed/simple;
	bh=1jea10n0om2WqkAggStATkb/3uHACf7arrYPKuJYEOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IxTHW1KUNw5ze5egyI9aXItB0hnEOWjrm74C6PeJXD+Harx3FghFa3PKKSyAKf4HNTsVmzb5nZyH+JawokjuCeEO3gmNgHFG8fUQSo35SjpPrsX/x58Vb4fY9Ol6W+ZiTWd3aN+xw31gvB3F8txaYjiMRWmODT1Rg//njcwYG+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6zvrORi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6zvrORi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317896; x=1778853896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1jea10n0om2WqkAggStATkb/3uHACf7arrYPKuJYEOg=;
  b=S6zvrORicEPYkKK8Za510bZT4GPdfZjT+uKEf/G01ahdgGSsEZRWLZE6
   M7ARg6TpCEuJmVhPMB85k5gxnhAaLyXZ6ZVcmfAixpvzm53bmgJ9vc/uX
   UwLU0ZTW1ypsECfp+ez/tWHXpOrmRYWdLABQy63H4AZUeqYW1JmKvo2Jx
   XqV2yFpQ8MIM4yItSL1WCehItG/Tkh3v+39RfKVT790HzTHUJP6rqaAs/
   nPmfrk6HqSUCnRuwztyDXXdnhWDIhvH6/detC4BsBs1ng/2MDaw4PdeTV
   5jBS8buR91dNN+ilvrlnXbuNDA8jj8qs5/NQWvseIYwcRcWeIEkSiNdor
   w==;
X-CSE-ConnectionGUID: esdIRvbGTxOiEAIVZyjPqw==
X-CSE-MsgGUID: Em+NL7NJThahOYuOzhsNXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48943626"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48943626"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:04:52 -0700
X-CSE-ConnectionGUID: 3FaqudcHRW2724+A4foTWA==
X-CSE-MsgGUID: ze2MQpzVRLiyQM8zGX2Hew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138778841"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 07:04:50 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZCa-0000F3-1Y;
	Thu, 15 May 2025 14:04:48 +0000
Date: Thu, 15 May 2025 22:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2229/2229]
 drivers/crypto/ccp/hygon/psp-dev.c:25:10: warning: no previous prototype for
 function 'atomic64_exchange'
Message-ID: <202505150643.AFNuSCPC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a53913bacac4876eee9ce118b3101dff842318ef
commit: fe08767e3a083e73a72f08432bc6fbd864fa7179 [2229/2229] drivers/crypto/ccp: concurrent psp access support between user and kernel space
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250515/202505150643.AFNuSCPC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150643.AFNuSCPC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150643.AFNuSCPC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/psp-dev.c:25:10: warning: no previous prototype for function 'atomic64_exchange' [-Wmissing-prototypes]
      25 | uint64_t atomic64_exchange(uint64_t *dst, uint64_t val)
         |          ^
   drivers/crypto/ccp/hygon/psp-dev.c:25:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      25 | uint64_t atomic64_exchange(uint64_t *dst, uint64_t val)
         | ^
         | static 
>> drivers/crypto/ccp/hygon/psp-dev.c:30:5: warning: no previous prototype for function 'psp_mutex_init' [-Wmissing-prototypes]
      30 | int psp_mutex_init(struct psp_mutex *mutex)
         |     ^
   drivers/crypto/ccp/hygon/psp-dev.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      30 | int psp_mutex_init(struct psp_mutex *mutex)
         | ^
         | static 
   drivers/crypto/ccp/hygon/psp-dev.c:38:5: warning: no previous prototype for function 'psp_mutex_trylock' [-Wmissing-prototypes]
      38 | int psp_mutex_trylock(struct psp_mutex *mutex)
         |     ^
   drivers/crypto/ccp/hygon/psp-dev.c:38:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      38 | int psp_mutex_trylock(struct psp_mutex *mutex)
         | ^
         | static 
   3 warnings generated.


vim +/atomic64_exchange +25 drivers/crypto/ccp/hygon/psp-dev.c

    24	
  > 25	uint64_t atomic64_exchange(uint64_t *dst, uint64_t val)
    26	{
    27		return xchg(dst, val);
    28	}
    29	
  > 30	int psp_mutex_init(struct psp_mutex *mutex)
    31	{
    32		if (!mutex)
    33			return -1;
    34		mutex->locked = 0;
    35		return 0;
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
