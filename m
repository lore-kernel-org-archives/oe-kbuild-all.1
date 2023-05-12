Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086F07E9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 02:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683859175; x=1715395175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SFEfOKOPtMqt4ZZvfcogexjfYWdT3ZHNJuNOlFMQbS4=;
  b=P9e00QOaKaHbIZ3FAJaHgkGLO0psphq87zskwG540LlXd2FH13RHSatz
   895g2E5VVy6Da/J9ZEYuDVnMhFQn2Y0ww9/l9Jg557Wc72G0woez7fbbq
   7bMzAXBkI/t9Mjpgyl2VemWHnhpG8IFNuRSJwRin1rKbRU9ZqnfhWs0Cv
   28P+Tns1ItczevmzhqDF4plZbAPLqcrbBqyu4jw4EZr/JRt9FQ1c3eBtb
   xppq9Pe3ZmaESY7L0TqyQrKEh3Ud5YigQGGYqT/FRBjtLQzcfe9yvnyED
   BtywHzDrPnQJlJvgBG9RkH5OVqqc2fx4pNl486hdCd1i6iQQCoJF7BskG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="331051477"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="331051477"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 19:39:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="824201784"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="824201784"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 May 2023 19:39:34 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxIgv-0004RM-2e;
	Fri, 12 May 2023 02:39:33 +0000
Date: Fri, 12 May 2023 10:38:49 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 17/30] ERROR: modpost: module cxl_core uses symbol
 acpi_table_parse_cdat from namespace CXL, but does not import it.
Message-ID: <202305121043.EsTckDfh-lkp@intel.com>
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
config: ia64-randconfig-r021-20230511 (https://download.01.org/0day-ci/archive/20230512/202305121043.EsTckDfh-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=65164ecadb8fb6b57020aa130f6fe63885384021
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 65164ecadb8fb6b57020aa130f6fe63885384021
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121043.EsTckDfh-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module cxl_core uses symbol acpi_table_parse_cdat from namespace CXL, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
