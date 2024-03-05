Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CE92595
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 06:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709620363; cv=none; b=WLYwKcvr4qhPG9fJx97uVjCjfkrCMFMZMlMiGYrCjQTSoXa1xJEdOwtCgXvEotMuJdJNxGrLurDinIbn/BQ3Nae9oP556Eag5pEcue7qa9GB2CDiLWZN1f7YPWBPzQ5cwcZQb3qsYNqExfFWM523ClnFqTJCvKfpOgkDcVXS8Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709620363; c=relaxed/simple;
	bh=YaBOAm5RM+qxX9XKG4YPKOHM+cZCJjfXP8TIYvvoJrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=quT9WgN0GLahWFJW9Yjqmx/hjMDDyYR0/TScT4/Fh7JoIyFJPKvoSpP4IAVz3mXp2vR6b8N5n1DdfAh0Rf8pCsIhl79NhA8Z1FMLhaLbMqtP5c9+MswlbZ0uuga64/jJUn/yxw2ErgQNCgywM0zehR5K7Ilq2Nr8rCct0F3vzNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFoQfY5X; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFoQfY5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709620362; x=1741156362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YaBOAm5RM+qxX9XKG4YPKOHM+cZCJjfXP8TIYvvoJrQ=;
  b=YFoQfY5XLq9Op6C9/ebCMkCT48BnCc5hgI/g20JxksM7L/5w5E29HeuT
   Kxy5FgmZYUZUwfIpcgdBJ72sfTifRymtprBAAwCIriUVLNKHxx/TuZy7T
   enD4zQ08LOj4EZLjs5d3AbMaJNYLbLIG/vslrGiBFaGae2oScikQZbXhq
   WbG5xobqcJn28Eu/DE5pG7r0nwg5TZnpiMPaqOd9J11fnkfiKZMEMo58w
   NLWI45fKqYqfmUwRLhMXXxGPMPBYK2L530J6BU0GH6INSwVTGmRN2YeOc
   qGjJcAPcGXx1qLY4IwCtwv/b9gfuPd1RMzoJvp7V+q5hIY5pCXelkcmzC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4319542"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4319542"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 22:32:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="13934171"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Mar 2024 22:32:35 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhOLo-00035h-2M;
	Tue, 05 Mar 2024 06:32:32 +0000
Date: Tue, 5 Mar 2024 14:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/scsi/smartpqi/smartpqi_init.c:2143:30: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202403051439.nUHGHvk2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: ff579791c772afff27644ee98312bc5cceceb02a scsi: smartpqi: update driver version to v2.1.8-040
date:   2 years, 7 months ago
config: arm64-randconfig-r131-20240303 (https://download.01.org/0day-ci/archive/20240305/202403051439.nUHGHvk2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240305/202403051439.nUHGHvk2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051439.nUHGHvk2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/smartpqi/smartpqi_init.c:8343:16: sparse: sparse: undefined identifier 'dma_zalloc_coherent'
   drivers/scsi/smartpqi/smartpqi_init.c:1002:9: sparse: sparse: undefined identifier 'time_to_tm'
   drivers/scsi/smartpqi/smartpqi_init.c:3910:17: sparse: sparse: undefined identifier 'dma_zalloc_coherent'
   drivers/scsi/smartpqi/smartpqi_init.c:4049:17: sparse: sparse: undefined identifier 'dma_zalloc_coherent'
   drivers/scsi/smartpqi/smartpqi_init.c:6993:18: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different signedness)) @@     expected int ( *ioctl )( ... ) @@     got int ( * )( ... ) @@
   drivers/scsi/smartpqi/smartpqi_init.c:8286:25: sparse: sparse: undefined identifier 'dma_zalloc_coherent'
>> drivers/scsi/smartpqi/smartpqi_init.c:2143:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be64 [usertype] wwid @@     got unsigned long long [usertype] @@
   drivers/scsi/smartpqi/smartpqi_init.c:2143:30: sparse:     expected restricted __be64 [usertype] wwid
   drivers/scsi/smartpqi/smartpqi_init.c:2143:30: sparse:     got unsigned long long [usertype]
   drivers/scsi/smartpqi/smartpqi_init.c: note: in included file:
   drivers/scsi/smartpqi/smartpqi_kernel_compat.h:497:13: sparse: sparse: undefined identifier 'shost_use_blk_mq'
   drivers/scsi/smartpqi/smartpqi_init.c:4903:35: sparse: sparse: undefined identifier 'dma_zalloc_coherent'

vim +2143 drivers/scsi/smartpqi/smartpqi_init.c

  2135	
  2136	static inline void pqi_set_physical_device_wwid(struct pqi_ctrl_info *ctrl_info,
  2137		struct pqi_scsi_dev *device, struct report_phys_lun_extended_entry *phys_lun_ext_entry)
  2138	{
  2139		if (ctrl_info->unique_wwid_in_report_phys_lun_supported ||
  2140			pqi_is_device_with_sas_address(device))
  2141			device->wwid = phys_lun_ext_entry->wwid;
  2142		else
> 2143			device->wwid = *(u64 *)device->page_83_identifier;
  2144	}
  2145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
