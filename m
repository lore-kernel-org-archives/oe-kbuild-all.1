Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E75EACD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Aug 2026 01:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363969; cv=none; b=t0KgGl502Xhuv9v4tFNy2j0tf7nl3tligO5ukgkJRD2PeciAZE01sUtApn5fepFSJgCVTJCYxdV0qv7KZvaGuTb9Ia0oXlB0LkKK7PswzpriVwnHWWAauQZwV8D6DyHEnyGke4lKTE54b5WygnrBoeXMByl2JqxccwytE78W75k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363969; c=relaxed/simple;
	bh=dUSJGkOK6NCGm1yBpGdD3V8MMUOgkBi3xRrMdn1ym3Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ilod/nXyYh1E47lYOylzXLXUbAE/IT8Gi6nTrw7Z6ciVffClIQh+Kvq3PJESseUCP56R6e1RIhQaBqJG4aMBHysjCVSrbCltflbm57Mxd/YB20NL9trL792nd74yK19IOSCahoAaVbYUaPoJx3C7FlgzNhMfMzQ7EmkwRxQJUCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O69BZC8Y; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O69BZC8Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787363967; x=1818899967;
  h=date:from:to:cc:subject:message-id;
  bh=dUSJGkOK6NCGm1yBpGdD3V8MMUOgkBi3xRrMdn1ym3Q=;
  b=O69BZC8Ys90v0NHUbf5CAanG2PsWGKCv5yE2lnfdWr89pFmISR/EB/3+
   bJQfo7nl5hKPMcpUZkVeNU8PgePtohl9R1M/LXX2LJGePjRw9hJvyVEpQ
   VX1zeIYJNd7kLImok10Sh9SCUZpJnjW9QAqgEa0ByvaGJ5jH/Yrn+XPmo
   h1BJdNxLTR9ffpLtDIVp0ENTFl3cW8etwnNbGx9xJ7oLEE6Y7HSK0TmQh
   nxy/KcZvMDELCaax9dqIKYnnrF5cDYIDHwW4FExfV39WD2tucP1CNNZSM
   1p7oe+Eg/O/mFORhrztaJ487KnZzETvPEJWwGmXNLJ/kstSafuQvXx73v
   w==;
X-CSE-ConnectionGUID: pFtR/tTmSze5sbRPXzklbQ==
X-CSE-MsgGUID: Nc7FQbX4ScuKWqUjKIl8mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87932446"
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="87932446"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 18:59:26 -0700
X-CSE-ConnectionGUID: VEZuS2K7QCurXDRYJHZfVQ==
X-CSE-MsgGUID: HaKCKjkQRBaGBOwLlZk6Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="265977229"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Aug 2026 18:59:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxb10-00000000qjV-3Ccj;
	Sat, 22 Aug 2026 01:59:22 +0000
Date: Sat, 22 Aug 2026 09:59:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 0/1]
 drivers/pci/pci.c:426:9: warning: indirection of non-volatile null pointer
 will be deleted, not trap
Message-ID: <202608220920.5VpET1DF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   ff926f685d34996e7004a0e23d1c41ddf840c8e4
commit: e2f7a805a3cbfa7a546334d3409745e0b2037524 [0/1] Merge 1c2b4a4c2bcb ("Merge tag 'pci-v7.0-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci") into android-mainline
config: x86_64-randconfig-014-20260822 (https://download.01.org/0day-ci/archive/20260822/202608220920.5VpET1DF-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220920.5VpET1DF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220920.5VpET1DF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/pci.c:16:
   include/linux/iommu.h:1627:17: error: incomplete definition of type 'struct iommu_mm_data'
    1627 |         return iommu_mm->pasid;
         |                ~~~~~~~~^
   include/linux/mm_types.h:1074:8: note: forward declaration of 'struct iommu_mm_data'
    1074 | struct iommu_mm_data;
         |        ^
>> drivers/pci/pci.c:426:9: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
     426 |         return PCI_FIND_NEXT_CAP(pci_bus_read_config, pos, cap, NULL, bus, devfn);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/pci.h:159:5: note: expanded from macro 'PCI_FIND_NEXT_CAP'
     159 |                                 *(u8 *)prev_ptr = __prev_pos;           \
         |                                 ^~~~~~~~~~~~~~~
   drivers/pci/pci.c:426:9: note: consider using __builtin_trap() or qualifying pointer with 'volatile'
   drivers/pci/pci.h:159:5: note: expanded from macro 'PCI_FIND_NEXT_CAP'
     159 |                                 *(u8 *)prev_ptr = __prev_pos;           \
         |                                 ^
   drivers/pci/pci.c:530:9: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
     530 |         return PCI_FIND_NEXT_EXT_CAP(pci_bus_read_config, start, cap,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     531 |                                      NULL, dev->bus, dev->devfn);
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/pci.h:207:5: note: expanded from macro 'PCI_FIND_NEXT_EXT_CAP'
     207 |                                 *(u16 *)prev_ptr = __prev_pos;          \
         |                                 ^~~~~~~~~~~~~~~~
   drivers/pci/pci.c:530:9: note: consider using __builtin_trap() or qualifying pointer with 'volatile'
   drivers/pci/pci.h:207:5: note: expanded from macro 'PCI_FIND_NEXT_EXT_CAP'
     207 |                                 *(u16 *)prev_ptr = __prev_pos;          \
         |                                 ^
   drivers/pci/pci.c:599:8: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
     599 |         pos = PCI_FIND_NEXT_CAP(pci_bus_read_config, pos,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     600 |                                 PCI_CAP_ID_HT, NULL, dev->bus, dev->devfn);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/pci.h:159:5: note: expanded from macro 'PCI_FIND_NEXT_CAP'
     159 |                                 *(u8 *)prev_ptr = __prev_pos;           \
         |                                 ^~~~~~~~~~~~~~~
   drivers/pci/pci.c:599:8: note: consider using __builtin_trap() or qualifying pointer with 'volatile'
   drivers/pci/pci.h:159:5: note: expanded from macro 'PCI_FIND_NEXT_CAP'
     159 |                                 *(u8 *)prev_ptr = __prev_pos;           \
         |                                 ^
   drivers/pci/pci.c:609:9: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
     609 |                 pos = PCI_FIND_NEXT_CAP(pci_bus_read_config,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     610 |                                         pos + PCI_CAP_LIST_NEXT,
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~
     611 |                                         PCI_CAP_ID_HT, NULL, dev->bus,
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     612 |                                         dev->devfn);
         |                                         ~~~~~~~~~~~
   drivers/pci/pci.h:159:5: note: expanded from macro 'PCI_FIND_NEXT_CAP'
     159 |                                 *(u8 *)prev_ptr = __prev_pos;           \
         |                                 ^~~~~~~~~~~~~~~
   drivers/pci/pci.c:609:9: note: consider using __builtin_trap() or qualifying pointer with 'volatile'
   drivers/pci/pci.h:159:5: note: expanded from macro 'PCI_FIND_NEXT_CAP'
     159 |                                 *(u8 *)prev_ptr = __prev_pos;           \
         |                                 ^
   4 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y] && (ARM64 || X86 [=y])
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +426 drivers/pci/pci.c

687d5fe3dc3379 Michael Ellerman 2006-11-22  422  
f646c2a0a6685a Puranjay Mohan   2020-11-29  423  static u8 __pci_find_next_cap(struct pci_bus *bus, unsigned int devfn,
687d5fe3dc3379 Michael Ellerman 2006-11-22  424  			      u8 pos, int cap)
687d5fe3dc3379 Michael Ellerman 2006-11-22  425  {
a2582e05e39adf Qiang Yu         2025-11-09 @426  	return PCI_FIND_NEXT_CAP(pci_bus_read_config, pos, cap, NULL, bus, devfn);
687d5fe3dc3379 Michael Ellerman 2006-11-22  427  }
687d5fe3dc3379 Michael Ellerman 2006-11-22  428  

:::::: The code at line 426 was first introduced by commit
:::::: a2582e05e39adf9ab82a02561cd6f70738540ae0 PCI: Add preceding capability position support in PCI_FIND_NEXT_*_CAP macros

:::::: TO: Qiang Yu <qiang.yu@oss.qualcomm.com>
:::::: CC: Manivannan Sadhasivam <mani@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
