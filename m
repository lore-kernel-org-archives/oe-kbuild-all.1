Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11E21EB5FD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 15:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345810; cv=none; b=rOboU2LvZJcCg7lmq1zvFcK81tykH6Z6VhVv4QT7ZPC/EO0nK+Ko3NvQD9Pk7qoSfo09QSQGa0a+BmGK+qVUS0+TtYJunzUM5DKFbjbXNQdsZiqg3FDWDd04KALrRhLTlZ8lHYzHTgAYYoVEHvIqeADw94kiSqq3fTHWCYJ923k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345810; c=relaxed/simple;
	bh=bgWzL2egDTSe0NfI/L0xX4GESUKBNWbhNQAx3MCQhI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hjjSj09KL+5+6DC7hDA8HT5Fgoci6MlmrMgnSprS7IbcmTYhRY/GOxivQppd80RH8daU9Rx8iOQgZFakD6grjQ11qVq2mArlQgTtFTO1p8DR5O2VzkODSmwJ/sYCFI92uDV+gD1ofDB11yFBFEsFI4Exb6Ea/dFCOC9Xwr6qilw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C78eNINm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C78eNINm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750345809; x=1781881809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bgWzL2egDTSe0NfI/L0xX4GESUKBNWbhNQAx3MCQhI8=;
  b=C78eNINmC49AckZIyGIcVRVxNc+YG8nPQF1Te0BL9bdYKTknQrLSgztU
   KmruU4wBgjlY5i79xTnKDrmrDSafmpX+3ngUwXLqiwyR+l+rx76lvwBZr
   kGyJG9Rh1ztUHrCtboxlf2sMYj4h1VgxjcsIHThTkJgyT1ZKHOVxEtnUW
   cpA6LBZwLuHwdGGPVNVgdEqJKYcwu2w8Zx5ACKgwQRc4bdiE5rpvQnvDw
   Ql0NnMEPd/cpFdjuUrRIOxRo6RM1cwLb9hnBd2QucS7ior7arMcoDbNGF
   5LJ9QX351VrtEaaBYmXAvuFv4M1zKYhV/494t2ssSagfVExRzGCV7P9/b
   Q==;
X-CSE-ConnectionGUID: QXMMGzDgRiCwbGWjCpAaDg==
X-CSE-MsgGUID: xFyCCeaRRq+27LnqtVnI1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52527386"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52527386"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 08:10:08 -0700
X-CSE-ConnectionGUID: XBLiC6d1TIm1JSVNUDfHNw==
X-CSE-MsgGUID: ptX2qYbzREaDVDKh/+KbXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="156172074"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Jun 2025 08:10:07 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSGtx-000KrO-17;
	Thu, 19 Jun 2025 15:10:05 +0000
Date: Thu, 19 Jun 2025 23:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:rev/userfault 3/16]
 arch/x86/include/asm/kvm_host.h:2329:21: error: invalid use of undefined
 type 'struct kvm_vcpu'
Message-ID: <202506192352.r55LpKzv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux rev/userfault
head:   eeac6c6f0380f0667fa04086daffd96954028bed
commit: 47fe4aa211567e1d3f16e8c121162e46e3515acc [3/16] KVM: Fill memory_fault.flags in arch, i.e. in x86
config: x86_64-buildonly-randconfig-004-20250619 (https://download.01.org/0day-ci/archive/20250619/202506192352.r55LpKzv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506192352.r55LpKzv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506192352.r55LpKzv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kvm_host.h:45,
                    from arch/x86/events/intel/core.c:17:
   arch/x86/include/asm/kvm_host.h: In function 'kvm_arch_prepare_memory_fault_exit':
>> arch/x86/include/asm/kvm_host.h:2329:21: error: invalid use of undefined type 'struct kvm_vcpu'
    2329 |                 vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
         |                     ^~


vim +2329 arch/x86/include/asm/kvm_host.h

  2324	
  2325	static inline void kvm_arch_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
  2326							      struct kvm_page_fault *fault)
  2327	{
  2328		if (fault->is_private)
> 2329			vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
  2330	}
  2331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
