Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AD78468
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 03:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714017225; cv=none; b=pYTAZgQHhwaoVPN+ALrsVtAQlSV1UI5WHktqUSyTAmoCCfhjtIeDPQWVZgFLnIs7uFBnecqORW9AsUBC2CIOSaheBZneNblX+iJ09jZIquoKqvIA4iRRR/hSZbWXZ8Jag7kVNZsY2CvJRxU6B8KIUNav6u5CCNz1N1o3lRbhgMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714017225; c=relaxed/simple;
	bh=25RXw/eo/CkuKA2H4imIlqbMC8wwPRgOfKy8n2ayxvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cNhOrVXXmMFJb4jN1t+cSm5iYCLgdS6aP4YmsFaDhEAL2dYn/NOZOdIZ4P7871Zm0RCShEB0T17k1ZHv3bQy/T3A6+3ItE/QAUvd8ieOCtxaMyNKCl3PZhOQGR1ynmLd3NkSk32eNQ5MvZsndMI829/jr7PqfnPVohsm4UzwaUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eoVysmOD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eoVysmOD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714017224; x=1745553224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=25RXw/eo/CkuKA2H4imIlqbMC8wwPRgOfKy8n2ayxvw=;
  b=eoVysmODoVP0mVLODq6Q46dFbHD8D+VLgC5elg7moPT+5ty8ENBQWBhT
   FahKarTYIvW5POSKMdUKSnCHrf5QaL1M9gjAxVJxGaJbP4kKaKsXtqfWz
   dRcWMVICUrNHhJYTma4dj6uliILEAI9R18Cb4Zp2W6qKyekPXkKmiQNZU
   c0wZbuOE5/8/UxivbyJ/0bdYJ04RgcfLjZkzeK09ZlZWiAMUOBjZ6CuXg
   kTVTmg+l/UZzACuJZ4Q9auTAxXEO5lWqipbW7KSOM9cITjpcfR2q24r43
   kW8CJwr1X1bsungDx9E/SmO0PmOsJr8AIPYgW2fUqagnzCKA7w6hov+4u
   w==;
X-CSE-ConnectionGUID: pX3Q8MSITiyYsQ6rBT8cJA==
X-CSE-MsgGUID: NXlaTVxdQw+wKlO0taGstw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9549614"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9549614"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 20:53:43 -0700
X-CSE-ConnectionGUID: knCEb6dOS3WY2qLnlKDR+w==
X-CSE-MsgGUID: H6trD3CaQ/qCjGE7O8bOkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="24807804"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Apr 2024 20:53:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzqB1-0001vI-0g;
	Thu, 25 Apr 2024 03:53:39 +0000
Date: Thu, 25 Apr 2024 11:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:pr/24 1/2] drivers/net/ethernet/intel/idpf/xdp.c:505:30:
 warning: unused variable 'adapter'
Message-ID: <202404251116.BtpS3T52-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux pr/24
head:   3490505e6cff970750961b02b0db545e76ef50a9
commit: 02c41469746e43eac042300335fdb7db2cf500a3 [1/2] idpf: handle xdp unloading while the driver is being removed
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240425/202404251116.BtpS3T52-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404251116.BtpS3T52-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404251116.BtpS3T52-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/idpf/xdp.c: In function 'idpf_xdp_setup_prog':
>> drivers/net/ethernet/intel/idpf/xdp.c:505:30: warning: unused variable 'adapter' [-Wunused-variable]
     505 |         struct idpf_adapter *adapter = np->adapter;
         |                              ^~~~~~~


vim +/adapter +505 drivers/net/ethernet/intel/idpf/xdp.c

   495	
   496	/**
   497	 * idpf_xdp_setup_prog - Add or remove XDP eBPF program
   498	 * @vport: vport to setup XDP for
   499	 * @xdp: XDP program and extack
   500	 */
   501	static int
   502	idpf_xdp_setup_prog(struct idpf_vport *vport, struct netdev_bpf *xdp)
   503	{
   504		struct idpf_netdev_priv *np = netdev_priv(vport->netdev);
 > 505		struct idpf_adapter *adapter = np->adapter;
   506		struct bpf_prog *prog = xdp->prog;
   507		struct xdp_attachment_info *info;
   508		bool needs_reconfig, vport_is_up;
   509		u16 idx = vport->idx;
   510		int err;
   511	
   512		vport_is_up = np->state == __IDPF_VPORT_UP;
   513	
   514		info = &vport->adapter->vport_config[idx]->user_config.xdp;
   515		needs_reconfig = !!info->prog != !!prog;
   516	
   517		if (vport->netdev->reg_state == NETREG_UNREGISTERING && !prog) {
   518			libeth_xdp_set_redirect(vport->netdev, prog);
   519			xdp_attachment_setup(info, xdp);
   520	
   521			return 0;
   522		}
   523	
   524		if (!needs_reconfig) {
   525			idpf_copy_xdp_prog_to_qs(vport, prog);
   526			xdp_attachment_setup(info, xdp);
   527	
   528			return 0;
   529		}
   530	
   531		if (!vport_is_up) {
   532			idpf_send_delete_queues_msg(vport);
   533		} else {
   534			set_bit(IDPF_VPORT_DEL_QUEUES, vport->flags);
   535			idpf_vport_stop(vport);
   536		}
   537	
   538		idpf_deinit_rss(vport);
   539		xdp_attachment_setup(info, xdp);
   540	
   541		err = idpf_xdp_reconfig_queues(vport);
   542		if (err) {
   543			NL_SET_ERR_MSG_MOD(xdp->extack,
   544					   "Could not reconfigure the queues after XDP setup");
   545			return err;
   546		}
   547	
   548		libeth_xdp_set_redirect(vport->netdev, prog);
   549	
   550		if (vport_is_up) {
   551			err = idpf_vport_open(vport, false);
   552			if (err) {
   553				NL_SET_ERR_MSG_MOD(xdp->extack,
   554						   "Could not reopen the vport after XDP setup");
   555				return err;
   556			}
   557		}
   558	
   559		return 0;
   560	}
   561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
