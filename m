Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5592FC156
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 23:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683241377; x=1714777377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oVfaecn1g69oNvNIMgFkaZtdVcDXMKi5sn8sIA2294Y=;
  b=AO45mHPB4W2/pusmWNyLkznHRe++PyIDWGc8hIhDQDHMIBk256QcscIs
   ZwIb3mhv/Mi8EcB7Sa1wvJMLROz0JiMSLYGaeqNq0lnvbFa/EMh/fCXhR
   ijb/1GHb0RDIFM52D3aWhZ0GSrEVQxh+jm8DJ/cJTeS78NDITvsWF2PAq
   b6pt441RZyTYiz89WRRLK7saqg+cxJEgU3AnfRTzGV5l/MDMluVMOSrZZ
   XtAp/Oj4J4K8IupuZEKQN/Ur/IDvx9QktDE5gm0v6eGUEdG020EKK5TjS
   WxE7FKn3WHfkNXUyou9K03Em23GC1GLZU2ASYpBt50i9p2U1qp7Ydw63y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="412291192"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="412291192"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 16:02:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="700097623"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="700097623"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 May 2023 16:02:53 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puhyQ-0000Bc-0u;
	Thu, 04 May 2023 23:02:54 +0000
Date: Fri, 5 May 2023 07:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [djiang:cxl-qtg 13/28] drivers/cxl/core/cdat.c:107:5: error:
 conflicting types for 'cdat_sslbis_handler'; have 'int(union
 acpi_subtable_headers *, void *, const long unsigned int)'
Message-ID: <202305050602.o3fVijt6-lkp@intel.com>
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
commit: c5c3c6f048a7bcf9bb2b795d07af8687aa9b3b8f [13/28] cxl: Add callback to parse the SSLBIS subtable from CDAT
config: microblaze-randconfig-r021-20230503 (https://download.01.org/0day-ci/archive/20230505/202305050602.o3fVijt6-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=c5c3c6f048a7bcf9bb2b795d07af8687aa9b3b8f
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout c5c3c6f048a7bcf9bb2b795d07af8687aa9b3b8f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash drivers/cxl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050602.o3fVijt6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/cxl/cxl.h:10,
                    from drivers/cxl/cxlpci.h:7,
                    from drivers/cxl/core/cdat.c:4:
   include/linux/acpi.h:1529:17: error: unknown type name 'acpi_tbl_entry_handler_arg'; did you mean 'acpi_gbl_event_handler'?
    1529 |                 acpi_tbl_entry_handler_arg handler, void *arg,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 acpi_gbl_event_handler
   drivers/cxl/cxl.h:807:30: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
     807 | int cdat_dsmas_handler(union acpi_subtable_headers *header, void *arg,
         |                              ^~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/cxl.h:809:31: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
     809 | int cdat_dslbis_handler(union acpi_subtable_headers *header, void *arg,
         |                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/cxl.h:811:31: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
     811 | int cdat_sslbis_handler(union acpi_subtable_headers *header, void *arg,
         |                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/cdat.c:7:30: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
       7 | int cdat_dsmas_handler(union acpi_subtable_headers *header, void *arg,
         |                              ^~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/cdat.c:7:5: error: conflicting types for 'cdat_dsmas_handler'; have 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
       7 | int cdat_dsmas_handler(union acpi_subtable_headers *header, void *arg,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/cxl/cxl.h:807:5: note: previous declaration of 'cdat_dsmas_handler' with type 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
     807 | int cdat_dsmas_handler(union acpi_subtable_headers *header, void *arg,
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
   drivers/cxl/cxl.h:807:5: note: previous declaration of 'cdat_dsmas_handler' with type 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
     807 | int cdat_dsmas_handler(union acpi_subtable_headers *header, void *arg,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/cxl/core/cdat.c:63:31: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
      63 | int cdat_dslbis_handler(union acpi_subtable_headers *header, void *arg,
         |                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/cdat.c:63:5: error: conflicting types for 'cdat_dslbis_handler'; have 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
      63 | int cdat_dslbis_handler(union acpi_subtable_headers *header, void *arg,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/cxl.h:809:5: note: previous declaration of 'cdat_dslbis_handler' with type 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
     809 | int cdat_dslbis_handler(union acpi_subtable_headers *header, void *arg,
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
   drivers/cxl/cxl.h:809:5: note: previous declaration of 'cdat_dslbis_handler' with type 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
     809 | int cdat_dslbis_handler(union acpi_subtable_headers *header, void *arg,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/cdat.c:107:31: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
     107 | int cdat_sslbis_handler(union acpi_subtable_headers *header, void *arg,
         |                               ^~~~~~~~~~~~~~~~~~~~~
>> drivers/cxl/core/cdat.c:107:5: error: conflicting types for 'cdat_sslbis_handler'; have 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
     107 | int cdat_sslbis_handler(union acpi_subtable_headers *header, void *arg,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/cxl.h:811:5: note: previous declaration of 'cdat_sslbis_handler' with type 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
     811 | int cdat_sslbis_handler(union acpi_subtable_headers *header, void *arg,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/cdat.c:180:22: error: conflicting types for 'cdat_sslbis_handler'; have 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
     180 | EXPORT_SYMBOL_NS_GPL(cdat_sslbis_handler, CXL);
         |                      ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:87:28: note: in definition of macro '___EXPORT_SYMBOL'
      87 |         extern typeof(sym) sym;                                                 \
         |                            ^~~
   include/linux/export.h:153:41: note: in expansion of macro '__EXPORT_SYMBOL'
     153 | #define EXPORT_SYMBOL_NS_GPL(sym, ns)   __EXPORT_SYMBOL(sym, "_gpl", __stringify(ns))
         |                                         ^~~~~~~~~~~~~~~
   drivers/cxl/core/cdat.c:180:1: note: in expansion of macro 'EXPORT_SYMBOL_NS_GPL'
     180 | EXPORT_SYMBOL_NS_GPL(cdat_sslbis_handler, CXL);
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/cxl/cxl.h:811:5: note: previous declaration of 'cdat_sslbis_handler' with type 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
     811 | int cdat_sslbis_handler(union acpi_subtable_headers *header, void *arg,
         |     ^~~~~~~~~~~~~~~~~~~


vim +107 drivers/cxl/core/cdat.c

   106	
 > 107	int cdat_sslbis_handler(union acpi_subtable_headers *header, void *arg,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
