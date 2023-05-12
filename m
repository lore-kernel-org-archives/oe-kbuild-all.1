Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379D0200AE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 18:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683914699; x=1715450699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=he4bwx9dcYoRLFMEMXfPvI2KRwenx30XIUltzmb3bQI=;
  b=g5qm/bT8vQjjiofFY8UXANxEBhV+1uFXyQImx2sSBOJZLHbGCbkCrBQt
   MAdLcXnUnX4dZIBLUpfhHg5TG7sOYu8iXk3tkBqAtt3sapZFvFyIqX1y8
   nEwtnT1GXWtjs3T6obdL6+KflnILDWGtjd6COosdR38BfENs2ecCgN3kA
   my6wol+NHB3uzRGL2GnOwEpMmBG5mo7qbItAflIJrhSS7qBhSt+VpGQ6S
   tNDSZcfDtt1Eu9lMdoqL/nBtK7oySZkj2v9w574klzeorbGGZ1Gch5RGT
   px37N3j4DKDqjhQnjQ/Vnd4wo5aZoZGT6nO8iYkRNznBS9EoHNAv9ruEc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="414228224"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="414228224"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 11:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="700262514"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="700262514"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 May 2023 11:04:53 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxX8O-00051Q-1i;
	Fri, 12 May 2023 18:04:52 +0000
Date: Sat, 13 May 2023 02:04:41 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <michal.wilczynski@intel.com>,
	linux-acpi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, rafael@kernel.org,
	srinivas.pandruvada@linux.intel.com, hanjun.guo@linaro.org,
	Michal Wilczynski <michal.wilczynski@intel.com>
Subject: Re: [PATCH v1 2/2] acpi: Move logic responsible for conveying
 processor OSPM capabilities
Message-ID: <202305130150.apyXfDBg-lkp@intel.com>
References: <20230512152545.125302-3-michal.wilczynski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512152545.125302-3-michal.wilczynski@intel.com>

Hi Michal,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on linus/master v6.4-rc1 next-20230512]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wilczynski/acpi-Use-_OSC-method-to-convey-processor-OSPM-capabilites/20230512-232819
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230512152545.125302-3-michal.wilczynski%40intel.com
patch subject: [PATCH v1 2/2] acpi: Move logic responsible for conveying processor OSPM capabilities
config: ia64-randconfig-r006-20230511 (https://download.01.org/0day-ci/archive/20230513/202305130150.apyXfDBg-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/46f0576d442f1e76c7bd4edaec78ee2357111aff
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Michal-Wilczynski/acpi-Use-_OSC-method-to-convey-processor-OSPM-capabilites/20230512-232819
        git checkout 46f0576d442f1e76c7bd4edaec78ee2357111aff
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/acpi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130150.apyXfDBg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/acpi_processor.c:627:20: error: redefinition of 'acpi_early_processor_osc'
     627 | acpi_status __init acpi_early_processor_osc(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/acpi/acpi_processor.c:27:
   drivers/acpi/internal.h:164:27: note: previous definition of 'acpi_early_processor_osc' with type 'acpi_status(void)' {aka 'unsigned int(void)'}
     164 | static inline acpi_status acpi_early_processor_osc(void) { return AE_ERROR; }
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/acpi_early_processor_osc +627 drivers/acpi/acpi_processor.c

a21211672c9a1d7 Srinivas Pandruvada 2016-03-23  626  
175b1fab626b31b Michal Wilczynski   2023-05-12 @627  acpi_status __init acpi_early_processor_osc(void)
a21211672c9a1d7 Srinivas Pandruvada 2016-03-23  628  {
175b1fab626b31b Michal Wilczynski   2023-05-12  629  	acpi_status status;
175b1fab626b31b Michal Wilczynski   2023-05-12  630  
46f0576d442f1e7 Michal Wilczynski   2023-05-12  631  	processor_dmi_check();
46f0576d442f1e7 Michal Wilczynski   2023-05-12  632  
175b1fab626b31b Michal Wilczynski   2023-05-12  633  	status = acpi_walk_namespace(ACPI_TYPE_PROCESSOR, ACPI_ROOT_OBJECT,
175b1fab626b31b Michal Wilczynski   2023-05-12  634  				     ACPI_UINT32_MAX, acpi_processor_osc, NULL,
a21211672c9a1d7 Srinivas Pandruvada 2016-03-23  635  				     NULL, NULL);
175b1fab626b31b Michal Wilczynski   2023-05-12  636  	if (ACPI_FAILURE(status))
175b1fab626b31b Michal Wilczynski   2023-05-12  637  		return status;
175b1fab626b31b Michal Wilczynski   2023-05-12  638  
175b1fab626b31b Michal Wilczynski   2023-05-12  639  	status = acpi_get_devices(ACPI_PROCESSOR_DEVICE_HID, acpi_processor_osc,
175b1fab626b31b Michal Wilczynski   2023-05-12  640  				  NULL, NULL);
175b1fab626b31b Michal Wilczynski   2023-05-12  641  
175b1fab626b31b Michal Wilczynski   2023-05-12  642  	return status;
a21211672c9a1d7 Srinivas Pandruvada 2016-03-23  643  }
a21211672c9a1d7 Srinivas Pandruvada 2016-03-23  644  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
