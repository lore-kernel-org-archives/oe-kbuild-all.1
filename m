Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672399;
	b=ir2HRz+we9NqFl1FgY+L0FPmP4rw607hD2HVwuMynl4n+4g85763XpQRoC0lWq71EzFt
	 uBJAtbgxoP4+fQe29HiLzaW7F8z4BipuGLPJxtinALTAEsk0E9GkB43DKufEPy8Sbjrot
	 5BWuZWJ2WL2OS5rg4hGTxWgoxitIUglJjwc4WzeABT9Zj4AMKGRldPNM5yLspBvxXYcOH
	 0rZoNgmvJLULWFh74d1WRizUbWd0JTdkC9SSIqS8dHtXw2NpD3LUR1IiOlIHvDDD5X0g2
	 u7WyUYCaDi4t48KDvd0lJvGvZnnSEUFAmQgwcZ16GeqPHLNpFKpxw1QJlqH48bmxg/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672399;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6OfzYIP1bXExBnvc/K1qwnkf3+tq7zkwz1Js0K4ygeI=;
	b=zk7gQxwUlGQKPg+amv9DtHNZIGlUIIZ8FHxu8yXbfZ9kL8Ox4qRBhWkXgaMzhJPPEXio
	 R2UCWdBtsbqIVPuWCBbL5eFz1MYCHjNcrIaR009EY1g+g0gg4OIWNNgn14+naI1wdx3VD
	 tXxvDFzXvH5Xzf32UAo+AUNY6m4YgqEVpLRTdtS3Lx9U+4iI1EIoRN3LD+3Ky6WHNBloh
	 dug7ksUftqqIi3y6gDwFVzcPn+iwHxon7+cr/USaN+Sgwjw6FWMyHN+KYxbvLgOf5pJ5A
	 fznSmyK+ZxnjYS8PXjX32nrCGOjJpsnefPZH8zKg8EadS5LOygEwzoL/+66bThO3+ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="a/OKE1vr";
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7F8606A324
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Nov 2026 02:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E7F8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a/OKE1vr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793672397; x=1825208397;
  h=date:from:to:cc:subject:message-id;
  bh=rJJ5NJ+myaFf56S49k8Z+VH+GXdpVVQvCQashy+coWM=;
  b=a/OKE1vrcltwA6K/VdwKPyJ54sfeQkR48aJ3xe+WA7FYTUqNg6BIY6Go
   U0iAFTPw2BIKy8xYNh1H7PAWWfg5ihNteZK9oFDlXTalXt2wCxfpuxeu8
   00IFgKEGZpjKX6IT7A7D3LNIQ70yncbBG/GTWY4/mTKH33anmZj4aW8qN
   ONOdjBp/IMxQuT5rDjq4qbQVs2FiPQmxH/HFNLEAXn1X1UINtgUx+tWIZ
   K//HvkffmQu22c0tqYqp9OYp2dcTsi/6vy2FmsACjHbVAHV8EK4t8PfP+
   BQoixg4UhMidylQGCF8p3An41j3qwbYIQ3s4gDG6QWbOamm73UNM5xZ+g
   g==;
X-CSE-ConnectionGUID: ge03AKebQCWouJ4Me7KTbA==
X-CSE-MsgGUID: WU5Fai/sQKuQZiibgzpQ9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2396770"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2396770"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 18:19:56 -0800
X-CSE-ConnectionGUID: UCvned1ARz6oU4bRNnFt6w==
X-CSE-MsgGUID: IB5bKjUkSZmvT7Zrv1WTJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6451119"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Nov 2026 18:19:55 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xO47s-00000000iC0-0Sau;
	Tue, 03 Nov 2026 02:19:52 +0000
Date: Tue, 03 Nov 2026 10:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
 Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: [tnguy-net-queue:100GbE 5/11]
 drivers/net/ethernet/intel/ice/ice_ptp.c:1253:29: error: 'struct ice_ptp_tx'
 has no member named 'calibrating'
Message-ID: <202611031042.vATH1Rxg-lkp@intel.com>
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
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20261103/202611031042.vATH1Rxg-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611031042.vATH1Rxg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611031042.vATH1Rxg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_ptp.c: In function 'ice_ptp_port_phy_stop':
>> drivers/net/ethernet/intel/ice/ice_ptp.c:1253:29: error: 'struct ice_ptp_tx' has no member named 'calibrating'
    1253 |                 ptp_port->tx.calibrating = true;
         |                             ^
   drivers/net/ethernet/intel/ice/ice_ptp.c: In function 'ice_ptp_port_phy_restart':
   drivers/net/ethernet/intel/ice/ice_ptp.c:1328:29: error: 'struct ice_ptp_tx' has no member named 'calibrating'
    1328 |                 ptp_port->tx.calibrating = true;
         |                             ^
   drivers/net/ethernet/intel/ice/ice_ptp.c:1338:29: error: 'struct ice_ptp_tx' has no member named 'calibrating'
    1338 |                 ptp_port->tx.calibrating = false;
         |                             ^


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
