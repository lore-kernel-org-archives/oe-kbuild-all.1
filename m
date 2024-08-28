Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C216745C1C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 21:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724879673; cv=none; b=Fk5H9ptULQOoj9HM18NHW7A9nETqOwNSZC9XalGr4nGun6S5sOZQWn7VqpPpAh2x77MDB69hVWmdECq1sY/CG9qFIH1TwKb+JkoMyM001jX1gLxCyV46SiW/BwXj9nRF/e43r9yBO5OuevN/g6+9pSl5i9WiBB3nz3uEFhr6jXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724879673; c=relaxed/simple;
	bh=BGNLA8OgXbDwIgQyvKzvKHX/APYGvJdhb6ArVHOMnCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M8zOS3cCLICw0SKW235q9tOaue6pL0wexqna/WYBMbDrzoGJmAe1MwSZl7vsNcb2+24Q5OYJrTFGv3lq5h00QSNTvXqNYk1Sp9ZYsHvIaIbswu7ZKkuPUeyJl21bcvxA49c81sofWBxg9AbBLmYJ1tIyT36Vhl3YgfjIwPK9BmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k18O6xO/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k18O6xO/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724879672; x=1756415672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BGNLA8OgXbDwIgQyvKzvKHX/APYGvJdhb6ArVHOMnCc=;
  b=k18O6xO/1U4nfBfKrKUJFVGvegn3WzIO5CiW7ZEo2xBJIws9TsqZT33h
   5WpMiykP2ou0y/3SjxW25Sf9GktqNYLqn+QwPQGmUz+7uukXGLP2kabKg
   uM7HzEjeZdJ13rcwXCeeTAKLmwj3/TbRre/9WPh3xzWSNffAhU9iEIe/B
   EPuxVtsj+Lp/uQJeMNe/giTnJRS10MHJeTcYZ7xWMeG3bFh8g5Y+ZYG5E
   9hTf9rLQ1MOb6k17aoeiqSce9oqeigNzB6ROLUNKxpoSJGgejvikeMzs7
   hE+DtvmiLDjwuVrvZk91PI0Bx30JMXRUaNvsF0KUW2invsPVvgLwYjWrw
   g==;
X-CSE-ConnectionGUID: hEXb4riKRK+1/D1FIJYm1Q==
X-CSE-MsgGUID: cBfMNDO9TbSVVFHIBvHgHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23303522"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="23303522"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 14:14:32 -0700
X-CSE-ConnectionGUID: PlPoWMWjSrCd0q+eo9Znhw==
X-CSE-MsgGUID: 4s6Mx7KFTW6DpmoVP6mlbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63420739"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Aug 2024 14:14:29 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjPzn-000LMo-27;
	Wed, 28 Aug 2024 21:14:27 +0000
Date: Thu, 29 Aug 2024 05:13:46 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [sudeep-holla:for-next/scmi/updates 24/31]
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c:171:20: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202408290526.ymfAZZ88-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git for-next/scmi/updates
head:   c49438109fd362dd5eb47fbf8a325d13b1c271b6
commit: 00bdb213e944386bd6d424213726ac2b303fe87c [24/31] firmware: arm_scmi: add initial support for i.MX MISC protocol
config: sparc-randconfig-r121-20240828 (https://download.01.org/0day-ci/archive/20240829/202408290526.ymfAZZ88-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240829/202408290526.ymfAZZ88-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408290526.ymfAZZ88-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c:171:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int ctrl_id @@     got restricted __le32 const [usertype] ctrl_id @@
   drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c:171:20: sparse:     expected unsigned int ctrl_id
   drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c:171:20: sparse:     got restricted __le32 const [usertype] ctrl_id
>> drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c:172:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int flags @@     got restricted __le32 const [usertype] flags @@
   drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c:172:18: sparse:     expected unsigned int flags
   drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c:172:18: sparse:     got restricted __le32 const [usertype] flags

vim +171 drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c

   157	
   158	static void *
   159	scmi_imx_misc_ctrl_fill_custom_report(const struct scmi_protocol_handle *ph,
   160					      u8 evt_id, ktime_t timestamp,
   161					      const void *payld, size_t payld_sz,
   162					      void *report, u32 *src_id)
   163	{
   164		const struct scmi_imx_misc_ctrl_notify_payld *p = payld;
   165		struct scmi_imx_misc_ctrl_notify_report *r = report;
   166	
   167		if (sizeof(*p) != payld_sz)
   168			return NULL;
   169	
   170		r->timestamp = timestamp;
 > 171		r->ctrl_id = p->ctrl_id;
 > 172		r->flags = p->flags;
   173		if (src_id)
   174			*src_id = r->ctrl_id;
   175		dev_dbg(ph->dev, "%s: ctrl_id: %d flags: %d\n", __func__,
   176			r->ctrl_id, r->flags);
   177	
   178		return r;
   179	}
   180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
