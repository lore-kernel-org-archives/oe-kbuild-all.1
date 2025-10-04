Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AEE175BF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Oct 2025 06:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759557886; cv=none; b=X/2Y68MCHnf0Sq/SRqMVydcNc758geVfnJS915AI2dbN3kmN/KK7iY0da7LohVzDZnvobUeZtYTlblzXXX5Ww0qLtVPjN/oRJxRKnLIkNciFRlMIM1J0cVS3m938G2AISOzq4IpagVYpMircoMAr+HhJuz2JOrCFYfEYd0NJ5Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759557886; c=relaxed/simple;
	bh=vkeJJ7YKg7/IC+5297re7ILPA04DsaKGaSjSmaYwMSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vGrXXAdCxVS1oqr1vrU6f9TdjYWC0RJExqrQ95/rhIDKxJGPwrNIDw6mOmwWYs38vJ5Fu3DW9EYQt70pwbsga/WMqbfuIpw7OqsTIK6ih/g1Gl1o7VvUr3+3aEAqv491O12L+J4+KsYiNmREoo90B/c3h3F2IO7U1XWDCx3/Nrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8b/f3FK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8b/f3FK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759557885; x=1791093885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vkeJJ7YKg7/IC+5297re7ILPA04DsaKGaSjSmaYwMSU=;
  b=f8b/f3FKnRQ7ASha8C0Ph122EeS9izUqMcMsGbZSZ03Oq9Oqs/NPoNn5
   g7sGUmIVu0i4sWKmyBb6SbBhi+xd0STNRAR4hDzuF1Q1OeKnvyeMuSBjY
   BdUHMIxWTbWYkPpBNrVfsghZXn53MW4AfSvT6Hwz3rDxFMcuM7ZODA9+Q
   b7iSr3ITuUfCkUJgTH9wt2oa+yKs9s53FsAeN/N8+cAYUN73TEfMKD7rR
   LrEZQ9EjgVlzNYfExXk1ATlLQA1lT/xtM2kUXXYnhLKv8FrtUtiJ2AP8o
   7UaYV4ilTxuxgF87C00oPVlqc6zBAJX6t62tSFb1GxIv1JSH3ee42ySk1
   w==;
X-CSE-ConnectionGUID: ezOpuNtvTLG19xv0N6usnw==
X-CSE-MsgGUID: G/DlWe5tRBGnTYODPm7JXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="64447529"
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="64447529"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 23:04:44 -0700
X-CSE-ConnectionGUID: ZT8lhu68Q06OZVVrpmV9/A==
X-CSE-MsgGUID: JYhbnpL1QzmXMqovbmoyKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="179881948"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Oct 2025 23:04:42 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4vNn-00056h-21;
	Sat, 04 Oct 2025 06:04:39 +0000
Date: Sat, 4 Oct 2025 14:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: Martyna Szapar-Mudlaw <martyna.szapar-mudlaw@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Simon Horman <horms@kernel.org>
Subject: [tnguy-net-queue:dev-queue 2/17]
 drivers/net/ethernet/intel/ice/ice_main.c:5120:19: error: 'struct ice_hw'
 has no member named 'fwlog_cfg'
Message-ID: <202510041304.yOU8z8P5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git dev-queue
head:   e50b34f0f3fb86c9be2f9ad3b7ed483f18b46896
commit: 1f7e7f027658aba172437f3a0451ca7a30bf268e [2/17] ice: fix fwlog after driver reinit
config: x86_64-buildonly-randconfig-005-20251004 (https://download.01.org/0day-ci/archive/20251004/202510041304.yOU8z8P5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251004/202510041304.yOU8z8P5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510041304.yOU8z8P5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_main.c: In function 'ice_load':
>> drivers/net/ethernet/intel/ice/ice_main.c:5120:19: error: 'struct ice_hw' has no member named 'fwlog_cfg'
    5120 |         if (pf->hw.fwlog_cfg.options & ICE_FWLOG_OPTION_IS_REGISTERED) {
         |                   ^
>> drivers/net/ethernet/intel/ice/ice_main.c:5120:40: error: 'ICE_FWLOG_OPTION_IS_REGISTERED' undeclared (first use in this function); did you mean 'LIBIE_FWLOG_OPTION_IS_REGISTERED'?
    5120 |         if (pf->hw.fwlog_cfg.options & ICE_FWLOG_OPTION_IS_REGISTERED) {
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                        LIBIE_FWLOG_OPTION_IS_REGISTERED
   drivers/net/ethernet/intel/ice/ice_main.c:5120:40: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/ethernet/intel/ice/ice_main.c:5121:23: error: implicit declaration of function 'ice_fwlog_register'; did you mean 'libie_fwlog_reregister'? [-Wimplicit-function-declaration]
    5121 |                 err = ice_fwlog_register(&pf->hw);
         |                       ^~~~~~~~~~~~~~~~~~
         |                       libie_fwlog_reregister
   drivers/net/ethernet/intel/ice/ice_main.c:5123:31: error: 'struct ice_hw' has no member named 'fwlog_cfg'
    5123 |                         pf->hw.fwlog_cfg.options &=
         |                               ^
   drivers/net/ethernet/intel/ice/ice_main.c: In function 'ice_rebuild':
   drivers/net/ethernet/intel/ice/ice_main.c:7687:15: error: 'struct ice_hw' has no member named 'fwlog_cfg'
    7687 |         if (hw->fwlog_cfg.options & ICE_FWLOG_OPTION_IS_REGISTERED) {
         |               ^~
   drivers/net/ethernet/intel/ice/ice_main.c:7687:37: error: 'ICE_FWLOG_OPTION_IS_REGISTERED' undeclared (first use in this function); did you mean 'LIBIE_FWLOG_OPTION_IS_REGISTERED'?
    7687 |         if (hw->fwlog_cfg.options & ICE_FWLOG_OPTION_IS_REGISTERED) {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     LIBIE_FWLOG_OPTION_IS_REGISTERED
   drivers/net/ethernet/intel/ice/ice_main.c:7690:27: error: 'struct ice_hw' has no member named 'fwlog_cfg'
    7690 |                         hw->fwlog_cfg.options &=
         |                           ^~


vim +5120 drivers/net/ethernet/intel/ice/ice_main.c

  5106	
  5107	/**
  5108	 * ice_load - load pf by init hw and starting VSI
  5109	 * @pf: pointer to the pf instance
  5110	 *
  5111	 * This function has to be called under devl_lock.
  5112	 */
  5113	int ice_load(struct ice_pf *pf)
  5114	{
  5115		struct ice_vsi *vsi;
  5116		int err;
  5117	
  5118		devl_assert_locked(priv_to_devlink(pf));
  5119	
> 5120		if (pf->hw.fwlog_cfg.options & ICE_FWLOG_OPTION_IS_REGISTERED) {
> 5121			err = ice_fwlog_register(&pf->hw);
  5122			if (err)
  5123				pf->hw.fwlog_cfg.options &=
  5124					~ICE_FWLOG_OPTION_IS_REGISTERED;
  5125		}
  5126	
  5127		vsi = ice_get_main_vsi(pf);
  5128	
  5129		/* init channel list */
  5130		INIT_LIST_HEAD(&vsi->ch_list);
  5131	
  5132		err = ice_cfg_netdev(vsi);
  5133		if (err)
  5134			return err;
  5135	
  5136		/* Setup DCB netlink interface */
  5137		ice_dcbnl_setup(vsi);
  5138	
  5139		err = ice_init_mac_fltr(pf);
  5140		if (err)
  5141			goto err_init_mac_fltr;
  5142	
  5143		err = ice_devlink_create_pf_port(pf);
  5144		if (err)
  5145			goto err_devlink_create_pf_port;
  5146	
  5147		SET_NETDEV_DEVLINK_PORT(vsi->netdev, &pf->devlink_port);
  5148	
  5149		err = ice_register_netdev(vsi);
  5150		if (err)
  5151			goto err_register_netdev;
  5152	
  5153		err = ice_tc_indir_block_register(vsi);
  5154		if (err)
  5155			goto err_tc_indir_block_register;
  5156	
  5157		ice_napi_add(vsi);
  5158	
  5159		ice_init_features(pf);
  5160	
  5161		err = ice_init_rdma(pf);
  5162		if (err)
  5163			goto err_init_rdma;
  5164	
  5165		ice_service_task_restart(pf);
  5166	
  5167		clear_bit(ICE_DOWN, pf->state);
  5168	
  5169		return 0;
  5170	
  5171	err_init_rdma:
  5172		ice_deinit_features(pf);
  5173		ice_tc_indir_block_unregister(vsi);
  5174	err_tc_indir_block_register:
  5175		ice_unregister_netdev(vsi);
  5176	err_register_netdev:
  5177		ice_devlink_destroy_pf_port(pf);
  5178	err_devlink_create_pf_port:
  5179	err_init_mac_fltr:
  5180		ice_decfg_netdev(vsi);
  5181		return err;
  5182	}
  5183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
