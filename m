Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A413B265298
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 18:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757529836; cv=none; b=dpNruWHs9bDG2DGzj9Ap7+pXTVtcPShYZJhZ6H8RlgyTTAfNht+A9GDfTCRqI1Nr4Wq3kIM4JxhUSIStVPFrUrnkOK/KCLNIvMu2hSzrt+gsIvrJ+CHcPczc7B/opkrGqMpstJveMs8Vm4mBflZkWrE/k9iTGhw8PmI1/UUz6Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757529836; c=relaxed/simple;
	bh=YLTMn9Fzo0fvTB0WuUm2crmSpqhRqArPqnCtIwaRp7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q0lLEUhr6fQqUNTudlVdD9xXbpua4uUqZkx6M32vt0lzlI34Kib32pgHLAy/yxtA9gQ65nN3K0Q8Q43dtvQfERPzC3aGQFiTP4tVlZLb6dDGGBofHS/1SDFom6xomN/NL37oFz1q8e8bRcxidP2ysK9Zm3JiP32H1Ntr/WVDyA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZ52HmOD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZ52HmOD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757529834; x=1789065834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YLTMn9Fzo0fvTB0WuUm2crmSpqhRqArPqnCtIwaRp7c=;
  b=aZ52HmOD2zbUat1N2ruvUWJ2W/twI4AR2+Qfjz8uky0MAGyKDS4aSHpl
   350Y9eJ+13lFbdEAkSR3iD/iCJs5B5pHBmn5WVWS3H/yDvx9dqijj2JPc
   pS396eGHvTdZoXoBWLUV2/2liOhBTW1PdsQbQftnSDfjhHBehE8WUXcao
   BjMDDNz2O5zwZGNTq2jQ5qN6J0o6fDt56mgRY57PECf1gLaNRBFfrYBj1
   V4C4WvutRahroXmKoWbFB9xXZRBEzoI6mdblzy7PnUkADGENe8SwaTfVL
   Rtp/RgCASYt2/IixjNDDU6tvzn3L2xBzirRHL1frlZnzPCnoflyU7kw97
   w==;
X-CSE-ConnectionGUID: RozaZYx9Scy0eHZSHAAJ9A==
X-CSE-MsgGUID: Vle0pWoqRZu1o3krjO1C1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70542913"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="70542913"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 11:43:51 -0700
X-CSE-ConnectionGUID: dRj0tcHITpCp5GS4CDt6tQ==
X-CSE-MsgGUID: pKX5za5VRFu5V8K6R23gfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="204470918"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Sep 2025 11:43:50 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwPnH-0006DH-0g;
	Wed, 10 Sep 2025 18:43:47 +0000
Date: Thu, 11 Sep 2025 02:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 5/5]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1747:8: error: call to undeclared function
 'module_get_guest_trng_rng'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202509110207.jxdxKRQg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   15806a231d4180de148a02d6b04c6ef3bb113080
commit: c0fe83ef01767a3af8396356e2f82aaab869d2f8 [5/5] ANDROID: KVM: arm64: Add TRNG handling for protected guests
config: arm64-randconfig-002-20250910 (https://download.01.org/0day-ci/archive/20250911/202509110207.jxdxKRQg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110207.jxdxKRQg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509110207.jxdxKRQg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:19:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:21:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:38:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      38 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:38:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      38 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:39:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      39 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:39:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      39 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:6: warning: no previous prototype for function 'module_handle_guest_smc' [-Wmissing-prototypes]
      40 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      40 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1747:8: error: call to undeclared function 'module_get_guest_trng_rng'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1747 |         ret = module_get_guest_trng_rng(entropy, nbits);
         |               ^
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1747:8: note: did you mean 'module_handle_guest_trng_rng'?
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1733:13: note: 'module_handle_guest_trng_rng' declared here
    1733 | static bool module_handle_guest_trng_rng(struct kvm_vcpu *vcpu)
         |             ^
    1734 | {
    1735 |         u64 ret;
    1736 |         u64 entropy[DIV_ROUND_UP(ARM_SMCCC_TRNG_SMC64_BITS, 64)];
    1737 |         u64 nbits;
    1738 | 
    1739 |         nbits = smccc_get_arg1(vcpu);
    1740 |         if (nbits == 0 || nbits > ARM_SMCCC_TRNG_SMC64_BITS) {
    1741 |                 ret = ARM_SMCCC_TRNG_INVALID_PARAMETERS;
    1742 |                 goto err;
    1743 |         }
    1744 | 
    1745 |         memset(entropy, 0, sizeof(entropy));
    1746 | 
    1747 |         ret = module_get_guest_trng_rng(entropy, nbits);
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~
         |               module_handle_guest_trng_rng
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1766:9: error: call to undeclared function 'module_get_guest_trng_uuid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1766 |         uuid = module_get_guest_trng_uuid();
         |                ^
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1766:7: error: incompatible integer to pointer conversion assigning to 'const uuid_t *' from 'int' [-Wint-conversion]
    1766 |         uuid = module_get_guest_trng_uuid();
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 3 errors generated.


vim +/module_get_guest_trng_rng +1747 arch/arm64/kvm/hyp/nvhe/pkvm.c

  1732	
  1733	static bool module_handle_guest_trng_rng(struct kvm_vcpu *vcpu)
  1734	{
  1735		u64 ret;
  1736		u64 entropy[DIV_ROUND_UP(ARM_SMCCC_TRNG_SMC64_BITS, 64)];
  1737		u64 nbits;
  1738	
  1739		nbits = smccc_get_arg1(vcpu);
  1740		if (nbits == 0 || nbits > ARM_SMCCC_TRNG_SMC64_BITS) {
  1741			ret = ARM_SMCCC_TRNG_INVALID_PARAMETERS;
  1742			goto err;
  1743		}
  1744	
  1745		memset(entropy, 0, sizeof(entropy));
  1746	
> 1747		ret = module_get_guest_trng_rng(entropy, nbits);
  1748		if (ret == SMCCC_RET_SUCCESS) {
  1749			smccc_set_retval(vcpu, SMCCC_RET_SUCCESS, entropy[2],
  1750					 entropy[1], entropy[0]);
  1751			return true;
  1752		}
  1753	
  1754	err:
  1755		smccc_set_retval(vcpu, ret, 0, 0, 0);
  1756		return true;
  1757	}
  1758	
  1759	static bool module_handle_guest_trng(struct kvm_vcpu *vcpu)
  1760	{
  1761		u32 fn;
  1762		u64 ret = SMCCC_RET_NOT_SUPPORTED;
  1763		const uuid_t *uuid;
  1764	
  1765		fn = smccc_get_function(vcpu);
> 1766		uuid = module_get_guest_trng_uuid();
  1767		if (!uuid)
  1768			return false;
  1769	
  1770		switch (fn) {
  1771		case ARM_SMCCC_TRNG_VERSION:
  1772			ret = ARM_SMCCC_TRNG_VER_1_0;
  1773			break;
  1774		case ARM_SMCCC_TRNG_FEATURES:
  1775			switch (smccc_get_arg1(vcpu)) {
  1776			case ARM_SMCCC_TRNG_VERSION:
  1777			case ARM_SMCCC_TRNG_FEATURES:
  1778			case ARM_SMCCC_TRNG_GET_UUID:
  1779			case ARM_SMCCC_TRNG_RND64:
  1780				ret = SMCCC_RET_SUCCESS;
  1781				break;
  1782			}
  1783			break;
  1784		case ARM_SMCCC_TRNG_GET_UUID:
  1785			smccc_set_retval(vcpu, le32_to_cpu(((u32 *)uuid->b)[0]),
  1786					 le32_to_cpu(((u32 *)uuid->b)[1]),
  1787					 le32_to_cpu(((u32 *)uuid->b)[2]),
  1788					 le32_to_cpu(((u32 *)uuid->b)[3]));
  1789			return true;
  1790		case ARM_SMCCC_TRNG_RND64:
  1791			return module_handle_guest_trng_rng(vcpu);
  1792		default:
  1793			return false;
  1794		}
  1795	
  1796		smccc_set_retval(vcpu, ret, 0, 0, 0);
  1797		return true;
  1798	}
  1799	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
