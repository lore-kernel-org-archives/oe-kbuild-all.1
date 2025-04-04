Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E44914EC5B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 07:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743750837; cv=none; b=YQWsApbKDTxZbu4i1p9+y8ie/RUOcn6Nywhk3y+ZcN8mbQddDXYpjlSIVR6cSgPisw2BIheIw65zjprrt58A5ijwlQUmf3Gk/D48tbc3jni2XP5YI562DN4VAusCghc69EfUU6wXgPkrLDanD9pKtuXAn9cIorTYTLzw7ajg1og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743750837; c=relaxed/simple;
	bh=Y7xg3/ZCl2aHVv5aU3ZNBhHfdEHAya/b5caov8Dq944=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nuEqEcMgDBYMd602RotVPiCvdaR4lWAxBWhPo5fNmP0Ku3w/n+wCOtqHlJHcdWaRaex5HMU+pH1pHe2WvDrMtbElnEpPiy7Z1mWshzaqfzCNKfLkjBC+hYrL6io7PwZiZJu8vcTko3gHUHiNoRul515jrXP+Mp/smKBuwP5v0m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K8Ym5jKb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K8Ym5jKb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743750835; x=1775286835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y7xg3/ZCl2aHVv5aU3ZNBhHfdEHAya/b5caov8Dq944=;
  b=K8Ym5jKbz3AVgvvtV+2ai/PoWrrCV+JEHGIvng4UtMetHsSvBOQD3hB/
   1hKOD6Xac9z7fRB03Vr0qTPS8ZMhV8YqTAolGAcxu3qAAmc+/1PlBosS7
   vtoW9PDN2Y7x9VcfEoa+oXSCcMly4l7NETm3gO7KJ0C09RkQURxtRtHD2
   +QiIo97fTXneKJdFAP7VuLppyfh5mnGXDHNIbqpZLsCVfHkQ57ElurgF6
   aega6WjE49HVB0eaUPWdqcfMARqcR5/Te64Cs31TSg2+NKjwszK6j4+qw
   ns1HYnQmvPdRZJx/N/hdINorKEqJPH1EOvvVjjsRLcn6C0T2CVLohNAiG
   A==;
X-CSE-ConnectionGUID: wIojm0BfRlClYnbfoBjBpg==
X-CSE-MsgGUID: HpVDb6iHT7q0jq+yFAkmhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="56170106"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="56170106"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 00:13:54 -0700
X-CSE-ConnectionGUID: l0Es7jt1S1iYYIqyGSewHA==
X-CSE-MsgGUID: 02otLAJASTWMTADjtfBcBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="132094173"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Apr 2025 00:13:54 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0bFP-00013R-0X;
	Fri, 04 Apr 2025 07:13:51 +0000
Date: Fri, 4 Apr 2025 15:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2024-11 1/1]
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:57:41: error: initializer
 element is not constant
Message-ID: <202504041556.Zt7rpE0d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-2024-11
head:   244182e5e5f40b4d38cfc68ec28fef023c9c9148
commit: f4c9f74c6bf846c2a77b25a8d93509e9ea00192a [1/1] ANDROID: BACKPORT: KVM: arm64: Zero protected guest pages on teardown
config: arm64-randconfig-002-20250404 (https://download.01.org/0day-ci/archive/20250404/202504041556.Zt7rpE0d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504041556.Zt7rpE0d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504041556.Zt7rpE0d-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/tlb.c:11:0:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:57:41: error: initializer element is not constant
    static const pkvm_id pkvm_host_poison = pkvm_hyp_id + 1;
                                            ^~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:57:22: warning: 'pkvm_host_poison' defined but not used [-Wunused-const-variable=]
    static const pkvm_id pkvm_host_poison = pkvm_hyp_id + 1;
                         ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:55:22: warning: 'pkvm_host_id' defined but not used [-Wunused-const-variable=]
    static const pkvm_id pkvm_host_id = 0;
                         ^~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/iommu.h:8:0,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:19:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:57:41: error: initializer element is not constant
    static const pkvm_id pkvm_host_poison = pkvm_hyp_id + 1;
                                            ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c: In function '__pkvm_host_reclaim_page':
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1804:2: error: case label does not reduce to an integer constant
     case pkvm_host_id:
     ^~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1807:2: error: case label does not reduce to an integer constant
     case pkvm_host_poison:
     ^~~~


vim +57 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h

    53	
    54	typedef u32 pkvm_id;
    55	static const pkvm_id pkvm_host_id	= 0;
    56	static const pkvm_id pkvm_hyp_id	= (1 << 16);
  > 57	static const pkvm_id pkvm_host_poison	= pkvm_hyp_id + 1;
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
