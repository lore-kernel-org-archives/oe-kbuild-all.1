Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FE27C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 06:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681539858; x=1713075858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AAnvb2gUeg2ZXi9XZYz/SUkn8y5ND8j5ruZMdflr/r0=;
  b=JhreYjS08q4UOSSOMEHROZ4njCd2RlVpAnhDu8YrGd+LmLUq8wqaeBbL
   HbK8JUKQHpM7SqcVZj+vTK1QqZyLXL+tmxxHKggyhzMBPFzJHQN28OmR0
   T6Z2vj40ppeTeC1eq9Ju9H3x3IyrceJMbyP/+AIgfMqSEBWMHQmjrjox2
   YblBOm1YpFoS9QtE6ndTb49z7nyf8XePmUAb507yiwzc7RPACOmVRdIJN
   wYSpHbodkW7e4tm/+BXJ8lRyYdcJireH5Gfsrr+QZMcnqpkNGEVT/qCG+
   MD+IGyvpDAX5F6MrD4d8ChmuHVUy1e20ddAgjqJU1cG385TBzNTtrTKq9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="344617129"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="344617129"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 23:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="801469691"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="801469691"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2023 23:24:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnZKZ-000aaT-2k;
	Sat, 15 Apr 2023 06:24:15 +0000
Date: Sat, 15 Apr 2023 14:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 3472/9838]
 drivers/net/dsa/ocelot/felix_tsn.c:956:60: warning: left shift count >=
 width of type
Message-ID: <202304151417.2DquqDvt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 24803e50c169dd508257c6ac3148fcca4d1dd1a1 [3472/9838] net: dsa: felix: add tsn support for felix switch based on net/tsn
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304151417.2DquqDvt-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/24803e50c169dd508257c6ac3148fcca4d1dd1a1
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 24803e50c169dd508257c6ac3148fcca4d1dd1a1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/dma/ drivers/net/dsa/ocelot/ drivers/phy/freescale/ sound/soc/sof/amd/ sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151417.2DquqDvt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/dsa/ocelot/felix_tsn.c: In function 'felix_qci_sgi_get':
>> drivers/net/dsa/ocelot/felix_tsn.c:956:60: warning: left shift count >= width of type [-Wshift-count-overflow]
     956 |                 ANA_SG_CONFIG_REG_3_BASE_TIME_SEC_MSB(val) << 32;
         |                                                            ^~
   drivers/net/dsa/ocelot/felix_tsn.c: In function 'felix_qci_sgi_status_get':
   drivers/net/dsa/ocelot/felix_tsn.c:1006:63: warning: left shift count >= width of type [-Wshift-count-overflow]
    1006 |                 ANA_SG_STATUS_REG_3_CFG_CHG_TIME_SEC_MSB(val) << 32;
         |                                                               ^~


vim +956 drivers/net/dsa/ocelot/felix_tsn.c

   924	
   925	static int felix_qci_sgi_get(struct net_device *ndev, u32 index,
   926				     struct tsn_qci_psfp_sgi_conf *sgi_conf)
   927	{
   928		struct tsn_qci_sg_control *admin  = &sgi_conf->admin;
   929		struct dsa_port *dp = dsa_port_from_netdev(ndev);
   930		struct ocelot *ocelot = dp->ds->priv;
   931		struct tsn_qci_psfp_gcl *glist;
   932		u32 val, reg, list_num;
   933	
   934		if (index >= capa.num_psfp_sgid) {
   935			dev_err(ocelot->dev, "Invalid sgid %u, maximum:%u\n",
   936				index, capa.num_psfp_sgid);
   937			return -EINVAL;
   938		}
   939	
   940		ocelot_rmw(ocelot,
   941			   ANA_SG_ACCESS_CTRL_SGID(index),
   942			   ANA_SG_ACCESS_CTRL_SGID_M,
   943			   ANA_SG_ACCESS_CTRL);
   944	
   945		admin->cycle_time = ocelot_read(ocelot, ANA_SG_CONFIG_REG_4);
   946		admin->cycle_time_extension =
   947			ocelot_read(ocelot, ANA_SG_CONFIG_REG_5);
   948	
   949		val = ocelot_read(ocelot, ANA_SG_CONFIG_REG_2);
   950		admin->base_time = val;
   951	
   952		reg = ocelot_read(ocelot, ANA_SG_CONFIG_REG_1);
   953		val = ocelot_read(ocelot, ANA_SG_CONFIG_REG_3);
   954	
   955		admin->base_time +=
 > 956			ANA_SG_CONFIG_REG_3_BASE_TIME_SEC_MSB(val) << 32;
   957	
   958		admin->base_time = admin->base_time * NSEC_PER_SEC + reg;
   959	
   960		if (val & ANA_SG_CONFIG_REG_3_IPV_VALID)
   961			admin->init_ipv = ANA_SG_CONFIG_REG_3_INIT_IPV_X(val);
   962		else
   963			admin->init_ipv = -1;
   964	
   965		if (val & ANA_SG_CONFIG_REG_3_GATE_ENABLE)
   966			sgi_conf->gate_enabled = 1;
   967	
   968		admin->control_list_length = ANA_SG_CONFIG_REG_3_LIST_LENGTH_X(val);
   969	
   970		list_num = admin->control_list_length;
   971	
   972		glist = kmalloc_array(list_num, sizeof(struct tsn_qci_psfp_gcl),
   973				      GFP_KERNEL);
   974		if (!glist)
   975			return -ENOMEM;
   976	
   977		admin->gcl = glist;
   978	
   979		return felix_sgi_get_glist(ocelot, glist, list_num);
   980	}
   981	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
