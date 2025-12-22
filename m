Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FAD33E341
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399171; cv=none; b=Yv0fBnIedZTC27974FiXLsSnkssjncfBDLnMePjZlP903kHQ1ObkrLtgsKUeG6MHHkvZsAQIh7mBwU+Sqds7Q2DYiMox5F6ik/iXgaf5NZ64dE/3MUcSr84Tijuycm1/yxRYKH0sdAJbgzp+GMOpbrg8z/BNaxj6gLB1qAbICa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399171; c=relaxed/simple;
	bh=ENnZE6ti2jbYtefxEp76FQELKIhd+OPJYGLeNA4mMZQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W0ZAGDAKW72CSSAtNZY411P0qHrpIxdMghRgn2j645pJvApuIdonbvjlBp0HW+5c0kf2mMuCHk6TT3l8HEppAlyjgPrumuD72sTUlqvlndd8vHdErd57DT8YwPrxWIBWx80nTTbo9zi2ZYW4WLL8We0TLATQ1iyy9sp18ukUR+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=matE79BY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="matE79BY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766399167; x=1797935167;
  h=date:from:to:cc:subject:message-id;
  bh=ENnZE6ti2jbYtefxEp76FQELKIhd+OPJYGLeNA4mMZQ=;
  b=matE79BYDkT6VjG45xZvKcLrLEUxFX88hbw6Nq2gtLhALNUvVhT4QnJX
   YY6CNJdTGumYBTI2ziPpi6ADlHdoeg5HFtMZGguxraWDV9WfVLEnmpwpw
   14UmondO72IoBRAriAUHSi1xSp53CCQC+DTEga1g5kjwui5s/ed2/7vke
   jIjDTk/ZqYEg0iX05/2TqmsiqatHBA398UoLPgUCluSI5w8R9xhtUBj7m
   Y2VWqde3o7V0jWOcjSxUv4aHhza27ci8jvmfmT9HgAL3I9hvrCPVdF73R
   kwOCAERfP+bULrwJy+HVrcAE3ezn8/z9TfflDGcvmufbPxRHoBJ/oY8KR
   Q==;
X-CSE-ConnectionGUID: h2/cfsuuQjGC75sETmgZyw==
X-CSE-MsgGUID: EXwRGU9FTySY8xeFxThhlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78971824"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="78971824"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 02:26:01 -0800
X-CSE-ConnectionGUID: IfzSaalTSkms7p3UnFIEEQ==
X-CSE-MsgGUID: cMJQKcovQs22vSjxyJ6Fyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199405189"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Dec 2025 02:25:59 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXd6z-000000000O4-2CHr;
	Mon, 22 Dec 2025 10:25:57 +0000
Date: Mon, 22 Dec 2025 18:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dongxu Sun <sundongxu3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3542/3542]
 arch/arm64/kvm/vgic/vgic-v4.c:260: warning: Function parameter or member
 'vcpu' not described in 'kvm_vgic_get_vcpu_vpeid'
Message-ID: <202512221812.bA9JN365-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 78feb450c1fbd0f2a1a542882ed62a0993c86c5a [3542/3542] KVM: arm64: GICv4.1: Add support for MBIGEN save/restore
config: arm64-randconfig-001-20251215 (https://download.01.org/0day-ci/archive/20251222/202512221812.bA9JN365-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221812.bA9JN365-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221812.bA9JN365-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/vgic/vgic-v4.c:260: warning: Function parameter or member 'vcpu' not described in 'kvm_vgic_get_vcpu_vpeid'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +260 arch/arm64/kvm/vgic/vgic-v4.c

   253	
   254	/**
   255	 * kvm_vgic_get_vcpu_vpeid - Get the VCPU's vpeid
   256	 *
   257	 * The vtimer mbigen needs the vcpu vpeid info which will resident.
   258	 */
   259	u16 kvm_vgic_get_vcpu_vpeid(struct kvm_vcpu *vcpu)
 > 260	{
   261		return vcpu->arch.vgic_cpu.vgic_v3.its_vpe.vpe_id;
   262	}
   263	#endif
   264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
