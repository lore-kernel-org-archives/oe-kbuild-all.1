Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108402376B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 22:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCKrZilO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699050310; x=1730586310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Du1SpqA6VHdEc9icB0BqUsAch9xnfE58iJDXei6VCB0=;
  b=PCKrZilOW58SabKHjAP/vIFphPoJNePO/9V8rN0tST2ySyop+AXnuGjK
   vOGrz5n8JsHbiWOTcErvPyaoc/7lSsv2yG7dEEE88wwdiztLPUIiZbnTV
   xXnABNaH5oVd8202uy8mRMgRW5+JjeaNhgL6WBKOzDWPRcmVgHnkrwOZf
   eWgQ6UU7+UoRmZ5Tg7amLxFg6xf3Pqckzan/pdEi6cWXgbm8cbuvuKexW
   IxBDy3WHctcHFeqUXABQdPSQN/bVvU5RoMJUEYKltl1LnYYYDO1N2u4QL
   sD/Ea2NY2qWVYIre2SG3TTCwHSjO0q8GNskyGB9Czcf+5BTeig4udNS1H
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="388858986"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="388858986"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 15:25:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765393282"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="765393282"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Nov 2023 15:25:07 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz2bB-00030B-18;
	Fri, 03 Nov 2023 22:25:05 +0000
Date: Sat, 4 Nov 2023 06:24:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: drivers/net/wireless/intel/iwlwifi/fw/acpi.c:1190:25: warning: '%s'
 directive argument is null
Message-ID: <202311040602.sCjU3UXr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sunil,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e392ea4d4d00880bf94550151b1ace4f88a4b17a
commit: a91a9ffbd3a55a0ae1bb75e2b6e85b2a03f64e8f RISC-V: Add support to build the ACPI core
date:   5 months ago
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311040602.sCjU3UXr-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040602.sCjU3UXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040602.sCjU3UXr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/intel/iwlwifi/fw/acpi.c:9:
   drivers/net/wireless/intel/iwlwifi/fw/acpi.c: In function 'iwl_acpi_is_ppag_approved':
>> drivers/net/wireless/intel/iwlwifi/fw/acpi.c:1190:25: warning: '%s' directive argument is null [-Wformat-overflow=]
    1190 |                         "System vendor '%s' is not in the approved list, disabling PPAG.\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/iwl-debug.h:91:56: note: in definition of macro '__IWL_DEBUG_DEV'
      91 |                 __iwl_dbg(dev, level, limit, __func__, fmt, ##args);    \
         |                                                        ^~~
   drivers/net/wireless/intel/iwlwifi/iwl-debug.h:209:41: note: in expansion of macro 'IWL_DEBUG'
     209 | #define IWL_DEBUG_RADIO(p, f, a...)     IWL_DEBUG(p, IWL_DL_RADIO, f, ## a)
         |                                         ^~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/fw/acpi.c:1189:17: note: in expansion of macro 'IWL_DEBUG_RADIO'
    1189 |                 IWL_DEBUG_RADIO(fwrt,
         |                 ^~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/fw/acpi.c:1190:41: note: format string is defined here
    1190 |                         "System vendor '%s' is not in the approved list, disabling PPAG.\n",
         |                                         ^~


vim +1190 drivers/net/wireless/intel/iwlwifi/fw/acpi.c

e8e10a37c51c08 Matt Chen 2022-03-04  1187  
e8e10a37c51c08 Matt Chen 2022-03-04  1188  	if (!dmi_check_system(dmi_ppag_approved_list)) {
e8e10a37c51c08 Matt Chen 2022-03-04  1189  		IWL_DEBUG_RADIO(fwrt,
e8e10a37c51c08 Matt Chen 2022-03-04 @1190  			"System vendor '%s' is not in the approved list, disabling PPAG.\n",

:::::: The code at line 1190 was first introduced by commit
:::::: e8e10a37c51c08b99d272b2e1b3ef70fcd38f9e8 iwlwifi: acpi: move ppag code from mvm to fw/acpi

:::::: TO: Matt Chen <matt.chen@intel.com>
:::::: CC: Luca Coelho <luciano.coelho@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
