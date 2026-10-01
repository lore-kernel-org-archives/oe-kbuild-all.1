Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A757416856
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 16:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871456; cv=none; b=EIPEzYt2swhixku2TTR3xWe1+E+P89m0MahE2pNWo+KIbO6wKOA2np0lnOGNAbZ3biK2UOTdIdpddMEnvGa6YvIPrJzBij7BxBvpG75GvxFLunP2X5e2zMv6LTeq7fMKUR+LEPV2iisu4Vwb0RHZUqtV4mWhoPsE94CZGq6T9mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871456; c=relaxed/simple;
	bh=IQKqZ79K+z4xeaaGU1tG+7p7QhDfnDWKmXdmaP7NLso=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oF1jhW4fV7sbcrFR2uFIq2BOq1KE3l/7nW6Ww186dA1Uht89QuadxVNPR45OZQ7p9DxBK3tFeHP/oddPTZ4hIhutExQsiwQca4/u2t1nPNIk8TIQgOZnRCRSaaIbqago3dQBDRy3Q2WHaDF1Vm3fnas0bnh2thAXGqjNtG0Dje0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXJlPA9T; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXJlPA9T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790871453; x=1822407453;
  h=date:from:to:cc:subject:message-id;
  bh=IQKqZ79K+z4xeaaGU1tG+7p7QhDfnDWKmXdmaP7NLso=;
  b=DXJlPA9TsNjvzSLodjVWbOv4x2Y+FUUPoYJg4/VQ/Gpf/mIgoE+VL0o5
   iTWPVuDjnmPrXP/2zYO0WaV5FFfJmgFegDV8L4e/QIzjTWwb+3GalVa1R
   d7lDTfrmMomQeJjL/LMH37ueh83pNJOUL0Vu9+bv8zLH7Hyt4zqWJwaPN
   uVssr+wHKR8CJlMGz55di4uGsZBU/fHEMIiPVG3cE6MJM+UkY9CVt7QCa
   wu8xtJ4UwJ/+G6gsOTicFYDWMqHDyflf609forTu5DU8nmLVHLGLnJL+m
   8FMIo41GsEz+VQJFLlZRa8yRR1STX1x7+Xyw7hqqTbjhtzHHSFhPFARlD
   Q==;
X-CSE-ConnectionGUID: 06LEdp8CSpO4U6dTQQ1P0g==
X-CSE-MsgGUID: h1QPIyl6RbCHeq6weoS7aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94118996"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="94118996"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 09:17:31 -0700
X-CSE-ConnectionGUID: mLK7hQKBSQ2wdVcJVVahNQ==
X-CSE-MsgGUID: EDbxQaK/QjqmUzNMWJrKOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="279802091"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 01 Oct 2026 09:17:31 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCJTM-0000000008n-1V6j;
	Thu, 01 Oct 2026 16:17:28 +0000
Date: Thu, 01 Oct 2026 18:17:04 +0200
From: kernel test robot <lkp@intel.com>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: include/net/route.h:176:63: warning: omitting the parameter
 name in a function definition is a C23 extension
Message-ID: <202610011840.yArMhOm4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Fernando-Fernandez-Mancera/ipv4-introduce-CONFIG_IPV4-to-decouple-the-IPv4-stack/20260928-212957
head:   9699ec4e92ef081fbb0e1a4247538ba53e5b17bf
commit: 809c9f483b87854f5b7ede3ce9ac6e372855169c net: core: add IPv4 fallback stubs and guards for CONFIG_IPV4=n
date:   3 days ago
config: hexagon-randconfig-r2304-20261001 (https://download.01.org/0day-ci/archive/20261001/202610011840.yArMhOm4-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610011840.yArMhOm4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610011840.yArMhOm4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/core/filter.c:35:
   In file included from include/net/ip.h:30:
>> include/net/route.h:176:63: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     176 | static inline struct rtable *ip_route_output_flow(struct net *, struct flowi4 *flp,
         |                                                               ^
   1 warning generated.


vim +176 include/net/route.h

   171	
   172	#if IS_ENABLED(CONFIG_IPV4)
   173	struct rtable *ip_route_output_flow(struct net *, struct flowi4 *flp,
   174					    const struct sock *sk);
   175	#else
 > 176	static inline struct rtable *ip_route_output_flow(struct net *, struct flowi4 *flp,
   177							  const struct sock *sk)
   178	{
   179		return ERR_PTR(-EAFNOSUPPORT);
   180	}
   181	#endif
   182	struct dst_entry *ipv4_blackhole_route(struct net *net,
   183					       struct dst_entry *dst_orig);
   184	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
