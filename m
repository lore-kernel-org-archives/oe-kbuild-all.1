Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2BA20FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 07:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lp/FNNcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698478396; x=1730014396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YHTCxnreJjy6DIZTiRH0NmVmuMmgkKkY1bH4dtkYIBg=;
  b=Lp/FNNcI7TsKKuBcgB4DKR0K3i+3l7KIHMWzdIK2vbMFpafofAVo2JEP
   tc5ryRLxbLaH2YvI/2KZpuo1P3w/NZPeoiSus9KrqKgBd0WMefBgHiQ5B
   MmB5naBdAx6OYXfKfV8SOKhOuvhIYaXQ4zlhvhcE/ebhnWI9EstbQinb2
   c7kPTLboIx4AlFA4leOSqhRs8vU0NX+v+5PlIZjK8zPdhTuFFLVFOp42r
   BxROqRaXyOCAruScZWEeU3TzBCS0SKilUcu5OSkmQCcC5Pr/miaqznfAe
   vwlWThUHnIcc8/HHGdpyWVcZGG8jjTM0UN9iYX/r3zFAreokhrxwPp5B9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="390748030"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="390748030"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 00:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="1016995"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Oct 2023 00:32:38 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwdol-000BYX-2J;
	Sat, 28 Oct 2023 07:33:11 +0000
Date: Sat, 28 Oct 2023 15:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v2 95/102]
 drivers/irqchip/irq-riscv-imsic-state.c:515:24: error: implicit declaration
 of function 'acpi_get_intc_index_hartid'
Message-ID: <202310281540.OpabFbXC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v2
head:   2240a0f7255cc50372fa4cf3ebdb9e7db3da1256
commit: 5b57492d03a1534df5f9be48f74a967a222af314 [95/102] irqchip: riscv-imsic: Add ACPI support
config: riscv-randconfig-001-20231028 (https://download.01.org/0day-ci/archive/20231028/202310281540.OpabFbXC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310281540.OpabFbXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310281540.OpabFbXC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-riscv-imsic-state.c: In function 'imsic_get_parent_hartid':
>> drivers/irqchip/irq-riscv-imsic-state.c:515:24: error: implicit declaration of function 'acpi_get_intc_index_hartid' [-Werror=implicit-function-declaration]
     515 |                 return acpi_get_intc_index_hartid(index, hartid);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-riscv-imsic-state.c: In function 'imsic_get_mmio_resource':
>> drivers/irqchip/irq-riscv-imsic-state.c:535:24: error: implicit declaration of function 'acpi_get_imsic_mmio_info'; did you mean 'acpi_get_system_info'? [-Werror=implicit-function-declaration]
     535 |                 return acpi_get_imsic_mmio_info(index, res);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
         |                        acpi_get_system_info
   cc1: some warnings being treated as errors


vim +/acpi_get_intc_index_hartid +515 drivers/irqchip/irq-riscv-imsic-state.c

   507	
   508	static int __init imsic_get_parent_hartid(struct fwnode_handle *fwnode,
   509						  u32 index, unsigned long *hartid)
   510	{
   511		int rc;
   512		struct of_phandle_args parent;
   513	
   514		if (!is_of_node(fwnode))
 > 515			return acpi_get_intc_index_hartid(index, hartid);
   516	
   517		rc = of_irq_parse_one(to_of_node(fwnode), index, &parent);
   518		if (rc)
   519			return rc;
   520	
   521		/*
   522		 * Skip interrupts other than external interrupts for
   523		 * current privilege level.
   524		 */
   525		if (parent.args[0] != RV_IRQ_EXT)
   526			return -EINVAL;
   527	
   528		return riscv_of_parent_hartid(parent.np, hartid);
   529	}
   530	
   531	static int __init imsic_get_mmio_resource(struct fwnode_handle *fwnode,
   532						  u32 index, struct resource *res)
   533	{
   534		if (!is_of_node(fwnode))
 > 535			return acpi_get_imsic_mmio_info(index, res);
   536	
   537		return of_address_to_resource(to_of_node(fwnode), index, res);
   538	}
   539	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
