Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48B2D28F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuRd6cHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697875922; x=1729411922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xKto+eFPcHCGLuUwNTgjYJd1mBmMWBsCn2CMTcbz4v8=;
  b=SuRd6cHjBP1/Hev5/G/jb/nv13hcBBUn50R5w47qcCoUqCXxrgdLtIL8
   jNTQ2PCnAICA6WtpG7iz0OHSlX7U5H5LEZpPPhyCEmF/r34TURQ3aTqq0
   zLAhP2kp7aFOtKvbPbmAgMn404yCYlEnPFoEp4jfLXtHVG45SqcxzAqBB
   T4kz3Hk6XhXZ32VkoCaLrHDIa8u5456OD+vqxxqXc54Kwz/FU3yXLheJV
   G/S5N3Avv/oBfHsda4v593kLxi6tlRO/zW1PAd1KHlxuMaFZYBOOr4Ong
   FnKicLI98GEo4HF0rXOjabYJU/uk0k75YvlovJiKbCR1gy901oUWtQj0Z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="376995539"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="376995539"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 01:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="848315135"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="848315135"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Oct 2023 01:11:57 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu75P-0004bV-0m;
	Sat, 21 Oct 2023 08:11:55 +0000
Date: Sat, 21 Oct 2023 16:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, renjiaox <jiaojiaox.ren@intel.com>
Subject: [intel-lts:5.15/linux 22/38] drivers/media/i2c/d4xx.c:1779:33:
 warning: writing 1 byte into a region of size 0
Message-ID: <202310211612.NOkbFgVX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   be9dd64367794ed5d4f3ac734bf996e416098f80
commit: cfb5743695d51c3d275a3646d140336c6e515358 [22/38] media: intel-ipu6: implement new vc solution
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231021/202310211612.NOkbFgVX-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310211612.NOkbFgVX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310211612.NOkbFgVX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/d4xx.c:2344:17: warning: initialized field overwritten [-Woverride-init]
    2344 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:2344:17: note: (near initialization for 'ds5_ctrl_erb.step')
   drivers/media/i2c/d4xx.c:2358:17: warning: initialized field overwritten [-Woverride-init]
    2358 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:2358:17: note: (near initialization for 'ds5_ctrl_ewb.step')
   drivers/media/i2c/d4xx.c:2372:17: warning: initialized field overwritten [-Woverride-init]
    2372 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:2372:17: note: (near initialization for 'ds5_ctrl_hwmc.step')
   drivers/media/i2c/d4xx.c: In function 'ds5_sensor_init':
   drivers/media/i2c/d4xx.c:2524:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    2524 |         struct d4xx_pdata *dpdata = c->dev.platform_data;
         |         ^~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_mux_set_fmt':
   drivers/media/i2c/d4xx.c:2806:21: warning: unused variable 'state' [-Wunused-variable]
    2806 |         struct ds5 *state = container_of(sd, struct ds5, mux.sd.subdev);
         |                     ^~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_mux_s_stream':
   drivers/media/i2c/d4xx.c:3052:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    3052 |         u16 err_status;
         |         ^~~
   drivers/media/i2c/d4xx.c:3056:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    3056 |         u16 tmp;
         |         ^~~
   drivers/media/i2c/d4xx.c:2938:53: warning: variable 'stream_id' set but not used [-Wunused-but-set-variable]
    2938 |         u16 config_status_base, stream_status_base, stream_id;
         |                                                     ^~~~~~~~~
   drivers/media/i2c/d4xx.c:2935:102: warning: unused variable 's_stream' [-Wunused-variable]
    2935 |         u16 streaming_depth, streaming_rgb, streaming_y8, rate, depth_status, rgb_status, y8_status, s_stream;
         |                                                                                                      ^~~~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_mux_s_stream_vc':
   drivers/media/i2c/d4xx.c:3211:13: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    3211 |             u16 err_status;
         |             ^~~
   drivers/media/i2c/d4xx.c:3215:5: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    3215 |     u16 tmp;
         |     ^~~
   drivers/media/i2c/d4xx.c:3086:53: warning: variable 'stream_id' set but not used [-Wunused-but-set-variable]
    3086 |         u16 config_status_base, stream_status_base, stream_id;
         |                                                     ^~~~~~~~~
   drivers/media/i2c/d4xx.c:3083:102: warning: unused variable 's_stream' [-Wunused-variable]
    3083 |         u16 streaming_depth, streaming_rgb, streaming_y8, rate, depth_status, rgb_status, y8_status, s_stream;
         |                                                                                                      ^~~~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_des_register':
   drivers/media/i2c/d4xx.c:3353:1: warning: label 'e_sd' defined but not used [-Wunused-label]
    3353 | e_sd:
         | ^~~~
   drivers/media/i2c/d4xx.c:3332:30: warning: unused variable 'entity' [-Wunused-variable]
    3332 |         struct media_entity *entity = &des->sd.entity;
         |                              ^~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_mux_init':
   drivers/media/i2c/d4xx.c:3531:1: warning: label 'e_entity' defined but not used [-Wunused-label]
    3531 | e_entity:
         | ^~~~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_parse_cam':
   drivers/media/i2c/d4xx.c:3674:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    3674 |         int ret;
         |         ^~~
   drivers/media/i2c/d4xx.c: In function 'device_write':
   drivers/media/i2c/d4xx.c:3865:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    3865 |                 if (ret < 0) {
         |                    ^
   drivers/media/i2c/d4xx.c:3870:9: note: here
    3870 |         case DS5_DFU_RECOVERY:
         |         ^~~~
   drivers/media/i2c/d4xx.c:3877:43: warning: this statement may fall through [-Wimplicit-fallthrough=]
    3877 |                 state->dfu_dev.init_v4l_f = 1;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/media/i2c/d4xx.c:3880:9: note: here
    3880 |         case DS5_DFU_IN_PROGRESS: {
         |         ^~~~
   drivers/media/i2c/d4xx.c: At top level:
   drivers/media/i2c/d4xx.c:3455:12: warning: 'ds5_des_init' defined but not used [-Wunused-function]
    3455 | static int ds5_des_init(struct i2c_client *c, struct ds5 *state)
         |            ^~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:3329:12: warning: 'ds5_des_register' defined but not used [-Wunused-function]
    3329 | static int ds5_des_register(struct ds5 *state, struct ds5_des *des)
         |            ^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:1233:12: warning: 'ds5_configure' defined but not used [-Wunused-function]
    1233 | static int ds5_configure(struct ds5 *state)
         |            ^~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:797:36: warning: 'ds5_size_w10' defined but not used [-Wunused-const-variable=]
     797 | static const struct ds5_resolution ds5_size_w10 = {
         |                                    ^~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:627:18: warning: 'ds5_framerate_25' defined but not used [-Wunused-const-variable=]
     627 | static const u16 ds5_framerate_25 = 25;
         |                  ^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:611:18: warning: 'ds5_default_framerate' defined but not used [-Wunused-const-variable=]
     611 | static const u16 ds5_default_framerate = 30;
         |                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_send_hwmc':
>> drivers/media/i2c/d4xx.c:1779:33: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
    1779 |                 cmd->Data[1000] = (unsigned char)((*dataLen) & 0x00FF);
         |                 ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:222:23: note: at offset 1000 into destination object 'Data' of size 0
     222 |         unsigned char Data[0];
         |                       ^~~~
   drivers/media/i2c/d4xx.c:1780:33: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
    1780 |                 cmd->Data[1001] = (unsigned char)(((*dataLen) & 0xFF00) >> 8);
         |                 ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:222:23: note: at offset 1001 into destination object 'Data' of size 0
     222 |         unsigned char Data[0];
         |                       ^~~~
   drivers/media/i2c/d4xx.c: In function 'device_read':
   drivers/media/i2c/d4xx.c:3841:43: warning: '%x' directive writing between 1 and 4 bytes into a region of size 1 [-Wformat-overflow=]
    3841 |         sprintf(msg, "DFU info: \tver: (0x%x)\n", fw_ver);
         |                                           ^~
   drivers/media/i2c/d4xx.c:3841:22: note: directive argument in the range [0, 65535]
    3841 |         sprintf(msg, "DFU info: \tver: (0x%x)\n", fw_ver);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:3841:9: note: 'sprintf' output between 23 and 26 bytes into a destination of size 20
    3841 |         sprintf(msg, "DFU info: \tver: (0x%x)\n", fw_ver);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_PMC_CORE
   Depends on [n]: X86 && X86_PLATFORM_DEVICES [=n] && PCI [=y] && ACPI
   Selected by [y]:
   - DWMAC_INTEL_PLAT [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_PLATFORM [=y] && OF [=y] && COMMON_CLK [=y] && STMMAC_ETH [=y]


vim +1779 drivers/media/i2c/d4xx.c

  1736	
  1737	static int ds5_send_hwmc(struct ds5 *state, u16 cmdLen, struct hwm_cmd *cmd,
  1738				 bool isRead, u16 *dataLen)
  1739	{
  1740		int ret = 0;
  1741		u16 status = 2;
  1742		int retries = 20;
  1743		int errorCode;
  1744	
  1745		dev_info(&state->client->dev,
  1746			"%s(): HWMC header: 0x%x, magic: 0x%x, opcode: 0x%x, param1: %d, param2: %d, param3: %d, param4: %d\n",
  1747			__func__,
  1748			cmd->header, cmd->magic_word, cmd->opcode, cmd->param1, cmd->param2, cmd->param3, cmd->param4);
  1749	
  1750		ds5_raw_write_with_check(state, 0x4900, cmd, cmdLen);
  1751	
  1752		ds5_write_with_check(state, 0x490C, 0x01); /* execute cmd */
  1753		do {
  1754			if (retries != 5)
  1755				msleep_range(50);
  1756			ret = ds5_read(state, 0x4904, &status);
  1757		} while (retries-- && status != 0);
  1758	
  1759		if (ret || status != 0) {
  1760			ds5_raw_read(state, 0x4900, &errorCode, 4);
  1761			dev_err(&state->client->dev, "%s(): HWMC failed, ret: %d, status: %x, error code: %d\n",
  1762						__func__, ret, status, errorCode);
  1763			ret = -EAGAIN;
  1764		}
  1765	
  1766		if (isRead) {
  1767			if (*dataLen == 0) {
  1768				ret = regmap_raw_read(state->regmap, 0x4908, dataLen, sizeof(u16));
  1769				if (ret)
  1770					return -EAGAIN;
  1771			}
  1772	
  1773			dev_err(&state->client->dev, "%s(): HWMC read len: %d\n",
  1774						__func__, *dataLen);
  1775			// First 4 bytes of cmd->Data after read will include opcode
  1776			ds5_raw_read_with_check(state, 0x4900, cmd->Data, *dataLen);
  1777	
  1778			/*This is neede for libreealsense, to align there code with UVC*/
> 1779			cmd->Data[1000] = (unsigned char)((*dataLen) & 0x00FF);
  1780			cmd->Data[1001] = (unsigned char)(((*dataLen) & 0xFF00) >> 8);
  1781		}
  1782	
  1783		return 0;
  1784	}
  1785	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
