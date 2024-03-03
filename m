Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383267AE67
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 23:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709509236; cv=none; b=ri6sktR2djVoMVj4sHevRwImQBOqCW3Ib+SUr8RuCmFPm7QRKmCqx5C4Y4bRoIJXly95fhVAeCWRwq5VrOfa5iOb0nlJ5Otw4EwDwI6g+7uuGS+JaOsfIiKzmoyyYXljKrhuy+n6aFO8yLIItv3ezLHfK1E/EA5aovrBADlYsrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709509236; c=relaxed/simple;
	bh=vczYy6fI8ZO6B4Gi0THDxly1Hls6mhRdJ7jkb+disuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FNcvlFi8gSiyHasg06dJc/WkgXWya6BhAH351Y4KNejQ1yme9SgYYPE2y5VrB8mFNxBaDWGrfkNKdPuw3ctLi+T24kC3BOx0vbM+suDkeYHRmobLLtWnhWuKd5uygW9DKXl0DDAmNc8CmgYRgc68Jv6/ZsMqo4MiXzewPvPohNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPz6578/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPz6578/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709509234; x=1741045234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vczYy6fI8ZO6B4Gi0THDxly1Hls6mhRdJ7jkb+disuE=;
  b=bPz6578/Oa8n1muHCkTcy4l5xMbkzJrrEinVZ0TPVV4jGbVqnAIfe4kl
   02txVsWRbiDTbIhbLcJr9iSU6qHVNK60qpfg9WJSiXOecT4bgZqCRRtaL
   RDyKA4gneYVnB+2IhEJYR8lBIFhRk4RxBnrJlnMnENy0UBh+W9mNtzqyN
   HTThfXDg+W5JP3XrsMFLrOiDbMzAzNqzxXBLvyu1i4klQg9REUIR9y1db
   pQf9t7CjPU7Obhl7RYVwgIWyCdwEDnubcIBZB1eLiV2id8i4/Kf4JNf8t
   FBW7XYOe/tnsS8pWssMrtFKzywxe6YUChL9L5VDXohqjX3ZEBlqRhHh8n
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="26451753"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="26451753"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 15:40:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="8741450"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Mar 2024 15:40:30 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgvRT-0002Ay-1D;
	Sun, 03 Mar 2024 23:40:27 +0000
Date: Mon, 4 Mar 2024 07:39:40 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/scsi/mpt3sas/mpt3sas_base.c:8851:40: sparse: sparse: invalid
 assignment: |=
Message-ID: <202403040729.pXD9KX8r-lkp@intel.com>
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
commit: 1549c764245c433658fc299210efea4c91365b89 driver: update mpt3sas from 32.00.00.00 to 37.00.00.00
date:   2 years, 10 months ago
config: arm64-randconfig-r131-20240303 (https://download.01.org/0day-ci/archive/20240304/202403040729.pXD9KX8r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240304/202403040729.pXD9KX8r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040729.pXD9KX8r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/mpt3sas/mpt3sas_base.c:264:35: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/scsi/mpt3sas/mpt3sas_base.c:266:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void *reply_free_iomem @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:266:9: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/scsi/mpt3sas/mpt3sas_base.c:266:9: sparse:     got void *reply_free_iomem
   drivers/scsi/mpt3sas/mpt3sas_base.c:284:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:284:17: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/scsi/mpt3sas/mpt3sas_base.c:284:17: sparse:     got void *
   drivers/scsi/mpt3sas/mpt3sas_base.c:301:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:301:17: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/scsi/mpt3sas/mpt3sas_base.c:301:17: sparse:     got void *
   drivers/scsi/mpt3sas/mpt3sas_base.c:502:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] <asn:2> *buffer_iomem @@     got void * @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:502:22: sparse:     expected void [noderef] <asn:2> *buffer_iomem
   drivers/scsi/mpt3sas/mpt3sas_base.c:502:22: sparse:     got void *
   drivers/scsi/mpt3sas/mpt3sas_base.c:534:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] <asn:2> * @@     got void * @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:534:57: sparse:     expected void [noderef] <asn:2> *
   drivers/scsi/mpt3sas/mpt3sas_base.c:534:57: sparse:     got void *
   drivers/scsi/mpt3sas/mpt3sas_base.c:550:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dst_iomem @@     got void [noderef] <asn:2> *[assigned] buff_ptr @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:550:64: sparse:     expected void *dst_iomem
   drivers/scsi/mpt3sas/mpt3sas_base.c:550:64: sparse:     got void [noderef] <asn:2> *[assigned] buff_ptr
   drivers/scsi/mpt3sas/mpt3sas_base.c:561:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dst_iomem @@     got void [noderef] <asn:2> *[assigned] buff_ptr @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:561:64: sparse:     expected void *dst_iomem
   drivers/scsi/mpt3sas/mpt3sas_base.c:561:64: sparse:     got void [noderef] <asn:2> *[assigned] buff_ptr
   drivers/scsi/mpt3sas/mpt3sas_base.c:599:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dst_iomem @@     got void [noderef] <asn:2> * @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:599:62: sparse:     expected void *dst_iomem
   drivers/scsi/mpt3sas/mpt3sas_base.c:599:62: sparse:     got void [noderef] <asn:2> *
   drivers/scsi/mpt3sas/mpt3sas_base.c:2120:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned long long [usertype] * @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:2120:33: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/scsi/mpt3sas/mpt3sas_base.c:2120:33: sparse:     got unsigned long long [usertype] *
   drivers/scsi/mpt3sas/mpt3sas_base.c:2156:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned long long [usertype] * @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:2156:17: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/scsi/mpt3sas/mpt3sas_base.c:2156:17: sparse:     got unsigned long long [usertype] *
   drivers/scsi/mpt3sas/mpt3sas_base.c:2163:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned long long [usertype] * @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:2163:17: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/scsi/mpt3sas/mpt3sas_base.c:2163:17: sparse:     got unsigned long long [usertype] *
   drivers/scsi/mpt3sas/mpt3sas_base.c:1995:1: sparse: sparse: symbol '_base_process_reply_queue' was not declared. Should it be static?
   drivers/scsi/mpt3sas/mpt3sas_base.c:2212:1: sparse: sparse: symbol '_base_irqpoll' was not declared. Should it be static?
   drivers/scsi/mpt3sas/mpt3sas_base.c:2241:1: sparse: sparse: symbol '_base_init_irqpolls' was not declared. Should it be static?
   drivers/scsi/mpt3sas/mpt3sas_base.c:2747:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:2747:36: sparse:     expected unsigned long long [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:2747:36: sparse:     got restricted __le64 [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:2761:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:2761:37: sparse:     expected unsigned long long [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:2761:37: sparse:     got restricted __le64 [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:2784:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:2784:45: sparse:     expected unsigned long long [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:2784:45: sparse:     got restricted __le64 [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:2798:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:2798:45: sparse:     expected unsigned long long [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:2798:45: sparse:     got restricted __le64 [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:2810:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:2810:36: sparse:     expected unsigned long long [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:2810:36: sparse:     got restricted __le64 [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:2947:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:2947:36: sparse:     expected unsigned long long [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:2947:36: sparse:     got restricted __le64 [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:2952:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:2952:28: sparse:     expected unsigned long long [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:2952:28: sparse:     got restricted __le64 [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:2843:1: sparse: sparse: symbol 'base_make_prp_nvme' was not declared. Should it be static?
   drivers/scsi/mpt3sas/mpt3sas_base.c:3018:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] data_length @@     got restricted __le32 [usertype] @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:3018:21: sparse:     expected unsigned int [usertype] data_length
   drivers/scsi/mpt3sas/mpt3sas_base.c:3018:21: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:3963:21: sparse: sparse: symbol 'mpt3sas_pcie_link_speed' was not declared. Should it be static?
   drivers/scsi/mpt3sas/mpt3sas_base.c:5429:35: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/scsi/mpt3sas/mpt3sas_base.c:5916:26: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/scsi/mpt3sas/mpt3sas_base.c:5995:34: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/scsi/mpt3sas/mpt3sas_base.c:6061:34: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/scsi/mpt3sas/mpt3sas_base.c:6125:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/mpt3sas/mpt3sas_base.c:6147:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/mpt3sas/mpt3sas_base.c:6171:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/mpt3sas/mpt3sas_base.c:6192:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/mpt3sas/mpt3sas_base.c:6213:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/mpt3sas/mpt3sas_base.c:6564:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ImageSize @@     got unsigned long [assigned] [usertype] data_length @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:6564:32: sparse:     expected restricted __le32 [usertype] ImageSize
   drivers/scsi/mpt3sas/mpt3sas_base.c:6564:32: sparse:     got unsigned long [assigned] [usertype] data_length
   drivers/scsi/mpt3sas/mpt3sas_base.c:8442:1: sparse: sparse: symbol '_base_flush_ios_and_panic' was not declared. Should it be static?
>> drivers/scsi/mpt3sas/mpt3sas_base.c:8851:40: sparse: sparse: invalid assignment: |=
   drivers/scsi/mpt3sas/mpt3sas_base.c:8851:40: sparse:    left side has type restricted __le16
   drivers/scsi/mpt3sas/mpt3sas_base.c:8851:40: sparse:    right side has type int
   drivers/scsi/mpt3sas/mpt3sas_base.c:9454:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned long long [usertype] * @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:9454:33: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/scsi/mpt3sas/mpt3sas_base.c:9454:33: sparse:     got unsigned long long [usertype] *
   drivers/scsi/mpt3sas/mpt3sas_base.c:9602:22: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/scsi/mpt3sas/mpt3sas_base.c:9606:31: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/scsi/mpt3sas/mpt3sas_base.c:320:24: sparse: sparse: cast removes address space '<asn:2>' of expression
--
>> drivers/scsi/mpt3sas/mpt3sas_config.c:1862:1: sparse: sparse: symbol 'mpt3sas_config_update_driver_trigger_pg0' was not declared. Should it be static?
--
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:10015:28: sparse: sparse: cast to restricted __le16
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:909:20: sparse: sparse: symbol 'mpt3sas_get_sdev_from_target' was not declared. Should it be static?
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:948:21: sparse: sparse: symbol 'mpt3sas_get_pdev_from_target' was not declared. Should it be static?
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:974:20: sparse: sparse: symbol '__mpt3sas_get_sdev_by_addr' was not declared. Should it be static?
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1310:21: sparse: sparse: symbol '__mpt3sas_get_pdev_by_wwid' was not declared. Should it be static?
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1343:21: sparse: sparse: symbol 'mpt3sas_get_pdev_by_wwid' was not declared. Should it be static?
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1357:21: sparse: sparse: symbol '__mpt3sas_get_pdev_by_idchannel' was not declared. Should it be static?
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1393:21: sparse: sparse: symbol 'mpt3sas_get_pdev_by_idchannel' was not declared. Should it be static?
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1407:21: sparse: sparse: symbol '__mpt3sas_get_pdev_by_handle' was not declared. Should it be static?
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1872:24: sparse: sparse: symbol 'mpt3sas_scsih_enclosure_find_by_handle' was not declared. Should it be static?
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1898:18: sparse: sparse: symbol 'mpt3sas_scsih_switch_find_by_handle' was not declared. Should it be static?
>> drivers/scsi/mpt3sas/mpt3sas_scsih.c:3521:1: sparse: sparse: symbol 'scsih_tm_cmd_map_status' was not declared. Should it be static?
>> drivers/scsi/mpt3sas/mpt3sas_scsih.c:3571:1: sparse: sparse: symbol 'scsih_tm_post_processing' was not declared. Should it be static?
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5388:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dev_handle @@     got restricted __le16 [usertype] DevHandle @@
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5388:36: sparse:     expected unsigned short [usertype] dev_handle
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5388:36: sparse:     got restricted __le16 [usertype] DevHandle
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5390:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dev_handle @@     got restricted __le16 [usertype] DevHandle @@
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5390:36: sparse:     expected unsigned short [usertype] dev_handle
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5390:36: sparse:     got restricted __le16 [usertype] DevHandle
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5393:17: sparse: sparse: cast to restricted __le16
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5400:35: sparse: sparse: cast to restricted __le16
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5402:42: sparse: sparse: cast to restricted __le16
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5403:45: sparse: sparse: cast to restricted __le16
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5404:25: sparse: sparse: cast to restricted __le16
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5407:42: sparse: sparse: cast to restricted __le16
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5408:48: sparse: sparse: cast to restricted __le16
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5410:25: sparse: sparse: cast to restricted __le16
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5413:42: sparse: sparse: cast to restricted __le16
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5414:35: sparse: sparse: cast to restricted __le16
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6123:37: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6124:37: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6125:37: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6126:37: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6381:68: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] ApplicationTagTranslationMask @@     got int @@
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6381:68: sparse:     expected restricted __le16 [usertype] ApplicationTagTranslationMask
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6381:68: sparse:     got int
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6445:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] EEDPBlockSize @@     got restricted __le32 [usertype] @@
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6445:36: sparse:     expected restricted __le16 [usertype] EEDPBlockSize
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6445:36: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6593:17: sparse: sparse: cast from restricted __le64
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6600:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] Flags @@     got int @@
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6600:35: sparse:     expected restricted __le16 [usertype] Flags
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6600:35: sparse:     got int
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6492:5: sparse: sparse: symbol '_scsih_build_nvme_unmap' was not declared. Should it be static?
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:11902:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] EnclosureHandle @@     got unsigned short [usertype] @@
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:11902:37: sparse:     expected restricted __le16 [usertype] EnclosureHandle
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:11902:37: sparse:     got unsigned short [usertype]
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:11907:59: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] handle @@     got restricted __le16 [usertype] EnclosureHandle @@
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:11907:59: sparse:     expected unsigned short [usertype] handle
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:11907:59: sparse:     got restricted __le16 [usertype] EnclosureHandle
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:11921:43: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected unsigned int [usertype] handle @@     got restricted __le16 [usertype] EnclosureHandle @@
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:11921:43: sparse:     expected unsigned int [usertype] handle
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:11921:43: sparse:     got restricted __le16 [usertype] EnclosureHandle
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6873:9: sparse: sparse: context imbalance in 'scsih_qcmd' - different lock contexts for basic block
--
>> drivers/scsi/mpt3sas/mpt3sas_transport.c:190:1: sparse: sparse: symbol '_transport_get_port_id_by_rphy' was not declared. Should it be static?
--
>> drivers/scsi/mpt3sas/mpt3sas_debugfs.c:60:15: sparse: sparse: symbol 'mpt3sas_debugfs_root' was not declared. Should it be static?

vim +8851 drivers/scsi/mpt3sas/mpt3sas_base.c

  8785	
  8786	/**
  8787	 * _base_send_ioc_init - send ioc_init to firmware
  8788	 * @ioc: per adapter object
  8789	 *
  8790	 * Returns 0 for success, non-zero for failure.
  8791	 */
  8792	static int
  8793	_base_send_ioc_init(struct MPT3SAS_ADAPTER *ioc)
  8794	{
  8795		Mpi2IOCInitRequest_t mpi_request;
  8796		Mpi2IOCInitReply_t mpi_reply;
  8797		int i, r = 0;
  8798	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,6,0))
  8799		ktime_t current_time;
  8800	#else
  8801		struct timeval current_time;
  8802	#endif
  8803		u16 ioc_status;
  8804		u32 reply_post_free_ary_sz;
  8805	
  8806		dinitprintk(ioc, printk(MPT3SAS_INFO_FMT "%s\n", ioc->name,
  8807		    __func__));
  8808	
  8809		memset(&mpi_request, 0, sizeof(Mpi2IOCInitRequest_t));
  8810		mpi_request.Function = MPI2_FUNCTION_IOC_INIT;
  8811		mpi_request.WhoInit = MPI2_WHOINIT_HOST_DRIVER;
  8812		mpi_request.VF_ID = 0; /* TODO */
  8813		mpi_request.VP_ID = 0;
  8814		mpi_request.MsgVersion = cpu_to_le16(ioc->hba_mpi_version_belonged); 
  8815		mpi_request.HeaderVersion = cpu_to_le16(MPI2_HEADER_VERSION);
  8816		mpi_request.HostPageSize = MPT3SAS_HOST_PAGE_SIZE_4K;
  8817	
  8818		if (_base_is_controller_msix_enabled(ioc))
  8819			mpi_request.HostMSIxVectors = ioc->reply_queue_count;
  8820		mpi_request.SystemRequestFrameSize = cpu_to_le16(ioc->request_sz/4);
  8821		mpi_request.ReplyDescriptorPostQueueDepth =
  8822		    cpu_to_le16(ioc->reply_post_queue_depth);
  8823		mpi_request.ReplyFreeQueueDepth =
  8824		    cpu_to_le16(ioc->reply_free_queue_depth);
  8825	
  8826		mpi_request.SenseBufferAddressHigh =
  8827		    cpu_to_le32((u64)ioc->sense_dma >> 32);
  8828		mpi_request.SystemReplyAddressHigh =
  8829		    cpu_to_le32((u64)ioc->reply_dma >> 32);
  8830		mpi_request.SystemRequestFrameBaseAddress =
  8831		    cpu_to_le64((u64)ioc->request_dma);
  8832		mpi_request.ReplyFreeQueueAddress =
  8833		    cpu_to_le64((u64)ioc->reply_free_dma);
  8834	
  8835		if (ioc->rdpq_array_enable) {
  8836			reply_post_free_ary_sz = ioc->reply_queue_count *
  8837			    sizeof(Mpi2IOCInitRDPQArrayEntry);
  8838			memset(ioc->reply_post_free_array, 0, reply_post_free_ary_sz);
  8839			for (i = 0; i < ioc->reply_queue_count; i++)
  8840				ioc->reply_post_free_array[i].RDPQBaseAddress =
  8841				    cpu_to_le64((u64)ioc->reply_post[i].reply_post_free_dma);
  8842			mpi_request.MsgFlags = MPI2_IOCINIT_MSGFLAG_RDPQ_ARRAY_MODE;
  8843			mpi_request.ReplyDescriptorPostQueueAddress =
  8844			    cpu_to_le64((u64)ioc->reply_post_free_array_dma);
  8845		} else {
  8846			mpi_request.ReplyDescriptorPostQueueAddress =
  8847			    cpu_to_le64((u64)ioc->reply_post[0].reply_post_free_dma);
  8848		}
  8849	
  8850		/* CoreDump. Set the flag to enable CoreDump in the FW */
> 8851		mpi_request.ConfigurationFlags |= MPI26_IOCINIT_CFGFLAGS_COREDUMP_ENABLE;
  8852	
  8853		/* This time stamp specifies number of milliseconds
  8854		 * since epoch ~ midnight January 1, 1970.
  8855		 */
  8856	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,6,0))
  8857		current_time = ktime_get_real();
  8858		mpi_request.TimeStamp = cpu_to_le64(ktime_to_ms(current_time));
  8859	#else
  8860		do_gettimeofday(&current_time);
  8861		mpi_request.TimeStamp = cpu_to_le64((u64)current_time.tv_sec * 1000 +
  8862		    (current_time.tv_usec / 1000));
  8863	#endif
  8864	
  8865		if (ioc->logging_level & MPT_DEBUG_INIT) {
  8866			__le32 *mfp;
  8867			int i;
  8868	
  8869			mfp = (__le32 *)&mpi_request;
  8870			printk(MPT3SAS_INFO_FMT "\toffset:data\n", ioc->name);
  8871			for (i = 0; i < sizeof(Mpi2IOCInitRequest_t)/4; i++)
  8872				printk(MPT3SAS_INFO_FMT "\t[0x%02x]:%08x\n",
  8873				    ioc->name, i*4, le32_to_cpu(mfp[i]));
  8874		}
  8875	
  8876		r = _base_handshake_req_reply_wait(ioc,
  8877		    sizeof(Mpi2IOCInitRequest_t), (u32 *)&mpi_request,
  8878		    sizeof(Mpi2IOCInitReply_t), (u16 *)&mpi_reply, 30);
  8879	
  8880		if (r != 0) {
  8881			printk(MPT3SAS_ERR_FMT "%s: handshake failed (r=%d)\n",
  8882			    ioc->name, __func__, r);
  8883			return r;
  8884		}
  8885	
  8886		ioc_status = le16_to_cpu(mpi_reply.IOCStatus) & MPI2_IOCSTATUS_MASK;
  8887		if (ioc_status != MPI2_IOCSTATUS_SUCCESS ||
  8888		    mpi_reply.IOCLogInfo) {
  8889			printk(MPT3SAS_ERR_FMT "%s: failed\n", ioc->name, __func__);
  8890			r = -EIO;
  8891		}
  8892		
  8893		/* Reset TimeSync Counter*/
  8894		 ioc->timestamp_update_count = 0;
  8895	
  8896		return r;
  8897	}
  8898	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
