Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE112F4326
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 11:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749728531; cv=none; b=X0Tb48nyZSo23g6K6meVcGnPOLtWMsJ1q6KqDekiLq5pZm/O2vY/wvISTwYX4hhJ24Bjt+QiUYIRBWrc4C8VgPpgLhPrKVINIoFG53uDNwU/b7ZEr0Fpych3MRlZ9TXJyBEO2I5i3Nw72OxIfY/fkUttOpZvwfnLDObR99xSOC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749728531; c=relaxed/simple;
	bh=k89W1BgQnwBkOx8rrLMOqRnd9hchov1zIq8bV1MLnzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gan6eQbMOsyH0RTB2owFgeflVZaHP6IgG1CQLu//M4LH15s1Tll5U6rqP3tvh+QTI0Sw1QkvsxYyBYUcZeFM4sT29xUJgUK1cpO+3JCEmVo1zJfYbEXpOeA+gJ70+4aDSfba2OdW8UAONvsoRHOF6CWkKaRKvgI313jaR4hsvis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gaCWeLAs; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gaCWeLAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749728528; x=1781264528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k89W1BgQnwBkOx8rrLMOqRnd9hchov1zIq8bV1MLnzk=;
  b=gaCWeLAsry2QxiCMDLU7MJ3XyBoJ9btNQ1Gsmv0oruBLRzRqAoxvNWE5
   LgopIIvlHJNHsTj5v7GIClRZgGrpFHad2wACvAZDuf33VOktnQsQ+Ulye
   DdFD4S3Ma/UDjlk2DViC0rfTJj53mlSjOsVKNMvTdrplO1XIen28aqg7y
   jPHENeG0leNUHO34kwpXcictckyd0o9YZJv40HFzhnHHotWW3JfrRGt8Z
   w9em49aFX+BOt+pnwBTw7kdvs2tdLC872WhXDmV6bWb3HmBlzSN56g9VD
   DViQeCk8cKPkJRgqdHw4W7fGJmSvHhe/G9XGF2RfBUEiJYgIyJw7+LzLp
   w==;
X-CSE-ConnectionGUID: nDQOWO2WTuKPqqxrELKcAQ==
X-CSE-MsgGUID: pFkXr8F4TDm7Q35fYN1Ohw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69471584"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="69471584"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 04:42:07 -0700
X-CSE-ConnectionGUID: /gKhHxRHQfm0a6NqV3F6Ig==
X-CSE-MsgGUID: Cne1UDXRTx6w9M/4T3ojuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="147403759"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jun 2025 04:42:05 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPgJm-000BTW-15;
	Thu, 12 Jun 2025 11:42:02 +0000
Date: Thu, 12 Jun 2025 19:41:16 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v3 56/62] arch/riscv/kernel/hw_breakpoint.c:
 warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
Message-ID: <202506121945.xDkyr1Mq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v3
head:   734e8651f598d3b6b6f4bc2493a47993a03ac695
commit: aff61774c9e2d4065e31290db5c04e3f190eac33 [56/62] riscv: Introduce support for hardware break/watchpoints
config: i386-buildonly-randconfig-002-20250612 (https://download.01.org/0day-ci/archive/20250612/202506121945.xDkyr1Mq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506121945.xDkyr1Mq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506121945.xDkyr1Mq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/mips/ralink/irq-gic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/ralink/irq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/ralink/prom.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/nios2/lib/delay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/openrisc/kernel/smp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/openrisc/mm/cache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/kernel/cache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/kernel/firmware.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/kernel/parisc_ksyms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/kernel/pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/kernel/process.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/kernel/processor.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/lib/checksum.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/lib/delay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/lib/io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/lib/memcpy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/mm/init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/mm/ioremap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/video/video-sti.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/crypto/curve25519-ppc64le-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/include/asm/kasan.h: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kernel/crash_dump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kernel/idle.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kernel/iommu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kernel/rtasd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kernel/security.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kernel/static_call.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kernel/traps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_64_vio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_hv_nestedv2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_hv_p9_entry.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_hv_p9_perf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_hv_ras.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_hv_rm_mmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_hv_rm_xics.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_rtas.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_xics.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_xive.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/emulate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/guest-state-buffer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/powerpc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/lib/crc-t10dif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/lib/crc32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/lib/crypto/chacha-p10-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/lib/crypto/poly1305-p10-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/lib/crypto/sha256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/lib/feature-fixups.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/lib/sstep.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/book3s64/hash_pgtable.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/book3s64/hugetlbpage.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/book3s64/iommu_api.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/book3s64/pgtable.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/book3s64/pkeys.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/book3s64/radix_tlb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/cacheflush.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/init-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/init_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/init_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/ioremap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/ioremap_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/ioremap_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/mem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/pgtable.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/512x/mpc512x_lpbfifo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/512x/mpc512x_shared.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/52xx/mpc52xx_gpt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/8xx/cpm1.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/cell/spu_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/cell/spu_syscalls.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/cell/spufs/inode.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/chrp/setup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powermac/pfunc_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/idle.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/ocxl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/opal-async.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/opal-irqchip.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/opal-sensor-groups.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/opal-sensor.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/opal.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/pci-ioda.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/rng.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/vas-window.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/ps3/exports.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/ps3/gelic_udbg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/pseries/hvcserver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/pseries/of_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/sysdev/cpm2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/sysdev/fsl_rio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/sysdev/mpic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/sysdev/mpic_timer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/sysdev/msi_bitmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/sysdev/xics/icp-native.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/sysdev/xive/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/sysdev/xive/native.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/acpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/cacheinfo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/cpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/cpufeature.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/hibernate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> arch/riscv/kernel/hw_breakpoint.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/irq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/kernel_mode_vector.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/process.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/reset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/sbi-ipi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/sbi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/sbi_ecall.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/setup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/smp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/time.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/traps_misaligned.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/vendor_extensions.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kvm/vm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/lib/crc-t10dif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/lib/crc32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/lib/crc64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/lib/crypto/chacha-riscv64-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/lib/crypto/sha256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/lib/csum.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/mm/cache-ops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/mm/cacheflush.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/mm/dma-noncoherent.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/mm/init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/mm/pgtable.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/mm/physaddr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/appldata/appldata_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/crypto/arch_random.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/crypto/sha_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/include/asm/nospec-insn.h: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kernel/cpufeature.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kernel/crash_dump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kernel/ctlreg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kernel/facility.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kernel/fpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kernel/sthyi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kernel/unwind_bc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kernel/uv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kvm/interrupt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kvm/kvm-s390.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kvm/pv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/lib/crc32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/lib/crypto/chacha-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/lib/crypto/sha256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/lib/delay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/mm/gmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/mm/gmap_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/mm/pgtable.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/net/pnet.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/pci/pci_kvm_hook.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/boards/mach-x3proto/ilsel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/drivers/dma/dma-api.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/drivers/dma/dmabrg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/cpu/adc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/cpu/irq/ipr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/cpu/proc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/cpu/sh4/sq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/io_trapped.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/ioport.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/irq_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/kdebugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/process_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/reboot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/return_address.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/setup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/sh_bios.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/sh_ksyms_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/stacktrace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/unwinder.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/vsyscall/vsyscall.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/lib/io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/mm/cache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/mm/ioremap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/mm/mmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/mm/uncached.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/kernel/adi_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/kernel/auxio_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/kernel/ioport.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/kernel/process_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/kernel/setup_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/kernel/time_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/kernel/traps_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/lib/PeeCeeI.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/lib/atomic32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/lib/crc32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/lib/crypto/sha256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/lib/iomap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/mm/init_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/mm/init_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/prom/init_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/prom/misc_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/prom/misc_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/prom/ranges.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/prom/tree_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/prom/tree_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/video/video-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/drivers/mconsole_kern.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/kernel/exec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/kernel/gprof_syms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/kernel/irq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
