Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25EF1DB377
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 05:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761542177; cv=none; b=KbfJ5Eqys+V6OcSoLTR+ojFsu2gHharWHkUVZg0BukvKUPMbOxmgnxTehtEM/aLEFn6ncZ3bfPNT9TOAAGK+3Eb0abLv/lQCurlLG5caWB6WdvDF2255b2ItzJYfcggFTOSQrYD1hM+rvYqLBEWdJptPqP/YRJCigF0Z38vChdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761542177; c=relaxed/simple;
	bh=yqJxZmB1nTL4N8FUg6ErxFYmegBlqXvEfYcUDrmgF9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b07p6dJ+fN22gZt+WblAiUe2Uk69jDi56t4cefSdqu+sfYGZeE5ezaYdWoJ2+qMf7KKI2DtE00Tw4xO8Fd6GnrE90PpG9aCwhVGaMVSlIWuV01n379IcFXe+w79CzL2nBlcVcg5wB+4KkMSEmMPPivXn4VprZ+sk9gaIiRo9GdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4UiPQeg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4UiPQeg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761542174; x=1793078174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yqJxZmB1nTL4N8FUg6ErxFYmegBlqXvEfYcUDrmgF9Q=;
  b=j4UiPQegRjopPRStINw+1+b9iYTLI4j0c5TMgdkj3THLxN5nfq5540zS
   CMi3/NceTcs67ycAN3mp1hVyTccr0+tHliQU9qNZacWIks07uLGiaOusS
   KyrkccKYlcJgxQ4NYF65UbXPILMl3G5tKhdE2g3o34OTOkktT0Ncc3D60
   dN6O775xsVUw68SgsRVdJUJm3QnQuCfH0pU9c6yUCDLm4GqW9CERdT6L9
   Zqo9YAbLf19N56pyX3ytOy8kcQj2dk9aBiqvNxg1+VADMO5Z6unWX7U5D
   Yb+zUfFO+hDdcjrdIdcleWwrGxV/iWBBJ/KaW2doTNDHkxNZHNq+wrra/
   g==;
X-CSE-ConnectionGUID: EUlsC18dSN6wn63wp8FlfA==
X-CSE-MsgGUID: XjIsrC4IRVKQmrxIY2WJ0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67447688"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67447688"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 22:16:14 -0700
X-CSE-ConnectionGUID: u3bSScSrQCC9YckSQKYrKA==
X-CSE-MsgGUID: 5lO2GMgXSwaKPJ6Wu0wegA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="185302196"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 26 Oct 2025 22:16:13 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDFaI-000GWj-24;
	Mon, 27 Oct 2025 05:16:02 +0000
Date: Mon, 27 Oct 2025 13:15:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3045/3045]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.h:285:24: error:
 array type has incomplete element type 'struct dcb_app'
Message-ID: <202510271304.QdT93JQS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9094437bec1ace7378abfe84597e722209d03f85
commit: 468b0cd7b1e1c131b3ee7d2ea8b96521d3faad8b [3045/3045] net:nebula-matrix:Add S1000 SNIC driver support
config: x86_64-buildonly-randconfig-006-20251027 (https://download.01.org/0day-ci/archive/20251027/202510271304.QdT93JQS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271304.QdT93JQS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510271304.QdT93JQS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:15,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.h:10,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_hwmon.h:10,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_hwmon.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:348:62: warning: 'struct ieee_ets' declared inside parameter list will not be visible outside of this definition or declaration
     348 |         int (*ieee_setets)(struct net_device *netdev, struct ieee_ets *ets);
         |                                                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:349:62: warning: 'struct ieee_ets' declared inside parameter list will not be visible outside of this definition or declaration
     349 |         int (*ieee_getets)(struct net_device *netdev, struct ieee_ets *ets);
         |                                                              ^~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:350:62: warning: 'struct ieee_pfc' declared inside parameter list will not be visible outside of this definition or declaration
     350 |         int (*ieee_setpfc)(struct net_device *netdev, struct ieee_pfc *pfc);
         |                                                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:351:62: warning: 'struct ieee_pfc' declared inside parameter list will not be visible outside of this definition or declaration
     351 |         int (*ieee_getpfc)(struct net_device *netdev, struct ieee_pfc *pfc);
         |                                                              ^~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:352:62: warning: 'struct dcb_app' declared inside parameter list will not be visible outside of this definition or declaration
     352 |         int (*ieee_setapp)(struct net_device *netdev, struct dcb_app *app);
         |                                                              ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:353:62: warning: 'struct dcb_app' declared inside parameter list will not be visible outside of this definition or declaration
     353 |         int (*ieee_delapp)(struct net_device *netdev, struct dcb_app *app);
         |                                                              ^~~~~~~
--
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:15,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.h:12,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ipsec.h:14,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ipsec.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:348:62: warning: 'struct ieee_ets' declared inside parameter list will not be visible outside of this definition or declaration
     348 |         int (*ieee_setets)(struct net_device *netdev, struct ieee_ets *ets);
         |                                                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:349:62: warning: 'struct ieee_ets' declared inside parameter list will not be visible outside of this definition or declaration
     349 |         int (*ieee_getets)(struct net_device *netdev, struct ieee_ets *ets);
         |                                                              ^~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:350:62: warning: 'struct ieee_pfc' declared inside parameter list will not be visible outside of this definition or declaration
     350 |         int (*ieee_setpfc)(struct net_device *netdev, struct ieee_pfc *pfc);
         |                                                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:351:62: warning: 'struct ieee_pfc' declared inside parameter list will not be visible outside of this definition or declaration
     351 |         int (*ieee_getpfc)(struct net_device *netdev, struct ieee_pfc *pfc);
         |                                                              ^~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:352:62: warning: 'struct dcb_app' declared inside parameter list will not be visible outside of this definition or declaration
     352 |         int (*ieee_setapp)(struct net_device *netdev, struct dcb_app *app);
         |                                                              ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:353:62: warning: 'struct dcb_app' declared inside parameter list will not be visible outside of this definition or declaration
     353 |         int (*ieee_delapp)(struct net_device *netdev, struct dcb_app *app);
         |                                                              ^~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.h:285:24: error: array type has incomplete element type 'struct dcb_app'
     285 |         struct dcb_app app[NBL_DSCP_MAX];
         |                        ^~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.h:287:25: error: field 'ets' has incomplete type
     287 |         struct ieee_ets ets;
         |                         ^~~
--
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:15,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_resource.h:10,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.h:10,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:348:62: warning: 'struct ieee_ets' declared inside parameter list will not be visible outside of this definition or declaration
     348 |         int (*ieee_setets)(struct net_device *netdev, struct ieee_ets *ets);
         |                                                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:349:62: warning: 'struct ieee_ets' declared inside parameter list will not be visible outside of this definition or declaration
     349 |         int (*ieee_getets)(struct net_device *netdev, struct ieee_ets *ets);
         |                                                              ^~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:350:62: warning: 'struct ieee_pfc' declared inside parameter list will not be visible outside of this definition or declaration
     350 |         int (*ieee_setpfc)(struct net_device *netdev, struct ieee_pfc *pfc);
         |                                                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:351:62: warning: 'struct ieee_pfc' declared inside parameter list will not be visible outside of this definition or declaration
     351 |         int (*ieee_getpfc)(struct net_device *netdev, struct ieee_pfc *pfc);
         |                                                              ^~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:352:62: warning: 'struct dcb_app' declared inside parameter list will not be visible outside of this definition or declaration
     352 |         int (*ieee_setapp)(struct net_device *netdev, struct dcb_app *app);
         |                                                              ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:353:62: warning: 'struct dcb_app' declared inside parameter list will not be visible outside of this definition or declaration
     353 |         int (*ieee_delapp)(struct net_device *netdev, struct dcb_app *app);
         |                                                              ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c: In function 'nbl_res_txrx_xmit_xdp_ring':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1310:30: warning: variable 'eth' set but not used [-Wunused-but-set-variable]
    1310 |         const struct ethhdr *eth;
         |                              ^~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c: In function 'nbl_res_txrx_restore_abnormal_ring':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:3499:32: warning: variable 'vector' set but not used [-Wunused-but-set-variable]
    3499 |         struct nbl_res_vector *vector =  NULL;
         |                                ^~~~~~
--
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:15,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_resource.h:10,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fc.h:10,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fc.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:348:62: warning: 'struct ieee_ets' declared inside parameter list will not be visible outside of this definition or declaration
     348 |         int (*ieee_setets)(struct net_device *netdev, struct ieee_ets *ets);
         |                                                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:349:62: warning: 'struct ieee_ets' declared inside parameter list will not be visible outside of this definition or declaration
     349 |         int (*ieee_getets)(struct net_device *netdev, struct ieee_ets *ets);
         |                                                              ^~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:350:62: warning: 'struct ieee_pfc' declared inside parameter list will not be visible outside of this definition or declaration
     350 |         int (*ieee_setpfc)(struct net_device *netdev, struct ieee_pfc *pfc);
         |                                                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:351:62: warning: 'struct ieee_pfc' declared inside parameter list will not be visible outside of this definition or declaration
     351 |         int (*ieee_getpfc)(struct net_device *netdev, struct ieee_pfc *pfc);
         |                                                              ^~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:352:62: warning: 'struct dcb_app' declared inside parameter list will not be visible outside of this definition or declaration
     352 |         int (*ieee_setapp)(struct net_device *netdev, struct dcb_app *app);
         |                                                              ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:353:62: warning: 'struct dcb_app' declared inside parameter list will not be visible outside of this definition or declaration
     353 |         int (*ieee_delapp)(struct net_device *netdev, struct dcb_app *app);
         |                                                              ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fc.c: In function 'nbl_fc_del_stats':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fc.c:303:27: warning: variable 'counter_list' set but not used [-Wunused-but-set-variable]
     303 |         struct list_head *counter_list;
         |                           ^~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:15,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.h:10,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:348:62: warning: 'struct ieee_ets' declared inside parameter list will not be visible outside of this definition or declaration
     348 |         int (*ieee_setets)(struct net_device *netdev, struct ieee_ets *ets);
         |                                                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:349:62: warning: 'struct ieee_ets' declared inside parameter list will not be visible outside of this definition or declaration
     349 |         int (*ieee_getets)(struct net_device *netdev, struct ieee_ets *ets);
         |                                                              ^~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:350:62: warning: 'struct ieee_pfc' declared inside parameter list will not be visible outside of this definition or declaration
     350 |         int (*ieee_setpfc)(struct net_device *netdev, struct ieee_pfc *pfc);
         |                                                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:351:62: warning: 'struct ieee_pfc' declared inside parameter list will not be visible outside of this definition or declaration
     351 |         int (*ieee_getpfc)(struct net_device *netdev, struct ieee_pfc *pfc);
         |                                                              ^~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:352:62: warning: 'struct dcb_app' declared inside parameter list will not be visible outside of this definition or declaration
     352 |         int (*ieee_setapp)(struct net_device *netdev, struct dcb_app *app);
         |                                                              ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:353:62: warning: 'struct dcb_app' declared inside parameter list will not be visible outside of this definition or declaration
     353 |         int (*ieee_delapp)(struct net_device *netdev, struct dcb_app *app);
         |                                                              ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c: In function 'nbl_disp_chan_get_pause_stats_resp':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2842:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    2842 |         int err = NBL_CHAN_RESP_OK;
         |             ^~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c: In function 'nbl_disp_chan_get_eth_ctrl_stats_resp':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2957:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    2957 |         int err = NBL_CHAN_RESP_OK;
         |             ^~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c: In function 'nbl_disp_chan_get_eth_mac_stats_resp':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:3013:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    3013 |         int err = NBL_CHAN_RESP_OK;
         |             ^~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c: In function 'nbl_disp_chan_get_rmon_stats_resp':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:3069:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    3069 |         int err = NBL_CHAN_RESP_OK;
         |             ^~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c: In function 'nbl_disp_chan_destroy_msix_map_resp':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:3554:45: warning: variable 'param' set but not used [-Wunused-but-set-variable]
    3554 |         struct nbl_chan_param_cfg_msix_map *param;
         |                                             ^~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c: In function 'nbl_disp_chan_set_intr_suppress_level_resp':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:7888:33: warning: variable 'chan_ops' set but not used [-Wunused-but-set-variable]
    7888 |         struct nbl_channel_ops *chan_ops;
         |                                 ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c: In function 'nbl_disp_chan_del_nd_upcall_flow_resp':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:8102:33: warning: variable 'common' set but not used [-Wunused-but-set-variable]
    8102 |         struct nbl_common_info *common;
         |                                 ^~~~~~
--
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:15,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.h:10,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:10:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:348:62: warning: 'struct ieee_ets' declared inside parameter list will not be visible outside of this definition or declaration
     348 |         int (*ieee_setets)(struct net_device *netdev, struct ieee_ets *ets);
         |                                                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:349:62: warning: 'struct ieee_ets' declared inside parameter list will not be visible outside of this definition or declaration
     349 |         int (*ieee_getets)(struct net_device *netdev, struct ieee_ets *ets);
         |                                                              ^~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:350:62: warning: 'struct ieee_pfc' declared inside parameter list will not be visible outside of this definition or declaration
     350 |         int (*ieee_setpfc)(struct net_device *netdev, struct ieee_pfc *pfc);
         |                                                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:351:62: warning: 'struct ieee_pfc' declared inside parameter list will not be visible outside of this definition or declaration
     351 |         int (*ieee_getpfc)(struct net_device *netdev, struct ieee_pfc *pfc);
         |                                                              ^~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:352:62: warning: 'struct dcb_app' declared inside parameter list will not be visible outside of this definition or declaration
     352 |         int (*ieee_setapp)(struct net_device *netdev, struct dcb_app *app);
         |                                                              ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:353:62: warning: 'struct dcb_app' declared inside parameter list will not be visible outside of this definition or declaration
     353 |         int (*ieee_delapp)(struct net_device *netdev, struct dcb_app *app);
         |                                                              ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: In function 'nbl_dev_prepare_reset_task':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:896:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     896 |         int ret;
         |             ^~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: At top level:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3084:66: warning: 'struct ieee_ets' declared inside parameter list will not be visible outside of this definition or declaration
    3084 | static int nbl_dev_ieee_setets(struct net_device *netdev, struct ieee_ets *ets)
         |                                                                  ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: In function 'nbl_dev_ieee_setets':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3090:46: error: passing argument 2 of 'serv_ops->ieee_setets' from incompatible pointer type [-Wincompatible-pointer-types]
    3090 |         return serv_ops->ieee_setets(netdev, ets);
         |                                              ^~~
         |                                              |
         |                                              struct ieee_ets *
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3090:46: note: expected 'struct ieee_ets *' but argument is of type 'struct ieee_ets *'
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: At top level:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3093:66: warning: 'struct ieee_ets' declared inside parameter list will not be visible outside of this definition or declaration
    3093 | static int nbl_dev_ieee_getets(struct net_device *netdev, struct ieee_ets *ets)
         |                                                                  ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: In function 'nbl_dev_ieee_getets':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3099:46: error: passing argument 2 of 'serv_ops->ieee_getets' from incompatible pointer type [-Wincompatible-pointer-types]
    3099 |         return serv_ops->ieee_getets(netdev, ets);
         |                                              ^~~
         |                                              |
         |                                              struct ieee_ets *
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3099:46: note: expected 'struct ieee_ets *' but argument is of type 'struct ieee_ets *'
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: At top level:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3102:66: warning: 'struct ieee_pfc' declared inside parameter list will not be visible outside of this definition or declaration
    3102 | static int nbl_dev_ieee_setpfc(struct net_device *netdev, struct ieee_pfc *pfc)
         |                                                                  ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: In function 'nbl_dev_ieee_setpfc':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3108:46: error: passing argument 2 of 'serv_ops->ieee_setpfc' from incompatible pointer type [-Wincompatible-pointer-types]
    3108 |         return serv_ops->ieee_setpfc(netdev, pfc);
         |                                              ^~~
         |                                              |
         |                                              struct ieee_pfc *
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3108:46: note: expected 'struct ieee_pfc *' but argument is of type 'struct ieee_pfc *'
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: At top level:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3111:66: warning: 'struct ieee_pfc' declared inside parameter list will not be visible outside of this definition or declaration
    3111 | static int nbl_dev_ieee_getpfc(struct net_device *netdev, struct ieee_pfc *pfc)
         |                                                                  ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: In function 'nbl_dev_ieee_getpfc':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3117:46: error: passing argument 2 of 'serv_ops->ieee_getpfc' from incompatible pointer type [-Wincompatible-pointer-types]
    3117 |         return serv_ops->ieee_getpfc(netdev, pfc);
         |                                              ^~~
         |                                              |
         |                                              struct ieee_pfc *
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3117:46: note: expected 'struct ieee_pfc *' but argument is of type 'struct ieee_pfc *'
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: At top level:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3120:66: warning: 'struct dcb_app' declared inside parameter list will not be visible outside of this definition or declaration
    3120 | static int nbl_dev_ieee_setapp(struct net_device *netdev, struct dcb_app *app)
         |                                                                  ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: In function 'nbl_dev_ieee_setapp':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3126:46: error: passing argument 2 of 'serv_ops->ieee_setapp' from incompatible pointer type [-Wincompatible-pointer-types]
    3126 |         return serv_ops->ieee_setapp(netdev, app);
         |                                              ^~~
         |                                              |
         |                                              struct dcb_app *
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3126:46: note: expected 'struct dcb_app *' but argument is of type 'struct dcb_app *'
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: At top level:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3129:66: warning: 'struct dcb_app' declared inside parameter list will not be visible outside of this definition or declaration
    3129 | static int nbl_dev_ieee_delapp(struct net_device *netdev, struct dcb_app *app)
         |                                                                  ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: In function 'nbl_dev_ieee_delapp':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3135:46: error: passing argument 2 of 'serv_ops->ieee_delapp' from incompatible pointer type [-Wincompatible-pointer-types]
    3135 |         return serv_ops->ieee_delapp(netdev, app);
         |                                              ^~~
         |                                              |
         |                                              struct dcb_app *
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3135:46: note: expected 'struct dcb_app *' but argument is of type 'struct dcb_app *'
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: At top level:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3219:21: error: variable 'dcbnl_ops_leonis_pf' has initializer but incomplete type
    3219 | static const struct dcbnl_rtnl_ops dcbnl_ops_leonis_pf = {
         |                     ^~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3220:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'ieee_setets'
    3220 |         .ieee_setets = nbl_dev_ieee_setets,
         |          ^~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3220:24: warning: excess elements in struct initializer
    3220 |         .ieee_setets = nbl_dev_ieee_setets,
         |                        ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3220:24: note: (near initialization for 'dcbnl_ops_leonis_pf')
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3221:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'ieee_getets'
    3221 |         .ieee_getets = nbl_dev_ieee_getets,
         |          ^~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3221:24: warning: excess elements in struct initializer
    3221 |         .ieee_getets = nbl_dev_ieee_getets,
         |                        ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3221:24: note: (near initialization for 'dcbnl_ops_leonis_pf')
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3222:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'ieee_setpfc'
    3222 |         .ieee_setpfc = nbl_dev_ieee_setpfc,
         |          ^~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3222:24: warning: excess elements in struct initializer
    3222 |         .ieee_setpfc = nbl_dev_ieee_setpfc,
         |                        ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3222:24: note: (near initialization for 'dcbnl_ops_leonis_pf')
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3223:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'ieee_getpfc'
    3223 |         .ieee_getpfc = nbl_dev_ieee_getpfc,
         |          ^~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3223:24: warning: excess elements in struct initializer
    3223 |         .ieee_getpfc = nbl_dev_ieee_getpfc,
         |                        ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3223:24: note: (near initialization for 'dcbnl_ops_leonis_pf')
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3224:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'ieee_setapp'
    3224 |         .ieee_setapp = nbl_dev_ieee_setapp,
         |          ^~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3224:24: warning: excess elements in struct initializer
    3224 |         .ieee_setapp = nbl_dev_ieee_setapp,
         |                        ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3224:24: note: (near initialization for 'dcbnl_ops_leonis_pf')
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3225:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'ieee_delapp'
    3225 |         .ieee_delapp = nbl_dev_ieee_delapp,
         |          ^~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3225:24: warning: excess elements in struct initializer
    3225 |         .ieee_delapp = nbl_dev_ieee_delapp,
         |                        ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3225:24: note: (near initialization for 'dcbnl_ops_leonis_pf')
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3226:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'getdcbx'
    3226 |         .getdcbx = nbl_dev_getdcbx,
         |          ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3226:20: warning: excess elements in struct initializer
    3226 |         .getdcbx = nbl_dev_getdcbx,
         |                    ^~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3226:20: note: (near initialization for 'dcbnl_ops_leonis_pf')
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3227:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'setdcbx'
    3227 |         .setdcbx = nbl_dev_setdcbx,
         |          ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3227:20: warning: excess elements in struct initializer
    3227 |         .setdcbx = nbl_dev_setdcbx,
         |                    ^~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3227:20: note: (near initialization for 'dcbnl_ops_leonis_pf')
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3228:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'getnumtcs'
    3228 |         .getnumtcs = nbl_dev_getnumtcs,
         |          ^~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3228:22: warning: excess elements in struct initializer
    3228 |         .getnumtcs = nbl_dev_getnumtcs,
         |                      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3228:22: note: (near initialization for 'dcbnl_ops_leonis_pf')
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3229:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'setpfccfg'
    3229 |         .setpfccfg = nbl_dev_setpfccfg,
         |          ^~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3229:22: warning: excess elements in struct initializer
    3229 |         .setpfccfg = nbl_dev_setpfccfg,
         |                      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3229:22: note: (near initialization for 'dcbnl_ops_leonis_pf')
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3230:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'getpfccfg'
    3230 |         .getpfccfg = nbl_dev_getpfccfg,
         |          ^~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3230:22: warning: excess elements in struct initializer
    3230 |         .getpfccfg = nbl_dev_getpfccfg,
         |                      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3230:22: note: (near initialization for 'dcbnl_ops_leonis_pf')
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3231:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'getstate'
    3231 |         .getstate = nbl_dev_getstate,
         |          ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3231:21: warning: excess elements in struct initializer
    3231 |         .getstate = nbl_dev_getstate,
         |                     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3231:21: note: (near initialization for 'dcbnl_ops_leonis_pf')
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3232:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'setstate'
    3232 |         .setstate = nbl_dev_setstate,
         |          ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3232:21: warning: excess elements in struct initializer
    3232 |         .setstate = nbl_dev_setstate,
         |                     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3232:21: note: (near initialization for 'dcbnl_ops_leonis_pf')
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3233:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'getpfcstate'
    3233 |         .getpfcstate = nbl_dev_getpfcstate,
         |          ^~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3233:24: warning: excess elements in struct initializer
    3233 |         .getpfcstate = nbl_dev_getpfcstate,
         |                        ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3233:24: note: (near initialization for 'dcbnl_ops_leonis_pf')
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3234:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'getcap'
    3234 |         .getcap = nbl_dev_getcap,
         |          ^~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3234:19: warning: excess elements in struct initializer
    3234 |         .getcap = nbl_dev_getcap,
         |                   ^~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3234:19: note: (near initialization for 'dcbnl_ops_leonis_pf')
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: In function 'nbl_dev_setup_dcbnl_ops_leonis':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3243:23: error: 'struct net_device' has no member named 'dcbnl_ops'
    3243 |                 netdev->dcbnl_ops = &dcbnl_ops_leonis_pf;
         |                       ^~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: In function 'nbl_dev_remove_dcbnl_ops':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3249:15: error: 'struct net_device' has no member named 'dcbnl_ops'
    3249 |         netdev->dcbnl_ops = NULL;
         |               ^~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: At top level:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3219:36: error: storage size of 'dcbnl_ops_leonis_pf' isn't known
    3219 | static const struct dcbnl_rtnl_ops dcbnl_ops_leonis_pf = {
         |                                    ^~~~~~~~~~~~~~~~~~~
..


vim +285 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.h

   272	
   273	#define NBL_DCB_NO_HW_CHG	1
   274	#define NBL_DCB_HW_CHG		2
   275	struct nbl_serv_qos_info {
   276		u8 dcbx_mode;
   277		u8 dcbx_state;
   278		u8 trust_mode;		/* Trust Mode value 0:802.1p 1: dscp */
   279		u8 pfc[NBL_MAX_PFC_PRIORITIES];
   280		u8 dscp2prio_map[NBL_DSCP_MAX]; /* DSCP -> Priority map */
   281		int rdma_bw;
   282		u32 rdma_rate;
   283		u32 net_rate;
   284		DECLARE_BITMAP(dscp_mapped, NBL_DSCP_MAX);
 > 285		struct dcb_app app[NBL_DSCP_MAX];
   286		int buffer_sizes[NBL_MAX_PFC_PRIORITIES][2];
 > 287		struct ieee_ets ets;
   288	};
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
