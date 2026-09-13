Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5126F33BBAF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 20:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789331403; cv=none; b=T130SwKMGHHk099ikb70nQG+C49zFVeiVG5WNM3eqGHf1GpTM4X9Cecd8tnbHWMXmpM/xRT07jJ3nvUTe9gio2WlQUWQsQEo2bjwMU7kVW56wH1qCL1q4hKJvIvwwX9fqzLyAQnXCSgdnklS6FuvHVVBkb+GIr6rpCzOGvbuID8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789331403; c=relaxed/simple;
	bh=vmSrA1RxpO5YOm6maWe+5a/0/iRmCfVPTO8hxbkN3fI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SKRpdhW90p1wRhISrgTpjjoiB5YY781K5bS4TLQlKqw2e9i+52e86TLHxm5u8Wc9cje6n/VqfpwBlpRCNYzHfqLnVVGMVBQxxl4WTBBiyaClt/NPje22axy+dWu6u/7MfFbr6MUR6SXPrdLHZxYijv2dIZiAlKx0t3a4vDy6s1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkNC/t4P; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkNC/t4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789331402; x=1820867402;
  h=date:from:to:cc:subject:message-id;
  bh=vmSrA1RxpO5YOm6maWe+5a/0/iRmCfVPTO8hxbkN3fI=;
  b=DkNC/t4P+g4MjNPBNC3bxucMQyDk9zm4lJc1ZnoEOPqot33g8OlpmlUW
   6Dl+ISVMUtwYFr/qCtkeCKwMvvrSGyPL585UrY0HCCDGFsuebGaQ3fDpm
   mc83+a9Yl/GjRpBkrNyVGKcWaG8evH8kXS3jN0ltLUnlND3y8L3ZOjZl5
   1vUTto91d+wZsvhwXTs5s1dXRtOf8dQ6lJW1ruZ3l5Ukm1CXqycZt3vz0
   eiTuvEdW3SgNUEVWT2sBB5cFXdRmal0fZG5h6/vLAwSJUxPHY138tSTlR
   MGGeIy2KJqLaKbGfFksmfp4NUiCknYKhl8QW4hTGTU+ZZo6qrAIw4hqwO
   Q==;
X-CSE-ConnectionGUID: yyi6N/B2S5mv5RQX91YJxA==
X-CSE-MsgGUID: gxK/LO9yQHSBlLJthnzK8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89724650"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="89724650"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 13:30:02 -0700
X-CSE-ConnectionGUID: UAKT/faWSOW/dyqj1wx16w==
X-CSE-MsgGUID: K/eFx230QeK1pRfl61d++A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="276621913"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Sep 2026 13:30:00 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5qpp-000000001IZ-3STc;
	Sun, 13 Sep 2026 20:29:57 +0000
Date: Mon, 14 Sep 2026 04:29:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/uaccess_bad_mm 1/9]
 arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:3207:35: sparse: sparse:
 incorrect type in argument 2 (different address spaces)
Message-ID: <202609140425.EfV7ukei-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/uaccess_bad_mm
head:   5e20baf271c570712cb8efe0d9400725d6c04386
commit: 44888a116c641f3d2a458a9f6b5f6e41c2611125 [1/9] KVM: Reject user accesses to guest memory if current->mm != kvm->mm
config: loongarch-randconfig-r133-20260913 (https://download.01.org/0day-ci/archive/20260914/202609140425.EfV7ukei-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 96295a1412f9afbee9d4a3c2701e83f5a529a9cc)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609140425.EfV7ukei-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609140425.EfV7ukei-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:3207:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *to @@     got void *data @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:3207:35: sparse:     expected void [noderef] __user *to
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:3207:35: sparse:     got void *data
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:3207:61: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void const *from @@     got void [noderef] __user * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:3207:61: sparse:     expected void const *from
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:3207:61: sparse:     got void [noderef] __user *

vim +3207 arch/loongarch/kvm/../../../virt/kvm/kvm_main.c

  3193	
  3194	/* Copy @len bytes from guest memory at '(@gfn * PAGE_SIZE) + @offset' to @data */
  3195	static int __kvm_read_guest_page(struct kvm *kvm, struct kvm_memory_slot *slot,
  3196					 gfn_t gfn, void *data, int offset, int len)
  3197	{
  3198		int r;
  3199		unsigned long addr;
  3200	
  3201		if (WARN_ON_ONCE(offset + len > PAGE_SIZE))
  3202			return -EFAULT;
  3203	
  3204		addr = gfn_to_hva_memslot_prot(slot, gfn, NULL);
  3205		if (kvm_is_error_hva(addr))
  3206			return -EFAULT;
> 3207		r = kvm_copy_to_user(kvm, data, (void __user *)addr + offset, len);
  3208		if (r)
  3209			return -EFAULT;
  3210		return 0;
  3211	}
  3212	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
