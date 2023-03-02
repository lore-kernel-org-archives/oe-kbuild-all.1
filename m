Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E351EA938
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 19:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677787053; x=1709323053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lBxY0q9eNWgnI2p2AAUp/2Pc1GBWsHqjfV+xSiOea68=;
  b=hI57FMj0RhDnB1ggQvnI+BVhy1RX3TN3HFQDJRzmVQY4claNXNhQw7lH
   tW4giKwFgp1cRHL5MXlW1cN5AIGssBopol7x5pG9FcpWw52wJq8d3HqAO
   DzMNH6tLlo44bFVEqDiqc4FfaVzlJerajxeE0M/1pCrgHNYAa368T3/Vc
   nxWHU66X9s/YYLUtHz9GEgqLDBJfaNqnT3fBzb5BNvzAFDe7lNFz0zIeP
   uV+86DN6AziF+I8i3uXF5NA6MJGEWkke7F8g6HWwl0KgZH7n2DL8sXbwR
   HRQK/qW6SH2Y9K/CMVobne6LmuMCVemwbWWiMXDcH9ibkx1X6d4Tw5eSf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397427848"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="397427848"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 11:57:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="677360740"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="677360740"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 02 Mar 2023 11:57:32 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXp3T-0000qU-18;
	Thu, 02 Mar 2023 19:57:31 +0000
Date: Fri, 3 Mar 2023 03:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 1/11]
 drivers/net/wireless/iwl7000/iwlwifi/xvt/xvt.c:1126:6: error: redefinition
 of 'iwl_xvt_lari_cfg'
Message-ID: <202303030359.mg2CQRMO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Abhishek,

First bad commit (maybe != root cause):

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   a82854859f6034582c2249515df1f786122df40b
commit: 91a70c368104217f438758873200771879116f92 [1/11] CHROMIUM: driver:  Support iwl7000 driver on v6.1
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20230303/202303030359.mg2CQRMO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout 91a70c368104217f438758873200771879116f92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um olddefconfig
        make W=1 O=build_dir ARCH=um SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030359.mg2CQRMO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/iwl7000/iwlwifi/xvt/xvt.c:1126:6: error: redefinition of 'iwl_xvt_lari_cfg'
    1126 | void iwl_xvt_lari_cfg(struct iwl_xvt *xvt)
         |      ^~~~~~~~~~~~~~~~
   drivers/net/wireless/iwl7000/iwlwifi/xvt/xvt.c:940:6: note: previous definition of 'iwl_xvt_lari_cfg' with type 'void(struct iwl_xvt *)'
     940 | void iwl_xvt_lari_cfg(struct iwl_xvt *xvt)
         |      ^~~~~~~~~~~~~~~~
   drivers/net/wireless/iwl7000/iwlwifi/xvt/xvt.c: In function 'iwl_xvt_lari_cfg':
>> drivers/net/wireless/iwl7000/iwlwifi/xvt/xvt.c:1136:37: error: 'iwl_guid' undeclared (first use in this function); did you mean 'iwl_sku_id'?
    1136 |                                    &iwl_guid, &value);
         |                                     ^~~~~~~~
         |                                     iwl_sku_id
   drivers/net/wireless/iwl7000/iwlwifi/xvt/xvt.c:1136:37: note: each undeclared identifier is reported only once for each function it appears in


vim +/iwl_xvt_lari_cfg +1126 drivers/net/wireless/iwl7000/iwlwifi/xvt/xvt.c

04073ce5ea4665 Johannes Berg 2023-01-17  1125  
04073ce5ea4665 Johannes Berg 2023-01-17 @1126  void iwl_xvt_lari_cfg(struct iwl_xvt *xvt)
04073ce5ea4665 Johannes Berg 2023-01-17  1127  {
04073ce5ea4665 Johannes Berg 2023-01-17  1128  	int ret;
04073ce5ea4665 Johannes Berg 2023-01-17  1129  	u32 value;
04073ce5ea4665 Johannes Berg 2023-01-17  1130  	struct iwl_lari_config_change_cmd_v6 cmd = {};
04073ce5ea4665 Johannes Berg 2023-01-17  1131  
04073ce5ea4665 Johannes Berg 2023-01-17  1132  	cmd.config_bitmap = iwl_acpi_get_lari_config_bitmap(&xvt->fwrt);
04073ce5ea4665 Johannes Berg 2023-01-17  1133  
04073ce5ea4665 Johannes Berg 2023-01-17  1134  	ret = iwl_acpi_get_dsm_u32(xvt->fwrt.dev, 0,
04073ce5ea4665 Johannes Berg 2023-01-17  1135  				   DSM_FUNC_ENABLE_UNII4_CHAN,
04073ce5ea4665 Johannes Berg 2023-01-17 @1136  				   &iwl_guid, &value);

:::::: The code at line 1126 was first introduced by commit
:::::: 04073ce5ea4665f3505a8e9b085d06856f2a81e4 CHROMIUM: iwl7000: add driver

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Gregory Greenman <gregory.greenman@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
