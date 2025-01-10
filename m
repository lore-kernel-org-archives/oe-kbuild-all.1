Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7508E20E709
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 14:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736520083; cv=none; b=MXnAeqPkIW7ic24I43NJmakjBzsZKZfT3fc9ismJdLlCRwF0EuZ/gzXuk6iIc2Je7R9rfvQoWKTMqUzQGIHYlOInaMcp52e1g/evVWf+/Gd66D2RZ2VjiffhrKlzHUvN6SETMWjx5uDlDoMS+MQLEC7m/nH27TJ7W5NLwjz+VlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736520083; c=relaxed/simple;
	bh=2tEdH1TKv+6wlG899JUe4DcoMdhmc56tDOGupvtWSq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d7JrVz/EZPwbonE5ngmcRUSAu6L1ClHpozXFd57wn2JpGWKC8YKoCpwlgPQ4AGe8CI4hLGsDTCZfjwXo1EaTnQDMLJo5gHt9MKTpYVQOkbfod9T/HPWEQ+23eDiV7gohC2RNyIFUSneGBkHInQaULciSEoQOuUm2146QoVjQlZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gM31FfHG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gM31FfHG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736520081; x=1768056081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2tEdH1TKv+6wlG899JUe4DcoMdhmc56tDOGupvtWSq8=;
  b=gM31FfHG6TM/5TUSgKf1i8qHoe3Yx+Q7OvpjVuKs3MQutWGuuQp7IhHa
   Z/LTYHga3oVoJYwEeE4UZ8QkrMI+xaULgHJCQH9EHsdWAhGnD8kgMsUWG
   giQh/UMjDzfUs4rloCDfszXdl7Szd9e9gv3kYmJ7867pxT1ZbacJv6UQe
   zUjPqm4atC6X93w/YsQ1mraDQAlsrsTQkBz4JGQ878V/MwAlG3iJBbgXp
   +eogpS4d0Aj9e/GDgdS8RAlb80kRfZ7oLAEaFkCcZrCgJs4vdWwJ1r9uM
   FAS9pyc6upjFHwxpqUAqRVyTP0eqOwX684WIbiHNha87hz9H3bvvCtwvY
   Q==;
X-CSE-ConnectionGUID: V8v7L4+tS4m8c9ENQKbWZw==
X-CSE-MsgGUID: mVhRQOP6Q62KmEakOtBrsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36032091"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36032091"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 06:41:20 -0800
X-CSE-ConnectionGUID: wji+fQAxQb6rEngnzYExjw==
X-CSE-MsgGUID: 6lnKgSmxRduWR5ZyCEKHvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104633563"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Jan 2025 06:41:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWGCK-000JN1-2O;
	Fri, 10 Jan 2025 14:41:16 +0000
Date: Fri, 10 Jan 2025 22:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: [linux-next:master 6635/7860]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1910:25: error: implicit
 declaration of function 'str_read_write'; did you mean 'sb_end_write'?
Message-ID: <202501102231.TJlY4Vzu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b88851f583d3c4e40bcd40cfe1965241ec229dd
commit: f2c77f6e41e68e1b24c165acbf6d4da6b3117e23 [6635/7860] iommu/arm-smmu-v3: Use str_read_write helper w/ logs
config: arm64-randconfig-002-20250110 (https://download.01.org/0day-ci/archive/20250110/202501102231.TJlY4Vzu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501102231.TJlY4Vzu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501102231.TJlY4Vzu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:12:
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: In function 'arm_smmu_dump_event':
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1910:25: error: implicit declaration of function 'str_read_write'; did you mean 'sb_end_write'? [-Wimplicit-function-declaration]
    1910 |                         str_read_write(evt->read),
         |                         ^~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1907:17: note: in expansion of macro 'dev_err'
    1907 |                 dev_err(smmu->dev, "%s %s %s %s \"%s\"%s%s stag: %#x",
         |                 ^~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1907:36: warning: format '%s' expects argument of type 'char *', but argument 5 has type 'int' [-Wformat=]
    1907 |                 dev_err(smmu->dev, "%s %s %s %s \"%s\"%s%s stag: %#x",
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1907:17: note: in expansion of macro 'dev_err'
    1907 |                 dev_err(smmu->dev, "%s %s %s %s \"%s\"%s%s stag: %#x",
         |                 ^~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1907:44: note: format string is defined here
    1907 |                 dev_err(smmu->dev, "%s %s %s %s \"%s\"%s%s stag: %#x",
         |                                           ~^
         |                                            |
         |                                            char *
         |                                           %d


vim +1910 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  1888	
  1889	static void arm_smmu_dump_event(struct arm_smmu_device *smmu, u64 *raw,
  1890					struct arm_smmu_event *evt,
  1891					struct ratelimit_state *rs)
  1892	{
  1893		if (!__ratelimit(rs))
  1894			return;
  1895	
  1896		arm_smmu_dump_raw_event(smmu, raw, evt);
  1897	
  1898		switch (evt->id) {
  1899		case EVT_ID_TRANSLATION_FAULT:
  1900		case EVT_ID_ADDR_SIZE_FAULT:
  1901		case EVT_ID_ACCESS_FAULT:
  1902		case EVT_ID_PERMISSION_FAULT:
  1903			dev_err(smmu->dev, "event: %s client: %s sid: %#x ssid: %#x iova: %#llx ipa: %#llx",
  1904				ARM_SMMU_LOG_EVT_STR(evt), ARM_SMMU_LOG_CLIENT(evt),
  1905				evt->sid, evt->ssid, evt->iova, evt->ipa);
  1906	
> 1907			dev_err(smmu->dev, "%s %s %s %s \"%s\"%s%s stag: %#x",
  1908				evt->privileged ? "priv" : "unpriv",
  1909				evt->instruction ? "inst" : "data",
> 1910				str_read_write(evt->read),
  1911				evt->s2 ? "s2" : "s1", event_class_str[evt->class],
  1912				evt->class_tt ? (evt->ttrnw ? " ttd_read" : " ttd_write") : "",
  1913				evt->stall ? " stall" : "", evt->stag);
  1914	
  1915			break;
  1916	
  1917		case EVT_ID_STE_FETCH_FAULT:
  1918		case EVT_ID_CD_FETCH_FAULT:
  1919		case EVT_ID_VMS_FETCH_FAULT:
  1920			dev_err(smmu->dev, "event: %s client: %s sid: %#x ssid: %#x fetch_addr: %#llx",
  1921				ARM_SMMU_LOG_EVT_STR(evt), ARM_SMMU_LOG_CLIENT(evt),
  1922				evt->sid, evt->ssid, evt->fetch_addr);
  1923	
  1924			break;
  1925	
  1926		default:
  1927			dev_err(smmu->dev, "event: %s client: %s sid: %#x ssid: %#x",
  1928				ARM_SMMU_LOG_EVT_STR(evt), ARM_SMMU_LOG_CLIENT(evt),
  1929				evt->sid, evt->ssid);
  1930		}
  1931	}
  1932	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
