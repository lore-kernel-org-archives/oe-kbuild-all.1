Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7C02744F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0M7G26K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697721736; x=1729257736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yWDIqJK0v1ukKdDSKR/LKTqW+D7+ixLXAy7UhGpSXzM=;
  b=n0M7G26Kb0kPWOQVrUVmdZKMGeNTSrktDLXmQLWNVENREFyQ7P9yyn1T
   CaTbvb1Cm4bqzGO/jmzXyO/BNV7TPUW8XaB6qeMa9c9lhiIGQjqdFjFJG
   GYeuKNbHXCy5RT9M9pAO6Mi6+MeOb2UW4pRB45mVeemNsfylWfMISFt4G
   LH0DYlwIeEiNmT8VINQ89mS3GTh/7jKwLP+qwq8u0ZNLM/4iCMncU5ya4
   Heexz1QtTg0If3hDvJu9mVurYuXxLnixi2sDKds6WaGGwclIT4XA8V5Ol
   +Z2aDa/6e3fcndYDaqUd34ku6BQsI2QwYygutKJP7Uge6TtBS8VcT4SUY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385124546"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="385124546"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 06:22:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="757028508"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="757028508"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Oct 2023 06:22:11 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtSyX-00028n-11;
	Thu, 19 Oct 2023 13:22:09 +0000
Date: Thu, 19 Oct 2023 21:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ranjan Dutta <ranjan.dutta@intel.com>,
	Chen Meng J <meng.j.chen@intel.com>
Subject: [intel-lts:5.15/linux 46/67] drivers/media/i2c/d4xx.c:4579:57:
 warning: '%x' directive output may be truncated writing between 1 and 4
 bytes into a region of size 1
Message-ID: <202310192118.tZcVZgch-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   c1f04fe08dbdb93b88865ffa356aa27c49b58d07
commit: fce663db7ccc271a565fc391ca6f38bbe2e16085 [46/67] media: d4xx: rename d4xx.h to d4xx_pdata.h
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20231019/202310192118.tZcVZgch-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310192118.tZcVZgch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310192118.tZcVZgch-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/d4xx.c:2918:17: warning: initialized field overwritten [-Woverride-init]
    2918 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:2918:17: note: (near initialization for 'ds5_ctrl_erb.step')
   drivers/media/i2c/d4xx.c:2932:17: warning: initialized field overwritten [-Woverride-init]
    2932 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:2932:17: note: (near initialization for 'ds5_ctrl_ewb.step')
   drivers/media/i2c/d4xx.c:2946:17: warning: initialized field overwritten [-Woverride-init]
    2946 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:2946:17: note: (near initialization for 'ds5_ctrl_hwmc.step')
   drivers/media/i2c/d4xx.c: In function 'ds5_mux_s_stream':
   drivers/media/i2c/d4xx.c:3657:53: warning: variable 'stream_id' set but not used [-Wunused-but-set-variable]
    3657 |         u16 config_status_base, stream_status_base, stream_id;
         |                                                     ^~~~~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_mux_s_stream_vc':
   drivers/media/i2c/d4xx.c:3798:53: warning: variable 'stream_id' set but not used [-Wunused-but-set-variable]
    3798 |         u16 config_status_base, stream_status_base, stream_id;
         |                                                     ^~~~~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_hw_init':
   drivers/media/i2c/d4xx.c:4146:29: warning: unused variable 'sd' [-Wunused-variable]
    4146 |         struct v4l2_subdev *sd = &state->mux.sd.subdev;
         |                             ^~
   drivers/media/i2c/d4xx.c: In function 'ds5_dfu_device_open':
   drivers/media/i2c/d4xx.c:4681:29: warning: unused variable 'parent' [-Wunused-variable]
    4681 |         struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(
         |                             ^~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_i2c_addr_setting':
   drivers/media/i2c/d4xx.c:5049:12: warning: unused variable 'val' [-Wunused-variable]
    5049 |         u8 val;
         |            ^~~
   drivers/media/i2c/d4xx.c: In function 'ds5_dfu_device_write':
   drivers/media/i2c/d4xx.c:4604:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    4604 |                 if (ret < 0) {
         |                    ^
   drivers/media/i2c/d4xx.c:4610:9: note: here
    4610 |         case DS5_DFU_RECOVERY:
         |         ^~~~
   drivers/media/i2c/d4xx.c:4618:43: warning: this statement may fall through [-Wimplicit-fallthrough=]
    4618 |                 state->dfu_dev.init_v4l_f = 1;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/media/i2c/d4xx.c:4621:9: note: here
    4621 |         case DS5_DFU_IN_PROGRESS: {
         |         ^~~~
   drivers/media/i2c/d4xx.c: At top level:
   drivers/media/i2c/d4xx.c:1021:13: warning: 'ds5_set_state_last_set' defined but not used [-Wunused-function]
    1021 | static void ds5_set_state_last_set(struct ds5 *state)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:867:36: warning: 'ds5_size_w10' defined but not used [-Wunused-const-variable=]
     867 | static const struct ds5_resolution ds5_size_w10 = {
         |                                    ^~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:697:18: warning: 'ds5_framerate_25' defined but not used [-Wunused-const-variable=]
     697 | static const u16 ds5_framerate_25 = 25;
         |                  ^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:681:18: warning: 'ds5_default_framerate' defined but not used [-Wunused-const-variable=]
     681 | static const u16 ds5_default_framerate = 30;
         |                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:533:12: warning: 'ds5_write_8' defined but not used [-Wunused-function]
     533 | static int ds5_write_8(struct ds5 *state, u16 reg, u8 val)
         |            ^~~~~~~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_dfu_device_read':
>> drivers/media/i2c/d4xx.c:4579:57: warning: '%x' directive output may be truncated writing between 1 and 4 bytes into a region of size 1 [-Wformat-truncation=]
    4579 |         snprintf(msg, sizeof(msg), "DFU info: \tver: (0x%x)\n", fw_ver);
         |                                                         ^~
   drivers/media/i2c/d4xx.c:4579:36: note: directive argument in the range [0, 65535]
    4579 |         snprintf(msg, sizeof(msg), "DFU info: \tver: (0x%x)\n", fw_ver);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4579:9: note: 'snprintf' output between 23 and 26 bytes into a destination of size 20
    4579 |         snprintf(msg, sizeof(msg), "DFU info: \tver: (0x%x)\n", fw_ver);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_send_hwmc':
   drivers/media/i2c/d4xx.c:1986:26: warning: array subscript 1000 is outside array bounds of 'unsigned char[0]' [-Warray-bounds=]
    1986 |                 cmd->Data[1000] = (unsigned char)((*dataLen) & 0x00FF);
         |                 ~~~~~~~~~^~~~~~
   drivers/media/i2c/d4xx.c:228:23: note: while referencing 'Data'
     228 |         unsigned char Data[0];
         |                       ^~~~
   drivers/media/i2c/d4xx.c:1987:26: warning: array subscript 1001 is outside array bounds of 'unsigned char[0]' [-Warray-bounds=]
    1987 |                 cmd->Data[1001] = (unsigned char)(((*dataLen) & 0xFF00) >> 8);
         |                 ~~~~~~~~~^~~~~~
   drivers/media/i2c/d4xx.c:228:23: note: while referencing 'Data'
     228 |         unsigned char Data[0];
         |                       ^~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_PMC_CORE
   Depends on [n]: X86 && X86_PLATFORM_DEVICES [=n] && PCI [=y] && ACPI
   Selected by [m]:
   - DWMAC_INTEL_PLAT [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_PLATFORM [=m] && OF [=y] && COMMON_CLK [=y] && STMMAC_ETH [=m]


vim +4579 drivers/media/i2c/d4xx.c

cfb5743695d51c3 zouxiaoh 2022-11-28  4564  
cfb5743695d51c3 zouxiaoh 2022-11-28  4565  /* When a process reads from our device, this gets called. */
db4067cbf480f22 zouxiaoh 2023-03-22  4566  static ssize_t ds5_dfu_device_read(struct file *flip,
db4067cbf480f22 zouxiaoh 2023-03-22  4567  		char __user *buffer, size_t len, loff_t *offset)
cfb5743695d51c3 zouxiaoh 2022-11-28  4568  {
cfb5743695d51c3 zouxiaoh 2022-11-28  4569  	struct ds5 *state = flip->private_data;
cfb5743695d51c3 zouxiaoh 2022-11-28  4570  	u16 fw_ver;
cfb5743695d51c3 zouxiaoh 2022-11-28  4571  	char msg[20];
cfb5743695d51c3 zouxiaoh 2022-11-28  4572  	int ret = 0;
cfb5743695d51c3 zouxiaoh 2022-11-28  4573  
cfb5743695d51c3 zouxiaoh 2022-11-28  4574  	if (mutex_lock_interruptible(&state->lock))
cfb5743695d51c3 zouxiaoh 2022-11-28  4575  		return -ERESTARTSYS;
cfb5743695d51c3 zouxiaoh 2022-11-28  4576  	ret = ds5_read(state, DS5_FW_VERSION, &fw_ver);
cfb5743695d51c3 zouxiaoh 2022-11-28  4577  	if (ret < 0)
cfb5743695d51c3 zouxiaoh 2022-11-28  4578  		goto e_dfu_read_failed;
db4067cbf480f22 zouxiaoh 2023-03-22 @4579  	snprintf(msg, sizeof(msg), "DFU info: \tver: (0x%x)\n", fw_ver);
cfb5743695d51c3 zouxiaoh 2022-11-28  4580  	if (copy_to_user(buffer, msg, strlen(msg)))
cfb5743695d51c3 zouxiaoh 2022-11-28  4581  		ret = -EFAULT;
cfb5743695d51c3 zouxiaoh 2022-11-28  4582  	else {
cfb5743695d51c3 zouxiaoh 2022-11-28  4583  		state->dfu_dev.msg_write_once = ~state->dfu_dev.msg_write_once;
cfb5743695d51c3 zouxiaoh 2022-11-28  4584  		ret = strlen(msg) & state->dfu_dev.msg_write_once;
cfb5743695d51c3 zouxiaoh 2022-11-28  4585  	}
cfb5743695d51c3 zouxiaoh 2022-11-28  4586  
cfb5743695d51c3 zouxiaoh 2022-11-28  4587  e_dfu_read_failed:
cfb5743695d51c3 zouxiaoh 2022-11-28  4588  	mutex_unlock(&state->lock);
cfb5743695d51c3 zouxiaoh 2022-11-28  4589  	return ret;
cfb5743695d51c3 zouxiaoh 2022-11-28  4590  };
cfb5743695d51c3 zouxiaoh 2022-11-28  4591  

:::::: The code at line 4579 was first introduced by commit
:::::: db4067cbf480f22e8b0b0ef4467bb6e69e65250e media: i2c: d4xx: Update to match RealSense latest code.

:::::: TO: zouxiaoh <xiaohong.zou@intel.com>
:::::: CC: Ranjan Dutta <ranjan.dutta@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
