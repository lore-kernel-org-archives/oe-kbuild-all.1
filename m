Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016C21D5CEA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 03:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766545559; cv=none; b=KYfjFDIj+JFU4w5xKFDFv3MvQKtxihF7qQg3R1TwVJJTEPeh+f4PgO+jusoKnwuY7QZAz5/s7NE/igH8LTyHPYdV1XrsiLmNL2+XBa0do6Lpg9dIlqfd7zTUIC1d4rl4rbfRyXiuBPg1w9042tjaGRVKqDbDj7UO2D5Cpn2r/+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766545559; c=relaxed/simple;
	bh=uuuatFyh3bK42ZXZ7w27d9BQNCVhM+cHsZMBJztR+eg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rnnzJoQLG2+Q95dDj+SONmm+7K8M0mAvtuinujxKCL+OcIOeRoMC6ha14NWctqOut+zSoHs32vz81KvzMNi51Z35m6CMRLMAEUwAfMtMDm/buvT/KstIEZM3dYeHiplmyizWgKPQX8PIM3A5xlukixbJbCi/QC2nGx0UuzC+UEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIPAsH0D; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIPAsH0D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766545559; x=1798081559;
  h=date:from:to:cc:subject:message-id;
  bh=uuuatFyh3bK42ZXZ7w27d9BQNCVhM+cHsZMBJztR+eg=;
  b=oIPAsH0DhY6xvvSTLXslAqH7BUi7oIsfyx+TRhq0lwjROYGqHOSBD3Sa
   56C6SGj2ZsT+GTsmJAho1Ib76/QrIg/B7Mhwb4TGy+YwI6vL93LcSgxFe
   hzpXHk/ccrTl9254Xv9abcAOI5h1Uy9yGSqt/B2DUZJfcGNwPyl7XwjLp
   mj0hePYiTv9PzS1VOAXa9IlQ9OTqi6rTZ6PlK8WJTZJiLrWEjrqxo8Xrh
   wyc25mIhrdCe47cULKoxsyK/7+J9hsPYUamOONrQs3WzkWcG0hwrrj1Xk
   jOGYmQHP5Gavy/gmnMnoAxUIdn4+mFiVA6nRnDDkV2wwOpIxvpJceU0c0
   w==;
X-CSE-ConnectionGUID: e2y6+dauSfCFsbxIpqEMUQ==
X-CSE-MsgGUID: ioUn5ugyTQ6TMdHMtukVhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68147178"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="68147178"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 19:05:58 -0800
X-CSE-ConnectionGUID: 59sUSixdQDaVpSjRKV+EsQ==
X-CSE-MsgGUID: MWgeZCTQTHGExptwUT/Lrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="199955702"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Dec 2025 19:05:56 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYFC8-000000002bx-2yFF;
	Wed, 24 Dec 2025 03:05:49 +0000
Date: Wed, 24 Dec 2025 11:04:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:57:41: error: initializer
 element is not constant
Message-ID: <202512241032.l0LWdACh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Quentin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   48ed03a80ad49e3648c77d8c2c1ca10e706d6215
commit: f4c9f74c6bf846c2a77b25a8d93509e9ea00192a [1/1] ANDROID: BACKPORT: KVM: arm64: Zero protected guest pages on teardown
config: arm64-randconfig-001-20251224 (https://download.01.org/0day-ci/archive/20251224/202512241032.l0LWdACh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241032.l0LWdACh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512241032.l0LWdACh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:29:0:
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
