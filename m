Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2131620125F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 19:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753556718; cv=none; b=MFN1BWPxx9SkuEYD/HiK8G+VegzXhK5UiAfWG6HTC4A+nmPDJjrr85988yEC/pbll413xHQGoBwOLoxxGWT4blqlF6oWkK1kL7g4ISIyQi6yNVX4kJyFkBSUwtX2V55ESj6xDUVGFrpiPVUlRq8L4yVktAGYESa9d+QM1sE1eO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753556718; c=relaxed/simple;
	bh=r+VUYW4/vbLkGrvOexw8Gg7sEhVW2FiGGxjltNUh2PE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jfo+VWSahf0BYHeptmCeE3RAhUWqPbYfIujwTNMgVckbNTTR/n/K/TnPD5oQ3a/oH0uLU2KzQneSAZpnetvLFfx9IYL2Douc0fGxlEvY52fa0eMvI4tnhYI5TrfObF+Xz3vtjZXSvVUOlXQGOalZgN777Y9mtuOtiukwZ3IW1Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhlwZcDd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhlwZcDd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753556716; x=1785092716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r+VUYW4/vbLkGrvOexw8Gg7sEhVW2FiGGxjltNUh2PE=;
  b=KhlwZcDdJDEptCeF55g3zJsC/Av5mfienCuvFODf/8/V1u7WH34at5eU
   RxaYYZZaJfW4/r7dOmYQ/N+dPvvKeocq4Nm+iz4Pdp6G07leg6wwEM2gj
   YISLkySUKsK8jp3B1S0pOE9qGENEZ72LLtHpPMdOGvgSV9DF2nPSGcePJ
   E/FV/Ee8UKSduR/uF00ETmKOFyFPNO6fhBeMWjN10W7GJVseaDfsAFGhe
   /EsC/ald/hDYXtM7Z6ruxb6+0JHQLxf6Cz4Rt8Q0u3FbJXu45tEKSPHIx
   O7JWX4SzP0IdxPV6KPXNy7UNH9hkslRan4bl0urRUat8ViKwP1+7hMhgU
   Q==;
X-CSE-ConnectionGUID: mAJ2GYuXSDuLc/sTXoSFkA==
X-CSE-MsgGUID: V2dgON1+S3SmhUrQIzXZ2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56008084"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="56008084"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 12:05:16 -0700
X-CSE-ConnectionGUID: qSPxcdbdTh6SF2w1NiLrgQ==
X-CSE-MsgGUID: 4ZnXwD3NSfWKa1FmIq4qHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166213025"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Jul 2025 12:05:14 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufkCm-000MDL-0E;
	Sat, 26 Jul 2025 19:05:12 +0000
Date: Sun, 27 Jul 2025 03:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12136/12319] drivers/firmware/dmi_scan.c:692:
 undefined reference to `efi'
Message-ID: <202507270258.neWuiXLd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7af19298454ed155f5cf67201a70f5cf836c842
commit: 1ad483981776ff67e2b37bb6951412e608c55adb [12136/12319] init.h: Disable sanitizer coverage for __init and __head
config: x86_64-randconfig-077-20250726 (https://download.01.org/0day-ci/archive/20250727/202507270258.neWuiXLd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507270258.neWuiXLd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507270258.neWuiXLd-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `setup_arch':
   arch/x86/kernel/setup.c:987: undefined reference to `efi_init'
   ld: arch/x86/kernel/setup.c:971: undefined reference to `efi_memblock_x86_reserve_range'
   ld: vmlinux.o: in function `ms_hyperv_init_platform':
   arch/x86/kernel/cpu/mshyperv.c:496: undefined reference to `isolation_type_tdx'
   ld: arch/x86/kernel/cpu/mshyperv.c:494: undefined reference to `isolation_type_snp'
   ld: vmlinux.o: in function `acpi_os_get_root_pointer':
   drivers/acpi/osl.c:210: undefined reference to `efi'
   ld: drivers/acpi/osl.c:210: undefined reference to `efi'
   ld: drivers/acpi/osl.c:212: undefined reference to `efi'
   ld: drivers/acpi/osl.c:212: undefined reference to `efi'
   ld: vmlinux.o: in function `dmi_scan_machine':
>> drivers/firmware/dmi_scan.c:692: undefined reference to `efi'
   ld: vmlinux.o:drivers/firmware/dmi_scan.c:692: more undefined references to `efi' follow


vim +692 drivers/firmware/dmi_scan.c

fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  672  
0fca08122eaf5c drivers/firmware/dmi_scan.c Robert Richter     2019-03-28  673  static void __init dmi_scan_machine(void)
3ed3bce846abc7 arch/i386/kernel/dmi_scan.c Matt Domsch        2006-03-26  674  {
3ed3bce846abc7 arch/i386/kernel/dmi_scan.c Matt Domsch        2006-03-26  675  	char __iomem *p, *q;
79bae42d51a5d4 drivers/firmware/dmi_scan.c Ben Hutchings      2013-04-30  676  	char buf[32];
3ed3bce846abc7 arch/i386/kernel/dmi_scan.c Matt Domsch        2006-03-26  677  
83e68189745ad9 drivers/firmware/dmi_scan.c Matt Fleming       2012-11-14  678  	if (efi_enabled(EFI_CONFIG_TABLES)) {
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  679  		/*
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  680  		 * According to the DMTF SMBIOS reference spec v3.0.0, it is
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  681  		 * allowed to define both the 64-bit entry point (smbios3) and
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  682  		 * the 32-bit entry point (smbios), in which case they should
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  683  		 * either both point to the same SMBIOS structure table, or the
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  684  		 * table pointed to by the 64-bit entry point should contain a
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  685  		 * superset of the table contents pointed to by the 32-bit entry
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  686  		 * point (section 5.2)
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  687  		 * This implies that the 64-bit entry point should have
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  688  		 * precedence if it is defined and supported by the OS. If we
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  689  		 * have the 64-bit entry point, but fail to decode it, fall
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  690  		 * back to the legacy one (if available)
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  691  		 */
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14 @692  		if (efi.smbios3 != EFI_INVALID_TABLE_ADDR) {
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  693  			p = dmi_early_remap(efi.smbios3, 32);
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  694  			if (p == NULL)
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  695  				goto error;
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  696  			memcpy_fromio(buf, p, 32);
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  697  			dmi_early_unmap(p, 32);
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  698  
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  699  			if (!dmi_smbios3_present(buf)) {
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  700  				dmi_available = 1;
7117794feb1602 drivers/firmware/dmi_scan.c Jean Delvare       2018-02-03  701  				return;
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  702  			}
fc43026278b23b drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-10-14  703  		}
b2c99e3c70d77f arch/i386/kernel/dmi_scan.c Bjorn Helgaas      2006-03-26  704  		if (efi.smbios == EFI_INVALID_TABLE_ADDR)
9a22b6e76ba75f drivers/firmware/dmi_scan.c Ingo Molnar        2008-09-18  705  			goto error;
3ed3bce846abc7 arch/i386/kernel/dmi_scan.c Matt Domsch        2006-03-26  706  
3ed3bce846abc7 arch/i386/kernel/dmi_scan.c Matt Domsch        2006-03-26  707  		/* This is called as a core_initcall() because it isn't
3ed3bce846abc7 arch/i386/kernel/dmi_scan.c Matt Domsch        2006-03-26  708  		 * needed during early boot.  This also means we can
3ed3bce846abc7 arch/i386/kernel/dmi_scan.c Matt Domsch        2006-03-26  709  		 * iounmap the space when we're done with it.
3ed3bce846abc7 arch/i386/kernel/dmi_scan.c Matt Domsch        2006-03-26  710  		 */
cf0744021c5d5d drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-01-23  711  		p = dmi_early_remap(efi.smbios, 32);
3ed3bce846abc7 arch/i386/kernel/dmi_scan.c Matt Domsch        2006-03-26  712  		if (p == NULL)
9a22b6e76ba75f drivers/firmware/dmi_scan.c Ingo Molnar        2008-09-18  713  			goto error;
79bae42d51a5d4 drivers/firmware/dmi_scan.c Ben Hutchings      2013-04-30  714  		memcpy_fromio(buf, p, 32);
cf0744021c5d5d drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-01-23  715  		dmi_early_unmap(p, 32);
79bae42d51a5d4 drivers/firmware/dmi_scan.c Ben Hutchings      2013-04-30  716  
79bae42d51a5d4 drivers/firmware/dmi_scan.c Ben Hutchings      2013-04-30  717  		if (!dmi_present(buf)) {
4f5c791a850e53 drivers/firmware/dmi_scan.c Lennart Poettering 2007-05-08  718  			dmi_available = 1;
7117794feb1602 drivers/firmware/dmi_scan.c Jean Delvare       2018-02-03  719  			return;
^1da177e4c3f41 arch/i386/kernel/dmi_scan.c Linus Torvalds     2005-04-16  720  		}
cf0744021c5d5d drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-01-23  721  	} else if (IS_ENABLED(CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK)) {
3da27a4eb8c214 drivers/firmware/dmi_scan.c Tiezhu Yang        2020-02-05  722  		p = dmi_early_remap(SMBIOS_ENTRY_POINT_SCAN_START, 0x10000);
3ed3bce846abc7 arch/i386/kernel/dmi_scan.c Matt Domsch        2006-03-26  723  		if (p == NULL)
9a22b6e76ba75f drivers/firmware/dmi_scan.c Ingo Molnar        2008-09-18  724  			goto error;
^1da177e4c3f41 arch/i386/kernel/dmi_scan.c Linus Torvalds     2005-04-16  725  
c9aba14362a6ee drivers/firmware/dmi_scan.c Jean Delvare       2017-06-15  726  		/*
c9aba14362a6ee drivers/firmware/dmi_scan.c Jean Delvare       2017-06-15  727  		 * Same logic as above, look for a 64-bit entry point
c9aba14362a6ee drivers/firmware/dmi_scan.c Jean Delvare       2017-06-15  728  		 * first, and if not found, fall back to 32-bit entry point.
c9aba14362a6ee drivers/firmware/dmi_scan.c Jean Delvare       2017-06-15  729  		 */
c9aba14362a6ee drivers/firmware/dmi_scan.c Jean Delvare       2017-06-15  730  		memcpy_fromio(buf, p, 16);
c9aba14362a6ee drivers/firmware/dmi_scan.c Jean Delvare       2017-06-15  731  		for (q = p + 16; q < p + 0x10000; q += 16) {
c9aba14362a6ee drivers/firmware/dmi_scan.c Jean Delvare       2017-06-15  732  			memcpy_fromio(buf + 16, q, 16);
c9aba14362a6ee drivers/firmware/dmi_scan.c Jean Delvare       2017-06-15  733  			if (!dmi_smbios3_present(buf)) {
c9aba14362a6ee drivers/firmware/dmi_scan.c Jean Delvare       2017-06-15  734  				dmi_available = 1;
c9aba14362a6ee drivers/firmware/dmi_scan.c Jean Delvare       2017-06-15  735  				dmi_early_unmap(p, 0x10000);
7117794feb1602 drivers/firmware/dmi_scan.c Jean Delvare       2018-02-03  736  				return;
c9aba14362a6ee drivers/firmware/dmi_scan.c Jean Delvare       2017-06-15  737  			}
c9aba14362a6ee drivers/firmware/dmi_scan.c Jean Delvare       2017-06-15  738  			memcpy(buf, buf + 16, 16);
c9aba14362a6ee drivers/firmware/dmi_scan.c Jean Delvare       2017-06-15  739  		}
c9aba14362a6ee drivers/firmware/dmi_scan.c Jean Delvare       2017-06-15  740  
d39de28c95876f drivers/firmware/dmi_scan.c Ben Hutchings      2013-07-31  741  		/*
d39de28c95876f drivers/firmware/dmi_scan.c Ben Hutchings      2013-07-31  742  		 * Iterate over all possible DMI header addresses q.
d39de28c95876f drivers/firmware/dmi_scan.c Ben Hutchings      2013-07-31  743  		 * Maintain the 32 bytes around q in buf.  On the
d39de28c95876f drivers/firmware/dmi_scan.c Ben Hutchings      2013-07-31  744  		 * first iteration, substitute zero for the
d39de28c95876f drivers/firmware/dmi_scan.c Ben Hutchings      2013-07-31  745  		 * out-of-range bytes so there is no chance of falsely
d39de28c95876f drivers/firmware/dmi_scan.c Ben Hutchings      2013-07-31  746  		 * detecting an SMBIOS header.
d39de28c95876f drivers/firmware/dmi_scan.c Ben Hutchings      2013-07-31  747  		 */
79bae42d51a5d4 drivers/firmware/dmi_scan.c Ben Hutchings      2013-04-30  748  		memset(buf, 0, 16);
3ed3bce846abc7 arch/i386/kernel/dmi_scan.c Matt Domsch        2006-03-26  749  		for (q = p; q < p + 0x10000; q += 16) {
79bae42d51a5d4 drivers/firmware/dmi_scan.c Ben Hutchings      2013-04-30  750  			memcpy_fromio(buf + 16, q, 16);
c9aba14362a6ee drivers/firmware/dmi_scan.c Jean Delvare       2017-06-15  751  			if (!dmi_present(buf)) {
4f5c791a850e53 drivers/firmware/dmi_scan.c Lennart Poettering 2007-05-08  752  				dmi_available = 1;
cf0744021c5d5d drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-01-23  753  				dmi_early_unmap(p, 0x10000);
7117794feb1602 drivers/firmware/dmi_scan.c Jean Delvare       2018-02-03  754  				return;
3ed3bce846abc7 arch/i386/kernel/dmi_scan.c Matt Domsch        2006-03-26  755  			}
79bae42d51a5d4 drivers/firmware/dmi_scan.c Ben Hutchings      2013-04-30  756  			memcpy(buf, buf + 16, 16);
3ed3bce846abc7 arch/i386/kernel/dmi_scan.c Matt Domsch        2006-03-26  757  		}
cf0744021c5d5d drivers/firmware/dmi_scan.c Ard Biesheuvel     2014-01-23  758  		dmi_early_unmap(p, 0x10000);
4f5c791a850e53 drivers/firmware/dmi_scan.c Lennart Poettering 2007-05-08  759  	}
9a22b6e76ba75f drivers/firmware/dmi_scan.c Ingo Molnar        2008-09-18  760   error:
02d9c47f1bf230 drivers/firmware/dmi_scan.c Jean Delvare       2013-09-11  761  	pr_info("DMI not present or invalid.\n");
3ed3bce846abc7 arch/i386/kernel/dmi_scan.c Matt Domsch        2006-03-26  762  }
^1da177e4c3f41 arch/i386/kernel/dmi_scan.c Linus Torvalds     2005-04-16  763  

:::::: The code at line 692 was first introduced by commit
:::::: fc43026278b23b3515cf8f909ec29df94b3ae1a2 dmi: add support for SMBIOS 3.0 64-bit entry point

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Ard Biesheuvel <ard.biesheuvel@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
