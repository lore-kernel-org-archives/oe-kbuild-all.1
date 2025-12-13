Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732C627381E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 08:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765613907; cv=none; b=dn7FjbtFOFcDDk9mlVPQ2QIa5J+yNF6/YX3W98m/cEhA0+AT8T+jvi6L1Ok94g8BdKKKQNHttCUWkmcQNQyEJomMYMOVMSnKKpPeNO43dMkeLYTo+8uNYj6FCsRYqE5LKT/xG9N8GrjJhOGIeI6rzHA3awT5EnoNFdn47aA/R1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765613907; c=relaxed/simple;
	bh=XFsJPbZsKlIvpnOWqG2/lZB+Ir/0fWd8A0ut5vOkw4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jvTB0nJ6xhh7DwIc0jaxU+V1Qs8HbFsnSYHGEMWjbdZlRgGXfBei0TOc0P+x4Uw0SWQipRN47KcnEkG7jqT1FKnWrS/AKUrBsuxQumqmyZ2+rGL0ryxkmBwXvCSw26y9xbPCED61v7m5kU48KnUkgSecYRF4P6Wyq1AtiDQld/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/yt0dCk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/yt0dCk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765613906; x=1797149906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XFsJPbZsKlIvpnOWqG2/lZB+Ir/0fWd8A0ut5vOkw4g=;
  b=E/yt0dCk0LHun1xBNzPwhVavN1nDZGqTcrZuVVdXxtql2A7J3agNDrQa
   ES0dPBHYtjf5fDutEaldv7Ta+N2WYGk/YHSkuyIGOFRcqRAyzuXizdkTQ
   Il8JxDEW5otkWuoMode5puBbv1tVyeRgykdSYIIluv+WknyI9K1o2im+/
   rscMoV2z5+vy3pPBMZQ3nLeQTBxOfKK0W/wvW0g5krWO2W1bOhxzErVYk
   Ag7B0RfpEOYIJLOtdgYXyjfSL79AWkkCJtLy8OcMMYeRj4gWLfNXqu5od
   LYFumxhsAqgvI6A8Uev2P3kikUhoGphR8Kz8rOTE3OJzAccW9J/R+45Ef
   Q==;
X-CSE-ConnectionGUID: McdQ6UJuQkS3HHbPe2hSOg==
X-CSE-MsgGUID: vm0zBZlDSqWX+0wUxgNs3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="90255755"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="90255755"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 00:18:18 -0800
X-CSE-ConnectionGUID: zw9AOj3SRaKxdFcPnY/aQA==
X-CSE-MsgGUID: JPEfeXgNSS+LDqBvk3zEwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="202201995"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Dec 2025 00:18:16 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUKpS-000000007IO-10k6;
	Sat, 13 Dec 2025 08:18:14 +0000
Date: Sat, 13 Dec 2025 16:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: drivers/dma/pch_dma.c:872:34: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202512131636.FoMf8ZrT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tiwei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   7 months ago
config: um-randconfig-r121-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131636.FoMf8ZrT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131636.FoMf8ZrT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131636.FoMf8ZrT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma/pch_dma.c:839:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct pch_dma_regs *regs @@     got void [noderef] __iomem *membase @@
   drivers/dma/pch_dma.c:839:14: sparse:     expected struct pch_dma_regs *regs
   drivers/dma/pch_dma.c:839:14: sparse:     got void [noderef] __iomem *membase
>> drivers/dma/pch_dma.c:872:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *membase @@     got struct pch_dma_desc_regs * @@
   drivers/dma/pch_dma.c:872:34: sparse:     expected void [noderef] __iomem *membase
   drivers/dma/pch_dma.c:872:34: sparse:     got struct pch_dma_desc_regs *
--
   drivers/dma/hisi_dma.c:744:21: sparse: sparse: cast to restricted __le16
>> drivers/dma/hisi_dma.c:744:21: sparse: sparse: restricted __le16 degrades to integer
>> drivers/dma/hisi_dma.c:744:21: sparse: sparse: restricted __le16 degrades to integer
--
>> drivers/iommu/exynos-iommu.c:887:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/iommu/exynos-iommu.c:887:14: sparse:     expected unsigned int [usertype]
   drivers/iommu/exynos-iommu.c:887:14: sparse:     got restricted __le32 [usertype]
>> drivers/iommu/exynos-iommu.c:887:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/iommu/exynos-iommu.c:887:14: sparse:     expected unsigned int [usertype]
   drivers/iommu/exynos-iommu.c:887:14: sparse:     got restricted __le32 [usertype]
>> drivers/iommu/exynos-iommu.c:887:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/iommu/exynos-iommu.c:887:14: sparse:     expected unsigned int [usertype]
   drivers/iommu/exynos-iommu.c:887:14: sparse:     got restricted __le32 [usertype]
>> drivers/iommu/exynos-iommu.c:887:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/iommu/exynos-iommu.c:887:14: sparse:     expected unsigned int [usertype]
   drivers/iommu/exynos-iommu.c:887:14: sparse:     got restricted __le32 [usertype]
>> drivers/iommu/exynos-iommu.c:887:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/iommu/exynos-iommu.c:887:14: sparse:     expected unsigned int [usertype]
   drivers/iommu/exynos-iommu.c:887:14: sparse:     got restricted __le32 [usertype]
--
>> drivers/watchdog/at91rm9200_wdt.c:217:27: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected long ( *write )( ... ) @@     got long ( * )( ... ) @@
   drivers/watchdog/at91rm9200_wdt.c:217:27: sparse:     expected long ( *write )( ... )
   drivers/watchdog/at91rm9200_wdt.c:217:27: sparse:     got long ( * )( ... )
   drivers/watchdog/at91rm9200_wdt.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/watchdog/at91rm9200_wdt.c:162:25: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/watchdog/at91rm9200_wdt.c:162:25: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/watchdog/at91rm9200_wdt.c:162:25: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/watchdog/at91rm9200_wdt.c:162:25: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/watchdog/at91rm9200_wdt.c:162:25: sparse: signed value source
--
   drivers/gpu/drm/xe/xe_oa.c:2370:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [usertype] *ptr @@     got void [noderef] __user * @@
   drivers/gpu/drm/xe/xe_oa.c:2370:25: sparse:     expected unsigned long long [usertype] *ptr
   drivers/gpu/drm/xe/xe_oa.c:2370:25: sparse:     got void [noderef] __user *
>> drivers/gpu/drm/xe/xe_oa.c:2383:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __user *__p @@     got unsigned long long [usertype] *ptr @@
   drivers/gpu/drm/xe/xe_oa.c:2383:15: sparse:     expected void const [noderef] __user *__p
   drivers/gpu/drm/xe/xe_oa.c:2383:15: sparse:     got unsigned long long [usertype] *ptr
   drivers/gpu/drm/xe/xe_oa.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/gpu/drm/xe/xe_oa.c:325:24: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/gpu/drm/xe/xe_oa.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   include/linux/err.h:41:25: sparse: signed value source
   drivers/gpu/drm/xe/xe_oa.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/gpu/drm/xe/xe_oa.c:2208:23: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/gpu/drm/xe/xe_oa.c:2370:25: sparse: signed value source
--
>> drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:97:22: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem *map @@
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:97:22: sparse:     expected void *
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:97:22: sparse:     got void [noderef] __iomem *map
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:155:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *map @@     got void * @@
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:155:21: sparse:     expected void [noderef] __iomem *map
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:155:21: sparse:     got void *
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:157:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:157:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *map @@     got unsigned char [usertype] * @@
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:157:30: sparse:     expected void [noderef] __iomem *map
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:157:30: sparse:     got unsigned char [usertype] *
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:162:22: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem *map @@
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:162:22: sparse:     expected void *
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:162:22: sparse:     got void [noderef] __iomem *map
--
   drivers/gpu/drm/nouveau/nouveau_gem.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/nouveau_gem.c:881:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_gem.c:882:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_gem.c:914:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_gem.c:915:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_gem.c:917:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_gem.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/gpu/drm/nouveau/nouveau_gem.c:947:48: sparse: signed value source
--
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/corec37d.c:44:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/corec37d.c:44:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:61:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:61:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:69:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:69:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:74:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:74:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:137:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:137:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:140:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:140:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:140:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:149:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:149:17: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/headc57d.c:39:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/headc57d.c:39:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:68:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:68:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:89:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:89:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:106:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:106:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:229:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:229:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:230:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:230:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:232:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:232:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:235:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:235:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:239:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:239:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nv84_fence.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/nv84_fence.c:41:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:41:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:64:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:64:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:66:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:66:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:66:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:66:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:66:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nv84_fence.c:88:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct nouveau_channel *chan @@     got struct nouveau_channel [noderef] __rcu *channel @@
   drivers/gpu/drm/nouveau/nv84_fence.c:88:45: sparse:     expected struct nouveau_channel *chan
   drivers/gpu/drm/nouveau/nv84_fence.c:88:45: sparse:     got struct nouveau_channel [noderef] __rcu *channel
--
>> drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *kptr @@
   drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse:     got void *kptr
   drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *kptr @@
   drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51: sparse:     got void *kptr
--
>> drivers/gpu/drm/loongson/lsdc_drv.c:235:28: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct lsdc_device * @@     got void [noderef] __iomem *reg_base @@
   drivers/gpu/drm/loongson/lsdc_drv.c:235:28: sparse:     expected struct lsdc_device *
   drivers/gpu/drm/loongson/lsdc_drv.c:235:28: sparse:     got void [noderef] __iomem *reg_base

vim +872 drivers/dma/pch_dma.c

0c42bd0e425e9c Yong Wang                2010-07-30  798  
463a1f8b3ceebe Bill Pemberton           2012-11-19  799  static int pch_dma_probe(struct pci_dev *pdev,
0c42bd0e425e9c Yong Wang                2010-07-30  800  				   const struct pci_device_id *id)
0c42bd0e425e9c Yong Wang                2010-07-30  801  {
0c42bd0e425e9c Yong Wang                2010-07-30  802  	struct pch_dma *pd;
0c42bd0e425e9c Yong Wang                2010-07-30  803  	struct pch_dma_regs *regs;
0c42bd0e425e9c Yong Wang                2010-07-30  804  	unsigned int nr_channels;
0c42bd0e425e9c Yong Wang                2010-07-30  805  	int err;
0c42bd0e425e9c Yong Wang                2010-07-30  806  	int i;
0c42bd0e425e9c Yong Wang                2010-07-30  807  
0c42bd0e425e9c Yong Wang                2010-07-30  808  	nr_channels = id->driver_data;
01631243d712d4 Tomoya MORINAGA          2011-10-12  809  	pd = kzalloc(sizeof(*pd), GFP_KERNEL);
0c42bd0e425e9c Yong Wang                2010-07-30  810  	if (!pd)
0c42bd0e425e9c Yong Wang                2010-07-30  811  		return -ENOMEM;
0c42bd0e425e9c Yong Wang                2010-07-30  812  
0c42bd0e425e9c Yong Wang                2010-07-30  813  	pci_set_drvdata(pdev, pd);
0c42bd0e425e9c Yong Wang                2010-07-30  814  
0c42bd0e425e9c Yong Wang                2010-07-30  815  	err = pci_enable_device(pdev);
0c42bd0e425e9c Yong Wang                2010-07-30  816  	if (err) {
0c42bd0e425e9c Yong Wang                2010-07-30  817  		dev_err(&pdev->dev, "Cannot enable PCI device\n");
0c42bd0e425e9c Yong Wang                2010-07-30  818  		goto err_free_mem;
0c42bd0e425e9c Yong Wang                2010-07-30  819  	}
0c42bd0e425e9c Yong Wang                2010-07-30  820  
0c42bd0e425e9c Yong Wang                2010-07-30  821  	if (!(pci_resource_flags(pdev, 1) & IORESOURCE_MEM)) {
0c42bd0e425e9c Yong Wang                2010-07-30  822  		dev_err(&pdev->dev, "Cannot find proper base address\n");
27abb2ffb07a70 Wei Yongjun              2013-07-17  823  		err = -ENODEV;
0c42bd0e425e9c Yong Wang                2010-07-30  824  		goto err_disable_pdev;
0c42bd0e425e9c Yong Wang                2010-07-30  825  	}
0c42bd0e425e9c Yong Wang                2010-07-30  826  
0c42bd0e425e9c Yong Wang                2010-07-30  827  	err = pci_request_regions(pdev, DRV_NAME);
0c42bd0e425e9c Yong Wang                2010-07-30  828  	if (err) {
0c42bd0e425e9c Yong Wang                2010-07-30  829  		dev_err(&pdev->dev, "Cannot obtain PCI resources\n");
0c42bd0e425e9c Yong Wang                2010-07-30  830  		goto err_disable_pdev;
0c42bd0e425e9c Yong Wang                2010-07-30  831  	}
0c42bd0e425e9c Yong Wang                2010-07-30  832  
64aa8f4b6df107 Christophe JAILLET       2022-01-06  833  	err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
0c42bd0e425e9c Yong Wang                2010-07-30  834  	if (err) {
0c42bd0e425e9c Yong Wang                2010-07-30  835  		dev_err(&pdev->dev, "Cannot set proper DMA config\n");
0c42bd0e425e9c Yong Wang                2010-07-30  836  		goto err_free_res;
0c42bd0e425e9c Yong Wang                2010-07-30  837  	}
0c42bd0e425e9c Yong Wang                2010-07-30  838  
0c42bd0e425e9c Yong Wang                2010-07-30  839  	regs = pd->membase = pci_iomap(pdev, 1, 0);
0c42bd0e425e9c Yong Wang                2010-07-30  840  	if (!pd->membase) {
0c42bd0e425e9c Yong Wang                2010-07-30  841  		dev_err(&pdev->dev, "Cannot map MMIO registers\n");
0c42bd0e425e9c Yong Wang                2010-07-30  842  		err = -ENOMEM;
0c42bd0e425e9c Yong Wang                2010-07-30  843  		goto err_free_res;
0c42bd0e425e9c Yong Wang                2010-07-30  844  	}
0c42bd0e425e9c Yong Wang                2010-07-30  845  
0c42bd0e425e9c Yong Wang                2010-07-30  846  	pci_set_master(pdev);
2e45676a4d33af Madhuparna Bhowmik       2020-04-16  847  	pd->dma.dev = &pdev->dev;
0c42bd0e425e9c Yong Wang                2010-07-30  848  
0c42bd0e425e9c Yong Wang                2010-07-30  849  	err = request_irq(pdev->irq, pd_irq, IRQF_SHARED, DRV_NAME, pd);
0c42bd0e425e9c Yong Wang                2010-07-30  850  	if (err) {
0c42bd0e425e9c Yong Wang                2010-07-30  851  		dev_err(&pdev->dev, "Failed to request IRQ\n");
0c42bd0e425e9c Yong Wang                2010-07-30  852  		goto err_iounmap;
0c42bd0e425e9c Yong Wang                2010-07-30  853  	}
0c42bd0e425e9c Yong Wang                2010-07-30  854  
10c191a11c79bb Romain Perier            2017-10-23  855  	pd->pool = dma_pool_create("pch_dma_desc_pool", &pdev->dev,
0c42bd0e425e9c Yong Wang                2010-07-30  856  				   sizeof(struct pch_dma_desc), 4, 0);
0c42bd0e425e9c Yong Wang                2010-07-30  857  	if (!pd->pool) {
0c42bd0e425e9c Yong Wang                2010-07-30  858  		dev_err(&pdev->dev, "Failed to alloc DMA descriptors\n");
0c42bd0e425e9c Yong Wang                2010-07-30  859  		err = -ENOMEM;
0c42bd0e425e9c Yong Wang                2010-07-30  860  		goto err_free_irq;
0c42bd0e425e9c Yong Wang                2010-07-30  861  	}
0c42bd0e425e9c Yong Wang                2010-07-30  862  
0c42bd0e425e9c Yong Wang                2010-07-30  863  
0c42bd0e425e9c Yong Wang                2010-07-30  864  	INIT_LIST_HEAD(&pd->dma.channels);
0c42bd0e425e9c Yong Wang                2010-07-30  865  
0c42bd0e425e9c Yong Wang                2010-07-30  866  	for (i = 0; i < nr_channels; i++) {
0c42bd0e425e9c Yong Wang                2010-07-30  867  		struct pch_dma_chan *pd_chan = &pd->channels[i];
0c42bd0e425e9c Yong Wang                2010-07-30  868  
0c42bd0e425e9c Yong Wang                2010-07-30  869  		pd_chan->chan.device = &pd->dma;
d3ee98cdcd6198 Russell King - ARM Linux 2012-03-06  870  		dma_cookie_init(&pd_chan->chan);
0c42bd0e425e9c Yong Wang                2010-07-30  871  
0c42bd0e425e9c Yong Wang                2010-07-30 @872  		pd_chan->membase = &regs->desc[i];
0c42bd0e425e9c Yong Wang                2010-07-30  873  
0c42bd0e425e9c Yong Wang                2010-07-30  874  		spin_lock_init(&pd_chan->lock);
0c42bd0e425e9c Yong Wang                2010-07-30  875  
0c42bd0e425e9c Yong Wang                2010-07-30  876  		INIT_LIST_HEAD(&pd_chan->active_list);
0c42bd0e425e9c Yong Wang                2010-07-30  877  		INIT_LIST_HEAD(&pd_chan->queue);
0c42bd0e425e9c Yong Wang                2010-07-30  878  		INIT_LIST_HEAD(&pd_chan->free_list);
0c42bd0e425e9c Yong Wang                2010-07-30  879  
88ff5093ca30b7 Allen Pais               2020-08-31  880  		tasklet_setup(&pd_chan->tasklet, pdc_tasklet);
0c42bd0e425e9c Yong Wang                2010-07-30  881  		list_add_tail(&pd_chan->chan.device_node, &pd->dma.channels);
0c42bd0e425e9c Yong Wang                2010-07-30  882  	}
0c42bd0e425e9c Yong Wang                2010-07-30  883  
0c42bd0e425e9c Yong Wang                2010-07-30  884  	dma_cap_zero(pd->dma.cap_mask);
0c42bd0e425e9c Yong Wang                2010-07-30  885  	dma_cap_set(DMA_PRIVATE, pd->dma.cap_mask);
0c42bd0e425e9c Yong Wang                2010-07-30  886  	dma_cap_set(DMA_SLAVE, pd->dma.cap_mask);
0c42bd0e425e9c Yong Wang                2010-07-30  887  
0c42bd0e425e9c Yong Wang                2010-07-30  888  	pd->dma.device_alloc_chan_resources = pd_alloc_chan_resources;
0c42bd0e425e9c Yong Wang                2010-07-30  889  	pd->dma.device_free_chan_resources = pd_free_chan_resources;
0c42bd0e425e9c Yong Wang                2010-07-30  890  	pd->dma.device_tx_status = pd_tx_status;
0c42bd0e425e9c Yong Wang                2010-07-30  891  	pd->dma.device_issue_pending = pd_issue_pending;
0c42bd0e425e9c Yong Wang                2010-07-30  892  	pd->dma.device_prep_slave_sg = pd_prep_slave_sg;
c91781b44e2bf4 Maxime Ripard            2014-11-17  893  	pd->dma.device_terminate_all = pd_device_terminate_all;
0c42bd0e425e9c Yong Wang                2010-07-30  894  
0c42bd0e425e9c Yong Wang                2010-07-30  895  	err = dma_async_device_register(&pd->dma);
0c42bd0e425e9c Yong Wang                2010-07-30  896  	if (err) {
0c42bd0e425e9c Yong Wang                2010-07-30  897  		dev_err(&pdev->dev, "Failed to register DMA device\n");
0c42bd0e425e9c Yong Wang                2010-07-30  898  		goto err_free_pool;
0c42bd0e425e9c Yong Wang                2010-07-30  899  	}
0c42bd0e425e9c Yong Wang                2010-07-30  900  
0c42bd0e425e9c Yong Wang                2010-07-30  901  	return 0;
0c42bd0e425e9c Yong Wang                2010-07-30  902  
0c42bd0e425e9c Yong Wang                2010-07-30  903  err_free_pool:
10c191a11c79bb Romain Perier            2017-10-23  904  	dma_pool_destroy(pd->pool);
0c42bd0e425e9c Yong Wang                2010-07-30  905  err_free_irq:
0c42bd0e425e9c Yong Wang                2010-07-30  906  	free_irq(pdev->irq, pd);
0c42bd0e425e9c Yong Wang                2010-07-30  907  err_iounmap:
0c42bd0e425e9c Yong Wang                2010-07-30  908  	pci_iounmap(pdev, pd->membase);
0c42bd0e425e9c Yong Wang                2010-07-30  909  err_free_res:
0c42bd0e425e9c Yong Wang                2010-07-30  910  	pci_release_regions(pdev);
0c42bd0e425e9c Yong Wang                2010-07-30  911  err_disable_pdev:
0c42bd0e425e9c Yong Wang                2010-07-30  912  	pci_disable_device(pdev);
0c42bd0e425e9c Yong Wang                2010-07-30  913  err_free_mem:
12d7b7a23694b4 Alexey Khoroshilov       2015-04-11  914  	kfree(pd);
0c42bd0e425e9c Yong Wang                2010-07-30  915  	return err;
0c42bd0e425e9c Yong Wang                2010-07-30  916  }
0c42bd0e425e9c Yong Wang                2010-07-30  917  

:::::: The code at line 872 was first introduced by commit
:::::: 0c42bd0e425e9c8ddb7019fc446f7d915e36c5f6 dmaengine: Driver for Topcliff PCH DMA controller

:::::: TO: Yong Wang <yong.y.wang@linux.intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
