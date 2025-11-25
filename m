Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D752E54BD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 21:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764104960; cv=none; b=rxBz2kLu1XFXZrfSzdtGataD44LzQKDQAkNXY6LNA1qD6vUiw/QrG7l+8R/cDxQWpLmPhUMA/g64S9KfoPfSwa1fLUbRcFZJiZcRXwywYHZhBFOU2YLYNdFmLQa/jIaOCjfeo9U05oIHwTRLlU0X1CFIoNpg1Mryf0l+VGO2WHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764104960; c=relaxed/simple;
	bh=VYQdRFBMmOhf+YGJ/Fv2l0s5oEEWoKvk+MkiPmrCtPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YRTS2+p+Uwf9g5iXyUk0L3psMXLfX/aNuRmK5Q9jO2OdA6wfHoEFFeOHbeGZOPUwdjvtcdiFX3r+So6rkXzbtOdWF9QHHLqjpsz/23p9ybFbHzKY9Kz31se9hrRHOhmESZZWmpZlBgiUFfHohMKR5DctdAjJFq0zb1/yPmXyCc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gshioa/L; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gshioa/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764104958; x=1795640958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VYQdRFBMmOhf+YGJ/Fv2l0s5oEEWoKvk+MkiPmrCtPM=;
  b=Gshioa/LlaWJX/rjswRjQGy4DRgvOjz+QMfivEv5hW62+xIaIZjFfYXK
   e0hZ8UnR3ilBZ3BP883ATfAenKP3a5A3QwqXDq7e5GXQq9CE7AsKEienq
   HhrDzYyNDiqYpXqbczLRoD6zLndrBV8iNOH6Gum3RR3K68ImkFGxRmlII
   ohfs+g4HnIJkWqje5d4dGxdGiaRJhp9FPeHnrqgPc6SFHKBNu450bRMjG
   hyVgzDhpQ5fl5HmPJV8GKCWLxp7/UFuB5hVH9XGMyeP1XVm3b/DdXDi8v
   Hd8HmoKpzEmiDKkgJAH65sH7tLcsp+rW5n8zkIGI85nowwxXsXIr8CO1p
   w==;
X-CSE-ConnectionGUID: A6lasw8nToGmZel5pVSXkg==
X-CSE-MsgGUID: f42b7rLJSo2GU7L7NMTf5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76817724"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="76817724"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 13:09:17 -0800
X-CSE-ConnectionGUID: sq5uscqpRBCv7xlrOZThbw==
X-CSE-MsgGUID: J9JHnxeVQeqM0hZvgOqqQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="196909861"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2025 13:09:15 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO0Hh-000000002GN-2KyT;
	Tue, 25 Nov 2025 21:09:13 +0000
Date: Wed, 26 Nov 2025 05:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1766:7: warning: assignment makes pointer
 from integer without a cast
Message-ID: <202511260529.dnORaiIa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e436c77f5ed5017e5bd134f69e51a2e0a6550d4b
commit: c0fe83ef01767a3af8396356e2f82aaab869d2f8 [1/1] ANDROID: KVM: arm64: Add TRNG handling for protected guests
config: arm64-randconfig-001-20251126 (https://download.01.org/0day-ci/archive/20251126/202511260529.dnORaiIa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260529.dnORaiIa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260529.dnORaiIa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:19:0:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng_rng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1747:8: error: implicit declaration of function 'module_get_guest_trng_rng'; did you mean 'module_handle_guest_trng_rng'? [-Werror=implicit-function-declaration]
     ret = module_get_guest_trng_rng(entropy, nbits);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
           module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1766:9: error: implicit declaration of function 'module_get_guest_trng_uuid'; did you mean 'module_handle_guest_trng_rng'? [-Werror=implicit-function-declaration]
     uuid = module_get_guest_trng_uuid();
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
            module_handle_guest_trng_rng
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1766:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     uuid = module_get_guest_trng_uuid();
          ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +1766 arch/arm64/kvm/hyp/nvhe/pkvm.c

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
