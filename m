Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF818EDE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734796557; cv=none; b=m9u+JRl6A2CxuXkVitWD9V4fr7YQw8Hu9i4zj8GzFHcn7YEGye/qOwxpwlT27AINGiyEaa3NnLYPHOSo9d4nxcUP57xuXhrhBS4xfFvm0EuiPvrLErAw5OgEGVSnlkc0ypP9QIFkOuHiK5hxBUF/oMlnJMeSidEeZO2LgwL8nxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734796557; c=relaxed/simple;
	bh=lGAq2dRY6/kEshf+WtzHedJu8bcBkQsUpzn4DsgMl38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=At3mma1loX/GqAw5aImc9wGCLYoJW2tKD0DXedxlgwWUBqshjlqJZslOCHXZ4jEh6ba2R+HSttTvq7YdolJ2vA/fJUrTc7k8HV0AstOXqYwH3pvQO6u/Y2QrXbuyE63an20ViX8eFdB2+h4Z/sZ5BY8a+1sFZFAAmFv76HucPsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mop7GN1M; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mop7GN1M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734796555; x=1766332555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lGAq2dRY6/kEshf+WtzHedJu8bcBkQsUpzn4DsgMl38=;
  b=Mop7GN1MFc/UsaecdggoCkjd08uY1L0MtDkYXS9aMoY+3EmZy6uISYEH
   iUYmjLvxYAlif1Z7Oz8yJutRKXT7uh5boS8B81KkgkRlhk8vfBDetT66o
   dqFMiBiVnCAPgfCnE7UrcfQyl3/nKLnSWESXM0PtY2TqN8fZdEiL4NTUJ
   eW9CaxbhJWv5YMDkCAG1zRH8fe6NNhfh8QuvNx+Pqz2yb2rZqHgh7Js/5
   yPiK2ejdubKNHAv2kUK/wTLr6lRxqFcrNqvHI1ucip46JMXXWj5AoGgzo
   3OISJyLxhjA+Men9jaPP55lCcEos+Z5xVlL2xn88eFToctaoVOKbPIVVB
   w==;
X-CSE-ConnectionGUID: YxN6LLRiRpq+M2KLJyVbqA==
X-CSE-MsgGUID: /NXMobpOS3icpbFMLool4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="52727173"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="52727173"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 07:55:54 -0800
X-CSE-ConnectionGUID: TSJ+dsYwTtqz6YdwsK9Ing==
X-CSE-MsgGUID: 4l2N9mWtTzuVsXHP51UnAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129750717"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Dec 2024 07:55:53 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP1pX-0002Fw-1i;
	Sat, 21 Dec 2024 15:55:51 +0000
Date: Sat, 21 Dec 2024 23:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:acpi-eventlog 2/2]
 drivers/char/tpm/eventlog/tpm1.c:85:43: warning: pointer/integer type
 mismatch in conditional expression
Message-ID: <202412212337.PM1220gt-lkp@intel.com>
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
config: arc-randconfig-002-20241221 (https://download.01.org/0day-ci/archive/20241221/202412212337.PM1220gt-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412212337.PM1220gt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412212337.PM1220gt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/tpm/eventlog/tpm1.c: In function 'tpm1_bios_measurements_start':
   drivers/char/tpm/eventlog/tpm1.c:86:23: error: implicit declaration of function 'acpi_os_map_iomem'; did you mean 'acpi_os_read_iomem'? [-Werror=implicit-function-declaration]
      86 |                       acpi_os_map_iomem((unsigned long)log->bios_event_log, log_size);
         |                       ^~~~~~~~~~~~~~~~~
         |                       acpi_os_read_iomem
>> drivers/char/tpm/eventlog/tpm1.c:85:43: warning: pointer/integer type mismatch in conditional expression
      85 |                       log->bios_event_log :
         |                                           ^
   drivers/char/tpm/eventlog/tpm1.c: In function 'tpm1_bios_measurements_stop':
   drivers/char/tpm/eventlog/tpm1.c:157:17: error: implicit declaration of function 'acpi_os_unmap_iomem'; did you mean 'acpi_os_read_iomem'? [-Werror=implicit-function-declaration]
     157 |                 acpi_os_unmap_iomem(priv->start, priv->end - priv->start);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 acpi_os_read_iomem
   cc1: some warnings being treated as errors
--
   drivers/char/tpm/eventlog/tpm2.c: In function 'tpm2_bios_measurements_start':
   drivers/char/tpm/eventlog/tpm2.c:56:23: error: implicit declaration of function 'acpi_os_map_iomem'; did you mean 'acpi_os_read_iomem'? [-Werror=implicit-function-declaration]
      56 |                       acpi_os_map_iomem((unsigned long)log->bios_event_log, log_size);
         |                       ^~~~~~~~~~~~~~~~~
         |                       acpi_os_read_iomem
>> drivers/char/tpm/eventlog/tpm2.c:55:43: warning: pointer/integer type mismatch in conditional expression
      55 |                       log->bios_event_log :
         |                                           ^
   drivers/char/tpm/eventlog/tpm2.c: In function 'tpm2_bios_measurements_stop':
   drivers/char/tpm/eventlog/tpm2.c:138:17: error: implicit declaration of function 'acpi_os_unmap_iomem'; did you mean 'acpi_os_read_iomem'? [-Werror=implicit-function-declaration]
     138 |                 acpi_os_unmap_iomem(priv->start, priv->end - priv->start);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 acpi_os_read_iomem
   cc1: some warnings being treated as errors


vim +85 drivers/char/tpm/eventlog/tpm1.c

    68	
    69	/* returns pointer to start of pos. entry of tcg log */
    70	static void *tpm1_bios_measurements_start(struct seq_file *m, loff_t *pos)
    71	{
    72		struct tpm_measurements *priv = m->private;
    73		struct tpm_chip *chip = priv->chip;
    74		struct tpm_bios_log *log = &chip->log;
    75		struct tcpa_event *event;
    76		u32 converted_event_size;
    77		u32 converted_event_type;
    78		size_t log_size;
    79		void *addr;
    80		loff_t i;
    81	
    82		log_size = log->bios_event_log_end - log->bios_event_log;
    83	
    84		priv->start = !(chip->flags & TPM_CHIP_FLAG_ACPI_LOG) ?
  > 85			      log->bios_event_log :
  > 86			      acpi_os_map_iomem((unsigned long)log->bios_event_log, log_size);
    87		if (!priv->start)
    88			return NULL;
    89	
    90		priv->end = priv->start + log_size;
    91	
    92		addr = priv->start;
    93		i = 0;
    94	
    95		/* read over *pos measurements */
    96		do {
    97			event = addr;
    98	
    99			/* check if current entry is valid */
   100			if (addr + sizeof(struct tcpa_event) > priv->end)
   101				return NULL;
   102	
   103			converted_event_size =
   104			    do_endian_conversion(event->event_size);
   105			converted_event_type =
   106			    do_endian_conversion(event->event_type);
   107	
   108			if (((converted_event_type == 0) && (converted_event_size == 0))
   109			    || ((addr + sizeof(struct tcpa_event) + converted_event_size)
   110				> priv->end))
   111				return NULL;
   112	
   113			if (i++ == *pos)
   114				break;
   115	
   116			addr += (sizeof(struct tcpa_event) + converted_event_size);
   117		} while (1);
   118	
   119		return addr;
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
