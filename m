Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B3B1E8338
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 12:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749729793; cv=none; b=GCmpJVJM303nA3280TbUkAbDZrXOFHgCSRqbdPLmdFgv2Gf6htvP3bRrX9CVAXpS9TVEtoJ0cLUMPBqybMh6iyfVcOAg73gLzvUwTo9zL5nB0YrOTeW+GQv85yvR+mmqZUxLSy91AF2JbiorR4AuHu4hfKQt1dhFNYcDcWC/7fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749729793; c=relaxed/simple;
	bh=1/iay+gJKVpJqgvqkBZKf5Gy2QG+tLgsuwXQA1wMzj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X4ZrRH/3IcZ+oAqPaJDq616bzVBhqSRRI0IgVM1ke4lRvOH/Vj4m71JBHw1qFJrFM9CQXeMjnyK7aJr6QoRMlWqC33yTUTVAPyMx+j0JzH7BYRqVFGinE5ZaXV327qTYckKFrRYc23ZZq7ks5s96LeBU/jYJTJXfVOqDSVecsw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGkFoR/J; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGkFoR/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749729791; x=1781265791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1/iay+gJKVpJqgvqkBZKf5Gy2QG+tLgsuwXQA1wMzj8=;
  b=OGkFoR/JLbKLP7LtIFL69hWyv9JSg5u6BVhwv01XjKjE6KdJGC+PFWeD
   scnXMSaO2Plaq6oeaoql88YWW0TppOr4UrP4SnGXFQMu/pywnz1V7p61c
   alXYeCGwQP8F4B7YyQajJcuXMao8yxSQNuniu/mRjg/JOIbNpVo8pZ1Yd
   g9un31EKBsBTR/UbjCCtPxftloWauPrz4OZZlOBwHqGr8VZmdgOv5eMiy
   zvFAgdXG++AY/ttsNiGp+wj5xds7z7HTWgkCV1oQGVAmw6E4FRiytybAi
   1B5yopUaMOBXwGdpcSFfZPqo4PmJCulUtpGHFrUMCMrDNtyl6Ncv/9jSb
   g==;
X-CSE-ConnectionGUID: 3qr9lMlwRiKMYCzaTG9RzQ==
X-CSE-MsgGUID: xXVaw3khRH6jtwESao118Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55577532"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="55577532"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 05:03:08 -0700
X-CSE-ConnectionGUID: NmxsWtjaTO+EfAbZ5n0wHg==
X-CSE-MsgGUID: hZ2yeFbDQl2+05N8jyRZJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="148408150"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Jun 2025 05:03:07 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPge8-000BVI-1Q;
	Thu, 12 Jun 2025 12:03:04 +0000
Date: Thu, 12 Jun 2025 20:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1665/1665]
 include/uapi/linux/sctp.h:390:1: error: alignment 4 of 'struct
 sctp_paddr_change' is less than 8
Message-ID: <202506121901.jXsG7S3b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7b14992c5fc2361904e3c2f345fe502cf7961adb
commit: a6a7981cbf66d4951425d33cdce6ef39206eba83 [1665/1665] Net: ethernet: Support 3snic 3s9xx network card
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250612/202506121901.jXsG7S3b-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506121901.jXsG7S3b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506121901.jXsG7S3b-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx.c:14:
>> include/uapi/linux/sctp.h:390:1: error: alignment 4 of 'struct sctp_paddr_change' is less than 8 [-Werror=packed-not-aligned]
     390 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:719:1: error: alignment 4 of 'struct sctp_setpeerprim' is less than 8 [-Werror=packed-not-aligned]
     719 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:718:33: error: 'sspp_addr' offset 4 in 'struct sctp_setpeerprim' isn't aligned to 8 [-Werror=packed-not-aligned]
     718 |         struct sockaddr_storage sspp_addr;
         |                                 ^~~~~~~~~
>> include/uapi/linux/sctp.h:732:1: error: alignment 4 of 'struct sctp_prim' is less than 8 [-Werror=packed-not-aligned]
     732 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:731:33: error: 'ssp_addr' offset 4 in 'struct sctp_prim' isn't aligned to 8 [-Werror=packed-not-aligned]
     731 |         struct sockaddr_storage ssp_addr;
         |                                 ^~~~~~~~
>> include/uapi/linux/sctp.h:783:1: error: alignment 4 of 'struct sctp_paddrparams' is less than 8 [-Werror=packed-not-aligned]
     783 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:775:33: error: 'spp_address' offset 4 in 'struct sctp_paddrparams' isn't aligned to 8 [-Werror=packed-not-aligned]
     775 |         struct sockaddr_storage spp_address;
         |                                 ^~~~~~~~~~~
>> include/uapi/linux/sctp.h:896:1: error: alignment 4 of 'struct sctp_paddrinfo' is less than 8 [-Werror=packed-not-aligned]
     896 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:890:33: error: 'spinfo_address' offset 4 in 'struct sctp_paddrinfo' isn't aligned to 8 [-Werror=packed-not-aligned]
     890 |         struct sockaddr_storage spinfo_address;
         |                                 ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:14:
>> include/uapi/linux/sctp.h:390:1: error: alignment 4 of 'struct sctp_paddr_change' is less than 8 [-Werror=packed-not-aligned]
     390 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:719:1: error: alignment 4 of 'struct sctp_setpeerprim' is less than 8 [-Werror=packed-not-aligned]
     719 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:718:33: error: 'sspp_addr' offset 4 in 'struct sctp_setpeerprim' isn't aligned to 8 [-Werror=packed-not-aligned]
     718 |         struct sockaddr_storage sspp_addr;
         |                                 ^~~~~~~~~
>> include/uapi/linux/sctp.h:732:1: error: alignment 4 of 'struct sctp_prim' is less than 8 [-Werror=packed-not-aligned]
     732 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:731:33: error: 'ssp_addr' offset 4 in 'struct sctp_prim' isn't aligned to 8 [-Werror=packed-not-aligned]
     731 |         struct sockaddr_storage ssp_addr;
         |                                 ^~~~~~~~
>> include/uapi/linux/sctp.h:783:1: error: alignment 4 of 'struct sctp_paddrparams' is less than 8 [-Werror=packed-not-aligned]
     783 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:775:33: error: 'spp_address' offset 4 in 'struct sctp_paddrparams' isn't aligned to 8 [-Werror=packed-not-aligned]
     775 |         struct sockaddr_storage spp_address;
         |                                 ^~~~~~~~~~~
>> include/uapi/linux/sctp.h:896:1: error: alignment 4 of 'struct sctp_paddrinfo' is less than 8 [-Werror=packed-not-aligned]
     896 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:890:33: error: 'spinfo_address' offset 4 in 'struct sctp_paddrinfo' isn't aligned to 8 [-Werror=packed-not-aligned]
     890 |         struct sockaddr_storage spinfo_address;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:42:5: error: no previous prototype for 'sss_nic_alloc_sq_resource' [-Werror=missing-prototypes]
      42 | int sss_nic_alloc_sq_resource(struct sss_nic_dev *nic_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:87:6: error: no previous prototype for 'sss_nic_free_sq_resource' [-Werror=missing-prototypes]
      87 | void sss_nic_free_sq_resource(struct sss_nic_dev *nic_dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:104:6: error: no previous prototype for 'sss_nic_init_all_sq' [-Werror=missing-prototypes]
     104 | void sss_nic_init_all_sq(struct sss_nic_dev *nic_dev,
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:128:5: error: no previous prototype for 'sss_nic_alloc_sq_desc_group' [-Werror=missing-prototypes]
     128 | int sss_nic_alloc_sq_desc_group(struct sss_nic_dev *nic_dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:153:6: error: no previous prototype for 'sss_nic_free_sq_desc_group' [-Werror=missing-prototypes]
     153 | void sss_nic_free_sq_desc_group(struct sss_nic_dev *nic_dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:200:6: error: no previous prototype for 'sss_nic_flush_all_sq' [-Werror=missing-prototypes]
     200 | void sss_nic_flush_all_sq(struct sss_nic_dev *nic_dev)
         |      ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:18:
>> include/uapi/linux/sctp.h:390:1: error: alignment 4 of 'struct sctp_paddr_change' is less than 8 [-Werror=packed-not-aligned]
     390 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:719:1: error: alignment 4 of 'struct sctp_setpeerprim' is less than 8 [-Werror=packed-not-aligned]
     719 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:718:33: error: 'sspp_addr' offset 4 in 'struct sctp_setpeerprim' isn't aligned to 8 [-Werror=packed-not-aligned]
     718 |         struct sockaddr_storage sspp_addr;
         |                                 ^~~~~~~~~
>> include/uapi/linux/sctp.h:732:1: error: alignment 4 of 'struct sctp_prim' is less than 8 [-Werror=packed-not-aligned]
     732 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:731:33: error: 'ssp_addr' offset 4 in 'struct sctp_prim' isn't aligned to 8 [-Werror=packed-not-aligned]
     731 |         struct sockaddr_storage ssp_addr;
         |                                 ^~~~~~~~
>> include/uapi/linux/sctp.h:783:1: error: alignment 4 of 'struct sctp_paddrparams' is less than 8 [-Werror=packed-not-aligned]
     783 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:775:33: error: 'spp_address' offset 4 in 'struct sctp_paddrparams' isn't aligned to 8 [-Werror=packed-not-aligned]
     775 |         struct sockaddr_storage spp_address;
         |                                 ^~~~~~~~~~~
>> include/uapi/linux/sctp.h:896:1: error: alignment 4 of 'struct sctp_paddrinfo' is less than 8 [-Werror=packed-not-aligned]
     896 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:890:33: error: 'spinfo_address' offset 4 in 'struct sctp_paddrinfo' isn't aligned to 8 [-Werror=packed-not-aligned]
     890 |         struct sockaddr_storage spinfo_address;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:80:5: error: no previous prototype for 'sss_nic_alloc_rq_res_group' [-Werror=missing-prototypes]
      80 | int sss_nic_alloc_rq_res_group(struct sss_nic_dev *nic_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:136:6: error: no previous prototype for 'sss_nic_free_rq_res_group' [-Werror=missing-prototypes]
     136 | void sss_nic_free_rq_res_group(struct sss_nic_dev *nic_dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:208:5: error: no previous prototype for 'sss_nic_init_rq_desc_group' [-Werror=missing-prototypes]
     208 | int sss_nic_init_rq_desc_group(struct sss_nic_dev *nic_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:235:6: error: no previous prototype for 'sss_nic_free_rq_desc_group' [-Werror=missing-prototypes]
     235 | void sss_nic_free_rq_desc_group(struct sss_nic_dev *nic_dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:241:5: error: no previous prototype for 'sss_nic_alloc_rq_desc_group' [-Werror=missing-prototypes]
     241 | int sss_nic_alloc_rq_desc_group(struct sss_nic_dev *nic_dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:267:5: error: no previous prototype for 'sss_nic_update_rx_rss' [-Werror=missing-prototypes]
     267 | int sss_nic_update_rx_rss(struct sss_nic_dev *nic_dev)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:282:6: error: no previous prototype for 'sss_nic_reset_rx_rss' [-Werror=missing-prototypes]
     282 | void sss_nic_reset_rx_rss(struct net_device *netdev)
         |      ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_reset.c:18:
>> include/uapi/linux/sctp.h:390:1: error: alignment 4 of 'struct sctp_paddr_change' is less than 8 [-Werror=packed-not-aligned]
     390 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:719:1: error: alignment 4 of 'struct sctp_setpeerprim' is less than 8 [-Werror=packed-not-aligned]
     719 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:718:33: error: 'sspp_addr' offset 4 in 'struct sctp_setpeerprim' isn't aligned to 8 [-Werror=packed-not-aligned]
     718 |         struct sockaddr_storage sspp_addr;
         |                                 ^~~~~~~~~
>> include/uapi/linux/sctp.h:732:1: error: alignment 4 of 'struct sctp_prim' is less than 8 [-Werror=packed-not-aligned]
     732 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:731:33: error: 'ssp_addr' offset 4 in 'struct sctp_prim' isn't aligned to 8 [-Werror=packed-not-aligned]
     731 |         struct sockaddr_storage ssp_addr;
         |                                 ^~~~~~~~
>> include/uapi/linux/sctp.h:783:1: error: alignment 4 of 'struct sctp_paddrparams' is less than 8 [-Werror=packed-not-aligned]
     783 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:775:33: error: 'spp_address' offset 4 in 'struct sctp_paddrparams' isn't aligned to 8 [-Werror=packed-not-aligned]
     775 |         struct sockaddr_storage spp_address;
         |                                 ^~~~~~~~~~~
>> include/uapi/linux/sctp.h:896:1: error: alignment 4 of 'struct sctp_paddrinfo' is less than 8 [-Werror=packed-not-aligned]
     896 | } __attribute__((packed, aligned(4)));
         | ^
>> include/uapi/linux/sctp.h:890:33: error: 'spinfo_address' offset 4 in 'struct sctp_paddrinfo' isn't aligned to 8 [-Werror=packed-not-aligned]
     890 |         struct sockaddr_storage spinfo_address;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_reset.c:179:6: error: no previous prototype for 'sss_nic_rq_watchdog_handler' [-Werror=missing-prototypes]
     179 | void sss_nic_rq_watchdog_handler(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats_api.c:492:5: error: no previous prototype for 'sss_nic_get_io_stats_size' [-Werror=missing-prototypes]
     492 | u32 sss_nic_get_io_stats_size(const struct sss_nic_dev *nic_dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/bitops.h:39,
                    from include/linux/bitops.h:20,
                    from include/linux/kernel.h:11,
                    from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats_api.c:6:
   In function 'test_bit',
       inlined from 'sss_nic_add_ethtool_link_mode' at drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats_api.c:764:7:
>> include/asm-generic/bitops/non-atomic.h:106:27: error: array subscript 'long unsigned int[0]' is partly outside array bounds of 'u32[1]' {aka 'unsigned int[1]'} [-Werror=array-bounds=]
     106 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
         |                       ~~~~^~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats_api.c: In function 'sss_nic_add_ethtool_link_mode':
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats_api.c:759:40: note: object 'hw_mode' of size 4
     759 |                                    u32 hw_mode, u32 op)
         |                                    ~~~~^~~~~~~
   cc1: all warnings being treated as errors


vim +390 include/uapi/linux/sctp.h

^1da177e4c3f41 include/net/sctp/user.h Linus Torvalds    2005-04-16  374  
^1da177e4c3f41 include/net/sctp/user.h Linus Torvalds    2005-04-16  375  /*
^1da177e4c3f41 include/net/sctp/user.h Linus Torvalds    2005-04-16  376   * 5.3.1.2 SCTP_PEER_ADDR_CHANGE
^1da177e4c3f41 include/net/sctp/user.h Linus Torvalds    2005-04-16  377   *
^1da177e4c3f41 include/net/sctp/user.h Linus Torvalds    2005-04-16  378   *   When a destination address on a multi-homed peer encounters a change
^1da177e4c3f41 include/net/sctp/user.h Linus Torvalds    2005-04-16  379   *   an interface details event is sent.  The information has the
^1da177e4c3f41 include/net/sctp/user.h Linus Torvalds    2005-04-16  380   *   following structure:
^1da177e4c3f41 include/net/sctp/user.h Linus Torvalds    2005-04-16  381   */
^1da177e4c3f41 include/net/sctp/user.h Linus Torvalds    2005-04-16  382  struct sctp_paddr_change {
^1da177e4c3f41 include/net/sctp/user.h Linus Torvalds    2005-04-16  383  	__u16 spc_type;
^1da177e4c3f41 include/net/sctp/user.h Linus Torvalds    2005-04-16  384  	__u16 spc_flags;
^1da177e4c3f41 include/net/sctp/user.h Linus Torvalds    2005-04-16  385  	__u32 spc_length;
^1da177e4c3f41 include/net/sctp/user.h Linus Torvalds    2005-04-16  386  	struct sockaddr_storage spc_aaddr;
^1da177e4c3f41 include/net/sctp/user.h Linus Torvalds    2005-04-16  387  	int spc_state;
^1da177e4c3f41 include/net/sctp/user.h Linus Torvalds    2005-04-16  388  	int spc_error;
^1da177e4c3f41 include/net/sctp/user.h Linus Torvalds    2005-04-16  389  	sctp_assoc_t spc_assoc_id;
20c9c825b12fcb include/net/sctp/user.h Sridhar Samudrala 2005-10-06 @390  } __attribute__((packed, aligned(4)));
^1da177e4c3f41 include/net/sctp/user.h Linus Torvalds    2005-04-16  391  

:::::: The code at line 390 was first introduced by commit
:::::: 20c9c825b12fcb8526a29cf20a17a5a3fc581726 [SCTP] Fix SCTP socket options to work with 32-bit apps on 64-bit kernels.

:::::: TO: Sridhar Samudrala <sri@us.ibm.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
