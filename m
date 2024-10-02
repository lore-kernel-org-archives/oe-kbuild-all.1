Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBD2198E7A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 21:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727905484; cv=none; b=H5grkImAnzRNf1l6+2MEmgu6VgnUrQJvsOMTbrTyUwDfh57P+W8xbLNe/3+/wEONF6XTUrT3E9xTxaAjwmgSsYq1Y3f+ApzJojwcKJTT3yDtqb9HWZw2us0SLkV/7blXQcLnZxJwtY//X9rIKy725mSQi106ahzZJTGGmJ9Gzyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727905484; c=relaxed/simple;
	bh=yTxW9wGPDC7B+Wqy3wD1cBJqvs8A8MU/3jsoVeyFtV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UoTChPsUBFMUelWC8w9d79NyHPgQXfWqTzZTH+Txxa00bgHA68xoHlHQD5VdYA14ozQJU0ozw7vx6SWjIoGq7rNRczIQBUPUmOBUZwH1a+bXGtCRfA/o8K+oGwaNwjQZ301kLP3VM/qdI31CEzrZiEVXo7w8XLIUSyD6N5uQnoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWHPmILX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWHPmILX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727905483; x=1759441483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yTxW9wGPDC7B+Wqy3wD1cBJqvs8A8MU/3jsoVeyFtV4=;
  b=FWHPmILXC6BSG7vUSalfcsNAgLHAWhuMBpjZXLNs6nf4xs0sX4rAtNkv
   byyRt8fgTN6e4XJ9x1oMrsdbXhn4qsvYH7B2lNpIz5iOs6jbhylb7Xu4y
   nMabQbf8S0u/T4pZXBZmZW+Edfcd8W+7pCmYx8rzNPrgHwHmi2Be+xHdS
   G4ymnfSpmvSGxV6cdLsfxqDCyd+I7gaj7dKsEEEX2P1RHCAFuQuDsBKW6
   8RosaxeU+2weJo02VjYpRCwQafNfK+fp4NKQJnwtEioNeFLBdfTV/jm50
   aNaVzJiHury7fBxs4LOXI6d7YFaRPFOGtH37vkOdhg7lkmttO8Xl6JokQ
   A==;
X-CSE-ConnectionGUID: 6wTbGINNS6+EDbePMKAv9w==
X-CSE-MsgGUID: dPeRnxoMRKWPbLTDf3Zlkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="37675736"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="37675736"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 14:44:42 -0700
X-CSE-ConnectionGUID: kQloAeNyTVGMSrjoYwGOxQ==
X-CSE-MsgGUID: CrbmNydzSbG1OmEGZLbH4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="74944285"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Oct 2024 14:44:38 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw79A-000UbL-2C;
	Wed, 02 Oct 2024 21:44:36 +0000
Date: Thu, 3 Oct 2024 05:43:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18554/23811]
 drivers/net/ethernet/netswift/ngbe/.tmp_ngbe_lib.o: warning: objtool:
 missing symbol for section .text
Message-ID: <202410030547.hVYVuqx4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: 206f9c11a8c8b0197da5a26859d96d2ed65f5757 [18554/23811] net: ngbe: Add Netswift Giga NIC driver
config: x86_64-buildonly-randconfig-004-20240923 (https://download.01.org/0day-ci/archive/20241003/202410030547.hVYVuqx4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410030547.hVYVuqx4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030547.hVYVuqx4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/netswift/ngbe/ngbe.h:28,
                    from drivers/net/ethernet/netswift/ngbe/ngbe_lib.c:19:
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
>> drivers/net/ethernet/netswift/ngbe/.tmp_ngbe_lib.o: warning: objtool: missing symbol for section .text
--
   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/netswift/ngbe/ngbe.h:28,
                    from drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:20:
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
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c: At top level:
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:128:5: warning: no previous prototype for 'ngbe_poll_for_msg' [-Wmissing-prototypes]
     128 | int ngbe_poll_for_msg(struct ngbe_hw *hw, u16 mbx_id)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:158:5: warning: no previous prototype for 'ngbe_poll_for_ack' [-Wmissing-prototypes]
     158 | int ngbe_poll_for_ack(struct ngbe_hw *hw, u16 mbx_id)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:259:5: warning: no previous prototype for 'ngbe_read_v2p_mailbox' [-Wmissing-prototypes]
     259 | u32 ngbe_read_v2p_mailbox(struct ngbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:277:5: warning: no previous prototype for 'ngbe_check_for_bit_vf' [-Wmissing-prototypes]
     277 | int ngbe_check_for_bit_vf(struct ngbe_hw *hw, u32 mask)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:293:5: warning: no previous prototype for 'ngbe_check_for_msg_vf' [-Wmissing-prototypes]
     293 | int ngbe_check_for_msg_vf(struct ngbe_hw *hw, u16 mbx_id)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:315:5: warning: no previous prototype for 'ngbe_check_for_ack_vf' [-Wmissing-prototypes]
     315 | int ngbe_check_for_ack_vf(struct ngbe_hw *hw, u16 mbx_id)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:337:5: warning: no previous prototype for 'ngbe_check_for_rst_vf' [-Wmissing-prototypes]
     337 | int ngbe_check_for_rst_vf(struct ngbe_hw *hw, u16 mbx_id)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:357:5: warning: no previous prototype for 'ngbe_obtain_mbx_lock_vf' [-Wmissing-prototypes]
     357 | int ngbe_obtain_mbx_lock_vf(struct ngbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:385:5: warning: no previous prototype for 'ngbe_write_mbx_vf' [-Wmissing-prototypes]
     385 | int ngbe_write_mbx_vf(struct ngbe_hw *hw, u32 *msg, u16 size,
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:425:5: warning: no previous prototype for 'ngbe_read_mbx_vf' [-Wmissing-prototypes]
     425 | int ngbe_read_mbx_vf(struct ngbe_hw *hw, u32 *msg, u16 size,
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:483:5: warning: no previous prototype for 'ngbe_check_for_bit_pf' [-Wmissing-prototypes]
     483 | int ngbe_check_for_bit_pf(struct ngbe_hw *hw, u32 mask)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:503:5: warning: no previous prototype for 'ngbe_check_for_msg_pf' [-Wmissing-prototypes]
     503 | int ngbe_check_for_msg_pf(struct ngbe_hw *hw, u16 vf)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:523:5: warning: no previous prototype for 'ngbe_check_for_ack_pf' [-Wmissing-prototypes]
     523 | int ngbe_check_for_ack_pf(struct ngbe_hw *hw, u16 vf)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:543:5: warning: no previous prototype for 'ngbe_check_for_rst_pf' [-Wmissing-prototypes]
     543 | int ngbe_check_for_rst_pf(struct ngbe_hw *hw, u16 vf)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:566:5: warning: no previous prototype for 'ngbe_obtain_mbx_lock_pf' [-Wmissing-prototypes]
     566 | int ngbe_obtain_mbx_lock_pf(struct ngbe_hw *hw, u16 vf)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:594:5: warning: no previous prototype for 'ngbe_write_mbx_pf' [-Wmissing-prototypes]
     594 | int ngbe_write_mbx_pf(struct ngbe_hw *hw, u32 *msg, u16 size,
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:634:5: warning: no previous prototype for 'ngbe_read_mbx_pf' [-Wmissing-prototypes]
     634 | int ngbe_read_mbx_pf(struct ngbe_hw *hw, u32 *msg, u16 size,
         |     ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/.tmp_ngbe_mbx.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
