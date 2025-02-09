Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725AF28FD
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 05:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739079424; cv=none; b=PM3OjqiRqqx02Km9Xr9wuAz9DK+JRB8n2iJ59hc/kj+UDK6pvQlhLMdZmLrBtaM9dq+mf+u85PPGsx6WydW+w1AGKGRJDhsztCKK9zTT15pw/lzOkbz+zSf7Wi1jfESU/V43Z7rccBIhkeG+OHFf+w9SfeCTnMhybpi+6cKjgHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739079424; c=relaxed/simple;
	bh=fGDg+E7VLE2/NeEYuItOU/7BO3k/kSog7Zz5ADtI7Go=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DaCdu6g2wkcgQre5CglgAOY/7GW4ZVxJn5gjdye7yPkiH4r1KQEd9qqSbmYs/tMi/8UFrFT0onULwPQTayFpdRQQFfoRg+A8wMsS9tyxJwlGgjqPrdkhvR4azeVu8kWmfM9p97pv+RwSRUFILYK1lmfYMGgrkr6ozFP9cvHy948=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyI/DVl/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyI/DVl/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739079422; x=1770615422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fGDg+E7VLE2/NeEYuItOU/7BO3k/kSog7Zz5ADtI7Go=;
  b=IyI/DVl/Ukoe19r8oh3ARVgPXa5+W8eIZ9y+ERP2E+ifjMWlPd3MZTl8
   XAIMr1wodZ9e326SiggoP35oie9xagkFiJJKaFJpeNbkD1CXregD/k0Gc
   oHTX3owYnRZILUIg6aTvAu1cNihI4ysefmhqYQxfP7/g1EBScgLC4KLGa
   wjht1FSfME+O3WY+y9l6EWz1tU2wKlS5a7f1M4wFAQx+SCdlvtjxYvOe5
   W1UvFhuXThxQHxy82bNVzNX8CjFgU5JkrMNahVI+obNoPKistCfO3Wu/P
   RMLqcGDm0RZAA9v6xyUYUlzXGX6qfYJFAjeLjVeDSq+P91iIH3a7lslbR
   Q==;
X-CSE-ConnectionGUID: kdm3JsauTS6h9Hg151Fl0g==
X-CSE-MsgGUID: hAcKj6PaSGCRdwu/iCaiaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="62157862"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="62157862"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 21:37:01 -0800
X-CSE-ConnectionGUID: KdhHprv9QnGFeAnwVSR/kA==
X-CSE-MsgGUID: 9lgq1l5jSZyfNaIOA//cbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116486857"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Feb 2025 21:37:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th002-00117Z-03;
	Sun, 09 Feb 2025 05:36:58 +0000
Date: Sun, 9 Feb 2025 13:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: Saeed Mahameed <saeedm@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [djiang:cxl/fwctl 7/25] drivers/fwctl/mlx5/main.c:334:18: error:
 expected ',' or ';' before 'FWCTL'
Message-ID: <202502091359.4eBHf0HN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Saeed,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   2ad713178275250c08fd3df6682dff12d01ff33c
commit: 6cca98fde35c7ebc475ed809427e29de09a0d635 [7/25] fwctl/mlx5: Support for communicating with mlx5 fw
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250209/202502091359.4eBHf0HN-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091359.4eBHf0HN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091359.4eBHf0HN-lkp@intel.com/

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
