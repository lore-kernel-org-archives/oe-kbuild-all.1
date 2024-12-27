Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483D7139D1E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 21:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735334147; cv=none; b=gZK+XL3yUb7LwnmNBi0gED7VR3Rq0p15xHIpy2ogWmlMqW/cvEXeDEJ2/1XgWIAeb6GzZhVDLDHkBeg/JpOrrsjsdxvPKJnPhZKU9exZ1j5SJrJFnA9JiYp7Sbw1+mfO8TUWD3NArgIpBk2esgvHfYwcSpr17zW8r9kXsnircuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735334147; c=relaxed/simple;
	bh=VPeuigiz338WmSKG0Qjt7hsV6ndlaNysL+8Nw2enCTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aJGvTLTAei5qIxoLRvUXtjgz1nbmVJEqfsZkWh2wBYMCatGa5vozb7xggsYtTidgvK898162DNWIj4/oksYcrp7XUfYna7OdzylRBNilpBpn9FndApZ8ejC8QvbsGDDQ0ncz/WIUMVpsKbqwlnLXxM4M3tqBUgiZkLPs/sOq8uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e72YPXCW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e72YPXCW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735334145; x=1766870145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VPeuigiz338WmSKG0Qjt7hsV6ndlaNysL+8Nw2enCTs=;
  b=e72YPXCWlrIewi4gEgVrMrq+Fhc93eTMUgg988/dWUrzlgmGjmgV5/ry
   v4w37VGRTr76OurNsyFqVUmgGD8CDmSoec/XOMtYE4+/Mhz06dSmpnIxn
   NIhnLA5T9rrJ3LGIN0QhQl+mvJeqOvP++7/QrhBs24JDkodJ0Oo6/bqgN
   mWXozZ+egkVHq2kqzkq11Zdlyns8CEj0AoZwmEFx7DMFr7R1+te6/vKDC
   G++DO0vJFt5Kb1kG/iWr0fMhs2tl839z8hp+4eCqg9RABKtnuHJ9p+aGF
   QtX6/T62iTrJKMOJ/b46c6IxNMRtE/WPJwUvKDg5iNxxEAGPHajDxr7dq
   w==;
X-CSE-ConnectionGUID: iyGbhOewQDW66f04AUq07w==
X-CSE-MsgGUID: XekUDMD6RHqaYfrkudm7iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="34996036"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="34996036"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 13:15:45 -0800
X-CSE-ConnectionGUID: mddLfFrHRtGVt2+ti4xUww==
X-CSE-MsgGUID: iWyCLxOuSLay3zNe3hYGDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="100745606"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Dec 2024 13:15:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRHgL-0003cx-36;
	Fri, 27 Dec 2024 21:15:41 +0000
Date: Sat, 28 Dec 2024 05:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1662/1662]
 arch/loongarch/kernel/legacy_boot.c:55:26: sparse: sparse: symbol
 'pchlpc_default' was not declared. Should it be static?
Message-ID: <202412280533.14nOvpdL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e53a23ef21aa9859c864e7c4bb6ecde5269f54b6
commit: db5bb24abc8dd120fd81b7ce21819e96578d011e [1662/1662] LoongArch: Old BPI compatibility
config: loongarch-randconfig-r131-20241226 (https://download.01.org/0day-ci/archive/20241228/202412280533.14nOvpdL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241228/202412280533.14nOvpdL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280533.14nOvpdL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/loongarch/kernel/legacy_boot.c:39:19: sparse: sparse: symbol 'liointc_domain' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:40:19: sparse: sparse: symbol 'pch_lpc_domain' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:41:19: sparse: sparse: symbol 'pch_msi_domain' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:42:19: sparse: sparse: symbol 'pch_pic_domain' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:45:5: sparse: sparse: symbol 'nr_io_pics' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:48:26: sparse: sparse: symbol 'liointc_default' was not declared. Should it be static?
>> arch/loongarch/kernel/legacy_boot.c:55:26: sparse: sparse: symbol 'pchlpc_default' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:61:26: sparse: sparse: symbol 'eiointc_default' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:62:26: sparse: sparse: symbol 'pchmsi_default' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:63:26: sparse: sparse: symbol 'pchpic_default' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:94:6: sparse: sparse: symbol 'register_default_pic' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:341:14: sparse: sparse: symbol 'bpi_init' was not declared. Should it be static?

vim +/pchlpc_default +55 arch/loongarch/kernel/legacy_boot.c

    37	
  > 38	struct irq_domain *cpu_domain;
    39	struct irq_domain *liointc_domain;
    40	struct irq_domain *pch_lpc_domain;
    41	struct irq_domain *pch_msi_domain[MAX_IO_PICS];
    42	struct irq_domain *pch_pic_domain[MAX_IO_PICS];
    43	
    44	char arcs_cmdline[COMMAND_LINE_SIZE];
    45	int nr_io_pics;
    46	int bpi_version;
    47	
    48	struct acpi_madt_lio_pic liointc_default = {
    49			.address = LOONGSON_REG_BASE + 0x1400,
    50			.size = 256,
    51			.cascade = {2, 3},
    52			.cascade_map = {0x00FFFFFF, 0xff000000},
    53	};
    54	
  > 55	struct acpi_madt_lpc_pic pchlpc_default = {
    56		.address = LS7A_LPC_REG_BASE,
    57		.size = SZ_4K,
    58		.cascade = 19,
    59	};
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
