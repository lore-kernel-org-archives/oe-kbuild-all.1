Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ABE1F12F8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 06:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765779564; cv=none; b=B/SRw1DlRTJJXEFJScM56wC/lFxNEVeErBBTdfIdgxAu1MQH21uYBnvoMVXYYSb2FHP1/FwvqEMvW2DNLWdaSg8Un1xFnCpFVDBoYptwai21nEKMCSclQkDOYf+eN9oIQ68VzT1fTo3hdQ4A5qykbF+ORrRGkHxIdgn4mJJk6oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765779564; c=relaxed/simple;
	bh=+YA30lcuxgONSskRidOVeAhjmWLEiVPIc9HXHdycuak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rbnpDnb6CwilSNuDQ9HnGYIs5siN/kOwwrG/wqoy+3tlkDL92hsON9y8t+6VNFEDKFg/RTrWTHOoP46PikLFQDxTNguV0cNxh/nU2s9NUGFb2xLvX44w9Z8cwcy/sRl5CvXcZCewq9DRL9sz4H/XRHN2SShU3oUG8ylxgtlTlkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJvzpIuX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJvzpIuX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765779562; x=1797315562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+YA30lcuxgONSskRidOVeAhjmWLEiVPIc9HXHdycuak=;
  b=AJvzpIuX2tgUO5WlknYtn7DXFhB4zigchU1rcvYIPstmZRHljF19hIYE
   wwO95KfgM8AjWK1SluC7dOboF5GWEUq8YmbqWTf19gc1At4E3BYp4Tx2h
   F4wkKa0EicbNhO5KzYe937YSt5xQAR/3eALWQtob9Ov91zw0pAly6Bloh
   90avpCv8ZC0sgF89ZSsRKncG2hgjd60E6fTTKsOPmGBywibLBCsTBMmka
   JgaInNIyCDDdsIwB6aprbV47Nwt6aJjb9ZRIbAcQWtjeVW/kiIsa4xDJZ
   UlsvQ5XeomQHK/fYyK5cCgGxC+zyhI3U0PUn8L4gyboTSKk78VXA5OiPD
   w==;
X-CSE-ConnectionGUID: CTC+63hOSzO/VtDhkEzIiQ==
X-CSE-MsgGUID: 4rAl0oQfTFOm2bBiAiR+1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="55238851"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="55238851"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 22:19:17 -0800
X-CSE-ConnectionGUID: FkarutObSnaKvx3z5w3rXQ==
X-CSE-MsgGUID: fDWkqQs+TV+oTlIkzx+Wng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="235029205"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Dec 2025 22:19:17 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV1vN-000000009rr-3sZC;
	Mon, 15 Dec 2025 06:19:13 +0000
Date: Mon, 15 Dec 2025 14:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3542/3542]
 drivers/net/ethernet/huawei/hinic/hinic_mbox.c:373: warning: expecting
 prototype for hinic_unregister_ppf_mbox_cb(). Prototype was for
 hinic_unregister_pf_mbox_cb() instead
Message-ID: <202512151406.uDEczUki-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   81b22958142c03b02c766c79cd1554ebfa142be4
commit: 9c1c9598010fbb9daa1e2a67d23830092fb6246a [3542/3542] net/hinic: Update Huawei Intelligent Network Card Driver: hinic
config: x86_64-buildonly-randconfig-005-20251215 (https://download.01.org/0day-ci/archive/20251215/202512151406.uDEczUki-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151406.uDEczUki-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151406.uDEczUki-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/huawei/hinic/hinic_main.c:18:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/net/ethernet/huawei/hinic/hinic_main.c:204:9: error: call to undeclared function 'vlan_dev_priv'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     204 |                 ret = vlan_dev_priv(ndev)->real_dev;
         |                       ^
>> drivers/net/ethernet/huawei/hinic/hinic_main.c:204:30: error: member reference type 'int' is not a pointer
     204 |                 ret = vlan_dev_priv(ndev)->real_dev;
         |                       ~~~~~~~~~~~~~~~~~~~  ^
   drivers/net/ethernet/huawei/hinic/hinic_main.c:206:30: error: member reference type 'int' is not a pointer
     206 |                         ret = vlan_dev_priv(ret)->real_dev;
         |                               ~~~~~~~~~~~~~~~~~~  ^
   drivers/net/ethernet/huawei/hinic/hinic_main.c:182:5: warning: no previous prototype for function 'hinic_netdev_event' [-Wmissing-prototypes]
     182 | int hinic_netdev_event(struct notifier_block *notifier,
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_main.c:182:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     182 | int hinic_netdev_event(struct notifier_block *notifier,
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_main.c:3058:6: warning: no previous prototype for function 'nic_event' [-Wmissing-prototypes]
    3058 | void nic_event(struct hinic_lld_dev *lld_dev, void *adapter,
         |      ^
   drivers/net/ethernet/huawei/hinic/hinic_main.c:3058:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3058 | void nic_event(struct hinic_lld_dev *lld_dev, void *adapter,
         | ^
         | static 
   3 warnings and 3 errors generated.
--
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:321: warning: Function parameter or member 'hwe_cb' not described in 'hinic_aeq_register_hw_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:321: warning: Excess function parameter 'hw_cb' description in 'hinic_aeq_register_hw_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:369: warning: Function parameter or member 'aeq_swe_cb' not described in 'hinic_aeq_register_swe_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:369: warning: expecting prototype for hinic_aeq_register_sw_cb(). Prototype was for hinic_aeq_register_swe_cb() instead
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:391: warning: expecting prototype for hinic_aeq_unregister_sw_cb(). Prototype was for hinic_aeq_unregister_swe_cb() instead
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:417: warning: expecting prototype for hinic_ceq_register_sw_cb(). Prototype was for hinic_ceq_register_cb() instead
--
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:373: warning: expecting prototype for hinic_unregister_ppf_mbox_cb(). Prototype was for hinic_unregister_pf_mbox_cb() instead
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:411: warning: expecting prototype for hinic_unregister_ppf_mbox_cb(). Prototype was for hinic_unregister_ppf_to_pf_mbox_cb() instead
--
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:581: warning: Function parameter or member 'intr_reg_base' not described in 'hinic_init_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:581: warning: Function parameter or member 'db_base_phy' not described in 'hinic_init_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:581: warning: Function parameter or member 'db_base' not described in 'hinic_init_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:581: warning: Function parameter or member 'dwqe_mapping' not described in 'hinic_init_hwif'
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:717: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * get function id from register,used by sriov hot migration process
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:802: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * get function id, used by sriov hot migratition process.


vim +373 drivers/net/ethernet/huawei/hinic/hinic_mbox.c

9c1c9598010fbb drivers/net/ethernet/huawei/hinic/hinic_mbox.c    Zhou Shuai 2024-03-13  365  
9c1c9598010fbb drivers/net/ethernet/huawei/hinic/hinic_mbox.c    Zhou Shuai 2024-03-13  366  /**
9c1c9598010fbb drivers/net/ethernet/huawei/hinic/hinic_mbox.c    Zhou Shuai 2024-03-13  367   * hinic_unregister_ppf_mbox_cb - unregister the mbox callback for pf
a425b6e1c69ba9 drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c Luo bin    2020-04-25  368   * @hwdev: the pointer to hw device
a425b6e1c69ba9 drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c Luo bin    2020-04-25  369   * @mod: specific mod that the callback will handle
a425b6e1c69ba9 drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c Luo bin    2020-04-25  370   */
a425b6e1c69ba9 drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c Luo bin    2020-04-25  371  void hinic_unregister_pf_mbox_cb(struct hinic_hwdev *hwdev,
a425b6e1c69ba9 drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c Luo bin    2020-04-25  372  				 enum hinic_mod_type mod)
a425b6e1c69ba9 drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c Luo bin    2020-04-25 @373  {
a425b6e1c69ba9 drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c Luo bin    2020-04-25  374  	struct hinic_mbox_func_to_func *func_to_func = hwdev->func_to_func;
a425b6e1c69ba9 drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c Luo bin    2020-04-25  375  
a425b6e1c69ba9 drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c Luo bin    2020-04-25  376  	clear_bit(HINIC_PF_MBOX_CB_REG, &func_to_func->pf_mbox_cb_state[mod]);
a425b6e1c69ba9 drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c Luo bin    2020-04-25  377  
a425b6e1c69ba9 drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c Luo bin    2020-04-25  378  	while (test_bit(HINIC_PF_MBOX_CB_RUNNING,
a425b6e1c69ba9 drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c Luo bin    2020-04-25  379  			&func_to_func->pf_mbox_cb_state[mod]))
a425b6e1c69ba9 drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c Luo bin    2020-04-25  380  		usleep_range(900, 1000);
a425b6e1c69ba9 drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c Luo bin    2020-04-25  381  
a425b6e1c69ba9 drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c Luo bin    2020-04-25  382  	func_to_func->pf_mbox_cb[mod] = NULL;
a425b6e1c69ba9 drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c Luo bin    2020-04-25  383  }
a425b6e1c69ba9 drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c Luo bin    2020-04-25  384  

:::::: The code at line 373 was first introduced by commit
:::::: a425b6e1c69ba907b72b737a4d44f8cfbc43ce3c hinic: add mailbox function support

:::::: TO: Luo bin <luobin9@huawei.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
