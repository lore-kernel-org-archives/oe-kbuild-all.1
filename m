Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799C81DE4C2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 16:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756311649; cv=none; b=XWG+dcPFdRE1Q+OVbIK10nzcVf2im5EaIxOMX6146Qz+E0ok7yu7TB9AcsOYY6eUfbBnRJoA+OO4uIKiQZBJoa/j0wOX6E0XvZA9DFBFCoKojLznqdwk4iqvVnWZeTCc66HSe6yRvZkjtyHHmEPXwps5msQoI+hvnnDiz4NJnBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756311649; c=relaxed/simple;
	bh=5TTqTvLli8TOyr4f+Lw3EZoOX3an2tuH8ZXOA5lHikY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HHazeFqzMAqEdVH6Wc/JpAcL5EPd15gjhYbuDYrENbVTG4Krldkvuzw/VTnvGeii7ztDlK7/TNcgZ+KxpII+rIHqotaGpfX5Ma7y2sxkvNJOJzikkXEL3OD1RM4i3K5WHO3TthaIgpaEiqkMnUL+RWaI2z9riEwOLo1Mp+6jURI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvvfPaQo; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvvfPaQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756311648; x=1787847648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5TTqTvLli8TOyr4f+Lw3EZoOX3an2tuH8ZXOA5lHikY=;
  b=TvvfPaQo72tg5SKjSNQ3XavKJatnqJcPzxKKHJyTRprG+qOZbJ7vguBe
   6SXTlUtXGKsy0ZLSS/LT48cTF/oOGykOafR51sCwg2fg1O8mI1uK2rFeT
   dngwuZbZcad5hq/CdBteitcSIuMaEraiIMbNXHx3On6zAyJxtR7RDE2+x
   5ijgp5lZyLAOsYAoiJArQvffoHvpeRpsRJWSJWzhsZUEHnk8ddyHZzvqi
   K7YbUCd6FI4aGvK2u9vhsiWkCOuGota+2FKj7tmG8bR2dNWv1QpVNHN2Y
   pbvMdC6y3q2v7DOEH6do90QJtBu03xP/iqYfhfZ5ikp3IqDVa6B2j6rtI
   g==;
X-CSE-ConnectionGUID: XupNNiZYRA6vKNdXDPdqEQ==
X-CSE-MsgGUID: QNx/cG/CSIm+uXrxGFjDBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58634107"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58634107"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 09:20:47 -0700
X-CSE-ConnectionGUID: 8d4jD5PGRseaHrqkjCeNAA==
X-CSE-MsgGUID: e5Xkx6CkTfq7jBFvlFyT1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="207042336"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 27 Aug 2025 09:20:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urIs8-000T3z-0v;
	Wed, 27 Aug 2025 16:19:47 +0000
Date: Thu, 28 Aug 2025 00:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 24/24]
 arch/arm64/kvm/../../../virt/kvm/vfio.c:400:45: sparse: sparse: incorrect
 type in argument 2 (different address spaces)
Message-ID: <202508280010.L6xE5UXP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   e618ac331b0929e7221e5aadc18783b4b8bc5e2e
commit: b0fccd926d2ee040ec590ca6439db237edf5c247 [24/24] ANDROID: kvm/vfio: pviommu: Add set config IOCTL
config: arm64-randconfig-r122-20250827 (https://download.01.org/0day-ci/archive/20250828/202508280010.L6xE5UXP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce: (https://download.01.org/0day-ci/archive/20250828/202508280010.L6xE5UXP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508280010.L6xE5UXP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/../../../virt/kvm/vfio.c:400:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   arch/arm64/kvm/../../../virt/kvm/vfio.c:400:45: sparse:     expected void const [noderef] __user *from
   arch/arm64/kvm/../../../virt/kvm/vfio.c:400:45: sparse:     got void *
>> arch/arm64/kvm/../../../virt/kvm/vfio.c:404:69: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void const [noderef] __user *src @@     got void * @@
   arch/arm64/kvm/../../../virt/kvm/vfio.c:404:69: sparse:     expected void const [noderef] __user *src
   arch/arm64/kvm/../../../virt/kvm/vfio.c:404:69: sparse:     got void *

vim +400 arch/arm64/kvm/../../../virt/kvm/vfio.c

   391	
   392	static long pviommufd_ioctl(struct file *filp, unsigned int ioctl,
   393				    unsigned long arg)
   394	{
   395		struct kvm_vfio_iommu_config config;
   396		__u32 usize;
   397	
   398		switch (ioctl) {
   399		case KVM_PVIOMMU_SET_CONFIG:
 > 400			if (copy_from_user(&usize, (void *)arg, sizeof(usize)))
   401				return -EFAULT;
   402			if (usize < offsetofend(struct kvm_vfio_iommu_config, __reserved))
   403				return -EINVAL;
 > 404			if (copy_struct_from_user(&config, sizeof(config), (void *)arg, usize))
   405				return -EFAULT;
   406	
   407			return kvm_vfio_pviommu_set_config(filp, &config);
   408		default:
   409			return -ENXIO;
   410		}
   411		return 0;
   412	}
   413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
