Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7DC1D555
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 07:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771573866; cv=none; b=lmqFNkM+nrrBZp74mddRcoVwE3mmU7IT8hZkoXE/oo6BGUh6/g8z7GBn9SAr865rxOtYfpGPck+b5fJsQrjh+s9oIFYKewaTG3RzakUe3dUqnt3YaR3GeW+eJ6TD0qQmPuWdHgE/5VQeHvb5lEprw7sXY4vsJpS19QU4SxzhnDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771573866; c=relaxed/simple;
	bh=xg7qoRXWGDjQ5V4Y24xCaIDKsB06Vg3aSd5oVyo4c0M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n5n+5o9NMNShY7Uot7Y//J3tqJAPxIvl0puqFwucT9GKdVxVpY05Uq+RtLosqVAPWFNickS9G27xvak+5qmkuRg9n40ZQaqtM1Am1/n0yyS4yzfZGohAFIS0JxP2EWTUARUkPJy0JUZoDpMxN0utGm2m7UIE5QLgNCj6+VvNXMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PF8JPfqt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PF8JPfqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771573865; x=1803109865;
  h=date:from:to:cc:subject:message-id;
  bh=xg7qoRXWGDjQ5V4Y24xCaIDKsB06Vg3aSd5oVyo4c0M=;
  b=PF8JPfqtaNv2LbQP1yW9OwREF/Q9RoE7Rn90F6I8+g9H6dsJzrxGMNFl
   giRAqId5gjREVHB7uAL8b4rBxGK6jiAg79Ce3ejOL/vyw1c4wXJy979Ur
   phPewXEcTwvCg5pVBDts63t4CGQYdThnfN5N93F/w3sCb5qjoW1q+Mulq
   c2BN+rK54PJndtEB8HEdbFxf/spjKA4mjUJrhphF8s7Vb3gXjRwK3v6XF
   dYsbQe3D6Jf8F78PRQ/sJBvzY9kdzqSxpLUadvtNDaMfKrRD0QlM4PAdU
   q0AMMY13vjbO2Oe2fc2aPnR8MSCI+ssFl1hRmOQCVc2Cp5Dd+LepEERQf
   w==;
X-CSE-ConnectionGUID: LMoMRyQARk6DADeyIA3slw==
X-CSE-MsgGUID: ImLA+VMBS7aU5yUFkha0UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72650282"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="72650282"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 23:51:04 -0800
X-CSE-ConnectionGUID: 2AR3FBEXTn+B1Tg5k6zFcA==
X-CSE-MsgGUID: GDvuxKciQIWIVevw/6kAbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="219333813"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Feb 2026 23:51:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtLHx-000000013v6-1Z0t;
	Fri, 20 Feb 2026 07:51:01 +0000
Date: Fri, 20 Feb 2026 15:50:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2]
 arch/x86/kvm/../../../virt/kvm/vfio.c:130:undefined reference to
 `vfio_file_iommu_group'
Message-ID: <202602201521.87mIuAz7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   879c70c908047abb1d46fd4ff9192626df8e33d3
commit: e43f03eb172d7e8ecac55bc3f9547c18f436ea82 [0/2] ANDROID: drivers/vfio: Call KVM directly
config: i386-randconfig-051-20260219 (https://download.01.org/0day-ci/archive/20260220/202602201521.87mIuAz7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602201521.87mIuAz7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602201521.87mIuAz7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: virt/kvm/vfio.o: in function `kvm_vfio_file_iommu_group':
>> arch/x86/kvm/../../../virt/kvm/vfio.c:130:(.text+0x24b): undefined reference to `vfio_file_iommu_group'
>> ld: arch/x86/kvm/../../../virt/kvm/vfio.c:130:(.text+0x433): undefined reference to `vfio_file_iommu_group'
   ld: arch/x86/kvm/../../../virt/kvm/vfio.c:130:(.text+0x5c1): undefined reference to `vfio_file_iommu_group'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +130 arch/x86/kvm/../../../virt/kvm/vfio.c

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
