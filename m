Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A043B199FAC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 00:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768437037; cv=none; b=f8cURL9MRdUrvwPYrl7TNA5OvdOX10G4f+NsaFqltESn0Du521xbY7kyJOvLuneHF0x8b+yFh7lWBJqIgU0WKL2JmvIkLCt/u/Xg0HOLO4DQJqJAONxz4urK9Qcx9MiPTRdPNwNj8TBZB4pVQpvBxZFicgowpR45hRjvuwfXbJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768437037; c=relaxed/simple;
	bh=bAP9XQ9Syv2ES9W3Si7v60xG52watqUdcG7av1p8oEU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rpUUcMCF7HvCpeC5RHa7vTB4yHfqBW4g9Zxd2W38Y2Bp8L7eI6MmVeJZLM/++lLT5OrBAiPwj2rgyCUiiEiLDyVlxSezzGWHB8P8dA/hWdnyk4zLBi4waFkyHn+00kqZIK7Yr1uF8K1WgfNwifMrTk8yS5EQ4Hxx3KIwuT+8K0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kyi16lcz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kyi16lcz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768437036; x=1799973036;
  h=date:from:to:cc:subject:message-id;
  bh=bAP9XQ9Syv2ES9W3Si7v60xG52watqUdcG7av1p8oEU=;
  b=Kyi16lczJmGuTFy7iDHPBsBW4ZbY+429+Fue4Z/p/fuvDK2udagvHTrh
   bd0V/UlxI9Xf5brBVLBwYatNKeCHh6H8202EM74oRW0pQu0lsrLzOjcIH
   4ZGCA6JR7D8LOXGgDP3fMsQGKPpIyr+E9xISO4cMkrumKS36/uwMpyL0I
   WEFqIpcfDUJgdq4It2BJbLIM6o37PXF1MLlaITWA0hsJEpzTHEGhrLkcC
   HfiM90BnpZZRpOdGzZuh8oVhtWPYx91YTTMbElbK/AsEp8YOePjh5mE/T
   8U+GvdP3ADtrPH231SlFLb7EJFAIUvXQ+6tPWh4J4f2Ie/jTCj78y6/nT
   Q==;
X-CSE-ConnectionGUID: 4zDQVdDpRFmoh6MmkFM8xg==
X-CSE-MsgGUID: m+IZvGWWRC+tSO5vUadNpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69721278"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69721278"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 16:30:36 -0800
X-CSE-ConnectionGUID: 2LGf6GwqS8uSL/guPrxfRQ==
X-CSE-MsgGUID: dWbw9aL9SMWZpSwZhu7LRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="203957221"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Jan 2026 16:30:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgBFv-00000000HFc-1lSP;
	Thu, 15 Jan 2026 00:30:31 +0000
Date: Thu, 15 Jan 2026 08:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_kvm_nested_v1 18/29]
 arch/riscv/kvm/vcpu_config.c:105:31: sparse: sparse: cast to restricted
 __le64
Message-ID: <202601150845.uHaCKQa2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_kvm_nested_v1
head:   d4b2d5a14e336a12a75d613fa8c743557c44795b
commit: 1dd1771c70db71266dc944089ced50cbadd630f9 [18/29] RISC-V: KVM: Extend kvm_riscv_vcpu_config_load() for nested virtualization
config: riscv-randconfig-r121-20260114 (https://download.01.org/0day-ci/archive/20260115/202601150845.uHaCKQa2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150845.uHaCKQa2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150845.uHaCKQa2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
   arch/riscv/kvm/vcpu_config.c:94:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:94:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:94:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:95:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:95:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:95:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:96:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:96:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:96:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:98:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:98:25: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:98:25: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:100:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:100:25: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:100:25: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:102:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:102:33: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:102:33: sparse:     got restricted __le64 [usertype]
>> arch/riscv/kvm/vcpu_config.c:105:31: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu_config.c:110:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:110:25: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:110:25: sparse:     got restricted __le64 [usertype]

vim +105 arch/riscv/kvm/vcpu_config.c

    71	
    72	void kvm_riscv_vcpu_config_load(struct kvm_vcpu *vcpu, bool nested_virt)
    73	{
    74		struct kvm_vcpu_nested_csr *nsc = &vcpu->arch.nested.csr;
    75		struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
    76		unsigned long hedeleg, hideleg, tmp;
    77		u64 henvcfg, hstateen0;
    78		void *nsh;
    79	
    80		if (nested_virt){
    81			hedeleg = nsc->hedeleg;
    82			hideleg = 0;
    83			henvcfg = 0;
    84			hstateen0 = 0;
    85		} else {
    86			hedeleg = cfg->hedeleg;
    87			hideleg = cfg->hideleg;
    88			henvcfg = cfg->henvcfg;
    89			hstateen0 = cfg->hstateen0;
    90		}
    91	
    92		if (kvm_riscv_nacl_sync_csr_available()) {
    93			nsh = nacl_shmem();
    94			nacl_csr_write(nsh, CSR_HEDELEG, hedeleg);
    95			nacl_csr_write(nsh, CSR_HIDELEG, hideleg);
    96			nacl_csr_write(nsh, CSR_HENVCFG, henvcfg);
    97			if (IS_ENABLED(CONFIG_32BIT))
  > 98				nacl_csr_write(nsh, CSR_HENVCFGH, henvcfg >> 32);
    99			if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
   100				nacl_csr_write(nsh, CSR_HSTATEEN0, hstateen0);
   101				if (IS_ENABLED(CONFIG_32BIT))
   102					nacl_csr_write(nsh, CSR_HSTATEEN0H, hstateen0 >> 32);
   103			}
   104			if (kvm_riscv_aia_available()) {
 > 105				tmp = nacl_csr_read(nsh, CSR_HVICTL);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
