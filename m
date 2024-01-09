Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D0053A4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jan 2024 03:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaOe/TBY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704770053; x=1736306053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lamVJC3yX0BgXenQgPXH1Rcm6U5xom7oIZk0p7KdGic=;
  b=HaOe/TBYDSEX5DxMQaJKtIoHbxbxfAjRE3mWXBPllVL1RJlA6I8rL4aK
   Y7ZFO2dyd9izdpi+AEO5oaqodRogWmW76Xk+eYhV5AJg7Ez0Gd5wnuZyO
   aHtKXoMptPfHUSLopvVKMz0SL4v9Bbp0ERVwGJrgy92dJIgUmL9mvIGUv
   0rH/hhRgTXNV4JFr8/w3V1dz7V6UfPtkE1rwmo8kcrmOc+gBnl7Htl6uA
   ss3d5VjmPzzTJZWVfS7Puvcxp/LhexBIJGiWHQy61ZFLCn7F0xfqKxcJi
   m+k3tcF0vhGxCOF4U0yK5YCEGt/kTRtmTCu3OCOk1BGIWwiG9iTawQhwn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="484248906"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="484248906"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 19:14:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="774699580"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="774699580"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 08 Jan 2024 19:13:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rN2Yq-0005P4-12;
	Tue, 09 Jan 2024 03:13:54 +0000
Date: Tue, 9 Jan 2024 11:13:09 +0800
From: kernel test robot <lkp@intel.com>
To: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-next:egrumbac_fixes_6.5 55/69]
 drivers/net/wireless/intel/iwlwifi/pcie/drv.c:38:41: error:
 'iwl5100_agn_cfg' undeclared here (not in a function); did you mean
 'iwl3160_n_cfg'?
Message-ID: <202401091108.mFAZSSWZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git egrumbac_fixes_6.5
head:   9a1b32d1e9cff80526cab2834f9dfd7609d9c627
commit: 93a3c02830e001c30586795dc8bbdae0498ea50a [55/69] f
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240109/202401091108.mFAZSSWZ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240109/202401091108.mFAZSSWZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401091108.mFAZSSWZ-lkp@intel.com/

Note: the iwlwifi-next/egrumbac_fixes_6.5 HEAD 9a1b32d1e9cff80526cab2834f9dfd7609d9c627 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:38:41: error: 'iwl5100_agn_cfg' undeclared here (not in a function); did you mean 'iwl3160_n_cfg'?
      38 |         {IWL_PCI_DEVICE(0x4232, 0x1201, iwl5100_agn_cfg)}, /* Mini Card */
         |                                         ^~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:21:65: note: in definition of macro '_IS_A'
      21 | #define _IS_A(cfg, _struct) __builtin_types_compatible_p(typeof(cfg),   \
         |                                                                 ^~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:38:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      38 |         {IWL_PCI_DEVICE(0x4232, 0x1201, iwl5100_agn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:38:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      38 |         {IWL_PCI_DEVICE(0x4232, 0x1201, iwl5100_agn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:38:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      38 |         {IWL_PCI_DEVICE(0x4232, 0x1201, iwl5100_agn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:39:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      39 |         {IWL_PCI_DEVICE(0x4232, 0x1301, iwl5100_agn_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:39:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      39 |         {IWL_PCI_DEVICE(0x4232, 0x1301, iwl5100_agn_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:40:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      40 |         {IWL_PCI_DEVICE(0x4232, 0x1204, iwl5100_agn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:40:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      40 |         {IWL_PCI_DEVICE(0x4232, 0x1204, iwl5100_agn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:41:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      41 |         {IWL_PCI_DEVICE(0x4232, 0x1304, iwl5100_agn_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:41:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      41 |         {IWL_PCI_DEVICE(0x4232, 0x1304, iwl5100_agn_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:42:41: error: 'iwl5100_bgn_cfg' undeclared here (not in a function); did you mean 'iwl3160_n_cfg'?
      42 |         {IWL_PCI_DEVICE(0x4232, 0x1205, iwl5100_bgn_cfg)}, /* Mini Card */
         |                                         ^~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:21:65: note: in definition of macro '_IS_A'
      21 | #define _IS_A(cfg, _struct) __builtin_types_compatible_p(typeof(cfg),   \
         |                                                                 ^~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:42:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      42 |         {IWL_PCI_DEVICE(0x4232, 0x1205, iwl5100_bgn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:42:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      42 |         {IWL_PCI_DEVICE(0x4232, 0x1205, iwl5100_bgn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:42:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      42 |         {IWL_PCI_DEVICE(0x4232, 0x1205, iwl5100_bgn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:43:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      43 |         {IWL_PCI_DEVICE(0x4232, 0x1305, iwl5100_bgn_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:43:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      43 |         {IWL_PCI_DEVICE(0x4232, 0x1305, iwl5100_bgn_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:44:41: error: 'iwl5100_abg_cfg' undeclared here (not in a function); did you mean 'iwl3160_n_cfg'?
      44 |         {IWL_PCI_DEVICE(0x4232, 0x1206, iwl5100_abg_cfg)}, /* Mini Card */
         |                                         ^~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:21:65: note: in definition of macro '_IS_A'
      21 | #define _IS_A(cfg, _struct) __builtin_types_compatible_p(typeof(cfg),   \
         |                                                                 ^~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:44:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      44 |         {IWL_PCI_DEVICE(0x4232, 0x1206, iwl5100_abg_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:44:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      44 |         {IWL_PCI_DEVICE(0x4232, 0x1206, iwl5100_abg_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:44:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      44 |         {IWL_PCI_DEVICE(0x4232, 0x1206, iwl5100_abg_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:45:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      45 |         {IWL_PCI_DEVICE(0x4232, 0x1306, iwl5100_abg_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:45:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      45 |         {IWL_PCI_DEVICE(0x4232, 0x1306, iwl5100_abg_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:46:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      46 |         {IWL_PCI_DEVICE(0x4232, 0x1221, iwl5100_agn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:46:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      46 |         {IWL_PCI_DEVICE(0x4232, 0x1221, iwl5100_agn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:47:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      47 |         {IWL_PCI_DEVICE(0x4232, 0x1321, iwl5100_agn_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:47:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      47 |         {IWL_PCI_DEVICE(0x4232, 0x1321, iwl5100_agn_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:48:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      48 |         {IWL_PCI_DEVICE(0x4232, 0x1224, iwl5100_agn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:48:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      48 |         {IWL_PCI_DEVICE(0x4232, 0x1224, iwl5100_agn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:49:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      49 |         {IWL_PCI_DEVICE(0x4232, 0x1324, iwl5100_agn_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:49:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      49 |         {IWL_PCI_DEVICE(0x4232, 0x1324, iwl5100_agn_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:50:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      50 |         {IWL_PCI_DEVICE(0x4232, 0x1225, iwl5100_bgn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:50:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      50 |         {IWL_PCI_DEVICE(0x4232, 0x1225, iwl5100_bgn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:51:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      51 |         {IWL_PCI_DEVICE(0x4232, 0x1325, iwl5100_bgn_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:51:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      51 |         {IWL_PCI_DEVICE(0x4232, 0x1325, iwl5100_bgn_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:52:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      52 |         {IWL_PCI_DEVICE(0x4232, 0x1226, iwl5100_abg_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:52:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      52 |         {IWL_PCI_DEVICE(0x4232, 0x1226, iwl5100_abg_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:53:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      53 |         {IWL_PCI_DEVICE(0x4232, 0x1326, iwl5100_abg_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:53:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      53 |         {IWL_PCI_DEVICE(0x4232, 0x1326, iwl5100_abg_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:54:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      54 |         {IWL_PCI_DEVICE(0x4237, 0x1211, iwl5100_agn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:54:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      54 |         {IWL_PCI_DEVICE(0x4237, 0x1211, iwl5100_agn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:55:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      55 |         {IWL_PCI_DEVICE(0x4237, 0x1311, iwl5100_agn_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:55:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      55 |         {IWL_PCI_DEVICE(0x4237, 0x1311, iwl5100_agn_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:56:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      56 |         {IWL_PCI_DEVICE(0x4237, 0x1214, iwl5100_agn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:56:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      56 |         {IWL_PCI_DEVICE(0x4237, 0x1214, iwl5100_agn_cfg)}, /* Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:57:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      57 |         {IWL_PCI_DEVICE(0x4237, 0x1314, iwl5100_agn_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:25:10: error: first argument to '__builtin_choose_expr' not a constant
      25 |         (__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),        \
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:33:24: note: in expansion of macro '_ASSIGN_CFG'
      33 |         .driver_data = _ASSIGN_CFG(cfg)
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:57:10: note: in expansion of macro 'IWL_PCI_DEVICE'
      57 |         {IWL_PCI_DEVICE(0x4237, 0x1314, iwl5100_agn_cfg)}, /* Half Mini Card */
         |          ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:27:10: error: first argument to '__builtin_choose_expr' not a constant
      27 |          __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
         |          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:28:27: note: in expansion of macro '_TRANS_CFG_MARKER'
      28 | #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))


vim +38 drivers/net/wireless/intel/iwlwifi/pcie/drv.c

d57fa99d91bd6e drivers/net/wireless/iwlwifi/iwl-pci.c        Wey-Yi Guy        2011-06-10   19  
48a5494d6a4cb5 drivers/net/wireless/intel/iwlwifi/pcie/drv.c Johannes Berg     2021-03-30   20  #define TRANS_CFG_MARKER BIT(0)
48a5494d6a4cb5 drivers/net/wireless/intel/iwlwifi/pcie/drv.c Johannes Berg     2021-03-30   21  #define _IS_A(cfg, _struct) __builtin_types_compatible_p(typeof(cfg),	\
48a5494d6a4cb5 drivers/net/wireless/intel/iwlwifi/pcie/drv.c Johannes Berg     2021-03-30   22  							 struct _struct)
48a5494d6a4cb5 drivers/net/wireless/intel/iwlwifi/pcie/drv.c Johannes Berg     2021-03-30   23  extern int _invalid_type;
48a5494d6a4cb5 drivers/net/wireless/intel/iwlwifi/pcie/drv.c Johannes Berg     2021-03-30   24  #define _TRANS_CFG_MARKER(cfg)						\
48a5494d6a4cb5 drivers/net/wireless/intel/iwlwifi/pcie/drv.c Johannes Berg     2021-03-30   25  	(__builtin_choose_expr(_IS_A(cfg, iwl_cfg_trans_params),	\
48a5494d6a4cb5 drivers/net/wireless/intel/iwlwifi/pcie/drv.c Johannes Berg     2021-03-30   26  			       TRANS_CFG_MARKER,			\
48a5494d6a4cb5 drivers/net/wireless/intel/iwlwifi/pcie/drv.c Johannes Berg     2021-03-30  @27  	 __builtin_choose_expr(_IS_A(cfg, iwl_cfg), 0, _invalid_type)))
48a5494d6a4cb5 drivers/net/wireless/intel/iwlwifi/pcie/drv.c Johannes Berg     2021-03-30   28  #define _ASSIGN_CFG(cfg) (_TRANS_CFG_MARKER(cfg) + (kernel_ulong_t)&(cfg))
48a5494d6a4cb5 drivers/net/wireless/intel/iwlwifi/pcie/drv.c Johannes Berg     2021-03-30   29  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   30  #define IWL_PCI_DEVICE(dev, subdev, cfg) \
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   31  	.vendor = PCI_VENDOR_ID_INTEL,  .device = (dev), \
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   32  	.subvendor = PCI_ANY_ID, .subdevice = (subdev), \
48a5494d6a4cb5 drivers/net/wireless/intel/iwlwifi/pcie/drv.c Johannes Berg     2021-03-30   33  	.driver_data = _ASSIGN_CFG(cfg)
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   34  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   35  /* Hardware specific file defines the PCI IDs table for that hardware module */
9baa3c34ac4e27 drivers/net/wireless/iwlwifi/pcie/drv.c       Benoit Taine      2014-08-08   36  static const struct pci_device_id iwl_hw_card_ids[] = {
4f25bbdb160e43 drivers/net/wireless/iwlwifi/pcie/drv.c       Johannes Berg     2013-06-10   37  #if IS_ENABLED(CONFIG_IWLDVM)
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  @38  	{IWL_PCI_DEVICE(0x4232, 0x1201, iwl5100_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   39  	{IWL_PCI_DEVICE(0x4232, 0x1301, iwl5100_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   40  	{IWL_PCI_DEVICE(0x4232, 0x1204, iwl5100_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   41  	{IWL_PCI_DEVICE(0x4232, 0x1304, iwl5100_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  @42  	{IWL_PCI_DEVICE(0x4232, 0x1205, iwl5100_bgn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   43  	{IWL_PCI_DEVICE(0x4232, 0x1305, iwl5100_bgn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  @44  	{IWL_PCI_DEVICE(0x4232, 0x1206, iwl5100_abg_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   45  	{IWL_PCI_DEVICE(0x4232, 0x1306, iwl5100_abg_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   46  	{IWL_PCI_DEVICE(0x4232, 0x1221, iwl5100_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   47  	{IWL_PCI_DEVICE(0x4232, 0x1321, iwl5100_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   48  	{IWL_PCI_DEVICE(0x4232, 0x1224, iwl5100_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   49  	{IWL_PCI_DEVICE(0x4232, 0x1324, iwl5100_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   50  	{IWL_PCI_DEVICE(0x4232, 0x1225, iwl5100_bgn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   51  	{IWL_PCI_DEVICE(0x4232, 0x1325, iwl5100_bgn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   52  	{IWL_PCI_DEVICE(0x4232, 0x1226, iwl5100_abg_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   53  	{IWL_PCI_DEVICE(0x4232, 0x1326, iwl5100_abg_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   54  	{IWL_PCI_DEVICE(0x4237, 0x1211, iwl5100_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   55  	{IWL_PCI_DEVICE(0x4237, 0x1311, iwl5100_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   56  	{IWL_PCI_DEVICE(0x4237, 0x1214, iwl5100_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   57  	{IWL_PCI_DEVICE(0x4237, 0x1314, iwl5100_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   58  	{IWL_PCI_DEVICE(0x4237, 0x1215, iwl5100_bgn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   59  	{IWL_PCI_DEVICE(0x4237, 0x1315, iwl5100_bgn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   60  	{IWL_PCI_DEVICE(0x4237, 0x1216, iwl5100_abg_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   61  	{IWL_PCI_DEVICE(0x4237, 0x1316, iwl5100_abg_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   62  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   63  /* 5300 Series WiFi */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  @64  	{IWL_PCI_DEVICE(0x4235, 0x1021, iwl5300_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   65  	{IWL_PCI_DEVICE(0x4235, 0x1121, iwl5300_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   66  	{IWL_PCI_DEVICE(0x4235, 0x1024, iwl5300_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   67  	{IWL_PCI_DEVICE(0x4235, 0x1124, iwl5300_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   68  	{IWL_PCI_DEVICE(0x4235, 0x1001, iwl5300_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   69  	{IWL_PCI_DEVICE(0x4235, 0x1101, iwl5300_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   70  	{IWL_PCI_DEVICE(0x4235, 0x1004, iwl5300_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   71  	{IWL_PCI_DEVICE(0x4235, 0x1104, iwl5300_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   72  	{IWL_PCI_DEVICE(0x4236, 0x1011, iwl5300_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   73  	{IWL_PCI_DEVICE(0x4236, 0x1111, iwl5300_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   74  	{IWL_PCI_DEVICE(0x4236, 0x1014, iwl5300_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   75  	{IWL_PCI_DEVICE(0x4236, 0x1114, iwl5300_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   76  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   77  /* 5350 Series WiFi/WiMax */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  @78  	{IWL_PCI_DEVICE(0x423A, 0x1001, iwl5350_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   79  	{IWL_PCI_DEVICE(0x423A, 0x1021, iwl5350_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   80  	{IWL_PCI_DEVICE(0x423B, 0x1011, iwl5350_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   81  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   82  /* 5150 Series Wifi/WiMax */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  @83  	{IWL_PCI_DEVICE(0x423C, 0x1201, iwl5150_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   84  	{IWL_PCI_DEVICE(0x423C, 0x1301, iwl5150_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  @85  	{IWL_PCI_DEVICE(0x423C, 0x1206, iwl5150_abg_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   86  	{IWL_PCI_DEVICE(0x423C, 0x1306, iwl5150_abg_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   87  	{IWL_PCI_DEVICE(0x423C, 0x1221, iwl5150_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   88  	{IWL_PCI_DEVICE(0x423C, 0x1321, iwl5150_agn_cfg)}, /* Half Mini Card */
a1923f1d4723e5 drivers/net/wireless/iwlwifi/pcie/drv.c       Emmanuel Grumbach 2013-07-18   89  	{IWL_PCI_DEVICE(0x423C, 0x1326, iwl5150_abg_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   90  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   91  	{IWL_PCI_DEVICE(0x423D, 0x1211, iwl5150_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   92  	{IWL_PCI_DEVICE(0x423D, 0x1311, iwl5150_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   93  	{IWL_PCI_DEVICE(0x423D, 0x1216, iwl5150_abg_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   94  	{IWL_PCI_DEVICE(0x423D, 0x1316, iwl5150_abg_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   95  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   96  /* 6x00 Series */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  @97  	{IWL_PCI_DEVICE(0x422B, 0x1101, iwl6000_3agn_cfg)},
08a5dd3842f2ac drivers/net/wireless/iwlwifi/pcie/drv.c       Emmanuel Grumbach 2013-09-24   98  	{IWL_PCI_DEVICE(0x422B, 0x1108, iwl6000_3agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24   99  	{IWL_PCI_DEVICE(0x422B, 0x1121, iwl6000_3agn_cfg)},
08a5dd3842f2ac drivers/net/wireless/iwlwifi/pcie/drv.c       Emmanuel Grumbach 2013-09-24  100  	{IWL_PCI_DEVICE(0x422B, 0x1128, iwl6000_3agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @101  	{IWL_PCI_DEVICE(0x422C, 0x1301, iwl6000i_2agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @102  	{IWL_PCI_DEVICE(0x422C, 0x1306, iwl6000i_2abg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @103  	{IWL_PCI_DEVICE(0x422C, 0x1307, iwl6000i_2bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  104  	{IWL_PCI_DEVICE(0x422C, 0x1321, iwl6000i_2agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  105  	{IWL_PCI_DEVICE(0x422C, 0x1326, iwl6000i_2abg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  106  	{IWL_PCI_DEVICE(0x4238, 0x1111, iwl6000_3agn_cfg)},
08a5dd3842f2ac drivers/net/wireless/iwlwifi/pcie/drv.c       Emmanuel Grumbach 2013-09-24  107  	{IWL_PCI_DEVICE(0x4238, 0x1118, iwl6000_3agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  108  	{IWL_PCI_DEVICE(0x4239, 0x1311, iwl6000i_2agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  109  	{IWL_PCI_DEVICE(0x4239, 0x1316, iwl6000i_2abg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  110  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  111  /* 6x05 Series */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @112  	{IWL_PCI_DEVICE(0x0082, 0x1301, iwl6005_2agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @113  	{IWL_PCI_DEVICE(0x0082, 0x1306, iwl6005_2abg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @114  	{IWL_PCI_DEVICE(0x0082, 0x1307, iwl6005_2bg_cfg)},
08a5dd3842f2ac drivers/net/wireless/iwlwifi/pcie/drv.c       Emmanuel Grumbach 2013-09-24  115  	{IWL_PCI_DEVICE(0x0082, 0x1308, iwl6005_2agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  116  	{IWL_PCI_DEVICE(0x0082, 0x1321, iwl6005_2agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  117  	{IWL_PCI_DEVICE(0x0082, 0x1326, iwl6005_2abg_cfg)},
08a5dd3842f2ac drivers/net/wireless/iwlwifi/pcie/drv.c       Emmanuel Grumbach 2013-09-24  118  	{IWL_PCI_DEVICE(0x0082, 0x1328, iwl6005_2agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  119  	{IWL_PCI_DEVICE(0x0085, 0x1311, iwl6005_2agn_cfg)},
08a5dd3842f2ac drivers/net/wireless/iwlwifi/pcie/drv.c       Emmanuel Grumbach 2013-09-24  120  	{IWL_PCI_DEVICE(0x0085, 0x1318, iwl6005_2agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  121  	{IWL_PCI_DEVICE(0x0085, 0x1316, iwl6005_2abg_cfg)},
6a9ae0dc1d4ed6 drivers/net/wireless/iwlwifi/iwl-pci.c        Wey-Yi Guy        2011-08-25 @122  	{IWL_PCI_DEVICE(0x0082, 0xC020, iwl6005_2agn_sff_cfg)},
ff647af65656b7 drivers/net/wireless/iwlwifi/iwl-pci.c        Wey-Yi Guy        2011-09-15  123  	{IWL_PCI_DEVICE(0x0085, 0xC220, iwl6005_2agn_sff_cfg)},
08a5dd3842f2ac drivers/net/wireless/iwlwifi/pcie/drv.c       Emmanuel Grumbach 2013-09-24  124  	{IWL_PCI_DEVICE(0x0085, 0xC228, iwl6005_2agn_sff_cfg)},
378911233f424d drivers/net/wireless/iwlwifi/iwl-pci.c        Wey-Yi Guy        2012-02-22 @125  	{IWL_PCI_DEVICE(0x0082, 0x4820, iwl6005_2agn_d_cfg)},
378911233f424d drivers/net/wireless/iwlwifi/iwl-pci.c        Wey-Yi Guy        2012-02-22 @126  	{IWL_PCI_DEVICE(0x0082, 0x1304, iwl6005_2agn_mow1_cfg)},/* low 5GHz active */
378911233f424d drivers/net/wireless/iwlwifi/iwl-pci.c        Wey-Yi Guy        2012-02-22 @127  	{IWL_PCI_DEVICE(0x0082, 0x1305, iwl6005_2agn_mow2_cfg)},/* high 5GHz active */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  128  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  129  /* 6x30 Series */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @130  	{IWL_PCI_DEVICE(0x008A, 0x5305, iwl1030_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @131  	{IWL_PCI_DEVICE(0x008A, 0x5307, iwl1030_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  132  	{IWL_PCI_DEVICE(0x008A, 0x5325, iwl1030_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  133  	{IWL_PCI_DEVICE(0x008A, 0x5327, iwl1030_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  134  	{IWL_PCI_DEVICE(0x008B, 0x5315, iwl1030_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  135  	{IWL_PCI_DEVICE(0x008B, 0x5317, iwl1030_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @136  	{IWL_PCI_DEVICE(0x0090, 0x5211, iwl6030_2agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @137  	{IWL_PCI_DEVICE(0x0090, 0x5215, iwl6030_2bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @138  	{IWL_PCI_DEVICE(0x0090, 0x5216, iwl6030_2abg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  139  	{IWL_PCI_DEVICE(0x0091, 0x5201, iwl6030_2agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  140  	{IWL_PCI_DEVICE(0x0091, 0x5205, iwl6030_2bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  141  	{IWL_PCI_DEVICE(0x0091, 0x5206, iwl6030_2abg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @142  	{IWL_PCI_DEVICE(0x0091, 0x5207, iwl6030_2bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  143  	{IWL_PCI_DEVICE(0x0091, 0x5221, iwl6030_2agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  144  	{IWL_PCI_DEVICE(0x0091, 0x5225, iwl6030_2bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  145  	{IWL_PCI_DEVICE(0x0091, 0x5226, iwl6030_2abg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  146  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  147  /* 6x50 WiFi/WiMax Series */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @148  	{IWL_PCI_DEVICE(0x0087, 0x1301, iwl6050_2agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @149  	{IWL_PCI_DEVICE(0x0087, 0x1306, iwl6050_2abg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  150  	{IWL_PCI_DEVICE(0x0087, 0x1321, iwl6050_2agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  151  	{IWL_PCI_DEVICE(0x0087, 0x1326, iwl6050_2abg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  152  	{IWL_PCI_DEVICE(0x0089, 0x1311, iwl6050_2agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  153  	{IWL_PCI_DEVICE(0x0089, 0x1316, iwl6050_2abg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  154  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  155  /* 6150 WiFi/WiMax Series */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @156  	{IWL_PCI_DEVICE(0x0885, 0x1305, iwl6150_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @157  	{IWL_PCI_DEVICE(0x0885, 0x1307, iwl6150_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  158  	{IWL_PCI_DEVICE(0x0885, 0x1325, iwl6150_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  159  	{IWL_PCI_DEVICE(0x0885, 0x1327, iwl6150_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  160  	{IWL_PCI_DEVICE(0x0886, 0x1315, iwl6150_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  161  	{IWL_PCI_DEVICE(0x0886, 0x1317, iwl6150_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  162  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  163  /* 1000 Series WiFi */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @164  	{IWL_PCI_DEVICE(0x0083, 0x1205, iwl1000_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  165  	{IWL_PCI_DEVICE(0x0083, 0x1305, iwl1000_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  166  	{IWL_PCI_DEVICE(0x0083, 0x1225, iwl1000_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  167  	{IWL_PCI_DEVICE(0x0083, 0x1325, iwl1000_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  168  	{IWL_PCI_DEVICE(0x0084, 0x1215, iwl1000_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  169  	{IWL_PCI_DEVICE(0x0084, 0x1315, iwl1000_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @170  	{IWL_PCI_DEVICE(0x0083, 0x1206, iwl1000_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  171  	{IWL_PCI_DEVICE(0x0083, 0x1306, iwl1000_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  172  	{IWL_PCI_DEVICE(0x0083, 0x1226, iwl1000_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  173  	{IWL_PCI_DEVICE(0x0083, 0x1326, iwl1000_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  174  	{IWL_PCI_DEVICE(0x0084, 0x1216, iwl1000_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  175  	{IWL_PCI_DEVICE(0x0084, 0x1316, iwl1000_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  176  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  177  /* 100 Series WiFi */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @178  	{IWL_PCI_DEVICE(0x08AE, 0x1005, iwl100_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @179  	{IWL_PCI_DEVICE(0x08AE, 0x1007, iwl100_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  180  	{IWL_PCI_DEVICE(0x08AF, 0x1015, iwl100_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  181  	{IWL_PCI_DEVICE(0x08AF, 0x1017, iwl100_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  182  	{IWL_PCI_DEVICE(0x08AE, 0x1025, iwl100_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  183  	{IWL_PCI_DEVICE(0x08AE, 0x1027, iwl100_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  184  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  185  /* 130 Series WiFi */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @186  	{IWL_PCI_DEVICE(0x0896, 0x5005, iwl130_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @187  	{IWL_PCI_DEVICE(0x0896, 0x5007, iwl130_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  188  	{IWL_PCI_DEVICE(0x0897, 0x5015, iwl130_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  189  	{IWL_PCI_DEVICE(0x0897, 0x5017, iwl130_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  190  	{IWL_PCI_DEVICE(0x0896, 0x5025, iwl130_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  191  	{IWL_PCI_DEVICE(0x0896, 0x5027, iwl130_bg_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  192  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  193  /* 2x00 Series */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @194  	{IWL_PCI_DEVICE(0x0890, 0x4022, iwl2000_2bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  195  	{IWL_PCI_DEVICE(0x0891, 0x4222, iwl2000_2bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  196  	{IWL_PCI_DEVICE(0x0890, 0x4422, iwl2000_2bgn_cfg)},
1603dd495f87ae drivers/net/wireless/iwlwifi/iwl-pci.c        Wey-Yi Guy        2011-08-25 @197  	{IWL_PCI_DEVICE(0x0890, 0x4822, iwl2000_2bgn_d_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  198  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  199  /* 2x30 Series */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @200  	{IWL_PCI_DEVICE(0x0887, 0x4062, iwl2030_2bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  201  	{IWL_PCI_DEVICE(0x0888, 0x4262, iwl2030_2bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  202  	{IWL_PCI_DEVICE(0x0887, 0x4462, iwl2030_2bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  203  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  204  /* 6x35 Series */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @205  	{IWL_PCI_DEVICE(0x088E, 0x4060, iwl6035_2agn_cfg)},
08a5dd3842f2ac drivers/net/wireless/iwlwifi/pcie/drv.c       Emmanuel Grumbach 2013-09-24 @206  	{IWL_PCI_DEVICE(0x088E, 0x406A, iwl6035_2agn_sff_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  207  	{IWL_PCI_DEVICE(0x088F, 0x4260, iwl6035_2agn_cfg)},
08a5dd3842f2ac drivers/net/wireless/iwlwifi/pcie/drv.c       Emmanuel Grumbach 2013-09-24  208  	{IWL_PCI_DEVICE(0x088F, 0x426A, iwl6035_2agn_sff_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  209  	{IWL_PCI_DEVICE(0x088E, 0x4460, iwl6035_2agn_cfg)},
08a5dd3842f2ac drivers/net/wireless/iwlwifi/pcie/drv.c       Emmanuel Grumbach 2013-09-24  210  	{IWL_PCI_DEVICE(0x088E, 0x446A, iwl6035_2agn_sff_cfg)},
259653d86b80ed drivers/net/wireless/iwlwifi/iwl-pci.c        Wey-Yi Guy        2012-02-22  211  	{IWL_PCI_DEVICE(0x088E, 0x4860, iwl6035_2agn_cfg)},
20ecf9fd3bebc4 drivers/net/wireless/iwlwifi/pcie/drv.c       Shuduo Sang       2013-03-30  212  	{IWL_PCI_DEVICE(0x088F, 0x5260, iwl6035_2agn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  213  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  214  /* 105 Series */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @215  	{IWL_PCI_DEVICE(0x0894, 0x0022, iwl105_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  216  	{IWL_PCI_DEVICE(0x0895, 0x0222, iwl105_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  217  	{IWL_PCI_DEVICE(0x0894, 0x0422, iwl105_bgn_cfg)},
b319d3eb964a60 drivers/net/wireless/iwlwifi/iwl-pci.c        Wey-Yi Guy        2011-10-10 @218  	{IWL_PCI_DEVICE(0x0894, 0x0822, iwl105_bgn_d_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  219  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  220  /* 135 Series */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @221  	{IWL_PCI_DEVICE(0x0892, 0x0062, iwl135_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  222  	{IWL_PCI_DEVICE(0x0893, 0x0262, iwl135_bgn_cfg)},
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  223  	{IWL_PCI_DEVICE(0x0892, 0x0462, iwl135_bgn_cfg)},
4f25bbdb160e43 drivers/net/wireless/iwlwifi/pcie/drv.c       Johannes Berg     2013-06-10  224  #endif /* CONFIG_IWLDVM */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  225  

:::::: The code at line 38 was first introduced by commit
:::::: 48d1a2110ad9cb86e5cb0d790729824fa3cca83b iwlagn: add a iwl_pci.[ch] files that will contain all PCI specific code

:::::: TO: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
:::::: CC: Wey-Yi Guy <wey-yi.w.guy@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
