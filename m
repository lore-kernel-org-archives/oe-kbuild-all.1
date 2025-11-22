Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0FD27A123
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 10:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763808184; cv=none; b=A+W2hwJ46Y1NCSbqh9fAAtUUb13FA8Ns7kbbXKJ7b5a3VBhBdEyXQjiYb0QKWIabzKCDQ62bB99UBdq+boQZHxynKXZtBXp8pTXZTHwWatYEKFsFgzuhVHKPzTDwiRqeVubV5fH9t85EWCHmrRnxzaPPivFwWM69C+ET7auiCX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763808184; c=relaxed/simple;
	bh=wXYgRinM5j8YSf+cZoKNBh8tjDfGKCiAVG2keiptC8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QqaCFF0sOVdptY0yPoMgIvOH3dHq5LrLMpOOL4dlWdI/GpAkmUU92oaR5f7MzGrU8dvKrS1pEe50QcOJvfh2qnKKAMde9D2561qoBSbPCzwsH6jnx50+gBH8v5faR8ErmhEYy96Y0JAMFMih1GsH8pIDzwOFskG5AkmBGcq5aQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEXH0kRl; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEXH0kRl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763808182; x=1795344182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wXYgRinM5j8YSf+cZoKNBh8tjDfGKCiAVG2keiptC8s=;
  b=EEXH0kRlV+q1y8TnuEhsHhDtqd7sY56haEe5UKLY/NxtTbQkUJMkAK5y
   5VTdN9VLdT9Ug4Nr3DQqWTiwgcz6rmJGqyRhB1+zAvOJHH2xVGZzz9qhs
   QVqEVlBXNGgpuhI2FvBPxnedDEzz6je962q+LtAFHHW8GmU61fF9mwdnq
   J83/0J6LuqNCMlyyDRExR7jNLvDda8R5zZEoeEWXiBckOm2crjVnnml70
   ZHsW+9cBKxk5VuncL96H0iZxKApNL8tknIO9uZuanEBLaWUHBuWFVOBAf
   OhaEGTRrq8telKeCAWPjXyG5G4xJK9jJ+W0gT8reOgE/eMyXmeU/vs1Ue
   A==;
X-CSE-ConnectionGUID: C/dOtOKRT/2tCOJbAk1AVQ==
X-CSE-MsgGUID: LP3TWtIMT7GuasnTk/zjiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65075895"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65075895"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 02:43:02 -0800
X-CSE-ConnectionGUID: VMqgq6KgTE6rNJkq5DMyyQ==
X-CSE-MsgGUID: UCNe+HpMTomGmsSgFvWldg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="222853522"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2025 02:43:01 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMl50-0007Pz-1o;
	Sat, 22 Nov 2025 10:42:58 +0000
Date: Sat, 22 Nov 2025 18:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinqian Yang <yangjinqian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3304/3304] arch/arm64/kvm/vgic/vgic-its.c:567:40:
 error: passing argument 1 of 'hisi_ipiv_supported_per_vm' from incompatible
 pointer type
Message-ID: <202511221815.EIAnEfb9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ea193ff9f080f6657caa2b5f907d5465ca3147dc
commit: 22f1e3b38ca09cbc655a606e6404b996710841a1 [3304/3304] KVM: arm64: ipiv: fix bug in live migration
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251122/202511221815.EIAnEfb9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221815.EIAnEfb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221815.EIAnEfb9-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/vgic/vgic-its.c: In function 'vgic_mmio_uaccess_write_its_iidr':
>> arch/arm64/kvm/vgic/vgic-its.c:567:40: error: passing argument 1 of 'hisi_ipiv_supported_per_vm' from incompatible pointer type [-Wincompatible-pointer-types]
     567 |         if (hisi_ipiv_supported_per_vm(kvm) &&
         |                                        ^~~
         |                                        |
         |                                        struct kvm *
   In file included from arch/arm64/kvm/vgic/vgic-its.c:25:
   arch/arm64/kvm/hisilicon/hisi_virt.h:127:64: note: expected 'struct kvm_vcpu *' but argument is of type 'struct kvm *'
     127 | static inline bool hisi_ipiv_supported_per_vm(struct kvm_vcpu *vcpu)
         |                                               ~~~~~~~~~~~~~~~~~^~~~


vim +/hisi_ipiv_supported_per_vm +567 arch/arm64/kvm/vgic/vgic-its.c

   555	
   556	static int vgic_mmio_uaccess_write_its_iidr(struct kvm *kvm,
   557						    struct vgic_its *its,
   558						    gpa_t addr, unsigned int len,
   559						    unsigned long val)
   560	{
   561		u32 rev = GITS_IIDR_REV(val);
   562	
   563		if (rev >= NR_ITS_ABIS)
   564			return -EINVAL;
   565	
   566	#ifdef CONFIG_ARM64_HISI_IPIV
 > 567		if (hisi_ipiv_supported_per_vm(kvm) &&
   568		    val & (1UL << HISI_GUEST_ENABLE_IPIV_SHIFT))
   569			kvm->arch.vgic.its_vm.enable_ipiv_from_guest = true;
   570	#endif
   571	
   572		return vgic_its_set_abi(its, rev);
   573	}
   574	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
