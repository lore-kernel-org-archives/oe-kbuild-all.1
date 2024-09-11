Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDD82A1A4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 03:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726025309; cv=none; b=VVfXxoSXrjlH2/rdn60cRl6JP5nJGM4SuGKeFizb1Gwu/1vybcs2n2rDpDJJnFJCA7nTliyHMajJYg0tYFZQJzqpW2/uh2LnJ1OAH5hnemV5P//g5xn2hgeOuz2/im3Z4FrL8tzFQiqKwztfvDVJFFP7gTQycxFzMTLL4DREkrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726025309; c=relaxed/simple;
	bh=iD5FXzG8IAO6mOV+TK/wMI7QeSOS77tLb60AiZvrGwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J9OXZYG5TKS2O5oYyqai0Cf0HudH2DM1wlLB4k+yxWpsZeEMi+dNh8H+wtPSkERm9HU1h58ocFTtyereZwermVUv8EOixts4EGPROs8YwB73kTmUndfuuJvTg525vwJC/WncWtksIa4XZrMlU7EHU+kThHzVSwP9dlSUzy+MT9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SoI/fi4A; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SoI/fi4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726025307; x=1757561307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iD5FXzG8IAO6mOV+TK/wMI7QeSOS77tLb60AiZvrGwc=;
  b=SoI/fi4AmggSSZv8zFxGqr8jU9gkccPVz7xRTzxs1kf1nozVw4PJfTSX
   9ddPQGE6M/+Uy5ZsOxH5wOdE+23q282G+Q/kSTWnIHcDpSfkXERblukwk
   VT2Ybazkd2kDCnEs99AbE+bCBe84+Lps1wQyjRxpahNkbtr6YOcFQSjrD
   oO0lqlQKZT3kafSTrC3bMqyTJhlLiI6sQEfCln/DcYzuoCtKtGIMLvCHs
   6jgnvi2tRIfVcpyDh6ljxzRJqjbnsbuj1Uc/BCtmEPIxHvo5HHWiQKxFl
   Orz5SP2cLP4k8YIklgkDMpUZnD47O1iFvoXrsgsz42F7aGx8Ol9z+2/3B
   A==;
X-CSE-ConnectionGUID: +G/UmdEFQw+uUNma8u8M+w==
X-CSE-MsgGUID: EXH1ApC5QR25hqARgPB4fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24624136"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="24624136"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 20:28:26 -0700
X-CSE-ConnectionGUID: OZZpQ9QxQ0KnsAH7dW6lbw==
X-CSE-MsgGUID: A+10c/t8RsmxAHsA9JyD/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="66941561"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Sep 2024 20:28:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soE1m-000302-2m;
	Wed, 11 Sep 2024 03:28:22 +0000
Date: Wed, 11 Sep 2024 11:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:gtmb_rfc_poc 2/2] drivers/irqchip/irq-acpi-gtmb.c:392:46:
 warning: ordered comparison of pointer with integer zero
Message-ID: <202409111120.FhQsPaVF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux gtmb_rfc_poc
head:   d975d1fc71375296874c62007464dd2a87b861af
commit: d975d1fc71375296874c62007464dd2a87b861af [2/2] drivers/irqchip: Add GTMB driver for GSI based ACPI devices
config: riscv-randconfig-002-20240911 (https://download.01.org/0day-ci/archive/20240911/202409111120.FhQsPaVF-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111120.FhQsPaVF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111120.FhQsPaVF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from arch/riscv/include/asm/cmpxchg.h:9,
                    from arch/riscv/include/asm/barrier.h:14,
                    from include/linux/list.h:11,
                    from include/linux/resource_ext.h:9,
                    from include/linux/acpi.h:13,
                    from drivers/irqchip/irq-acpi-gtmb.c:7:
   drivers/irqchip/irq-acpi-gtmb.c: In function 'gtmb_parse_package_resource':
   include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 2 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:538:9: note: in expansion of macro 'printk'
     538 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:538:16: note: in expansion of macro 'KERN_INFO'
     538 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/irqchip/irq-acpi-gtmb.c:355:17: note: in expansion of macro 'pr_info'
     355 |                 pr_info("Registered GSI %d\n", res->gsino);
         |                 ^~~~~~~
   drivers/irqchip/irq-acpi-gtmb.c: In function 'gtmb_parse_gsi_base_range':
>> drivers/irqchip/irq-acpi-gtmb.c:392:46: warning: ordered comparison of pointer with integer zero [-Wextra]
     392 |         if (ACPI_FAILURE(status) || num_gsis <= 0) {
         |                                              ^~


vim +392 drivers/irqchip/irq-acpi-gtmb.c

   369	
   370	static acpi_status gtmb_parse_gsi_base_range(acpi_handle handle,
   371						     u64 *gbase, u64 *num_gsis)
   372	{
   373		acpi_status status;
   374	
   375		if (!acpi_has_method(handle, "_GMA")) {
   376			acpi_handle_err(handle, "_GMA method not found\n");
   377			return AE_ERROR;
   378		}
   379	
   380		if (!acpi_has_method(handle, "_GSB")) {
   381			acpi_handle_err(handle, "_GSB method not found\n");
   382			return AE_ERROR;
   383		}
   384	
   385		status = acpi_evaluate_integer(handle, "_GSB", NULL, gbase);
   386		if (ACPI_FAILURE(status)) {
   387			acpi_handle_err(handle, "failed to evaluate _GSB method\n");
   388			return status;
   389		}
   390	
   391		status = acpi_evaluate_integer(handle, "_NGI", NULL, num_gsis);
 > 392		if (ACPI_FAILURE(status) || num_gsis <= 0) {
   393			acpi_handle_err(handle, "Number of GSIs is not valid\n");
   394			return status;
   395		}
   396	
   397		return AE_OK;
   398	}
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
