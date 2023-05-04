Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4687513AD8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 19:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683229513; x=1714765513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tqKDjyUMUAmX9qWU99hf/XsGjLeJwdBPqP/kudPAxcI=;
  b=EXZTciBiWiaKx1GnGa+7i0MBJUyr5THJgmOzuxwuFoRsmMXBE9JX/T8L
   hSB2Jfv6ph0rJYKc1G43EyKA3zgMSNyP7P+94xxQCMREMuym9/j037D7r
   Gc3ql5ecFoQHbBXRj/NXvKlzt4JwAKgTQA+g6bTb2ZKhp3hkmmuYQ7q3x
   d9ail/mo45iE3WZad3bpr1xVyRNRleBa6lQ99hMaVnLoPkNHxXhD4tcZv
   Dh65DDeYIFzjwgMzvnSCf9pgUcX2dkPecUocLEGyDfhCB8GFCwtte6CJj
   kvtBdF70FcJTCDeXrKgDrdLjhb/JiHpRMDiGGZYSPLq18b+yIqsX5vFft
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="349081964"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="349081964"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 12:44:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="871473233"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="871473233"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 May 2023 12:44:51 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puesk-000070-2B;
	Thu, 04 May 2023 19:44:50 +0000
Date: Fri, 5 May 2023 03:44:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 6/28] include/linux/acpi.h:1529:17: error: unknown
 type name 'acpi_tbl_entry_handler_arg'; did you mean
 'acpi_gbl_event_handler'?
Message-ID: <202305050308.fr63m8HD-lkp@intel.com>
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
commit: 3b181c164ce7143634146318f11b43524d5850bf [6/28] acpi: tables: Add CDAT table parsing support
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230505/202305050308.fr63m8HD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=3b181c164ce7143634146318f11b43524d5850bf
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 3b181c164ce7143634146318f11b43524d5850bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050308.fr63m8HD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/base/core.c:11:
>> include/linux/acpi.h:1529:17: error: unknown type name 'acpi_tbl_entry_handler_arg'; did you mean 'acpi_gbl_event_handler'?
    1529 |                 acpi_tbl_entry_handler_arg handler, void *arg,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 acpi_gbl_event_handler


vim +1529 include/linux/acpi.h

  1527	
  1528	int acpi_table_parse_cdat(enum acpi_cdat_type type,
> 1529			acpi_tbl_entry_handler_arg handler, void *arg,
  1530			struct acpi_table_cdat *table_header);
  1531	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
