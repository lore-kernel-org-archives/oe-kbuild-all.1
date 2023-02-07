Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E244439
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 15:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675783989; x=1707319989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UGM/IVMITZ+m1PEz7CGFE2Jped0YIaEnFzvEtnLRmkk=;
  b=C0x+fLwAn+fP18NVaSu2D7bFFr5Yt/EOaeygpZLSS5n2BGldDn/Icbfe
   eXzYo0g1Eog0PwO1HrsNawe7SDruVMKrB1U7Hte33erQviHE2HmhfFSvC
   Am/7paZcnu8vnE7KLIPqNtc8fxNoqQqJPKjJKxNDXs4nXxQef4cTdlOSq
   zmjcz+Hb6gK3iAAAZXInTIc1cH3ku1eyl7noDNaIRbAyJoPiogxtArCNq
   9pto6soUvB7gJazMv+bVOopjSfFCi2+vvHkfFkTkDHmFWY2o/VkiV4F61
   DHIK0EQLAckbcaJ/YA5xY8YZqrTiSVllJC7m9GcFlmVL5sOIX33pU1kGF
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="415752432"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="415752432"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 07:33:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="775596255"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="775596255"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2023 07:33:08 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPPxz-0003er-1K;
	Tue, 07 Feb 2023 15:33:07 +0000
Date: Tue, 7 Feb 2023 23:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-filter-upstream 7/31]
 drivers/base/da_firmware.c:133:9: warning: 'strncpy' specified bound 64
 equals destination size
Message-ID: <202302072357.ecVSWGbC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   fd61f2d2a82f5c0c284fa3f074bae5016c39e7bc
commit: 2918c8a83642b317e92706dcb7ee6ee4443f3266 [7/31] driver core: Add command line option to update device authorization list
config: arm-cerfcube_defconfig (https://download.01.org/0day-ci/archive/20230207/202302072357.ecVSWGbC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/2918c8a83642b317e92706dcb7ee6ee4443f3266
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout 2918c8a83642b317e92706dcb7ee6ee4443f3266
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/base/da_firmware.c:166:8: warning: no previous prototype for 'parse_firmware_devices' [-Wmissing-prototypes]
     166 | size_t parse_firmware_devices(struct da_bus_node *node, void *data)
         |        ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/da_firmware.c: In function 'parse_cmdline_data':
   drivers/base/da_firmware.c:377:25: warning: variable 'ids' set but not used [-Wunused-but-set-variable]
     377 |         char *k, *bus, *ids;
         |                         ^~~
   drivers/base/da_firmware.c: In function 'alloc_bus_node':
>> drivers/base/da_firmware.c:133:9: warning: 'strncpy' specified bound 64 equals destination size [-Wstringop-truncation]
     133 |         strncpy(node->name, bus, NAME_LEN);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +133 drivers/base/da_firmware.c

304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  123  
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  124  /* Allocate DA firmware bus node and initialize it based on struct da_bus_hdr */
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  125  static struct da_bus_node *alloc_bus_node(char *bus, u32 count)
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  126  {
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  127  	struct da_bus_node *node;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  128  
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  129  	node = kzalloc(sizeof(*node), GFP_KERNEL);
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  130  	if (!node)
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  131  		return NULL;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  132  
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22 @133  	strncpy(node->name, bus, NAME_LEN);
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  134  	node->count = count;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  135  
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  136  	if (!strncmp(node->name, "pci", 3)) {
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  137  		node->match_device = pci_match_device;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  138  		node->print_devices = pci_print_devices;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  139  	} else {
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  140  		node->match_device = bus_match_device;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  141  		node->print_devices = bus_print_devices;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  142  	}
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  143  
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  144  	return node;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  145  }
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  146  

:::::: The code at line 133 was first introduced by commit
:::::: 304ef1a77b5f5171d3e3ceb4d315ac79b135ab92 driver core: Add support to parse device authorize firmware

:::::: TO: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
:::::: CC: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
