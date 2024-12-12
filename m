Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98241632C5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 06:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733984323; cv=none; b=Mdmy6srCOw5jnla62DowQhqBKhXktZAt/tBhMQ7BB8fbwvXay9INDKhI0WRKtGFzQB/Ep4ou5Zic6+ilI4g1Qk4kE6+YlWGReGfXp/nHpPIk0e8sBzqpijOuwsGrq1jDa9+g2W/14s0DL7AJwDjY+OK/Y9pfNuSJwuFGp5BRfeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733984323; c=relaxed/simple;
	bh=BYrzlbwE+7G5vA0YcxdfkNBHXBxS3Mu1lCYwY3lmX0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bCL6dVlF/g15xzcMBfbmq7MtVxHo0qZ018hOxvkosKV4FAiYULuexc7jzLHsYzV3Ba7LHs27+/fRadCaRvW17D719+XOzj2jusXat5mBdIAYXkMo6DoT7iIU1vYuDmJEVs397EG1EKlPnPYrJ+NjazN7CAH/+Xk8KaJCtBzRQl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZhUj+zVg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZhUj+zVg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733984321; x=1765520321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BYrzlbwE+7G5vA0YcxdfkNBHXBxS3Mu1lCYwY3lmX0U=;
  b=ZhUj+zVg1afdO7myigVdBK1NAu4uJKtEWEdzM1LCaMj23GZVSF24mQWO
   iV1b1F7ie3wYPv3+QD5MEXQRk8BTvZEFv2cZbyWpTNdJ1A1ogv+Tu6lg0
   k2zaMTl7A5AyWP0hoAL7uA1/FqkwAqmYlm0alDbN4U2o5d3QaAxQFUfBM
   yw4Ae9KB6m+vKpN0kyE/Yg0CEOx0mvTwlVds6L9MSIZ02ShfpwWpfC2sL
   Wo18Z4y/8pT/uDtv0DwcyGJ7Vj1vqpdtCiC6KuI8zfodTWAE+9O2H7vYE
   oS/mFMkj/KFvOwtZ8Cfpj8tD3Pfq1RWtpq2J+U9vtJIg4jMnT0xr0NVl7
   A==;
X-CSE-ConnectionGUID: UKZhewQDRk6sahBcchkYLw==
X-CSE-MsgGUID: zyKP/upxQ4KIXOeXgz7+UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34294953"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34294953"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 22:18:40 -0800
X-CSE-ConnectionGUID: FSuVlUzMSD2q4127GkgmFw==
X-CSE-MsgGUID: H+LiaLZVQjC2BwAImSMw0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="101151441"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2024 22:18:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLcWx-0007Uh-3C;
	Thu, 12 Dec 2024 06:18:35 +0000
Date: Thu, 12 Dec 2024 14:17:56 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Fan Ni <fan.ni@samsung.com>
Subject: [weiny2:dcd-v4-2024-12-10 8/22] drivers/cxl/core/memdev.c:559:1:
 sparse: sparse: symbol 'dc0_size' was not declared. Should it be static?
Message-ID: <202412121423.kjKl1j3V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-12-10
head:   1cded0f798c0254ebe5d5e5fe20658dfb97bb1b3
commit: 45b8717b563e212c8a1463988478e5cd70e815f7 [8/22] cxl/mem: Expose DCD partition capabilities in sysfs
config: csky-randconfig-r121-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121423.kjKl1j3V-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241212/202412121423.kjKl1j3V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121423.kjKl1j3V-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/memdev.c:559:1: sparse: sparse: symbol 'dc0_size' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:559:1: sparse: sparse: symbol 'dc0_read_only' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:559:1: sparse: sparse: symbol 'dc0_shareable' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:559:1: sparse: sparse: symbol 'dc0_qos_class' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:560:1: sparse: sparse: symbol 'dc1_size' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:560:1: sparse: sparse: symbol 'dc1_read_only' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:560:1: sparse: sparse: symbol 'dc1_shareable' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:560:1: sparse: sparse: symbol 'dc1_qos_class' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:561:1: sparse: sparse: symbol 'dc2_size' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:561:1: sparse: sparse: symbol 'dc2_read_only' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:561:1: sparse: sparse: symbol 'dc2_shareable' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:561:1: sparse: sparse: symbol 'dc2_qos_class' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:562:1: sparse: sparse: symbol 'dc3_size' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:562:1: sparse: sparse: symbol 'dc3_read_only' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:562:1: sparse: sparse: symbol 'dc3_shareable' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:562:1: sparse: sparse: symbol 'dc3_qos_class' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:563:1: sparse: sparse: symbol 'dc4_size' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:563:1: sparse: sparse: symbol 'dc4_read_only' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:563:1: sparse: sparse: symbol 'dc4_shareable' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:563:1: sparse: sparse: symbol 'dc4_qos_class' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:564:1: sparse: sparse: symbol 'dc5_size' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:564:1: sparse: sparse: symbol 'dc5_read_only' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:564:1: sparse: sparse: symbol 'dc5_shareable' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:564:1: sparse: sparse: symbol 'dc5_qos_class' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:565:1: sparse: sparse: symbol 'dc6_size' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:565:1: sparse: sparse: symbol 'dc6_read_only' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:565:1: sparse: sparse: symbol 'dc6_shareable' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:565:1: sparse: sparse: symbol 'dc6_qos_class' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:566:1: sparse: sparse: symbol 'dc7_size' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:566:1: sparse: sparse: symbol 'dc7_read_only' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:566:1: sparse: sparse: symbol 'dc7_shareable' was not declared. Should it be static?
>> drivers/cxl/core/memdev.c:566:1: sparse: sparse: symbol 'dc7_qos_class' was not declared. Should it be static?

vim +/dc0_size +559 drivers/cxl/core/memdev.c

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
   529		NULL									\
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
   551		return mds && n < mds->nr_dc_region;					\
   552	}										\
   553	DEFINE_SYSFS_GROUP_VISIBLE(cxl_memdev_dc##n);					\
   554	static struct attribute_group cxl_memdev_dc##n##_group = {			\
   555		.name = "dc"#n,								\
   556		.attrs = cxl_memdev_dc##n##_attributes,					\
   557		.is_visible = SYSFS_GROUP_VISIBLE(cxl_memdev_dc##n),			\
   558	}
 > 559	CXL_MEMDEV_DC_ATTR_GROUP(0);
 > 560	CXL_MEMDEV_DC_ATTR_GROUP(1);
 > 561	CXL_MEMDEV_DC_ATTR_GROUP(2);
 > 562	CXL_MEMDEV_DC_ATTR_GROUP(3);
 > 563	CXL_MEMDEV_DC_ATTR_GROUP(4);
 > 564	CXL_MEMDEV_DC_ATTR_GROUP(5);
 > 565	CXL_MEMDEV_DC_ATTR_GROUP(6);
 > 566	CXL_MEMDEV_DC_ATTR_GROUP(7);
   567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
