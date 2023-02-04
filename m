Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6B57F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 10:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675505322; x=1707041322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9cgnRGqE7z6Lpcq0m70HbiRjWeQ5mKUH+zWRaGpP1jY=;
  b=lyhQVaoyGydLAEke5LZqRnTd3BbQ1AM1dVrPhGg5R+Ad9aMYE+Qve3nS
   dt4GOO5EAFsHiDfgEOnh96p3tEjRGLRfUsq5TKhZNwiHSFGUCvfkYk7/e
   g5lFuEF6hr4Zi84goNX1le2yK2ytbldDmZTPgnXljF/0iGNyNubKQOzL9
   NBOdiS0la8gKW7IZua8NHehsVZPR+ceM4EBqEKwvHGGHj3+h6DsOMyyqX
   H0npD6uBMJgJy0h5S+OXTV45QrJGDodS7XZ10DbqihgI4ecWv6HLUF7RK
   1sKivaIU5NgKrDEhtSFLKDAy53zqgF1bcsxAmvTf+M8FvMiTsBiVCFOzr
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="326627609"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="326627609"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 02:08:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="696388497"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="696388497"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Feb 2023 02:08:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOFTL-0001Dw-1m;
	Sat, 04 Feb 2023 10:08:39 +0000
Date: Sat, 4 Feb 2023 18:08:29 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 6136/20208]
 drivers/net/dsa/ocelot/felix_tsn.c:1298:60: warning: left shift count >=
 width of type
Message-ID: <202302041807.wa2ShpYu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: d4ed5184f4ad9d0d2f29985e3411f11bd9c97584 [6136/20208] Merge remote-tracking branch 'origin/net/tsn' into net/next
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230204/202302041807.wa2ShpYu-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/d4ed5184f4ad9d0d2f29985e3411f11bd9c97584
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout d4ed5184f4ad9d0d2f29985e3411f11bd9c97584
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/dma/ drivers/irqchip/ drivers/net/dsa/ocelot/ drivers/phy/freescale/ drivers/video/fbdev/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/net/dsa/ocelot/felix_tsn.c: In function 'felix_cb_streamid_set':
   drivers/net/dsa/ocelot/felix_tsn.c:551:13: warning: variable 'idx' set but not used [-Wunused-but-set-variable]
     551 |         int idx, sfid, ssid, port;
         |             ^~~
   drivers/net/dsa/ocelot/felix_tsn.c: In function 'felix_qci_sgi_get':
>> drivers/net/dsa/ocelot/felix_tsn.c:1298:60: warning: left shift count >= width of type [-Wshift-count-overflow]
    1298 |                 ANA_SG_CONFIG_REG_3_BASE_TIME_SEC_MSB(val) << 32;
         |                                                            ^~
   drivers/net/dsa/ocelot/felix_tsn.c: In function 'felix_qci_sgi_status_get':
   drivers/net/dsa/ocelot/felix_tsn.c:1351:63: warning: left shift count >= width of type [-Wshift-count-overflow]
    1351 |                 ANA_SG_STATUS_REG_3_CFG_CHG_TIME_SEC_MSB(val) << 32;
         |                                                               ^~


vim +1298 drivers/net/dsa/ocelot/felix_tsn.c

13a65918eff2b2 Xiaoliang Yang 2020-08-31  1263  
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1264  static int felix_qci_sgi_get(struct net_device *ndev, u32 index,
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1265  			     struct tsn_qci_psfp_sgi_conf *sgi_conf)
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1266  {
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1267  	struct tsn_qci_sg_control *admin  = &sgi_conf->admin;
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1268  	struct tsn_qci_psfp_gcl *glist;
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1269  	u32 val, reg, list_num;
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1270  	struct ocelot *ocelot;
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1271  	struct dsa_port *dp;
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1272  
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1273  	dp = dsa_port_from_netdev(ndev);
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1274  	ocelot = dp->ds->priv;
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1275  
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1276  	if (index >= capa.num_psfp_sgid) {
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1277  		dev_err(ocelot->dev, "Invalid sgid %u, maximum:%u\n",
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1278  			index, capa.num_psfp_sgid);
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1279  		return -EINVAL;
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1280  	}
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1281  
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1282  	ocelot_rmw(ocelot,
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1283  		   ANA_SG_ACCESS_CTRL_SGID(index),
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1284  		   ANA_SG_ACCESS_CTRL_SGID_M,
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1285  		   ANA_SG_ACCESS_CTRL);
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1286  
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1287  	admin->cycle_time = ocelot_read(ocelot, ANA_SG_CONFIG_REG_4);
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1288  	admin->cycle_time_extension =
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1289  		ocelot_read(ocelot, ANA_SG_CONFIG_REG_5);
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1290  
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1291  	val = ocelot_read(ocelot, ANA_SG_CONFIG_REG_2);
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1292  	admin->base_time = val;
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1293  
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1294  	reg = ocelot_read(ocelot, ANA_SG_CONFIG_REG_1);
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1295  	val = ocelot_read(ocelot, ANA_SG_CONFIG_REG_3);
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1296  
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1297  	admin->base_time +=
13a65918eff2b2 Xiaoliang Yang 2020-08-31 @1298  		ANA_SG_CONFIG_REG_3_BASE_TIME_SEC_MSB(val) << 32;
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1299  
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1300  	admin->base_time = admin->base_time * 1000000000 + reg;
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1301  
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1302  	if (val & ANA_SG_CONFIG_REG_3_IPV_VALID)
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1303  		admin->init_ipv = ANA_SG_CONFIG_REG_3_INIT_IPV_X(val);
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1304  	else
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1305  		admin->init_ipv = -1;
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1306  
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1307  	if (val & ANA_SG_CONFIG_REG_3_GATE_ENABLE)
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1308  		sgi_conf->gate_enabled = 1;
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1309  
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1310  	admin->control_list_length = ANA_SG_CONFIG_REG_3_LIST_LENGTH_X(val);
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1311  
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1312  	list_num = admin->control_list_length;
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1313  
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1314  	glist = kmalloc_array(list_num, sizeof(struct tsn_qci_psfp_gcl),
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1315  			      GFP_KERNEL);
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1316  	if (!glist)
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1317  		return -ENOMEM;
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1318  
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1319  	admin->gcl = glist;
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1320  
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1321  	return felix_sgi_get_glist(ocelot, glist, list_num);
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1322  }
13a65918eff2b2 Xiaoliang Yang 2020-08-31  1323  

:::::: The code at line 1298 was first introduced by commit
:::::: 13a65918eff2b258c6f233f1057fdfbb43c1af04 net: dsa: felix: add tsn support for felix switch based on net/tsn

:::::: TO: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
