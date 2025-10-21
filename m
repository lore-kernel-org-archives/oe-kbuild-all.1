Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8531EB5DB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 04:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761019642; cv=none; b=IKNeAWjlSBrukQ2y5Qtvaf4LKQ3qcNdL1VaYot7WAn1fKz9CNzb8KC/Gy+LhurpjiOfCYWV2xUSEFSGFEZrOmLpVcY2eL7q1N2Vk0Si4DOFfpq+Vu+dDgMsKQ7J2N92XWr3oUj+hJg1x8kV1QdNb/0UqNpvDULGkl06FPDl9S0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761019642; c=relaxed/simple;
	bh=q6w/HwdPUk4vJhfmuC2e6Isx+tms82N7U0MCry7YrT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XDbwgDjTRCyj+PArI4fvGtPfWb/8hDGqUQpdrhkDMdn/1ge9vqHhJN2NdJnIeeO/j57UBnahgSTynFequUJ2FxcJc+tlwwCCZ0Ep7ObKXdV4b7VVQgaSwHNn4kAr1bCMBHb395RqBPx1XhH7uQBwst9EGcB/ojWsB+6ljCFIS3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXeo0uPZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXeo0uPZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761019639; x=1792555639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q6w/HwdPUk4vJhfmuC2e6Isx+tms82N7U0MCry7YrT4=;
  b=EXeo0uPZhwcNSKLhqN5P/fBxEJ/k7j3+rLx7teOBVZ728ynWjkwySmt9
   qbvoOilpfvSlbKuxFUe+c2zvQEWZdHo1jgEgrig2ru9wqvDWdNP2xdTV7
   pIk4oIMWFqAfEb4EZMsZdpNysEKz+PRlah5+JgxbsWSOB2UqIIojIU7+X
   00BmYtFAZpM44f0cz//KgNtsXt43vD4JxXndd8p87kz7OfMm8PLhuBTDf
   +80pc6Cwv+qG0mirOwQC9bChY2NoStLQHL9Ai7x57eqRJlrRqilXaK2xq
   GICFh0udyQmj4xbfzu8v3RemJGRHt0S4eU6tSSnCE4U0wWOQ8K+uZ//oR
   w==;
X-CSE-ConnectionGUID: wEu80hP0QM6AM72QZ0qmew==
X-CSE-MsgGUID: xVm+/d6KQkSgNgNI6KLvAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62842438"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="62842438"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 21:07:19 -0700
X-CSE-ConnectionGUID: WF5D3nGkT6ifcbGD//Znrg==
X-CSE-MsgGUID: v3jd7kRvTUmHhuEykKt8VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="207170650"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Oct 2025 21:07:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB3eV-000ARJ-2h;
	Tue, 21 Oct 2025 04:07:15 +0000
Date: Tue, 21 Oct 2025 12:06:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 20/20]
 arch/arm64/kvm/hyp_trace.c:38:24: error: 'STRUCT_HYP_BUFFER_PAGE_SIZE'
 undeclared; did you mean 'STRUCT_HYP_PAGE_SIZE'?
Message-ID: <202510211149.BTrQOt61-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   2a9a81f53ac75526c6b30e27ee151e978b0830c4
commit: 575dd1da644e642dd122a5af1e81c4171af0f842 [20/20] ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing
config: arm64-randconfig-003-20251021 (https://download.01.org/0day-ci/archive/20251021/202510211149.BTrQOt61-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211149.BTrQOt61-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510211149.BTrQOt61-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/hyp_trace.c: In function 'bpage_backing_setup':
>> arch/arm64/kvm/hyp_trace.c:38:24: error: 'STRUCT_HYP_BUFFER_PAGE_SIZE' undeclared (first use in this function); did you mean 'STRUCT_HYP_PAGE_SIZE'?
      38 |         backing_size = STRUCT_HYP_BUFFER_PAGE_SIZE *
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        STRUCT_HYP_PAGE_SIZE
   arch/arm64/kvm/hyp_trace.c:38:24: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kvm/hyp_trace.c: At top level:
   arch/arm64/kvm/hyp_trace.c:488:5: warning: no previous prototype for 'hyp_trace_release' [-Wmissing-prototypes]
     488 | int hyp_trace_release(struct inode *inode, struct file *file)
         |     ^~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +38 arch/arm64/kvm/hyp_trace.c

    29	
    30	static int bpage_backing_setup(struct hyp_trace_pack *pack)
    31	{
    32		size_t backing_size;
    33		void *start;
    34	
    35		if (hyp_buffer_pages_backing.start)
    36			return -EBUSY;
    37	
  > 38		backing_size = STRUCT_HYP_BUFFER_PAGE_SIZE *
    39			       pack->trace_buffer_pack.total_pages;
    40		backing_size = PAGE_ALIGN(backing_size);
    41	
    42		start = alloc_pages_exact(backing_size, GFP_KERNEL_ACCOUNT);
    43		if (!start)
    44			return -ENOMEM;
    45	
    46		hyp_buffer_pages_backing.start = (unsigned long)start;
    47		hyp_buffer_pages_backing.size = backing_size;
    48		pack->backing.start = (unsigned long)start;
    49		pack->backing.size = backing_size;
    50	
    51		return 0;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
