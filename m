Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4553328EB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764096732; cv=none; b=ljXKWTG6yEgRT8HxVH24TX2xrIqR5a3PjwcQy6g7Dw4tTc33m7UCdsvYN8neIlarAgqgusHQeHHBK+OeFWn6AGHEQUVDyXbRMWtjVHYJuD+hM66iYYxz3IOLBAEl98ZsR8gUAqGoi6hER8HeSbVKnWahbbQASRyc3FLonDDXDrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764096732; c=relaxed/simple;
	bh=YZZIstYE4z2XXhPUlWnUfnn/eprM83HP45iLYlPpFVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tdnkWUJtsETY22JL86PiRxoypM+saqlrn0Rng+pR0Rk4ckTsln+JQQotKmHoPBc36oKUYMIXztPZaJLn4B8ajQYs4+WVVXEt7YZSGbETMotsPIsuGVT7E1KA6iG2a3igtbSVHUsqR93N05JNyqHrmopv0ENqXQO+b+sTiuKNnDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CyEvoOuy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CyEvoOuy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764096731; x=1795632731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YZZIstYE4z2XXhPUlWnUfnn/eprM83HP45iLYlPpFVc=;
  b=CyEvoOuySukgdkHeHVywmjaYpzjW127HgBCZ+8pK9p2wgNnLn6xZQHNP
   zeuO0M2f/nBkVIQxaqE9Q0aGoDI2Ix9/tuhQJtsajDUKQdKORnWZdcZqN
   iGPOpsQj25YYF/+xl1CZyRSbATyScCuicM+Vg3tnzYAQiBE9apZNpIPLr
   s+7AX6B4nOieZ8wGYQXAuPJCWHKlOoyb6HRoL/8HTRWk+RCdQAYxLB/1W
   e/ISVHak1eCV+/jF4QG2Y7MDqebQwyCTsnTFzZRc7LhRbn1VWXoWTO4ej
   MCMoQbZd7vmkWCPyAb2lTDIUDb9k9Jlh+X3dxPjLI9MiTqisReRlqq8dY
   w==;
X-CSE-ConnectionGUID: 0eyM2kuNRK2sn+ii86EP/g==
X-CSE-MsgGUID: 6fhCTLfbQY2r7XPzx6EJqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="53694919"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="53694919"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 10:52:10 -0800
X-CSE-ConnectionGUID: bEMj1+s9R5KgmchQPh4z0w==
X-CSE-MsgGUID: MyXUvO/RRsmtuuDwzQzHGw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Nov 2025 10:52:09 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNy90-000000002B3-45df;
	Tue, 25 Nov 2025 18:52:06 +0000
Date: Wed, 26 Nov 2025 02:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Upton <oupton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Marc Zyngier <maz@kernel.org>
Subject: [linux-next:master 11303/11746] arch/arm64/kvm/at.c:389:21: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202511260246.JQDGsQKa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   92fd6e84175befa1775e5c0ab682938eca27c0b2
commit: c59ca4b5b0c3fc8386665228b0cfee56323bfeb5 [11303/11746] KVM: arm64: Implement HW access flag management in stage-1 SW PTW
config: arm64-randconfig-r133-20251125 (https://download.01.org/0day-ci/archive/20251126/202511260246.JQDGsQKa-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260246.JQDGsQKa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260246.JQDGsQKa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/at.c:389:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] old @@     got restricted __be64 [usertype] @@
   arch/arm64/kvm/at.c:389:21: sparse:     expected unsigned long long [usertype] old
   arch/arm64/kvm/at.c:389:21: sparse:     got restricted __be64 [usertype]
>> arch/arm64/kvm/at.c:390:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] new @@     got restricted __be64 [usertype] @@
   arch/arm64/kvm/at.c:390:21: sparse:     expected unsigned long long [usertype] new
   arch/arm64/kvm/at.c:390:21: sparse:     got restricted __be64 [usertype]
>> arch/arm64/kvm/at.c:392:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] old @@     got restricted __le64 [usertype] @@
   arch/arm64/kvm/at.c:392:21: sparse:     expected unsigned long long [usertype] old
   arch/arm64/kvm/at.c:392:21: sparse:     got restricted __le64 [usertype]
>> arch/arm64/kvm/at.c:393:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] new @@     got restricted __le64 [usertype] @@
   arch/arm64/kvm/at.c:393:21: sparse:     expected unsigned long long [usertype] new
   arch/arm64/kvm/at.c:393:21: sparse:     got restricted __le64 [usertype]
   arch/arm64/kvm/at.c:1434:9: sparse: sparse: context imbalance in '__kvm_at_s1e01_fast' - wrong count at exit

vim +389 arch/arm64/kvm/at.c

   384	
   385	static int kvm_swap_s1_desc(struct kvm_vcpu *vcpu, u64 pa, u64 old, u64 new,
   386				    struct s1_walk_info *wi)
   387	{
   388		if (wi->be) {
 > 389			old = cpu_to_be64(old);
 > 390			new = cpu_to_be64(new);
   391		} else {
 > 392			old = cpu_to_le64(old);
 > 393			new = cpu_to_le64(new);
   394		}
   395	
   396		return __kvm_at_swap_desc(vcpu->kvm, pa, old, new);
   397	}
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
