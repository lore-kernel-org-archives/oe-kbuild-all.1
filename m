Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1BA1F9EC1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735913420; cv=none; b=buuxUccZtB608QWK4iM+jrvEStWNVAk4MkbxeALXWZqEVfNvNwrWBGKN6cZzNDSgLfdQjmUpUfhShBgd9UgY5nANxcaZLttOMU3eUh6CO1LPv/F7m70z2KDsqxO+5TLe7clmVwpBRo3u9ij3H/VogeQmGXjOyiTwj1tHZjnfQzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735913420; c=relaxed/simple;
	bh=jJi/u2qu72CHzUbVA5HLsYn/wab0PvEFTOzfyKzeO04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YBx8P9UcBszNJvKm8MbxAY6LXvM3vW/lhZ2vPIechZNvFQbindoPAjWNOVEgFBVxozRN1jwyfaOpnFqC6JbeZgObwmUvYxJ0Dsap0o5YKD4h6GrLNc9d0KLvo7ZRRrSVxCPTpWjixzCHeKkw6TyhTXvwBkyAU5SSokxZn1XtKic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VptHyBKk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VptHyBKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735913419; x=1767449419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jJi/u2qu72CHzUbVA5HLsYn/wab0PvEFTOzfyKzeO04=;
  b=VptHyBKkFHGoi+D7APJSQXSI8KQCWowdgeSzLGmKxvsqvYzjdQyOuWC6
   AJTEv5wkrcLA9AESiN2sy35muCdpON7r3MKZ33j8PZfnrIKXzkYW95nkz
   dEWnI3TLApmfC9OjYKSxEqeSeVOXbAL2d+h3hudMskBfF+HSptBpOt+xT
   JbrbQEZg8zO85zDscsVUCOtq30ZB5HfhG8Cfj1DMEPysOxiVrU9c+0qzo
   L4TLTO0tP4H8C0l8WMFGFuS4NkNzGf3bojNeA46c5S26j6wxRuW50V9Jc
   E38HZ7XPMXvbo0SznOzGdMeiZVXllWHreSGDiKeWHYa0Jkq/myiz8CIS5
   g==;
X-CSE-ConnectionGUID: AEElq4qOQlea3TDEZDYnDA==
X-CSE-MsgGUID: q5VjEsG2Ra2o7u5Ya0ZKeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36180065"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36180065"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 06:10:15 -0800
X-CSE-ConnectionGUID: Bel8lnBrSXyzufwUZ41NAw==
X-CSE-MsgGUID: uC2NK52oTcypQ58dCIlwPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101664567"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jan 2025 06:10:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTiNP-0009oD-2K;
	Fri, 03 Jan 2025 14:10:11 +0000
Date: Fri, 3 Jan 2025 22:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1693/1693] arch/loongarch/kvm/vcpu.c:224:9:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202501032224.CjyqUkQC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Song,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   604e996dd0189ddb0875f389b87fa2084b3a9424
commit: 031d5914323febe9668956dfa7fe8443b7dc597c [1693/1693] LoongArch: KVM: Add PMU support for guest
config: loongarch-randconfig-r112-20250103 (https://download.01.org/0day-ci/archive/20250103/202501032224.CjyqUkQC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250103/202501032224.CjyqUkQC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501032224.CjyqUkQC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/loongarch/kvm/vcpu.c:17:49: sparse: sparse: array of flexible structures
   arch/loongarch/kvm/vcpu.c: note: in included file:
   include/linux/kvm_host.h:2045:56: sparse: sparse: array of flexible structures
   arch/loongarch/kvm/vcpu.c:104:15: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kvm/vcpu.c:106:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c:124:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
>> arch/loongarch/kvm/vcpu.c:224:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/vcpu.c:224:9: sparse:     expected void *ptr
   arch/loongarch/kvm/vcpu.c:224:9: sparse:     got unsigned int [noderef] __percpu *
>> arch/loongarch/kvm/vcpu.c:224:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/vcpu.c:224:9: sparse:     expected void *ptr
   arch/loongarch/kvm/vcpu.c:224:9: sparse:     got unsigned int [noderef] __percpu *
>> arch/loongarch/kvm/vcpu.c:224:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/vcpu.c:224:9: sparse:     expected void *ptr
   arch/loongarch/kvm/vcpu.c:224:9: sparse:     got unsigned int [noderef] __percpu *
>> arch/loongarch/kvm/vcpu.c:224:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/vcpu.c:224:9: sparse:     expected void *ptr
   arch/loongarch/kvm/vcpu.c:224:9: sparse:     got unsigned int [noderef] __percpu *
>> arch/loongarch/kvm/vcpu.c:224:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/vcpu.c:224:9: sparse:     expected void *ptr
   arch/loongarch/kvm/vcpu.c:224:9: sparse:     got int [noderef] __percpu *
>> arch/loongarch/kvm/vcpu.c:224:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/vcpu.c:224:9: sparse:     expected void *ptr
   arch/loongarch/kvm/vcpu.c:224:9: sparse:     got int [noderef] __percpu *
>> arch/loongarch/kvm/vcpu.c:224:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/vcpu.c:224:9: sparse:     expected void *ptr
   arch/loongarch/kvm/vcpu.c:224:9: sparse:     got int [noderef] __percpu *
>> arch/loongarch/kvm/vcpu.c:224:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/vcpu.c:224:9: sparse:     expected void *ptr
   arch/loongarch/kvm/vcpu.c:224:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/vcpu.c:290:42: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kvm/vcpu.c:1442:33: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/kvm/vcpu.c:1529:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c:1578:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c:1671:42: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kvm/vcpu.c:40:33: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kvm/vcpu.c:41:33: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kvm/vcpu.c:42:33: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kvm/vcpu.c:43:33: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kvm/vcpu.c:44:33: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c:45:33: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c:46:33: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c:47:33: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c:55:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c:56:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c:57:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c:58:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c:59:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c:60:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c:61:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c:62:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c: note: in included file (through arch/loongarch/include/asm/loongarch.h, arch/loongarch/include/asm/cpu-info.h, ...):
   ../lib/gcc/loongarch64-linux/14.2.0/include/larchintrin.h:107:10: sparse: sparse: undefined identifier '__builtin_loongarch_cpucfg'
   arch/loongarch/kvm/vcpu.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/kvm/vcpu.c: note: in included file (through arch/loongarch/kvm/trace.h):
   arch/loongarch/include/asm/kvm_csr.h:167:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/include/asm/kvm_csr.h:167:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c: note: in included file:
   arch/loongarch/include/asm/fpu.h:76:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/fpu.h:85:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'

vim +224 arch/loongarch/kvm/vcpu.c

3ec7320b0a2844 Tianrui Zhao 2023-10-02  221  
3f5dde7efb48ae Bibo Mao     2024-07-09  222  static void kvm_late_check_requests(struct kvm_vcpu *vcpu)
3f5dde7efb48ae Bibo Mao     2024-07-09  223  {
3f5dde7efb48ae Bibo Mao     2024-07-09 @224  	lockdep_assert_irqs_disabled();
3f5dde7efb48ae Bibo Mao     2024-07-09  225  	if (kvm_check_request(KVM_REQ_TLB_FLUSH_GPA, vcpu))
3f5dde7efb48ae Bibo Mao     2024-07-09  226  		if (vcpu->arch.flush_gpa != INVALID_GPA) {
3f5dde7efb48ae Bibo Mao     2024-07-09  227  			kvm_flush_tlb_gpa(vcpu, vcpu->arch.flush_gpa);
3f5dde7efb48ae Bibo Mao     2024-07-09  228  			vcpu->arch.flush_gpa = INVALID_GPA;
3f5dde7efb48ae Bibo Mao     2024-07-09  229  		}
3f5dde7efb48ae Bibo Mao     2024-07-09  230  }
3f5dde7efb48ae Bibo Mao     2024-07-09  231  

:::::: The code at line 224 was first introduced by commit
:::::: 3f5dde7efb48ae2725aebecfbd47aacfa3def181 LoongArch: KVM: Delay secondary mmu tlb flush until guest entry

:::::: TO: Bibo Mao <maobibo@loongson.cn>
:::::: CC: Xianglai Li <lixianglai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
