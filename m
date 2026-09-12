Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAAE1A2545
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 04:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188597; cv=none; b=AKi4UxqPUWGBtNa3lKfSMsNbZ8UCcJFtf3vdhCE/4VeU/HS0GmkEwShaf2Yk5LhiALn8WZIPqSCtbemmh/2e+vEwIVesmwpAjl3lOMhcHgaIrDLz3fGitBdZBhMeal4RwurUbG7P4+wcgDADhLKd0h9phtWJwp26yRVQJy0m3Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188597; c=relaxed/simple;
	bh=7XNaxo2N+FNs79Jqt7K6FSIJBWclNxllG1vctK5vVoI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vt+PcKPWgO7jfcCrDpF6UlBLzVMkTErarPwIbq9KnjLoUYostjR3NVNt09esD7lBO8OkvCdPYkvmJmxt/KP70b8mFdgrqAuYw5JWiMTj7LHiKWMYEPukK1nsjiG/FlAckzal1h3Flcc5FKVzGBd5lCaCUVWw9vJONQaXYsORxdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNqpmGvi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNqpmGvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789188596; x=1820724596;
  h=date:from:to:cc:subject:message-id;
  bh=7XNaxo2N+FNs79Jqt7K6FSIJBWclNxllG1vctK5vVoI=;
  b=aNqpmGviM1vzZxgomDmWajifDNGWd/RV4M+tA9dwcX2kqUG7Pk6BLWTJ
   27qka+mw/4T5twxEQrnEqWV3QFxlazTLFlQ754TdR1Fh42hncxKbzgc71
   pv9k609B4CUAjDmJD6Rs13Pn1/csaOhtm/AhEWffRWiqY5F+Ps8RU1gao
   kE1ZrhJIcOfVuuzPfXe3QGJP67+deEjenW8SVbcutv7bcTOBjFeGcvQZ6
   qYUbEzOZrczm8B5scIlGyfZsMb5nfP6pl26bBt75P46tNmJPNJhrQci+g
   DPn0wAHziMdcz/D7RG4BYbunBrjsA6WSWnEqqpwMBE6w8j25X6VC+Ym1e
   w==;
X-CSE-ConnectionGUID: ND6wV0DvSRGq1NfdHsRNSA==
X-CSE-MsgGUID: uzPj4CyYRgejuiJewLtZPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89657402"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="89657402"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 21:49:55 -0700
X-CSE-ConnectionGUID: 6/TTecZCQ3y5toJCNHPU6Q==
X-CSE-MsgGUID: B3idZzL7RMWR1+0JiFBxtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="274019776"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 11 Sep 2026 21:49:54 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5FgV-000000002et-3cT0;
	Sat, 12 Sep 2026 04:49:51 +0000
Date: Sat, 12 Sep 2026 12:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/uaccess_bad_mm 2/9]
 arch/powerpc/kvm/powerpc.c:775:34: error: use of undeclared identifier
 'slot'; did you mean 'slots'?
Message-ID: <202609121231.dmUoOaA1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/uaccess_bad_mm
head:   4bb0673580aaec2cd71aef201741a528bfa407d0
commit: 86720f4ae2e361cdc3235fbe2c4c729458ed9ec4 [2/9] KVM: PPC: Flush/zap all memslots on kvm_arch_flush_shadow_all()
config: powerpc64-randconfig-r113-20260911 (https://download.01.org/0day-ci/archive/20260912/202609121231.dmUoOaA1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 96295a1412f9afbee9d4a3c2701e83f5a529a9cc)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121231.dmUoOaA1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121231.dmUoOaA1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kvm/powerpc.c:775:34: error: use of undeclared identifier 'slot'; did you mean 'slots'?
     775 |                 kvmppc_core_flush_memslot(kvm, slot);
         |                                                ^~~~
         |                                                slots
   arch/powerpc/kvm/powerpc.c:770:23: note: 'slots' declared here
     770 |         struct kvm_memslots *slots;
         |                              ^
>> arch/powerpc/kvm/powerpc.c:775:34: error: incompatible pointer types passing 'struct kvm_memslots *' to parameter of type 'struct kvm_memory_slot *' [-Wincompatible-pointer-types]
     775 |                 kvmppc_core_flush_memslot(kvm, slot);
         |                                                ^~~~
   arch/powerpc/include/asm/kvm_ppc.h:217:35: note: passing argument to parameter 'memslot' here
     217 |                                       struct kvm_memory_slot *memslot);
         |                                                               ^
   2 errors generated.


vim +775 arch/powerpc/kvm/powerpc.c

   766	
   767	void kvm_arch_flush_shadow_all(struct kvm *kvm)
   768	{
   769		struct kvm_memory_slot *memslot;
   770		struct kvm_memslots *slots;
   771		int bkt;
   772	
   773		slots = kvm_memslots(kvm);
   774		kvm_for_each_memslot(memslot, bkt, slots)
 > 775			kvmppc_core_flush_memslot(kvm, slot);
   776	}
   777	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
