Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6C6145B3F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 03:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755313259; cv=none; b=SZPp0O3S1SIazuCKKT0Z6IWdnMteniPud3RlfkCoSBqaDUlu+XHYb8tevy4uLF/kcXnwfkeY7XxhGo9AmXhXxVRIdgG/+kfS7LcAhcWcqa3FqnlWNWyUjg8bJLwWF0rRARCaNnnoXsIQP+wEDP5xFzo93oIHff24GVCm6HCecp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755313259; c=relaxed/simple;
	bh=w+6Qp9yB4EeQpd2Cm28IKwVSfPS/8K+yhkxKFaucgMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FnsA7TO6Sup/2Acx7whJIiKZmWW/50UyIHOwW0X4JE/SkrHWal1xjCp6qUCKgD/BozTn2+y5XVesAZGdd5Xd1tN2lpYW7W5MfJGwLINsMwqlrna49Hrh0ed+AsaDDvfn1G1iPjo7ZBJuhv2dGmP2Sh2+H2Hm+bHF3JeORzJZGkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBVdXgs+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBVdXgs+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755313257; x=1786849257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w+6Qp9yB4EeQpd2Cm28IKwVSfPS/8K+yhkxKFaucgMw=;
  b=QBVdXgs+7zuywkvSUYSIk+Zc5hw6A8TJ2h4sjNHeRz6SaKTk+X7qfgVu
   PJfP9Tlj1el/ClNAjWO8lyhmVqmJuhQGTowuOyK3N9AeT0CdeTI0G5ySK
   SZdoeUoBV8PNfNhYluenX6uYaK+1y9wgE1cYhx2vkV/FAcjwVAHS1ZZ1K
   rYG430GNQOc9alhy/rXVAaqkdguUmpfiMH5rb+SL2Na9f/MOKvC/OLe+f
   mi/WCuWrznVNqJZazdaI00L2iOXML1bgH+cMyO077D0i6eyaWKU/iL3VC
   JmyEz9Wml1PRnMaJCDP5oPf7wngv3hDZnjWk3KgpUHJoIVm/W3X6BJC9J
   g==;
X-CSE-ConnectionGUID: 8M4olz2tRqeJM0JSsO4OHg==
X-CSE-MsgGUID: 06blqIx8SpKJNQvAoIOc/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="60257925"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="60257925"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 20:00:56 -0700
X-CSE-ConnectionGUID: Lm2j5XvmQH6xum/BuGBK7g==
X-CSE-MsgGUID: uRjSZFM0SzuwKKrkUHOHLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171271044"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 15 Aug 2025 20:00:55 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un7A4-0000ep-32;
	Sat, 16 Aug 2025 03:00:52 +0000
Date: Sat, 16 Aug 2025 05:00:32 +0200
From: kernel test robot <lkp@intel.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [linux-next:master 1811/2770] drivers/cxl/core/region.c:3664:25:
 warning: format '%llx' expects argument of type 'long long unsigned int',
 but argument 4 has type 'resource_size_t' {aka 'unsigned int'}
Message-ID: <202508160513.NAZ9i9rQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1357b2649c026b51353c84ddd32bc963e8999603
commit: c3dd67681c70cc95cc2c889b1b58a1667bb1c48b [1811/2770] cxl/region: Add inject and clear poison by region offset
config: i386-buildonly-randconfig-2001-20250813 (https://download.01.org/0day-ci/archive/20250816/202508160513.NAZ9i9rQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160513.NAZ9i9rQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160513.NAZ9i9rQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/cxl/core/region.c:6:
   drivers/cxl/core/region.c: In function 'validate_region_offset':
>> drivers/cxl/core/region.c:3664:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    3664 |                         "Offset %#llx is within extended linear cache %#llx\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/cxl/core/region.c:3663:17: note: in expansion of macro 'dev_err'
    3663 |                 dev_err(&cxlr->dev,
         |                 ^~~~~~~
   drivers/cxl/core/region.c:3664:75: note: format string is defined here
    3664 |                         "Offset %#llx is within extended linear cache %#llx\n",
         |                                                                       ~~~~^
         |                                                                           |
         |                                                                           long long unsigned int
         |                                                                       %#x
   drivers/cxl/core/region.c:3671:37: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    3671 |                 dev_err(&cxlr->dev, "Offset %#llx exceeds region size %#llx\n",
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/cxl/core/region.c:3671:17: note: in expansion of macro 'dev_err'
    3671 |                 dev_err(&cxlr->dev, "Offset %#llx exceeds region size %#llx\n",
         |                 ^~~~~~~
   drivers/cxl/core/region.c:3671:75: note: format string is defined here
    3671 |                 dev_err(&cxlr->dev, "Offset %#llx exceeds region size %#llx\n",
         |                                                                       ~~~~^
         |                                                                           |
         |                                                                           long long unsigned int
         |                                                                       %#x


vim +3664 drivers/cxl/core/region.c

  3655	
  3656	static int validate_region_offset(struct cxl_region *cxlr, u64 offset)
  3657	{
  3658		struct cxl_region_params *p = &cxlr->params;
  3659		resource_size_t region_size;
  3660		u64 hpa;
  3661	
  3662		if (offset < p->cache_size) {
  3663			dev_err(&cxlr->dev,
> 3664				"Offset %#llx is within extended linear cache %#llx\n",
  3665				offset, p->cache_size);
  3666			return -EINVAL;
  3667		}
  3668	
  3669		region_size = resource_size(p->res);
  3670		if (offset >= region_size) {
  3671			dev_err(&cxlr->dev, "Offset %#llx exceeds region size %#llx\n",
  3672				offset, region_size);
  3673			return -EINVAL;
  3674		}
  3675	
  3676		hpa = p->res->start + offset;
  3677		if (hpa < p->res->start || hpa > p->res->end) {
  3678			dev_err(&cxlr->dev, "HPA %#llx not in region %pr\n", hpa,
  3679				p->res);
  3680			return -EINVAL;
  3681		}
  3682	
  3683		return 0;
  3684	}
  3685	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
