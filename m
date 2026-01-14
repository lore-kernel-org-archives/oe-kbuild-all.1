Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A5B3559DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 21:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768424843; cv=none; b=ZTjQPNduIVdjXOyC+0fDx5wPexKQS/2aQD9ZcBvpfyDkauyWoaCXPOiSIbu3tSjleCjrKGDPAs4wKKPB38YwLzWxZlJwSyegJNCI/6fFN+Fu68oK5QQOfWXLmdrvR71Z+450OSAvA/Q/O3bQNUuZiUkSFOwwGWwjY49SMyPJmnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768424843; c=relaxed/simple;
	bh=HE4xyt1c0mYXhTs0vvG/Axm/CYGnNwBWPlYlRHgkecQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jQ9ilKNsUjjSrvUIWYI5+iAUNzMShYLnBvMTu1S3Ibbp9JEehD0cdYl59iUQBEFDY4cCT9Un45M9F+i+o+mgYRp9io0pomPunDegtTF1aDaWw2UKEl1IYeiWc+7jWySupYPaQyoFSmpcWlp3xTIJSLvAZ10oSLG/610Ru3TozV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A2UinP2B; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2UinP2B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768424842; x=1799960842;
  h=date:from:to:cc:subject:message-id;
  bh=HE4xyt1c0mYXhTs0vvG/Axm/CYGnNwBWPlYlRHgkecQ=;
  b=A2UinP2BZvp5RbYKu4Y7A9DA+YrKUYWxeBYHuyGsh2nSbX8xfRrORqlg
   M9jQvdspHo4OqyV0t/bfFvjpI3hXz3bbIA3LBGIbabU5ThZpJCfVcBZ/K
   MMgkfzTkguRAjwahOZZ6eu5c8oV96U/F29mXwTviw5r1YE3cnzD6L/+Nn
   PebHEcddMJ52eQLpk8+68dyaNx+/MKzpexTaXJ8pNOg8SQlMuvl6gAQuY
   gNa/mPcf2nYMxQq4fcEVYoFIn7p0wenTJNn/uJ+YiDocMyY/HUrzB9ZZF
   YAi4QULjKFNvuoGWQ6N3e4svAOk309F2mtkqL0LTuNSs02Pi1N2yWYr7k
   A==;
X-CSE-ConnectionGUID: H+lqWODkT+ejpuES89la0w==
X-CSE-MsgGUID: vpfa+A/wSgacMxr87Y3+OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69817448"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69817448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 13:07:21 -0800
X-CSE-ConnectionGUID: 5MHMyElvSBOULb/aPDWejw==
X-CSE-MsgGUID: gG38NNCnSgObIG5svKAIMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="205200068"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jan 2026 13:07:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg85F-00000000H0q-3ViK;
	Wed, 14 Jan 2026 21:07:17 +0000
Date: Thu, 15 Jan 2026 05:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_kvm_nested_v1 13/29]
 arch/riscv/kvm/vcpu_config.c:79:17: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202601150422.RuNOOsnm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_kvm_nested_v1
head:   d4b2d5a14e336a12a75d613fa8c743557c44795b
commit: 63b7d1bb3a2d7e639c32b5182b03b7870e6f1cc2 [13/29] RISC-V: KVM: Factor-out VCPU config into separate sources
config: riscv-randconfig-r121-20260114 (https://download.01.org/0day-ci/archive/20260115/202601150422.RuNOOsnm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150422.RuNOOsnm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150422.RuNOOsnm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> arch/riscv/kvm/vcpu_config.c:79:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:79:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:79:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:80:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:80:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:80:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:81:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:81:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:81:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:83:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:83:25: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:83:25: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:85:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:85:25: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:85:25: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:87:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:87:33: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:87:33: sparse:     got restricted __le64 [usertype]

vim +79 arch/riscv/kvm/vcpu_config.c

    71	
    72	void kvm_riscv_vcpu_config_load(struct kvm_vcpu *vcpu)
    73	{
    74		struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
    75		void *nsh;
    76	
    77		if (kvm_riscv_nacl_sync_csr_available()) {
    78			nsh = nacl_shmem();
  > 79			nacl_csr_write(nsh, CSR_HEDELEG, cfg->hedeleg);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
