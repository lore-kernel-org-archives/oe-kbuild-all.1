Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8370F285CA2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 18:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758564247; cv=none; b=afHEb9Y+NodBBs4B3yZI0ew5Ode19qBV+jHNme54J4kE9PVdghFHhDMDo+paS7qq4tYfmXZ8lbTwRKVrfPNxnuzuw7DLx0wEI0XfqRLfVHrlnsEiXMlpqkGk4IJv0JNU6xRzZ7MLvXIwnYaLc7MErlHVIMvZU4M71zwJ3BoAgvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758564247; c=relaxed/simple;
	bh=nZR7X4XjOlCvcuBgPvwd2YPR2UKx/wOG2CmrJD6jvYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VkF7T1KNSpjqjGRzOJugJCSZequjGdJ4giKOE/6su2sFnGLfHurwSYEkAQoOw5WZjOiXb2XvPBwg9ZUy8sq7CZrMwApj9JZXOOjg6XeunnTtmitFTuoTyu71H8NkYL4mKT8bw7GeDENatUIk0O9HyzOSj14o4lHZHrjmNDHMOew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZLpo7yS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZLpo7yS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758564246; x=1790100246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nZR7X4XjOlCvcuBgPvwd2YPR2UKx/wOG2CmrJD6jvYI=;
  b=FZLpo7yShHqrKToGNC0IbhU8nfUbinlHcbyU66/Js++1PcKsIpgCfjvU
   4rRXoNFfB/c9QcbKTyBwcg7yBqAL8d+9PmHl4teO6/rh3Rm68+guDy7XE
   /lAcr6sClc0v6H2H8WbgZgOJfz/91VlIW0C5sx9b5/K3YcM0qjttA0ntr
   14nQQCKAncECpkGAwYBIPHvZuGqDJTo7ni0uiANfxvXgqsp7vvpv3ZDht
   ky+b4Oid2s7y8biYhuBfJCN6Ewo9ghWXno8rmCe0v8ObMKsoMCDR8EwTN
   MYduqsxvNkEKmQWT+fg3Gr7TESPcmwm3Pf9NaqzBqTiSP64Cbxx+xnNqj
   Q==;
X-CSE-ConnectionGUID: RngqR/pVQeSHscXwiKt+1A==
X-CSE-MsgGUID: RvZLNHx1TvyuITjeTaRBFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64656523"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="64656523"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 11:04:04 -0700
X-CSE-ConnectionGUID: lizvUzcGSPa8T3kwqBYL+Q==
X-CSE-MsgGUID: K7PHeWxnSZifClTuqQXCxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="176600533"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Sep 2025 11:04:03 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0ktL-0001wb-2q;
	Mon, 22 Sep 2025 18:03:59 +0000
Date: Tue, 23 Sep 2025 02:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 8/8]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1785:40: sparse: sparse: cast to restricted
 __le32
Message-ID: <202509230121.YCo7Km7k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   a390416d0d0f981d5b15a7358987dd2bcace14f7
commit: c0fe83ef01767a3af8396356e2f82aaab869d2f8 [8/8] ANDROID: KVM: arm64: Add TRNG handling for protected guests
config: arm64-randconfig-r112-20250922 (https://download.01.org/0day-ci/archive/20250923/202509230121.YCo7Km7k-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230121.YCo7Km7k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509230121.YCo7Km7k-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1785:40: sparse: sparse: cast to restricted __le32
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1785:40: sparse: sparse: cast to restricted __le32
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1785:40: sparse: sparse: cast to restricted __le32
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1785:40: sparse: sparse: cast to restricted __le32
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1785:40: sparse: sparse: cast to restricted __le32
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1785:40: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1786:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1786:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1786:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1786:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1786:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1786:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1787:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1787:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1787:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1787:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1787:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1787:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1788:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1788:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1788:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1788:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1788:34: sparse: sparse: cast to restricted __le32
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
