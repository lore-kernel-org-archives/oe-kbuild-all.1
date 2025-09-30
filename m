Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5FE29E0F6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 06:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759214953; cv=none; b=uSmxgm0ztfg1DkHFGhxOGWSQpD5VOn5KiiL9fl4Rb/Dv02DiUNpV2JAegR+gffLN7UHOs0B5ATPf/xhzhudkVjQo3MlgwFBhZufNhm8weWyWzCUBi8r2Sd7r1tMDbviwarDCc8r25wN6GwXSEy2z1hs7pTSG183lfQm8WrNjnLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759214953; c=relaxed/simple;
	bh=AX0fuCH1yRgYD/n3wpmOiTbCyd2jEfzKK/OreNpfz94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u1iEjP3rPb9u8kCm1IvoYSQHGuIA8TlFG4CZynGUH3YjW2OlagUhuUBVigHJeDROQ0sLC0ixY1E5Mr6lj097TlbLRu0/F13lg8BFMFn1F9xAHxbuSDFac+dU/C6328Dzy+Tc4YxJgaJHq1dnN6tfHQ3v+WiiGAycUS76QyH+VR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KiWV2RR2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KiWV2RR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759214952; x=1790750952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AX0fuCH1yRgYD/n3wpmOiTbCyd2jEfzKK/OreNpfz94=;
  b=KiWV2RR2kYzB8V5knDfXE/9u11swgEzCx9NWYxKXqTElnqAG/fpRdMKi
   o9nvBDMliOzSADZOf3ki/0ztrRi7yyeB9ohsQGHsHq4ixSmrygPY+Zqti
   /vDcsoQkIrCHlRKIhXxyiLvwzmUEUn6D0jGEAW2gtl77qCdEVcJ4BfyH8
   uqjurVTDSlNiBMmScwx0ywUGGWmOCwSUyEeHFfHDLzB/Uk+4OUgTLd1nn
   s4dnouoJzG5COw6E+N8PC7Bl0hE1RjW+xzMIfmg9+OXKQxrWSBwZD5UY5
   lNOV9fU9euIUlriaCu57aggjmaQiD56KGy989t8YHIjN7kFi2Oy1mXJJE
   g==;
X-CSE-ConnectionGUID: csoXvqbBQBuLx2o57GOaEw==
X-CSE-MsgGUID: orUbuiwjSWG+zlx+0egTSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72081758"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="72081758"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 23:49:11 -0700
X-CSE-ConnectionGUID: UYyKd6eJQreP1JrxvTtzZQ==
X-CSE-MsgGUID: i4yGuXCUTJ61+sUpagtZDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="177571882"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Sep 2025 23:49:10 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3UAc-0000yh-34;
	Tue, 30 Sep 2025 06:49:06 +0000
Date: Tue, 30 Sep 2025 14:49:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2956/2956] include/linux/fortify-string.h:515:58:
 warning: left-hand operand of comma expression has no effect
Message-ID: <202509301446.csg9rg8E-lkp@intel.com>
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
head:   b68ca03b5eebc04f7f846c56524f7b81f40b7746
commit: 9c1c9598010fbb9daa1e2a67d23830092fb6246a [2956/2956] net/hinic: Update Huawei Intelligent Network Card Driver: hinic
config: arm64-randconfig-004-20250930 (https://download.01.org/0day-ci/archive/20250930/202509301446.csg9rg8E-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509301446.csg9rg8E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509301446.csg9rg8E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/huawei/hinic/hinic_dcb.c:32:
   drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:19: error: field 'hinic_ieee_ets_default' has incomplete type
     struct ieee_ets  hinic_ieee_ets_default;
                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:211:19: error: field 'hinic_ieee_ets' has incomplete type
     struct ieee_ets  hinic_ieee_ets;
                      ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:212:19: error: field 'hinic_ieee_pfc' has incomplete type
     struct ieee_pfc  hinic_ieee_pfc;
                      ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:62:6: warning: no previous prototype for 'hinic_dcb_config_init' [-Wmissing-prototypes]
    void hinic_dcb_config_init(struct hinic_nic_dev *nic_dev,
         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:95:6: warning: no previous prototype for 'hinic_init_ieee_settings' [-Wmissing-prototypes]
    void hinic_init_ieee_settings(struct hinic_nic_dev *nic_dev)
         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:294,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27,
                    from drivers/net/ethernet/huawei/hinic/hinic_dcb.c:18:
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_init_ieee_settings':
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:103:26: error: invalid application of 'sizeof' to incomplete type 'struct ieee_ets'
     memset(ets, 0x0, sizeof(struct ieee_ets));
                             ^~~~~~
   include/linux/fortify-string.h:514:35: note: in definition of macro '__fortify_memset_chk'
     size_t __fortify_size = (size_t)(size);    \
                                      ^~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:103:2: note: in expansion of macro 'memset'
     memset(ets, 0x0, sizeof(struct ieee_ets));
     ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:104:47: error: invalid application of 'sizeof' to incomplete type 'struct ieee_ets'
     memset(&nic_dev->hinic_ieee_ets, 0x0, sizeof(struct ieee_ets));
                                                  ^~~~~~
   include/linux/fortify-string.h:514:35: note: in definition of macro '__fortify_memset_chk'
     size_t __fortify_size = (size_t)(size);    \
                                      ^~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:104:2: note: in expansion of macro 'memset'
     memset(&nic_dev->hinic_ieee_ets, 0x0, sizeof(struct ieee_ets));
     ^~~~~~
>> include/linux/fortify-string.h:515:58: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     fortify_memset_chk(__fortify_size, p_size, p_size_field), \
                                                             ^
   include/linux/fortify-string.h:524:25: note: in expansion of macro '__fortify_memset_chk'
    #define memset(p, c, s) __fortify_memset_chk(p, c, s,   \
                            ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:104:2: note: in expansion of macro 'memset'
     memset(&nic_dev->hinic_ieee_ets, 0x0, sizeof(struct ieee_ets));
     ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:105:5: error: dereferencing pointer to incomplete type 'struct ieee_ets'
     ets->ets_cap = dcb_cfg->pg_tcs;
        ^~
   In file included from include/linux/string.h:294,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27,
                    from drivers/net/ethernet/huawei/hinic/hinic_dcb.c:18:
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:115:47: error: invalid application of 'sizeof' to incomplete type 'struct ieee_ets'
     memcpy(&nic_dev->hinic_ieee_ets, ets, sizeof(struct ieee_ets));
                                                  ^~~~~~
   include/linux/fortify-string.h:636:41: note: in definition of macro '__fortify_memcpy_chk'
     const size_t __fortify_size = (size_t)(size);   \
                                            ^~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:115:2: note: in expansion of macro 'memcpy'
     memcpy(&nic_dev->hinic_ieee_ets, ets, sizeof(struct ieee_ets));
     ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:117:26: error: invalid application of 'sizeof' to incomplete type 'struct ieee_pfc'
     memset(pfc, 0x0, sizeof(struct ieee_pfc));
                             ^~~~~~
   include/linux/fortify-string.h:514:35: note: in definition of macro '__fortify_memset_chk'
     size_t __fortify_size = (size_t)(size);    \
                                      ^~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:117:2: note: in expansion of macro 'memset'
     memset(pfc, 0x0, sizeof(struct ieee_pfc));
     ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:118:5: error: dereferencing pointer to incomplete type 'struct ieee_pfc'
     pfc->pfc_cap = dcb_cfg->pfc_tcs;
        ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcb_init':
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:244:22: error: 'DCB_CAP_DCBX_HOST' undeclared (first use in this function); did you mean 'HT_CAPTYPE_HOST'?
     nic_dev->dcbx_cap = DCB_CAP_DCBX_HOST | DCB_CAP_DCBX_VER_CEE;
                         ^~~~~~~~~~~~~~~~~
                         HT_CAPTYPE_HOST
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:244:22: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:244:42: error: 'DCB_CAP_DCBX_VER_CEE' undeclared (first use in this function); did you mean 'DCB_CFG_CHG_UP_COS'?
     nic_dev->dcbx_cap = DCB_CAP_DCBX_HOST | DCB_CAP_DCBX_VER_CEE;
                                             ^~~~~~~~~~~~~~~~~~~~
                                             DCB_CFG_CHG_UP_COS
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: At top level:
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:258:6: warning: no previous prototype for 'hinic_set_prio_tc_map' [-Wmissing-prototypes]
    void hinic_set_prio_tc_map(struct hinic_nic_dev *nic_dev)
         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcbnl_set_state':
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:380:28: error: 'DCB_CAP_DCBX_VER_CEE' undeclared (first use in this function); did you mean 'DCB_CFG_CHG_UP_COS'?
     if (!(nic_dev->dcbx_cap & DCB_CAP_DCBX_VER_CEE))
                               ^~~~~~~~~~~~~~~~~~~~
                               DCB_CFG_CHG_UP_COS
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcbnl_set_pg_tc_cfg_tx':
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:475:14: error: 'DCB_ATTR_VALUE_UNDEFINED' undeclared (first use in this function); did you mean 'NL_ATTR_TYPE_NESTED'?
     if (prio != DCB_ATTR_VALUE_UNDEFINED)
                 ^~~~~~~~~~~~~~~~~~~~~~~~
                 NL_ATTR_TYPE_NESTED
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcbnl_set_pg_tc_cfg_rx':
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:507:14: error: 'DCB_ATTR_VALUE_UNDEFINED' undeclared (first use in this function); did you mean 'NL_ATTR_TYPE_NESTED'?
     if (prio != DCB_ATTR_VALUE_UNDEFINED)
                 ^~~~~~~~~~~~~~~~~~~~~~~~
                 NL_ATTR_TYPE_NESTED
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcbnl_getcap':
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:689:7: error: 'DCB_CAP_ATTR_PG' undeclared (first use in this function); did you mean 'DEVICE_ATTR_RO'?
     case DCB_CAP_ATTR_PG:
          ^~~~~~~~~~~~~~~
          DEVICE_ATTR_RO
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:692:7: error: 'DCB_CAP_ATTR_PFC' undeclared (first use in this function); did you mean 'DCB_CFG_CHG_PFC'?
     case DCB_CAP_ATTR_PFC:
          ^~~~~~~~~~~~~~~~
          DCB_CFG_CHG_PFC
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:695:7: error: 'DCB_CAP_ATTR_UP2TC' undeclared (first use in this function); did you mean 'DCB_CFG_CHG_PFC'?
     case DCB_CAP_ATTR_UP2TC:
          ^~~~~~~~~~~~~~~~~~
          DCB_CFG_CHG_PFC
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:698:7: error: 'DCB_CAP_ATTR_PG_TCS' undeclared (first use in this function); did you mean 'DCB_CFG_CHG_PG_TX'?
     case DCB_CAP_ATTR_PG_TCS:
          ^~~~~~~~~~~~~~~~~~~
          DCB_CFG_CHG_PG_TX
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:701:7: error: 'DCB_CAP_ATTR_PFC_TCS' undeclared (first use in this function); did you mean 'DCB_CFG_CHG_PG_TX'?
     case DCB_CAP_ATTR_PFC_TCS:
          ^~~~~~~~~~~~~~~~~~~~
          DCB_CFG_CHG_PG_TX
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:704:7: error: 'DCB_CAP_ATTR_GSP' undeclared (first use in this function); did you mean 'PCI_CAP_ID_AGP'?
     case DCB_CAP_ATTR_GSP:
          ^~~~~~~~~~~~~~~~
          PCI_CAP_ID_AGP
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:707:7: error: 'DCB_CAP_ATTR_BCN' undeclared (first use in this function); did you mean 'DEVICE_ATTR_RO'?
     case DCB_CAP_ATTR_BCN:
          ^~~~~~~~~~~~~~~~
          DEVICE_ATTR_RO
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:710:7: error: 'DCB_CAP_ATTR_DCBX' undeclared (first use in this function); did you mean 'PCI_CAP_ID_DBG'?
     case DCB_CAP_ATTR_DCBX:
          ^~~~~~~~~~~~~~~~~
          PCI_CAP_ID_DBG
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function '__set_hw_ets':


vim +515 include/linux/fortify-string.h

28e77cc1c06866 Kees Cook 2021-06-16  512  
28e77cc1c06866 Kees Cook 2021-06-16  513  #define __fortify_memset_chk(p, c, size, p_size, p_size_field) ({	\
28e77cc1c06866 Kees Cook 2021-06-16  514  	size_t __fortify_size = (size_t)(size);				\
28e77cc1c06866 Kees Cook 2021-06-16 @515  	fortify_memset_chk(__fortify_size, p_size, p_size_field),	\
28e77cc1c06866 Kees Cook 2021-06-16  516  	__underlying_memset(p, c, __fortify_size);			\
28e77cc1c06866 Kees Cook 2021-06-16  517  })
28e77cc1c06866 Kees Cook 2021-06-16  518  

:::::: The code at line 515 was first introduced by commit
:::::: 28e77cc1c0686621a4d416f599cee5ab369daa0a fortify: Detect struct member overflows in memset() at compile-time

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
