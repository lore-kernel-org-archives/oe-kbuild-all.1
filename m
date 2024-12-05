Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6DD38C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 03:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733368945; cv=none; b=u4BJEn1eYqeHyr2thPRq3WhsEMqnezS/5A58iwVbUdmB5fOSCTtPYXcdOSrWbJGi8jyIykvQJn3MyRdRDzMOEpZHPcHGG2WyrIQOBEbdFUCbG1ecU3YM5UgNHyiWNxAxI3kPKHKQt3yfokgGFL/3Oa5TbaUmyKt2ZTwwinEUdcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733368945; c=relaxed/simple;
	bh=GWd9pG1FglgIBxcW2hHRJKly993XVdY5eLFcJlzre+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qRyK3FemFtqtiHZe8e5WojpqcfhLQvBfZJqQUHdEdrPHropMql0sVGSEQdQenf2XjfmNB5UqxS9H2Z4TNNYi5Vg2l9AV2eKAKd4OWgHvlXy0pyW9Zq+m4jYtAYEVV345A3g2TxUVqlY/S11l5vf3uppKshSu3LYsYZM3dzNFXEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CuAViAXt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuAViAXt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733368944; x=1764904944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GWd9pG1FglgIBxcW2hHRJKly993XVdY5eLFcJlzre+U=;
  b=CuAViAXt1Z0Sp2CSeCmPAiMm3YxbRnHJi4DtKlmPdJKrgJLoldbzMq2u
   MzddtkNOpWlMKVPIfAkwPy2xdGhRxQThaqa9+x6WynHzMGONzyCh2soy3
   Lrkunh73LWnu1NP/YgFppiLH60oJ0UanTXolQP16AEFdAEM4YLU9cQQQJ
   2cyXT/yTq7OwQXVoqguEg7Evj1H1b4n/VNwU+0j5ZjyPoF3htLn5SQKaC
   o+9pXmH5bJZlIpWNokLDhDpOqdIFBOtvir1Mhd0vxWOV6XiYfNH7CvIQL
   B6hx6MSz38vjKk7GObD25l1ym2qRYoRwPB6QFmCXfRZ5fijrqyVzrcUQD
   g==;
X-CSE-ConnectionGUID: BeEfTBS1QPSQaRniwmqRuQ==
X-CSE-MsgGUID: PUL8CdupSaSIs5VONOWKcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33000668"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33000668"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 19:22:22 -0800
X-CSE-ConnectionGUID: QHPCtul5Q6Wl3hhnNDaPJw==
X-CSE-MsgGUID: zPYauwrRQjST/EF8CYQB5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="93642518"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Dec 2024 19:22:00 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ2RB-0003jZ-2P;
	Thu, 05 Dec 2024 03:21:57 +0000
Date: Thu, 5 Dec 2024 11:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:pci/xgene-fixes-6.13 14/18]
 drivers/pci/controller/pci-xgene-msi.c:101:31: error: implicit declaration
 of function 'FIELD_PREP'
Message-ID: <202412051158.EfEkIVqu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git pci/xgene-fixes-6.13
head:   32627e010975ae9817552c5e21d1860ce9c9bdfa
commit: 3d9c887e78e0ae9e97a531f2015c585b5c213a76 [14/18] PCI: xgene: Sanitise MSI allocation and affinity setting
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20241205/202412051158.EfEkIVqu-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051158.EfEkIVqu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051158.EfEkIVqu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/arc/include/uapi/asm/byteorder.h:14,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arc/include/asm/bitops.h:192,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from drivers/pci/controller/pci-xgene-msi.c:9:
   drivers/pci/controller/pci-xgene-msi.c: In function 'xgene_msi_ir_read':
>> drivers/pci/controller/pci-xgene-msi.c:101:31: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     101 |                              (FIELD_PREP(MSI_GROUP_MASK, msi_grp) |
         |                               ^~~~~~~~~~
   include/uapi/linux/swab.h:118:38: note: in definition of macro '__swab32'
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/pci/controller/pci-xgene-msi.c:100:16: note: in expansion of macro 'readl_relaxed'
     100 |         return readl_relaxed(msi->msi_regs + MSI_IR0 +
         |                ^~~~~~~~~~~~~
   drivers/pci/controller/pci-xgene-msi.c: In function 'compute_hwirq':
>> drivers/pci/controller/pci-xgene-msi.c:114:18: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     114 |         return ((FIELD_GET(BIT(3), grp_idx) << 7)       |
         |                  ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +101 drivers/pci/controller/pci-xgene-msi.c

    43	
    44	/*
    45	 * X-Gene v1 has 16 frames of MSI termination registers MSInIRx, where n is
    46	 * frame number (0..15), x is index of registers in each frame (0..7).  Each
    47	 * 32b register is at the beginning of a 64kB region, each frame occupying
    48	 * 512kB (and the whole thing 8MB of PA space).
    49	 *
    50	 * Each register supports 16 MSI vectors (0..15) to generate interrupts.
    51	 *
    52	 * Additionally, each MSI termination frame has 1 MSIINTn register (n is
    53	 * 0..15) to indicate the MSI pending status caused by 1 of its 8 index
    54	 * registers. Each 32b register is at the beginning of a 64kB region (and
    55	 * overall occupying an extra 1MB).
    56	 *
    57	 * There is one GIC IRQ assigned for each MSI termination frame, 16 in
    58	 * total.
    59	 *
    60	 * The register layout is as follows:
    61	 * MSI0IR0			base_addr
    62	 * MSI0IR1			base_addr +  0x10000
    63	 * ...				...
    64	 * MSI0IR6			base_addr +  0x60000
    65	 * MSI0IR7			base_addr +  0x70000
    66	 * MSI1IR0			base_addr +  0x80000
    67	 * MSI1IR1			base_addr +  0x90000
    68	 * ...				...
    69	 * MSI1IR7			base_addr +  0xF0000
    70	 * MSI2IR0			base_addr + 0x100000
    71	 * ...				...
    72	 * MSIFIR0			base_addr + 0x780000
    73	 * MSIFIR1			base_addr + 0x790000
    74	 * ...				...
    75	 * MSIFIR7			base_addr + 0x7F0000
    76	 * MSIINT0			base_addr + 0x800000
    77	 * MSIINT1			base_addr + 0x810000
    78	 * ...				...
    79	 * MSIINTF			base_addr + 0x8F0000
    80	 *
    81	 * In order to allow an MSI to be moved from one CPU to another without
    82	 * having to repaint both the address and the data (which cannot be done
    83	 * atomically), we statically partitions the MSI frames between CPUs. Given
    84	 * that XGene-1 has 8 CPUs, each CPU gets two frames assigned to it
    85	 *
    86	 * We adopt the convention that when an MSI is moved, it is configured to
    87	 * target the same register number in the new frame. This reserves a given
    88	 * MSI across all CPUs, and reduces the MSI capacity from 2048 to 256.
    89	 *
    90	 * Effectively, this amounts to:
    91	 * - hwirq[7]::cpu[2:0] is the target frame number
    92	 * - hwirq[6:4] is the register index in any given frame
    93	 * - hwirq[3:0] is the MSI data
    94	 */
    95	
    96	/* MSInIRx read helper */
    97	static u32 xgene_msi_ir_read(struct xgene_msi *msi,
    98					    u32 msi_grp, u32 msir_idx)
    99	{
   100		return readl_relaxed(msi->msi_regs + MSI_IR0 +
 > 101				     (FIELD_PREP(MSI_GROUP_MASK, msi_grp) |
   102				      FIELD_PREP(MSI_INDEX_MASK, msir_idx)));
   103	}
   104	
   105	/* MSIINTn read helper */
   106	static u32 xgene_msi_int_read(struct xgene_msi *msi, u32 msi_grp)
   107	{
   108		return readl_relaxed(msi->msi_regs + MSI_INT0 +
   109				     FIELD_PREP(MSI_INTR_MASK, msi_grp));
   110	}
   111	
   112	static irq_hw_number_t compute_hwirq(u32 grp_idx, u32 msir_idx, u32 intr_idx)
   113	{
 > 114		return ((FIELD_GET(BIT(3), grp_idx) << 7)	|
   115			(msir_idx << 4)				|
   116			intr_idx);
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
