Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0881FDA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 09:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765618650; cv=none; b=j1Fq5OIb2FTQAiaGIbGrwSzzDAoR1YMUpKrFxm8M/Gn9R/9IunlhQLirSqPRSzmInQVDEmCdP+jCrjY206wBgZZEmzEvGuMcUxHCG0TpjHX3YQ0D9cVs7kVyRVGXLMqJiEFSsM52/c1G6hBD69TW/5EPGmNVACrMZTOyOifg4hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765618650; c=relaxed/simple;
	bh=3S2QfIKG04OxbryZsghE7I+OhmW0usqwQdSdJclgox8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X71ryFNLwQmdYqS1k0MT3rKg97r+SKpDkPGA/YFHYkQ4EDmatM5T0IJ0Itv2cTyzgEU28XAKlcmjuEV8r4ybU1JTLJGzsE4FH3s4txtgu9mzlLe0/5QCY1RsPyUyC90IzzClN1nZm/Sf5YuYlyUEgEEO0AJ0p+TPhj+uCUGYKB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFmL09AP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFmL09AP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765618648; x=1797154648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3S2QfIKG04OxbryZsghE7I+OhmW0usqwQdSdJclgox8=;
  b=MFmL09APPfXOShfuvQve28caBfs/O03BUK4rlD8Crtr+5ROAepGsfw8N
   BwdX4kIQuRf/s6YLhc2h7zyM+rRNMpOsLgekoTpIQKIqbaXOra01P3NdT
   uRu/omt7qF06NI4tI26JxwY1TJ+EgeNUfNA4zm9T7T6/PUznqVYJCOfKI
   UBxwodiKooL2kC+VuS5RSDjdKK+lfnNwhFSWpnjKwZCBuRfisUJR2DMxk
   6awrYkahCnMlNUZBtL+jYA9krvSWdo2LZsWlJX7WJMlm6KqSgrFVACyIJ
   uUk+9XaGrapz4ojqMbnQYV5RWMa/3qsE1UjC4xvC78auSy5NFjjhYekON
   g==;
X-CSE-ConnectionGUID: Wv4vLpdBTO25RhV8Vi8/3g==
X-CSE-MsgGUID: SV9NLBH7RbiVsBhEbxjIHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="90256946"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="90256946"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 01:37:27 -0800
X-CSE-ConnectionGUID: TkKP+lpJSnSxia+6ILw+cw==
X-CSE-MsgGUID: SSCfADZrRnGX79riky9KQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="202372893"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Dec 2025 01:37:26 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUM44-000000007R8-05N6;
	Sat, 13 Dec 2025 09:37:24 +0000
Date: Sat, 13 Dec 2025 17:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type
 'struct pkvm_pasid_table_param'
Message-ID: <202512131758.0iucrj2v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: 40e05d87082111caf1fa83b9b288e93f3cd021df [18/18] ANDROID: iommu/vt-d: Paravirtualize PASID table updates
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251213/202512131758.0iucrj2v-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131758.0iucrj2v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131758.0iucrj2v-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:315:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_lm_context_param'
     315 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_sm_ce':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:315:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_sm_context_param'
     315 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_clear_pasid_entry':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:46:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      46 |         return pkvm_iommu_hypercall(iommu_clear_pasid_entry, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:46:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      46 |         return pkvm_iommu_hypercall(iommu_clear_pasid_entry, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:46:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      46 |         return pkvm_iommu_hypercall(iommu_clear_pasid_entry, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:46:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      46 |         return pkvm_iommu_hypercall(iommu_clear_pasid_entry, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:315:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_clear_translation_param'
     315 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:46:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      46 |         return pkvm_iommu_hypercall(iommu_clear_pasid_entry, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_pasid_fl':
>> drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:315:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_pasid_table_param'
     315 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_pasid_sl':
>> drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:315:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_pasid_table_param'
     315 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
--
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:315:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_lm_context_param'
     315 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_sm_ce':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:315:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_sm_context_param'
     315 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_clear_pasid_entry':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:46:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      46 |         return pkvm_iommu_hypercall(iommu_clear_pasid_entry, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:46:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      46 |         return pkvm_iommu_hypercall(iommu_clear_pasid_entry, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:46:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      46 |         return pkvm_iommu_hypercall(iommu_clear_pasid_entry, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:46:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      46 |         return pkvm_iommu_hypercall(iommu_clear_pasid_entry, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:315:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_clear_translation_param'
     315 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:46:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      46 |         return pkvm_iommu_hypercall(iommu_clear_pasid_entry, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_pasid_fl':
>> drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:315:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_pasid_table_param'
     315 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_pasid_sl':
>> drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:315:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_pasid_table_param'
     315 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c: In function 'pv_context_mapping':
   drivers/iommu/intel/iommu.c:1459:16: error: variable 'param' has initializer but incomplete type
    1459 |         struct pkvm_lm_context_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1460:18: error: 'struct pkvm_lm_context_param' has no member named 'phys'
    1460 |                 .phys = iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:1460:25: warning: excess elements in struct initializer
    1460 |                 .phys = iommu->reg_phys,
         |                         ^~~~~
   drivers/iommu/intel/iommu.c:1460:25: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1461:18: error: 'struct pkvm_lm_context_param' has no member named 'bdf'
    1461 |                 .bdf = PCI_DEVID(bus, devfn),
         |                  ^~~
   In file included from drivers/iommu/intel/iommu.c:20:
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1461:24: note: in expansion of macro 'PCI_DEVID'
    1461 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1461:24: note: in expansion of macro 'PCI_DEVID'
    1461 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   drivers/iommu/intel/iommu.c:1462:18: error: 'struct pkvm_lm_context_param' has no member named 'domain_pgd_gpa'
    1462 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                  ^~~~~~~~~~~~~~
   In file included from include/linux/kexec.h:20,
                    from include/linux/crash_dump.h:5,
                    from drivers/iommu/intel/iommu.c:16:
   arch/x86/include/asm/io.h:155:22: warning: excess elements in struct initializer
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1462:35: note: in expansion of macro 'virt_to_phys'
    1462 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                                   ^~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: note: (near initialization for 'param')
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1462:35: note: in expansion of macro 'virt_to_phys'
    1462 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                                   ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1463:18: error: 'struct pkvm_lm_context_param' has no member named 'did'
    1463 |                 .did = domain_id_iommu(domain, iommu),
         |                  ^~~
   drivers/iommu/intel/iommu.c:1463:24: warning: excess elements in struct initializer
    1463 |                 .did = domain_id_iommu(domain, iommu),
         |                        ^~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1463:24: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1464:18: error: 'struct pkvm_lm_context_param' has no member named 'ats_supported'
    1464 |                 .ats_supported = info ? info->ats_supported : 0,
         |                  ^~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1464:34: warning: excess elements in struct initializer
    1464 |                 .ats_supported = info ? info->ats_supported : 0,
         |                                  ^~~~
   drivers/iommu/intel/iommu.c:1464:34: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1459:38: error: storage size of 'param' isn't known
    1459 |         struct pkvm_lm_context_param param = {
         |                                      ^~~~~
   drivers/iommu/intel/iommu.c:1459:38: warning: unused variable 'param' [-Wunused-variable]
   drivers/iommu/intel/iommu.c: In function 'pv_context_clear':
   drivers/iommu/intel/iommu.c:1743:16: error: variable 'param' has initializer but incomplete type
    1743 |         struct pkvm_clear_translation_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1744:18: error: 'struct pkvm_clear_translation_param' has no member named 'phys'
    1744 |                 .phys = info->iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:1744:25: warning: excess elements in struct initializer
    1744 |                 .phys = info->iommu->reg_phys,
         |                         ^~~~
   drivers/iommu/intel/iommu.c:1744:25: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1745:18: error: 'struct pkvm_clear_translation_param' has no member named 'bdf'
    1745 |                 .bdf = PCI_DEVID(bus, devfn),
         |                  ^~~
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1745:24: note: in expansion of macro 'PCI_DEVID'
    1745 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1745:24: note: in expansion of macro 'PCI_DEVID'
    1745 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   drivers/iommu/intel/iommu.c:1746:18: error: 'struct pkvm_clear_translation_param' has no member named 'ats_qdep'
    1746 |                 .ats_qdep = info->ats_qdep,
         |                  ^~~~~~~~
..


vim +16 drivers/iommu/intel/iommu_pkvm.h

14d98d9e420328 Aashish Sharma 2025-11-06  10  
157ba06fef4bdb Vineeth Pillai 2025-10-12  11  #define pkvm_iommu_hypercall(hc, param_name, param)			\
157ba06fef4bdb Vineeth Pillai 2025-10-12  12  	({									\
157ba06fef4bdb Vineeth Pillai 2025-10-12  13  		unsigned long f;						\
157ba06fef4bdb Vineeth Pillai 2025-10-12  14  		struct pkvm_##param_name *p = get_this_pv_param(param_name, f);	\
157ba06fef4bdb Vineeth Pillai 2025-10-12  15  		int ret;							\
157ba06fef4bdb Vineeth Pillai 2025-10-12 @16  		*p = *(param);							\
157ba06fef4bdb Vineeth Pillai 2025-10-12  17  		ret = pkvm_hypercall(hc, (unsigned long)p);		\
157ba06fef4bdb Vineeth Pillai 2025-10-12  18  		*(param) = *p;							\
157ba06fef4bdb Vineeth Pillai 2025-10-12 @19  		put_this_pv_param(p, f);					\
157ba06fef4bdb Vineeth Pillai 2025-10-12  20  		ret;								\
157ba06fef4bdb Vineeth Pillai 2025-10-12  21  	})
157ba06fef4bdb Vineeth Pillai 2025-10-12  22  

:::::: The code at line 16 was first introduced by commit
:::::: 157ba06fef4bdb68af268f6a0e53695c0e4ad373 ANDROID: iommu/vt-d: Paravirtualize legacy context entry updates

:::::: TO: Vineeth Pillai <vineethrp@google.com>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
