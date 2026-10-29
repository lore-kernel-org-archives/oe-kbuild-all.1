Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307261;
	b=rfQ29oapGi8SNmQi3e9UbEsZiPJ9ZIJEcGYNeu7OkYSSsm3WKCDvjgakYziorjoZTVEQ
	 55qXuue7WE8sK5FXosdnx52huaExOENWT3QdvvPBI0G0RWwQpAs0ekJndFuGauMBfhqXG
	 AFqIG2wyTLWCOvqZ89bb1r4acGgfbavS5geYBUru/LSQRnnz12xmFQlabIvrt7m187ZIl
	 US2fen9IPPbMOXWfeYSD16Cb/ritra/PBszCJThxuhY5yDRlTvZrqA6HG/rNONM/N9Beg
	 ctny8i2RsVr/xelUCUTXNotmEWL6rGM4d47aYmU7zo4oKpNMX3EJzgjz6ckeyjrRQ1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307261;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=lGu69vDvGx+7L4WZE7mVDe2bLPktA6ISozdTi5g/Juk=;
	b=MTaEwzf9bbgC0X++zzG/9FEVX9qJoJu+yFLroqgV3lY31IszSUAI36JGSpJm22/QSj3D
	 wHABNgoU8U0p1I/cDMoKFcjovK+Z1+Z4KPVTBPFMMpTaPbqA9CgSbSMBhe1gtZI5cSwO9
	 D2GAvs0Hyl7XC27wyvWWc1X86FCTQE9BuxfWMRC71uLs5zlXr6UgjCE+NDCixLoD6ttmA
	 J76oIjXcBzdmyy3EHYE5us2ft/ueMG47SUXeZbB6V/KbrEK65W11wthuflbPHfD8zGfm9
	 w0tYBqdTjpoJFUuX46ED1T7NiQ0rzlYwi+iXHKorBlzCpDCS6wT9GmsoLc0VWp4UCDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cfdddEid;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62FC606A322
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 20:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E62FC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cfdddEid
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793307260; x=1824843260;
  h=date:from:to:cc:subject:message-id;
  bh=gWxtGLHDvEyB9hQHU+iVke1FUdNo0PxD3/rIURZ/IWo=;
  b=cfdddEidVqcYCZY7kDw+V2CA2R8N/a9FC8m2B0WQDwpwtmKuqfZOuwVM
   5KPWly65elLuDG9/Nz2k1Rrq6D8VzlVBg/HNEmggglvjCsgb9J1AVPvNx
   xGuuImUel9B3B0i7hhdD7cfliRokyZSLuVp+okAJrPqX06WIrgBxHbHQN
   2cr3Z5GGzgqZ57f2rexzxku2e155WWXtYSt6szdG9bGrNBe+CgP72x/81
   Tw3DsNwYZ8GdhDF31qDNDl2Pqcq6Wiasz3cg8hirV4d3QHMEid9yc8og4
   MFC8t9O9dnm7+WEwXwz0328nYS+vlnha5ltkhGSugxid+5/bBD6vVeInY
   A==;
X-CSE-ConnectionGUID: dNG+rISlSvWg4YVjb7mj0g==
X-CSE-MsgGUID: Jp3DoddhRMynbpSkLwNicw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2054741"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2054741"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 13:54:20 -0700
X-CSE-ConnectionGUID: sVXAUUIdQ6CLSNJs9335FA==
X-CSE-MsgGUID: 6yJ9WioLQPufnjJTRi69Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5275470"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 29 Oct 2026 13:54:17 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMX8Z-000000005LH-3CKd;
	Thu, 29 Oct 2026 20:54:15 +0000
Date: Thu, 29 Oct 2026 21:53:23 +0100
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
 Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: [tnguy-net-queue:100GbE 5/11]
 drivers/net/ethernet/intel/ice/ice_ptp.c:1253:15: error: 'struct ice_ptp_tx'
 has no member named 'calibrating'
Message-ID: <202610292105.A3nUSLeQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git 100GbE
head:   3c73d34ba643c4e24ff549f3f083372a36b09952
commit: 64639b94e14663a7f80953ac0d075edac626ee96 [5/11] ice: E825: stop clearing PHY_REG_TX_OFFSET_READY
config: sparc-randconfig-2000-20261029 (https://download.01.org/0day-ci/archive/20261029/202610292105.A3nUSLeQ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610292105.A3nUSLeQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610292105.A3nUSLeQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_ptp.c: In function 'ice_ptp_port_phy_stop':
>> drivers/net/ethernet/intel/ice/ice_ptp.c:1253:15: error: 'struct ice_ptp_tx' has no member named 'calibrating'
      ptp_port->tx.calibrating = true;
                  ^
   drivers/net/ethernet/intel/ice/ice_ptp.c: In function 'ice_ptp_port_phy_restart':
   drivers/net/ethernet/intel/ice/ice_ptp.c:1328:15: error: 'struct ice_ptp_tx' has no member named 'calibrating'
      ptp_port->tx.calibrating = true;
                  ^
   drivers/net/ethernet/intel/ice/ice_ptp.c:1338:15: error: 'struct ice_ptp_tx' has no member named 'calibrating'
      ptp_port->tx.calibrating = false;
                  ^


vim +1253 drivers/net/ethernet/intel/ice/ice_ptp.c

  1222	
  1223	/**
  1224	 * ice_ptp_port_phy_stop - Stop timestamping for a PHY port
  1225	 * @ptp_port: PTP port to stop
  1226	 *
  1227	 * Context: must hold the adapter ps_lock.
  1228	 */
  1229	static int
  1230	ice_ptp_port_phy_stop(struct ice_ptp_port *ptp_port)
  1231	{
  1232		struct ice_pf *pf = ptp_port_to_pf(ptp_port);
  1233		u8 port = ptp_port->port_num;
  1234		struct ice_hw *hw = &pf->hw;
  1235		unsigned long flags;
  1236		int err;
  1237	
  1238		lockdep_assert_held(&pf->adapter->ps_lock);
  1239	
  1240		switch (hw->mac_type) {
  1241		case ICE_MAC_E810:
  1242		case ICE_MAC_E830:
  1243			err = 0;
  1244			break;
  1245		case ICE_MAC_GENERIC:
  1246			kthread_cancel_delayed_work_sync(&ptp_port->ov_work);
  1247	
  1248			err = ice_stop_phy_timer_e82x(hw, port, true);
  1249			break;
  1250		case ICE_MAC_GENERIC_3K_E825:
  1251			/* Disable new Tx timestamp requests */
  1252			spin_lock_irqsave(&ptp_port->tx.lock, flags);
> 1253			ptp_port->tx.calibrating = true;
  1254			spin_unlock_irqrestore(&ptp_port->tx.lock, flags);
  1255	
  1256			ice_ptp_mark_tx_tracker_stale(&ptp_port->tx);
  1257	
  1258			err = ice_stop_phy_timer_eth56g(hw, port);
  1259			break;
  1260		default:
  1261			err = -ENODEV;
  1262		}
  1263		if (err && err != -EBUSY)
  1264			dev_err(ice_pf_to_dev(pf), "PTP failed to set PHY port %d down, err %d\n",
  1265				port, err);
  1266	
  1267		return err;
  1268	}
  1269	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
