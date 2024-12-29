Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FCC800
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 00:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735431061; cv=none; b=Hj30QMvQYGjhuKB0u6ekWyvgIZiObyolDyPylB7MHk4i9v+aZYnazEXr7jE0sQ+hUBPz5NYGBM9NhfdiSp56PguhhX9nqAffPUOEN1g1HsqvlZ9c2vD31HzekOecHnpm4KbT+9IElMEHsNHqbayr0Y8qFYe9REJ0EqjcxTvy+aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735431061; c=relaxed/simple;
	bh=aPEZHt75uy70Dnt6LQn3tlGP/Okds47lMS92fEg69aU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kvc5+48AH0LCPdOUpRSAeP15Qzyf8XPAKB07qYTnH2EtFWlA/CNweBLYVkEzgkCKmILFXgdEt6LOYsIoDvwFRQzbBM6VjxayUUi3ElFLX/6ZhTRo46vtj0gCHpsNDRet/d2/Ya4q4Hso7meKh6csF/9Yq+qA+Z7v2YjMJJtSBlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJN+5NGt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJN+5NGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735431058; x=1766967058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aPEZHt75uy70Dnt6LQn3tlGP/Okds47lMS92fEg69aU=;
  b=NJN+5NGtKyhvawOSPy2rtOQ6tlnq2Sr5CnYnEMYpLAGTA1LTnpnt+ZEI
   HguJnAV47jFPrfNaoNW/LQZiAoFwLjTYu1y6YIhJcaTD80gaXaSl9lVWU
   RqHdw/Ugv8y8Y1btwQBz1UGR8e1EP6DMdPCdAoXkCh646cRRfIcaU/9db
   5HC3uykt7GrZ+V1H1eX46EF9yyo90q7EA+dgv4wOeTvJpFoj0vQ9jJG8g
   HlE3/7PCLdJ0ble7Y3sPCx7/3JPRp5msbiIOkbIjz3iQADxoypTQFuzDj
   O3h47OpxqzMiVIvrjsh/Cpq9TLvEAfcLBqtadg833Dyo376WQUlIi7vnI
   A==;
X-CSE-ConnectionGUID: Rb1NMwO6RECIyxFKk5hwXQ==
X-CSE-MsgGUID: Jz7CpOw/Q/eP51MoEiqKdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35995601"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="35995601"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 16:10:58 -0800
X-CSE-ConnectionGUID: 9LxY/JX7RMi/JmGKzU+ghg==
X-CSE-MsgGUID: FgHVrkksQXWI1aFvPw+PbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123734867"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Dec 2024 16:10:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRgtS-0004OE-0z;
	Sun, 29 Dec 2024 00:10:54 +0000
Date: Sun, 29 Dec 2024 08:09:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1358/1358]
 drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2567:5: sparse: sparse: symbol
 'ngbe_flash_write_cab' was not declared. Should it be static?
Message-ID: <202412290834.rDSvv47F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   773f731853f1368508a0b112047bd9b5a4bb9a5e
commit: 206f9c11a8c8b0197da5a26859d96d2ed65f5757 [1358/1358] net: ngbe: Add Netswift Giga NIC driver
config: x86_64-randconfig-r113-20241228 (https://download.01.org/0day-ci/archive/20241229/202412290834.rDSvv47F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290834.rDSvv47F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290834.rDSvv47F-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:438:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:438:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:438:9: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:816:6: sparse: sparse: symbol 'ngbe_add_uc_addr' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:960:6: sparse: sparse: symbol 'ngbe_set_mta' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2082:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2082:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2082:9: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2236:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2236:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2236:9: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2344:5: sparse: sparse: symbol 'ngbe_setup_mac_link_hostif' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2382:5: sparse: sparse: symbol 'ngbe_crc16_ccitt' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2542:5: sparse: sparse: symbol 'flash_read_dword' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2567:5: sparse: sparse: symbol 'ngbe_flash_write_cab' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2593:5: sparse: sparse: symbol 'ngbe_flash_read_cab' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2628:5: sparse: sparse: symbol 'ngbe_flash_write_unlock' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2651:5: sparse: sparse: symbol 'ngbe_flash_write_lock' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3107:13: sparse: sparse: symbol 'ngbe_ptype_lookup' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3498:5: sparse: sparse: symbol 'ngbe_get_copper_link_capabilities' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3647:5: sparse: sparse: symbol 'ngbe_reset_misc' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3957:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3957:17: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3957:17: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3959:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3959:17: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3959:17: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4124:5: sparse: sparse: symbol 'ngbe_read_ee_hostif_data' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4240:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4240:17: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4240:17: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4324:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4324:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4324:9: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4339:5: sparse: sparse: symbol 'ngbe_read_ee_hostif_data32' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4387:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4387:17: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4387:17: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4405:5: sparse: sparse: symbol 'ngbe_write_ee_hostif_data' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4448:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4448:17: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4448:17: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4466:5: sparse: sparse: symbol 'ngbe_write_ee_hostif_data32' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4508:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4508:17: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4508:17: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4554:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4554:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4554:9: sparse:    int
   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/netswift/ngbe/ngbe.h:28,
                    from drivers/net/ethernet/netswift/ngbe/ngbe_phy.h:22,
                    from drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:22:
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
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c: At top level:
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:816:6: warning: no previous prototype for 'ngbe_add_uc_addr' [-Wmissing-prototypes]
     816 | void ngbe_add_uc_addr(struct ngbe_hw *hw, u8 *addr, u32 vmdq)
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:960:6: warning: no previous prototype for 'ngbe_set_mta' [-Wmissing-prototypes]
     960 | void ngbe_set_mta(struct ngbe_hw *hw, u8 *mc_addr)
         |      ^~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2032:5: warning: no previous prototype for 'ngbe_host_interface_pass_command' [-Wmissing-prototypes]
    2032 | s32 ngbe_host_interface_pass_command(struct ngbe_hw *hw, u32 *buffer,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2344:5: warning: no previous prototype for 'ngbe_setup_mac_link_hostif' [-Wmissing-prototypes]
    2344 | s32 ngbe_setup_mac_link_hostif(struct ngbe_hw *hw, u32 speed)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2382:5: warning: no previous prototype for 'ngbe_crc16_ccitt' [-Wmissing-prototypes]
    2382 | u16 ngbe_crc16_ccitt(const u8 *buf, int size)
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2499:4: warning: no previous prototype for 'fmgr_cmd_op' [-Wmissing-prototypes]
    2499 | u8 fmgr_cmd_op(struct ngbe_hw *hw, u32 cmd, u32 cmd_addr)
         |    ^~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2520:4: warning: no previous prototype for 'fmgr_usr_cmd_op' [-Wmissing-prototypes]
    2520 | u8 fmgr_usr_cmd_op(struct ngbe_hw *hw, u32 usr_cmd)
         |    ^~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2530:4: warning: no previous prototype for 'flash_erase_chip' [-Wmissing-prototypes]
    2530 | u8 flash_erase_chip(struct ngbe_hw *hw)
         |    ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2536:4: warning: no previous prototype for 'flash_erase_sector' [-Wmissing-prototypes]
    2536 | u8 flash_erase_sector(struct ngbe_hw *hw, u32 sec_addr)
         |    ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2542:5: warning: no previous prototype for 'flash_read_dword' [-Wmissing-prototypes]
    2542 | u32 flash_read_dword(struct ngbe_hw *hw, u32 addr)
         |     ^~~~~~~~~~~~~~~~

vim +/ngbe_flash_write_cab +2567 drivers/net/ethernet/netswift/ngbe/ngbe_hw.c

  2566	
> 2567	int ngbe_flash_write_cab(struct ngbe_hw *hw, u32 addr, u32 value, u16 lan_id)
  2568	{
  2569		int status;
  2570		struct ngbe_hic_read_cab buffer;
  2571	
  2572		buffer.hdr.req.cmd = 0xE2;
  2573		buffer.hdr.req.buf_lenh = 0x6;
  2574		buffer.hdr.req.buf_lenl = 0x0;
  2575		buffer.hdr.req.checksum = 0xFF;
  2576	
  2577		/* convert offset from words to bytes */
  2578		buffer.dbuf.d16[0] = cpu_to_le16(lan_id);
  2579		/* one word */
  2580		buffer.dbuf.d32[0] = htonl(addr);
  2581		buffer.dbuf.d32[1] = htonl(value);
  2582	
  2583		status = ngbe_host_interface_command(hw, (u32 *)&buffer,
  2584							sizeof(buffer), 5000, true);
  2585		printk("0x1e100 :%08x\n", rd32(hw, 0x1e100));
  2586		printk("0x1e104 :%08x\n", rd32(hw, 0x1e104));
  2587		printk("0x1e108 :%08x\n", rd32(hw, 0x1e108));
  2588		printk("0x1e10c :%08x\n", rd32(hw, 0x1e10c));
  2589	
  2590		return status;
  2591	}
  2592	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
