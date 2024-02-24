Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34F417580
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708762777; cv=none; b=lTwCFIbksllsfYCvxz5J9dQoFFNiSQ4NJyFJC9C+5ttX+3Ink+QQ5jLS6xq31O4kUFXsJqOPcMIvqm7w2htKAMJcnxoF4hdTNfKbH8jsnL47ZhChNeCz6M6/AHLEIyB7sOctSbgJZ6sfkuDT19YJx3O22zVsOWsMLiDpEj866HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708762777; c=relaxed/simple;
	bh=MTGTVqTWikiJktNNIt4p0VRpkebwwY00Aw4gDH5nHsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GLNXeX07GssYhdPlKnVq58IMPSCNg1ANZNvXLNnkhjdnP9YlA5W+uSO6EVqV8ybRhvi3I/OU58BSVv8LlwRzZNR2dU3uPlJxFNbXObc9e08QMX03V1eytT/eLoR/u5OYNBr9L7W4ukluBTy6XRqAp/As7nM59w8fmXXB48jRTAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GrnMJz3O; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GrnMJz3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708762775; x=1740298775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MTGTVqTWikiJktNNIt4p0VRpkebwwY00Aw4gDH5nHsI=;
  b=GrnMJz3OlBKDgp8V+96t7EYGwBuEvLw3h9M6mwh7HEI6DuqyYOryJdlp
   4nzAtboyw5zCTHtSgIfBnyVN/Ksyqmv3RdI+JFdYwAWssLtoGUsVHLx/p
   nxTaCcDkaiTsOb8E667kt8rn/Yvwe6F6aMo3t+rcY2unslwPW0gxZfO7i
   HpA50N06dCFXbVo1ce1XGmF/hO0IOhbqbWOCGMqAN4hH37S0N7Xi2NSvR
   c52aRcQqKvAs63vXl7sZb3fb1uencjGEm4ZSdDcgVx1oSICzLlJL7K/YN
   /X6aRIpmUEEOgxDmlrNG24z1XXOOPVScDLNLId/gbmi3XOpcXya1vrrwX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="20641341"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="20641341"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 00:19:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6158019"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Feb 2024 00:19:31 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdnFo-0008NA-1o;
	Sat, 24 Feb 2024 08:19:28 +0000
Date: Sat, 24 Feb 2024 16:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.phytium 26/41]
 drivers/char/ipmi/bt_bmc_phytium.c:87:35: warning: 'bt_regmap_cfg' defined
 but not used
Message-ID: <202402241634.pFVmMEgi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.phytium
head:   974a90e098c75ef0e62d4bbbde4535368a61f98b
commit: c05d916e6495c70327120617381acf6877e43cf5 [26/41] Add Phytium BT BMC driver support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240224/202402241634.pFVmMEgi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241634.pFVmMEgi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241634.pFVmMEgi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/ipmi/bt_bmc_phytium.c:87:35: warning: 'bt_regmap_cfg' defined but not used [-Wunused-const-variable=]
      87 | static const struct regmap_config bt_regmap_cfg = {
         |                                   ^~~~~~~~~~~~~


vim +/bt_regmap_cfg +87 drivers/char/ipmi/bt_bmc_phytium.c

    86	
  > 87	static const struct regmap_config bt_regmap_cfg = {
    88		.reg_bits = 32,
    89		.val_bits = 32,
    90		.reg_stride = 4,
    91	};
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
