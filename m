Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2565CF9E8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 02:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752028952; cv=none; b=uKbln8VgGF4fuh9JPqAvNVrvUjdErFMvB6S/IJoZz8eLwnMBb2kndppNMq5vnBqAfLaGsldgO2RKl7Nrm4aFiSbRqycEwoisIKGcxBLzdoqNbe+1FXSS/MEFBjWCwBVMu9VbuVkKgJM2BCj61Q6hcb4dr4LUT00vosJ0RicDeAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752028952; c=relaxed/simple;
	bh=IQW8O2/rGaiRY0Kc0rXJEicPEQ4dueoTYF0xggjQqAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UHBifE0vHxe60KWAvCHfi0plOODwrweVDoeboWSWy8pD1laEVYG3m5M4wWxgV3WI0N9Q/LUCJoFKnV43H/A6szrBG++CVLdG6yTkVrPLX1UPBTa6PlpwxbPcI74q3MHvnZCaYk/ncK0ulqDijN6ddGfYcGT4GravXAOpgF9D6hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JO1T686/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JO1T686/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752028949; x=1783564949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IQW8O2/rGaiRY0Kc0rXJEicPEQ4dueoTYF0xggjQqAU=;
  b=JO1T686/X020KJ19580kx77bb2aZy2Vys1SejmysNPMOpp49wscoVkyp
   GvDSAP3dceBHt/5kL5IAysTfVW8S1X3GyscIGYevhAHiNEF7XGQkSCazV
   CnhIBz3o77GtqJPukYiO0apJpIRoqb1lw+JABjSQ94zG8s3KpGhtO97m+
   W7A3/W2Su8vwMmFFgciICNlJrcByeR3AGhp0g5UiNpO8Ofml159MMv6bD
   zuzB0KCF8uEl8M5+odwfH8RztT2PU7NyTO3Ta8cCfN1AhJxMdpNhIvokI
   tjZOlzlNxNUtEb2qGVWDFB3B2WDX58Ud77dAZqRTNfsqWG5aOXHjSuzkF
   w==;
X-CSE-ConnectionGUID: Cd9Ao6ReTCe60OAYV6AhQA==
X-CSE-MsgGUID: a4agQ/z7RdSbTl5Hx12rZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="71861555"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="71861555"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 19:42:29 -0700
X-CSE-ConnectionGUID: 7Y9jnuewSMOiIC2IjX60gQ==
X-CSE-MsgGUID: OaqolR0kQ521q8KVX/Z5SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="161204388"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jul 2025 19:42:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZKlN-0002zZ-11;
	Wed, 09 Jul 2025 02:42:25 +0000
Date: Wed, 9 Jul 2025 10:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 0/6]
 arch/arm64/kernel/debug-monitors.c: warning: EXPORT_SYMBOL() is used, but
 #include <linux/export.h> is missing
Message-ID: <202507091029.daD77Ohw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   0cc68f7cc2400d7ee1782343844a0f98477418a2
commit: 1755d3381475659dac6949ab298bc7ce147e5e24 [0/6] Merge 8630c59e9936 ("Merge tag 'kbuild-v6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild") into android-mainline
config: i386-buildonly-randconfig-003-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091029.daD77Ohw-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091029.daD77Ohw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091029.daD77Ohw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .bazelignore: warning: ignored by one of the .gitignore files
   .pylintrc: warning: ignored by one of the .gitignore files
   arch/alpha/kernel/core_marvel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/core_titan.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/core_tsunami.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/irq_alpha.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/machvec_impl.h: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/process.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/smp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/time.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/traps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/lib/checksum.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/lib/csum_partial_copy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/lib/fls.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/lib/udelay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arc/kernel/arcksyms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arc/kernel/intc-compact.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arc/kernel/process.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arc/kernel/reset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arc/kernel/unwind.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arc/mm/cache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arc/mm/init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arc/mm/ioremap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/common/bL_switcher.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/common/locomo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/common/sa1111.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/common/sharpsl_param.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/crypto/aes-cipher-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/crypto/curve25519-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/kernel/cacheinfo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/kernel/dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/kernel/fiq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/kernel/opcodes.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/kernel/reboot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/kernel/tcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/kernel/traps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/lib/crc-t10dif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/lib/crc32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/lib/crypto/blake2s-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/lib/crypto/chacha-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/lib/crypto/poly1305-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/lib/crypto/sha256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/lib/delay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/lib/xor-neon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-at91/pm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-davinci/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-davinci/sram.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-footbridge/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-footbridge/netwinder-hw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-imx/cpu-imx25.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-imx/cpu-imx27.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-imx/cpu-imx31.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-imx/cpu-imx35.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-imx/cpu-imx5.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-imx/cpuidle-imx6q.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-imx/irq-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-imx/ssi-fiq-ksym.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-lpc32xx/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-lpc32xx/serial.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-mmp/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-omap1/id.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-omap1/io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-omap1/mux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-omap1/ocpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-omap1/omap-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-omap2/id.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-pxa/generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-pxa/pm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-pxa/pxa27x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-rpc/ecard.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-s3c/gpio-samsung.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-sa1100/assabet.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-sa1100/jornada720_ssp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-sa1100/neponset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-sa1100/ssp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mm/dma-mapping.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mm/flush.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mm/iomap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mm/ioremap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mm/mmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mm/nommu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mm/proc-syms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/plat-orion/gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/probes/decode-arm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/probes/decode-thumb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/xen/enlighten.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/crypto/aes-ce-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/crypto/aes-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/crypto/sm4-ce-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/include/asm/asm-prototypes.h: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/acpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/alternative.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/cacheinfo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/cpu_errata.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/cpufeature.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> arch/arm64/kernel/debug-monitors.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/fpsimd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/hibernate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/mte.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/rsi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/smp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kvm/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/lib/crc-t10dif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/lib/crc32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/lib/crypto/chacha-neon-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/lib/crypto/poly1305-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/lib/crypto/sha256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/lib/csum.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/lib/delay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/lib/uaccess_flushcache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/lib/xor-neon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/mm/context.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/mm/copypage.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/mm/ioremap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/mm/mem_encrypt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/mm/mmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/abiv1/cacheflush.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/abiv2/strksyms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/kernel/ftrace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/kernel/power.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/kernel/process.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/kernel/setup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/kernel/stacktrace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/lib/delay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/lib/string.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/lib/usercopy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/mm/cachev1.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/mm/cachev2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/mm/highmem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/mm/init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/mm/tcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/mm/tlb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/hexagon/kernel/hexagon_ksyms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/hexagon/kernel/reset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/hexagon/kernel/stacktrace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/hexagon/kernel/time.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/hexagon/lib/checksum.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/hexagon/mm/cache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/kernel/acpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/kernel/alternative.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/kernel/kfpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/kernel/traps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/kernel/unwind_guess.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/kernel/unwind_orc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/kernel/unwind_prologue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/lib/crc32-loongarch.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/lib/csum.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/amiga/amisound.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/amiga/chipram.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/amiga/config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/amiga/pcmcia.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/atari/ataints.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/atari/atakeyb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/atari/atasound.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/atari/config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/atari/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/atari/stdma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/atari/stram.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/coldfire/clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/coldfire/gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/emu/natfeat.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/hp300/config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/kernel/ints.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/kernel/process.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/kernel/setup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/kernel/setup_mm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/kernel/setup_no.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/lib/checksum.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/lib/memcpy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/lib/memmove.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/lib/memset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/lib/uaccess.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mac/config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mac/psc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mac/via.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mm/cache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mm/hwtest.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mm/init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mm/kmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mm/memory.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mm/motorola.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mm/sun3kmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mvme16x/config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/sun3/idprom.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/sun3/mmu_emu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/sun3/sun3dvma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/alchemy/common/setup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/cavium-octeon/crypto/octeon-sha256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/cavium-octeon/executive/cvmx-boot-vector.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/cavium-octeon/executive/cvmx-helper-util.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/cavium-octeon/executive/cvmx-helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/cavium-octeon/executive/cvmx-pko.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/cavium-octeon/executive/cvmx-spi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/cavium-octeon/executive/octeon-model.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
--
   drivers/clk/hisilicon/clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/hisilicon/reset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/imx/clk-composite-7ulp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/imx/clk-pfdv2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/imx/clk-pllv4.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/imx/clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mediatek/clk-apmixed.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mediatek/clk-cpumux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mediatek/clk-gate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mediatek/clk-mtk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mediatek/clk-mux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mediatek/clk-pll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mediatek/clk-pllfh.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mediatek/reset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/clk-cpu-dyndiv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/clk-dualdiv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/clk-mpll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/clk-phase.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/clk-pll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/clk-regmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/meson-aoclk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/meson-clkc-utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/meson-eeclk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/sclk-div.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/vclk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/vid-pll-div.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mxs/clk-ssp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/nuvoton/clk-ma35d1-divider.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/nuvoton/clk-ma35d1-pll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/qcom/clk-krait.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/qcom/clk-regmap-mux-div.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/renesas/r9a06g032-clocks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/rockchip/clk-ddr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/rockchip/clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/rockchip/softrst.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sprd/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sprd/composite.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sprd/div.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sprd/gate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sprd/mux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sprd/pll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/starfive/clk-starfive-jh7110-sys.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/starfive/clk-starfive-jh71x0.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_div.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_frac.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_gate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_mmc_timing.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_mp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_mult.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_mux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_nk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_nkm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_nkmp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_nm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_phase.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_reset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_sdm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/tegra/clk-dfll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/tegra/clk-tegra210-emc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/ti/clkctrl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/versatile/icst.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clocksource/acpi_pm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clocksource/arm_arch_timer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clocksource/hyperv_timer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clocksource/i8253.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clocksource/samsung_pwm_timer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clocksource/timer-clint.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clocksource/timer-riscv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/comedi_buf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/comedi_fops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/comedi_pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/comedi_pcmcia.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/comedi_usb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/addi_watchdog.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/amplc_dio200_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/amplc_pc236_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/comedi_8254.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/comedi_8255.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/comedi_isadma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/das08.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/mite.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/ni_labpc_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/ni_labpc_isadma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/ni_routes.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/ni_tio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/ni_tiocmd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/kcomedilib/kcomedilib_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/range.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/connector/connector.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cpufreq/amd-pstate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cpufreq/cpufreq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cpufreq/cpufreq_governor_attr_set.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cpufreq/cpufreq_ondemand.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cpufreq/freq_table.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cpufreq/speedstep-lib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cpuidle/cpuidle.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cpuidle/driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cpuidle/dt_idle_states.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/cpuidle/governor.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cpuidle/poll_state.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/atmel-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/atmel-sha.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/caam/blob_gen.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/caam/caamalg_desc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/caam/caamalg_qi2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/caam/caamhash_desc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/caam/ctrl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/caam/error.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/caam/jr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/caam/key_gen.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/caam/qi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/ccp/ccp-dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/ccp/platform-access.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/ccp/sev-dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/ccp/tee-dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/hisilicon/debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/hisilicon/hpre/hpre_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/hisilicon/qm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/hisilicon/sec2/sec_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/hisilicon/sgl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/hisilicon/zip/zip_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/iaa/iaa_crypto_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_admin.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_aer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_cfg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_dbgfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_dev_mgr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_gen2_config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_gen2_hw_csr_data.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_gen2_hw_data.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_gen2_pfvf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_gen4_config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_gen4_hw_csr_data.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_gen4_hw_data.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_gen4_pfvf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_gen4_pm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_gen4_ras.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_gen4_vf_mig.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_gen6_ras.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_hw_arbiter.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_isr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_pfvf_pf_proto.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_pfvf_vf_msg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_pfvf_vf_proto.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_sriov.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_transport.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/intel/qat/qat_common/adf_vf_isr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/marvell/octeontx/otx_cptpf_ucode.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/marvell/octeontx2/cn10k_cpt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/marvell/octeontx2/otx2_cpt_mbox_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/marvell/octeontx2/otx2_cptlf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/nx/nx-842.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/crypto/omap-crypto.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cxl/core/cdat.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cxl/core/edac.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cxl/core/features.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cxl/core/hdm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cxl/core/mbox.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cxl/core/memdev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cxl/core/pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cxl/core/pmem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cxl/core/pmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cxl/core/port.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cxl/core/region.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cxl/core/regs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dax/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dax/hmem/device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dax/super.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dca/dca-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dio/dio-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma-buf/dma-fence-chain.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma-buf/dma-fence-unwrap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma-buf/dma-heap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/amd/ptdma/ptdma-debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/amd/ptdma/ptdma-dmaengine.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/bestcomm/ata.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/bestcomm/bestcomm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/bestcomm/fec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/bestcomm/gen_bd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/dmaengine.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/dw-edma/dw-edma-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/dw/acpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/dw/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/dw/dw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/dw/idma32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/fsl-dpaa2-qdma/dpdmai.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/fsldma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/hsu/hsu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/idxd/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/idxd/cdev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/idxd/device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/idxd/dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/idxd/submit.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/mcf-edma-main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/of-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/ppc4xx/adma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/qcom/hidma_mgmt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
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
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=y] && CAN_NETLINK [=n]
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
