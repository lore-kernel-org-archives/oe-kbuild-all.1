Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F97022301
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 23:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770507962; cv=none; b=CskIA8w4RtxocWq+70EhSkM84PwzJz3zGHFsZF+/NOP9DylaCgeXFJyyVYiwzKadZoXOCnPtbeieIZZbi+HLxbEEB2Iiizti92lEbhvPUklssllApgkL8C5AccfGblW0PB8cWJlkS11UgWvJ1dpKiMlpUeU5BNGFdlpYKJRcJ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770507962; c=relaxed/simple;
	bh=WkArlRgfaTJ68Kq/Y2rnZlS2c7O1QcGPTpxeRJUgoJ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J2Lu5+9A4Fd/aZbI+1s6VNHsnFkb/g6ziHUJV5n7dOQbBeJ1AkfMNn5o82h4P/pY+T8gAh/objh9MJ+nG/yOaBvMtlwH4TzH+YlfByWAPK8GQusonlark95qVss9J9FBbBQAvabrDXb9rdTrLWNQ7G2ihNB8/ZCCVy45vzq4tbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EhFe4t79; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EhFe4t79"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770507962; x=1802043962;
  h=date:from:to:cc:subject:message-id;
  bh=WkArlRgfaTJ68Kq/Y2rnZlS2c7O1QcGPTpxeRJUgoJ0=;
  b=EhFe4t79WkcYJUOJyg1dTL6Dmc4UfBMDisvJvo4PQTIxH645K7MPQ15W
   JnO3q1ZpEOMHyQgbj399Xa6zvr9uHh0Ivs/4KA2ssVJgh0q/CNmygAMnP
   dZMD6yZkVD9GExsOBm5OYSsSas+uLCafoZ2rw6OzsFTvj2Sx3YlIGz917
   3n90fV4PVD1At4xqc1fM98/YjJlcovDnFh5vJqy0vUsLk7D29bsRmHuVs
   o7AiYT8Oxs5NgrXDZQ1lAqTxdmgYQbVntoQHga3/daXW2UkHC2761PKK9
   a9mzeWS+4x3EYNOWFIaMbtL7bi24YmI2wVo6TqacNPfKKHCS93I6sUxnu
   w==;
X-CSE-ConnectionGUID: ZI80pTdcTp6Tm3Hmd7nKzg==
X-CSE-MsgGUID: AVIxRPqXS3i3qFmuUYUT9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="75290119"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="75290119"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 15:46:01 -0800
X-CSE-ConnectionGUID: c9kSY4yJTDqxhiG1OrfNpw==
X-CSE-MsgGUID: edT1ElPfQdWyKmM2gAGv/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="210445951"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Feb 2026 15:45:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vorzx-00000000lx6-0x1Q;
	Sat, 07 Feb 2026 23:45:57 +0000
Date: Sun, 08 Feb 2026 07:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/6]
 arch/x86/kvm/vmx/pkvm/hyp/iommu.c:1204:5: warning: no previous prototype for
 function 'pkvm_iommu_iec_flush'
Message-ID: <202602080728.A8KFycKN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1d370994ba023ff99b9ddab815c6e190e10b3403
commit: 54e452dc2a9ef42f282ce0fff2090d17c494ba04 [0/6] ANDROID: pkvm: x86: Forbid host IQT MMIO access and add IEC flush hypercall
config: x86_64-randconfig-123-20260207 (https://download.01.org/0day-ci/archive/20260208/202602080728.A8KFycKN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602080728.A8KFycKN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602080728.A8KFycKN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/vmx/pkvm/hyp/iommu.c:7:
   arch/x86/kvm/vmx/pkvm/include/pkvm.h:132:30: error: expected identifier or '('
     132 | extern unsigned int pkvm_sym(nr_cpu_ids);
         |                              ^
   include/linux/cpumask.h:28:22: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                      ^
   In file included from arch/x86/kvm/vmx/pkvm/hyp/iommu.c:7:
   arch/x86/kvm/vmx/pkvm/include/pkvm.h:132:30: error: expected ')'
   include/linux/cpumask.h:28:22: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                      ^
   arch/x86/kvm/vmx/pkvm/include/pkvm.h:132:30: note: to match this '('
   include/linux/cpumask.h:28:21: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                     ^
   In file included from arch/x86/kvm/vmx/pkvm/hyp/iommu.c:7:
   arch/x86/kvm/vmx/pkvm/include/pkvm.h:132:30: error: expected ')'
     132 | extern unsigned int pkvm_sym(nr_cpu_ids);
         |                              ^
   include/linux/cpumask.h:28:35: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                                   ^
   include/linux/threads.h:21:18: note: expanded from macro 'NR_CPUS'
      21 | #define NR_CPUS         CONFIG_NR_CPUS
         |                         ^
   ./include/generated/autoconf.h:358:24: note: expanded from macro 'CONFIG_NR_CPUS'
     358 | #define CONFIG_NR_CPUS 1
         |                        ^
   arch/x86/kvm/vmx/pkvm/include/pkvm.h:132:30: note: to match this '('
   include/linux/cpumask.h:28:20: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                    ^
>> arch/x86/kvm/vmx/pkvm/hyp/iommu.c:1204:5: warning: no previous prototype for function 'pkvm_iommu_iec_flush' [-Wmissing-prototypes]
    1204 | int pkvm_iommu_iec_flush(u64 phys, bool global, u64 index, u64 mask)
         |     ^
   arch/x86/kvm/vmx/pkvm/hyp/iommu.c:1204:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1204 | int pkvm_iommu_iec_flush(u64 phys, bool global, u64 index, u64 mask)
         | ^
         | static 
   1 warning and 3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/pkvm_iommu_iec_flush +1204 arch/x86/kvm/vmx/pkvm/hyp/iommu.c

  1203	
> 1204	int pkvm_iommu_iec_flush(u64 phys, bool global, u64 index, u64 mask)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
