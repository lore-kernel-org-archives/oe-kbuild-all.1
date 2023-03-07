Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A13D107AE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 23:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678231648; x=1709767648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2siAUw/nV4HBDSVd6BSze5jrv3xy+JmCgJDhoJ8Skw4=;
  b=Li7u2iWgVnNsE7ilb//4avFKrPqeXVoiYcWpUOjSy7kGOusrwxGqOXuT
   Bt5INXUHbCivnIheTiwchVSOsguVVKq4nBuZI3lS174Tc61wYtdZ/rgkP
   Pvomqp+TlFX0yxunZ3GbjxaieKZVD1tT25e5wl1CS6QHi3t+CioaGyXO+
   OuUNYY7q79CB1Lpu51wwHETV44jk4aFn53ahj6L9IKKD624lcf3W0YuAf
   gv7lfg6iGJA0CQf5XIuUW4+wy/fuSGMToZjbfEQUzs707vJhBLCtubzPq
   6YQZTqybEvnVRMvYur4C6M56OPI7/BlAoUVso3GgNH3R3dTQ1grjwCYR/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="319831424"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="319831424"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 15:27:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="740897988"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="740897988"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Mar 2023 15:27:26 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZgiL-0001gQ-35;
	Tue, 07 Mar 2023 23:27:25 +0000
Date: Wed, 8 Mar 2023 07:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [miquelraynal:nvmem-layouts-and-of-cleanup 20/57]
 drivers/nvmem/core.c:770:9: error: implicit declaration of function
 'of_device_node_request_module'
Message-ID: <202303080730.Qtk3lUUd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/miquelraynal/linux-0day.git nvmem-layouts-and-of-cleanup
head:   d8752324726fdde6bb205a5aa95ae8ff7d84eff7
commit: b3a67512c995dbf8f71e14e7df1278ee7c6d26ca [20/57] nvmem: core: request layout modules loading
config: riscv-randconfig-r042-20230305 (https://download.01.org/0day-ci/archive/20230308/202303080730.Qtk3lUUd-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/miquelraynal/linux-0day/commit/b3a67512c995dbf8f71e14e7df1278ee7c6d26ca
        git remote add miquelraynal https://github.com/miquelraynal/linux-0day.git
        git fetch --no-tags miquelraynal nvmem-layouts-and-of-cleanup
        git checkout b3a67512c995dbf8f71e14e7df1278ee7c6d26ca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080730.Qtk3lUUd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvmem/core.c: In function 'nvmem_layout_get':
>> drivers/nvmem/core.c:770:9: error: implicit declaration of function 'of_device_node_request_module' [-Werror=implicit-function-declaration]
     770 |         of_device_node_request_module(layout_np);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/of_device_node_request_module +770 drivers/nvmem/core.c

   755	
   756	static struct nvmem_layout *nvmem_layout_get(struct nvmem_device *nvmem)
   757	{
   758		struct device_node *layout_np, *np = nvmem->dev.of_node;
   759		struct nvmem_layout *l, *layout = ERR_PTR(-EPROBE_DEFER);
   760	
   761		layout_np = of_get_child_by_name(np, "nvmem-layout");
   762		if (!layout_np)
   763			return NULL;
   764	
   765		/*
   766		 * In case the nvmem device was built-in while the layout was built as a
   767		 * module, we shall manually request the layout driver loading otherwise
   768		 * we'll never have any match.
   769		 */
 > 770		of_device_node_request_module(layout_np);
   771	
   772		spin_lock(&nvmem_layout_lock);
   773	
   774		list_for_each_entry(l, &nvmem_layouts, node) {
   775			if (of_match_node(l->of_match_table, layout_np)) {
   776				if (try_module_get(l->owner))
   777					layout = l;
   778	
   779				break;
   780			}
   781		}
   782	
   783		spin_unlock(&nvmem_layout_lock);
   784		of_node_put(layout_np);
   785	
   786		return layout;
   787	}
   788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
