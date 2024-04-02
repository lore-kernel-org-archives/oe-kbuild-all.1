Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E0C15E1F5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 21:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712093121; cv=none; b=K8xpg+IeHIo1sf6x7KdWnkiwuHClMp+WROgdGOtRmDD7vw1ZnU9dioEVl+fS6uGD73Vfpn6Aag8/S2Iqy0hfybxK9lbehRB+KvKQ/EFqflBQZ3r+fAAXw2QdW3H5me79mvQkuH+COI8t4MzXHBGQpqhzr3Sq8PBbtH48/6IrFf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712093121; c=relaxed/simple;
	bh=ta//Y+8HiPtwsXP8wndmlDIb3517hzA32tORsh5de0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cz2uikHz76P5eTMK4PDexxAYns6oL74bVuDe5m2l5hFZoqxeVuKcGQrk2JL0b+XcBOZTb+M/Ebc3RWiBLry+vtQIMwXYesW/hc0czg4/CbqTv4T2H77eFBOAPDCuwSaea+VxdW1eUlaLG4m+Uv+6T6b18YmDC6la7W/8fdMQIOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WcaKflAv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WcaKflAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712093119; x=1743629119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ta//Y+8HiPtwsXP8wndmlDIb3517hzA32tORsh5de0M=;
  b=WcaKflAvov7ZldGfzldV/iJAWmHzot8xD0laVAuDSLrhBk1XoDtkImXo
   PRez3ST6VnBlymJk8KDs00ErNboR0cutsY7fPdmI6F9AdBvNQQsQUSq5M
   koVa8phCRDTuPgbIejCyKfz1z8JvZPj7boSrD4hA7mRtw5rKuShJSVu62
   Dmw6dkH8CzJ8bf2KdJE60u6h8APTw/pk6IsE4pXupgT4JL2XI425raqXy
   HzjARJoZMfuyLOARWRSQpVpkkgtSs+HPDWw/YS981gmkxQxx7dZhAq0N0
   wCylp6wdhAJyKXDdXwf35s5a6CCAfkzvqNgccQmc2FogNUvghk1a9/cCv
   Q==;
X-CSE-ConnectionGUID: yXaugDheRISQ6edj29r8Jg==
X-CSE-MsgGUID: RyXBAaSYTqq3KJjT8psTow==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="11073329"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="11073329"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 14:25:18 -0700
X-CSE-ConnectionGUID: a/ZXAOTRQpGmtwexWoJWyg==
X-CSE-MsgGUID: R9yVYbgNRk6BRXyJtodDsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="49430404"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 02 Apr 2024 14:25:17 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrld4-0001Yp-2O;
	Tue, 02 Apr 2024 21:25:14 +0000
Date: Wed, 3 Apr 2024 05:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 6862/7265]
 drivers/net/ethernet/mucse/rnpvf/vf.c:486:5: warning: no previous prototype
 for 'rnpvf_addr_list_itr'
Message-ID: <202404030557.mZnvUtOv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   448a7c1b3e0654d6b6801c216e7c265445a83a2f
commit: 6adab536d69347a10c2366aaf6b86de963d5994b [6862/7265] drivers: initial support for rnpvf drivers from Mucse Technology
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240403/202404030557.mZnvUtOv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404030557.mZnvUtOv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404030557.mZnvUtOv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mucse/rnpvf/vf.c: In function 'rnpvf_stop_hw_vf':
   drivers/net/ethernet/mucse/rnpvf/vf.c:256:13: warning: variable 'number_of_queues' set but not used [-Wunused-but-set-variable]
     256 |         u32 number_of_queues;
         |             ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/vf.c: At top level:
>> drivers/net/ethernet/mucse/rnpvf/vf.c:486:5: warning: no previous prototype for 'rnpvf_addr_list_itr' [-Wmissing-prototypes]
     486 | u8 *rnpvf_addr_list_itr(struct rnpvf_hw __maybe_unused *hw,
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpvf/vf.c:685:5: warning: no previous prototype for 'rnpvf_negotiate_api_version' [-Wmissing-prototypes]
     685 | int rnpvf_negotiate_api_version(struct rnpvf_hw *hw, int api)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpvf/vf.c:690:5: warning: no previous prototype for 'rnpvf_get_queues' [-Wmissing-prototypes]
     690 | int rnpvf_get_queues(struct rnpvf_hw *hw, unsigned int *num_tcs,
         |     ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpvf/vf.c:696:6: warning: no previous prototype for 'rnpvf_set_veb_mac_n10' [-Wmissing-prototypes]
     696 | void rnpvf_set_veb_mac_n10(struct rnpvf_hw *hw, u8 *mac, u32 vfnum,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpvf/vf.c:718:6: warning: no previous prototype for 'rnpvf_set_vlan_n10' [-Wmissing-prototypes]
     718 | void rnpvf_set_vlan_n10(struct rnpvf_hw *hw, u16 vid, u32 vf_num)
         |      ^~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/mucse/rnpvf/ethtool.c:249:6: warning: no previous prototype for 'rnpvf_get_ringparam' [-Wmissing-prototypes]
     249 | void rnpvf_get_ringparam(struct net_device *netdev,
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/ethtool.c: In function 'rnpvf_get_strings':
   drivers/net/ethernet/mucse/rnpvf/ethtool.c:269:13: warning: variable 'queue_idx' set but not used [-Wunused-but-set-variable]
     269 |         u16 queue_idx;
         |             ^~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/ethtool.c: At top level:
>> drivers/net/ethernet/mucse/rnpvf/ethtool.c:103:19: warning: 'rnp_gstrings_test' defined but not used [-Wunused-const-variable=]
     103 | static const char rnp_gstrings_test[][ETH_GSTRING_LEN] = {
         |                   ^~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:127:6: warning: no previous prototype for 'rnpvf_unmap_and_free_tx_resource' [-Wmissing-prototypes]
     127 | void rnpvf_unmap_and_free_tx_resource(struct rnpvf_ring *ring,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:919:6: warning: no previous prototype for 'rnpvf_alloc_rx_buffers' [-Wmissing-prototypes]
     919 | void rnpvf_alloc_rx_buffers(struct rnpvf_ring *rx_ring, u16 cleaned_count)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1945:6: warning: no previous prototype for 'update_rx_count' [-Wmissing-prototypes]
    1945 | void update_rx_count(int cleaned, struct rnpvf_q_vector *q_vector)
         |      ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2420:6: warning: no previous prototype for 'rnpvf_write_eitr_rx' [-Wmissing-prototypes]
    2420 | void rnpvf_write_eitr_rx(struct rnpvf_q_vector *q_vector)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2523:6: warning: no previous prototype for 'rnpvf_configure_tx_ring' [-Wmissing-prototypes]
    2523 | void rnpvf_configure_tx_ring(struct rnpvf_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2589:6: warning: no previous prototype for 'rnpvf_disable_rx_queue' [-Wmissing-prototypes]
    2589 | void rnpvf_disable_rx_queue(struct rnpvf_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2595:6: warning: no previous prototype for 'rnpvf_enable_rx_queue' [-Wmissing-prototypes]
    2595 | void rnpvf_enable_rx_queue(struct rnpvf_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2601:6: warning: no previous prototype for 'rnpvf_configure_rx_ring' [-Wmissing-prototypes]
    2601 | void rnpvf_configure_rx_ring(struct rnpvf_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c: In function 'rnpvf_vlan_rx_kill_vid':
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2736:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    2736 |         int err = -EOPNOTSUPP;
         |             ^~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c: In function 'rnpvf_acquire_msix_vectors':
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3307:13: warning: variable 'vector_threshold' set but not used [-Wunused-but-set-variable]
    3307 |         int vector_threshold;
         |             ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c: In function 'irq_miss_check':
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3456:26: warning: variable 'hw' set but not used [-Wunused-but-set-variable]
    3456 |         struct rnpvf_hw *hw;
         |                          ^~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c: At top level:
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4590:6: warning: no previous prototype for 'rnpvf_tx_ctxtdesc' [-Wmissing-prototypes]
    4590 | void rnpvf_tx_ctxtdesc(struct rnpvf_ring *tx_ring, u16 mss_seg_len,
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5039:6: warning: no previous prototype for 'rnpvf_maybe_tx_ctxtdesc' [-Wmissing-prototypes]
    5039 | void rnpvf_maybe_tx_ctxtdesc(struct rnpvf_ring *tx_ring,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5089:13: warning: no previous prototype for 'rnpvf_xmit_frame_ring' [-Wmissing-prototypes]
    5089 | netdev_tx_t rnpvf_xmit_frame_ring(struct sk_buff *skb,
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5580:6: warning: no previous prototype for 'rnpvf_assign_netdev_ops' [-Wmissing-prototypes]
    5580 | void rnpvf_assign_netdev_ops(struct net_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c: In function 'rnpvf_request_msix_irqs':
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2129:72: warning: '%d' directive output may be truncated writing between 1 and 5 bytes into a region of size between 1 and 16 [-Wformat-truncation=]
    2129 |                                  sizeof(q_vector->name) - 1, "%s-%s-%d-%d",
         |                                                                        ^~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2129:62: note: directive argument in the range [0, 65535]
    2129 |                                  sizeof(q_vector->name) - 1, "%s-%s-%d-%d",
         |                                                              ^~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2128:25: note: 'snprintf' output between 10 and 29 bytes into a destination of size 24
    2128 |                         snprintf(q_vector->name,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
    2129 |                                  sizeof(q_vector->name) - 1, "%s-%s-%d-%d",
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2130 |                                  netdev->name, "TxRx", i, q_vector->v_idx);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rnpvf_addr_list_itr +486 drivers/net/ethernet/mucse/rnpvf/vf.c

   485	
 > 486	u8 *rnpvf_addr_list_itr(struct rnpvf_hw __maybe_unused *hw,
   487				u8 **mc_addr_ptr)
   488	{
   489		struct netdev_hw_addr *mc_ptr;
   490		u8 *addr = *mc_addr_ptr;
   491	
   492		mc_ptr = container_of(addr, struct netdev_hw_addr, addr[0]);
   493		if (mc_ptr->list.next) {
   494			struct netdev_hw_addr *ha;
   495	
   496			ha = list_entry(mc_ptr->list.next, struct netdev_hw_addr,
   497					list);
   498			*mc_addr_ptr = ha->addr;
   499		} else {
   500			*mc_addr_ptr = NULL;
   501		}
   502	
   503		return addr;
   504	}
   505	
   506	/**
   507	 *  rnpvf_update_mc_addr_list_vf - Update Multicast addresses
   508	 *  @hw: pointer to the HW structure
   509	 *  @netdev: pointer to net device structure
   510	 *
   511	 *  Updates the Multicast Table Array.
   512	 **/
   513	static s32 rnpvf_update_mc_addr_list_vf(struct rnpvf_hw *hw,
   514						struct net_device *netdev)
   515	{
   516		struct netdev_hw_addr *ha;
   517		u32 msgbuf[RNP_VFMAILBOX_SIZE];
   518		u16 *vector_list = (u16 *)&msgbuf[1];
   519		u32 cnt, i;
   520		int addr_count = 0;
   521		u8 *addr_list = NULL;
   522	
   523		/* Each entry in the list uses 1 16 bit word.  We have 30
   524		 * 16 bit words available in our HW msg buffer (minus 1 for the
   525		 * msg type).  That's 30 hash values if we pack 'em right.  If
   526		 * there are more than 30 MC addresses to add then punt the
   527		 * extras for now and then add code to handle more than 30 later.
   528		 * It would be unusual for a server to request that many multi-cast
   529		 * addresses except for in large enterprise network environments.
   530		 */
   531	
   532		cnt = netdev_mc_count(netdev);
   533		if (cnt > 30)
   534			cnt = 30;
   535		msgbuf[0] = RNP_VF_SET_MULTICAST;
   536		msgbuf[0] |= cnt << RNP_VT_MSGINFO_SHIFT;
   537	
   538		addr_count = netdev_mc_count(netdev);
   539	
   540		ha = list_first_entry(&netdev->mc.list, struct netdev_hw_addr,
   541				      list);
   542		addr_list = ha->addr;
   543		for (i = 0; i < addr_count; i++) {
   544			vector_list[i] = rnpvf_mta_vector(hw,
   545							  rnpvf_addr_list_itr(hw, &addr_list));
   546		}
   547	
   548		rnpvf_write_msg_read_ack(hw, msgbuf, RNP_VFMAILBOX_SIZE);
   549	
   550		return 0;
   551	}
   552	
   553	/**
   554	 *  rnpvf_set_vfta_vf - Set/Unset vlan filter table address
   555	 *  @hw: pointer to the HW structure
   556	 *  @vlan: 12 bit VLAN ID
   557	 *  @vind: unused by VF drivers
   558	 *  @vlan_on: if true then set bit, else clear bit
   559	 **/
   560	static s32 rnpvf_set_vfta_vf(struct rnpvf_hw *hw, u32 vlan, u32 vind,
   561				     bool vlan_on)
   562	{
   563		struct rnp_mbx_info *mbx = &hw->mbx;
   564		u32 msgbuf[2];
   565		s32 err;
   566	
   567		msgbuf[0] = RNP_VF_SET_VLAN;
   568		msgbuf[1] = vlan;
   569		/* Setting the 8 bit field MSG INFO to TRUE indicates "add" */
   570		msgbuf[0] |= vlan_on << RNP_VT_MSGINFO_SHIFT;
   571	
   572		err = mbx->ops.write_posted(hw, msgbuf, 2, false);
   573		if (err)
   574			goto mbx_err;
   575	
   576		err = mbx->ops.read_posted(hw, msgbuf, 2, false);
   577		if (err)
   578			goto mbx_err;
   579	
   580		/* remove extra bits from the message */
   581		msgbuf[0] &= ~RNP_VT_MSGTYPE_CTS;
   582		msgbuf[0] &= ~(0xFF << RNP_VT_MSGINFO_SHIFT);
   583	
   584		if (msgbuf[0] != (RNP_VF_SET_VLAN | RNP_VT_MSGTYPE_ACK))
   585			err = RNP_ERR_INVALID_ARGUMENT;
   586	
   587	mbx_err:
   588		return err;
   589	}
   590	
   591	static s32 rnpvf_set_vlan_strip(struct rnpvf_hw *hw, bool vlan_on)
   592	{
   593		struct rnp_mbx_info *mbx = &hw->mbx;
   594		struct rnpvf_adapter *adapter = (struct rnpvf_adapter *)hw->back;
   595		u32 msgbuf[4];
   596		s32 err;
   597		int i;
   598	
   599		if (adapter->num_rx_queues > 2) {
   600			err = -EINVAL;
   601			goto mbx_err;
   602		}
   603	
   604		msgbuf[0] = RNP_VF_SET_VLAN_STRIP;
   605		msgbuf[1] = (vlan_on << 31) | adapter->num_rx_queues;
   606	
   607		for (i = 0; i < adapter->num_rx_queues; i++)
   608			msgbuf[2 + i] = adapter->rx_ring[i]->rnpvf_queue_idx;
   609	
   610		err = mbx->ops.write_posted(hw, msgbuf, 2 + adapter->num_rx_queues,
   611					    false);
   612		if (err)
   613			goto mbx_err;
   614	
   615		err = mbx->ops.read_posted(hw, msgbuf, 1, false);
   616		if (err)
   617			goto mbx_err;
   618	
   619		/* remove extra bits from the message */
   620		msgbuf[0] &= ~RNP_VT_MSGTYPE_CTS;
   621		msgbuf[0] &= ~(0xFF << RNP_VT_MSGINFO_SHIFT);
   622	
   623		if (msgbuf[0] != (RNP_VF_SET_VLAN_STRIP | RNP_VT_MSGTYPE_ACK))
   624			err = RNP_ERR_INVALID_ARGUMENT;
   625	
   626	mbx_err:
   627		return err;
   628	}
   629	
   630	/**
   631	 *  rnpvf_setup_mac_link_vf - Setup MAC link settings
   632	 *  @hw: pointer to hardware structure
   633	 *  @speed: Unused in this implementation
   634	 *  @autoneg: Unused in this implementation
   635	 *  @autoneg_wait_to_complete: Unused in this implementation
   636	 *
   637	 *  Do nothing and return success.  VF drivers are not allowed to change
   638	 *  global settings.  Maintained for driver compatibility.
   639	 **/
   640	static s32 rnpvf_setup_mac_link_vf(struct rnpvf_hw *hw,
   641					   rnp_link_speed speed, bool autoneg,
   642					   bool autoneg_wait_to_complete)
   643	{
   644		return 0;
   645	}
   646	
   647	/**
   648	 *  rnpvf_check_mac_link_vf - Get link/speed status
   649	 *  @hw: pointer to hardware structure
   650	 *  @speed: pointer to link speed
   651	 *  @link_up: true is link is up, false otherwise
   652	 *  @autoneg_wait_to_complete: true when waiting for completion is needed
   653	 *
   654	 *  Reads the links register to determine if link is up and the current speed
   655	 **/
   656	static s32 rnpvf_check_mac_link_vf(struct rnpvf_hw *hw,
   657					   rnp_link_speed *speed, bool *link_up,
   658					   bool autoneg_wait_to_complete)
   659	{
   660		*speed = hw->speed;
   661		*link_up = hw->link;
   662	
   663		return 0;
   664	}
   665	
   666	/**
   667	 *  rnpvf_rlpml_set_vf - Set the maximum receive packet length
   668	 *  @hw: pointer to the HW structure
   669	 *  @max_size: value to assign to max frame size
   670	 **/
   671	void rnpvf_rlpml_set_vf(struct rnpvf_hw *hw, u16 max_size)
   672	{
   673		u32 msgbuf[2];
   674	
   675		msgbuf[0] = RNP_VF_SET_LPE;
   676		msgbuf[1] = max_size;
   677		rnpvf_write_msg_read_ack(hw, msgbuf, 2);
   678	}
   679	
   680	/**
   681	 *  rnpvf_negotiate_api_version - Negotiate supported API version
   682	 *  @hw: pointer to the HW structure
   683	 *  @api: integer containing requested API version
   684	 **/
 > 685	int rnpvf_negotiate_api_version(struct rnpvf_hw *hw, int api)
   686	{
   687		return 0;
   688	}
   689	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
