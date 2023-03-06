Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E9120F0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 07:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678087319; x=1709623319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IiPjXLphtTNygC/1ey1csTOCaE8C/CjBinqj/V082U4=;
  b=A5S2uXeJCHEsFCj0xEhY0tV0nNkXnbYIS42kzKv3grMBHIuihJFu+Es7
   zq6pgXO1jk3iISRPs8M1okw/g5irdrlvmSY0afvbCdH3vzQpg8n3K4cpV
   yoxmBZG4v1PJ/Aj+nM3nnTFwBSU6laNbC3pW3MvFR3XUlpUCBtypfKjky
   EIOJiK8Oudi6DZpUmaKbWM9YsuKXJmSAE5So5Hp98Daiw5Wf28RW0uUDi
   2hU2Ppon1o216c7UkBtvcNb68p/9UjTxq17XLaUTgWUICjiyIXQP9sKm0
   /fAis/1Z3dL5IoExKn2ldAu6fuPHOcEQjxm/8481EH5gxN5el53kuzb3n
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="335510797"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="335510797"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 23:21:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="921816696"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="921816696"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Mar 2023 23:21:52 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ5AN-000081-35;
	Mon, 06 Mar 2023 07:21:51 +0000
Date: Mon, 6 Mar 2023 15:20:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-filter-upstream 9/31]
 drivers/base/da_firmware.c:377:25: warning: variable 'ids' set but not used
Message-ID: <202303061528.r16ykFLM-lkp@intel.com>
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
commit: 81e0b2bbb8c56599eadfb425260e3406f5c2f4db [9/31] driver core: Add command line option to update device authorization list
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230306/202303061528.r16ykFLM-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/81e0b2bbb8c56599eadfb425260e3406f5c2f4db
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout 81e0b2bbb8c56599eadfb425260e3406f5c2f4db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303061528.r16ykFLM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/da_firmware.c:166:8: warning: no previous prototype for 'parse_firmware_devices' [-Wmissing-prototypes]
     166 | size_t parse_firmware_devices(struct da_bus_node *node, void *data)
         |        ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/da_firmware.c: In function 'parse_cmdline_data':
>> drivers/base/da_firmware.c:377:25: warning: variable 'ids' set but not used [-Wunused-but-set-variable]
     377 |         char *k, *bus, *ids;
         |                         ^~~
   drivers/base/da_firmware.c: In function 'alloc_bus_node':
>> drivers/base/da_firmware.c:133:9: warning: 'strncpy' specified bound 64 equals destination size [-Wstringop-truncation]
     133 |         strncpy(node->name, bus, NAME_LEN);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ids +377 drivers/base/da_firmware.c

   359	
   360	static int parse_cmdline_devices(struct da_bus_node *bnode, char *ids)
   361	{
   362		int count = get_cmdline_dev_count(ids);
   363	
   364		if (!count || !strcmp(ids, "ALL")) {
   365			bnode->dev_ids = NULL;
   366			return 0;
   367		}
   368	
   369		if (!strcmp(bnode->name, "pci"))
   370			return parse_pci_id(bnode, ids, count);
   371		else
   372			return parse_bus_id(bnode, ids, count);
   373	}
   374	static int __init parse_cmdline_data(char *p)
   375	{
   376		struct da_bus_node *bnode;
 > 377		char *k, *bus, *ids;
   378	
   379		while ((k = strsep(&p, ";")) != NULL) {
   380			bus = strsep(&k, ":");
   381			ids = k;
   382			bnode = alloc_bus_node(bus, 0);
   383			if (!bnode)
   384				goto out;
   385			list_add_tail(&bnode->list, &platform_da_cmdline_list);
   386			if (parse_cmdline_devices(bnode, k))
   387				goto out;
   388		}
   389	
   390		return 0;
   391	
   392	out:
   393		pr_err("Failed allow list command line parsing\n");
   394		free_da_list(&platform_da_cmdline_list);
   395		return -EIO;
   396	}
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
