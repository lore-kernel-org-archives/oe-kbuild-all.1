Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAF813F43A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Dec 2024 06:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734936511; cv=none; b=rPfBAo2GDh5VAretcsyG/furggASVezKPeNQSMU0Wt8wHp8FwxtdxGKGWjkAY52PMWparmztNvBObV0Ra26H7DE8DwveGAYA1EgSYRToxhAK1YnerkwbmZ5wPASbmxJ2g/g1O0dsvirM/C0nv0eOWL9pHgb8gDbBBePxBDnrK9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734936511; c=relaxed/simple;
	bh=nrW31WH/YnDUFnGigwNH0dVQaQ0R9rX8N61yz7+CHFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EwCUH0WNDAM6ORpt4B3aFtK3YHLmHNt+jJ3mXgtT4lKbxBNPcPDWCjPs903zu1rI0T/EtR98NBSm7AdGTcJzObJ2Edsg6/MuMmnx1hp9YkXjKv9WUlvd+4mEN6gWfjxPlFLDrOui/pOp9DgaRdWthJLkQ1cY5WSwwVuAXkG6NeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFsTOVvM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFsTOVvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734936508; x=1766472508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nrW31WH/YnDUFnGigwNH0dVQaQ0R9rX8N61yz7+CHFI=;
  b=PFsTOVvMeU0QowmSwkQDLj31N6wAb+/JHDC3ZDqpCvtME65hgTGxE2vd
   tRNQEMQDwNIIWLWkY1R7nACrxozaZ2vRvSUHx/vXwNOQcPJcojCderSGs
   XxGs6nnO/mTYpl5IcQUbQi5yk1+wBJJlKTakeofISnV6H0PAaAz6ZFf+q
   RLvvAIDuPPKc9SqVkCZ7gU3jSFfFzOTNOhfFUzQCDFh7Vsslf0oRgTJuB
   Z14O4Q0zqg7vIcar1InGVmgXQlw9D8g0SgixB7vBaJDnUoexxbTRNuwfm
   OklEdWsBq4zHgCpwB2DIc4WxQCpi8POML0/9f9EFxJs8bCnWkOC/9KHmx
   w==;
X-CSE-ConnectionGUID: x3G0gXtoTdOICPI3saQBzQ==
X-CSE-MsgGUID: tcAJHQ7JQLyqpd/VIWAJWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="46773380"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="46773380"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 22:48:26 -0800
X-CSE-ConnectionGUID: d8ATqBWXR9m3E34ksVI7hg==
X-CSE-MsgGUID: Zjkav2qeTTCLlepYIA2/iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="98942898"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2024 22:48:26 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPcEq-0003SB-0I;
	Mon, 23 Dec 2024 06:48:24 +0000
Date: Mon, 23 Dec 2024 14:47:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:acpi-eventlog 2/2]
 drivers/char/tpm/eventlog/common.h:28:37: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202412231443.LivouUCH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git acpi-eventlog
head:   27a5cdcbbd6c35ff30f7350887c7f0a2cf261667
commit: 27a5cdcbbd6c35ff30f7350887c7f0a2cf261667 [2/2] tpm: Map the ACPI provided event log
config: i386-randconfig-r131-20241223 (https://download.01.org/0day-ci/archive/20241223/202412231443.LivouUCH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412231443.LivouUCH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412231443.LivouUCH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/char/tpm/eventlog/tpm1.c:147:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *virt @@     got void *start @@
   drivers/char/tpm/eventlog/tpm1.c:147:41: sparse:     expected void [noderef] __iomem *virt
   drivers/char/tpm/eventlog/tpm1.c:147:41: sparse:     got void *start
   drivers/char/tpm/eventlog/tpm1.c: note: in included file:
>> drivers/char/tpm/eventlog/common.h:28:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *start @@     got void [noderef] __iomem * @@
   drivers/char/tpm/eventlog/common.h:28:37: sparse:     expected void *start
   drivers/char/tpm/eventlog/common.h:28:37: sparse:     got void [noderef] __iomem *
--
   drivers/char/tpm/eventlog/tpm2.c:131:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *virt @@     got void *start @@
   drivers/char/tpm/eventlog/tpm2.c:131:41: sparse:     expected void [noderef] __iomem *virt
   drivers/char/tpm/eventlog/tpm2.c:131:41: sparse:     got void *start
   drivers/char/tpm/eventlog/tpm2.c: note: in included file:
>> drivers/char/tpm/eventlog/common.h:28:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *start @@     got void [noderef] __iomem * @@
   drivers/char/tpm/eventlog/common.h:28:37: sparse:     expected void *start
   drivers/char/tpm/eventlog/common.h:28:37: sparse:     got void [noderef] __iomem *

vim +28 drivers/char/tpm/eventlog/common.h

    16	
    17	static inline bool tpm_measurements_map(struct tpm_measurements *measurements)
    18	{
    19		struct tpm_chip *chip = measurements->chip;
    20		struct tpm_bios_log *log = &chip->log;
    21		size_t size;
    22	
    23		size = log->bios_event_log_end - log->bios_event_log;
    24		measurements->start = log->bios_event_log;
    25	
    26	#ifdef CONFIG_ACPI
    27		if (chip->flags & TPM_CHIP_FLAG_ACPI_LOG)
  > 28			measurements->start = acpi_os_map_iomem((unsigned long)log->bios_event_log, size);
    29	#endif
    30	
    31		if (!measurements->start)
    32			return false;
    33	
    34		measurements->end = measurements->start + size;
    35		return true;
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
