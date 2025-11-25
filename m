Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C0F33ADB5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 20:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764101837; cv=none; b=WHg0jRPLJhUTdzJkHeI4KL9th9VmiEuw7T0jyXj/yHtd2w7KSZzSRQEx4U4bzeYRulLncD/JuNbjqil667L1/INmrf8FFAFYXxoXiahIYVHzSxc1pKO+yep3C2Ea6AKyKNKpx5CDbQy6b4T7IVEdwUuHzd9pXTPuCtkoRNjaWj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764101837; c=relaxed/simple;
	bh=eX8rJZZHVZJpLmAQvSqmFJ7zXMFEFNmLyPq2vlse1Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B6ohqQmgMH0ypT1sF+XQn/Q+LH/wqiRu0RvJqC8Tpwj/2F5bVOVROW0Vh9eRXgJekYaAmpHU5WhYtWbhweBcskYYHaZMwaoVW7LyZoEfx7ECXNdWTXaq9M82Xhqm/Jkhp7L0xOp5ZklJn/zlkgtmC2Ln+HyPSfin6YuPJJ56SRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7BaIHYm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7BaIHYm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764101836; x=1795637836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eX8rJZZHVZJpLmAQvSqmFJ7zXMFEFNmLyPq2vlse1Qo=;
  b=c7BaIHYmjCm1RU787lXs76HhXGvo7oFLDSSzSxEI0D15O+LU/BAtUX7N
   wWy+teD/KrKLPp3L01JhUUP6FpsCvxcNLSf/JlMGrpiwnt2R/OSnJdD3I
   RXH1Bpdi6FVgY+ZMbMN02gJXTezx+aSPWIfLraAr1dYd9ejYhEiMAoblG
   k87sd6SOG3/8kA21rWxpG6sx8ruoSkYRC7NZA1aZ+4A4cVNhKTqmcK73a
   fxfMHDOqQYwSMSEPx4+mF8q+uNwfZPTyglapabSy4GvfOjFRUxwDNfZWx
   di/c29mzOjfWoybdMz6aSoXf6OO10XuR03ghIQq/c/yGMJIbD/xdcxCfz
   Q==;
X-CSE-ConnectionGUID: CoXrQVaRSOu+nUX8B5Sy+Q==
X-CSE-MsgGUID: ocM6GeOyQ2+Jg8D4Y0uw0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="68721622"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="68721622"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 12:17:15 -0800
X-CSE-ConnectionGUID: ckxP8G9PS5maRWxpMuoYPA==
X-CSE-MsgGUID: 03vfybiVSMGPYGqXYrfOCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="197689065"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Nov 2025 12:17:14 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNzTL-000000002ER-3r1s;
	Tue, 25 Nov 2025 20:17:11 +0000
Date: Wed, 26 Nov 2025 04:16:14 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Upton <oupton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Marc Zyngier <maz@kernel.org>
Subject: [linux-next:master 11304/11746] arch/arm64/kvm/nested.c:227:21:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202511260344.9XehvH5Q-lkp@intel.com>
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
commit: 39db933ba67f89b95dc7c7c11cfd63c323c59af9 [11304/11746] KVM: arm64: nv: Implement HW access flag management in stage-2 SW PTW
config: arm64-randconfig-r133-20251125 (https://download.01.org/0day-ci/archive/20251126/202511260344.9XehvH5Q-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260344.9XehvH5Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260344.9XehvH5Q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/nested.c:227:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] old @@     got restricted __be64 [usertype] @@
   arch/arm64/kvm/nested.c:227:21: sparse:     expected unsigned long long [usertype] old
   arch/arm64/kvm/nested.c:227:21: sparse:     got restricted __be64 [usertype]
>> arch/arm64/kvm/nested.c:228:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] new @@     got restricted __be64 [usertype] @@
   arch/arm64/kvm/nested.c:228:21: sparse:     expected unsigned long long [usertype] new
   arch/arm64/kvm/nested.c:228:21: sparse:     got restricted __be64 [usertype]
>> arch/arm64/kvm/nested.c:230:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] old @@     got restricted __le64 [usertype] @@
   arch/arm64/kvm/nested.c:230:21: sparse:     expected unsigned long long [usertype] old
   arch/arm64/kvm/nested.c:230:21: sparse:     got restricted __le64 [usertype]
>> arch/arm64/kvm/nested.c:231:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] new @@     got restricted __le64 [usertype] @@
   arch/arm64/kvm/nested.c:231:21: sparse:     expected unsigned long long [usertype] new
   arch/arm64/kvm/nested.c:231:21: sparse:     got restricted __le64 [usertype]
   arch/arm64/kvm/nested.c: note: in included file (through include/linux/sched.h, include/linux/resume_user_mode.h, include/linux/entry-virt.h, ...):
   include/linux/spinlock.h:606:1: sparse: sparse: context imbalance in 'kvm_handle_s1e2_tlbi' - wrong count at exit
   arch/arm64/kvm/nested.c:1219:12: sparse: sparse: context imbalance in 'kvm_translate_vncr' - wrong count at exit
   arch/arm64/kvm/nested.c:1416:13: sparse: sparse: context imbalance in 'kvm_map_l1_vncr' - wrong count at exit

vim +227 arch/arm64/kvm/nested.c

   222	
   223	static int swap_guest_s2_desc(struct kvm_vcpu *vcpu, phys_addr_t pa, u64 old, u64 new,
   224				      struct s2_walk_info *wi)
   225	{
   226		if (wi->be) {
 > 227			old = cpu_to_be64(old);
 > 228			new = cpu_to_be64(new);
   229		} else {
 > 230			old = cpu_to_le64(old);
 > 231			new = cpu_to_le64(new);
   232		}
   233	
   234		return __kvm_at_swap_desc(vcpu->kvm, pa, old, new);
   235	}
   236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
