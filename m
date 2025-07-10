Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD4A277C82
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 11:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752148745; cv=none; b=Fsq98CzbWCY2/Tmz9Q6d2yspQmZl6LKl+sU3rc/43ssLWJR62LasLz8wkESJahwJnbKMIBInl1MxNrvB+SwpcB45Mkn3SXTnoATDGbdZXWxh2Iu8PRefpqkQKGpSmx5CEhsB14JH63wWlVI6GuHFx6IbOuA32v5PuOkjN9PaviU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752148745; c=relaxed/simple;
	bh=a+LGaSfOm7UQ65ndM+41ftSzMsJeAg7m167TUN8+wxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfXnYj2a7s4dMFugZD8MPz7fVbZMz6W5GSEFuKNRbh4TM1wiBDv6Y84mfWhsRgVspJvlhGU/qVvYT4jyfxZFYmP1kpLl16KSDfbJr4O9bf8t/vWsO1D4sYD8y0dZlLAD5MWO+JJGAolG4yp3NBRPkVUvMrbPSeLiNqcJLeHpuEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iNIMiwB6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iNIMiwB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752148743; x=1783684743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a+LGaSfOm7UQ65ndM+41ftSzMsJeAg7m167TUN8+wxo=;
  b=iNIMiwB6/e5qmnXAN5ptlQ0VcTyPcm+rM+l5yvo2wk4nUjPj/PXD4LbL
   9g0bB+lfglFxL2Nsauv80675Ko6kYLIEkAOhQ2bjvyZteOPJz4OWaS0rN
   KcQQ2he/15j0y2KU/bp+rMiSCcvXVEnOXo4xoC5K/53SwKC+Q7VBn0jT2
   YlJuhkEeOwDzq7vZY0GTTCwfB7Ch+Op2Qa3MHTV8CA24lSB71cr0+1Wga
   Ja73B/MTFgAmhUAW7HJlhLRXNuNlpWFSBTXErX/zTslZd1SHaLEcm+4zh
   BXIAeIV5tua1a14SNgESvjXORvHIF5702R7aABy6nhtqf51aztjmOhGFO
   Q==;
X-CSE-ConnectionGUID: dIuEMiTNTgOnnBh9tyBJWQ==
X-CSE-MsgGUID: m3Yoca4XS4+PH1XqS7AlCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54278712"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="54278712"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 04:59:02 -0700
X-CSE-ConnectionGUID: 1QYkK1GLTL64gN6tM2X30Q==
X-CSE-MsgGUID: 8N0Hx56NTK6pozwTRK+7pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="160072063"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jul 2025 04:59:00 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZpvW-0004zz-1a;
	Thu, 10 Jul 2025 11:58:58 +0000
Date: Thu, 10 Jul 2025 19:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 10/16] PCI: Add pci_mfd_isolation()
Message-ID: <202507101925.TPzxoCBq-lkp@intel.com>
References: <10-v2-4a9b9c983431+10e2-pcie_switch_groups_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10-v2-4a9b9c983431+10e2-pcie_switch_groups_jgg@nvidia.com>

Hi Jason,

kernel test robot noticed the following build errors:

[auto build test ERROR on e04c78d86a9699d136910cfc0bdcf01087e3267e]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Gunthorpe/PCI-Move-REQ_ACS_FLAGS-into-pci_regs-h-as-PCI_ACS_ISOLATED/20250709-225414
base:   e04c78d86a9699d136910cfc0bdcf01087e3267e
patch link:    https://lore.kernel.org/r/10-v2-4a9b9c983431%2B10e2-pcie_switch_groups_jgg%40nvidia.com
patch subject: [PATCH v2 10/16] PCI: Add pci_mfd_isolation()
config: i386-buildonly-randconfig-001-20250710 (https://download.01.org/0day-ci/archive/20250710/202507101925.TPzxoCBq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507101925.TPzxoCBq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507101925.TPzxoCBq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/ras/ras_event.h:12,
                    from mm/memory-failure.c:65:
>> include/linux/pci.h:2082:6: warning: no previous prototype for 'pci_mfd_isolated' [-Wmissing-prototypes]
    2082 | bool pci_mfd_isolated(struct pci_dev *dev)
         |      ^~~~~~~~~~~~~~~~
--
   ld: arch/x86/hyperv/irqdomain.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/kernel/setup.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/kernel/x86_init.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/kernel/irqinit.o: in function `pci_mfd_isolated':
   arch/x86/kernel/irqinit.c:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/kernel/probe_roms.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/kernel/pci-dma.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/kernel/quirks.o: in function `pci_mfd_isolated':
   arch/x86/kernel/quirks.c:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/kernel/cpu/cacheinfo.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/kernel/cpu/cyrix.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/kernel/cpu/mce/inject.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/kernel/cpu/microcode/amd.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/kernel/acpi/boot.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/kernel/mpparse.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/kernel/apic/io_apic.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/kernel/reboot_fixups_32.o: in function `pci_mfd_isolated':
   arch/x86/kernel/reboot_fixups_32.c:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/kernel/devicetree.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/mm/init_32.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/mm/pat/set_memory.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: arch/x86/platform/scx200/scx200_32.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: kernel/dma/direct.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: mm/memory-failure.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: fs/fuse/virtio_fs.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: lib/iomap.o: in function `pci_mfd_isolated':
>> include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/leds/flash/leds-mt6370-flash.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/leds/flash/leds-as3645a.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/leds/flash/leds-rt4505.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/leds/flash/leds-rt8515.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/leds/flash/leds-sgm3140.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/pci/of.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/video/aperture.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/acpi/osl.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/acpi/reboot.o: in function `pci_mfd_isolated':
   drivers/acpi/reboot.c:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/acpi/bus.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/acpi/glue.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/acpi/acpi_processor.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/acpi/acpi_platform.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/acpi/x86/utils.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/pnp/resource.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/pnp/quirks.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/pnp/pnpacpi/rsparser.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/clk/x86/clk-fch.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/gpu/drm/drm_edid.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/gpu/drm/drm_file.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/gpu/drm/drm_ioctl.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/gpu/drm/arm/display/komeda/komeda_drv.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/scsi/scsi_lib.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/nvme/host/core.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/nvme/host/ioctl.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/nvme/host/sysfs.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/nvme/host/pr.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/nvme/host/multipath.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/nvme/host/zns.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/nvme/host/fabrics.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/nvme/host/fc.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/nvme/target/core.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/nvme/target/configfs.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/nvme/target/passthru.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/nvme/target/loop.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/ata/libata-core.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/ata/libata-eh.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/ata/libata-acpi.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/ata/ahci_ceva.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/ata/libahci.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/ata/libahci_platform.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/ata/ahci_dwc.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/net/ethernet/amd/lance.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/net/ethernet/amd/xgbe/xgbe-dev.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/net/hyperv/netvsc_drv.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/net/net_failover.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/pcmcia/pcmcia_resource.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/pcmcia/cistpl.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here
   ld: drivers/pcmcia/rsrc_nonstatic.o: in function `pci_mfd_isolated':
   include/linux/pci.h:2083: multiple definition of `pci_mfd_isolated'; arch/x86/events/amd/ibs.o:include/linux/pci.h:2083: first defined here


vim +2083 include/linux/pci.h

  2081	
> 2082	bool pci_mfd_isolated(struct pci_dev *dev)
> 2083	{ return false; }
  2084	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
