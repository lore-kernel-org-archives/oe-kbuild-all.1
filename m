Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C159170A22
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726930377; cv=none; b=kqt60K4JWOzolIwV6pq2E2Vskdn/J+VLTV9NLufsRbVPkVP4+mUyueJdaUKqjpagP4MSwqrWwgmB1Bv6+Gk+jTJ02Pa/WvkWuy6jNc+191Qa/GJGsOTb7etdGMA6qeHxcV+oLiZ5Sw6osT9q2RLMoM1EuBkyWgvEJxssuVvwT0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726930377; c=relaxed/simple;
	bh=ukRGg2wz6eNUMFCqpKnK7w0fCrEQA1FfO1pSn+bc6DA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SY9Bmd6DwR1tRDZWEdAnflaP5aRxdyfKTlLjBYSq5ZOF6sVcKfQ2gOAZIbfAcB1orzAG4XIH8mBncOrlBziAFhbD0sFxBPOgfe6neZGBsZRk0PyFZZKYXYWmOIACUJe8VlRghsromopufQ5fwm28L+aQZFRVVOIg3x+3Z/yPwBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SaeK/w0b; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SaeK/w0b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726930376; x=1758466376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ukRGg2wz6eNUMFCqpKnK7w0fCrEQA1FfO1pSn+bc6DA=;
  b=SaeK/w0blhdE1lfcFrP8sAY8Dq5izpJOgnYpwiK+XcVDR2Fv+PaHnlgb
   HaqtUuqJXmHJ/yEzSDvOY8EL5EHiDPTMtAIhoqyNBATwodawZfkZDyFbV
   WAFCriweet2pHY7ooF3VKf41BCdKC94jP84mCjRXj0Z3t0v3LdvZ/zbrc
   sbCemc5UQUQ9wF2EEk3m52JZ5O+mQeoNP7cNLaqxcxqBn8M89QfbSnHSC
   iw+XP3ASee9Eetkp2PU7LlNbBAlYzT3wGRHttbnxCN2OqFVkQDP8ACgcO
   lFlS8EZIDFfEjVgfZ+DCVx5AZ5FZYJPHkLdRuCVdG1AZ6zMfoVm4IOeJZ
   A==;
X-CSE-ConnectionGUID: LAIAGKuwRLqhdgtDjqJo6Q==
X-CSE-MsgGUID: eBdJ1W6jRlimjeb43zeJLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25444894"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="25444894"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 07:52:53 -0700
X-CSE-ConnectionGUID: +BCR4c4PRACOJ9SGFH0oDA==
X-CSE-MsgGUID: CgHhnEmSTCWO7ZwAWm+mrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="75379110"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Sep 2024 07:52:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss1Td-000FVM-0h;
	Sat, 21 Sep 2024 14:52:49 +0000
Date: Sat, 21 Sep 2024 22:52:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xianglai Li <lixianglai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7137/14021] arch/loongarch/kvm/vcpu.c:68:37:
 error: 'struct sched_info' has no member named 'run_delay'
Message-ID: <202409212227.aYLZJEKB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bibo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   70522ace7844a6fe96f8b19325c878ff23701ee7
commit: faa35b0fcdefb1e5f2d05b0eeac12be32e69e566 [7137/14021] LoongArch: KVM: Add steal time support in kvm side
config: loongarch-randconfig-001-20240921 (https://download.01.org/0day-ci/archive/20240921/202409212227.aYLZJEKB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409212227.aYLZJEKB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409212227.aYLZJEKB-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kvm/vcpu.c: In function 'kvm_update_stolen_time':
>> arch/loongarch/kvm/vcpu.c:68:37: error: 'struct sched_info' has no member named 'run_delay'
      68 |         steal += current->sched_info.run_delay -
         |                                     ^
   arch/loongarch/kvm/vcpu.c:70:55: error: 'struct sched_info' has no member named 'run_delay'
      70 |         vcpu->arch.st.last_steal = current->sched_info.run_delay;
         |                                                       ^


vim +68 arch/loongarch/kvm/vcpu.c

    33	
    34	static void kvm_update_stolen_time(struct kvm_vcpu *vcpu)
    35	{
    36		struct kvm_steal_time __user *st;
    37		struct gfn_to_hva_cache *ghc;
    38		struct kvm_memslots *slots;
    39		gpa_t gpa;
    40		u64 steal;
    41		u32 version;
    42	
    43		ghc = &vcpu->arch.st.cache;
    44		gpa = vcpu->arch.st.guest_addr;
    45		if (!(gpa & KVM_STEAL_PHYS_VALID))
    46			return;
    47	
    48		gpa &= KVM_STEAL_PHYS_MASK;
    49		slots = kvm_memslots(vcpu->kvm);
    50		if (slots->generation != ghc->generation || gpa != ghc->gpa) {
    51			if (kvm_gfn_to_hva_cache_init(vcpu->kvm, ghc, gpa,
    52						sizeof(*st))) {
    53				ghc->gpa = INVALID_GPA;
    54				return;
    55			}
    56		}
    57	
    58		st = (struct kvm_steal_time __user *)ghc->hva;
    59		unsafe_get_user(version, &st->version, out);
    60		if (version & 1)
    61			version += 1;
    62		version += 1;
    63		unsafe_put_user(version, &st->version, out);
    64		/* Make sure st->version is written first */
    65		smp_wmb();
    66	
    67		unsafe_get_user(steal, &st->steal, out);
  > 68		steal += current->sched_info.run_delay -
    69			vcpu->arch.st.last_steal;
    70		vcpu->arch.st.last_steal = current->sched_info.run_delay;
    71		unsafe_put_user(steal, &st->steal, out);
    72	
    73		/* Make sure st->steal is written first */
    74		smp_wmb();
    75		version += 1;
    76		unsafe_put_user(version, &st->version, out);
    77	out:
    78		mark_page_dirty_in_slot(vcpu->kvm, ghc->memslot, gpa_to_gfn(ghc->gpa));
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
