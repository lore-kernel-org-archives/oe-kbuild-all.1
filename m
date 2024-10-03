Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CBC1C0DCB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 21:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727992498; cv=none; b=OHaMEgsYNlnLrfwICBu5YiMnn0XL3gHI7SZ/EWEF49AnnrmBTczzVWeDfTaOH3Dggg5fkLOmdV2/TBWqAm5+8yMYzfCO20mtVuliKfr7/a1fSjprJS7EFqN4+nrPJilPJPiDFuh2eOyyv8JdKatIIEZFqRtdgO25q8aHwc+jDLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727992498; c=relaxed/simple;
	bh=/EkxeJcn2kHbcFgwCLh1q6gtl/z2vqQu6UD14Qa+Jsk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rDAYOnq1IDeMj15BAOObYUviSvHHDHIIm/3o6694BbZyIVDi1/qNyDerZaFco9G7AE5rimM3Xaq4s7uNmraxr/Uv6LRgcmYwUfaIpGZF+Z7CfTkkb0E+KBUQ/Co8zowgT6AnO0wS0fvHA64ZIsIzZqzMZ8hzMIxn2guEptICW44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZFicYUQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZFicYUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727992495; x=1759528495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/EkxeJcn2kHbcFgwCLh1q6gtl/z2vqQu6UD14Qa+Jsk=;
  b=nZFicYUQDJRQF4JrT3NBf3ps+foTEEP9GPpl1tk3HGppSb5qc+qdk6UT
   m3u95/X2pVV56DRzyKHrrLSAthCnFT9LtJE5AIjI75WISK6c5gK9+UJaD
   6GIgQDJV/cuBClFGG2U54EsiVY9T3e1yZeWUS0HCkLcEfKSbEooyII2tk
   vqUEl7KMW2MpYf2gsMIOJPLxYYEk5XsrPrxofrLVV6wfVGiMm0PcV2Uwt
   XJgACOESjItajH6S/U421rCoke7hunEijpbg/kiWkJLncz9zQLt6Van/F
   6wL6SqgrDXLC5OxkWvircre418llpVn5zZSXpqueFcNM2EJMi6GRmlbOI
   A==;
X-CSE-ConnectionGUID: DX23OdiWScCYpx6qCU9spA==
X-CSE-MsgGUID: PrwyfWUHS96Dp7PtAdJGtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37869284"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="37869284"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 14:54:54 -0700
X-CSE-ConnectionGUID: vbC9YDiIS6GeV9JRmxqQ2Q==
X-CSE-MsgGUID: mmjfUbtpSqOWnT56CAOnWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="74927113"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Oct 2024 14:54:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swTmd-0000wS-0M;
	Thu, 03 Oct 2024 21:54:51 +0000
Date: Fri, 4 Oct 2024 05:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-v4-2024-10-01 14/29] drivers/cxl/core/memdev.c:561:1:
 sparse: sparse: symbol 'dc0_size' was not declared. Should it be static?
Message-ID: <202410040504.KVUMSGPq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-10-01
head:   c240cf80afe13145f312562d144a7a60314806b0
commit: 968f1589bd99c93219d765ee628cdd69bf45271e [14/29] cxl/mem: Expose DCD partition capabilities in sysfs
config: x86_64-randconfig-121-20241004 (https://download.01.org/0day-ci/archive/20241004/202410040504.KVUMSGPq-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040504.KVUMSGPq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040504.KVUMSGPq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/memdev.c:561:1: sparse: sparse: symbol 'dc0_size' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:561:1: sparse: sparse: symbol 'dc0_read_only' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:561:1: sparse: sparse: symbol 'dc0_shareable' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:561:1: sparse: sparse: symbol 'dc0_qos_class' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:562:1: sparse: sparse: symbol 'dc1_size' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:562:1: sparse: sparse: symbol 'dc1_read_only' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:562:1: sparse: sparse: symbol 'dc1_shareable' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:562:1: sparse: sparse: symbol 'dc1_qos_class' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:563:1: sparse: sparse: symbol 'dc2_size' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:563:1: sparse: sparse: symbol 'dc2_read_only' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:563:1: sparse: sparse: symbol 'dc2_shareable' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:563:1: sparse: sparse: symbol 'dc2_qos_class' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:564:1: sparse: sparse: symbol 'dc3_size' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:564:1: sparse: sparse: symbol 'dc3_read_only' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:564:1: sparse: sparse: symbol 'dc3_shareable' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:564:1: sparse: sparse: symbol 'dc3_qos_class' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:565:1: sparse: sparse: symbol 'dc4_size' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:565:1: sparse: sparse: symbol 'dc4_read_only' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:565:1: sparse: sparse: symbol 'dc4_shareable' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:565:1: sparse: sparse: symbol 'dc4_qos_class' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:566:1: sparse: sparse: symbol 'dc5_size' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:566:1: sparse: sparse: symbol 'dc5_read_only' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:566:1: sparse: sparse: symbol 'dc5_shareable' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:566:1: sparse: sparse: symbol 'dc5_qos_class' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:567:1: sparse: sparse: symbol 'dc6_size' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:567:1: sparse: sparse: symbol 'dc6_read_only' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:567:1: sparse: sparse: symbol 'dc6_shareable' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:567:1: sparse: sparse: symbol 'dc6_qos_class' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:568:1: sparse: sparse: symbol 'dc7_size' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:568:1: sparse: sparse: symbol 'dc7_read_only' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:568:1: sparse: sparse: symbol 'dc7_shareable' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:568:1: sparse: sparse: symbol 'dc7_qos_class' was not declared. Should it be static?

vim +/dc0_size +561 drivers/cxl/core/memdev.c

   482	
   483	#define CXL_MEMDEV_DC_ATTR_GROUP(n)						\
   484	static ssize_t dc##n##_size_show(struct device *dev,				\
   485					 struct device_attribute *attr,			\
   486					 char *buf)					\
   487	{										\
   488		return show_size_dcN(to_cxl_memdev(dev), buf, (n));			\
   489	}										\
   490	struct device_attribute dc##n##_size = {					\
   491		.attr	= { .name = "size", .mode = 0444 },				\
   492		.show	= dc##n##_size_show,						\
   493	};										\
   494	static ssize_t dc##n##_read_only_show(struct device *dev,			\
   495					      struct device_attribute *attr,		\
   496					      char *buf)				\
   497	{										\
   498		return show_read_only_dcN(to_cxl_memdev(dev), buf, (n));		\
   499	}										\
   500	struct device_attribute dc##n##_read_only = {					\
   501		.attr	= { .name = "read_only", .mode = 0444 },			\
   502		.show	= dc##n##_read_only_show,					\
   503	};										\
   504	static ssize_t dc##n##_shareable_show(struct device *dev,			\
   505					     struct device_attribute *attr,		\
   506					     char *buf)					\
   507	{										\
   508		return show_shareable_dcN(to_cxl_memdev(dev), buf, (n));		\
   509	}										\
   510	struct device_attribute dc##n##_shareable = {					\
   511		.attr	= { .name = "shareable", .mode = 0444 },			\
   512		.show	= dc##n##_shareable_show,					\
   513	};										\
   514	static ssize_t dc##n##_qos_class_show(struct device *dev,			\
   515					      struct device_attribute *attr,		\
   516					      char *buf)				\
   517	{										\
   518		return show_qos_class_dcN(to_cxl_memdev(dev), buf, (n));		\
   519	}										\
   520	struct device_attribute dc##n##_qos_class = {					\
   521		.attr	= { .name = "qos_class", .mode = 0444 },			\
   522		.show	= dc##n##_qos_class_show,					\
   523	};										\
   524	static struct attribute *cxl_memdev_dc##n##_attributes[] = {			\
   525		&dc##n##_size.attr,							\
   526		&dc##n##_read_only.attr,						\
   527		&dc##n##_shareable.attr,						\
   528		&dc##n##_qos_class.attr,						\
   529		NULL,									\
   530	};										\
   531	static umode_t cxl_memdev_dc##n##_attr_visible(struct kobject *kobj,		\
   532						       struct attribute *a,		\
   533						       int pos)				\
   534	{										\
   535		struct device *dev = kobj_to_dev(kobj);					\
   536		struct cxl_memdev *cxlmd = to_cxl_memdev(dev);				\
   537		struct cxl_memdev_state *mds = to_cxl_memdev_state(cxlmd->cxlds);	\
   538											\
   539		/* Not a memory device */						\
   540		if (!mds)								\
   541			return 0;							\
   542		return a->mode;								\
   543	}										\
   544	static umode_t cxl_memdev_dc##n##_group_visible(struct kobject *kobj)		\
   545	{										\
   546		struct device *dev = kobj_to_dev(kobj);					\
   547		struct cxl_memdev *cxlmd = to_cxl_memdev(dev);				\
   548		struct cxl_memdev_state *mds = to_cxl_memdev_state(cxlmd->cxlds);	\
   549											\
   550		/* Not a memory device or partition not supported */			\
   551		if (!mds || n >= mds->nr_dc_region)					\
   552			return false;							\
   553		return true;								\
   554	}										\
   555	DEFINE_SYSFS_GROUP_VISIBLE(cxl_memdev_dc##n);					\
   556	static struct attribute_group cxl_memdev_dc##n##_group = {			\
   557		.name = "dc"#n,								\
   558		.attrs = cxl_memdev_dc##n##_attributes,					\
   559		.is_visible = SYSFS_GROUP_VISIBLE(cxl_memdev_dc##n),			\
   560	}
 > 561	CXL_MEMDEV_DC_ATTR_GROUP(0);
 > 562	CXL_MEMDEV_DC_ATTR_GROUP(1);
 > 563	CXL_MEMDEV_DC_ATTR_GROUP(2);
 > 564	CXL_MEMDEV_DC_ATTR_GROUP(3);
 > 565	CXL_MEMDEV_DC_ATTR_GROUP(4);
 > 566	CXL_MEMDEV_DC_ATTR_GROUP(5);
 > 567	CXL_MEMDEV_DC_ATTR_GROUP(6);
 > 568	CXL_MEMDEV_DC_ATTR_GROUP(7);
   569	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
