Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EB77ED
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 12:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681562381; x=1713098381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ua1cQX5YQuqAVl9MBRj9/JI4ZhkpaNVCOOyTDc+mZpo=;
  b=cq8/hmcHGCLoySg+t7HgT1JqG1n622Y9LT9/q91kpF8Q6KUqyTYH5Gre
   U4Rs64lCIJ5ejKOizUV8Y+uEQwzUxX/SgGdUClGm1Yup/QE/FqBkfjNie
   1l3eNb4aRqvNpNWkUHvOaNA7MT51SlmZRujfynMfoEiZ0QjwRu++DNna9
   BPciTePcDxboz6wTX0nQ20cEhsrXtmZd6eLa7l/nydJGFbyNQwNCCifTC
   +yqOV3p25biUtym9OBf13imWbPTaNLU1QKczIJdrNBanZhZlGGmbncLty
   VYhL+qa4qZaTbqik+sxqaVFL6z6ZfJJJa5hh5J7xmtjbMnjP+FJE6/rpT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="346484485"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="346484485"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 05:39:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="759451607"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="759451607"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2023 05:39:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnfBr-000b1X-1E;
	Sat, 15 Apr 2023 12:39:39 +0000
Date: Sat, 15 Apr 2023 20:39:02 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 1393/9838]
 drivers/gpu/drm/bridge/cadence/cdns-dp-core.c:259:6: warning: no previous
 prototype for 'cdns_dp_handle_hpd_irq'
Message-ID: <202304152057.SFmFy2MV-lkp@intel.com>
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
commit: 925a91175b17d3848258235b30c9bc4a94b58f85 [1393/9838] drm/display: update header path and name
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304152057.SFmFy2MV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/925a91175b17d3848258235b30c9bc4a94b58f85
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 925a91175b17d3848258235b30c9bc4a94b58f85
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/firmware/imx/ drivers/gpu/drm/bridge/cadence/ drivers/mailbox/ drivers/media/platform/ drivers/net/ drivers/pwm/ drivers/regulator/ drivers/soc/imx/ drivers/staging/ drivers/video/fbdev/ sound/soc/fsl/ sound/soc/sof/amd/ sound/soc/sof/imx/ sound/soc/sof/intel/ sound/soc/sof/mediatek/mt8186/ sound/soc/sof/mediatek/mt8195/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304152057.SFmFy2MV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.c:155:5: warning: no previous prototype for 'mhdp_mailbox_read' [-Wmissing-prototypes]
     155 | int mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
         |     ^~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/bridge/cadence/cdns-dp-core.c:259:6: warning: no previous prototype for 'cdns_dp_handle_hpd_irq' [-Wmissing-prototypes]
     259 | void cdns_dp_handle_hpd_irq(struct cdns_mhdp_device *mhdp)
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-hdcp.c:157:5: warning: no previous prototype for 'cdns_mhdp_hdcp_tx_config' [-Wmissing-prototypes]
     157 | int cdns_mhdp_hdcp_tx_config(struct cdns_mhdp_device *mhdp, u8 config)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-hdcp.c:171:5: warning: no previous prototype for 'cdns_mhdp_hdcp2_tx_respond_km' [-Wmissing-prototypes]
     171 | int cdns_mhdp_hdcp2_tx_respond_km(struct cdns_mhdp_device *mhdp,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-hdcp.c:186:5: warning: no previous prototype for 'cdns_mhdp_hdcp_tx_status_req' [-Wmissing-prototypes]
     186 | int cdns_mhdp_hdcp_tx_status_req(struct cdns_mhdp_device *mhdp,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-hdcp.c:215:5: warning: no previous prototype for 'cdns_mhdp_hdcp2_tx_is_km_stored_req' [-Wmissing-prototypes]
     215 | int cdns_mhdp_hdcp2_tx_is_km_stored_req(struct cdns_mhdp_device *mhdp, u8 *data, u16 len)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-hdcp.c:241:5: warning: no previous prototype for 'cdns_mhdp_hdcp2_tx_store_km' [-Wmissing-prototypes]
     241 | int cdns_mhdp_hdcp2_tx_store_km(struct cdns_mhdp_device *mhdp,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-hdcp.c:267:5: warning: no previous prototype for 'cdns_mhdp_hdcp_tx_is_receiver_id_valid' [-Wmissing-prototypes]
     267 | int cdns_mhdp_hdcp_tx_is_receiver_id_valid(struct cdns_mhdp_device *mhdp,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-hdcp.c:321:5: warning: no previous prototype for 'cdns_mhdp_hdcp_tx_respond_receiver_id_valid' [-Wmissing-prototypes]
     321 | int cdns_mhdp_hdcp_tx_respond_receiver_id_valid(
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-hdcp.c:337:5: warning: no previous prototype for 'cdns_mhdp_hdcp_tx_reauth' [-Wmissing-prototypes]
     337 | int cdns_mhdp_hdcp_tx_reauth(struct cdns_mhdp_device *mhdp, u8 msg)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/bridge/cadence/cdns-hdcp-common.c: In function 'cdns_hdcp_set_config':
>> drivers/gpu/drm/bridge/cadence/cdns-hdcp-common.c:225:24: warning: variable 'retEvents' set but not used [-Wunused-but-set-variable]
     225 |         u8 bus_config, retEvents;
         |                        ^~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-hdcp-common.c: In function 'cdns_hdcp_check_receviers':
>> drivers/gpu/drm/bridge/cadence/cdns-hdcp-common.c:331:20: warning: variable 'events' set but not used [-Wunused-but-set-variable]
     331 |                 u8 events = 0;
         |                    ^~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-hdcp-common.c: At top level:
>> drivers/gpu/drm/bridge/cadence/cdns-hdcp-common.c:969:6: warning: no previous prototype for 'cnds_hdcp_create_device_files' [-Wmissing-prototypes]
     969 | void cnds_hdcp_create_device_files(struct cdns_mhdp_device *mhdp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-hdcp-common.c:1018:6: warning: no previous prototype for 'cdns_hdcp_dump_pairing' [-Wmissing-prototypes]
    1018 | void cdns_hdcp_dump_pairing(struct seq_file *s, void *data)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-hdcp-common.c:1066:5: warning: no previous prototype for 'cdns_hdcp_init' [-Wmissing-prototypes]
    1066 | int cdns_hdcp_init(struct cdns_mhdp_device *mhdp, struct device_node *of_node)
         |     ^~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-hdcp-common.c:1111:5: warning: no previous prototype for 'cdns_hdcp_enable' [-Wmissing-prototypes]
    1111 | int cdns_hdcp_enable(struct cdns_mhdp_device *mhdp)
         |     ^~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-hdcp-common.c:1137:5: warning: no previous prototype for 'cdns_hdcp_disable' [-Wmissing-prototypes]
    1137 | int cdns_hdcp_disable(struct cdns_mhdp_device *mhdp)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-hdcp-common.c:1160:6: warning: no previous prototype for 'cdns_hdcp_atomic_check' [-Wmissing-prototypes]
    1160 | void cdns_hdcp_atomic_check(struct drm_connector *connector,
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:42: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * CEC Transceiver operation.
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:52: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * CEC Transceiver status.
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:62: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * CEC Receiver operation.
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:71: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Maximum number of Messages in the RX Buffers.


vim +/cdns_dp_handle_hpd_irq +259 drivers/gpu/drm/bridge/cadence/cdns-dp-core.c

cd2d042a0ebc13 Sandor Yu    2020-04-20  258  
7a11346434d495 Oliver Brown 2021-05-21 @259  void cdns_dp_handle_hpd_irq(struct cdns_mhdp_device *mhdp)
7a11346434d495 Oliver Brown 2021-05-21  260  {
7a11346434d495 Oliver Brown 2021-05-21  261  	u8 status[6];
7a11346434d495 Oliver Brown 2021-05-21  262  
7a11346434d495 Oliver Brown 2021-05-21  263  	mutex_lock(&mhdp->lock);
7a11346434d495 Oliver Brown 2021-05-21  264  	cdns_mhdp_dpcd_read(mhdp, 0x200, &status[0], 6);
7a11346434d495 Oliver Brown 2021-05-21  265  	DRM_DEBUG_DRIVER("DPCD HPD IRQ STATUS: %08x\n", status[1]);
7a11346434d495 Oliver Brown 2021-05-21  266  	cdns_mhdp_dpcd_write(mhdp, 0x201, status[1]);
7a11346434d495 Oliver Brown 2021-05-21  267  	mutex_unlock(&mhdp->lock);
7a11346434d495 Oliver Brown 2021-05-21  268  }
7a11346434d495 Oliver Brown 2021-05-21  269  

:::::: The code at line 259 was first introduced by commit
:::::: 7a11346434d4953350d5637cb5bdc9d5c0a49c4b MLK-25749-4: gpu: drm: bridge: cadence: Add Displayport IRQ handler

:::::: TO: Oliver Brown <oliver.brown@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
