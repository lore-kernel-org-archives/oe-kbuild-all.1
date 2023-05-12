Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E71C7E9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 02:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683860075; x=1715396075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/zrpidZ7DsPHRYsbz+6SbitnUulho2mcxyqOby9U20=;
  b=hVB/Zv/1MgFMb9zphkgjxo4gxIntwDW0q/YimhBGXhaUGEKQBGui0NIo
   DtiahOUmJYpw6q8PX7odkDb9MLspYrvCFAQP07XHFzuq6OaSotYk3TXgv
   zkSecshZRRjhjqJfG6TGJfxKjj3Z+To+gwhaQz4mihPzfZZgzlUsuQYcy
   Y0Hqhbvx/GKlaz0DWTAwJiqYwbTiQrKJPIy08Gmg2lJ3GWmF32sZsmy9Q
   IBec1Zb15qCNHkncaDBQHAfdSY7KOVxM8msRAcJZ2h/uZTWUiXXJ9ViZL
   yJtFLkDKGmLGZ5RGFi4+mwGv5UdJ0AmdMHTLppXH5AsDjRmBCOObrcTgO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="335204909"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="335204909"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 19:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="732851117"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="732851117"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 May 2023 19:54:34 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxIvR-0004Ri-3A;
	Fri, 12 May 2023 02:54:33 +0000
Date: Fri, 12 May 2023 10:53:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 17/30] include/linux/acpi.h:1538:23: error: expected
 '=', ',', ';', 'asm' or '__attribute__' before 'acpi_parse_entries_array'
Message-ID: <202305121010.bI8za0xi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   fd35584ec7147f575dcdc65239bc8ac7fe340ab4
commit: 65164ecadb8fb6b57020aa130f6fe63885384021 [17/30] cxl: Add callback to parse the DSMAS subtables from CDAT
config: arm64-randconfig-r015-20230511 (https://download.01.org/0day-ci/archive/20230512/202305121010.bI8za0xi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=65164ecadb8fb6b57020aa130f6fe63885384021
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 65164ecadb8fb6b57020aa130f6fe63885384021
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121010.bI8za0xi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:10:
>> include/linux/acpi.h:1538:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'acpi_parse_entries_array'
    1538 | int __init_or_acpilib acpi_parse_entries_array(
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:1544:27: error: unknown type name 'acpi_tbl_entry_handler_arg'; did you mean 'acpi_gbl_event_handler'?
    1544 |                           acpi_tbl_entry_handler_arg handler, void *arg,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           acpi_gbl_event_handler
   make[2]: *** [scripts/Makefile.build:114: arch/arm64/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1538 include/linux/acpi.h

7847a1455fc457 Heikki Krogerus 2018-11-09  1536  
216b67abb7e235 Dave Jiang      2023-05-11  1537  #ifdef CONFIG_ACPI_TABLES_LIB
216b67abb7e235 Dave Jiang      2023-05-11 @1538  int __init_or_acpilib acpi_parse_entries_array(
216b67abb7e235 Dave Jiang      2023-05-11  1539  	char *id, unsigned long table_size,
216b67abb7e235 Dave Jiang      2023-05-11  1540  	struct acpi_table_header *table_header, struct acpi_subtable_proc *proc,
216b67abb7e235 Dave Jiang      2023-05-11  1541  	int proc_num, unsigned int max_entries);
7d709841b48071 Dave Jiang      2023-04-25  1542  

:::::: The code at line 1538 was first introduced by commit
:::::: 216b67abb7e235c9a13ddf78f428cccf11a089f4 acpi: move common tables helper functions to common lib

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Dave Jiang <dave.jiang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
