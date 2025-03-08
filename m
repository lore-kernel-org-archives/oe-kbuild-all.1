Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5539196
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 00:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741393326; cv=none; b=CdkUNSPWgJ6Owe5s8C1J16LKACSF4+bjuXSEY1SlXQAUdB24wmGOJ4ey8wfVOX0Q88f+H/hqrcDL9yvio/mkmFQCwv4m95du+q3C+/38GV2TKHhA7cJcUSMOxw/T8ow8tN9Fgkg8+ecJqzm3mYvC+E4d3wFgQviScGq6k4rIO7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741393326; c=relaxed/simple;
	bh=AOkf+i4BWhowiuStYc3AO5QZ1TCrnndpDHIUV012trc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rd4maP/ehuES77zZRFDsXmGLWEREaoqDIa8VR/4z/MWkUyhDN2rSUH+QzWpMvdh2eeIXJHXBPz+kCC06+nfrs6Uw8EZe8CW4+rW9Ra0sRZjVjD4jwJRvMaaXyhj+xrbonh2fGrc33oGNvtim2qOOytdv5jZqhttogDU2j8fdck8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h5brYw1J; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h5brYw1J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741393325; x=1772929325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AOkf+i4BWhowiuStYc3AO5QZ1TCrnndpDHIUV012trc=;
  b=h5brYw1Je0ljgLn7N8oolMCrQ714ZCOdwQuQYwtNfgEr1R/jhGunG9M7
   S9idYvA2Y44YEX1IuiPsxduA6oHCCFAmMv80b/kdQYDJQEz39n7NUUHNG
   AyO3eJivG25+SlI1JDKjkCftAfLmbWJETLxTxdL2YMrysWVmamF3JDsSf
   ASDQ5HXooKlsEiHyV5qjFFUQELkHHWXLjiN/jpU691SuB/O7jGV6pU0+I
   Sjo9+mZQK4QIzRsQ2CmAuYoQljayfPakU/BbeJlOv/nPgPSRCaDcfWSJQ
   8W3WWjeaURbS8l4N2MxUvj5+V396+hxFlIg09diriSkeYPAbq+hksuxGL
   A==;
X-CSE-ConnectionGUID: opLyl1iQQrqXJMX4q6dQ9Q==
X-CSE-MsgGUID: RV8ZKBlITYegdJ910IWeHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="30033848"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="30033848"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 16:22:04 -0800
X-CSE-ConnectionGUID: lr6Ec7lFQy+y9QVdn998tA==
X-CSE-MsgGUID: ZXEaOOGzS92ZzLaWF567pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119399523"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Mar 2025 16:22:03 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqhx2-0001FP-2Q;
	Sat, 08 Mar 2025 00:22:00 +0000
Date: Sat, 8 Mar 2025 08:21:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] arch/arm64/kvm/mmu.c:305:1:
 sparse: sparse: symbol 'kvm_pinned_pages_insert' was not declared. Should it
 be static?
Message-ID: <202503080805.LDWGMCbX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   7a06b9d5eb52e054458ffa87d3e69b7a5d9db1d5
commit: 6cf1f36e41a79cd8275eab61d29ad30219b60047 [1/1] ANDROID: KVM: Use interval-tree for kvm_pinned_page
config: arm64-randconfig-r122-20250307 (https://download.01.org/0day-ci/archive/20250308/202503080805.LDWGMCbX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250308/202503080805.LDWGMCbX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503080805.LDWGMCbX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/mmu.c:305:1: sparse: sparse: symbol 'kvm_pinned_pages_insert' was not declared. Should it be static?

vim +/kvm_pinned_pages_insert +305 arch/arm64/kvm/mmu.c

   304	
 > 305	INTERVAL_TREE_DEFINE(struct kvm_pinned_page, node, u64, __subtree_last,
   306			     __pinned_page_start, __pinned_page_end, /* emtpy */,
   307			     kvm_pinned_pages);
   308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
