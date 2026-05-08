Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520CA26FD9B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 17:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778259800; cv=none; b=bzgD2UPIgdg/A6xipZhgAE/nqZVRNWltu7FfJepBD27wDKggBivzvBCMMMdSWkEgVWeEAj7u5Y4vDmAFRBCvzU/9jEFdreD7FBoFHk0Mb7OiBdEGK6GjNZxQ3pkRg9pIjeFnAMywXNgV3oNvfF5+2S4GliGzFO0dkWnbvFGJQQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778259800; c=relaxed/simple;
	bh=jV2Z85Gx8PIxINk8EyXNE2sZ6IRlZxUp+y25lh+wLMw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tXwztAOyHFImVjcKJcOuINwiiYzxlq4BvGRP4oE0G+igiMOiK+ECItY1Y8+5D1djFJWTRl+xftT2Nhd48oGiReJA20bXIn9DTG6txd9KzaMU7ZtzfpVTOM+ZmMH9wBq3IFYiKXYo8F3mz2lUWpX2VF5CwI0YK96g208dQJpAQYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8anaEvq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8anaEvq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778259798; x=1809795798;
  h=date:from:to:cc:subject:message-id;
  bh=jV2Z85Gx8PIxINk8EyXNE2sZ6IRlZxUp+y25lh+wLMw=;
  b=D8anaEvqbnsuaa0nKOgUIIDU9Bu/MGOC7KHcit84JOevLvsJJO42pODA
   x44nYA0R+OjGZo4Dg0TV5uv7bjWL3LFMXG8jb4nbPgNrPcJwHXpDCeIdR
   NWWQbUHNXPVsdAHJ/JtgZ9bgkHvAm2cF+5wjNm13za1Zp8pRzRHzBu9ja
   brBn27bK9in0XCHTZmaW99UyIcTQ920QazkQ4Jr1cUhX8BWjSXSNmHg3L
   frPVqs+cVIRggOaEbjbdEAYM66TGuqcGHeYc1cLUQNv+sdP3TaWPAWdLt
   3UTIQlZWMk9RW/QIw/VGwixIdwWe9hWNC5f0yc3z5v3btk2w73TzkI18E
   A==;
X-CSE-ConnectionGUID: pZ0L8zbHQbaZNOZJiPhXVw==
X-CSE-MsgGUID: rqzg9qE1QDa+8oe32beE8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="78375253"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="78375253"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 10:03:18 -0700
X-CSE-ConnectionGUID: MNNGOZLNR0y1zhapJM6x1w==
X-CSE-MsgGUID: HKL+FJaaSmqu8mxUHPNTnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="236937472"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 May 2026 10:03:16 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLObZ-000000000Ij-2sh1;
	Fri, 08 May 2026 17:03:13 +0000
Date: Sat, 09 May 2026 01:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 0/8]
 drivers/pci/pci.c:426:9: warning: indirection of non-volatile null pointer
 will be deleted, not trap
Message-ID: <202605090035.9SokTzZD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   c2ee10323ef996776e88e8588ecacbbad18991f9
commit: e2f7a805a3cbfa7a546334d3409745e0b2037524 [0/8] Merge 1c2b4a4c2bcb ("Merge tag 'pci-v7.0-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci") into android-mainline
config: i386-randconfig-003-20260508 (https://download.01.org/0day-ci/archive/20260509/202605090035.9SokTzZD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090035.9SokTzZD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605090035.9SokTzZD-lkp@intel.com/

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
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y] && (ARM64 || X86 [=y])
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
