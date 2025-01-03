Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88113191F89
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 06:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735886844; cv=none; b=r+5V4qXPvNkKYzEiaY13rNYmcAyfrhOOb1pKdcQ0XUBwa9q2JQDc9YHVRCIOl1RYMwAKhwJWJr/DBtlChhy+K2waJ1oUiVSgFsfJZFcDe+3+RWB60YvWMouX6wFZmmNNi+eYmkK+jDPiVGWd1HLQWTq0T28DMld/QdiKOmKZbKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735886844; c=relaxed/simple;
	bh=PlCb/VPbrPyvhCOCotXcH6GhEpC2hwKds9nSJmheEvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jiPgf3oVI5fw3YfIhKfXCnc+dnJx6n7w9I5ZGb3bZOW+TeU1lRRIuQ5LnF0y3rmCGjWGisrFX8F83ikk19WDm8Wq3FAlC+Np31InM2+OR9u8Z3eLtX0b0shsedDINGcuTOcpgozFLo18dR2eLP+BfdrTExr3Tp+vf0lK2QFkI0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kAJDFaSu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAJDFaSu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735886842; x=1767422842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PlCb/VPbrPyvhCOCotXcH6GhEpC2hwKds9nSJmheEvY=;
  b=kAJDFaSuDHaP1gZm73+ta8JnK/sujtpGSrgUoIG5KRIbryxmVY5m2K78
   e1IX714RQAJ/G3qeVvqAbxt7qqkeyL0xrejRnPCFFr+dDzXmDx/MBi32N
   robGJK/xdsWqmAYhX8dgcHTr/OXEuS6qhWjfUOXz6x44BL5cTXrM8ULh0
   3CkPLeVphPktYUpHQTx+5igdKDx5Px+YlEpDPvOZC2S+iKbe0aOT2xeq1
   GqMxwxXRA8cyBPAR0uZJUVbTQ2aFMB/b5m4jzFoRRZ7SbEr6xsZlZ7EF+
   kzxj6w9xBSaFioWSrAj0Zs0rSbZxz3dkly7VsxT7X/HoL4gLh1va2NENS
   g==;
X-CSE-ConnectionGUID: rC0huCp6QrKWouPd//n2iA==
X-CSE-MsgGUID: 6KrlWfG5Srawy6PWSey/UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="46627216"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="46627216"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 22:47:21 -0800
X-CSE-ConnectionGUID: 9YA3oLl2QbWKOubGoNhlQw==
X-CSE-MsgGUID: polyjMviQ4WF10+fnB1rOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124997600"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Jan 2025 22:47:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTbSn-0009LD-1C;
	Fri, 03 Jan 2025 06:47:17 +0000
Date: Fri, 3 Jan 2025 14:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Saeed Mahameed <saeedm@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [djiang:cxl/fwctl 7/28] drivers/fwctl/mlx5/main.c:334:18: error:
 expected ',' or ';' before 'FWCTL'
Message-ID: <202501031447.M6SEtiBK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   50c59ffd9367d000b9a4fe2ef9a587a2e81f287f
commit: 6cca98fde35c7ebc475ed809427e29de09a0d635 [7/28] fwctl/mlx5: Support for communicating with mlx5 fw
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250103/202501031447.M6SEtiBK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031447.M6SEtiBK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031447.M6SEtiBK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:22,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/fwctl.h:7,
                    from drivers/fwctl/mlx5/main.c:5:
>> drivers/fwctl/mlx5/main.c:334:18: error: expected ',' or ';' before 'FWCTL'
     334 | MODULE_IMPORT_NS(FWCTL);
         |                  ^~~~~
   include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_INFO'
      26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
         |                                                             ^~~~
   include/linux/module.h:299:33: note: in expansion of macro 'MODULE_INFO'
     299 | #define MODULE_IMPORT_NS(ns)    MODULE_INFO(import_ns, ns)
         |                                 ^~~~~~~~~~~
   drivers/fwctl/mlx5/main.c:334:1: note: in expansion of macro 'MODULE_IMPORT_NS'
     334 | MODULE_IMPORT_NS(FWCTL);
         | ^~~~~~~~~~~~~~~~


vim +334 drivers/fwctl/mlx5/main.c

   333	
 > 334	MODULE_IMPORT_NS(FWCTL);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
