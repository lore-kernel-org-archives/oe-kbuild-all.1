Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0A81A6838
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 01:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789175968; cv=none; b=hQjyMh4LZID0/Oq5snGExcy5ncw8uqNbt30nTDaOMxmlSYzPSu15N6y5CdVkq3mW252nCLVHaclDIck+05toNSgbB0a2E+UA3hpXwoDJk5g9gNOUinyAXbBqaM8lnPcEy8wer/xNLSbAkgv4ZcXxRgupt12Y+Q9NDq2jZZqGpuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789175968; c=relaxed/simple;
	bh=0p60VVzIu2Q2NiTRGSYqXKlrMnCMdCrlvYgn2NBfY9c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BVQpAULr5TZcEt8gW0aXwMp+BasDSpo9BACMZw+VdDzu69zNHYXX2m5EC/WqL27bk6IP5FvK5IDQrQaeb5bTw17wmcXfLVQZ9r/2erZXqf0lh1mr2Mt5aUrXXTke4dyuWrgFfPBV/2SORc4q3XEoDuv40lnj+ICpqZgioS0OtXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kxJ2PHdy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxJ2PHdy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789175966; x=1820711966;
  h=date:from:to:cc:subject:message-id;
  bh=0p60VVzIu2Q2NiTRGSYqXKlrMnCMdCrlvYgn2NBfY9c=;
  b=kxJ2PHdyM0CwTqKza6O0CQDYw7WwcQy1xiKgMifulFKAxTaSVXCE4yhV
   lGLBUM3vfRrio+VUqRXG//VJSOIDs2zHz1lMWgWb0s8ah7XJeOz+Ya02J
   gc4/VpeUYcVtsrrcy7qRg6frvwFh9oipz4JLmedaUvkWeriz529b8cF6W
   sUgtqLqt5jNStiF+eYB3e2p7rqNli15ywzX9J4xFTYmFFpkB47FruPcFW
   htJJBl0lzF+wvm2lym+AJMvTGBVFzlCvrVlVeIQa+ZtVEe1YNTytu4nZ9
   5juIkokHSfHb2o+vjUoDZAoSCuFC1W+DB1WlIr67lG+chW0JaAJwSQFRW
   A==;
X-CSE-ConnectionGUID: AsWy71dwT6eVOveeFfMjAA==
X-CSE-MsgGUID: qzduZzLQQxWsoCvrBELL6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89481121"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="89481121"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 18:19:26 -0700
X-CSE-ConnectionGUID: EoQDcZmQQXCypF4OptFOrw==
X-CSE-MsgGUID: Cv8LvOkCSeGBkEIkXzPNug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="277329377"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 11 Sep 2026 18:19:24 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5COe-000000002Uq-3SUU;
	Sat, 12 Sep 2026 01:19:14 +0000
Date: Sat, 12 Sep 2026 09:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/uaccess_bad_mm 1/9]
 arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:3207:35: sparse: sparse:
 incorrect type in argument 2 (different address spaces)
Message-ID: <202609120840.uInQ5yg1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/uaccess_bad_mm
head:   4bb0673580aaec2cd71aef201741a528bfa407d0
commit: 44888a116c641f3d2a458a9f6b5f6e41c2611125 [1/9] KVM: Reject user accesses to guest memory if current->mm != kvm->mm
config: powerpc64-randconfig-r113-20260911 (https://download.01.org/0day-ci/archive/20260912/202609120840.uInQ5yg1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 96295a1412f9afbee9d4a3c2701e83f5a529a9cc)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609120840.uInQ5yg1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609120840.uInQ5yg1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:3207:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *to @@     got void *data @@
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:3207:35: sparse:     expected void [noderef] __user *to
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:3207:35: sparse:     got void *data
>> arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:3207:61: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void const *from @@     got void [noderef] __user * @@
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:3207:61: sparse:     expected void const *from
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:3207:61: sparse:     got void [noderef] __user *

vim +3207 arch/powerpc/kvm/../../../virt/kvm/kvm_main.c

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
