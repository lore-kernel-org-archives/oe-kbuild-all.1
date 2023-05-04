Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783DC7E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 13:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683208769; x=1714744769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1dbBgYzRdSnPiSJqj9fhVc/cXeWaNr56mgObgZshrkM=;
  b=Cw8zrorZat0TmZ4GfyQUQFnnh1lpyYfZor55duOPwA2eGK9f6plcGT9p
   AIZ/IVmNNzmpMaQeSgmD801oAua8N4dQYkJxBfzuX2wk8oIVUpP3QCpIF
   RlTD/gsfDW5dPY1hQJxjBLODXk6dkLx30myz+FJT2ihCycITPbjtADBtB
   GdX/veooxEAa7iYNXcXSkCJrO5/yqLgqUNyq9eauJYIOGbHDZltXRCE6p
   kQqdaZe44YV+6K8P/E3LC/jmsvwspx2o8ukjwZ3JsHYIkbNApu4ENe8HA
   BYQeFC1s9ROLOuGcDUzl2ZdcB8vDkgAwgKrqlYcuhiNmv2Oy3znrPXP2H
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="414419671"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="414419671"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 06:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="761917419"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="761917419"
Received: from lkp-server01.sh.intel.com (HELO 646801eb55b5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 May 2023 06:23:01 -0700
Received: from kbuild by 646801eb55b5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puYvF-00001h-0t;
	Thu, 04 May 2023 13:23:01 +0000
Date: Thu, 4 May 2023 21:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superna9999:amlogic/v6.3/upstream/dsi-ccf-vim3l 9/17]
 drivers/gpu/drm/meson/meson_venc.c:1595:24: error: implicit declaration of
 function 'FIELD_PREP'
Message-ID: <202305042125.P45qQUSW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/superna9999/linux amlogic/v6.3/upstream/dsi-ccf-vim3l
head:   dc9a851c0d5c5f6d8d1446877e6c7af3e443d7ce
commit: 2ef0ad5ee2fad7d6265065ce13223dde184d8c37 [9/17] drm/meson: venc: add ENCL encoder setup for MIPI-DSI output
config: arm-buildonly-randconfig-r002-20230501 (https://download.01.org/0day-ci/archive/20230504/202305042125.P45qQUSW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/superna9999/linux/commit/2ef0ad5ee2fad7d6265065ce13223dde184d8c37
        git remote add superna9999 https://github.com/superna9999/linux
        git fetch --no-tags superna9999 amlogic/v6.3/upstream/dsi-ccf-vim3l
        git checkout 2ef0ad5ee2fad7d6265065ce13223dde184d8c37
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/meson/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305042125.P45qQUSW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/arm/include/uapi/asm/byteorder.h:22,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arm/include/asm/bitops.h:269,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22,
                    from include/linux/iopoll.h:9,
                    from drivers/gpu/drm/meson/meson_venc.c:9:
   drivers/gpu/drm/meson/meson_venc.c: In function 'meson_encl_set_gamma_table':
>> drivers/gpu/drm/meson/meson_venc.c:1595:24: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
    1595 |                        FIELD_PREP(L_GAMMA_ADDR_PORT_ADDR, 0),
         |                        ^~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:34:51: note: in definition of macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   drivers/gpu/drm/meson/meson_venc.c:1594:9: note: in expansion of macro 'writel_relaxed'
    1594 |         writel_relaxed(L_GAMMA_ADDR_PORT_AUTO_INC | rgb_mask |
         |         ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +1595 drivers/gpu/drm/meson/meson_venc.c

  1579	
  1580	static void meson_encl_set_gamma_table(struct meson_drm *priv, u16 *data,
  1581					       u32 rgb_mask)
  1582	{
  1583		int i, ret;
  1584		u32 reg;
  1585	
  1586		writel_bits_relaxed(L_GAMMA_CNTL_PORT_EN, 0,
  1587				    priv->io_base + _REG(L_GAMMA_CNTL_PORT));
  1588	
  1589		ret = readl_relaxed_poll_timeout(priv->io_base + _REG(L_GAMMA_CNTL_PORT),
  1590						 reg, reg & L_GAMMA_CNTL_PORT_ADR_RDY, 10, 10000);
  1591		if (ret)
  1592			pr_warn("%s: GAMMA ADR_RDY timeout\n", __func__);
  1593	
  1594		writel_relaxed(L_GAMMA_ADDR_PORT_AUTO_INC | rgb_mask |
> 1595			       FIELD_PREP(L_GAMMA_ADDR_PORT_ADDR, 0),
  1596			       priv->io_base + _REG(L_GAMMA_ADDR_PORT));
  1597	
  1598		for (i = 0; i < 256; i++) {
  1599			ret = readl_relaxed_poll_timeout(priv->io_base + _REG(L_GAMMA_CNTL_PORT),
  1600							 reg, reg & L_GAMMA_CNTL_PORT_WR_RDY,
  1601							 10, 10000);
  1602			if (ret)
  1603				pr_warn_once("%s: GAMMA WR_RDY timeout\n", __func__);
  1604	
  1605			writel_relaxed(data[i], priv->io_base + _REG(L_GAMMA_DATA_PORT));
  1606		}
  1607	
  1608		ret = readl_relaxed_poll_timeout(priv->io_base + _REG(L_GAMMA_CNTL_PORT),
  1609						 reg, reg & L_GAMMA_CNTL_PORT_ADR_RDY, 10, 10000);
  1610		if (ret)
  1611			pr_warn("%s: GAMMA ADR_RDY timeout\n", __func__);
  1612	
  1613		writel_relaxed(L_GAMMA_ADDR_PORT_AUTO_INC | rgb_mask |
  1614			       FIELD_PREP(L_GAMMA_ADDR_PORT_ADDR, 0x23),
  1615			       priv->io_base + _REG(L_GAMMA_ADDR_PORT));
  1616	}
  1617	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
