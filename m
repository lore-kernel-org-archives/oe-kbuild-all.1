Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D415238D3F6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 03:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781235507; cv=none; b=GqpYfyHLvKhoVcIDv3e7uozd47FA/5lps4+rvB0asvTai74wt2aJaJ8JzrJbcZCFAdGGD6J8fHJhvvzybOTDCAJpzPKEbDq1jxzL9raf+jBSqL0uES+kBZMN3VtvILXf41QJAieTPQB65nuGwhKZifsbvlAMvl5UEl0eAK/+Dkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781235507; c=relaxed/simple;
	bh=cdL3hjWHxADipDINv+yyb8RaWnTvz2zwNr5msLRniTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HoT3Vd4EjBVe/IsQQ0/augKUrAFfvzG/BypwYZ9zOvzOBNs+sSa1jm+pDggob8UVSJW7MLBgaHlLBs31xL2jPtDGPylRQZuBjek879+ITnpCmyTNFkMAP25evUSxOL0eqRISUoWfxq31OAEc0N5caWA7o76QW0CCLYXSGbiaEWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNrL8IL2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNrL8IL2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781235505; x=1812771505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cdL3hjWHxADipDINv+yyb8RaWnTvz2zwNr5msLRniTE=;
  b=jNrL8IL2H8nLvd9u7LwEVvOs7n7TPrKS2RKYBTDGUwu77iKftOPWwmTO
   eUORtZrX3vO8e51iJSsuL0i3Pe/BfpAzzn/cJTqe3YzaQrVVPlS6ZEiTQ
   zt65gAnXcsPpiznzMgQoUfYSDZrfxPDH0g6b9XkCgbVZzZi3KMgzPJVie
   qPz/JWRcRV5M8KPd7cz96LKVtIH7nuORgYB0uAhJAiyrZHx7jO9VBrcFx
   xBZyGxEUO8eUxpxg7Zw4qXrrSO4sS2IPikUvUPjR7XHbHvMiQv1aYSz/h
   9GKa2g+dezrJLvI+igqN3AUR4y4yWGo1YUUtdcK114QelH9NreSchmLTH
   Q==;
X-CSE-ConnectionGUID: ebl1lL1URZelhrCmTfAk9A==
X-CSE-MsgGUID: nqO9yqmFSDGT2/xenmx2wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82109787"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82109787"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 20:38:23 -0700
X-CSE-ConnectionGUID: dApBtNT3TjSVoR8p/4cgOw==
X-CSE-MsgGUID: OWOxeoevTF+k1gjAFwSw7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="246735316"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2026 20:38:20 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXsin-00000000OGL-3l1O;
	Fri, 12 Jun 2026 03:38:17 +0000
Date: Fri, 12 Jun 2026 11:37:27 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Radim =?utf-8?Q?Kr=C4=8Dm=C3=A1=C5=99"?= <radim.krcmar@oss.qualcomm.com>
Subject: arch/riscv/kvm/vcpu_config.c:81:17: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202606121131.MoaF9Gwp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
commit: 6ed523e2b6129d7dd4aab801a610930d85b2d3f8 RISC-V: KVM: Factor-out VCPU config into separate sources
date:   2 months ago
config: riscv-randconfig-r121-20260612 (https://download.01.org/0day-ci/archive/20260612/202606121131.MoaF9Gwp-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121131.MoaF9Gwp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6ed523e2b612 ("RISC-V: KVM: Factor-out VCPU config into separate sources")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121131.MoaF9Gwp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/vcpu_config.c:81:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:81:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:81:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:82:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:82:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:82:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:83:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:83:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:83:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:85:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:85:25: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:85:25: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:87:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:87:25: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:87:25: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:89:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:89:33: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:89:33: sparse:     got restricted __le64 [usertype]

vim +81 arch/riscv/kvm/vcpu_config.c

    73	
    74	void kvm_riscv_vcpu_config_load(struct kvm_vcpu *vcpu)
    75	{
    76		struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
    77		void *nsh;
    78	
    79		if (kvm_riscv_nacl_sync_csr_available()) {
    80			nsh = nacl_shmem();
  > 81			nacl_csr_write(nsh, CSR_HEDELEG, cfg->hedeleg);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
