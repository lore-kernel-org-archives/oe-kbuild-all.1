Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9293186A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 00:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726361730; cv=none; b=cxnj6GM+FMSYqDyqZGpJdPAxdpttHFBOLfgXgGpJAdSYi7HYtLFp5b0H0cbNMX1zm3kZbxYSw9Oo2prK3B28J38sFWeUGjkd6QmKuSfFRtWbYYGWMePBEqaOv3cpNk/xwCS/zH2Zw/wI7cnI9ttXFk2Ou2bx3uyQkAiJKbgdvHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726361730; c=relaxed/simple;
	bh=whytP3UYIiCZTm8zjKXyYDsBJN3qhR0S2p4PwbNAbvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OQwPcgUyN4Cd5qRG1EGwh7HybLRk+ryTI/Y3vJR7DsTsL3UBsdjh0xIodWJvlDVAy3wrCPqYWpCpEmVejT2YwiwEIMLHwwJ8uh/dwmv47ROuN0Zvefdjx+Q+EcMKjY7Zf0dc5ClaCE+wxX+0mhmt4mlsJP9zb85EcrpOwhaO5/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GyuN4ea0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GyuN4ea0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726361727; x=1757897727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=whytP3UYIiCZTm8zjKXyYDsBJN3qhR0S2p4PwbNAbvQ=;
  b=GyuN4ea0k+kETaoZKgm0luyJs/ib6uufTfL5YGT9zESZXmXCIaDZzirt
   eXGGoac5zjydQDqZ1MytiApvFPRTEY3FKkhFYQ+V302WIAclTiyFGYU8L
   u28mlGsyahyb/B9F9VSfCx4buK1faColBBLFl8HDjzq6ErM8nnp/fpacO
   7bXeGe3snf97HD3ZAAr3ehdxClm4Bdoqi2s2Hi186x0P79KvtZvrj9zGy
   WbG94JcI3hqbPiivqJUDAX/OxFTLfnozBMR3ehptNQrTBmIHGW8RB9ea4
   bflBAneQLSX6YwNeVLUdqEJIjanfLX85JKsfEiCbdpK60VqXjhtQ9Br41
   g==;
X-CSE-ConnectionGUID: v2LRrSd2Tti+DcuQ/RusmQ==
X-CSE-MsgGUID: YgMgs14RSgqpSsA2AAJZyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="36368923"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="36368923"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 17:55:27 -0700
X-CSE-ConnectionGUID: a6n+AynDSQiTbMyNYKYvSw==
X-CSE-MsgGUID: LnWvni8dTv6hzwgqoEQ4MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="68499555"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Sep 2024 17:55:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spdXu-0008I0-1l;
	Sun, 15 Sep 2024 00:55:22 +0000
Date: Sun, 15 Sep 2024 08:54:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Vyas, Tarun" <tarun.vyas@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 668/30000]
 drivers/staging/igb_avb/igb_main.c:10249:13: warning: variable 'ret_val' set
 but not used
Message-ID: <202409150809.3XzFPD5F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: 34ea8dc24190e2a6708fa89231618fe2e92702c5 [668/30000] staging: Add AVnu based Intel IGB driver
config: arm64-randconfig-r053-20240914 (https://download.01.org/0day-ci/archive/20240915/202409150809.3XzFPD5F-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409150809.3XzFPD5F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150809.3XzFPD5F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/sctp.h:57,
                    from drivers/staging/igb_avb/igb.h:64,
                    from drivers/staging/igb_avb/igb_main.c:69:
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
   drivers/staging/igb_avb/igb_main.c: In function 'igb_check_swap_media':
>> drivers/staging/igb_avb/igb_main.c:1648:14: warning: variable 'link' set but not used [-Wunused-but-set-variable]
    1648 |         bool link;
         |              ^~~~
   drivers/staging/igb_avb/igb_main.c: At top level:
>> drivers/staging/igb_avb/igb_main.c:1950:6: warning: no previous prototype for 'igb_enable_mas' [-Wmissing-prototypes]
    1950 | void igb_enable_mas(struct igb_adapter *adapter)
         |      ^~~~~~~~~~~~~~
>> drivers/staging/igb_avb/igb_main.c:2589:6: warning: no previous prototype for 'igb_rar_set' [-Wmissing-prototypes]
    2589 | void igb_rar_set(struct igb_adapter *adapter, u32 index)
         |      ^~~~~~~~~~~
>> drivers/staging/igb_avb/igb_main.c:4445:6: warning: no previous prototype for 'igb_full_sync_mac_table' [-Wmissing-prototypes]
    4445 | void igb_full_sync_mac_table(struct igb_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/igb_avb/igb_main.c:4454:6: warning: no previous prototype for 'igb_sync_mac_table' [-Wmissing-prototypes]
    4454 | void igb_sync_mac_table(struct igb_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/staging/igb_avb/igb_main.c:5265:6: warning: no previous prototype for 'igb_tx_ctxtdesc' [-Wmissing-prototypes]
    5265 | void igb_tx_ctxtdesc(struct igb_ring *tx_ring, u32 vlan_macip_lens,
         |      ^~~~~~~~~~~~~~~
>> drivers/staging/igb_avb/igb_main.c:6445:6: warning: no previous prototype for 'igb_mta_set' [-Wmissing-prototypes]
    6445 | void igb_mta_set(struct igb_adapter *adapter, u32 hash_value)
         |      ^~~~~~~~~~~
>> drivers/staging/igb_avb/igb_main.c:7211:6: warning: no previous prototype for 'igb_ring_irq_enable' [-Wmissing-prototypes]
    7211 | void igb_ring_irq_enable(struct igb_q_vector *q_vector)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/staging/igb_avb/igb_main.c: In function 'igb_lookup':
>> drivers/staging/igb_avb/igb_main.c:10249:13: warning: variable 'ret_val' set but not used [-Wunused-but-set-variable]
   10249 |         int ret_val;
         |             ^~~~~~~
   drivers/staging/igb_avb/igb_main.c: In function 'igb_set_interrupt_capability':
>> drivers/staging/igb_avb/igb_main.c:1117:17: warning: this statement may fall through [-Wimplicit-fallthrough=]
    1117 |                 igb_reset_interrupt_capability(adapter);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/igb_avb/igb_main.c:1118:9: note: here
    1118 |         case IGB_INT_MODE_MSI:
         |         ^~~~
   drivers/staging/igb_avb/igb_main.c: In function '__igb_notify_dca':
   drivers/staging/igb_avb/igb_main.c:6368:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    6368 |                 if (dca_add_requester(dev) == E1000_SUCCESS) {
         |                    ^
   drivers/staging/igb_avb/igb_main.c:6375:9: note: here
    6375 |         case DCA_PROVIDER_REMOVE:
         |         ^~~~
   drivers/staging/igb_avb/igb_main.c: In function 'igb_has_link':
   drivers/staging/igb_avb/igb_main.c:4732:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    4732 |                 if (!hw->mac.get_link_status)
         |                    ^
   drivers/staging/igb_avb/igb_main.c:4734:9: note: here
    4734 |         case e1000_media_type_internal_serdes:
         |         ^~~~
   drivers/staging/igb_avb/igb_main.c: In function 'igb_lro_flush':
   drivers/staging/igb_avb/igb_main.c:7882:33: warning: array subscript 2 is outside array bounds of '__be32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
    7882 |                         lroh->ts[2] = IGB_CB(skb)->tsecr;
         |                         ~~~~~~~~^~~
   drivers/staging/igb_avb/igb.h:243:16: note: while referencing 'ts'
     243 |         __be32 ts[0];
         |                ^~
   drivers/staging/igb_avb/igb_main.c:7883:33: warning: array subscript 1 is outside array bounds of '__be32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
    7883 |                         lroh->ts[1] = htonl(IGB_CB(skb)->tsval);
         |                         ~~~~~~~~^~~
   drivers/staging/igb_avb/igb.h:243:16: note: while referencing 'ts'
     243 |         __be32 ts[0];
         |                ^~
   In function 'igb_lro_header_ok',
       inlined from 'igb_lro_receive' at drivers/staging/igb_avb/igb_main.c:8032:2:
   drivers/staging/igb_avb/igb_main.c:7959:30: warning: array subscript 0 is outside array bounds of '__be32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
    7959 |                     (lroh->ts[0] != htonl((TCPOPT_NOP << 24) |
         |                      ~~~~~~~~^~~
   drivers/staging/igb_avb/igb.h: In function 'igb_lro_receive':
   drivers/staging/igb_avb/igb.h:243:16: note: while referencing 'ts'
     243 |         __be32 ts[0];
         |                ^~
   In function 'igb_lro_header_ok',
       inlined from 'igb_lro_receive' at drivers/staging/igb_avb/igb_main.c:8032:2:
   drivers/staging/igb_avb/igb_main.c:7963:30: warning: array subscript 2 is outside array bounds of '__be32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
    7963 |                     (lroh->ts[2] == 0)) {
         |                      ~~~~~~~~^~~
   drivers/staging/igb_avb/igb.h: In function 'igb_lro_receive':
   drivers/staging/igb_avb/igb.h:243:16: note: while referencing 'ts'
     243 |         __be32 ts[0];
         |                ^~
   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/arm64/include/uapi/asm/byteorder.h:21,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arm64/include/asm/bitops.h:40,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from drivers/staging/igb_avb/igb_main.c:43:
   In function 'igb_lro_header_ok',
       inlined from 'igb_lro_receive' at drivers/staging/igb_avb/igb_main.c:8032:2:
   drivers/staging/igb_avb/igb_main.c:7967:52: warning: array subscript 1 is outside array bounds of '__be32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
    7967 |                 IGB_CB(skb)->tsval = ntohl(lroh->ts[1]);
   include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of macro '__be32_to_cpu'
      40 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
         |                                                   ^
   include/linux/byteorder/generic.h:140:18: note: in expansion of macro '___ntohl'
     140 | #define ntohl(x) ___ntohl(x)
         |                  ^~~~~~~~
   drivers/staging/igb_avb/igb_main.c:7967:38: note: in expansion of macro 'ntohl'
    7967 |                 IGB_CB(skb)->tsval = ntohl(lroh->ts[1]);
         |                                      ^~~~~
   drivers/staging/igb_avb/igb.h: In function 'igb_lro_receive':
   drivers/staging/igb_avb/igb.h:243:16: note: while referencing 'ts'
     243 |         __be32 ts[0];
         |                ^~
   In function 'igb_lro_header_ok',
       inlined from 'igb_lro_receive' at drivers/staging/igb_avb/igb_main.c:8032:2:
   drivers/staging/igb_avb/igb_main.c:7968:46: warning: array subscript 2 is outside array bounds of '__be32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
    7968 |                 IGB_CB(skb)->tsecr = lroh->ts[2];
         |                                      ~~~~~~~~^~~
   drivers/staging/igb_avb/igb.h: In function 'igb_lro_receive':
   drivers/staging/igb_avb/igb.h:243:16: note: while referencing 'ts'
     243 |         __be32 ts[0];
         |                ^~
   drivers/staging/igb_avb/igb_main.c: In function 'igb_probe':
>> drivers/staging/igb_avb/igb_main.c:2531:48: warning: '%d' directive output may be truncated writing between 1 and 5 bytes into a region of size between 1 and 13 [-Wformat-truncation=]
    2531 |                             "%d.%d, 0x%08x, %d.%d.%d",
         |                                                ^~
   In function 'igb_set_fw_version',
       inlined from 'igb_probe' at drivers/staging/igb_avb/igb_main.c:2890:2:
   drivers/staging/igb_avb/igb_main.c:2531:29: note: directive argument in the range [0, 65535]
    2531 |                             "%d.%d, 0x%08x, %d.%d.%d",
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/igb_avb/igb_main.c:2531:29: note: directive argument in the range [0, 65535]
   drivers/staging/igb_avb/igb_main.c:2529:25: note: 'snprintf' output between 23 and 43 bytes into a destination of size 32
    2529 |                         snprintf(adapter->fw_version,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2530 |                             sizeof(adapter->fw_version),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2531 |                             "%d.%d, 0x%08x, %d.%d.%d",
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~
    2532 |                             fw.eep_major, fw.eep_minor, fw.etrack_id,
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2533 |                             fw.or_major, fw.or_build, fw.or_patch);
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/igb_avb/igb_main.c:642: warning: Function parameter or member 'adapter' not described in 'igb_configure_msix'
>> drivers/staging/igb_avb/igb_main.c:708: warning: Function parameter or member 'adapter' not described in 'igb_request_msix'
>> drivers/staging/igb_avb/igb_main.c:856: warning: Function parameter or member 'adapter' not described in 'igb_clear_interrupt_scheme'
>> drivers/staging/igb_avb/igb_main.c:868: warning: Function parameter or member 'adapter' not described in 'igb_process_mdd_event'
>> drivers/staging/igb_avb/igb_main.c:909: warning: Function parameter or member 'adapter' not described in 'igb_disable_mdd'
>> drivers/staging/igb_avb/igb_main.c:930: warning: Function parameter or member 'adapter' not described in 'igb_enable_mdd'
>> drivers/staging/igb_avb/igb_main.c:950: warning: Function parameter or member 'adapter' not described in 'igb_reset_sriov_capability'
>> drivers/staging/igb_avb/igb_main.c:993: warning: Function parameter or member 'adapter' not described in 'igb_set_sriov_capability'
>> drivers/staging/igb_avb/igb_main.c:1058: warning: Function parameter or member 'adapter' not described in 'igb_set_interrupt_capability'
   drivers/staging/igb_avb/igb_main.c:1058: warning: Function parameter or member 'msix' not described in 'igb_set_interrupt_capability'
   drivers/staging/igb_avb/igb_main.c:1344: warning: Function parameter or member 'adapter' not described in 'igb_init_interrupt_scheme'
   drivers/staging/igb_avb/igb_main.c:1344: warning: Function parameter or member 'msix' not described in 'igb_init_interrupt_scheme'
   drivers/staging/igb_avb/igb_main.c:1372: warning: Function parameter or member 'adapter' not described in 'igb_request_irq'
   drivers/staging/igb_avb/igb_main.c:3328: warning: Function parameter or member 'resuming' not described in '__igb_open'
   drivers/staging/igb_avb/igb_main.c:3453: warning: Function parameter or member 'suspending' not described in '__igb_close'
   drivers/staging/igb_avb/igb_main.c:4766: warning: Function parameter or member 'timer' not described in 'igb_watchdog'
   drivers/staging/igb_avb/igb_main.c:4766: warning: Excess function parameter 'data' description in 'igb_watchdog'
   drivers/staging/igb_avb/igb_main.c:5035: warning: Function parameter or member 'timer' not described in 'igb_dma_err_timer'
   drivers/staging/igb_avb/igb_main.c:5035: warning: Excess function parameter 'data' description in 'igb_dma_err_timer'
   drivers/staging/igb_avb/igb_main.c:7804: warning: Function parameter or member 'rx_ring' not described in 'igb_can_lro'
   drivers/staging/igb_avb/igb_main.c:7804: warning: Excess function parameter 'adapter' description in 'igb_can_lro'
   drivers/staging/igb_avb/igb_main.c:7857: warning: Function parameter or member 'q_vector' not described in 'igb_lro_flush'
   drivers/staging/igb_avb/igb_main.c:7857: warning: Function parameter or member 'skb' not described in 'igb_lro_flush'
   drivers/staging/igb_avb/igb_main.c:8784: warning: Function parameter or member 'rx_ring' not described in 'igb_alloc_rx_buffers'
   drivers/staging/igb_avb/igb_main.c:8784: warning: Function parameter or member 'cleaned_count' not described in 'igb_alloc_rx_buffers'
   drivers/staging/igb_avb/igb_main.c:8784: warning: Excess function parameter 'adapter' description in 'igb_alloc_rx_buffers'
   drivers/staging/igb_avb/igb_main.c:8860: warning: Function parameter or member 'netdev' not described in 'igb_mii_ioctl'
   drivers/staging/igb_avb/igb_main.c:8860: warning: Function parameter or member 'ifr' not described in 'igb_mii_ioctl'
   drivers/staging/igb_avb/igb_main.c:8860: warning: Function parameter or member 'cmd' not described in 'igb_mii_ioctl'
   drivers/staging/igb_avb/igb_main.c:8893: warning: Function parameter or member 'netdev' not described in 'igb_ioctl'
   drivers/staging/igb_avb/igb_main.c:8893: warning: Function parameter or member 'ifr' not described in 'igb_ioctl'
   drivers/staging/igb_avb/igb_main.c:8893: warning: Function parameter or member 'cmd' not described in 'igb_ioctl'
--
   drivers/staging/igb_avb/e1000_82575.c: In function 'e1000_get_cfg_done_82575':
>> drivers/staging/igb_avb/e1000_82575.c:1142:73: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    1142 |                 DEBUGOUT("MNG configuration cycle has not completed.\n");
         |                                                                         ^
   drivers/staging/igb_avb/e1000_82575.c: In function 'e1000_check_for_link_82575':
   drivers/staging/igb_avb/e1000_82575.c:1211:69: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    1211 |                         DEBUGOUT("Error configuring flow control\n");
         |                                                                     ^
   drivers/staging/igb_avb/e1000_82575.c: In function 'e1000_reset_hw_82575':
   drivers/staging/igb_avb/e1000_82575.c:1431:71: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    1431 |                 DEBUGOUT("PCI-E Master disable polling has failed.\n");
         |                                                                       ^
   drivers/staging/igb_avb/e1000_82575.c:1436:71: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    1436 |                 DEBUGOUT("PCI-E Set completion timeout has failed.\n");
         |                                                                       ^
   drivers/staging/igb_avb/e1000_82575.c: In function 'e1000_rx_fifo_flush_82575':
   drivers/staging/igb_avb/e1000_82575.c:2177:65: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    2177 |                 DEBUGOUT("Queue disable timed out after 10ms\n");
         |                                                                 ^
   drivers/staging/igb_avb/e1000_82575.c: In function 'e1000_reset_hw_82580':
   drivers/staging/igb_avb/e1000_82575.c:2484:71: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    2484 |                 DEBUGOUT("PCI-E Master disable polling has failed.\n");
         |                                                                       ^
   drivers/staging/igb_avb/e1000_82575.c:2537:70: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    2537 |                 DEBUGOUT("Could not reset MDICNFG based on EEPROM\n");
         |                                                                      ^
   drivers/staging/igb_avb/e1000_82575.c: In function 'e1000_update_nvm_checksum_with_offset':
   drivers/staging/igb_avb/e1000_82575.c:2635:71: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    2635 |                 DEBUGOUT("NVM Write Error while updating checksum.\n");
         |                                                                       ^
   drivers/staging/igb_avb/e1000_82575.c: In function 'e1000_set_eee_i350':
   drivers/staging/igb_avb/e1000_82575.c:2949:76: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    2949 |                         DEBUGOUT("LPI Clock Stop Bit should not be set!\n");
         |                                                                            ^
   drivers/staging/igb_avb/e1000_82575.c: In function 'e1000_read_i2c_byte_generic':
>> drivers/staging/igb_avb/e1000_82575.c:3237:59: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    3237 |                         DEBUGOUT("I2C byte read error.\n");
         |                                                           ^
   drivers/staging/igb_avb/e1000_82575.c: In function 'e1000_write_i2c_byte_generic':
   drivers/staging/igb_avb/e1000_82575.c:3311:60: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    3311 |                         DEBUGOUT("I2C byte write error.\n");
         |                                                            ^
   drivers/staging/igb_avb/e1000_82575.c: In function 'e1000_setup_serdes_link_82575':
>> drivers/staging/igb_avb/e1000_82575.c:1672:29: warning: this statement may fall through [-Wimplicit-fallthrough=]
    1672 |                 pcs_autoneg = false;
         |                 ~~~~~~~~~~~~^~~~~~~
   drivers/staging/igb_avb/e1000_82575.c:1674:9: note: here
    1674 |         default:
         |         ^~~~~~~
   drivers/staging/igb_avb/e1000_82575.c: In function 'e1000_get_media_type_82575':
   drivers/staging/igb_avb/e1000_82575.c:1794:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    1794 |                 if (e1000_sgmii_uses_mdio_82575(hw)) {
         |                    ^
   drivers/staging/igb_avb/e1000_82575.c:1800:9: note: here
    1800 |         case E1000_CTRL_EXT_LINK_MODE_PCIE_SERDES:
         |         ^~~~
>> drivers/staging/igb_avb/e1000_82575.c:2790: warning: Function parameter or member 'address' not described in '__e1000_access_emi_reg'
>> drivers/staging/igb_avb/e1000_82575.c:2790: warning: Excess function parameter 'addr' description in '__e1000_access_emi_reg'
>> drivers/staging/igb_avb/e1000_82575.c:2919: warning: Function parameter or member 'adv1G' not described in 'e1000_set_eee_i350'
>> drivers/staging/igb_avb/e1000_82575.c:2919: warning: Function parameter or member 'adv100M' not described in 'e1000_set_eee_i350'
>> drivers/staging/igb_avb/e1000_82575.c:2919: warning: Excess function parameter 'adv1g' description in 'e1000_set_eee_i350'
>> drivers/staging/igb_avb/e1000_82575.c:2919: warning: Excess function parameter 'adv100m' description in 'e1000_set_eee_i350'
>> drivers/staging/igb_avb/e1000_82575.c:2974: warning: Function parameter or member 'adv1G' not described in 'e1000_set_eee_i354'
>> drivers/staging/igb_avb/e1000_82575.c:2974: warning: Function parameter or member 'adv100M' not described in 'e1000_set_eee_i354'
>> drivers/staging/igb_avb/e1000_82575.c:2974: warning: Excess function parameter 'adv1g' description in 'e1000_set_eee_i354'
>> drivers/staging/igb_avb/e1000_82575.c:2974: warning: Excess function parameter 'adv100m' description in 'e1000_set_eee_i354'
>> drivers/staging/igb_avb/e1000_82575.c:3625: warning: Excess function parameter 'hw' description in 'e1000_get_i2c_data'
--
   drivers/staging/igb_avb/e1000_i210.c: In function 'e1000_read_invm_word_i210':
>> drivers/staging/igb_avb/e1000_i210.c:397:79: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     397 |                 DEBUGOUT1("Requested word 0x%02x not found in OTP\n", address);
         |                                                                               ^
   drivers/staging/igb_avb/e1000_i210.c: In function 'e1000_read_invm_i210':
   drivers/staging/igb_avb/e1000_i210.c:424:65: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     424 |                         DEBUGOUT("MAC Addr not found in iNVM\n");
         |                                                                 ^
   drivers/staging/igb_avb/e1000_i210.c: In function 'e1000_update_flash_i210':
>> drivers/staging/igb_avb/e1000_i210.c:725:52: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
     725 |                 DEBUGOUT("Flash update time out\n");
         |                                                    ^
--
   drivers/staging/igb_avb/e1000_mac.c: In function 'e1000_check_for_copper_link_generic':
>> drivers/staging/igb_avb/e1000_mac.c:659:61: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     659 |                 DEBUGOUT("Error configuring flow control\n");
         |                                                             ^
>> drivers/staging/igb_avb/e1000_mac.c:99: warning: Function parameter or member 's' not described in 'e1000_null_link_info'
>> drivers/staging/igb_avb/e1000_mac.c:99: warning: Function parameter or member 'd' not described in 'e1000_null_link_info'
>> drivers/staging/igb_avb/e1000_mac.c:120: warning: Function parameter or member 'h' not described in 'e1000_null_update_mc'
>> drivers/staging/igb_avb/e1000_mac.c:120: warning: Function parameter or member 'a' not described in 'e1000_null_update_mc'
>> drivers/staging/igb_avb/e1000_mac.c:131: warning: Function parameter or member 'a' not described in 'e1000_null_write_vfta'
>> drivers/staging/igb_avb/e1000_mac.c:131: warning: Function parameter or member 'b' not described in 'e1000_null_write_vfta'
>> drivers/staging/igb_avb/e1000_mac.c:142: warning: Function parameter or member 'h' not described in 'e1000_null_rar_set'
>> drivers/staging/igb_avb/e1000_mac.c:142: warning: Function parameter or member 'a' not described in 'e1000_null_rar_set'
--
   drivers/staging/igb_avb/e1000_nvm.c: In function 'e1000_read_nvm_eerd':
>> drivers/staging/igb_avb/e1000_nvm.c:490:59: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     490 |                 DEBUGOUT1("NVM read error: %d\n", ret_val);
         |                                                           ^
   drivers/staging/igb_avb/e1000_nvm.c: In function 'e1000_update_nvm_checksum_generic':
   drivers/staging/igb_avb/e1000_nvm.c:838:71: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     838 |                 DEBUGOUT("NVM Write Error while updating checksum.\n");
         |                                                                       ^
>> drivers/staging/igb_avb/e1000_nvm.c:59: warning: Function parameter or member 'a' not described in 'e1000_null_read_nvm'
>> drivers/staging/igb_avb/e1000_nvm.c:59: warning: Function parameter or member 'b' not described in 'e1000_null_read_nvm'
>> drivers/staging/igb_avb/e1000_nvm.c:59: warning: Function parameter or member 'c' not described in 'e1000_null_read_nvm'
>> drivers/staging/igb_avb/e1000_nvm.c:80: warning: Function parameter or member 'data' not described in 'e1000_null_led_default'
>> drivers/staging/igb_avb/e1000_nvm.c:92: warning: Function parameter or member 'a' not described in 'e1000_null_write_nvm'
>> drivers/staging/igb_avb/e1000_nvm.c:92: warning: Function parameter or member 'b' not described in 'e1000_null_write_nvm'
>> drivers/staging/igb_avb/e1000_nvm.c:92: warning: Function parameter or member 'c' not described in 'e1000_null_write_nvm'
..


vim +/ret_val +10249 drivers/staging/igb_avb/igb_main.c

 10245	
 10246	static struct igb_adapter *igb_lookup(char *id)
 10247	{
 10248		struct igb_pci_lookup adapter_lookup;
 10249		int ret_val;
 10250	
 10251		adapter_lookup.adapter = NULL;
 10252		adapter_lookup.pci_info = id;
 10253	
 10254		/*
 10255		 * iterate over the loaded intefaces and match on their
 10256		 * pci device ID identifier - e.g. "0000:7:0.0"
 10257		 */
 10258	
 10259		ret_val = driver_for_each_device(&igb_driver.driver, NULL,
 10260						 &adapter_lookup, __igb_notify_lookup);
 10261	
 10262		return adapter_lookup.adapter;
 10263	}
 10264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
