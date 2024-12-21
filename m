Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BC31632C5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 18:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734807397; cv=none; b=Z1CC5X0yUjtLGfWkit1wAD9SNmr8FiHyttWBmm9JhQeGKdyA10/9tY5sCx9tTt8/KnyQHAaXrBEy3wawOhefQLIE70EqEkbBTY+9sisP2pAEcx5vlT9Now29rjpiCvnVRVyRlvIg1/WcTgXjhBAj8HDAJfIx5p8zfHOh+0vWGpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734807397; c=relaxed/simple;
	bh=DNK9GTkzlSsp6ONAooJikobaloFL4WS154tynAKolaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AI6l5S31nvUVuPcNUVgCCwHPh3NTqOheJvsiX31K/fcIF0SDSd1exqmRrRjV6U9nCmoJXia4O3BN2qOe1HzMowpFwC1V6Mk5G7pVgzf2M1fFxj/C+rZ+3Y9eoxEQIEvU6qlLBrpN1Chmd7KKteEsgzMzjNhYJEGWOWXeJJUEEJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WEoQ8cQj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEoQ8cQj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734807395; x=1766343395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DNK9GTkzlSsp6ONAooJikobaloFL4WS154tynAKolaQ=;
  b=WEoQ8cQj1CvDFbXhVnLeQy4AFhW6Xwkrn2GVsHIV1NlALNo3VjcyFeSi
   pj+je1xgVn5nmVyYyhAPgjJBNroz2ijk+Af56o4dydJpu9UQGUu+I5IHw
   3dhwN92gdVjry+yK/jeWNLINj0rjxK3U7+AqD8yIpNeMzYhy8viIBBd6E
   vWzWOe2JnT3IRSTCYo+3nxqlh3H0lark0fnQk5xQpHiecr1e6UlCsBU56
   /aViGABjnogpxBC/qUqkAeuMurCy/5ccU8Lekf2BtciMwtvzyK4sS0IFn
   3h3DKBcGnCe82/xU7Hw5wJ6QUl1HPRc8cF92Kd9dvohG3Q88alO69ZrfW
   A==;
X-CSE-ConnectionGUID: LEfV0lLpSTOyaC2PtLnGSQ==
X-CSE-MsgGUID: TFpftlSDRmuZyJAQlfx+Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35211674"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35211674"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 10:56:35 -0800
X-CSE-ConnectionGUID: Mzp/u/3qT6OvglQOiPAruA==
X-CSE-MsgGUID: 61or4RTjQniO6rg0xizglw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="99339683"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Dec 2024 10:56:33 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP4eN-0002Pn-1L;
	Sat, 21 Dec 2024 18:56:31 +0000
Date: Sun, 22 Dec 2024 02:56:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:acpi-eventlog 2/2]
 drivers/char/tpm/eventlog/tpm2.c:56:9: error: call to undeclared function
 'acpi_os_map_iomem'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202412220224.JBqTM1u6-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-003-20241222 (https://download.01.org/0day-ci/archive/20241222/202412220224.JBqTM1u6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220224.JBqTM1u6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220224.JBqTM1u6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/char/tpm/eventlog/tpm2.c:15:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/char/tpm/eventlog/tpm2.c:21:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> drivers/char/tpm/eventlog/tpm2.c:56:9: error: call to undeclared function 'acpi_os_map_iomem'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      56 |                       acpi_os_map_iomem((unsigned long)log->bios_event_log, log_size);
         |                       ^
   drivers/char/tpm/eventlog/tpm2.c:56:9: note: did you mean 'acpi_os_read_iomem'?
   include/acpi/acpiosxf.h:277:5: note: 'acpi_os_read_iomem' declared here
     277 | int acpi_os_read_iomem(void __iomem *virt_addr, u64 *value, u32 width);
         |     ^
>> drivers/char/tpm/eventlog/tpm2.c:54:56: warning: pointer/integer type mismatch in conditional expression ('void *' and 'int') [-Wconditional-type-mismatch]
      54 |         priv->start = !(chip->flags & TPM_CHIP_FLAG_ACPI_LOG) ?
         |                                                               ^
      55 |                       log->bios_event_log :
         |                       ~~~~~~~~~~~~~~~~~~~
      56 |                       acpi_os_map_iomem((unsigned long)log->bios_event_log, log_size);
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/char/tpm/eventlog/tpm2.c:138:3: error: call to undeclared function 'acpi_os_unmap_iomem'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     138 |                 acpi_os_unmap_iomem(priv->start, priv->end - priv->start);
         |                 ^
   drivers/char/tpm/eventlog/tpm2.c:138:3: note: did you mean 'acpi_os_read_iomem'?
   include/acpi/acpiosxf.h:277:5: note: 'acpi_os_read_iomem' declared here
     277 | int acpi_os_read_iomem(void __iomem *virt_addr, u64 *value, u32 width);
         |     ^
   3 warnings and 2 errors generated.
--
   In file included from drivers/char/tpm/eventlog/tpm1.c:21:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/char/tpm/eventlog/tpm1.c:24:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> drivers/char/tpm/eventlog/tpm1.c:83:9: error: call to undeclared function 'acpi_os_map_iomem'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      83 |                       acpi_os_map_iomem((unsigned long)log->bios_event_log, log_size);
         |                       ^
   drivers/char/tpm/eventlog/tpm1.c:83:9: note: did you mean 'acpi_os_read_iomem'?
   include/acpi/acpiosxf.h:277:5: note: 'acpi_os_read_iomem' declared here
     277 | int acpi_os_read_iomem(void __iomem *virt_addr, u64 *value, u32 width);
         |     ^
>> drivers/char/tpm/eventlog/tpm1.c:81:56: warning: pointer/integer type mismatch in conditional expression ('void *' and 'int') [-Wconditional-type-mismatch]
      81 |         priv->start = !(chip->flags & TPM_CHIP_FLAG_ACPI_LOG) ?
         |                                                               ^
      82 |                       log->bios_event_log :
         |                       ~~~~~~~~~~~~~~~~~~~
      83 |                       acpi_os_map_iomem((unsigned long)log->bios_event_log, log_size);
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/char/tpm/eventlog/tpm1.c:152:3: error: call to undeclared function 'acpi_os_unmap_iomem'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     152 |                 acpi_os_unmap_iomem(priv->start, priv->end - priv->start);
         |                 ^
   drivers/char/tpm/eventlog/tpm1.c:152:3: note: did you mean 'acpi_os_read_iomem'?
   include/acpi/acpiosxf.h:277:5: note: 'acpi_os_read_iomem' declared here
     277 | int acpi_os_read_iomem(void __iomem *virt_addr, u64 *value, u32 width);
         |     ^
   3 warnings and 2 errors generated.


vim +/acpi_os_map_iomem +56 drivers/char/tpm/eventlog/tpm2.c

    40	
    41	static void *tpm2_bios_measurements_start(struct seq_file *m, loff_t *pos)
    42	{
    43		struct tpm_measurements *priv = m->private;
    44		struct tpm_chip *chip = priv->chip;
    45		struct tpm_bios_log *log = &chip->log;
    46		struct tcg_pcr_event *event_header;
    47		struct tcg_pcr_event2_head *event;
    48		size_t size, log_size;
    49		void *addr;
    50		int i;
    51	
    52		log_size = log->bios_event_log_end - log->bios_event_log;
    53	
  > 54		priv->start = !(chip->flags & TPM_CHIP_FLAG_ACPI_LOG) ?
    55			      log->bios_event_log :
  > 56			      acpi_os_map_iomem((unsigned long)log->bios_event_log, log_size);
    57		if (!priv->start)
    58			return NULL;
    59	
    60		priv->end = priv->start + log_size;
    61	
    62		addr = priv->start;
    63		event_header = addr;
    64		size = struct_size(event_header, event, event_header->event_size);
    65	
    66		if (*pos == 0) {
    67			if (addr + size < priv->end) {
    68				if ((event_header->event_type == 0) &&
    69				    (event_header->event_size == 0))
    70					return NULL;
    71				return SEQ_START_TOKEN;
    72			}
    73		}
    74	
    75		if (*pos > 0) {
    76			addr += size;
    77			event = addr;
    78			size = calc_tpm2_event_size(event, event_header);
    79			if ((addr + size >= priv->end) || !size)
    80				return NULL;
    81		}
    82	
    83		for (i = 0; i < (*pos - 1); i++) {
    84			event = addr;
    85			size = calc_tpm2_event_size(event, event_header);
    86	
    87			if ((addr + size >= priv->end) || !size)
    88				return NULL;
    89			addr += size;
    90		}
    91	
    92		return addr;
    93	}
    94	
    95	static void *tpm2_bios_measurements_next(struct seq_file *m, void *v,
    96						 loff_t *pos)
    97	{
    98		struct tcg_pcr_event *event_header;
    99		struct tcg_pcr_event2_head *event;
   100		struct tpm_measurements *priv = m->private;
   101		size_t event_size;
   102		void *marker;
   103	
   104		(*pos)++;
   105		event_header = priv->start;
   106	
   107		if (v == SEQ_START_TOKEN) {
   108			event_size = struct_size(event_header, event,
   109						 event_header->event_size);
   110			marker = event_header;
   111		} else {
   112			event = v;
   113			event_size = calc_tpm2_event_size(event, event_header);
   114			if (event_size == 0)
   115				return NULL;
   116			marker = event;
   117		}
   118	
   119		marker = marker + event_size;
   120		if (marker >= priv->end)
   121			return NULL;
   122		v = marker;
   123		event = v;
   124	
   125		event_size = calc_tpm2_event_size(event, event_header);
   126		if (((v + event_size) >= priv->end) || !event_size)
   127			return NULL;
   128	
   129		return v;
   130	}
   131	
   132	static void tpm2_bios_measurements_stop(struct seq_file *m, void *v)
   133	{
   134		struct tpm_measurements *priv = m->private;
   135		struct tpm_chip *chip = priv->chip;
   136	
   137		if (!!(chip->flags & TPM_CHIP_FLAG_ACPI_LOG))
 > 138			acpi_os_unmap_iomem(priv->start, priv->end - priv->start);
   139	}
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
