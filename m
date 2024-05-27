Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D3A199EA4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 14:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716819388; cv=none; b=sIUwtUHA4ePkLFOGbzwyLc3bpkZ870I22VfdB0cE564pGcSyEnYpVR129MogXRvqTK8t5n6pvXsk8oCrmdedBnX+B1/gEZrzIjRiKzkWcdkr8isoUuX+9dYbPicQs8goDmq2gkgNsz9XjWgnh1AUMrBKZpo2uxIW4bEtPR+POFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716819388; c=relaxed/simple;
	bh=VFvSK0X7xixLKMLbqKS+OfK1mmKSifUugFzw+8djFlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e2giOqrySKoIX4HKe2ZOVylkCUT5tLEGI/H8LJ/fkvwzzYxxknba+Zg7SF4ytc1quo5+cW3qbGtcL4p9kjk9FmzPMHNF9xFTvOBZ/6rzU9nTeQtf0tLWJCq4RWFS0lcjeKpMu9amq++nj+C2e0OctoKFHTpGWkTnsaj57KAN/Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkoR12Y9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkoR12Y9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716819386; x=1748355386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VFvSK0X7xixLKMLbqKS+OfK1mmKSifUugFzw+8djFlA=;
  b=DkoR12Y9KbujVHGAT2kLfWPyyp6IipVwKviGBMLz6YT+VfMpQRdhdEvf
   gPDv8RswEFEx/HWbUJtNPf0gNy8QVP6bcvqQkuosBpuF7zaps6DmOWjzK
   ZSXc1DFae7dgg7Fd3V+NmqHvti6kvJe2+EW1blx7PYAX6xTexqQpFIhZU
   AcxR5wA99+baRVEdrognjhusSzJGWXB+gpYcVwmKgP9SxBhf0gIG7H3ni
   qRH1+1/gmVfsHDnEimaMo0RCTc0Gi4XXcer/kx3+wP0Ii1wh5yVBF6vEr
   5KJ2Omk9IHccnRUCWrmdJFuAYe2LNIUVmHq0SNxMUyjxngFVBciCyQX9p
   g==;
X-CSE-ConnectionGUID: 7bMWgglfRxCe5dfmT9VZtQ==
X-CSE-MsgGUID: imBgl8ooRiqeNL8CtkWflQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="16932674"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="16932674"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 07:16:26 -0700
X-CSE-ConnectionGUID: eSfEot+VQre+USYQZBBDGA==
X-CSE-MsgGUID: Ln/iK9B4SKicsQkru9EyQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="39571852"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 May 2024 07:16:25 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBb9C-000ASg-2T;
	Mon, 27 May 2024 14:16:22 +0000
Date: Mon, 27 May 2024 22:13:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v6_610_rc1_full 45/54]
 arch/riscv/include/asm/irq.h:58:16: error: 'INVALID_CONTEXT' undeclared
Message-ID: <202405272258.7UxLS4zX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v6_610_rc1_full
head:   13e1f10998ff5fe93a40fde35d93d4fb3a3d1c16
commit: b7918161d2483fc1a822cbdc62994e934be8ca38 [45/54] irqchip/riscv-intc: Add ACPI support for AIA
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240527/202405272258.7UxLS4zX-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240527/202405272258.7UxLS4zX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405272258.7UxLS4zX-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/riscv/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from arch/riscv/kernel/asm-offsets.c:12:
>> arch/riscv/include/asm/irq.h:51:15: warning: no previous prototype for 'acpi_get_ext_intc_parent_hartid' [-Wmissing-prototypes]
      51 | unsigned long acpi_get_ext_intc_parent_hartid(unsigned int plic_id, unsigned int ctxt_idx)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/irq.h: In function 'acpi_get_plic_nr_contexts':
>> arch/riscv/include/asm/irq.h:58:16: error: 'INVALID_CONTEXT' undeclared (first use in this function)
      58 |         return INVALID_CONTEXT;
         |                ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/irq.h:58:16: note: each undeclared identifier is reported only once for each function it appears in
   arch/riscv/include/asm/irq.h: In function 'acpi_get_plic_context':
   arch/riscv/include/asm/irq.h:63:16: error: 'INVALID_CONTEXT' undeclared (first use in this function)
      63 |         return INVALID_CONTEXT;
         |                ^~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/INVALID_CONTEXT +58 arch/riscv/include/asm/irq.h

    50	
  > 51	unsigned long acpi_get_ext_intc_parent_hartid(unsigned int plic_id, unsigned int ctxt_idx)
    52	{
    53		return INVALID_HARTID;
    54	}
    55	
    56	static inline unsigned int acpi_get_plic_nr_contexts(unsigned int plic_id)
    57	{
  > 58		return INVALID_CONTEXT;
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
