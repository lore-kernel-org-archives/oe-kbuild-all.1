Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB194A40
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E1EDlBNm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697272482; x=1728808482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vJYG3RZM1uWUQAWopu6/KkVm9KAu3IycdCmB7U2RppU=;
  b=E1EDlBNmnBXtkj23g0Cmxq/Zn9LZQHZri466znH5VCOxXRyyljLf8wLb
   hX2e/LrQXi3FeTKnOQx1oD6HCKxZKZQyjl9nO8FnNJNk/F89bJxcXuw5P
   jKTX9Bzvr5eJmU5GF4hZHDUECRkt6BULXZRsZLhjiFYeDZ2qWPcnhvmuc
   ZifKP6D8creIie5GoTlDLviRZ21lXoIpujkyJNeO3w6BhOg3lkBGdRmoG
   YOzSWPVa88Db9LuKcZFclP0LexvXBr9+q34oZGNZGP/v/850/0RNX5QJ1
   NDgHmwsFhGDf7OfvdrpAybMhJDWo4knrkaTR0phQf+gFUKXcgg5itJNqd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="365578367"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="365578367"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 01:34:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="825328996"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="825328996"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Oct 2023 01:34:40 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qra6Y-0005u4-2e;
	Sat, 14 Oct 2023 08:34:38 +0000
Date: Sat, 14 Oct 2023 16:34:29 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3472/15768]
 drivers/net/dsa/ocelot/felix_tsn.c:956:60: warning: left shift count >=
 width of type
Message-ID: <202310141601.rRU1YFVE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vladimir,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 24803e50c169dd508257c6ac3148fcca4d1dd1a1 [3472/15768] net: dsa: felix: add tsn support for felix switch based on net/tsn
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20231014/202310141601.rRU1YFVE-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141601.rRU1YFVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141601.rRU1YFVE-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
