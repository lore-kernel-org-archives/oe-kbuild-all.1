Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D62A31
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 02:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674528756; x=1706064756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KTmqd6s3H2HquSvE5fuJBtiAtoB3JIIpMWfSOCpk84M=;
  b=SVOiyYUyjb8FxSeBUxDJkk8jPHSfli3NKqoVrmFbF8ur6eKkZGdM7e+E
   h0zmpv8zVzOucznga2Nq/RSJAw/3m+Fq2kgi+Ih1BBOqurwnQLyOabT/4
   CLiwE5IhHJrALCnjP8HMauaJfPN4IF/W2mOrIFBbvH+b7hxyWB7HAegrU
   riHv5by4C92iS/xSuONHz6puJXaclUUOdpcEdZjcCKAPtjjcVcrF98gxe
   0sb06MiDsmcZ0v+1AdKZ+wwk3RWG8lDuQzh0TOcaim5RS7wDcRVOlI4pY
   rOvkAe98jTffuq8TnTNPf19ZGBluPZx4V7v4AC+NlK51pauUGXuRATUWm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="326253734"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="326253734"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 18:52:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="785917751"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="785917751"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Jan 2023 18:52:34 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK9QH-00064S-2k;
	Tue, 24 Jan 2023 02:52:33 +0000
Date: Tue, 24 Jan 2023 10:52:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-filter-upstream 5/30]
 drivers/base/da_firmware.c:145:8: warning: no previous prototype for
 'parse_firmware_devices'
Message-ID: <202301241000.R8P0oncp-lkp@intel.com>
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
commit: 304ef1a77b5f5171d3e3ceb4d315ac79b135ab92 [5/30] driver core: Add support to parse device authorize firmware
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230124/202301241000.R8P0oncp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/304ef1a77b5f5171d3e3ceb4d315ac79b135ab92
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout 304ef1a77b5f5171d3e3ceb4d315ac79b135ab92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
