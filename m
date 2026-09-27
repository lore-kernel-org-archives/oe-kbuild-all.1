Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CDD30E0FE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 18:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534760; cv=none; b=TejUflgZ4BaryBInByFuMwDIko7gPG4dUezqhmSeckDDxERHVg9EDUppN1mf11sxI4Abqfmq/6lISL7tEUaV6TsHb6nlpy3Or7MCOsEkV72wkrIyxsEx55lZMuHVNDybO0ZrzU7jTeThA7fr8JgYmRjeZHt3LgNGIYbX+DaOtjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534760; c=relaxed/simple;
	bh=wLUZ2uhgeY+dpV2FspA3Mt338FPZRNnsOPr/obH3tFs=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=Blm0/85kRdkTLKm/Zy9nteWtpEzksuSRMaa0b1pmL6PeF+RyI0FEXmzcawOMTJhZ9cXySNCmSiPOrv7uFNxtDWsRKNxwM/wKhsQx+VIqFh7Vg48zpk1hu0sPFdnQAPtrfv2qquQMllN4b4ZyKFqxFBOXChaU1/GXLDYX46uj1G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=EvqSRLOl; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="EvqSRLOl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dcaaICPdDwmU6gMGeSez2h5i9Ojmwn5XCa17HoqfTKo=;
  b=EvqSRLOl7GJ6RkFcsyUD9+2kR6sAicHOkT1ZS+p6B+ofyB9Yve9YvYYJ
   0BPCMWP57RCY/YDZyI2IZWddebyvcC/basvMDgQXjPlgA9kEMUM8OjPiD
   PIja1ORrIzoe7UvbZN3QXqVqjjqIiB/CTFHG3adM1D12L0rcJNPZ5Zrsi
   w=;
X-CSE-ConnectionGUID: ZowQYoLGR3StWWog+06pow==
X-CSE-MsgGUID: vzRb9z9dRFOHKUdXBdf1Sw==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,126,1787004000"; 
   d="scan'208";a="158127660"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 20:45:54 +0200
Date: Sun, 27 Sep 2026 20:45:52 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Wei Fang <wei.fang@nxp.com>
cc: Paolo Abeni <pabeni@redhat.com>, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5544/10910] drivers/net/ethernet/freescale/enetc/enetc_vf.c:575:7-15:
 opportunity for str_on_off(tx_pause) (fwd)
Message-ID: <8af990e6-9fdf-d6dd-2ed8-f756b155b879@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Sun, 27 Sep 2026 19:33:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 5544/10910]
    drivers/net/ethernet/freescale/enetc/enetc_vf.c:575:7-15: opportunity for
    str_on_off(tx_pause)

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Wei Fang <wei.fang@nxp.com>
CC: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 36a16ed591b3565b5c5da547221923ead5a3eb6e [5544/10910] net: enetc: add PSI-to-VSI link status notification support for VF
:::::: branch date: 2 days ago
:::::: commit date: 12 days ago
config: sparc-randconfig-r2107-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271940.Ov227ysy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609271940.Ov227ysy-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/freescale/enetc/enetc_vf.c:575:7-15: opportunity for str_on_off(tx_pause)

vim +575 drivers/net/ethernet/freescale/enetc/enetc_vf.c

36a16ed591b356 Wei Fang 2026-09-09  548
36a16ed591b356 Wei Fang 2026-09-09  549  static void enetc_vf_msg_handle_link_status(struct enetc_si *si, u8 status)
36a16ed591b356 Wei Fang 2026-09-09  550  {
36a16ed591b356 Wei Fang 2026-09-09  551  	bool tx_pause = !!(status & ENETC_CLASS_CODE_TX_PAUSE_EN);
36a16ed591b356 Wei Fang 2026-09-09  552  	bool link_down = !!(status & ENETC_CLASS_CODE_LINK_DOWN);
36a16ed591b356 Wei Fang 2026-09-09  553  	struct enetc_ndev_priv *priv = netdev_priv(si->ndev);
36a16ed591b356 Wei Fang 2026-09-09  554  	struct net_device *ndev = si->ndev;
36a16ed591b356 Wei Fang 2026-09-09  555
36a16ed591b356 Wei Fang 2026-09-09  556  	rtnl_lock();
36a16ed591b356 Wei Fang 2026-09-09  557  	if (!netif_running(ndev))
36a16ed591b356 Wei Fang 2026-09-09  558  		goto unlock_rtnl;
36a16ed591b356 Wei Fang 2026-09-09  559
36a16ed591b356 Wei Fang 2026-09-09  560  	if (link_down) {
36a16ed591b356 Wei Fang 2026-09-09  561  		if (netif_carrier_ok(ndev)) {
36a16ed591b356 Wei Fang 2026-09-09  562  			netif_carrier_off(ndev);
36a16ed591b356 Wei Fang 2026-09-09  563  			netdev_info(ndev, "Link is Down\n");
36a16ed591b356 Wei Fang 2026-09-09  564  		}
36a16ed591b356 Wei Fang 2026-09-09  565
36a16ed591b356 Wei Fang 2026-09-09  566  		goto unlock_rtnl;
36a16ed591b356 Wei Fang 2026-09-09  567  	}
36a16ed591b356 Wei Fang 2026-09-09  568
36a16ed591b356 Wei Fang 2026-09-09  569  	/* Link is up */
36a16ed591b356 Wei Fang 2026-09-09  570  	enetc_set_congestion_mode(priv, tx_pause);
36a16ed591b356 Wei Fang 2026-09-09  571
36a16ed591b356 Wei Fang 2026-09-09  572  	if (!netif_carrier_ok(ndev)) {
36a16ed591b356 Wei Fang 2026-09-09  573  		netif_carrier_on(ndev);
36a16ed591b356 Wei Fang 2026-09-09  574  		netdev_info(ndev, "Link is Up, tx pause %s\n",
36a16ed591b356 Wei Fang 2026-09-09 @575  			    tx_pause ? "on" : "off");
36a16ed591b356 Wei Fang 2026-09-09  576  	}
36a16ed591b356 Wei Fang 2026-09-09  577
36a16ed591b356 Wei Fang 2026-09-09  578  unlock_rtnl:
36a16ed591b356 Wei Fang 2026-09-09  579  	rtnl_unlock();
36a16ed591b356 Wei Fang 2026-09-09  580  }
36a16ed591b356 Wei Fang 2026-09-09  581

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
