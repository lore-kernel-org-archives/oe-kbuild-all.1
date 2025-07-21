Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346B9292B41
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 11:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753096273; cv=none; b=RuwJT4bz6bhaRQdssY6cJ/Aydga+rUptAFkoiNSWNgNaJsGPW/1Lg0o0OqR4sUjd7z5M++DN5hh2oF9HFGnz6NhW7hocEJsL0+qEGZxTDYkXD6h3t7YsPMtei8RWyjBQQuiWbrKg+mWwN66038tHtRj19qKYccLPRPslmQo/VdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753096273; c=relaxed/simple;
	bh=7HcGJwwyrTv/FPKqZmBWI2/BnMf6I2zEE+eJTe/6o14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lVtzVzZEEY8IuN4GMkrTnW4LXJX/J982r2tbzcmrGMfPLtZfyBlBUJI/LNKcsR+sy/TLcfwldA/+InEToWGx7HzeiNTtGOyHaBynDkMG2J+Ds9BRUmWxT6lbhNRZC0RMRzC2eI/nVSDva+wx9LXDGWGCqZ2V8mYzXyGqO6q/Tck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9L9JnTZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9L9JnTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753096272; x=1784632272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7HcGJwwyrTv/FPKqZmBWI2/BnMf6I2zEE+eJTe/6o14=;
  b=A9L9JnTZEkxT1NPrZHxaWLciA4/jnTN36wzH8GSfo8I2QsQ21+ZwNem1
   kT8YNhpI1Uo9ysbAoB697mQIfBe5hkdSRBxxng/vmz7Lc9rvC4XQCYx+V
   3B4wGDFP60JOdu+IJ1uqLDHVhvcRr2PM3Jh9KtUL5jy0SuQEGdGZW3GPK
   LBEmqBbUAEXOPrXs5SJv1Y3q8TrRKbvpbaP8BGaQI0WadfsP8roh6C4+d
   3/WRAsnkl0h48d8JOMqUHe5i3NK2sBWIJmBVGoo847RLExBKNZU1ezrAY
   Tp7IHTIkYd9y9hs50mGN9Cos41z2Ku09riHWk4HSfU3N9BuNY7bmHKyfT
   Q==;
X-CSE-ConnectionGUID: e1M3kv4CR6eYxwPw8WRmcg==
X-CSE-MsgGUID: yY0pmnypQ9GaDqKXTZAzgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="55265867"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="55265867"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 04:11:12 -0700
X-CSE-ConnectionGUID: Nt/dc1RsSmSZ6bgYZF3anQ==
X-CSE-MsgGUID: x8I9jWKJRS+NTa3CiUJEfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="158590734"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Jul 2025 04:11:11 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udoQG-000Gk1-2L;
	Mon, 21 Jul 2025 11:11:08 +0000
Date: Mon, 21 Jul 2025 19:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v1 62/84]
 drivers/acpi/riscv/rimt.c:205:13: warning: 'rimt_pcie_rc_supports_ats'
 defined but not used
Message-ID: <202507211903.3DqExG1f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   98af6b96ffbc0a67f7b2e6d66b366fe05d008adf
commit: 6254ea40f25cf6194fdda5690897174e00e7a67f [62/84] ACPI: RISC-V: Add support for RIMT
config: riscv-randconfig-002-20250721 (https://download.01.org/0day-ci/archive/20250721/202507211903.3DqExG1f-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507211903.3DqExG1f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507211903.3DqExG1f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/riscv/rimt.c:380:12: warning: 'rimt_pci_iommu_init' defined but not used [-Wunused-function]
    static int rimt_pci_iommu_init(struct pci_dev *pdev, u16 alias, void *data)
               ^~~~~~~~~~~~~~~~~~~
   drivers/acpi/riscv/rimt.c:361:31: warning: 'rimt_node_map_platform_id' defined but not used [-Wunused-function]
    static struct acpi_rimt_node *rimt_node_map_platform_id(struct acpi_rimt_node *node, u32 *id_out,
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/acpi/riscv/rimt.c:205:13: warning: 'rimt_pcie_rc_supports_ats' defined but not used [-Wunused-function]
    static bool rimt_pcie_rc_supports_ats(struct acpi_rimt_node *node)
                ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rimt_pcie_rc_supports_ats +205 drivers/acpi/riscv/rimt.c

   204	
 > 205	static bool rimt_pcie_rc_supports_ats(struct acpi_rimt_node *node)
   206	{
   207		struct acpi_rimt_pcie_rc *pci_rc;
   208	
   209		pci_rc = (struct acpi_rimt_pcie_rc *)node->node_data;
   210		return pci_rc->flags & ACPI_RIMT_PCIE_ATS_SUPPORTED;
   211	}
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
