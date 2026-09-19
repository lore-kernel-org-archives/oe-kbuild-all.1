Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E20837CD47
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 01:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789780265; cv=none; b=YRHtZr/brgZ9SQPpaFnJGsQnhPHqyOszVRHCrt11RFeEH6iTY3e/h7oM4Spdyj7P7xbhHLDGOFF+iweluEkK4ZLMdzNvqq8KC7LQa3wcL0YYF4eV10K22LPBsCFuqkwdCuSezbhd9/3HxB6T9f3gnxEfRxIXsD2R3ItVX6X6B08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789780265; c=relaxed/simple;
	bh=4EHqk2ewT41WeWWYIV1mjVTinxwfIsCO3IKu3DeH2IQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y6z/nDgL0PUnW3jhv8UFFLJvc3WV3A9b+lun6zK5bdvLTtVTpwukpp+da+wzBnuFNdaIS14ZEnQzdIiOcUTw7iYuu87zbF8l+DyxQ9IT0pgYuX3OrmQfJJdkUhs8cHp73sYoQEdACDim5ugPUuv31zIKy1LR0iWrO8ZYeyM/JIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UScxTCPN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UScxTCPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789780260; x=1821316260;
  h=date:from:to:cc:subject:message-id;
  bh=4EHqk2ewT41WeWWYIV1mjVTinxwfIsCO3IKu3DeH2IQ=;
  b=UScxTCPNe4yHF3Pgk94O1yefVP5HRMP6BVQhW28l6n5Bgm/XXA39OOC6
   Cggq1Uk2OHqy87foZC07OVMtt9mJ2pgEhW3N1imRtHEQqCCyu5koxVBgo
   ZNiGLp8Z87RspqN1l76iozbZB7fjUkPe3u+xKVY/nLF9iDlAmQ2cxKOnk
   vIY/i/qALpEQLXOzgFb3qmvrdysFsCU3rkjcqLRFpk9jnCThmje6nq6fa
   PWzCWYFnDLNEEct52bwydQY/2TiYqfDPfc6J5FhEACzf/vGszYyPTJ8Gc
   TnB8tx7IABKtZhFiq1580mYzOItgbPMA32FGm5qeqcSPUKaV8uBrNo3/s
   A==;
X-CSE-ConnectionGUID: qMnSiw9sQFCH6PnttNm4dg==
X-CSE-MsgGUID: fxliLDHpRIGPNK8m1KePUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90184337"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90184337"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 18:10:57 -0700
X-CSE-ConnectionGUID: 1VxhcH6TQ92uOQncRcBhNw==
X-CSE-MsgGUID: o2pHAwywR5CQY79ToTfseg==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270362262"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2026 18:10:56 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7jbR-00000000AYL-2ZOT;
	Sat, 19 Sep 2026 01:10:53 +0000
Date: Sat, 19 Sep 2026 09:10:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1785:40: sparse: sparse: cast to restricted
 __le32
Message-ID: <202609190936.j7CUdpGH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   57041e4a7e52342473871000827584f966d8cbd3
commit: c0fe83ef01767a3af8396356e2f82aaab869d2f8 [1/1] ANDROID: KVM: arm64: Add TRNG handling for protected guests
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260919/202609190936.j7CUdpGH-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609190936.j7CUdpGH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609190936.j7CUdpGH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1785:40: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1786:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1787:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1788:34: sparse: sparse: cast to restricted __le32

vim +1785 arch/arm64/kvm/hyp/nvhe/pkvm.c

  1758	
  1759	static bool module_handle_guest_trng(struct kvm_vcpu *vcpu)
  1760	{
  1761		u32 fn;
  1762		u64 ret = SMCCC_RET_NOT_SUPPORTED;
  1763		const uuid_t *uuid;
  1764	
  1765		fn = smccc_get_function(vcpu);
  1766		uuid = module_get_guest_trng_uuid();
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
> 1785			smccc_set_retval(vcpu, le32_to_cpu(((u32 *)uuid->b)[0]),
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
