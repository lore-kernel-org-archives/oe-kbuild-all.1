Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811CF1822E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 17:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731776755; cv=none; b=lpwe3tv5gQuc2JLOWF35y9VjowpIvdnz7/qLg+qCmHBmIKAux/rxT67sxgCFktewWR08RIDCOeSMCIn8DXFeSRylyjrzHIe78/qOO5UGMIY5aIggu4otC1m3KwUk7wgsa53r/CSgaECFCfG69XCLdIlzUGM3cStKyQPJwsGSoiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731776755; c=relaxed/simple;
	bh=0y9PTAuQJ6B+rcpsMvKRn31NcwOaKpV4EgMXNkEQlcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W8xy9CC1eUsyTe6lHsFSbAXiLstPzs6mdu41sd06O2iWbPF0678YMpPY8WUeEOiOpwRVqGwSPja/fWr9qFFsnEhJH+JtUpC+NKTiknsmwPpSi4tDXBZQ0h23LHsHzUb6JQM/U9fvzYzg7mgJzDNyeQkhYIQowIa74uE/ZqKSuxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qe8RvChH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qe8RvChH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731776753; x=1763312753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0y9PTAuQJ6B+rcpsMvKRn31NcwOaKpV4EgMXNkEQlcc=;
  b=Qe8RvChH7j747eNm8q41Ne+bFtThmnaREIPBxX1V78BMxInk1gnmGDJP
   QuMDf/nMu9d/QjOlw9mEUhUiOjzmwqDU+b6YvfJTZRZGtliUaBFCT29j4
   iQxG4syKX9HsOEpTbodMTUcfzuq8jDc0QRRlkBk9TeE8gY4XaQK3hEtRv
   uJCh9EoH0l7VpfzmtEC+Zc4wvkKsvzXZ+MHTS5fgqieotBn4yqLVijdhT
   1bP98qGn1Y7pCKCz1QbcnVKf9uLK3/bzwfNaEHuDBm18PBiYr2UMArx60
   SCziQ8J41/ThSC9LWDqBURSr4hFebD0u3XWH7smf9/RWMatuRO1Mpyep4
   w==;
X-CSE-ConnectionGUID: sKFqVPGqTkKS5NdXXatexQ==
X-CSE-MsgGUID: MZPuCUQqRgutU9hn+ZjIyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42298726"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="42298726"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 09:05:50 -0800
X-CSE-ConnectionGUID: igJbdNq/S2Sr7apXLd4Vfg==
X-CSE-MsgGUID: ry67RdFRRc+X+2V0lW9V6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="93775742"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Nov 2024 09:05:49 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCMF0-0000zL-2g;
	Sat, 16 Nov 2024 17:05:46 +0000
Date: Sun, 17 Nov 2024 01:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop-pkvm-ia-2024-15-11-v1 156/259]
 arch/x86/kvm/x86.c:9954:5: warning: no previous prototype for
 'kvm_pkvm_hypercall'
Message-ID: <202411170014.9Jb2vQho-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop-pkvm-ia-2024-15-11-v1
head:   ab957086535d11209d7d6dd96172900d714fb5fb
commit: f8f823218b4ef3fc30f8cb32735799b1ede9a4c9 [156/259] ANDROID: pkvm: x86: Add the handler for hypercalls of PV MMIO operations
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241117/202411170014.9Jb2vQho-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170014.9Jb2vQho-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170014.9Jb2vQho-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:9954:5: warning: no previous prototype for 'kvm_pkvm_hypercall' [-Wmissing-prototypes]
    9954 | int kvm_pkvm_hypercall(struct kvm_vcpu *vcpu)
         |     ^~~~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.c: In function 'kvm_pkvm_hypercall':
   arch/x86/kvm/x86.c:9970:14: error: 'PKVM_GHC_IOREAD' undeclared (first use in this function); did you mean 'KVM_TRC_IO_READ'?
    9970 |         case PKVM_GHC_IOREAD:
         |              ^~~~~~~~~~~~~~~
         |              KVM_TRC_IO_READ
   arch/x86/kvm/x86.c:9970:14: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kvm/x86.c:9974:14: error: 'PKVM_GHC_IOWRITE' undeclared (first use in this function); did you mean 'KVM_TRC_IO_WRITE'?
    9974 |         case PKVM_GHC_IOWRITE:
         |              ^~~~~~~~~~~~~~~~
         |              KVM_TRC_IO_WRITE


vim +/kvm_pkvm_hypercall +9954 arch/x86/kvm/x86.c

  9953	
> 9954	int kvm_pkvm_hypercall(struct kvm_vcpu *vcpu)
  9955	{
  9956		unsigned long val, nr;
  9957		int size;
  9958		gpa_t gpa;
  9959		int ret;
  9960	
  9961		nr = kvm_rax_read(vcpu);
  9962		gpa = kvm_rbx_read(vcpu);
  9963		size = kvm_rcx_read(vcpu);
  9964		val = kvm_rdx_read(vcpu);
  9965	
  9966		/*
  9967		 * Reuse the sev_es handler to emulate the mmio.
  9968		 */
  9969		switch (nr) {
  9970		case PKVM_GHC_IOREAD:
  9971			ret = kvm_sev_es_mmio_read(vcpu, gpa, size,
  9972					&vcpu->arch.regs[VCPU_REGS_RAX]);
  9973			break;
  9974		case PKVM_GHC_IOWRITE:
  9975			ret = kvm_sev_es_mmio_write(vcpu, gpa, size, &val);
  9976			break;
  9977		default:
  9978			ret = 1;
  9979			break;
  9980		}
  9981	
  9982		/*
  9983		 * We assume calling this function will always success which will update
  9984		 * the GUEST_RIP to skip the current instruction.
  9985		 */
  9986		static_call(kvm_x86_skip_emulated_instruction)(vcpu);
  9987	
  9988		return ret;
  9989	}
  9990	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
