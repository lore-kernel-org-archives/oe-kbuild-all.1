Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CDBD317
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 06:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678082931; x=1709618931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z1ot6Q2TJRk7opXd6U+jHV4HAK/SUH7/4Meuo0CYhdE=;
  b=nXwF29KvfsGa604Qwi/gULh2DdqyiMputl5+15HkXScj2uYDvUoFo2vy
   iz1oZxi/x+jEWnK7mrcFe6IoeJHp0AL+vP8hlX1Qnbgaw5bpBX21+I9Y5
   4sprJGet5hpY5xaMYDYBmHhSzggDvB347l2JCoBtc0iFSZbASLYbnXh/u
   TlGUpFVUtqWua0W//NS+VOuBsjWmnM/jyBD9CFIr4YzyF/YYGy1pi0WZu
   xg0aQvhXR1KHHQ76FJOu26f165VkvF+sqNGlQBnplTuifLFY35thNi9g5
   pHeM3DiQZVxYCTDydwZfFe3Y6U8RqEFA0wAwwzs+HYC6qPB0D+l43hTNh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="315137676"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="315137676"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 22:08:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="819187449"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="819187449"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2023 22:08:50 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ41h-00005K-1R;
	Mon, 06 Mar 2023 06:08:49 +0000
Date: Mon, 6 Mar 2023 14:08:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-filter-upstream 5/31]
 drivers/base/da_firmware.c:145:8: warning: no previous prototype for
 'parse_firmware_devices'
Message-ID: <202303061359.H8GkFcB6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   2a65ce7abb22ae45b4be1299bbd9eb72534827eb
commit: 3544b1a13f34d6e5cfd2ff9c8aa74900e333b87e [5/31] driver core: Add support to parse device authorize firmware
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230306/202303061359.H8GkFcB6-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/3544b1a13f34d6e5cfd2ff9c8aa74900e333b87e
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout 3544b1a13f34d6e5cfd2ff9c8aa74900e333b87e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303061359.H8GkFcB6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/da_firmware.c:145:8: warning: no previous prototype for 'parse_firmware_devices' [-Wmissing-prototypes]
     145 | size_t parse_firmware_devices(struct da_bus_node *node, void *data)
         |        ^~~~~~~~~~~~~~~~~~~~~~


vim +/parse_firmware_devices +145 drivers/base/da_firmware.c

   144	
 > 145	size_t parse_firmware_devices(struct da_bus_node *node, void *data)
   146	{
   147		struct da_pci_device_id *da_id = data;
   148		struct pci_device_id *pci_ids;
   149		struct da_bus_device_id *ids;
   150		unsigned int i;
   151	
   152		if (!strncmp(node->name, "pci", 3)) {
   153			pci_ids = kmalloc_array(node->count, sizeof(*pci_ids), GFP_KERNEL | __GFP_ZERO);
   154			if (!pci_ids)
   155				return 0;
   156	
   157			for (i = 0; i < node->count; i++)
   158				memcpy(&pci_ids[i], &da_id[i], sizeof(*da_id));
   159	
   160			node->dev_ids = pci_ids;
   161	
   162			return sizeof(*da_id) * node->count;
   163		}
   164	
   165		ids = kmalloc_array(node->count, sizeof(*ids), GFP_KERNEL);
   166		if (!ids)
   167			return 0;
   168	
   169		memcpy(ids, data, sizeof(*ids) * node->count);
   170	
   171		node->dev_ids = ids;
   172	
   173		return sizeof(*ids) * node->count;
   174	}
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
