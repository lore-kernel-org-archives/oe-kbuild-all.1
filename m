Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21CC13D268
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 11:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714478140; cv=none; b=HcxHZKCPDEYpJTmlm5widWkLA3nUm+mIztaeHmXh8pUlBodIkNIbUG0+aOmMPuhkIB8dg25JpuuDKb/BaUdB9HLotBoO48YLm8ZyGGCN2umKDwMPC7pRq5v5AUfuZ4b1JvxSE7ctDZX3SK+UY6agfg57NMTbwvCsrbbTH60NyyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714478140; c=relaxed/simple;
	bh=fzI+DDrSJmFaKqohnWm0ScvIqud6fBxxveGOPxryGmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bgno2oWrSHjkCIho0uQ0XYxSsR6K2+K8WBWrBh9w94XwR3sXyaREbluuuC8EiF/QJcEj5OoCgGxNcT3Ky4iaQeQP5SkOSjbXhwe+CdIHnfgjO17EBdPP4sv2Ty9iW1N8ti8Tv+3TD5BF65W8ZOSlEfOMF9KXAy+yaH6mPbTHUIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JD/lOCt3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JD/lOCt3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714478138; x=1746014138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fzI+DDrSJmFaKqohnWm0ScvIqud6fBxxveGOPxryGmQ=;
  b=JD/lOCt3DqTLjbhUD62/8Q9a1n00HuRbALursALqykLVQ8EXqvwJyYBD
   MblzVXTDK33x/QzgZxqIEBAsMdpch5LiKD74c8tn23smMJEbFRf4Mc67M
   G6JMz4vaglqmRUNL8znXJQFE6SyjkGRO3GRnqKXCQ7Zo0kPW10abSHbwB
   KN/HY3AT9cGpfgdpg8r+jh2fj0ULjm2TFT7YYU9mHk6aMb8Az0r+VRrnS
   0ApU82u3PH2oewbTmuUqK+hACekJJSJ5/zn1oI+OzrUEIb4FzS4TeP7uT
   EhAfSNPmZh8xutfdm+Umx27F6HApfGgAWKFwUIhfGf3HNnwizal7ETIHW
   w==;
X-CSE-ConnectionGUID: ZFKLIEntQtG5WRoktHTBvQ==
X-CSE-MsgGUID: ydCb8f5ITa+Q/+nGXb3P4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13963321"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="13963321"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 04:55:38 -0700
X-CSE-ConnectionGUID: RMt6W02aTvWRSNPrFKROdQ==
X-CSE-MsgGUID: adNoMK83RpCA3W20eMxxjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="31247564"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Apr 2024 04:55:36 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1m58-00085z-1h;
	Tue, 30 Apr 2024 11:55:34 +0000
Date: Tue, 30 Apr 2024 19:55:30 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5950/11728]
 drivers/firmware/imx/sm-misc.c:17:5: warning: no previous prototype for
 'scmi_imx_misc_ctrl_set'
Message-ID: <202404301937.NSTo56ZD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: d482cb8ff9593b82d549bcebb1fa406494ab96f9 [5950/11728] LF-10712-2 firmware: imx: add i.MX SM MISC driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240430/202404301937.NSTo56ZD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404301937.NSTo56ZD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301937.NSTo56ZD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/imx/sm-misc.c:17:5: warning: no previous prototype for 'scmi_imx_misc_ctrl_set' [-Wmissing-prototypes]
      17 | int scmi_imx_misc_ctrl_set(u32 id, u32 val)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/imx/sm-misc.c:26:5: warning: no previous prototype for 'scmi_imx_misc_ctrl_get' [-Wmissing-prototypes]
      26 | int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/scmi_imx_misc_ctrl_set +17 drivers/firmware/imx/sm-misc.c

    16	
  > 17	int scmi_imx_misc_ctrl_set(u32 id, u32 val)
    18	{
    19		if (!ph)
    20			return -EPROBE_DEFER;
    21	
    22		return imx_misc_ctrl_ops->misc_ctrl_set(ph, id, 1, &val);
    23	};
    24	EXPORT_SYMBOL(scmi_imx_misc_ctrl_set);
    25	
  > 26	int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
    27	{
    28		if (!ph)
    29			return -EPROBE_DEFER;
    30	
    31		return imx_misc_ctrl_ops->misc_ctrl_get(ph, id, num, val);
    32	}
    33	EXPORT_SYMBOL(scmi_imx_misc_ctrl_get);
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
