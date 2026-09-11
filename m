Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40BB175A80
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 08:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115661; cv=none; b=BMPgOH9QIyCLeeC7uDv2rOAvhdL+SfLLJ6g8eUy+B3yZy8bI0ZMcuu0ZSSIfULPmbEJKoRfQjK1Ub8TS/2WDMKQFmY7nJ/DDmWvvb611cVDFexTnM53kmzbG6CxRQeVLhEGWUO+WcdpVwzSfKEnYXJ0rVT2e0TmAHpLqWLONLpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115661; c=relaxed/simple;
	bh=r+LX7F+hB5ZH0sOHjYyx8lzmw89JBy44YykxklEOAcw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f+Cc/OvTeiFAMTFW5BGPJQr1bDkACz6nb6mJcLzsQKn1XZ3TaGUH+YLxaa1BkmjX/ONTpe++abaSNpUHJaFH8SbFElaawcmTBBKhDTGXDw6j9322KsKBszVerkrzFy98CuEmT2mxh1hZsgqWb2sSLN8CkZ0/pmAm2jBBfrwF/SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iuyjr5R0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iuyjr5R0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789115659; x=1820651659;
  h=date:from:to:cc:subject:message-id;
  bh=r+LX7F+hB5ZH0sOHjYyx8lzmw89JBy44YykxklEOAcw=;
  b=Iuyjr5R0kBnJy7Md0+/yOULpOHPS1oV7Ginc6Fos+w/mcPKMm5wh5jwn
   Ww1dE6G0HEBShzbdBZ1f+kUqkPhmaBViCICMXsE5t5WyAq36Fy3z9RvIe
   tM8Ba0jQtMjMlcSoCWOOGhr0BSLU6h2HcmJkEefu6OIFyTzhy8JgSSCMo
   pFCTBKVxPW2PFh6RwY6HaRU9wmhqwLMqltZ02bZfYC+bP1El8SpdI1vCo
   HvrfbiP8jOwwEezZOTTUjj8g2TEIgnudWMUyfC3MG4khNBMwj/ZmqTVVr
   1LLl3PAsf+qPKlLm8yl/e147qpM0yx9aFPdB9kghEFxf0sX4IstT2DaHn
   Q==;
X-CSE-ConnectionGUID: jqlt0RzfRbCbtVxUP6vg/A==
X-CSE-MsgGUID: sXDxy3TcQry7l+6czUZVgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89341008"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89341008"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 01:34:18 -0700
X-CSE-ConnectionGUID: 4W3GzUYdTluIefVzohQVPA==
X-CSE-MsgGUID: DUat6XELQdqN//UHeGyoMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="268178465"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 11 Sep 2026 01:34:17 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4whu-000000001Ik-3B5T;
	Fri, 11 Sep 2026 08:34:04 +0000
Date: Fri, 11 Sep 2026 16:33:07 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:dev/acpi-static-table-gsi-deferral 8/13]
 drivers/acpi/arm64/mpam.c:85:41: error: use of undeclared identifier
 'trigger'
Message-ID: <202609111653.cAnJmuyt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/acpi-static-table-gsi-deferral
head:   57e5c004a108c62e38be743a8e66e3cae00ca521
commit: d4991c69f1ad2064dbc46273adf6b3774e36c482 [8/13] ACPI: ARM64: Convert static table devices to IRQs software-node properties
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260911/202609111653.cAnJmuyt-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 96295a1412f9afbee9d4a3c2701e83f5a529a9cc)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111653.cAnJmuyt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111653.cAnJmuyt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/arm64/mpam.c:85:41: error: use of undeclared identifier 'trigger'
      85 |         if (acpi_mpam_irq_valid(intid, flags, &trigger[irq_count])) {
         |                                                ^~~~~~~
   drivers/acpi/arm64/mpam.c:93:41: error: use of undeclared identifier 'trigger'
      93 |         if (acpi_mpam_irq_valid(intid, flags, &trigger[irq_count])) {
         |                                                ^~~~~~~
   drivers/acpi/arm64/mpam.c:105:13: error: use of undeclared identifier 'trigger'
     105 |                                                              trigger, irq_count);
         |                                                              ^~~~~~~
   3 errors generated.


vim +/trigger +85 drivers/acpi/arm64/mpam.c

    70	
    71	static void acpi_mpam_add_irq_props(struct acpi_mpam_msc_node *tbl_msc,
    72					    struct property_entry *props,
    73					    int *next_prop)
    74	{
    75		static const char * const irq_names[] = { "overflow", "error" };
    76		u32 gsi[ARRAY_SIZE(irq_names)];
    77		u32 triggering[ARRAY_SIZE(irq_names)];
    78		u32 polarity[ARRAY_SIZE(irq_names)];
    79		const char *names[ARRAY_SIZE(irq_names)];
    80		u32 flags, intid;
    81		int irq_count = 0;
    82	
    83		intid = tbl_msc->overflow_interrupt;
    84		flags = tbl_msc->overflow_interrupt_flags;
  > 85		if (acpi_mpam_irq_valid(intid, flags, &trigger[irq_count])) {
    86			gsi[irq_count] = intid;
    87			polarity[irq_count] = ACPI_ACTIVE_HIGH;
    88			names[irq_count++] = irq_names[0];
    89		}
    90	
    91		intid = tbl_msc->error_interrupt;
    92		flags = tbl_msc->error_interrupt_flags;
    93		if (acpi_mpam_irq_valid(intid, flags, &trigger[irq_count])) {
    94			gsi[irq_count] = intid;
    95			polarity[irq_count] = ACPI_ACTIVE_HIGH;
    96			names[irq_count++] = irq_names[1];
    97		}
    98	
    99		if (!irq_count)
   100			return;
   101	
   102		props[(*next_prop)++] = PROPERTY_ENTRY_U32_ARRAY_LEN(ACPI_IRQ_PROP_GSI,
   103								     gsi, irq_count);
   104		props[(*next_prop)++] = PROPERTY_ENTRY_U32_ARRAY_LEN(ACPI_IRQ_PROP_GSI_TRIGGER,
   105								     trigger, irq_count);
   106		props[(*next_prop)++] = PROPERTY_ENTRY_U32_ARRAY_LEN(ACPI_IRQ_PROP_GSI_POLARITY,
   107								     polarity, irq_count);
   108		props[(*next_prop)++] = PROPERTY_ENTRY_STRING_ARRAY_LEN("interrupt-names",
   109									names, irq_count);
   110	}
   111	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
