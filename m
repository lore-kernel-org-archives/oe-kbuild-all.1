Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90721567D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 08:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734855042; cv=none; b=jAAckBm5uf+qRB8LfiIg7t25H7xtD86G9m/ObaPF+77UsB7fwJZQO3CZkQecminOWbisvkNIqakspixBhaqx3jT8xEcAEG7uBU4a9Xxf7kGmxzNDDIGcJ4v5eNkQz1hDQSvjDm7w8/io+kn/6fhWLdNECKuVUIEO2NhNWcRuTYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734855042; c=relaxed/simple;
	bh=vsMctAOIgQQw2DnwqAa2OxYmEaKEIYr0RKNQb5p/zjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ki4rgrNy47ldXk4opzlruiVk3EGggUmXjhd6Xnx5OeE86f1Ng7XSa4QKla9N57uy+tyz+WtELbXIjo6WxXn1Bejy5sIc6hbuZHhVE4sqc0N5MUQ5l++pLf7g5y4dTK0fillI02A8j6Aj9RzsF2Xk38az45l/NJ2E5tHGoYxEx+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fj4niMt1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fj4niMt1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734855040; x=1766391040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vsMctAOIgQQw2DnwqAa2OxYmEaKEIYr0RKNQb5p/zjY=;
  b=Fj4niMt1LH4yfmhEdRRw7t/jNsYs7zpCuM72fjj3iGzA96/dhfecbXG8
   IilNwUl44CD23dND4d1BlFpjNn2/uVInNZjyP0B9vDRut1lD3J8u2cgZ6
   yqdcF5J6+5Lladg8JdtccGST1oXdc4etsNzi06NK2dcFTqo52579oD/o+
   kMszKQLswlrYjcv2x6qtdejzTiX2SYH1sVDhFLzjVGMFk0mqDOmZSNzvd
   G1kQJUyPZ5GA27eDjQyFS9oHVK5Oqvf2xQjchkiSo5dZI6apEbIGACOek
   lffKK49yCjSAaedjbpbTWn7oFNwe9KDpGc8isJcGZJvTSNXlACQ4Y+elI
   g==;
X-CSE-ConnectionGUID: jD6ZsrsgRUWc6T4UPhGfRQ==
X-CSE-MsgGUID: R4v+GR5ERSGmUtr0lreYJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="46355206"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="46355206"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 00:10:40 -0800
X-CSE-ConnectionGUID: SXlAqQZrSl2e3z8ycnCUUg==
X-CSE-MsgGUID: 2I/Wx7pUT363LPfD2ee4Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98689891"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Dec 2024 00:10:38 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPH2q-0002nj-2i;
	Sun, 22 Dec 2024 08:10:36 +0000
Date: Sun, 22 Dec 2024 16:09:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:acpi-eventlog 2/2]
 drivers/char/tpm/eventlog/acpi.c:140:66: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202412221619.dx85VqBy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git acpi-eventlog
head:   047467e092bf4bb854fd7cb73ac0d69d663c5f8a
commit: 047467e092bf4bb854fd7cb73ac0d69d663c5f8a [2/2] tpm: Map the ACPI provided event log
config: x86_64-randconfig-123-20241222 (https://download.01.org/0day-ci/archive/20241222/202412221619.dx85VqBy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221619.dx85VqBy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221619.dx85VqBy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/char/tpm/eventlog/acpi.c:140:66: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *bios_event_log @@     got void [noderef] __iomem *[assigned] virt @@
   drivers/char/tpm/eventlog/acpi.c:140:66: sparse:     expected void *bios_event_log
   drivers/char/tpm/eventlog/acpi.c:140:66: sparse:     got void [noderef] __iomem *[assigned] virt
--
>> drivers/char/tpm/eventlog/tpm1.c:81:63: sparse: sparse: incompatible types in conditional expression (different address spaces):
   drivers/char/tpm/eventlog/tpm1.c:81:63: sparse:    void *
   drivers/char/tpm/eventlog/tpm1.c:81:63: sparse:    void [noderef] __iomem *
>> drivers/char/tpm/eventlog/tpm1.c:152:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *virt @@     got void *start @@
   drivers/char/tpm/eventlog/tpm1.c:152:41: sparse:     expected void [noderef] __iomem *virt
   drivers/char/tpm/eventlog/tpm1.c:152:41: sparse:     got void *start
--
>> drivers/char/tpm/eventlog/tpm2.c:54:63: sparse: sparse: incompatible types in conditional expression (different address spaces):
   drivers/char/tpm/eventlog/tpm2.c:54:63: sparse:    void *
   drivers/char/tpm/eventlog/tpm2.c:54:63: sparse:    void [noderef] __iomem *
>> drivers/char/tpm/eventlog/tpm2.c:138:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *virt @@     got void *start @@
   drivers/char/tpm/eventlog/tpm2.c:138:41: sparse:     expected void [noderef] __iomem *virt
   drivers/char/tpm/eventlog/tpm2.c:138:41: sparse:     got void *start

vim +140 drivers/char/tpm/eventlog/acpi.c

    63	
    64	/* read binary bios log */
    65	int tpm_read_log_acpi(struct tpm_chip *chip)
    66	{
    67		struct acpi_tcpa *buff;
    68		acpi_status status;
    69		void __iomem *virt;
    70		u64 len, start;
    71		struct acpi_table_tpm2 *tbl;
    72		struct acpi_tpm2_phy *tpm2_phy;
    73		int format;
    74		int ret;
    75	
    76		/* Unfortuntely ACPI does not associate the event log with a specific
    77		 * TPM, like PPI. Thus all ACPI TPMs will read the same log.
    78		 */
    79		if (!chip->acpi_dev_handle)
    80			return -ENODEV;
    81	
    82		if (chip->flags & TPM_CHIP_FLAG_TPM2) {
    83			status = acpi_get_table("TPM2", 1,
    84						(struct acpi_table_header **)&tbl);
    85			if (ACPI_FAILURE(status))
    86				return -ENODEV;
    87	
    88			if (tbl->header.length <
    89					sizeof(*tbl) + sizeof(struct acpi_tpm2_phy)) {
    90				acpi_put_table((struct acpi_table_header *)tbl);
    91				return -ENODEV;
    92			}
    93	
    94			tpm2_phy = (void *)tbl + sizeof(*tbl);
    95			len = tpm2_phy->log_area_minimum_length;
    96	
    97			start = tpm2_phy->log_area_start_address;
    98			if (!start || !len) {
    99				acpi_put_table((struct acpi_table_header *)tbl);
   100				return -ENODEV;
   101			}
   102	
   103			acpi_put_table((struct acpi_table_header *)tbl);
   104			format = EFI_TCG2_EVENT_LOG_FORMAT_TCG_2;
   105		} else {
   106			/* Find TCPA entry in RSDT (ACPI_LOGICAL_ADDRESSING) */
   107			status = acpi_get_table(ACPI_SIG_TCPA, 1,
   108						(struct acpi_table_header **)&buff);
   109			if (ACPI_FAILURE(status))
   110				return -ENODEV;
   111	
   112			switch (buff->platform_class) {
   113			case BIOS_SERVER:
   114				len = buff->server.log_max_len;
   115				start = buff->server.log_start_addr;
   116				break;
   117			case BIOS_CLIENT:
   118			default:
   119				len = buff->client.log_max_len;
   120				start = buff->client.log_start_addr;
   121				break;
   122			}
   123	
   124			acpi_put_table((struct acpi_table_header *)buff);
   125			format = EFI_TCG2_EVENT_LOG_FORMAT_TCG_1_2;
   126		}
   127	
   128		if (!len) {
   129			dev_warn(&chip->dev, "%s: TCPA log area empty\n", __func__);
   130			return -EIO;
   131		}
   132	
   133		virt = acpi_os_map_iomem(start, len);
   134		if (!virt) {
   135			dev_warn(&chip->dev, "%s: Failed to map ACPI memory\n", __func__);
   136			/* try EFI log next */
   137			return -ENODEV;
   138		}
   139	
 > 140		if (chip->flags & TPM_CHIP_FLAG_TPM2 && !tpm_is_tpm2_log(virt, len)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
