Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146A510F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 01:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765503132; cv=none; b=bXb2RX4WNRwOBW5SArrn9h2mZJ8YmGZeAPkZwGSvab8M0TgeOQJiWIw0zgM1UWk3UoXjy+V0vSXwpjbfH1mymfvmBgoddnV0MZAc8UgLcfQar8c1+n5e3hK2Sg5+SjaYmoIYfDonCY8Ebga2vYveVKgeKyDjJVPDk4QeSJ2TcsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765503132; c=relaxed/simple;
	bh=81HglxdnfL+sGYL457kgIuwYADU5P63Ob7/jtKf0c30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LkSB1i95iYm3nPsnqP0ladsrhtifC/EkDteGqcoBU/ns+sxfvOyZLxxy0edPOssW5UR8CKA/FUJZMAHDWCSKPLtZJ7qTDxEenj6t5ewyjeP/qRGv6q2HZ/UyBk9E2YcvJaN1oNUjTby29RUXwbykMwGRizzFKNZToQpxp2esQYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLFPlmRa; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLFPlmRa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765503131; x=1797039131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=81HglxdnfL+sGYL457kgIuwYADU5P63Ob7/jtKf0c30=;
  b=KLFPlmRa49IJqp1w9rU3jofYEkUyyUrmkuHVxscZVkN7ypmwOYXPRCex
   8ghs68X4vYkJftf5YHIfkAGVpeWXDRNKfBO9i0OXPXU8tPMnn91L2v/U0
   loxWWYy8b/A6S1f9Nh9e5qPyBHNQaAzkmK10iFldeA8ohoths2Sieitnd
   BW8D4EC5zq1DU6n+AbBOLUbuz7zZ5MJ3nUshkZBRvEE4IV+F2InTLoMcY
   kJSO6Dfzoyp97DVPSQEt9lkUqZjQ5ViCHAt1anTX2rn4b/z2NHFlQHMcl
   0rC4VFiuqHDqs8vd3BiC1PmCQdREb1EazDXbNo5w0IsiSYarL4GpkHUv9
   A==;
X-CSE-ConnectionGUID: drr0TbCuQ+mDt6rKMq/iFQ==
X-CSE-MsgGUID: DVW4hjLoTlmfzR3uvTq9Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71363433"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71363433"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 17:32:10 -0800
X-CSE-ConnectionGUID: rgZqgY+pRxmRUcP4hFkrVg==
X-CSE-MsgGUID: dNVGY6WHSAeEaK07qgZrtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201858542"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Dec 2025 17:32:08 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTs0s-000000005JT-22zo;
	Fri, 12 Dec 2025 01:32:06 +0000
Date: Fri, 12 Dec 2025 09:31:39 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 35/35]
 drivers/i2c/busses/i2c-lrw-master.c:359:5: warning: no previous prototype
 for 'i2c_lrw_bus_recover'
Message-ID: <202512120947.l7rgXovL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   267508ada711fa80841b65e937e809311ab616dd
commit: 8b9e3db5248ae395a2cb5a960ccd67885cd08601 [35/35] anolis: i2c: Add driver for the LRW I2C
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251212/202512120947.l7rgXovL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120947.l7rgXovL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120947.l7rgXovL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-lrw-master.c:359:5: warning: no previous prototype for 'i2c_lrw_bus_recover' [-Wmissing-prototypes]
     359 | int i2c_lrw_bus_recover(struct i2c_adapter *adap)
         |     ^~~~~~~~~~~~~~~~~~~


vim +/i2c_lrw_bus_recover +359 drivers/i2c/busses/i2c-lrw-master.c

   358	
 > 359	int i2c_lrw_bus_recover(struct i2c_adapter *adap)
   360	{
   361		struct i2c_lrw_dev *dev = i2c_get_adapdata(adap);
   362		int timeout = 1000;
   363		u32 enabled;
   364	
   365		if (dev->abort_source & IC_ABRT_SDA_STUCK_AT_LOW_POS) {
   366			regmap_update_bits(dev->map, LRW_IC_ENABLE,
   367					IC_SDA_STUCK_RECOVERY_ENABLE_POS,
   368					IC_SDA_STUCK_RECOVERY_ENABLE_POS);
   369			do {
   370				regmap_read(dev->map, LRW_IC_ENABLE, &enabled);
   371				if ((enabled & IC_SDA_STUCK_RECOVERY_ENABLE_POS) ==
   372					IC_SDA_STUCK_AT_LOW_RECOVERIED)
   373					break;
   374				udelay(10);
   375			} while (--timeout);
   376	
   377			if (!timeout) {
   378				dev_err(dev->dev, "I2C bus recovery timeout\n");
   379				return -ETIMEDOUT;
   380			}
   381	
   382			dev_err(dev->dev, "I2C hardware recovery complete\n");
   383		}
   384		return 0;
   385	}
   386	EXPORT_SYMBOL_GPL(i2c_lrw_bus_recover);
   387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
