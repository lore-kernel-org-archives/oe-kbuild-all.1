Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3443823749
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714746940; cv=none; b=YRK8sRPpDgp4NUg972Wtvt/y+WyX43Q0PgWrmiyQ88piOTrkcxwv/hSxIe9DyAWW0wt/CjI/UjsAb9BgxHlplKEVW4VWl/WMPhS0MWDJg3l0p1Z1tNvNuWDfUBrkFLa6Si57GpZU8h0MEEtR74bVzH5GvHyxSh4qUZdj9KNyd4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714746940; c=relaxed/simple;
	bh=pSpEjS5FBGfLxU0qfvr19yd4TonnBFesaaRyPFOFkoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qWoskAGU36PNbiyBNYobtfNt5s3Yt3jeyY/2lAiMLjtMx1a35P4sCREBpDTUCWSkhDogRRNRYn9/av+ftQdWVlteKaNU1zRlPZQvpXIyoloAluVyYIv2Sbleu4Ma4DCDhdsL7d3VkzA+L90tM2sQrnZ2y9pLm+DVBjbvRxncw+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGD/dhyx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGD/dhyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714746938; x=1746282938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pSpEjS5FBGfLxU0qfvr19yd4TonnBFesaaRyPFOFkoU=;
  b=oGD/dhyxfNagep1wRVkh2/sGdnfUJAZ28KwpDKr+k+u7Iq80yFd/XBtU
   UMXAxSr9gdKvTO5wLQwKcnmrPCFyJIDP3vvm+m+2rn1AUavD2MtpLqPQf
   H9nlDa5doaM51mTllGFpL8WxcZVSomyueTod+OSb+NgeP10TpT6pJPUFy
   GR8r0CSXuX0x4GB6stEQ65fM9+roBg3MsoWZBZXaIy8w1mBj3W/99uDwZ
   3/z8Xv2fPyBWujZjwS5rKhPqtL9272ZOgAfXMOMOia4p2Yaa8xT4pI7KS
   jFMTdw9Evc1jaOrYzZHBFdB7uFrtEePsXE+yCPlxdv7m3t53KpuRMQ6QK
   g==;
X-CSE-ConnectionGUID: Eg0W975tSKCv/kf8ziCtBg==
X-CSE-MsgGUID: iPCyPbSQQxqnqdxgmgAxLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10683247"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10683247"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:35:37 -0700
X-CSE-ConnectionGUID: j3V2ZS6FQyCdtyAtiyhGsw==
X-CSE-MsgGUID: +UAyKI/EQZGyx3HuL5fulQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27556762"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 May 2024 07:35:36 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2u0b-000Bls-1Z;
	Fri, 03 May 2024 14:35:33 +0000
Date: Fri, 3 May 2024 22:34:50 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 754/1143]
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c:336:18: error: no member named
 'target' in 'struct i3c_master_controller'
Message-ID: <202405032200.Kki8sORE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 40672192ecd8e7a44a42178c87309aee0101d6b8 [754/1143] i3c: mipi-i3c-hci: Support aspeed i3c target mode.
config: arm-randconfig-002-20240503 (https://download.01.org/0day-ci/archive/20240503/202405032200.Kki8sORE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405032200.Kki8sORE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032200.Kki8sORE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i3c/master/mipi-i3c-hci/cmd_v1.c:11:
   In file included from include/linux/i3c/master.h:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/i3c/master/mipi-i3c-hci/cmd_v1.c:11:
   In file included from include/linux/i3c/master.h:15:
   In file included from include/linux/i3c/ccc.h:12:
   include/linux/i3c/device.h:320:1: error: version control conflict marker in file
     320 | <<<<<<< HEAD
         | ^
>> drivers/i3c/master/mipi-i3c-hci/cmd_v1.c:336:18: error: no member named 'target' in 'struct i3c_master_controller'
     336 |         if (hci->master.target) {
         |             ~~~~~~~~~~~ ^
   1 warning and 2 errors generated.
--
   In file included from drivers/i3c/master/mipi-i3c-hci/core.c:15:
   In file included from include/linux/i3c/master.h:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/i3c/master/mipi-i3c-hci/core.c:15:
   In file included from include/linux/i3c/master.h:15:
   In file included from include/linux/i3c/ccc.h:12:
   include/linux/i3c/device.h:320:1: error: version control conflict marker in file
     320 | <<<<<<< HEAD
         | ^
>> drivers/i3c/master/mipi-i3c-hci/core.c:16:10: fatal error: 'linux/i3c/target.h' file not found
      16 | #include <linux/i3c/target.h>
         |          ^~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/i3c/master/mipi-i3c-hci/pio.c:11:
   In file included from include/linux/i3c/master.h:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/i3c/master/mipi-i3c-hci/pio.c:11:
   In file included from include/linux/i3c/master.h:15:
   In file included from include/linux/i3c/ccc.h:12:
   include/linux/i3c/device.h:320:1: error: version control conflict marker in file
     320 | <<<<<<< HEAD
         | ^
>> drivers/i3c/master/mipi-i3c-hci/pio.c:160:18: error: no member named 'target' in 'struct i3c_master_controller'
     160 |         if (hci->master.target) {
         |             ~~~~~~~~~~~ ^
   drivers/i3c/master/mipi-i3c-hci/pio.c:215:57: error: no member named 'target' in 'struct i3c_master_controller'
     215 |               FIELD_PREP(QUEUE_CMD_EMPTY_BUF_THLD, hci->master.target ? 0 : 1);
         |                                                    ~~~~~~~~~~~ ^
   include/linux/bitfield.h:115:33: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                                               ^~~~
   include/linux/bitfield.h:68:41: note: expanded from macro '__BF_FIELD_CHECK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                                                       ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                                          ^~~~
   include/linux/compiler_types.h:449:22: note: expanded from macro 'compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:437:23: note: expanded from macro '_compiletime_assert'
     437 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:429:9: note: expanded from macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/i3c/master/mipi-i3c-hci/pio.c:215:57: error: no member named 'target' in 'struct i3c_master_controller'
     215 |               FIELD_PREP(QUEUE_CMD_EMPTY_BUF_THLD, hci->master.target ? 0 : 1);
         |                                                    ~~~~~~~~~~~ ^
   include/linux/bitfield.h:115:33: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                                               ^~~~
   include/linux/bitfield.h:70:12: note: expanded from macro '__BF_FIELD_CHECK'
      70 |                                         (0 + (_val)) : 0,               \
         |                                               ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                                          ^~~~
   include/linux/compiler_types.h:449:22: note: expanded from macro 'compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:437:23: note: expanded from macro '_compiletime_assert'
     437 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:429:9: note: expanded from macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/i3c/master/mipi-i3c-hci/pio.c:215:57: error: no member named 'target' in 'struct i3c_master_controller'
     215 |               FIELD_PREP(QUEUE_CMD_EMPTY_BUF_THLD, hci->master.target ? 0 : 1);
         |                                                    ~~~~~~~~~~~ ^
   include/linux/bitfield.h:116:20: note: expanded from macro 'FIELD_PREP'
     116 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                  ^~~~
   drivers/i3c/master/mipi-i3c-hci/pio.c:225:18: error: no member named 'target' in 'struct i3c_master_controller'
     225 |         if (hci->master.target) {
         |             ~~~~~~~~~~~ ^
   drivers/i3c/master/mipi-i3c-hci/pio.c:259:19: error: no member named 'target' in 'struct i3c_master_controller'
     259 |         if (!hci->master.target) {
         |              ~~~~~~~~~~~ ^
   drivers/i3c/master/mipi-i3c-hci/pio.c:531:18: error: no member named 'target' in 'struct i3c_master_controller'
     531 |         if (hci->master.target) {
         |             ~~~~~~~~~~~ ^
>> drivers/i3c/master/mipi-i3c-hci/pio.c:546:15: error: no member named 'target_info' in 'struct i3c_dev_desc'
     546 |                                 if (desc->target_info.read_handler)
         |                                     ~~~~  ^
   drivers/i3c/master/mipi-i3c-hci/pio.c:547:12: error: no member named 'target_info' in 'struct i3c_dev_desc'
     547 |                                         desc->target_info.read_handler(desc->dev,
         |                                         ~~~~  ^
   drivers/i3c/master/mipi-i3c-hci/pio.c:1087:54: error: no member named 'target' in 'struct i3c_master_controller'
    1087 |                 if (hci_pio_process_resp(hci, pio) && !hci->master.target)
         |                                                        ~~~~~~~~~~~ ^
   1 warning and 11 errors generated.


vim +336 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c

   326	
   327	static void hci_cmd_v1_prep_i3c_xfer(struct i3c_hci *hci,
   328					     struct i3c_dev_desc *dev,
   329					     struct hci_xfer *xfer)
   330	{
   331		u8 *data = xfer->data;
   332		unsigned int data_len = xfer->data_len;
   333	
   334		xfer->cmd_tid = hci_get_tid();
   335	
 > 336		if (hci->master.target) {
   337			/*
   338			 * Target mode needs to prepare two cmd_desc for each xfer:
   339			 * 1st for IBI (tid = 1)
   340			 * 2nd for pending read data (tid = 0)
   341			 * tid will be used to indentify ibi or master read, so this
   342			 * usage rule can't be violated.
   343			 */
   344			xfer->cmd_desc[0] =
   345				CMD_0_ATTR_T |
   346				CMD_T0_TID(xfer->cmd_tid % 2) |
   347				CMD_T0_DATA_LENGTH(data_len);
   348		} else {
   349			struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
   350			unsigned int dat_idx = dev_data->dat_idx;
   351			enum hci_cmd_mode mode = get_i3c_mode(hci);
   352			bool rnw = xfer->rnw;
   353	
   354			if (!rnw && data_len <= 4) {
   355				/* we use an Immediate Data Transfer Command */
   356				xfer->cmd_desc[0] =
   357					CMD_0_ATTR_I |
   358					CMD_I0_TID(xfer->cmd_tid) |
   359					CMD_I0_DEV_INDEX(dat_idx) |
   360					CMD_I0_DTT(data_len) |
   361					CMD_I0_MODE(mode);
   362				fill_data_bytes(xfer, data, data_len);
   363			} else {
   364				/* we use a Regular Data Transfer Command */
   365				xfer->cmd_desc[0] =
   366					CMD_0_ATTR_R |
   367					CMD_R0_TID(xfer->cmd_tid) |
   368					CMD_R0_DEV_INDEX(dat_idx) |
   369					CMD_R0_MODE(mode) |
   370					(rnw ? CMD_R0_RNW : 0);
   371				xfer->cmd_desc[1] =
   372					CMD_R1_DATA_LENGTH(data_len);
   373			}
   374		}
   375	}
   376	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
