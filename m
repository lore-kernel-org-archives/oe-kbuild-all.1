Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922DE134A9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709883230; cv=none; b=fH3NOo6lY2+c+EE7Qu0ZiLx0w2LfjB+XoEoMMRVC6XJsrjcdADPjO9KIDsx0bK3lLC1LfNMv7B58oivolndfs7aF27K6mnhthL4CJEmQ/uoPUeGuGaxI82r7mIqmfJHJNWSSdpRrulZziuQTulFtB12vBIEgjKeSWOOsLBR1Fcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709883230; c=relaxed/simple;
	bh=9h57+o79+x/MBKZxWfUiXqskA6V/EfPDNx/IxCIVovY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BLsfIoeWaznSBqxJBaLgAJueBaUqZCdo/bI4KCEW/q2/DSIHwP0d3dgFOiSaxBwxo5hhXK3Ux3AIyD4oNq/9qQbstqZWV8jv5Q2wIi1h0w9GdweTUMeyF7uQs3nJJwNPoMzvG77ed2kwfUEjgveSpc6QOaf7E48ENrIsfzOQK2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lrbjn0lj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lrbjn0lj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709883229; x=1741419229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9h57+o79+x/MBKZxWfUiXqskA6V/EfPDNx/IxCIVovY=;
  b=Lrbjn0ljyEl7GWa3WDxgdxO2LXN5QX18TGyeax88KU+Y/iST4I64dm7a
   LiXj6rD+eBHMSA87ht6a5iWMDZQcu0ZwOtp3Jljn6d3+zIf8gf83RpuaP
   tsJEfPWKPl/o4rhvrobMRdRBi/OWRL5IJLTzINOBOn9Ctj/dfRdsx+zEw
   ED6vQVsGFVJV6i/o3Gg+l1gSKsATxGXC2OAYkP6Nr3XaBRauc0ic0e806
   cmnYPaQaxEIuKX30lDJIPPoR1IIFNJlSPDYHcwjB0CLweyH3M9ILhwrOb
   ntToIuLbcWFHnBNs1RcJWwsMkIXtw5b05bjbCZhpexT8Pi7SgwzlnYwgE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4451783"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4451783"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 23:33:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="41293621"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Mar 2024 23:33:43 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riUjc-00069x-1p;
	Fri, 08 Mar 2024 07:33:40 +0000
Date: Fri, 8 Mar 2024 15:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 9111/9226]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:39:1: sparse: sparse: symbol
 '__pcpu_scope_host_hyp_reqs' was not declared. Should it be static?
Message-ID: <202403081524.OM0sNdKL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e9c73e0594e0bdb3b71e4e1fbb49cf903d73c5d7
commit: 70ade4bab360fa86696d8c60412d0de98bb9645b [9111/9226] ANDROID: KVM: arm64: Encode hyp requests in HVC return
config: arm64-randconfig-r122-20240307 (https://download.01.org/0day-ci/archive/20240308/202403081524.OM0sNdKL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240308/202403081524.OM0sNdKL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081524.OM0sNdKL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:39:1: sparse: sparse: symbol '__pcpu_scope_host_hyp_reqs' was not declared. Should it be static?

vim +/__pcpu_scope_host_hyp_reqs +39 arch/arm64/kvm/hyp/nvhe/hyp-main.c

    34	
    35	/*
    36	 * Holds one request only, in theory we can compress more, but
    37	 * typically HVC returns on first failure.
    38	 */
  > 39	DEFINE_PER_CPU(struct kvm_hyp_req, host_hyp_reqs);
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
