Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC101C32
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 16:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734797883; cv=none; b=kDD0Bc2k7FyX4osv/661sm7Zg1xb6P3qbLBfcZQMauzd6SrDrsZ643GwsKCIsz698dFUSXoldlQiawcdvsStlxs0N55owoKwcZwfOXudrdYQPdF49x71eMg9U8QERrMeCTMmE4Mx+IIRc7pKp5C7Gp9QUkUsKJ493ArXSPlJgkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734797883; c=relaxed/simple;
	bh=1Ck1N+UQKn/AIjX6/EjyhwcsQo2sFw7U2UFacg+6/ko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mqUMIeZl/gKHRk1SYkab+qw4cFtOyViPGnczgD7oF29IYTgZ/Q53PeP8UoZ44C6j/EE+5BXr8R/FLBQwq/iH+PicN3P8dh8o/7gPWbkYqpBE7oOz73/2dgHi3g5E8pG9zf2m5illyDBkIvh+cbZtlovAe27xOSQcFRl532Og6Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LRlotjF2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LRlotjF2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734797880; x=1766333880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Ck1N+UQKn/AIjX6/EjyhwcsQo2sFw7U2UFacg+6/ko=;
  b=LRlotjF2TAiVzylmlKZUeU4Qx3UwWmocL0BIDImMOdStYgf+TB8ikCgn
   MUPNgMbQOtB+4qkmmJWqIZdJgQE2MpXZ5lD65xZAswkKFULGri0p2gT4T
   0G70v+5XFv8I2sDLQLTSMDC8K5fR6Z3liUpCDExIpcAEIf+XstZ8B8IUx
   O1zLyrQQuhnqum43MeGEfilyjV/F+29C4X0IWl7YUmkr6MpZAK88VS8ec
   GXHlsm0HTppX/w+nDB52arCDSf2kHiOIoUraJa5di0a5FZ75KKVWTQ77E
   C9Ks+Ln1PL7FGfLpSNcFhdzwl2XiuxyIchWLRCX63l452pRjdHe5GlYm4
   g==;
X-CSE-ConnectionGUID: 44zvTptvQoyyRrjtyK3Zmw==
X-CSE-MsgGUID: n2n4lX+fTLSD71ZltLnukw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35216233"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="35216233"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 08:17:58 -0800
X-CSE-ConnectionGUID: bZa9gxjQTPOKi/iVrxKjUw==
X-CSE-MsgGUID: qcNpN78zSkK/IpB1ICxb0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136136181"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Dec 2024 08:17:57 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP2As-0002HL-2F;
	Sat, 21 Dec 2024 16:17:54 +0000
Date: Sun, 22 Dec 2024 00:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:acpi-eventlog 2/2]
 drivers/char/tpm/eventlog/acpi.c:143:36: warning: cast to pointer from
 integer of different size
Message-ID: <202412220045.JiYFGySj-lkp@intel.com>
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
commit: 46db0c077ebbc9000a11bb537a9087bee9140a4f [2/2] tpm: Map the ACPI provided event log
config: i386-buildonly-randconfig-001-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220045.JiYFGySj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220045.JiYFGySj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220045.JiYFGySj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/tpm/eventlog/acpi.c: In function 'tpm_read_log_acpi':
>> drivers/char/tpm/eventlog/acpi.c:143:36: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     143 |         chip->log.bios_event_log = (void *)start;
         |                                    ^
   drivers/char/tpm/eventlog/acpi.c:144:40: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     144 |         chip->log.bios_event_log_end = (void *)start + len;
         |                                        ^


vim +143 drivers/char/tpm/eventlog/acpi.c

    42	
    43	/*
    44	 * Find out the physical address range for the event log from TCPA and TPM2
    45	 * ACPI tables. If successful, sets TPM_CHIP_FLAG_ACPI_LOG. Also,
    46	 * chip->bios_event_log and chip->bios_event_log_end will end up containing
    47	 * physical address range, rather than virtual. This range must be mapped
    48	 * with acpi_os_map_iomem().
    49	 */
    50	int tpm_read_log_acpi(struct tpm_chip *chip)
    51	{
    52		u8 event_buf[sizeof(struct tcg_pcr_event) +
    53			     sizeof(struct tcg_efi_specid_event_head)];
    54		struct tcg_pcr_event *event = (struct tcg_pcr_event *)event_buf;
    55		struct tcg_efi_specid_event_head *efispecid =
    56			(struct tcg_efi_specid_event_head *)event->event;
    57		struct acpi_tcpa *buff;
    58		acpi_status status;
    59		void __iomem *virt;
    60		u64 len, start;
    61		struct acpi_table_tpm2 *tbl;
    62		struct acpi_tpm2_phy *tpm2_phy;
    63		int format;
    64	
    65		/*
    66		 * Unfortuntely ACPI does not associate the event log with a specific
    67		 * TPM, like PPI. Thus all ACPI TPMs will read the same log.
    68		 */
    69		if (!chip->acpi_dev_handle)
    70			return -ENODEV;
    71	
    72		if (chip->flags & TPM_CHIP_FLAG_TPM2) {
    73			status = acpi_get_table("TPM2", 1,
    74						(struct acpi_table_header **)&tbl);
    75			if (ACPI_FAILURE(status))
    76				return -ENODEV;
    77	
    78			if (tbl->header.length <
    79					sizeof(*tbl) + sizeof(struct acpi_tpm2_phy)) {
    80				acpi_put_table((struct acpi_table_header *)tbl);
    81				return -ENODEV;
    82			}
    83	
    84			tpm2_phy = (void *)tbl + sizeof(*tbl);
    85			len = tpm2_phy->log_area_minimum_length;
    86	
    87			start = tpm2_phy->log_area_start_address;
    88			if (!start || !len) {
    89				acpi_put_table((struct acpi_table_header *)tbl);
    90				return -ENODEV;
    91			}
    92	
    93			acpi_put_table((struct acpi_table_header *)tbl);
    94			format = EFI_TCG2_EVENT_LOG_FORMAT_TCG_2;
    95		} else {
    96			/* Find TCPA entry in RSDT (ACPI_LOGICAL_ADDRESSING) */
    97			status = acpi_get_table(ACPI_SIG_TCPA, 1,
    98						(struct acpi_table_header **)&buff);
    99			if (ACPI_FAILURE(status))
   100				return -ENODEV;
   101	
   102			switch (buff->platform_class) {
   103			case BIOS_SERVER:
   104				len = buff->server.log_max_len;
   105				start = buff->server.log_start_addr;
   106				break;
   107			case BIOS_CLIENT:
   108			default:
   109				len = buff->client.log_max_len;
   110				start = buff->client.log_start_addr;
   111				break;
   112			}
   113	
   114			acpi_put_table((struct acpi_table_header *)buff);
   115			format = EFI_TCG2_EVENT_LOG_FORMAT_TCG_1_2;
   116		}
   117	
   118		if (!len) {
   119			dev_warn(&chip->dev, "%s: event log is empty\n", __func__);
   120			return -EIO;
   121		}
   122	
   123		if (chip->flags & TPM_CHIP_FLAG_TPM2) {
   124			if (len < sizeof(event_buf)) {
   125				dev_warn(&chip->dev, "%s: event log is too small\n", __func__);
   126				return -EIO;
   127			}
   128	
   129			virt = acpi_os_map_iomem(start, len);
   130			if (!virt) {
   131				dev_err(&chip->dev, "%s: event log mapping failed\n", __func__);
   132				return -EIO;
   133			}
   134			memcpy(event_buf, virt, sizeof(event_buf));
   135			acpi_os_unmap_iomem(virt, len);
   136	
   137			if (memcmp(efispecid->signature, TCG_SPECID_SIG, sizeof(TCG_SPECID_SIG)) != 0) {
   138				dev_err(&chip->dev, "%s: event log is corrupted\n", __func__);
   139				return -EIO;
   140			}
   141		}
   142	
 > 143		chip->log.bios_event_log = (void *)start;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
