Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36F628E1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681571086; x=1713107086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AfZs5TY9Sb3KfhAeMxDzY12erxbe0SAXnz+6wkUW584=;
  b=nhmnO2cYaHnESQ7HZgunV5Ya2ow9ek8Jto50+567HJuwhw1uV4siCE7K
   DdVZgmQq2OunJR/qwtzE4ByIDo/yYexDR6aJZ19SWysSrgN00BrjzgJM4
   tnbMT3/AI83vF5fhp2FUA4+sgM6u6fkSr5Nvij1aJPWuM18aTEEtrO0EA
   mqTXENTWN6ol165coQk1FiiZJJc8ejNIAevmn8p96e2vr0FEBCdg/iXkg
   rGi8/1WKJJpY2BbqPFbiizScqPcq/dYarlO42VVlZJXEinI+Mns7bUWPf
   fQVOiyR309l6gpSB/vF7/VDVmlziLlexdQyZEwn37USBCjN96pOix0M4N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="324999731"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="324999731"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 08:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="936355034"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="936355034"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Apr 2023 08:04:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnhSG-000b8h-0W;
	Sat, 15 Apr 2023 15:04:44 +0000
Date: Sat, 15 Apr 2023 23:04:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 4835/9838]
 drivers/staging/media/imx/hdmirx/cdns-mhdp-hdmirx.c:90:5: warning: no
 previous prototype for 'hdmirx_mailbox_read'
Message-ID: <202304152234.3jVPCL6H-lkp@intel.com>
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
commit: eb44a1a6115684ddd4f8001ff5b6156f18c296aa [4835/9838] Merge branch 'display/next' into next
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304152234.3jVPCL6H-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/eb44a1a6115684ddd4f8001ff5b6156f18c296aa
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout eb44a1a6115684ddd4f8001ff5b6156f18c296aa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/firmware/imx/ drivers/mailbox/ drivers/media/platform/mxc/capture/ drivers/net/ drivers/pwm/ drivers/regulator/ drivers/soc/imx/ drivers/staging/ drivers/video/fbdev/mxc/ sound/soc/fsl/ sound/soc/sof/amd/ sound/soc/sof/imx/ sound/soc/sof/intel/ sound/soc/sof/mediatek/mt8186/ sound/soc/sof/mediatek/mt8195/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304152234.3jVPCL6H-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/media/imx/hdmirx/cdns-mhdp-hdmirx.c:90:5: warning: no previous prototype for 'hdmirx_mailbox_read' [-Wmissing-prototypes]
      90 | int hdmirx_mailbox_read(struct cdns_hdmirx_device *hdmirx)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/hdmirx/cdns-mhdp-hdmirx.c:249:5: warning: no previous prototype for 'cdns_hdmirx_reg_write_bit' [-Wmissing-prototypes]
     249 | int cdns_hdmirx_reg_write_bit(struct cdns_hdmirx_device *hdmirx, u16 addr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/staging/media/imx/hdmirx/cdns-hdmirx-hw.c: In function 'cdns_hdmirx_phyinit':
>> drivers/staging/media/imx/hdmirx/cdns-hdmirx-hw.c:673:34: warning: variable 'events' set but not used [-Wunused-but-set-variable]
     673 |                         uint32_t events;
         |                                  ^~~~~~
   drivers/staging/media/imx/hdmirx/cdns-hdmirx-hw.c: At top level:
>> drivers/staging/media/imx/hdmirx/cdns-hdmirx-hw.c:689:5: warning: no previous prototype for 'hdmirx_config' [-Wmissing-prototypes]
     689 | int hdmirx_config(struct cdns_hdmirx_device *hdmirx)
         |     ^~~~~~~~~~~~~
--
>> drivers/staging/media/imx/hdmirx/cdns-hdmirx-phy.c:88:5: warning: no previous prototype for 'inside_i' [-Wmissing-prototypes]
      88 | u16 inside_i(u16 value, u16 left_sharp_corner,
         |     ^~~~~~~~
>> drivers/staging/media/imx/hdmirx/cdns-hdmirx-phy.c:98:5: warning: no previous prototype for 'inside_f' [-Wmissing-prototypes]
      98 | u16 inside_f(u32 value, u32 left_sharp_corner, u32 right_sharp_corner)
         |     ^~~~~~~~
   drivers/staging/media/imx/hdmirx/cdns-hdmirx-phy.c: In function 'pre_data_rate_change':
>> drivers/staging/media/imx/hdmirx/cdns-hdmirx-phy.c:198:13: warning: variable 'ret_val' set but not used [-Wunused-but-set-variable]
     198 |         int ret_val;
         |             ^~~~~~~
   drivers/staging/media/imx/hdmirx/cdns-hdmirx-phy.c: In function 'pma_pll_config':
>> drivers/staging/media/imx/hdmirx/cdns-hdmirx-phy.c:545:21: warning: variable 'xcvr_power_state_ack' set but not used [-Wunused-but-set-variable]
     545 |         reg_field_t xcvr_power_state_ack;
         |                     ^~~~~~~~~~~~~~~~~~~~
--
   drivers/staging/media/imx/hdmirx/cdns-hdmirx.c: In function 'tmdsmon_fn':
>> drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:904:58: warning: variable 'events' set but not used [-Wunused-but-set-variable]
     904 |                                                 uint32_t events;
         |                                                          ^~~~~~


vim +/hdmirx_mailbox_read +90 drivers/staging/media/imx/hdmirx/cdns-mhdp-hdmirx.c

5fe415c53f8c37 Sandor Yu 2020-12-09   89  
5fe415c53f8c37 Sandor Yu 2020-12-09  @90  int hdmirx_mailbox_read(struct cdns_hdmirx_device *hdmirx)
5fe415c53f8c37 Sandor Yu 2020-12-09   91  {
5fe415c53f8c37 Sandor Yu 2020-12-09   92  	int val, ret;
5fe415c53f8c37 Sandor Yu 2020-12-09   93  
5fe415c53f8c37 Sandor Yu 2020-12-09   94  	ret = hdmirx_readx_poll_timeout(cdns_hdmirx_bus_read, hdmirx, MAILBOX_EMPTY_ADDR,
5fe415c53f8c37 Sandor Yu 2020-12-09   95  				 val, !val, MAILBOX_RETRY_US,
5fe415c53f8c37 Sandor Yu 2020-12-09   96  				 MAILBOX_TIMEOUT_US);
5fe415c53f8c37 Sandor Yu 2020-12-09   97  	if (ret < 0)
5fe415c53f8c37 Sandor Yu 2020-12-09   98  		return ret;
5fe415c53f8c37 Sandor Yu 2020-12-09   99  
5fe415c53f8c37 Sandor Yu 2020-12-09  100  	return cdns_hdmirx_bus_read(hdmirx, MAILBOX0_RD_DATA) & 0xff;
5fe415c53f8c37 Sandor Yu 2020-12-09  101  }
5fe415c53f8c37 Sandor Yu 2020-12-09  102  
5fe415c53f8c37 Sandor Yu 2020-12-09  103  static int hdmirx_mailbox_write(struct cdns_hdmirx_device *hdmirx, u8 val)
5fe415c53f8c37 Sandor Yu 2020-12-09  104  {
5fe415c53f8c37 Sandor Yu 2020-12-09  105  	int ret, full;
5fe415c53f8c37 Sandor Yu 2020-12-09  106  
5fe415c53f8c37 Sandor Yu 2020-12-09  107  	ret = hdmirx_readx_poll_timeout(cdns_hdmirx_bus_read, hdmirx, MAILBOX_FULL_ADDR,
5fe415c53f8c37 Sandor Yu 2020-12-09  108  				 full, !full, MAILBOX_RETRY_US,
5fe415c53f8c37 Sandor Yu 2020-12-09  109  				 MAILBOX_TIMEOUT_US);
5fe415c53f8c37 Sandor Yu 2020-12-09  110  	if (ret < 0)
5fe415c53f8c37 Sandor Yu 2020-12-09  111  		return ret;
5fe415c53f8c37 Sandor Yu 2020-12-09  112  
5fe415c53f8c37 Sandor Yu 2020-12-09  113  	cdns_hdmirx_bus_write(val, hdmirx, MAILBOX0_WR_DATA);
5fe415c53f8c37 Sandor Yu 2020-12-09  114  
5fe415c53f8c37 Sandor Yu 2020-12-09  115  	return 0;
5fe415c53f8c37 Sandor Yu 2020-12-09  116  }
5fe415c53f8c37 Sandor Yu 2020-12-09  117  
5fe415c53f8c37 Sandor Yu 2020-12-09  118  int cdns_hdmirx_mailbox_validate_receive(struct cdns_hdmirx_device *hdmirx,
5fe415c53f8c37 Sandor Yu 2020-12-09  119  					      u8 module_id, u8 opcode, u16 req_size)
5fe415c53f8c37 Sandor Yu 2020-12-09  120  {
5fe415c53f8c37 Sandor Yu 2020-12-09  121  	u32 mbox_size, i;
5fe415c53f8c37 Sandor Yu 2020-12-09  122  	u8 header[4];
5fe415c53f8c37 Sandor Yu 2020-12-09  123  	int ret;
5fe415c53f8c37 Sandor Yu 2020-12-09  124  
5fe415c53f8c37 Sandor Yu 2020-12-09  125  	/* read the header of the message */
5fe415c53f8c37 Sandor Yu 2020-12-09  126  	for (i = 0; i < 4; i++) {
5fe415c53f8c37 Sandor Yu 2020-12-09  127  		ret = hdmirx_mailbox_read(hdmirx);
5fe415c53f8c37 Sandor Yu 2020-12-09  128  		if (ret < 0)
5fe415c53f8c37 Sandor Yu 2020-12-09  129  			return ret;
5fe415c53f8c37 Sandor Yu 2020-12-09  130  
5fe415c53f8c37 Sandor Yu 2020-12-09  131  		header[i] = ret;
5fe415c53f8c37 Sandor Yu 2020-12-09  132  	}
5fe415c53f8c37 Sandor Yu 2020-12-09  133  
5fe415c53f8c37 Sandor Yu 2020-12-09  134  	mbox_size = get_unaligned_be16(header + 2);
5fe415c53f8c37 Sandor Yu 2020-12-09  135  
5fe415c53f8c37 Sandor Yu 2020-12-09  136  	if (opcode != header[0] || module_id != header[1] ||
5fe415c53f8c37 Sandor Yu 2020-12-09  137  	    req_size != mbox_size) {
5fe415c53f8c37 Sandor Yu 2020-12-09  138  		/*
5fe415c53f8c37 Sandor Yu 2020-12-09  139  		 * If the message in mailbox is not what we want, we need to
5fe415c53f8c37 Sandor Yu 2020-12-09  140  		 * clear the mailbox by reading its contents.
5fe415c53f8c37 Sandor Yu 2020-12-09  141  		 */
5fe415c53f8c37 Sandor Yu 2020-12-09  142  		for (i = 0; i < mbox_size; i++)
5fe415c53f8c37 Sandor Yu 2020-12-09  143  			if (hdmirx_mailbox_read(hdmirx) < 0)
5fe415c53f8c37 Sandor Yu 2020-12-09  144  				break;
5fe415c53f8c37 Sandor Yu 2020-12-09  145  
5fe415c53f8c37 Sandor Yu 2020-12-09  146  		return -EINVAL;
5fe415c53f8c37 Sandor Yu 2020-12-09  147  	}
5fe415c53f8c37 Sandor Yu 2020-12-09  148  
5fe415c53f8c37 Sandor Yu 2020-12-09  149  	return 0;
5fe415c53f8c37 Sandor Yu 2020-12-09  150  }
5fe415c53f8c37 Sandor Yu 2020-12-09  151  
5fe415c53f8c37 Sandor Yu 2020-12-09  152  int cdns_hdmirx_mailbox_read_receive(struct cdns_hdmirx_device *hdmirx,
5fe415c53f8c37 Sandor Yu 2020-12-09  153  					  u8 *buff, u16 buff_size)
5fe415c53f8c37 Sandor Yu 2020-12-09  154  {
5fe415c53f8c37 Sandor Yu 2020-12-09  155  	u32 i;
5fe415c53f8c37 Sandor Yu 2020-12-09  156  	int ret;
5fe415c53f8c37 Sandor Yu 2020-12-09  157  
5fe415c53f8c37 Sandor Yu 2020-12-09  158  	for (i = 0; i < buff_size; i++) {
5fe415c53f8c37 Sandor Yu 2020-12-09  159  		ret = hdmirx_mailbox_read(hdmirx);
5fe415c53f8c37 Sandor Yu 2020-12-09  160  		if (ret < 0)
5fe415c53f8c37 Sandor Yu 2020-12-09  161  			return ret;
5fe415c53f8c37 Sandor Yu 2020-12-09  162  
5fe415c53f8c37 Sandor Yu 2020-12-09  163  		buff[i] = ret;
5fe415c53f8c37 Sandor Yu 2020-12-09  164  	}
5fe415c53f8c37 Sandor Yu 2020-12-09  165  
5fe415c53f8c37 Sandor Yu 2020-12-09  166  	return 0;
5fe415c53f8c37 Sandor Yu 2020-12-09  167  }
5fe415c53f8c37 Sandor Yu 2020-12-09  168  
5fe415c53f8c37 Sandor Yu 2020-12-09  169  int cdns_hdmirx_mailbox_send(struct cdns_hdmirx_device *hdmirx, u8 module_id,
5fe415c53f8c37 Sandor Yu 2020-12-09  170  				  u8 opcode, u16 size, u8 *message)
5fe415c53f8c37 Sandor Yu 2020-12-09  171  {
5fe415c53f8c37 Sandor Yu 2020-12-09  172  	u8 header[4];
5fe415c53f8c37 Sandor Yu 2020-12-09  173  	int ret, i;
5fe415c53f8c37 Sandor Yu 2020-12-09  174  
5fe415c53f8c37 Sandor Yu 2020-12-09  175  	header[0] = opcode;
5fe415c53f8c37 Sandor Yu 2020-12-09  176  	header[1] = module_id;
5fe415c53f8c37 Sandor Yu 2020-12-09  177  	put_unaligned_be16(size, header + 2);
5fe415c53f8c37 Sandor Yu 2020-12-09  178  
5fe415c53f8c37 Sandor Yu 2020-12-09  179  	for (i = 0; i < 4; i++) {
5fe415c53f8c37 Sandor Yu 2020-12-09  180  		ret = hdmirx_mailbox_write(hdmirx, header[i]);
5fe415c53f8c37 Sandor Yu 2020-12-09  181  		if (ret)
5fe415c53f8c37 Sandor Yu 2020-12-09  182  			return ret;
5fe415c53f8c37 Sandor Yu 2020-12-09  183  	}
5fe415c53f8c37 Sandor Yu 2020-12-09  184  
5fe415c53f8c37 Sandor Yu 2020-12-09  185  	for (i = 0; i < size; i++) {
5fe415c53f8c37 Sandor Yu 2020-12-09  186  		ret = hdmirx_mailbox_write(hdmirx, message[i]);
5fe415c53f8c37 Sandor Yu 2020-12-09  187  		if (ret)
5fe415c53f8c37 Sandor Yu 2020-12-09  188  			return ret;
5fe415c53f8c37 Sandor Yu 2020-12-09  189  	}
5fe415c53f8c37 Sandor Yu 2020-12-09  190  
5fe415c53f8c37 Sandor Yu 2020-12-09  191  	return 0;
5fe415c53f8c37 Sandor Yu 2020-12-09  192  }
5fe415c53f8c37 Sandor Yu 2020-12-09  193  
5fe415c53f8c37 Sandor Yu 2020-12-09  194  int cdns_hdmirx_reg_read(struct cdns_hdmirx_device *hdmirx, u32 addr)
5fe415c53f8c37 Sandor Yu 2020-12-09  195  {
5fe415c53f8c37 Sandor Yu 2020-12-09  196  	u8 msg[4], resp[8];
5fe415c53f8c37 Sandor Yu 2020-12-09  197  	u32 val;
5fe415c53f8c37 Sandor Yu 2020-12-09  198  	int ret;
5fe415c53f8c37 Sandor Yu 2020-12-09  199  
5fe415c53f8c37 Sandor Yu 2020-12-09  200  	if (addr == 0) {
5fe415c53f8c37 Sandor Yu 2020-12-09  201  		ret = -EINVAL;
5fe415c53f8c37 Sandor Yu 2020-12-09  202  		goto err_reg_read;
5fe415c53f8c37 Sandor Yu 2020-12-09  203  	}
5fe415c53f8c37 Sandor Yu 2020-12-09  204  
5fe415c53f8c37 Sandor Yu 2020-12-09  205  	put_unaligned_be32(addr, msg);
5fe415c53f8c37 Sandor Yu 2020-12-09  206  
5fe415c53f8c37 Sandor Yu 2020-12-09  207  	ret = cdns_hdmirx_mailbox_send(hdmirx, MB_MODULE_ID_GENERAL,
5fe415c53f8c37 Sandor Yu 2020-12-09  208  				     GENERAL_READ_REGISTER,
5fe415c53f8c37 Sandor Yu 2020-12-09  209  				     sizeof(msg), msg);
5fe415c53f8c37 Sandor Yu 2020-12-09  210  	if (ret)
5fe415c53f8c37 Sandor Yu 2020-12-09  211  		goto err_reg_read;
5fe415c53f8c37 Sandor Yu 2020-12-09  212  
5fe415c53f8c37 Sandor Yu 2020-12-09  213  	ret = cdns_hdmirx_mailbox_validate_receive(hdmirx, MB_MODULE_ID_GENERAL,
5fe415c53f8c37 Sandor Yu 2020-12-09  214  						 GENERAL_READ_REGISTER,
5fe415c53f8c37 Sandor Yu 2020-12-09  215  						 sizeof(resp));
5fe415c53f8c37 Sandor Yu 2020-12-09  216  	if (ret)
5fe415c53f8c37 Sandor Yu 2020-12-09  217  		goto err_reg_read;
5fe415c53f8c37 Sandor Yu 2020-12-09  218  
5fe415c53f8c37 Sandor Yu 2020-12-09  219  	ret = cdns_hdmirx_mailbox_read_receive(hdmirx, resp, sizeof(resp));
5fe415c53f8c37 Sandor Yu 2020-12-09  220  	if (ret)
5fe415c53f8c37 Sandor Yu 2020-12-09  221  		goto err_reg_read;
5fe415c53f8c37 Sandor Yu 2020-12-09  222  
5fe415c53f8c37 Sandor Yu 2020-12-09  223  	/* Returned address value should be the same as requested */
5fe415c53f8c37 Sandor Yu 2020-12-09  224  	if (memcmp(msg, resp, sizeof(msg))) {
5fe415c53f8c37 Sandor Yu 2020-12-09  225  		ret = -EINVAL;
5fe415c53f8c37 Sandor Yu 2020-12-09  226  		goto err_reg_read;
5fe415c53f8c37 Sandor Yu 2020-12-09  227  	}
5fe415c53f8c37 Sandor Yu 2020-12-09  228  
5fe415c53f8c37 Sandor Yu 2020-12-09  229  	val = get_unaligned_be32(resp + 4);
5fe415c53f8c37 Sandor Yu 2020-12-09  230  
5fe415c53f8c37 Sandor Yu 2020-12-09  231  	return val;
5fe415c53f8c37 Sandor Yu 2020-12-09  232  err_reg_read:
5fe415c53f8c37 Sandor Yu 2020-12-09  233  	dev_err(&hdmirx->pdev->dev, "Failed to read register.\n");
5fe415c53f8c37 Sandor Yu 2020-12-09  234  
5fe415c53f8c37 Sandor Yu 2020-12-09  235  	return ret;
5fe415c53f8c37 Sandor Yu 2020-12-09  236  }
5fe415c53f8c37 Sandor Yu 2020-12-09  237  
5fe415c53f8c37 Sandor Yu 2020-12-09  238  int cdns_hdmirx_reg_write(struct cdns_hdmirx_device *hdmirx, u32 addr, u32 val)
5fe415c53f8c37 Sandor Yu 2020-12-09  239  {
5fe415c53f8c37 Sandor Yu 2020-12-09  240  	u8 msg[8];
5fe415c53f8c37 Sandor Yu 2020-12-09  241  
5fe415c53f8c37 Sandor Yu 2020-12-09  242  	put_unaligned_be32(addr, msg);
5fe415c53f8c37 Sandor Yu 2020-12-09  243  	put_unaligned_be32(val, msg + 4);
5fe415c53f8c37 Sandor Yu 2020-12-09  244  
5fe415c53f8c37 Sandor Yu 2020-12-09  245  	return cdns_hdmirx_mailbox_send(hdmirx, MB_MODULE_ID_GENERAL,
5fe415c53f8c37 Sandor Yu 2020-12-09  246  				      GENERAL_WRITE_REGISTER, sizeof(msg), msg);
5fe415c53f8c37 Sandor Yu 2020-12-09  247  }
5fe415c53f8c37 Sandor Yu 2020-12-09  248  
5fe415c53f8c37 Sandor Yu 2020-12-09 @249  int cdns_hdmirx_reg_write_bit(struct cdns_hdmirx_device *hdmirx, u16 addr,
5fe415c53f8c37 Sandor Yu 2020-12-09  250  				   u8 start_bit, u8 bits_no, u32 val)
5fe415c53f8c37 Sandor Yu 2020-12-09  251  {
5fe415c53f8c37 Sandor Yu 2020-12-09  252  	u8 field[8];
5fe415c53f8c37 Sandor Yu 2020-12-09  253  
5fe415c53f8c37 Sandor Yu 2020-12-09  254  	put_unaligned_be16(addr, field);
5fe415c53f8c37 Sandor Yu 2020-12-09  255  	field[2] = start_bit;
5fe415c53f8c37 Sandor Yu 2020-12-09  256  	field[3] = bits_no;
5fe415c53f8c37 Sandor Yu 2020-12-09  257  	put_unaligned_be32(val, field + 4);
5fe415c53f8c37 Sandor Yu 2020-12-09  258  
5fe415c53f8c37 Sandor Yu 2020-12-09  259  	return cdns_hdmirx_mailbox_send(hdmirx, MB_MODULE_ID_DP_TX,
5fe415c53f8c37 Sandor Yu 2020-12-09  260  				      DPTX_WRITE_FIELD, sizeof(field), field);
5fe415c53f8c37 Sandor Yu 2020-12-09  261  }
5fe415c53f8c37 Sandor Yu 2020-12-09  262  

:::::: The code at line 90 was first introduced by commit
:::::: 5fe415c53f8c3748600505f8fef001b37d516d57 MLK-24081-06: staging: media: imx: Add hdmi rx driver

:::::: TO: Sandor Yu <Sandor.yu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
