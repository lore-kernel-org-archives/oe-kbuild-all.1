Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A31179
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 00:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682641538; x=1714177538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u+er8SpsxihDGFqkI6Ptr7PFxIRo0kLBEXHqEGMpi1c=;
  b=JcXS88kosotbzeIxZbPrbFvj+RlOwbHFx7eR09JgO/LaKfs2k/Aws9qu
   eZ7u36Soo43gngJO5ERDOTXRXmqwXNdfm3cOTum8wXipixrJhfDu9yblU
   MrMOA2WG1lq9LcD9JsYg/xzu4T8UsM1L/K2eDEUUxb/caJQL7UGD1RUr5
   6wbX1fRP4/wQ/P8Beksg3yCcvQ8Pi5Kz5KTJPa7R6fTdVuKyz6AsvGYJi
   rnsNhQPxn3U1GKLZBZgLfDXJoqpOk/pZtH1jbdPfrH7/ydmhG7tPZqyNd
   rw0nno1oYVnmmkDDZFwqCdSlT8QJqFwz6ymMslrOSlVNOFhMbfRosiyU1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="331912976"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="331912976"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 17:25:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="783984039"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="783984039"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Apr 2023 17:25:36 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psBvW-0000Dv-0w;
	Fri, 28 Apr 2023 00:25:30 +0000
Date: Fri, 28 Apr 2023 08:25:10 +0800
From: kernel test robot <lkp@intel.com>
To: Darren Etheridge <detheridge@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 62/70]
 drivers/media/platform/img/vxe-vxd/decoder/hw_control.c:1124:43: warning:
 cast from pointer to integer of different size
Message-ID: <202304280827.xAnjRUzc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   d0673ae878bb78807f65a6021cd9642d6d45bb93
commit: 3b23f836c2ec0541aea62823eeed7f2bbe88dc43 [62/70] media: platform: img: add the vxe-vxd driver into the build infra
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230428/202304280827.xAnjRUzc-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 3b23f836c2ec0541aea62823eeed7f2bbe88dc43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/media/platform/img/vxe-vxd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280827.xAnjRUzc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/img/vxe-vxd/decoder/hw_control.c: In function 'pvdec_create':
>> drivers/media/platform/img/vxe-vxd/decoder/hw_control.c:1124:43: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1124 |         corectx->comms_ram_addr = ioremap((phys_addr_t)phy_addr, iMapSize);
         |                                           ^
   drivers/media/platform/img/vxe-vxd/decoder/hw_control.c: At top level:
   drivers/media/platform/img/vxe-vxd/decoder/hw_control.c:782:13: warning: 'hwctrl_dump_state' defined but not used [-Wunused-function]
     782 | static void hwctrl_dump_state(struct vxd_states *prev_state,
         |             ^~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/img/vxe-vxd/decoder/vxd_props.h:19,
                    from drivers/media/platform/img/vxe-vxd/decoder/decoder.h:29,
                    from drivers/media/platform/img/vxe-vxd/decoder/hw_control.c:22:
   drivers/media/platform/img/vxe-vxd/common/imgmmu.h:65:28: warning: 'VIRT_DIR_IDX_MASK' defined but not used [-Wunused-const-variable=]
      65 | static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
         |                            ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/common/imgmmu.h:62:28: warning: 'VIRT_PAGE_TBL_MASK' defined but not used [-Wunused-const-variable=]
      62 | static const unsigned long VIRT_PAGE_TBL_MASK =
         |                            ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~


vim +1124 drivers/media/platform/img/vxe-vxd/decoder/hw_control.c

5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1085  
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1086  static int pvdec_create(struct vxd_dev *vxd, struct vxd_coreprops *core_props,
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1087  			void **hndl_vdeckm_context)
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1088  {
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1089  	struct vdeckm_context  *corectx;
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1090  	struct vxd_core_props hndl_core_props;
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1091  	int result;
f3f52724b296b9 drivers/media/platform/vxe-vxd/decoder/hw_control.c Prasanth Babu Mantena 2023-04-25  1092  	int iMapSize, pageSize;
f3f52724b296b9 drivers/media/platform/vxe-vxd/decoder/hw_control.c Prasanth Babu Mantena 2023-04-25  1093  	void *phy_addr;
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1094  
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1095  	if (!hndl_vdeckm_context || !core_props)
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1096  		return IMG_ERROR_INVALID_PARAMETERS;
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1097  
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1098  	/*
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1099  	 * Obtain core context.
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1100  	 */
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1101  	corectx = &acore_ctx[0];
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1102  
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1103  	memset(corectx, 0, sizeof(*corectx));
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1104  
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1105  	corectx->core_num = 0;
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1106  
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1107  	result = vxd_pvdec_get_props(vxd->dev, vxd->reg_base, &hndl_core_props);
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1108  	if (result != 0)
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1109  		return result;
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1110  
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1111  	vxd_get_coreproperties(&hndl_core_props, &corectx->props);
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1112  
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1113  	memcpy(core_props, &corectx->props, sizeof(*core_props));
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1114  
f3f52724b296b9 drivers/media/platform/vxe-vxd/decoder/hw_control.c Prasanth Babu Mantena 2023-04-25  1115  	pageSize = PAGE_SIZE;
f3f52724b296b9 drivers/media/platform/vxe-vxd/decoder/hw_control.c Prasanth Babu Mantena 2023-04-25  1116  	/* end aligned to page (ceiling), in pages */
f3f52724b296b9 drivers/media/platform/vxe-vxd/decoder/hw_control.c Prasanth Babu Mantena 2023-04-25  1117  	iMapSize = (PVDEC_COMMS_RAM_OFFSET + PVDEC_COMMS_RAM_SIZE + pageSize - 1) / pageSize;
f3f52724b296b9 drivers/media/platform/vxe-vxd/decoder/hw_control.c Prasanth Babu Mantena 2023-04-25  1118  	/* subtract start aligned to page (floor), in pages */
f3f52724b296b9 drivers/media/platform/vxe-vxd/decoder/hw_control.c Prasanth Babu Mantena 2023-04-25  1119  	iMapSize -= PVDEC_COMMS_RAM_OFFSET / pageSize;
f3f52724b296b9 drivers/media/platform/vxe-vxd/decoder/hw_control.c Prasanth Babu Mantena 2023-04-25  1120  	/* convert to bytes */
f3f52724b296b9 drivers/media/platform/vxe-vxd/decoder/hw_control.c Prasanth Babu Mantena 2023-04-25  1121  	iMapSize *= pageSize;
f3f52724b296b9 drivers/media/platform/vxe-vxd/decoder/hw_control.c Prasanth Babu Mantena 2023-04-25  1122  	phy_addr = (void *)(0x4300000);
f3f52724b296b9 drivers/media/platform/vxe-vxd/decoder/hw_control.c Prasanth Babu Mantena 2023-04-25  1123  	phy_addr += (PVDEC_COMMS_RAM_OFFSET);
f3f52724b296b9 drivers/media/platform/vxe-vxd/decoder/hw_control.c Prasanth Babu Mantena 2023-04-25 @1124  	corectx->comms_ram_addr = ioremap((phys_addr_t)phy_addr, iMapSize);
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1125  	*hndl_vdeckm_context = corectx;
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1126  
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1127  	return 0;
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1128  }
5c06fabe7dbbb0 drivers/media/platform/vxe-vxd/decoder/hw_control.c Sidraya               2023-04-25  1129  

:::::: The code at line 1124 was first introduced by commit
:::::: f3f52724b296b940f33ad99ce4567df3fd5bd0fe vxe-vxd: decoder: Error handling of fatal condition

:::::: TO: Prasanth Babu Mantena <p-mantena@ti.com>
:::::: CC: Praneeth Bajjuri <praneeth@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
