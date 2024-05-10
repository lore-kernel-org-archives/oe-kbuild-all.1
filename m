Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB4617C98
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 18:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715364750; cv=none; b=fDL/v3NF+sSeJtHdBs7cFeK5Z3QWaj57s37p5Ln4DTZMs3ofa+LJwW2zuxKKZOm+MdOrLc1vrRXgEkmRd1r5B1tq+7X0H/4/BbrVV3lo915OsdzDHaxgw06QX36ZXpbGcyVAUt8FuKY2aeAd+hjUHCF/2LOosMuwaMEmAoZWgRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715364750; c=relaxed/simple;
	bh=jMoluFo0BAP2EtpQnSVBGVOc92tNPhrLOVscDxsXyKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p61Qbk1hVDgUouD6g1Ae3bt6aBHXNpIB+Yk511nzon8nzHKTNYoK6rlyoCep6HkR9GRjFfgfCF9MlskAsKlI/08KdUyhNbOV3k3TzwVlxg6mAwXKx6UXczE8DyPyHVJBSWlUYEIp1wyzigw7OAPJUGS61iEyrQzCgsEb6Nvm4As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hrKOtJxe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hrKOtJxe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715364748; x=1746900748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jMoluFo0BAP2EtpQnSVBGVOc92tNPhrLOVscDxsXyKU=;
  b=hrKOtJxepbxTiRWn5+NZtrBFMuwB8j64tO+NoPLMD8gQwIyS/xMO3RBG
   HUA9pZ0KvK79bpQ5M7Rozy6WH2fdYJhOtj+Z4Q4X4fZ/nhj1nyd39GqgK
   rFc8pOHrVPmGIryi23RYh/JDCwPLLRXWdjlSWS1uoWsei+V9rjsI5pC9p
   JfyyI2rOYMI5uORyZ8O+MjwbiU5vblMHqYiv1Vr/kfz7GfVRfiQcegEGv
   e/E8GHZvWODjY33vsA1rBRGtMDi9xnT+zvIURJBFbOspNvRZn/BGU/3W9
   q/VT8EUED4+R/DEjcORMDd9RHzNPRdPX4AKvDarumbO9o6572gvWwdBaz
   Q==;
X-CSE-ConnectionGUID: J4E5swXkQpWFDIeB2Z+Ing==
X-CSE-MsgGUID: TYdLNQGjQ8ODrjTMJ6aeOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11189955"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11189955"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 11:12:27 -0700
X-CSE-ConnectionGUID: crRh6AOtRYSz5xfVLGF47w==
X-CSE-MsgGUID: A5MAWgQYR5KZacpBEMe3sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="34227484"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 May 2024 11:12:26 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5UjI-0006Sf-0l;
	Fri, 10 May 2024 18:12:24 +0000
Date: Sat, 11 May 2024 02:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18554/22398]
 drivers/net/ethernet/netswift/ngbe/ngbe_main.o: warning: objtool: missing
 symbol for section .init.text
Message-ID: <202405110244.yz4AxkCm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a786a35ec1aeb84a5ff258956854c2eaebec12b7
commit: 206f9c11a8c8b0197da5a26859d96d2ed65f5757 [18554/22398] net: ngbe: Add Netswift Giga NIC driver
config: x86_64-buildonly-randconfig-004-20240510 (https://download.01.org/0day-ci/archive/20240511/202405110244.yz4AxkCm-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110244.yz4AxkCm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405110244.yz4AxkCm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/netswift/ngbe/ngbe_main.c:38:
   drivers/net/ethernet/netswift/ngbe/ngbe.h:764:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     764 |         u32 cur_diff = 0;
         |             ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:170:6: warning: no previous prototype for function 'ngbe_service_event_schedule' [-Wmissing-prototypes]
     170 | void ngbe_service_event_schedule(struct ngbe_adapter *adapter)
         |      ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:170:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     170 | void ngbe_service_event_schedule(struct ngbe_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:433:7: warning: variable 'real_tx_hang' set but not used [-Wunused-but-set-variable]
     433 |         bool real_tx_hang = false;
         |              ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3223:6: warning: no previous prototype for function 'ngbe_configure_isb' [-Wmissing-prototypes]
    3223 | void ngbe_configure_isb(struct ngbe_adapter *adapter)
         |      ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3223:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3223 | void ngbe_configure_isb(struct ngbe_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3233:6: warning: no previous prototype for function 'ngbe_configure_port' [-Wmissing-prototypes]
    3233 | void ngbe_configure_port(struct ngbe_adapter *adapter)
         |      ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3233:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3233 | void ngbe_configure_port(struct ngbe_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3592:6: warning: no previous prototype for function 'ngbe_disable_device' [-Wmissing-prototypes]
    3592 | void ngbe_disable_device(struct ngbe_adapter *adapter)
         |      ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3592:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3592 | void ngbe_disable_device(struct ngbe_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3693:5: warning: no previous prototype for function 'ngbe_init_shared_code' [-Wmissing-prototypes]
    3693 | s32 ngbe_init_shared_code(struct ngbe_hw *hw)
         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3693:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3693 | s32 ngbe_init_shared_code(struct ngbe_hw *hw)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5810:5: warning: no previous prototype for function 'ngbe_skb_pad_nonzero' [-Wmissing-prototypes]
    5810 | int ngbe_skb_pad_nonzero(struct sk_buff *skb, int pad)
         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5810:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5810 | int ngbe_skb_pad_nonzero(struct sk_buff *skb, int pad)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6010:6: warning: variable 'prtad' set but not used [-Wunused-but-set-variable]
    6010 |         int prtad, devad, ret = 0;
         |             ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6010:13: warning: variable 'devad' set but not used [-Wunused-but-set-variable]
    6010 |         int prtad, devad, ret = 0;
         |                    ^
   10 warnings generated.
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:257: warning: Function parameter or member 'quiet' not described in 'ngbe_read_reg'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:1644: warning: Function parameter or member 'queues' not described in 'ngbe_irq_enable'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:1644: warning: Function parameter or member 'flush' not described in 'ngbe_irq_enable'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2035: warning: Function parameter or member 'adapter' not described in 'ngbe_configure_msi_and_legacy'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2449: warning: Function parameter or member 'adapter' not described in 'ngbe_configure_bridge_mode'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2913: warning: Function parameter or member 'pool' not described in 'ngbe_write_uc_addr_list'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3722: warning: cannot understand function prototype: 'const u32 def_rss_key[10] = '
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4583: warning: Function parameter or member 'adapter' not described in 'ngbe_check_hang_subtask'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4648: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_update_link_status'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4744: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_link_is_up'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4789: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_link_is_down'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4856: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_flush_tx'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4928: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_subtask'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4957: warning: Function parameter or member 't' not described in 'ngbe_service_timer'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4957: warning: Excess function parameter 'data' description in 'ngbe_service_timer'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6043: warning: Function parameter or member 'dev' not described in 'ngbe_setup_tc'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6043: warning: Excess function parameter 'netdev' description in 'ngbe_setup_tc'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6297: warning: Excess function parameter 'device_id' description in 'ngbe_wol_supported'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6297: warning: Excess function parameter 'subdev_id' description in 'ngbe_wol_supported'
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
