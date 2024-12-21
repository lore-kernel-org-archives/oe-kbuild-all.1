Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CDB1CF8B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 23:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734824400; cv=none; b=KE9RvA4nzUP54l6XRSDRzsMny9BcN9tXJbMBNfm8Z/2+qI0nILyDP48oTQ+nuEI/WLfU+Q486SgnlTPOg/nElk3vDN22Fxz8UXQUNvKTAqajLIUx+sqvKNeBpTYLtD56TraN4v5IjRiUXMJT0DIxpPUUIxWkVR+C3cr9gVbUKuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734824400; c=relaxed/simple;
	bh=XO3vMGaQfH0DSUIsxYOjkHmFtfjpjpu9IybPgLOF8/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N09QFWgnANPaO5NcQqZ34/li6Sq3l13/94TuxXp2u12Tw03QIgB5Oqq0D2gcxMldSnLoLfMIszR01jwRTauoVXz1Ha9/BJbO9Rmb+WpDfmQ7sfbalUqxztasu+ogEXNhJ4+j3cJzQ0ZnWzHykeRGh7gWByPP4iAviwByIqq/IpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPcoiYCc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPcoiYCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734824398; x=1766360398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XO3vMGaQfH0DSUIsxYOjkHmFtfjpjpu9IybPgLOF8/E=;
  b=YPcoiYCcprSVi+e8YpWKVTzbB72xmyLESLEoaxzwfXt3FvZwUyMRXIiv
   bpemW8+1BAJF2LcRCGeb2SaNcu7VkhlrhBC36z5cMATfn4MqM5DysqdCb
   IcO8hKksW9SSj546q4rmrEAPdpMD31XS8EuNi6Wb6tqAxxHr/z6khSD4n
   xmkZXJyJ754IepelMHr28YNLwdZpcHNlaulEJF67LlC2OeRPn0LsmZ9ck
   bLXy9aTyZksfvrWemmJYmMwyjB5081VRUoUVV0wG8Bbm12ZipZUSZW6+y
   akr0A8j1O8OY0YHb+JR8ThSG8RYpYGshuvMiC6YdrkNm7uyBZM3bzX5ry
   g==;
X-CSE-ConnectionGUID: 9AXzQ5PYQqy9UPhc5ZJOmQ==
X-CSE-MsgGUID: MFu5bgnnRgKeFor2ZAIRrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35227783"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35227783"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 15:39:58 -0800
X-CSE-ConnectionGUID: +DQwRKNYTRS1kXOro3k9Wg==
X-CSE-MsgGUID: 9yAlAd1mQN2a+xOK1q3Nog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122141122"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Dec 2024 15:39:57 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP94c-0002ZK-1y;
	Sat, 21 Dec 2024 23:39:54 +0000
Date: Sun, 22 Dec 2024 07:38:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:acpi-eventlog 2/2]
 drivers/char/tpm/eventlog/tpm1.c:86:23: error: implicit declaration of
 function 'acpi_os_map_iomem'; did you mean 'acpi_os_read_iomem'?
Message-ID: <202412220711.wxquexJJ-lkp@intel.com>
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
config: nios2-randconfig-r071-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220711.wxquexJJ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220711.wxquexJJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220711.wxquexJJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/tpm/eventlog/tpm1.c: In function 'tpm1_bios_measurements_start':
>> drivers/char/tpm/eventlog/tpm1.c:86:23: error: implicit declaration of function 'acpi_os_map_iomem'; did you mean 'acpi_os_read_iomem'? [-Wimplicit-function-declaration]
      86 |                       acpi_os_map_iomem((unsigned long)log->bios_event_log, log_size);
         |                       ^~~~~~~~~~~~~~~~~
         |                       acpi_os_read_iomem
>> drivers/char/tpm/eventlog/tpm1.c:85:43: error: pointer/integer type mismatch in conditional expression [-Wint-conversion]
      85 |                       log->bios_event_log :
         |                                           ^
   drivers/char/tpm/eventlog/tpm1.c: In function 'tpm1_bios_measurements_stop':
>> drivers/char/tpm/eventlog/tpm1.c:157:17: error: implicit declaration of function 'acpi_os_unmap_iomem'; did you mean 'acpi_os_read_iomem'? [-Wimplicit-function-declaration]
     157 |                 acpi_os_unmap_iomem(priv->start, priv->end - priv->start);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 acpi_os_read_iomem
--
   drivers/char/tpm/eventlog/tpm2.c: In function 'tpm2_bios_measurements_start':
>> drivers/char/tpm/eventlog/tpm2.c:56:23: error: implicit declaration of function 'acpi_os_map_iomem'; did you mean 'acpi_os_read_iomem'? [-Wimplicit-function-declaration]
      56 |                       acpi_os_map_iomem((unsigned long)log->bios_event_log, log_size);
         |                       ^~~~~~~~~~~~~~~~~
         |                       acpi_os_read_iomem
>> drivers/char/tpm/eventlog/tpm2.c:55:43: error: pointer/integer type mismatch in conditional expression [-Wint-conversion]
      55 |                       log->bios_event_log :
         |                                           ^
   drivers/char/tpm/eventlog/tpm2.c: In function 'tpm2_bios_measurements_stop':
>> drivers/char/tpm/eventlog/tpm2.c:138:17: error: implicit declaration of function 'acpi_os_unmap_iomem'; did you mean 'acpi_os_read_iomem'? [-Wimplicit-function-declaration]
     138 |                 acpi_os_unmap_iomem(priv->start, priv->end - priv->start);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 acpi_os_read_iomem


vim +86 drivers/char/tpm/eventlog/tpm1.c

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
   122	static void *tpm1_bios_measurements_next(struct seq_file *m, void *v,
   123						loff_t *pos)
   124	{
   125		struct tpm_measurements *priv = m->private;
   126		struct tcpa_event *event = v;
   127		u32 converted_event_size;
   128		u32 converted_event_type;
   129	
   130		(*pos)++;
   131		converted_event_size = do_endian_conversion(event->event_size);
   132	
   133		v += sizeof(struct tcpa_event) + converted_event_size;
   134	
   135		/* now check if current entry is valid */
   136		if ((v + sizeof(struct tcpa_event)) > priv->end)
   137			return NULL;
   138	
   139		event = v;
   140	
   141		converted_event_size = do_endian_conversion(event->event_size);
   142		converted_event_type = do_endian_conversion(event->event_type);
   143	
   144		if (((converted_event_type == 0) && (converted_event_size == 0)) ||
   145		    ((v + sizeof(struct tcpa_event) + converted_event_size) > priv->end))
   146			return NULL;
   147	
   148		return v;
   149	}
   150	
   151	static void tpm1_bios_measurements_stop(struct seq_file *m, void *v)
   152	{
   153		struct tpm_measurements *priv = m->private;
   154		struct tpm_chip *chip = priv->chip;
   155	
   156		if (!!(chip->flags & TPM_CHIP_FLAG_ACPI_LOG))
 > 157			acpi_os_unmap_iomem(priv->start, priv->end - priv->start);
   158	}
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
