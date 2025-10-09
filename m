Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C1A33D8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 12:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760014653; cv=none; b=jGF/UCK6QwouYczzQHYNiYhD4zQC5lWGzD+HTxSaY6W7DjusiTQRjxX+KA1WSQKvisqdHKK96CdeMzrmJGYzTV8VSL9v8b53wMOfzoIFC83YhekWzNOTdfmmmw5cWk94RRjF74AVmeu/U+fz4AzoEzq3eQNfPb9yDA+hq9mxJ1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760014653; c=relaxed/simple;
	bh=KKyQ3gXAja9pbzT6V1s9RaLkvOU7ulNfWBo2fH3UgOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V0I9iztwbIIbLkJM1fWOYcysOhpJ9GZwWhNefbKrCW4/y7Xnih0JrLfWqFu0o8ATDWVKddr00pCqbyw7vubSeVY5ej1xSqzWQ6uIgqi9p4aNETtMe9qSDpflj7UThaTCMliRq6A1rJTVL5sHjHW40wCoJSQf5309nWf9W/tgFL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y0mehaFS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y0mehaFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760014651; x=1791550651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KKyQ3gXAja9pbzT6V1s9RaLkvOU7ulNfWBo2fH3UgOM=;
  b=Y0mehaFSeHEOa6LPeh3gJX6uCODY1R1Jk2O2/vTYTZo5VW1JDLnRPEwg
   S1LNE5PXpRUWlQkI6Y6kJsO5JTUZGzbh8JwDoAHraCSrqxD77UpF0rWpn
   O1bnapM7COA7NI9amBDoM7P6aiI5nHrsj7fVOSz/4puVD/E8pxgV7Hc8E
   egNM1uWMQuv0B2fnT5qlwTWJBTtX91692YWyG+luqtleApwaCDhmB/ILr
   6YoOpojuUf2EvqqtvyTSl0N4f10EqzSCQ2g8ZohqVV7aZqDgknL9+d0+v
   yF2u7N03KTdNhrcE/pi2bOv70th3+797qkM47+KCOTHoAA1Y1ne4MFzzw
   Q==;
X-CSE-ConnectionGUID: qhlqAfwfSPW4HZuBgs8Aww==
X-CSE-MsgGUID: 19owkBW0T3ao2vugS74DrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66050851"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66050851"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 05:57:31 -0700
X-CSE-ConnectionGUID: tPe0eWamRWS5E24KbV5Hbw==
X-CSE-MsgGUID: x2v621RPSsC3OujETY3TPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="211346179"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Oct 2025 05:57:29 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6qD0-0000iN-2c;
	Thu, 09 Oct 2025 12:57:26 +0000
Date: Thu, 9 Oct 2025 20:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 13/13]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1766:7: warning: assignment to 'const uuid_t
 *' {aka 'const struct <anonymous> *'} from 'int' makes pointer from integer
 without a cast
Message-ID: <202510092005.3NCceWAg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1ae89fc12f7b197fa525f33bf6b016ec3d782f45
commit: c0fe83ef01767a3af8396356e2f82aaab869d2f8 [13/13] ANDROID: KVM: arm64: Add TRNG handling for protected guests
config: arm64-randconfig-003-20251009 (https://download.01.org/0day-ci/archive/20251009/202510092005.3NCceWAg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251009/202510092005.3NCceWAg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510092005.3NCceWAg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:19:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:21:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:38:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      38 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:39:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
      39 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:6: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
      40 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng_rng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1747:8: error: implicit declaration of function 'module_get_guest_trng_rng'; did you mean 'module_handle_guest_trng_rng'? [-Werror=implicit-function-declaration]
    1747 |  ret = module_get_guest_trng_rng(entropy, nbits);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~
         |        module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1766:9: error: implicit declaration of function 'module_get_guest_trng_uuid'; did you mean 'module_handle_guest_trng_rng'? [-Werror=implicit-function-declaration]
    1766 |  uuid = module_get_guest_trng_uuid();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         module_handle_guest_trng_rng
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1766:7: warning: assignment to 'const uuid_t *' {aka 'const struct <anonymous> *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1766 |  uuid = module_get_guest_trng_uuid();
         |       ^
   cc1: some warnings being treated as errors


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
