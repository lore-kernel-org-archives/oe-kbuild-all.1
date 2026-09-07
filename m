Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F35C35DA47
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 18:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788806116; cv=none; b=axHyEexjTnBPVbDd5OHwC9L+PoOXAFQr6sGvUr31dNr7BGI4R4wjhEDEnah8tTYcqJvCl9m11t4EtuOp2ybDLj5HFxn+vOG5Bpj2AE4s8I0NZ4ioP35sDw/rX7J2cMdUtpSBmQe92L7YuAIOFFIzZ96pRzTTkmbpX9ThJPNkRHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788806116; c=relaxed/simple;
	bh=0AdlNfIAfaTJgCvVCyeYSvuHKAxm7Xk06egkBTNItQk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VNspJQ7IYCGsKv9WvnOX2blzXkrCLwvIlJxuMjp2h9l8fdS40oSJrOuP3Iva/1CRXqLhxiM9hGxs/U6QG6cZWWtKwYZsg8DQ2MdbZDnsH3/nif3sRbHgL6TLPFrSe8R/qf5d6qB4RTaiapdS8MgfFq2vw/R1Kna9RMIe9injw18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3ATo69O; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3ATo69O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788806114; x=1820342114;
  h=date:from:to:cc:subject:message-id;
  bh=0AdlNfIAfaTJgCvVCyeYSvuHKAxm7Xk06egkBTNItQk=;
  b=Q3ATo69Opv/dxVFoQm5fG3lZpV8QFT9IdrjQul/VsN1MZdzC+vDLkO2a
   dlnrITeRJbgrxT7rJDHUjQx2rpfc8KXLftf6Qdv4mw2RVNSPghdx59S3Q
   InE4J287IJawuGwh0P59ZVOIlSYOn9/NF09YEFYIcPR+HqnZ9vsidkmw9
   Eo8WRVUaZJFe/noxLYyOMVPX1r79tEF1bX42PWqHlD0r0fRlpKOdPHplm
   YccYf7e2rmOvCV/1SwnFCfi/VeRW+t6NmLsJyvyQ5vLHiZTLo77HeXP4Y
   kIY08AFeRlfvPysNfER8VAOAB2GZUzJCAiZvZG4w7fdQnI/m7VcTNnsw9
   g==;
X-CSE-ConnectionGUID: BDvITzOkSgCqRoc738T05A==
X-CSE-MsgGUID: jo3phAfsRruX8fSpWo36HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88144659"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="88144659"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 11:35:13 -0700
X-CSE-ConnectionGUID: QzYVCdPiTku7l+jQkiNCtA==
X-CSE-MsgGUID: 0pLwPpwYTtWV87/eVGqlMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="269460562"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Sep 2026 11:35:13 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3eBS-000000001EB-18qQ;
	Mon, 07 Sep 2026 18:35:10 +0000
Date: Tue, 08 Sep 2026 02:34:52 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:dev/acpi-static-table-gsi-deferral 6/6]
 drivers/clocksource/arm_arch_timer_mmio.c:208:15: error: implicit declaration
 of function 'acpi_register_gsi'
Message-ID: <202609080239.Q5CEGYED-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/acpi-static-table-gsi-deferral
head:   1d08fa15e38840796959db081e78ac188d2c882c
commit: 1d08fa15e38840796959db081e78ac188d2c882c [6/6] clocksource: Implement arch mem timer deferred probe
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260908/202609080239.Q5CEGYED-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080239.Q5CEGYED-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080239.Q5CEGYED-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clocksource/arm_arch_timer_mmio.c: In function 'arch_timer_mmio_map_gsi':
>> drivers/clocksource/arm_arch_timer_mmio.c:208:15: error: implicit declaration of function 'acpi_register_gsi' [-Wimplicit-function-declaration]
     208 |         ret = acpi_register_gsi(&pdev->dev, gsi, trigger, polarity);
         |               ^~~~~~~~~~~~~~~~~


vim +/acpi_register_gsi +208 drivers/clocksource/arm_arch_timer_mmio.c

   194	
   195	static int arch_timer_mmio_map_gsi(struct platform_device *pdev, u32 gsi,
   196					   u32 flags, int *irq)
   197	{
   198		int trigger, polarity, ret;
   199	
   200		if (!gsi || *irq)
   201			return 0;
   202	
   203		trigger = (flags & ACPI_GTDT_INTERRUPT_MODE) ? ACPI_EDGE_SENSITIVE
   204							     : ACPI_LEVEL_SENSITIVE;
   205		polarity = (flags & ACPI_GTDT_INTERRUPT_POLARITY) ? ACPI_ACTIVE_LOW
   206								  : ACPI_ACTIVE_HIGH;
   207	
 > 208		ret = acpi_register_gsi(&pdev->dev, gsi, trigger, polarity);
   209		if (ret < 0)
   210			return ret;
   211	
   212		*irq = ret;
   213	
   214		return 0;
   215	}
   216	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
