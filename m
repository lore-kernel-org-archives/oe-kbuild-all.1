Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D9D2F4A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 04:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741928001; cv=none; b=A69h/l/tUrFAxFBKiBB5KdXIDerTCRwVmTYA49+t3zyVemOqugQmclZJWWnIriwT9EHqno8zbQvg4uXNimKwD2jSQULbGhF41U+XaWzok3S4CDxCEz7pKwf5aVZBAOZOEe9CvTdHlGDhuF8MS4ztalsWaso8Nkj7w5U5YvedIp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741928001; c=relaxed/simple;
	bh=yO/tIOsQ9Uyv/p6uf8fje1m/SEwoYXRXzO6lAvUj6E8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LQS50ghdcIKxlmF5RLn3tIMnczscYZxzdPBLRt8uN9mGAai1BVBomxWolDvUjzYqC7nnHQjNPgYrCQ+BZalUiK7a30asnaQ1384U7LhbhymYHmYpDUNrgsFaH0iEa/JnYQRiVI5Noy9Qufnt2IgjVLphbDJL2kFwn0oyc2hSMWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qwnt36rl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qwnt36rl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741927999; x=1773463999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yO/tIOsQ9Uyv/p6uf8fje1m/SEwoYXRXzO6lAvUj6E8=;
  b=Qwnt36rlUjir5VzXaadjOOHpqzgfVE43l4wxbEtfoyd1AztRrs9MqEuH
   Tt9heVKRSyXSqovQI4Qi0ywjsVv/hGF4gw8MmGNDAFxepOdbOBcQzSNWY
   ntdmOS9Sanp28QE7CQWbzV8kDLx9shyN32y92nesUqkH9HF0XlfCDBdJr
   iOZWiFaIH8Ldn9MknoIBI4ZKPJAHEkwwAxK6bTXz8UbDsxAE2vJ1FNyti
   jrLYYHOigTNsx3XjjSz7IDGe/+8lAe2FBD+bAs+x0uTrqj2aNLj6367lZ
   dQCQfXBSflg2iejDszLr1Ab6RGrCYqZIZFiAf4Pg9fMwJH0bsrET9FNx3
   g==;
X-CSE-ConnectionGUID: V/SgUlq2SwKOXyfQIc/0MA==
X-CSE-MsgGUID: hSKyf/CnRoSxAZtz5QQEcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="30660146"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="30660146"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 21:53:16 -0700
X-CSE-ConnectionGUID: TFsG/ESwTK+MhgeBuBMc3g==
X-CSE-MsgGUID: yKj5u0TXTMSFloL0hE8aKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="158297376"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Mar 2025 21:53:14 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsx2l-000A88-1E;
	Fri, 14 Mar 2025 04:53:11 +0000
Date: Fri, 14 Mar 2025 12:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Chwee-Lin Choong <chwee.lin.choong@intel.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [tnguy-next-queue:dev-queue 84/88]
 drivers/net/ethernet/intel/igc/igc_tsn.h:48:undefined reference to
 `ethtool_mmsv_event_handle'
Message-ID: <202503141235.JHgptZMW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   7dca3a8a1f3c70a4ba8115e4ee5827e424629eaf
commit: cb3499eabcea3f82c2ded3922431309d440b8ff3 [84/88] igc: add support for frame preemption verification
config: arm64-randconfig-001-20250314 (https://download.01.org/0day-ci/archive/20250314/202503141235.JHgptZMW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503141235.JHgptZMW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503141235.JHgptZMW-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/net/ethernet/intel/igc/igc_main.o: in function `igc_fpe_handle_mpacket':
>> drivers/net/ethernet/intel/igc/igc_tsn.h:48:(.text+0x9670): undefined reference to `ethtool_mmsv_event_handle'
   aarch64-linux-ld: drivers/net/ethernet/intel/igc/igc_main.o: in function `igc_clean_tx_irq':
>> drivers/net/ethernet/intel/igc/igc_main.c:3157:(.text+0xec24): undefined reference to `ethtool_mmsv_event_handle'
   aarch64-linux-ld: drivers/net/ethernet/intel/igc/igc_main.o: in function `igc_watchdog_task':
>> drivers/net/ethernet/intel/igc/igc_main.c:5878:(.text+0x10384): undefined reference to `ethtool_mmsv_link_state_handle'
>> aarch64-linux-ld: drivers/net/ethernet/intel/igc/igc_main.c:5917:(.text+0x1056c): undefined reference to `ethtool_mmsv_link_state_handle'
   aarch64-linux-ld: drivers/net/ethernet/intel/igc/igc_main.o: in function `igc_down':
>> drivers/net/ethernet/intel/igc/igc_main.c:5352:(.text+0x114c8): undefined reference to `ethtool_mmsv_stop'
   aarch64-linux-ld: drivers/net/ethernet/intel/igc/igc_ethtool.o: in function `igc_ethtool_set_mm':
>> drivers/net/ethernet/intel/igc/igc_ethtool.c:1799:(.text+0x470): undefined reference to `ethtool_mmsv_set_mm'
   aarch64-linux-ld: drivers/net/ethernet/intel/igc/igc_tsn.o: in function `igc_fpe_init':
>> drivers/net/ethernet/intel/igc/igc_tsn.c:131:(.text+0x11e0): undefined reference to `ethtool_mmsv_init'


vim +48 drivers/net/ethernet/intel/igc/igc_tsn.h

    27	
    28	static inline bool igc_fpe_handle_mpacket(struct igc_adapter *adapter,
    29						  union igc_adv_rx_desc *rx_desc,
    30						  unsigned int size, void *pktbuf)
    31	{
    32		u32 status_error = le32_to_cpu(rx_desc->wb.upper.status_error);
    33		int smd;
    34	
    35		smd = FIELD_GET(IGC_RXDADV_STAT_SMD_TYPE_MASK, status_error);
    36		if (smd != IGC_RXD_STAT_SMD_TYPE_V && smd != IGC_RXD_STAT_SMD_TYPE_R)
    37			return false;
    38	
    39		if (size == SMD_FRAME_SIZE && mem_is_zero(pktbuf, SMD_FRAME_SIZE)) {
    40			struct ethtool_mmsv *mmsv = &adapter->fpe.mmsv;
    41			enum ethtool_mmsv_event event;
    42	
    43			if (smd == IGC_RXD_STAT_SMD_TYPE_V)
    44				event = ETHTOOL_MMSV_LP_SENT_VERIFY_MPACKET;
    45			else
    46				event = ETHTOOL_MMSV_LP_SENT_RESPONSE_MPACKET;
    47	
  > 48			ethtool_mmsv_event_handle(mmsv, event);
    49		}
    50	
    51		return true;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
