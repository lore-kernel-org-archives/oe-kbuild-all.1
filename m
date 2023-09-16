Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1081426B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 13:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694870201; x=1726406201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JxbzpYVN521YHhqcI4SHspUSz+oF7VEr3ENcG2aE+Dc=;
  b=lluadN2Uxst7s+z8ambaln8xv7IxsL6ZiqUBrgYegXhGcyGc1w6ZSOh6
   GoQkE9Fb6mPi1feeZWQM5V1WW57x+xlceTv8oGjFNE/StnkaCME+exHuG
   vKCdN0JtVV6RprJWo3MB96Gjg0bU3vQniXRV9D1tZjbXi4IgYHZK6LEYa
   lEmhXTOtz81zftBhvIAiiM1WYg9RKIxryv2Np/759MM2+pCCjACGKFr9J
   HhBhIygwglmeGhys5T4hcFdYWD7WSLY6CAYepLKUv+Cijmp++7+ommBko
   6ZGWQWU1dyoN+DJZpX1G3xU0rO0+sch22eadXHXVz7Y5OWoKQal+BXUlW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="359662001"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="359662001"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 06:16:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="780421605"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="780421605"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Sep 2023 06:16:38 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhVA4-0004JK-1B;
	Sat, 16 Sep 2023 13:16:36 +0000
Date: Sat, 16 Sep 2023 21:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: drivers/power/supply/qcom_battmgr.c:357:31: sparse: sparse:
 incorrect type in initializer (different base types)
Message-ID: <202309162149.4owm9iXc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   57d88e8a5974644039fbc47806bac7bb12025636
commit: 29e8142b5623b5949587bcc4f591c4e6595c4aca power: supply: Introduce Qualcomm PMIC GLINK power supply
date:   7 months ago
config: i386-randconfig-062-20230916 (https://download.01.org/0day-ci/archive/20230916/202309162149.4owm9iXc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309162149.4owm9iXc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309162149.4owm9iXc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/power/supply/qcom_battmgr.c:357:31: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] battery_id @@     got restricted __le32 [usertype] @@
   drivers/power/supply/qcom_battmgr.c:357:31: sparse:     expected unsigned int [usertype] battery_id
   drivers/power/supply/qcom_battmgr.c:357:31: sparse:     got restricted __le32 [usertype]
   drivers/power/supply/qcom_battmgr.c:369:31: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] battery_id @@     got restricted __le32 [usertype] @@
   drivers/power/supply/qcom_battmgr.c:369:31: sparse:     expected unsigned int [usertype] battery_id
   drivers/power/supply/qcom_battmgr.c:369:31: sparse:     got restricted __le32 [usertype]
>> drivers/power/supply/qcom_battmgr.c:1286:30: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] owner @@     got int @@
   drivers/power/supply/qcom_battmgr.c:1286:30: sparse:     expected restricted __le32 [usertype] owner
   drivers/power/supply/qcom_battmgr.c:1286:30: sparse:     got int
>> drivers/power/supply/qcom_battmgr.c:1287:29: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/power/supply/qcom_battmgr.c:1287:29: sparse:     expected restricted __le32 [usertype] type
   drivers/power/supply/qcom_battmgr.c:1287:29: sparse:     got int
>> drivers/power/supply/qcom_battmgr.c:1288:31: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] opcode @@     got int @@
   drivers/power/supply/qcom_battmgr.c:1288:31: sparse:     expected restricted __le32 [usertype] opcode
   drivers/power/supply/qcom_battmgr.c:1288:31: sparse:     got int

vim +357 drivers/power/supply/qcom_battmgr.c

   350	
   351	static int qcom_battmgr_update_status(struct qcom_battmgr *battmgr)
   352	{
   353		struct qcom_battmgr_update_request request = {
   354			.hdr.owner = cpu_to_le32(PMIC_GLINK_OWNER_BATTMGR),
   355			.hdr.type = cpu_to_le32(PMIC_GLINK_REQ_RESP),
   356			.hdr.opcode = cpu_to_le32(BATTMGR_BAT_STATUS),
 > 357			.battery_id = cpu_to_le32(0),
   358		};
   359	
   360		return qcom_battmgr_request(battmgr, &request, sizeof(request));
   361	}
   362	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
