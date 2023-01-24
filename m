Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4240EA42
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 03:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674531277; x=1706067277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FSJtbD9hUIlGigEX558BIHslJ8io+AWD8HwrgRSnLT8=;
  b=UyEfm9XwDVNpY7ig9c3udlkNZyiQ7BWCMev+wzt5MGJF0nBmEys00AUj
   wOoEGad/KTjke9cI4+e+IFUhSWEH6kfVuQGdNapUk1tcjcfvET90Fg9E8
   uQ+NYPAQWkm6ZLZv0DsEGe9eWD3b/iaCE65XDnGMsrMVwW5FXVydh+BZ4
   Ey6F68wYebFVfC0OSwH7Nm4fntDKCThPZ14FCLLb7HcSbIEjT8EYY0kxF
   qNVyF0mDmxzpO0YkfjjI0d7dcAF/OSGmsUGfYZVKrwk99oBnEkUphImCd
   wSRU+jBODEK2yE6181ReJESZZvpWkGm+7fG3ySAl9evIeVTZVGzoCKTxd
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="309800517"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="309800517"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 19:34:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="770168815"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="770168815"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2023 19:34:35 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKA4w-00065s-2P;
	Tue, 24 Jan 2023 03:34:34 +0000
Date: Tue, 24 Jan 2023 11:33:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-filter-upstream 7/30]
 drivers/base/da_firmware.c:133:9: warning: 'strncpy' specified bound 64
 equals destination size
Message-ID: <202301241119.5M7wsqzk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   2eb6cd239352583e1275ed7d6e772e7bbc0343b0
commit: cc83c3f87358a398c0eadb5a91a7d8e4b71f85d1 [7/30] driver core: Add command line option to update device authorization list
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230124/202301241119.5M7wsqzk-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/cc83c3f87358a398c0eadb5a91a7d8e4b71f85d1
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout cc83c3f87358a398c0eadb5a91a7d8e4b71f85d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/base/da_firmware.c:166:8: warning: no previous prototype for 'parse_firmware_devices' [-Wmissing-prototypes]
     166 | size_t parse_firmware_devices(struct da_bus_node *node, void *data)
         |        ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/da_firmware.c: In function 'parse_cmdline_data':
   drivers/base/da_firmware.c:366:25: warning: variable 'ids' set but not used [-Wunused-but-set-variable]
     366 |         char *k, *bus, *ids;
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
