Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C98494812
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 22:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789512318; cv=none; b=dqfVQXZSiuoHtjbnwKCmLuD968am8mrpirkQ86a3tulVJtwi0CUh/9AF+y9qmCggCPmUlJaR8fV2LU0YlXxteB3c+nrjGuN2Bjwpfs8C+MAXGfT8Nzx8qY/RpWEujQmL7j1ClHD6eZKcYmiB4fb2F9NqjTmGKM8mm08iyqPt0f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789512318; c=relaxed/simple;
	bh=MLsC5Iz8du8eOOE1jO1keyRwJeFyxsa8Nt7Cq/VDkN8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sPHkF6zAAwI8d7DELksGf5qN1pn/Xl2yJmzlHeqDexrj21XIFRDGG111oPStVtJGORK8tYZOfEwXtNdlC4d/dEAhV+ICgHP4304aB8KzszEq4m/8NOkBFfYbcorIxFoJUrFJm9FcAeNygYyGLI0O5tLNoROu1vl4ByhS1SVM4yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMyt2Zw1; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMyt2Zw1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789512315; x=1821048315;
  h=date:from:to:cc:subject:message-id;
  bh=MLsC5Iz8du8eOOE1jO1keyRwJeFyxsa8Nt7Cq/VDkN8=;
  b=EMyt2Zw1Vayng+ApdbpemjW5OGVTGRA6pFrErm7W5TkffyJ5Vr39ns0a
   YtoOMcGO9n+rTo42w2GM++lIXG92Sa9GfDk5ZlL3sOqw2T01uJaNubseT
   2X5i+pWUw8atQlnUaxLSr5tNeoX/h/1ZCvuiU+0EeLdKYVT8sZQB06oHn
   adlcd0kUd4Oj9qUgVBxJaeM6FbSN39BAjhzyu0co1A5p2ZRl3WPRjbOJJ
   oNz2+Ex6c0fPTEYzHjgFTWCQ2sYntWyKfYw9pfNODNbrAd/ECT8lXA8tl
   VGngWiRoKEBCvGm6V+BVyjLmQmc6JVD/b4nbkT4EeGExOFk7jcByTWe/F
   Q==;
X-CSE-ConnectionGUID: if477GdJTpiGbLjh6+Z4DQ==
X-CSE-MsgGUID: 86kFMphKSqiPMte1473APw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="398766"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="398766"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 15:45:15 -0700
X-CSE-ConnectionGUID: pCmozj2nT5S2a2YmdvKMZA==
X-CSE-MsgGUID: ynx8rR/zRoSqwBBH223AEA==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270518933"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Sep 2026 15:45:13 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6btn-0000000058r-0y7k;
	Tue, 15 Sep 2026 22:45:11 +0000
Date: Wed, 16 Sep 2026 06:45:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1785:40: sparse: sparse: cast to restricted
 __le32
Message-ID: <202609160618.CqtNUPeO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   57041e4a7e52342473871000827584f966d8cbd3
commit: c0fe83ef01767a3af8396356e2f82aaab869d2f8 [1/1] ANDROID: KVM: arm64: Add TRNG handling for protected guests
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260916/202609160618.CqtNUPeO-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160618.CqtNUPeO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160618.CqtNUPeO-lkp@intel.com/

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
