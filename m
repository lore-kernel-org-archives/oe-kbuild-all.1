Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E8E41C6A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 23:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710371951; cv=none; b=JhYL3mKyD/wMGL2YTvEXs5QNyb9NbZEIowgtJWRkr0bLnw/c+J0Z6I2vrMoMRekW/WeWLcaeZCMYuLHyCGEeXvAeMdvaBgU3LVtwFGuxDn+T7UxFlDPOhU0pfXurgXsyq1vppFnAMnMoVE43s5iTf2NZgCv1GS+2gVSk9glXgcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710371951; c=relaxed/simple;
	bh=bUOZdDAUZl3vBucYe0BKxoLk2/+nlOnWxbQ6XIfqGek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZkiZhxn0Lvg28IbA5deid1WzjUNb9tYTzVrdThS33C302O0lAiEIqtVvWmDoMYGzADDNQONW9iSWR3lIMJkRD6kllk++ZVVexmFobH3VqK/ZAO1VV9IsrfBrdZFIim9vLgFakf1apr018JYuOc39oBdPHK00t1fgdAz6KcLYtjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yr3nO/Uz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yr3nO/Uz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710371949; x=1741907949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bUOZdDAUZl3vBucYe0BKxoLk2/+nlOnWxbQ6XIfqGek=;
  b=Yr3nO/UzJBPzyNkg+WDJuQ9uGHiCHyjfFkx7NvxucIKXlMr6eWwvo4r8
   didFSe4SGY4JaGpMIAxjtxIwV3fiMv21+IsixE2707Y1rAHJeDTmd/oCT
   ijYMJ0Y6dSr5aA/xRF7fj5+yz6jdUl1t/FJnucByAqzNmyjVlKES4k7/C
   e50nfJaTtm+KXttYzSn9cQi+KiWDthp1bMIY8FlZfK+BpcmgwAgZKoLlV
   +BGGPWfVkP9Fu5uekTmILeKkoob4C1Z4VXyCedwjEW9kbI7MpDyMM5T8Y
   CKDx7pzoph/5qiwwMZnc/+qOcT0BwE4BOQePznWPCzzaSUAL275ZGWaZn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5297404"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5297404"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="16685516"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Mar 2024 16:19:07 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkXsG-000Cqx-1n;
	Wed, 13 Mar 2024 23:19:04 +0000
Date: Thu, 14 Mar 2024 07:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18554/21854]
 drivers/net/ethernet/netswift/ngbe/ngbe_param.o: warning: objtool: missing
 symbol for section .text
Message-ID: <202403140713.UrAXxk6G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b318937609077b966b3bd130583ee3aaaa4d015a
commit: 206f9c11a8c8b0197da5a26859d96d2ed65f5757 [18554/21854] net: ngbe: Add Netswift Giga NIC driver
config: x86_64-buildonly-randconfig-006-20240313 (https://download.01.org/0day-ci/archive/20240314/202403140713.UrAXxk6G-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140713.UrAXxk6G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140713.UrAXxk6G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/netswift/ngbe/ngbe_param.c:23:
   In file included from drivers/net/ethernet/netswift/ngbe/ngbe.h:22:
   In file included from include/net/ip.h:32:
   In file included from include/net/route.h:31:
   include/net/ip_fib.h:417:10: warning: array index 0 is past the end of the array (that has type 'struct fib_nh[0]') [-Warray-bounds]
     417 |         *itag = FIB_RES_NH(*res).nh_tclassid<<16;
         |                 ^~~~~~~~~~~~~~~~
   include/net/ip_fib.h:167:27: note: expanded from macro 'FIB_RES_NH'
     167 | #define FIB_RES_NH(res)         ((res).fi->fib_nh[0])
         |                                  ^                ~
   include/net/ip_fib.h:127:2: note: array 'fib_nh' declared here
     127 |         struct fib_nh           fib_nh[0];
         |         ^
   In file included from drivers/net/ethernet/netswift/ngbe/ngbe_param.c:23:
   drivers/net/ethernet/netswift/ngbe/ngbe.h:764:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     764 |         u32 cur_diff = 0;
         |             ^
   2 warnings generated.
>> drivers/net/ethernet/netswift/ngbe/ngbe_param.o: warning: objtool: missing symbol for section .text
--
   In file included from drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:30:
   In file included from drivers/net/ethernet/netswift/ngbe/ngbe.h:22:
   In file included from include/net/ip.h:32:
   In file included from include/net/route.h:31:
   include/net/ip_fib.h:417:10: warning: array index 0 is past the end of the array (that has type 'struct fib_nh[0]') [-Warray-bounds]
     417 |         *itag = FIB_RES_NH(*res).nh_tclassid<<16;
         |                 ^~~~~~~~~~~~~~~~
   include/net/ip_fib.h:167:27: note: expanded from macro 'FIB_RES_NH'
     167 | #define FIB_RES_NH(res)         ((res).fi->fib_nh[0])
         |                                  ^                ~
   include/net/ip_fib.h:127:2: note: array 'fib_nh' declared here
     127 |         struct fib_nh           fib_nh[0];
         |         ^
   In file included from drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:30:
   drivers/net/ethernet/netswift/ngbe/ngbe.h:764:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     764 |         u32 cur_diff = 0;
         |             ^
   2 warnings generated.
>> drivers/net/ethernet/netswift/ngbe/ngbe_sriov.o: warning: objtool: missing symbol for section .text
--
         |                   = 0
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1054:12: warning: variable 'value' is used uninitialized whenever '?:' condition is false [-Wsometimes-uninitialized]
    1054 |                 status = TCALL(hw, phy.ops.read_reg_mdi, 4, 0, &value);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_type.h:2761:35: note: expanded from macro 'TCALL'
    2761 | #define TCALL(hw, func, args...) (((hw)->func != NULL) \
         |                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1055:22: note: uninitialized use occurs here
    1055 |                 *pause_bit = (u8)((value >> 10) & 0x3);
         |                                    ^~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1054:12: note: remove the '?:' if its condition is always true
    1054 |                 status = TCALL(hw, phy.ops.read_reg_mdi, 4, 0, &value);
         |                          ^
   drivers/net/ethernet/netswift/ngbe/ngbe_type.h:2761:35: note: expanded from macro 'TCALL'
    2761 | #define TCALL(hw, func, args...) (((hw)->func != NULL) \
         |                                   ^
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1049:11: note: initialize the variable 'value' to silence this warning
    1049 |         u16 value;
         |                  ^
         |                   = 0
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1074:5: warning: no previous prototype for function 'ngbe_phy_get_lp_advertised_pause' [-Wmissing-prototypes]
    1074 | s32 ngbe_phy_get_lp_advertised_pause(struct ngbe_hw *hw, u8 *pause_bit)
         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1074:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1074 | s32 ngbe_phy_get_lp_advertised_pause(struct ngbe_hw *hw, u8 *pause_bit)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1098:12: warning: variable 'value' is used uninitialized whenever '?:' condition is false [-Wsometimes-uninitialized]
    1098 |                 status = TCALL(hw, phy.ops.read_reg_mdi, 5, 0, &value);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_type.h:2761:35: note: expanded from macro 'TCALL'
    2761 | #define TCALL(hw, func, args...) (((hw)->func != NULL) \
         |                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1099:22: note: uninitialized use occurs here
    1099 |                 *pause_bit = (u8)((value >> 10) & 0x3);
         |                                    ^~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1098:12: note: remove the '?:' if its condition is always true
    1098 |                 status = TCALL(hw, phy.ops.read_reg_mdi, 5, 0, &value);
         |                          ^
   drivers/net/ethernet/netswift/ngbe/ngbe_type.h:2761:35: note: expanded from macro 'TCALL'
    2761 | #define TCALL(hw, func, args...) (((hw)->func != NULL) \
         |                                   ^
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1093:11: note: initialize the variable 'value' to silence this warning
    1093 |         u16 value;
         |                  ^
         |                   = 0
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1119:5: warning: no previous prototype for function 'ngbe_phy_set_pause_advertisement' [-Wmissing-prototypes]
    1119 | s32 ngbe_phy_set_pause_advertisement(struct ngbe_hw *hw, u16 pause_bit)
         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1119:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1119 | s32 ngbe_phy_set_pause_advertisement(struct ngbe_hw *hw, u16 pause_bit)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1124:11: warning: variable 'value' is used uninitialized whenever '?:' condition is false [-Wsometimes-uninitialized]
    1124 |         status = TCALL(hw, phy.ops.read_reg, 4, 0, &value);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_type.h:2761:35: note: expanded from macro 'TCALL'
    2761 | #define TCALL(hw, func, args...) (((hw)->func != NULL) \
         |                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1125:2: note: uninitialized use occurs here
    1125 |         value &= ~0xC00;
         |         ^~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1124:11: note: remove the '?:' if its condition is always true
    1124 |         status = TCALL(hw, phy.ops.read_reg, 4, 0, &value);
         |                  ^
   drivers/net/ethernet/netswift/ngbe/ngbe_type.h:2761:35: note: expanded from macro 'TCALL'
    2761 | #define TCALL(hw, func, args...) (((hw)->func != NULL) \
         |                                   ^
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1121:11: note: initialize the variable 'value' to silence this warning
    1121 |         u16 value;
         |                  ^
         |                   = 0
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1138:12: warning: variable 'value' is used uninitialized whenever '?:' condition is false [-Wsometimes-uninitialized]
    1138 |                 status = TCALL(hw, phy.ops.read_reg_mdi, 4, 0, &value);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_type.h:2761:35: note: expanded from macro 'TCALL'
    2761 | #define TCALL(hw, func, args...) (((hw)->func != NULL) \
         |                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1139:3: note: uninitialized use occurs here
    1139 |                 value &= ~0xC00;
         |                 ^~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1138:12: note: remove the '?:' if its condition is always true
    1138 |                 status = TCALL(hw, phy.ops.read_reg_mdi, 4, 0, &value);
         |                          ^
   drivers/net/ethernet/netswift/ngbe/ngbe_type.h:2761:35: note: expanded from macro 'TCALL'
    2761 | #define TCALL(hw, func, args...) (((hw)->func != NULL) \
         |                                   ^
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1134:11: note: initialize the variable 'value' to silence this warning
    1134 |         u16 value;
         |                  ^
         |                   = 0
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1167:5: warning: no previous prototype for function 'ngbe_phy_setup' [-Wmissing-prototypes]
    1167 | s32 ngbe_phy_setup(struct ngbe_hw *hw)
         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1167:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1167 | s32 ngbe_phy_setup(struct ngbe_hw *hw)
         | ^
         | static 
   19 warnings generated.
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:123: warning: Function parameter or member 'device_type' not described in 'ngbe_phy_read_reg_mdi'
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
