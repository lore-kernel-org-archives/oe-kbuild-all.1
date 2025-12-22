Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE98242D60
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 07:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766389932; cv=none; b=Bxgk4SyMKhDkIWAjK/maZEplr/yGdDAnQsiC0fa1VANdccQ6+NdyHcYS9RHV/TOkmCVqsyTxbd49Ijcy+/wSitSgz1FiN7pQdHV7km2S3/z9h9dOUyHykwxaeBUWINSeoQE9bJn2KsAetgvAqMJMcCB9JZ5AqDmmJGUZSqpz1RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766389932; c=relaxed/simple;
	bh=QdRJLQ4xT7k5yTAlsEr40fqWSn+VP5mEcFRJUx6gYKs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YAAHP2haEGcbAmHYhM0zjeHLxVzuYRpEUH5JAIzQ/c5tp03I1zpNR0UOdNdkgClU5SBULLXnhbStpDwxGJy0gB3o/3ndWj8wYeDCblkgJodRbaXteePVFxsxP0hq1lkJjQveICkP6aZTvn+E0Msy5No7P2rY/U4WidLdf6I/OAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6zSEJVK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6zSEJVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766389930; x=1797925930;
  h=date:from:to:cc:subject:message-id;
  bh=QdRJLQ4xT7k5yTAlsEr40fqWSn+VP5mEcFRJUx6gYKs=;
  b=b6zSEJVKUtHAwZYHuL6CMJZJOkgwu3+PnFfBKKA9xQeH/7sigUncy2wD
   4AnQAFyTb6ZNj8ul9vJVXL2F57FmvXmcxs7ss06RhkJE5RLtU0IqhgFa5
   +cn1uCYvLPOHah0G8sT11fRIEzTNw/pOaa9Spkiyi0eoE1tfEphFR0POv
   jtJZozsFjOYWR+NcPUpcXLkKSLc9VAvKkFMNn339Cz1YdCdgduovlGNfg
   UTUTzKEnrM+SCmS2oekHqI+7OFrb9vAgxtROkc+nR+6lOiqyQacIHJTap
   B9mo33UwmqVYbG0rxmC7XNIjD9Jcfdsja3La9bp1WKt976FNIu6kRAwIt
   w==;
X-CSE-ConnectionGUID: RvTKPrNBSg6hfvGVPGO3KA==
X-CSE-MsgGUID: J3nrnYCMSjqowweOqvB5LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85827410"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="85827410"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 23:52:07 -0800
X-CSE-ConnectionGUID: rZZlHpP1TGe5lm3Uh+k6ug==
X-CSE-MsgGUID: Dg8drpXATI+KJPMIWBGT4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199372709"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2025 23:52:06 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXahy-000000000ER-2mch;
	Mon, 22 Dec 2025 07:51:59 +0000
Date: Mon, 22 Dec 2025 15:51:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1887:14: warning: assignment to 'const uuid_t
 *' from 'int' makes pointer from integer without a cast
Message-ID: <202512221629.CQk3R3hD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   dd9cf1ba4061205cb672a7eec2206deec201c5eb
commit: eff36ac2fe9748dfe31b22d00b62f6eaf7323732 [6/6] ANDROID: KVM: arm64: Add TRNG handling for protected guests
config: arm64-randconfig-003-20251222 (https://download.01.org/0day-ci/archive/20251222/202512221629.CQk3R3hD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221629.CQk3R3hD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221629.CQk3R3hD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      40 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
      41 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
      42 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng_rng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1868:15: error: implicit declaration of function 'module_get_guest_trng_rng'; did you mean 'module_handle_guest_trng_rng'? [-Werror=implicit-function-declaration]
    1868 |         ret = module_get_guest_trng_rng(entropy, nbits);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
         |               module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1887:16: error: implicit declaration of function 'module_get_guest_trng_uuid'; did you mean 'module_handle_guest_trng_rng'? [-Werror=implicit-function-declaration]
    1887 |         uuid = module_get_guest_trng_uuid();
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                module_handle_guest_trng_rng
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1887:14: warning: assignment to 'const uuid_t *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1887 |         uuid = module_get_guest_trng_uuid();
         |              ^
   cc1: some warnings being treated as errors


vim +1887 arch/arm64/kvm/hyp/nvhe/pkvm.c

  1853	
  1854	static bool module_handle_guest_trng_rng(struct kvm_vcpu *vcpu)
  1855	{
  1856		u64 ret;
  1857		u64 entropy[DIV_ROUND_UP(ARM_SMCCC_TRNG_SMC64_BITS, 64)];
  1858		u64 nbits;
  1859	
  1860		nbits = smccc_get_arg1(vcpu);
  1861		if (nbits == 0 || nbits > ARM_SMCCC_TRNG_SMC64_BITS) {
  1862			ret = ARM_SMCCC_TRNG_INVALID_PARAMETERS;
  1863			goto err;
  1864		}
  1865	
  1866		memset(entropy, 0, sizeof(entropy));
  1867	
> 1868		ret = module_get_guest_trng_rng(entropy, nbits);
  1869		if (ret == SMCCC_RET_SUCCESS) {
  1870			smccc_set_retval(vcpu, SMCCC_RET_SUCCESS, entropy[2],
  1871					 entropy[1], entropy[0]);
  1872			return true;
  1873		}
  1874	
  1875	err:
  1876		smccc_set_retval(vcpu, ret, 0, 0, 0);
  1877		return true;
  1878	}
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
