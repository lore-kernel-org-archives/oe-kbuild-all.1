Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EE912D219
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 14:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715350519; cv=none; b=cWnmLCCAH8e2shjbW5WaR08axkctE5zj/yiEEtR0EJ1YGc+9bqHFPWloCjfUpzX/Yucp2ikbnf8UxcgCqF3tlULdJeBvYrKh0dyb2SRij02VK0wO2LTgXEn6lXIufpgpUDveALcjwyDHtmDnqEpx8+IyMEaK4/GZwS+sEGgUiY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715350519; c=relaxed/simple;
	bh=tqJpXy9cWEMDhtShvea8LDZFBxxa5IE6ZjHogfm3dkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a+Sp5CUvO1iHlB0WNePH0iVlCIsTf2l3/sJY15ceXzcxBB9UZo47bnha+BRwPj1+l8HrbXbitTKgVVpmzMk+j25jyKgZMkEtwOCmi2MDQAx1bDirCngjCy5Egr5rb9CpceernD+iVxJvX0oc9jiO58FzHH/sbKkw3rCjSuzdBNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eiqsD3ig; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiqsD3ig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715350517; x=1746886517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tqJpXy9cWEMDhtShvea8LDZFBxxa5IE6ZjHogfm3dkM=;
  b=eiqsD3igvSDuBswSNFwImG00viPEvzvjWAWFanFNnRe9+odgsXr8TQdy
   CgOYD4e73bIJCSuxsZqvE1r4KN/QmOO8dz/nmd/+yav5N0kIyaEjrcsCf
   hsDhdD7TE2JM6AGxsOgBN1fbAuRc/JqBzBO6VeMdhsQvz6bOyeccmYihB
   WyiRL4UK1XnDZJV/Ld7TdesNz6p+GyrAviBUiI9pApMV9Qs0e1a+1PDks
   VbllL0IadNYSSXTsnd7KesW4iy/3/1kidgZoJtgzta6h86MAjys62rDSw
   Ctut7fkTk9gSNsF+mPjqvyOvtay8TXIEOa4lNDRrTG1j/F9RW9a5L7ory
   g==;
X-CSE-ConnectionGUID: VyNrh3s1RVCEtMUBfR+XCw==
X-CSE-MsgGUID: YjYQx8FnSi6Qai2xnPR8fA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22731210"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="22731210"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 07:15:17 -0700
X-CSE-ConnectionGUID: wT13tqjVTuK9hkynnDOfLg==
X-CSE-MsgGUID: tHtdi4slTUKWUAxlLvOSpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="29687626"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 May 2024 07:15:15 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5R1l-0006Ex-1l;
	Fri, 10 May 2024 14:15:13 +0000
Date: Fri, 10 May 2024 22:14:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18554/22394]
 drivers/net/ethernet/netswift/ngbe/.tmp_ngbe_phy.o: warning: objtool:
 missing symbol for section .text
Message-ID: <202405102228.PBZNkwU1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   f35cd2565c44b31298a14d8e033e94bfed1b0e1c
commit: 206f9c11a8c8b0197da5a26859d96d2ed65f5757 [18554/22394] net: ngbe: Add Netswift Giga NIC driver
config: x86_64-buildonly-randconfig-001-20240510 (https://download.01.org/0day-ci/archive/20240510/202405102228.PBZNkwU1-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405102228.PBZNkwU1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405102228.PBZNkwU1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/netswift/ngbe/ngbe.h:28,
                    from drivers/net/ethernet/netswift/ngbe/ngbe_phy.h:22,
                    from drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:19:
   include/uapi/linux/sctp.h:390:1: warning: alignment 4 of 'struct sctp_paddr_change' is less than 8 [-Wpacked-not-aligned]
     390 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:719:1: warning: alignment 4 of 'struct sctp_setpeerprim' is less than 8 [-Wpacked-not-aligned]
     719 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:718:33: warning: 'sspp_addr' offset 4 in 'struct sctp_setpeerprim' isn't aligned to 8 [-Wpacked-not-aligned]
     718 |         struct sockaddr_storage sspp_addr;
         |                                 ^~~~~~~~~
   include/uapi/linux/sctp.h:732:1: warning: alignment 4 of 'struct sctp_prim' is less than 8 [-Wpacked-not-aligned]
     732 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:731:33: warning: 'ssp_addr' offset 4 in 'struct sctp_prim' isn't aligned to 8 [-Wpacked-not-aligned]
     731 |         struct sockaddr_storage ssp_addr;
         |                                 ^~~~~~~~
   include/uapi/linux/sctp.h:783:1: warning: alignment 4 of 'struct sctp_paddrparams' is less than 8 [-Wpacked-not-aligned]
     783 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:775:33: warning: 'spp_address' offset 4 in 'struct sctp_paddrparams' isn't aligned to 8 [-Wpacked-not-aligned]
     775 |         struct sockaddr_storage spp_address;
         |                                 ^~~~~~~~~~~
   include/uapi/linux/sctp.h:896:1: warning: alignment 4 of 'struct sctp_paddrinfo' is less than 8 [-Wpacked-not-aligned]
     896 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:890:33: warning: 'spinfo_address' offset 4 in 'struct sctp_paddrinfo' isn't aligned to 8 [-Wpacked-not-aligned]
     890 |         struct sockaddr_storage spinfo_address;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe.h: In function 'ngbe_misc_isb':
   drivers/net/ethernet/netswift/ngbe/ngbe.h:764:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     764 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c: At top level:
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:30:6: warning: no previous prototype for 'ngbe_check_reset_blocked' [-Wmissing-prototypes]
      30 | bool ngbe_check_reset_blocked(struct ngbe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:47:5: warning: no previous prototype for 'ngbe_phy_read_reg' [-Wmissing-prototypes]
      47 | s32 ngbe_phy_read_reg(struct ngbe_hw *hw,
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:70:5: warning: no previous prototype for 'ngbe_phy_write_reg' [-Wmissing-prototypes]
      70 | s32 ngbe_phy_write_reg(struct ngbe_hw *hw,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:89:5: warning: no previous prototype for 'ngbe_check_internal_phy_id' [-Wmissing-prototypes]
      89 | s32 ngbe_check_internal_phy_id(struct ngbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:269:5: warning: no previous prototype for 'ngbe_check_mdi_phy_id' [-Wmissing-prototypes]
     269 | s32 ngbe_check_mdi_phy_id(struct ngbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:300:6: warning: no previous prototype for 'ngbe_validate_phy_addr' [-Wmissing-prototypes]
     300 | bool ngbe_validate_phy_addr(struct ngbe_hw *hw, u32 phy_addr)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:316:5: warning: no previous prototype for 'ngbe_check_yt_phy_id' [-Wmissing-prototypes]
     316 | s32 ngbe_check_yt_phy_id(struct ngbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1037:5: warning: no previous prototype for 'ngbe_phy_get_advertised_pause' [-Wmissing-prototypes]
    1037 | s32 ngbe_phy_get_advertised_pause(struct ngbe_hw *hw, u8 *pause_bit)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1074:5: warning: no previous prototype for 'ngbe_phy_get_lp_advertised_pause' [-Wmissing-prototypes]
    1074 | s32 ngbe_phy_get_lp_advertised_pause(struct ngbe_hw *hw, u8 *pause_bit)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1119:5: warning: no previous prototype for 'ngbe_phy_set_pause_advertisement' [-Wmissing-prototypes]
    1119 | s32 ngbe_phy_set_pause_advertisement(struct ngbe_hw *hw, u16 pause_bit)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1167:5: warning: no previous prototype for 'ngbe_phy_setup' [-Wmissing-prototypes]
    1167 | s32 ngbe_phy_setup(struct ngbe_hw *hw)
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c: In function 'ngbe_phy_get_lp_advertised_pause':
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1082:30: warning: 'value' may be used uninitialized [-Wmaybe-uninitialized]
    1082 |         value = (value >> 5) & 0x1;
         |                 ~~~~~~~~~~~~~^~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1076:13: note: 'value' declared here
    1076 |         u16 value;
         |             ^~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:123: warning: Function parameter or member 'device_type' not described in 'ngbe_phy_read_reg_mdi'
>> drivers/net/ethernet/netswift/ngbe/.tmp_ngbe_phy.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
