Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2484633B6DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 04:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778819207; cv=none; b=GJJxYlA+58/3hbPOjfqewW9XUsAYa05iB2GJCaoaboBBOXCGUWf6c2w1Eh5vmBjhjAZsd8mqUo8F2oLdXTAEmnKloU9bDirYB7mc7hSqCdck3Rs9htKc2caIIb/iOOIW5wsYXOZHF79D02g2pmdFiAWkeNeEpUlMDWRyunjLhjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778819207; c=relaxed/simple;
	bh=osuyo6SY51eRt7XPh8cTf0WSHqC+sePTk0w7yXLfAQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UMRsI2JSz+z9Lc0ckLZSPEVNvZ5m9M3bKKjjjCLXZn+S1rZR/0DEUq+KGBi4GjFxktmhv5D1X3QkLt9X4AnwbJG0tVzPyrw5uqYZ1cyTdnmH2HkZgP3osizINTb+K3yI6MmcZ9QcM8bXjuyetTJkE3tHbCZW3SamuEU2Xbds864=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wq6/5QbH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wq6/5QbH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778819206; x=1810355206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=osuyo6SY51eRt7XPh8cTf0WSHqC+sePTk0w7yXLfAQc=;
  b=Wq6/5QbH3HAsEh88zeoZwLCoVyJkQNgI9Xp77bZX7ei2/zE+qipoVqW9
   nfG+t71ztadJ9fHY68/mM0nJML0KpEQn+C+CcsuHxJrrNG2OcZbnvSUpo
   Eu5hFofPa7ESMuTCQ2OyM1xyp+WEK3VHKXx0l17khG4+5ZEeDrsecdS5f
   rvOHNNuFSCDaN+c/gYWGkT66YanHF4F2pIeAJqQQ1BXr0nBAhgnKyIXSO
   RC2tVNCHWaQlJHtmpxqYhnw7SrOebDzrYUewd1fxQ6CmJ2HmLER8fmOgF
   laFF6S9F2FncQzpoTMEd+TWFfnZqKMj42zsL6s560BNoaTJx6FG+5yC3G
   Q==;
X-CSE-ConnectionGUID: TWtmFrhPRbmwJkk90tl9mA==
X-CSE-MsgGUID: TBJfx0cuTZ+ycP3Cyv3QFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79730672"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79730672"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 21:26:46 -0700
X-CSE-ConnectionGUID: e1jAHV0JThir2HaBzJ1T+A==
X-CSE-MsgGUID: TF4r+x09Rk67OfXomwavCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="234323409"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 14 May 2026 21:26:44 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNk7f-000000000oV-0lfq;
	Fri, 15 May 2026 04:26:12 +0000
Date: Fri, 15 May 2026 12:10:47 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Radim =?utf-8?Q?Kr=C4=8Dm=C3=A1=C5=99"?= <radim.krcmar@oss.qualcomm.com>
Subject: arch/riscv/kvm/vcpu_config.c:81:17: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202605151113.AA6uGwBL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70eda68668d1476b459b64e69b8f36659fa9dfa8
commit: 6ed523e2b6129d7dd4aab801a610930d85b2d3f8 RISC-V: KVM: Factor-out VCPU config into separate sources
date:   6 weeks ago
config: riscv-randconfig-r113-20260515 (https://download.01.org/0day-ci/archive/20260515/202605151113.AA6uGwBL-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151113.AA6uGwBL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6ed523e2b612 ("RISC-V: KVM: Factor-out VCPU config into separate sources")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151113.AA6uGwBL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> arch/riscv/kvm/vcpu_config.c:81:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:81:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:81:17: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu_config.c:82:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:82:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:82:17: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu_config.c:83:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:83:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:83:17: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu_config.c:85:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:85:25: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:85:25: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu_config.c:87:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:87:25: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:87:25: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu_config.c:89:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:89:33: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:89:33: sparse:     got restricted __le32 [usertype]

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
