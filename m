Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E53B27B4FA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 20:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770237457; cv=none; b=JSi/zEQCs1XoH1GOqjO2vo3nSrq1DiIXHG95YvxMx+83XQkwtFk4E34LC5PrrgADeMixBXLwUbZOxdPPWcNqwoPq+XUWEfkCN0qUw3ZUGPs2QfdluQ0DQm0ystQPvyCTExUPNR3XEGzEiO/DSMvUH80y+yXKmiRSHd95E7oua2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770237457; c=relaxed/simple;
	bh=KQ332KGp0t+OA7V6Miplj4l+dawu0Vq7o9uqU0CQ3Rw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iJBixyN1zWpKY+zzK1Gva+kJbvWFi1JnMHXYE06IFmKmR9bCVFMi0dVpiMkWgCb3HyTsM/fPv6esI+LM9jQW14USh2MjMLc2E1P4k/6/+g+UcdRCkzucGspX67No8kcAMrT7pQ+P0M+U6TTsQaFEXgG1autr/+SsrHtXYlqMzFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eS/+45hT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eS/+45hT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770237458; x=1801773458;
  h=date:from:to:cc:subject:message-id;
  bh=KQ332KGp0t+OA7V6Miplj4l+dawu0Vq7o9uqU0CQ3Rw=;
  b=eS/+45hTBrL3h85TOQXIYVUbfcdiyuru639GuXTcYVoHYz/IhOwT07XG
   dzFhq278yBmTFyN/yJP2LImOPp3UEUx8gTo6q+utvcKYQul4k+W/7o3vT
   wKFoLYlXOYoZqpBio8MhHWklyZZlDk2yjiHlu7oQ5/v7DSeiaoKdqVApX
   O/+TDfBN0eHYjf8iIkrIt0hKG1Q1KOp6GL15HsjYlNOguliDZsYMlR+Qw
   NzY1RH9tDJrTqZarSEzANxM8Tw57M2+ADJQbJ9P1JPQDftqQXAP/VSzg7
   4kFaaKBKZixGGEowp5P9Se6H+6l7EeevE5WFifaV3t/HMmIf/C9ndOJqX
   A==;
X-CSE-ConnectionGUID: jlm+XJ5CS5CJnVKdZbrwnQ==
X-CSE-MsgGUID: FQQnH/A/Syi1rDuknImerg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94084570"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="94084570"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 12:37:37 -0800
X-CSE-ConnectionGUID: Zg7MJyBPR8isZidbWlNXGg==
X-CSE-MsgGUID: 0TZbzA6ASHOQB1iKv5MKng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="210366654"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Feb 2026 12:37:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnjcz-00000000jA4-0FjE;
	Wed, 04 Feb 2026 20:37:33 +0000
Date: Thu, 05 Feb 2026 04:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 7/7]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1887:7: warning: assignment to 'const uuid_t
 *' {aka 'const struct <anonymous> *'} from 'int' makes pointer from integer
 without a cast
Message-ID: <202602050432.4Fdhj5aG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   58a6dbc28186dd4bc9d1957f87b158b0f7837c82
commit: eff36ac2fe9748dfe31b22d00b62f6eaf7323732 [7/7] ANDROID: KVM: arm64: Add TRNG handling for protected guests
config: arm64-randconfig-r063-20260204 (https://download.01.org/0day-ci/archive/20260205/202602050432.4Fdhj5aG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602050432.4Fdhj5aG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602050432.4Fdhj5aG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
    bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng_rng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1868:8: error: implicit declaration of function 'module_get_guest_trng_rng'; did you mean 'module_handle_guest_trng_rng'? [-Werror=implicit-function-declaration]
     ret = module_get_guest_trng_rng(entropy, nbits);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
           module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1887:9: error: implicit declaration of function 'module_get_guest_trng_uuid'; did you mean 'module_handle_guest_trng_rng'? [-Werror=implicit-function-declaration]
     uuid = module_get_guest_trng_uuid();
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
            module_handle_guest_trng_rng
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1887:7: warning: assignment to 'const uuid_t *' {aka 'const struct <anonymous> *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     uuid = module_get_guest_trng_uuid();
          ^
   cc1: some warnings being treated as errors


vim +1887 arch/arm64/kvm/hyp/nvhe/pkvm.c

  1879	
  1880	static bool module_handle_guest_trng(struct kvm_vcpu *vcpu)
  1881	{
  1882		u32 fn;
  1883		u64 ret = SMCCC_RET_NOT_SUPPORTED;
  1884		const uuid_t *uuid;
  1885	
  1886		fn = smccc_get_function(vcpu);
> 1887		uuid = module_get_guest_trng_uuid();
  1888		if (!uuid)
  1889			return false;
  1890	
  1891		switch (fn) {
  1892		case ARM_SMCCC_TRNG_VERSION:
  1893			ret = ARM_SMCCC_TRNG_VER_1_0;
  1894			break;
  1895		case ARM_SMCCC_TRNG_FEATURES:
  1896			switch (smccc_get_arg1(vcpu)) {
  1897			case ARM_SMCCC_TRNG_VERSION:
  1898			case ARM_SMCCC_TRNG_FEATURES:
  1899			case ARM_SMCCC_TRNG_GET_UUID:
  1900			case ARM_SMCCC_TRNG_RND64:
  1901				ret = SMCCC_RET_SUCCESS;
  1902				break;
  1903			}
  1904			break;
  1905		case ARM_SMCCC_TRNG_GET_UUID:
  1906			smccc_set_retval(vcpu, le32_to_cpu(((u32 *)uuid->b)[0]),
  1907					 le32_to_cpu(((u32 *)uuid->b)[1]),
  1908					 le32_to_cpu(((u32 *)uuid->b)[2]),
  1909					 le32_to_cpu(((u32 *)uuid->b)[3]));
  1910			return true;
  1911		case ARM_SMCCC_TRNG_RND64:
  1912			return module_handle_guest_trng_rng(vcpu);
  1913		default:
  1914			return false;
  1915		}
  1916	
  1917		smccc_set_retval(vcpu, ret, 0, 0, 0);
  1918		return true;
  1919	}
  1920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
