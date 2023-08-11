Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB5B1172E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 17:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691776132; x=1723312132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RcE+QvetIfM19v3rdiKEnNz7gyniGa1P4j5QnoW5UUs=;
  b=dLihIUSIFrPmy10sQJQAA49G59mRUPlLLJeLlNVHkVSWJUokcX3vyIDJ
   Bnclc9runYHxf8USykWupHgWcQnc0iwoPHY2g5pDfsQRQUVAu1FS8KzUn
   98AvB5V13YJEDUMywydoMwP/9uOUFuBPQEnOFKPyh5Xbk5xoV20bGkgV3
   YDp2g0VqDBiK5GlsJhhu92Xf7ZvuppJSOOI9bk5VKzhXpl/Wp1NNbsgT3
   jvaTasCUpeo6YS5DWXhob2W4BDfng7y8776fJUWUvdjrLFCbd5uPbESFu
   xcDTeFrg1QyF4oJ7n9zO8SUq9FZGPwGG9xEELkZGzyvdoxUASnPdUI2kJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438064555"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="438064555"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 10:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="979296955"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="979296955"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Aug 2023 10:48:46 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUWFi-0007uu-0j;
	Fri, 11 Aug 2023 17:48:46 +0000
Date: Sat, 12 Aug 2023 01:47:46 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 17/24] include/linux/acpi.h:241:19: error:
 conflicting types for 'acpi_table_parse_cedt'; have 'int(enum
 acpi_keyp_type,  int (*)(union acpi_subtable_headers *, void *, const long
 unsigned int), void *)'
Message-ID: <202308120107.ozNASHhc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   ee3a63e65f46140bcb484e3d0052d641abceb9da
commit: 7e72c9ad3fa55da9f48f56720b09f5e74e00dc92 [17/24] acpi: Add KEYP support to fw_table parsing
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20230812/202308120107.ozNASHhc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120107.ozNASHhc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120107.ozNASHhc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/acpi/tables.c:19:
>> include/linux/acpi.h:241:19: error: conflicting types for 'acpi_table_parse_cedt'; have 'int(enum acpi_keyp_type,  int (*)(union acpi_subtable_headers *, void *, const long unsigned int), void *)'
     241 | static inline int acpi_table_parse_cedt(enum acpi_keyp_type id,
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:233:1: note: previous declaration of 'acpi_table_parse_cedt' with type 'int(enum acpi_cedt_type,  int (*)(union acpi_subtable_headers *, void *, const long unsigned int), void *)'
     233 | acpi_table_parse_cedt(enum acpi_cedt_type id,
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/acpi/tables.c:279:1: error: conflicting types for 'acpi_table_parse_cedt'; have 'int(enum acpi_cedt_type,  int (*)(union acpi_subtable_headers *, void *, const long unsigned int), void *)'
     279 | acpi_table_parse_cedt(enum acpi_cedt_type id,
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:241:19: note: previous definition of 'acpi_table_parse_cedt' with type 'int(enum acpi_keyp_type,  int (*)(union acpi_subtable_headers *, void *, const long unsigned int), void *)'
     241 | static inline int acpi_table_parse_cedt(enum acpi_keyp_type id,
         |                   ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/acpi/osi.c:15:
>> include/linux/acpi.h:241:19: error: conflicting types for 'acpi_table_parse_cedt'; have 'int(enum acpi_keyp_type,  int (*)(union acpi_subtable_headers *, void *, const long unsigned int), void *)'
     241 | static inline int acpi_table_parse_cedt(enum acpi_keyp_type id,
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:233:1: note: previous declaration of 'acpi_table_parse_cedt' with type 'int(enum acpi_cedt_type,  int (*)(union acpi_subtable_headers *, void *, const long unsigned int), void *)'
     233 | acpi_table_parse_cedt(enum acpi_cedt_type id,
         | ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/acpi/osl.c:26:
>> include/linux/acpi.h:241:19: error: conflicting types for 'acpi_table_parse_cedt'; have 'int(enum acpi_keyp_type,  int (*)(union acpi_subtable_headers *, void *, const long unsigned int), void *)'
     241 | static inline int acpi_table_parse_cedt(enum acpi_keyp_type id,
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:233:1: note: previous declaration of 'acpi_table_parse_cedt' with type 'int(enum acpi_cedt_type,  int (*)(union acpi_subtable_headers *, void *, const long unsigned int), void *)'
     233 | acpi_table_parse_cedt(enum acpi_cedt_type id,
         | ^~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/osl.c: In function 'acpi_os_vprintf':
   drivers/acpi/osl.c:156:9: warning: function 'acpi_os_vprintf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     156 |         vsprintf(buffer, fmt, args);
         |         ^~~~~~~~


vim +241 include/linux/acpi.h

   221	
   222	int acpi_table_parse(char *id, acpi_tbl_table_handler handler);
   223	int __init_or_acpilib acpi_table_parse_entries(char *id,
   224			unsigned long table_size, int entry_id,
   225			acpi_tbl_entry_handler handler, unsigned int max_entries);
   226	int __init_or_acpilib acpi_table_parse_entries_array(char *id,
   227			unsigned long table_size, struct acpi_subtable_proc *proc,
   228			int proc_num, unsigned int max_entries);
   229	int acpi_table_parse_madt(enum acpi_madt_type id,
   230				  acpi_tbl_entry_handler handler,
   231				  unsigned int max_entries);
   232	int __init_or_acpilib
   233	acpi_table_parse_cedt(enum acpi_cedt_type id,
   234			      acpi_tbl_entry_handler_arg handler_arg, void *arg);
   235	
   236	#ifdef CONFIG_X86
   237	int __init_or_acpilib
   238	acpi_table_parse_keyp(enum acpi_keyp_type id,
   239			      acpi_tbl_entry_handler_arg handler_arg, void *arg);
   240	#else
 > 241	static inline int acpi_table_parse_cedt(enum acpi_keyp_type id,
   242						acpi_tbl_entry_handler_arg handler_arg,
   243						void *arg)
   244	{
   245		return -EOPNOTSUPP;
   246	}
   247	#endif
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
