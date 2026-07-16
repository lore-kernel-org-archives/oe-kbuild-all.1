Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586DA3F4830
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 08:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192238; cv=none; b=UvOfxLHiMrWMWahW7rn7kl15XmX4CGqOGW2He6uFKmCtAh2DNrm8nv/3yvuvbe6lYqdsv4iQxik79Bw04tcQ1SGGSPMmDS+2RYwBNOxiUijsBagfLp1Z1dkpkMRQjKBy98BdE/RSZWWyEwTapz9O9UhhQf5t6OLwk0KGVGzPdq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192238; c=relaxed/simple;
	bh=oLq9WcXw8Ye+SFgkMTH7re9N+N9+M1KyVJo8QV/j4vs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WCLnURHfbgm+s0EAMk/Oz6h9vU8VB0JJxhRE+m+9v6NSMonIJ1PKRv8wRIN61Yj4u0qP+bfK3IMF+2HbX0skovlPsrDQh7P91K22tKG2Oc78+lMy5gVnRJOavskJBEcMGzNVo0x8e5ocee3yGfm3XHlGl8jj1sJJ2WkJP1melDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFYvMN1v; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFYvMN1v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784192235; x=1815728235;
  h=date:from:to:cc:subject:message-id;
  bh=oLq9WcXw8Ye+SFgkMTH7re9N+N9+M1KyVJo8QV/j4vs=;
  b=MFYvMN1veSV7/GnqPDwzugHN0faB7Nq74ZNeJTw3OBKqegClYSbAxK0N
   cg7S0sdrrqGfq5dzO+GYNF2NUDJ2BEJRx0dnkVHYwr07pVom1pzRshmHA
   odfHnfdVmCLkdwYsXJcc5hEdd1poXp4EivUd0NfNxZKapsjx5887p0S2M
   N/iPq57hcvkQ0RRUD8WMxjq/iK0bImLbf58gyZX48pHfomfkygFset3z9
   knlRywCgGrwLeBljn16LXjEtdvgQhtRt+u4f4wXdYmUBKsvti44tZAzLg
   u7Wc+7d8wt+i9vzAabS32vgOycrPzjXN/FmE97yUnUwCaBw4nAskAi9EV
   w==;
X-CSE-ConnectionGUID: fjI/HpMqRBafjIMSlv8byg==
X-CSE-MsgGUID: jfNfZ56dS9m1LKUQW6pRKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83966526"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="83966526"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:57:08 -0700
X-CSE-ConnectionGUID: YhuYYQzfR6mML6uA+tndwg==
X-CSE-MsgGUID: gTFg/J+3R32Wzndj5j24YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="253035830"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 16 Jul 2026 01:57:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkHtw-00000000Oai-09fB;
	Thu, 16 Jul 2026 08:57:04 +0000
Date: Thu, 16 Jul 2026 16:56:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 12/12]
 arch/arm64/kvm/mmu.c:2012:5: warning: no previous prototype for
 'pkvm_mem_abort_prefault'
Message-ID: <202607161643.tqbA8Yds-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c6f9cfff7e5303d62cede4879db0c6a80745aefb
commit: 3fc1e219027721249a621d54449e0f3db624b655 [12/12] ANDROID: KVM: arm64: Introduce kvm-arm.protected_prefault parameter
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260716/202607161643.tqbA8Yds-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161643.tqbA8Yds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607161643.tqbA8Yds-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/mmu.c:11:
   arch/arm64/kvm/mmu.c:315:22: warning: no previous prototype for 'kvm_pinned_pages_insert' [-Wmissing-prototypes]
     315 |                      kvm_pinned_pages);
         |                      ^~~~~~~~~~~~~~~~
   include/linux/interval_tree_generic.h:38:15: note: in definition of macro 'INTERVAL_TREE_DEFINE'
      38 | ITSTATIC void ITPREFIX ## _insert(ITSTRUCT *node,                             \
         |               ^~~~~~~~
>> arch/arm64/kvm/mmu.c:2012:5: warning: no previous prototype for 'pkvm_mem_abort_prefault' [-Wmissing-prototypes]
    2012 | int pkvm_mem_abort_prefault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/mmu.c: In function 'user_mem_abort':
   arch/arm64/kvm/mmu.c:2037:21: warning: variable 'ipa' set but not used [-Wunused-but-set-variable=]
    2037 |         phys_addr_t ipa = fault_ipa;
         |                     ^~~


vim +/pkvm_mem_abort_prefault +2012 arch/arm64/kvm/mmu.c

  2011	
> 2012	int pkvm_mem_abort_prefault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
  2013				    struct kvm_memory_slot *memslot)
  2014	{
  2015		phys_addr_t memslot_start = memslot->base_gfn << PAGE_SHIFT;
  2016		size_t size = (1 << pkvm_prefault) << PAGE_SHIFT;
  2017	
  2018		fault_ipa = ALIGN_DOWN(fault_ipa, size);
  2019		if (fault_ipa < memslot_start) {
  2020			size -= memslot_start - fault_ipa;
  2021			fault_ipa = memslot_start;
  2022		}
  2023	
  2024		return pkvm_mem_abort(vcpu, fault_ipa, size, memslot);
  2025	}
  2026	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
