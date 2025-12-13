Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F4726FDBF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 07:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765609213; cv=none; b=h51SIbCFnabvb2p8hNyjeqXbjtqRhi//H2tbh1X8rg2Cea8EWLigD1uDBFQhIPKQeHxe/OjxDzKGrkB+ESXjsnKyquA90+AWT/tLvC7b4Q9X1CyAZR6lT7hYf00DztsVtFK6OybkCcD3qSb5sI7k7vFMsw5kVxCAoqAECk83ris=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765609213; c=relaxed/simple;
	bh=TbHx/TG3gvPIqtFUywlhqJjWTX5ZUxp9QglSpMSDwXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eujhxvYc85qy6xoXAPSoNvRxVLxKxyYho5zQnWrGndAnXbDCI9E/fwVHvMX6nqXMdsY1mZucsg9N+DAICRd8dG9huEWJhcDuzfFdwhB/YqsaJPXSvUvKMHFAGSK0TMYqJbwvYQJz05CMzDeQ3wq03U95hCCjBxwIOohIsuNO8/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nzg2J4Jt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nzg2J4Jt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765609212; x=1797145212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TbHx/TG3gvPIqtFUywlhqJjWTX5ZUxp9QglSpMSDwXY=;
  b=Nzg2J4JtZQjyl4wwsbcDteJPxv1hl2i4uBYNkP4wp4voIm+9GvBCwgGW
   PcEDkCCnjK8K+G2tNXd9GDf06blxD2s8xSWQQeihgW+QbHEZ+VKO9Co7h
   3c0pEebZ4u0DXspV9dFSOmpwBAmNNDzlnJuFQ1UUkUukx5LGAdch/OWph
   5qo7vYPN7cJky/CdD5SurjYTci8cw3TAwbfAQ9ksJBC4weypW5dMaVKja
   7O6aa3y8IoXj6AoRcxzBhNKxMWDbuYu4UOhgIJkHi1KTtS9VOKHzT1j2d
   xf2xnnmbv+OmjOhF4aiAaFDADtU5C0WCEnaoVgvueh0p+NdUKFVyWgvtm
   w==;
X-CSE-ConnectionGUID: fptDmVVgTq6TMQSUlCdOew==
X-CSE-MsgGUID: il5ATTjCRl6m9tik65NWAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85011186"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="85011186"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 23:00:11 -0800
X-CSE-ConnectionGUID: B5RkZhjhRImCsMFFtL1Z6w==
X-CSE-MsgGUID: GaxIGXaQRrSOZmYFgaYtcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="201758203"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Dec 2025 23:00:10 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUJbr-000000007Cx-28PE;
	Sat, 13 Dec 2025 07:00:07 +0000
Date: Sat, 13 Dec 2025 14:59:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alison Schofield <alison.schofield@intel.com>,
	Ben Cheatham <benjamin.cheatham@amd.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: drivers/cxl/core/region.c:753:37: warning: format '%llx' expects
 argument of type 'long long unsigned int', but argument 3 has type
 'resource_size_t' {aka 'unsigned int'}
Message-ID: <202512131450.UZNtWJqM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
commit: d6602e25819dea2c239972e98e09ba5db4aebd22 cxl/region: Add support to indicate region has extended linear cache
date:   6 weeks ago
config: i386-randconfig-051-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131450.UZNtWJqM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131450.UZNtWJqM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131450.UZNtWJqM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cxl/core/region.c: In function 'extended_linear_cache_size_show':
>> drivers/cxl/core/region.c:753:37: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     753 |         return sysfs_emit(buf, "%#llx\n", p->cache_size);
         |                                 ~~~~^     ~~~~~~~~~~~~~
         |                                     |      |
         |                                     |      resource_size_t {aka unsigned int}
         |                                     long long unsigned int
         |                                 %#x


vim +753 drivers/cxl/core/region.c

   741	
   742	static ssize_t extended_linear_cache_size_show(struct device *dev,
   743						       struct device_attribute *attr,
   744						       char *buf)
   745	{
   746		struct cxl_region *cxlr = to_cxl_region(dev);
   747		struct cxl_region_params *p = &cxlr->params;
   748		ssize_t rc;
   749	
   750		ACQUIRE(rwsem_read_intr, rwsem)(&cxl_rwsem.region);
   751		if ((rc = ACQUIRE_ERR(rwsem_read_intr, &rwsem)))
   752			return rc;
 > 753		return sysfs_emit(buf, "%#llx\n", p->cache_size);
   754	}
   755	static DEVICE_ATTR_RO(extended_linear_cache_size);
   756	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
