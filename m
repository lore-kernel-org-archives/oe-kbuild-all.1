Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3143F7C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 22:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683238316; x=1714774316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d38RqI6ffFYOumgwyQH6wr4X6+gNleJc05gEzBcOrTs=;
  b=CcSFh7pIsTVO4fli7NKoR4nDQvPnUv8mwCKVCAkvuUc139AfMrEoRaRr
   nOxt1bvuCjo+7yxYWPlLEpy9RVHyfSwMjcaaKMdZJYfteD47x8C/r3VrH
   sKhNa8WQLpv5gYxAR4TlLDrVrcY2TrCtAclyzA6VHN+h6eH2auTuOR1uS
   6Ew5SAsdg8JRoS+7x7EDr8WDeiJmXz5sXYpPXAFgLs1eImOfAmME6+pJb
   kQECCkwQ56C89FioULro1BvHzNsImpQ42C3L/MO87cvYSvOulA0mC6ZWF
   GhIsxakhgyGzE1Ay8fAD0f5+eIyfAaiRlBh8CrDE0I4G3M6jDMj/QJM/L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="333480608"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="333480608"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 15:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="821378759"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="821378759"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 May 2023 15:11:54 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puhB3-0000AS-1p;
	Thu, 04 May 2023 22:11:53 +0000
Date: Fri, 5 May 2023 06:11:27 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 12/28] drivers/cxl/core/cdat.c:63:5: error:
 conflicting types for 'cdat_dslbis_handler'; have 'int(union
 acpi_subtable_headers *, void *, const long unsigned int)'
Message-ID: <202305050627.88hmTJFj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   c09d294a320a41a687ff2881bc080bf7d9ee5ce2
commit: 4c76afc0e3d97ac9ed65e74d8969786602498153 [12/28] cxl: Add callback to parse the DSLBIS subtable from CDAT
config: microblaze-randconfig-r021-20230503 (https://download.01.org/0day-ci/archive/20230505/202305050627.88hmTJFj-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=4c76afc0e3d97ac9ed65e74d8969786602498153
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 4c76afc0e3d97ac9ed65e74d8969786602498153
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash drivers/cxl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050627.88hmTJFj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/cxl/cxl.h:10,
                    from drivers/cxl/cxlpci.h:7,
                    from drivers/cxl/core/cdat.c:4:
   include/linux/acpi.h:1529:17: error: unknown type name 'acpi_tbl_entry_handler_arg'; did you mean 'acpi_gbl_event_handler'?
    1529 |                 acpi_tbl_entry_handler_arg handler, void *arg,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 acpi_gbl_event_handler
   drivers/cxl/cxl.h:805:30: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
     805 | int cdat_dsmas_handler(union acpi_subtable_headers *header, void *arg,
         |                              ^~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/cxl.h:807:31: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
     807 | int cdat_dslbis_handler(union acpi_subtable_headers *header, void *arg,
         |                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/cdat.c:7:30: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
       7 | int cdat_dsmas_handler(union acpi_subtable_headers *header, void *arg,
         |                              ^~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/cdat.c:7:5: error: conflicting types for 'cdat_dsmas_handler'; have 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
       7 | int cdat_dsmas_handler(union acpi_subtable_headers *header, void *arg,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/cxl/cxl.h:805:5: note: previous declaration of 'cdat_dsmas_handler' with type 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
     805 | int cdat_dsmas_handler(union acpi_subtable_headers *header, void *arg,
         |     ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from drivers/cxl/cxlpci.h:5:
   drivers/cxl/core/cdat.c:34:22: error: conflicting types for 'cdat_dsmas_handler'; have 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
      34 | EXPORT_SYMBOL_NS_GPL(cdat_dsmas_handler, CXL);
         |                      ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:87:28: note: in definition of macro '___EXPORT_SYMBOL'
      87 |         extern typeof(sym) sym;                                                 \
         |                            ^~~
   include/linux/export.h:153:41: note: in expansion of macro '__EXPORT_SYMBOL'
     153 | #define EXPORT_SYMBOL_NS_GPL(sym, ns)   __EXPORT_SYMBOL(sym, "_gpl", __stringify(ns))
         |                                         ^~~~~~~~~~~~~~~
   drivers/cxl/core/cdat.c:34:1: note: in expansion of macro 'EXPORT_SYMBOL_NS_GPL'
      34 | EXPORT_SYMBOL_NS_GPL(cdat_dsmas_handler, CXL);
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/cxl/cxl.h:805:5: note: previous declaration of 'cdat_dsmas_handler' with type 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
     805 | int cdat_dsmas_handler(union acpi_subtable_headers *header, void *arg,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/cxl/core/cdat.c:63:31: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
      63 | int cdat_dslbis_handler(union acpi_subtable_headers *header, void *arg,
         |                               ^~~~~~~~~~~~~~~~~~~~~
>> drivers/cxl/core/cdat.c:63:5: error: conflicting types for 'cdat_dslbis_handler'; have 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
      63 | int cdat_dslbis_handler(union acpi_subtable_headers *header, void *arg,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/cxl.h:807:5: note: previous declaration of 'cdat_dslbis_handler' with type 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
     807 | int cdat_dslbis_handler(union acpi_subtable_headers *header, void *arg,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/cdat.c:105:22: error: conflicting types for 'cdat_dslbis_handler'; have 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
     105 | EXPORT_SYMBOL_NS_GPL(cdat_dslbis_handler, CXL);
         |                      ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:87:28: note: in definition of macro '___EXPORT_SYMBOL'
      87 |         extern typeof(sym) sym;                                                 \
         |                            ^~~
   include/linux/export.h:153:41: note: in expansion of macro '__EXPORT_SYMBOL'
     153 | #define EXPORT_SYMBOL_NS_GPL(sym, ns)   __EXPORT_SYMBOL(sym, "_gpl", __stringify(ns))
         |                                         ^~~~~~~~~~~~~~~
   drivers/cxl/core/cdat.c:105:1: note: in expansion of macro 'EXPORT_SYMBOL_NS_GPL'
     105 | EXPORT_SYMBOL_NS_GPL(cdat_dslbis_handler, CXL);
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/cxl/cxl.h:807:5: note: previous declaration of 'cdat_dslbis_handler' with type 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
     807 | int cdat_dslbis_handler(union acpi_subtable_headers *header, void *arg,
         |     ^~~~~~~~~~~~~~~~~~~


vim +63 drivers/cxl/core/cdat.c

    62	
  > 63	int cdat_dslbis_handler(union acpi_subtable_headers *header, void *arg,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
