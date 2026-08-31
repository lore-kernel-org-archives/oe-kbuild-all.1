Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29954CCDD0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 23:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219764; cv=none; b=BOTPepYyPmhtEJtGPbZBOX48PoOLPILp/jkejPkWj14DJBBpE8u6/MZZfPBPGMlu2Ypp3GjDFEt3U4I0RPQ57D3aZfIFIy6yTJG9pLXzr22nAO2YyQcPHlVQ7iCUm9FmkcPtpZKDRff3HHGFyRGMi1SLDNzU3NTJOaqfYxk6tGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219764; c=relaxed/simple;
	bh=q4BeS/kfRdaOO5ebKgmI68NWumbkvd64vG43GPURB7E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FnVbPmr14aeAhIGS8KVHkYPIamEfhHSvJA4kuJwyDjfO2T8PiSrVeRAOdfJhg0lLqer47+XKMeG0fkJHEaEbvbHUupke0b7kotiFzNt9mnv2jUabqptUZUeRCl5YgsYmDX2psbHyWkerOHBD7bVZJ9eMuGywlA/LJ4i8DAdOm80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxjk93op; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxjk93op"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788219763; x=1819755763;
  h=date:from:to:cc:subject:message-id;
  bh=q4BeS/kfRdaOO5ebKgmI68NWumbkvd64vG43GPURB7E=;
  b=hxjk93opjStGbJRUoFqTytOKk/6pqhEzsrFjIWg2fr6eLF0X5MxItfjK
   nV2K1gPTCFAy7sq6bQlVNBecM/JB9M2aOvRX4oTg3/OL678dI/B4QxOYb
   Rb9rRkqVJ2l9/drxMnb57NO7LiPU5XRFi4VfLFifmLe0ILo2RTTvqi7Zd
   r3pCJtVX0mDN7l2sZpRdJ0bv6VIgdwFZIqNKW9A4WvLbeHHWhHMsOYSk0
   BG/9+5e7gy8SutQnq6fUPDzSnrPAthZNjzvcRkREpYTNOOev/KfRXQpgN
   Oe4OpUSBoenJjwS3QlH/v6wKBxUaaWwsineyNWy/XDGCKVQnOvEZao816
   g==;
X-CSE-ConnectionGUID: akMbw6B8QFCnDPTl1GXFgw==
X-CSE-MsgGUID: gfsb02l6QSipbm6xjORA+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88512928"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="88512928"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 16:42:42 -0700
X-CSE-ConnectionGUID: gVKH7hH2SQGkD5AmAMHwRA==
X-CSE-MsgGUID: qfZMdIWkTlSd9mNI3c455w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="267614295"
Received: from lkp-server01.sh.intel.com (HELO 793b8a0addc2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Aug 2026 16:42:39 -0700
Received: from kbuild by 793b8a0addc2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1BeA-0000000006J-326a;
	Mon, 31 Aug 2026 23:42:38 +0000
Date: Tue, 01 Sep 2026 07:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3]
 arch/arm64/kvm/../../../virt/kvm/vfio.c:130:undefined reference to
 `vfio_file_iommu_group'
Message-ID: <202609010710.aoWhYncr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   96b3287eace89e145c28c3461ed3d8c8ea0b2baa
commit: e43f03eb172d7e8ecac55bc3f9547c18f436ea82 [3/3] ANDROID: drivers/vfio: Call KVM directly
config: arm64-randconfig-004-20260829 (https://download.01.org/0day-ci/archive/20260901/202609010710.aoWhYncr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260901/202609010710.aoWhYncr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609010710.aoWhYncr-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: virt/kvm/vfio.o: in function `kvm_vfio_reclaim_file':
>> arch/arm64/kvm/../../../virt/kvm/vfio.c:130:(.text+0x21c): undefined reference to `vfio_file_iommu_group'
   aarch64-linux-ld: virt/kvm/vfio.o: in function `kvm_vfio_file_add':
   arch/arm64/kvm/../../../virt/kvm/vfio.c:130:(.text+0xc74): undefined reference to `vfio_file_iommu_group'


vim +130 arch/arm64/kvm/../../../virt/kvm/vfio.c

   125	
   126	static struct iommu_group *kvm_vfio_file_iommu_group(struct file *file)
   127	{
   128		/* See kvm_vfio_file_set_kvm() */
   129	#if IS_BUILTIN(CONFIG_VFIO)
 > 130		return vfio_file_iommu_group(file);
   131	#else
   132		struct iommu_group *(*fn)(struct file *file);
   133		struct iommu_group *ret;
   134	
   135		fn = symbol_get(vfio_file_iommu_group);
   136		if (!fn)
   137			return NULL;
   138	
   139		ret = fn(file);
   140	
   141		symbol_put(vfio_file_iommu_group);
   142	
   143		return ret;
   144	#endif
   145	}
   146	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
