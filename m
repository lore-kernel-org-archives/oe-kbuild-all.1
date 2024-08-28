Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2237D189511
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 19:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724874749; cv=none; b=EMQ5GrfWfPjoVc7HTDdaOBN1Y7NxHf8fOH9ltDy9wtzM5Imlmc+zgz391gwiyvQyMxvFd+prmNGQSPgpHwySp5FlthiMmi431niWkxlsFoQLiWBZ/NHVZ7lw4mZ45d3FmXobZ8cYxo5HIjXTgT6i2DaMvrFGxGdv4IQRFa9NGRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724874749; c=relaxed/simple;
	bh=tJM5F6cGjYlhhGT3rmD4SF5TkqVtRvF0wklUNT6aRv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UeK20J5pUWOoeaXXlpm8Z8Oqv4QLtXdTBxzenSJpw7tCHDL5XGBmn8qVZuxetnAPQrw/AbKxmB/mNj+sSFUR5LcEKrBhG+KRJG8/VE+J8vky2kU6LFvoFHZyM2opkYz2pJWeqVWuN3XeNu4hWeNbWN95IbiiqoH0k64iSu7BcxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZPVExvM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZPVExvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724874748; x=1756410748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tJM5F6cGjYlhhGT3rmD4SF5TkqVtRvF0wklUNT6aRv4=;
  b=cZPVExvMKve9nOxuHiAqDP/LMl4Gq3hGy5Qv5amWpZf7rkb9+IPCSafc
   NHWuOaVcDyaXWVW8eJDPh+WC1Ct8w2+5NSatSll5rOaSZmc5oE6IQSb1E
   U7XarZmB4K3GKwCzlj1zuFxHNotvRZ6CLlGn8Zuo4Ej1qRGDdHO5rfocI
   c6I0NFlu92xgL9/9Yu4OYlnyMnIU3xoEUo+JIrpXIt+Y1JFW9hFNVVjub
   bV7E9Px5/VgF1kBWqmpsmu2Ib3sDb9lIEzwfPfE5L8h8W5X3aF5XqFrfZ
   7vxM4DIwcXJ3nrDgtfNWRMXRC0DLdeSJ64xjx5H+xj8nXAkspl/E75mAz
   g==;
X-CSE-ConnectionGUID: /etdM795SA6sYAzqEi4Hhw==
X-CSE-MsgGUID: LGrwUWYOQHGePlilBL3pyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34586233"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="34586233"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 12:52:27 -0700
X-CSE-ConnectionGUID: SqA0LdVYQnCU3uQG587njQ==
X-CSE-MsgGUID: RD5XQlluRy2svaH9gBLkkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="94145350"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Aug 2024 12:52:25 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjOiN-000LId-1L;
	Wed, 28 Aug 2024 19:52:23 +0000
Date: Thu, 29 Aug 2024 03:52:06 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [sudeep-holla:for-next/scmi/updates 23/31]
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c:309:20: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202408290328.HuNtRAPV-lkp@intel.com>
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
commit: f5835f85bba362d4cb8cda547006dc2d9fc8f8d8 [23/31] firmware: arm_scmi: add initial support for i.MX BBM protocol
config: sparc-randconfig-r121-20240828 (https://download.01.org/0day-ci/archive/20240829/202408290328.HuNtRAPV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240829/202408290328.HuNtRAPV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408290328.HuNtRAPV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c:309:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned long @@
   drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c:309:20: sparse:     expected restricted __le32 [usertype] flags
   drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c:309:20: sparse:     got unsigned long

vim +309 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c

   291	
   292	static int scmi_imx_bbm_rtc_alarm_set(const struct scmi_protocol_handle *ph,
   293					      u32 rtc_id, bool enable, u64 sec)
   294	{
   295		struct scmi_imx_bbm_info *pi = ph->get_priv(ph);
   296		struct scmi_imx_bbm_alarm_time *cfg;
   297		struct scmi_xfer *t;
   298		int ret;
   299	
   300		if (rtc_id >= pi->nr_rtc)
   301			return -EINVAL;
   302	
   303		ret = ph->xops->xfer_get_init(ph, IMX_BBM_RTC_ALARM_SET, sizeof(*cfg), 0, &t);
   304		if (ret)
   305			return ret;
   306	
   307		cfg = t->tx.buf;
   308		cfg->id = cpu_to_le32(rtc_id);
 > 309		cfg->flags = enable ? SCMI_IMX_BBM_RTC_ALARM_ENABLE_FLAG : 0;
   310		cfg->value_low = cpu_to_le32(lower_32_bits(sec));
   311		cfg->value_high = cpu_to_le32(upper_32_bits(sec));
   312	
   313		ret = ph->xops->do_xfer(ph, t);
   314	
   315		ph->xops->xfer_put(ph, t);
   316	
   317		return ret;
   318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
