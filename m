Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569AD2E6CA0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Dec 2025 21:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767042817; cv=none; b=PlTge2T+6AnfgSv7vrHyQCZvHU+1jIp/RQUJV8AtlkwXkm8h7Kzwkn5gBD5S0MLozXZM/Sp9iP71FkkRaKwYhGGBhUCWaSsIrSfRbkCp3hhNTMmzmfcVXFMPYDS9uFXkyz7JRcrgs2yiZL1C3XpWz961TkpDmzkmxMSMRaTHBxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767042817; c=relaxed/simple;
	bh=iMRXUTN3g9DG8sRw5xGsBul7vuCCB9wI1QsXsQG2x4k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tBC7ufHwlj6rjDwOF7vdML/nfcq+hT5opqZODNA8h7GN7ueMRaZ8wJJdroHM85Ucb6h094ULReC1PMPjuKLbphhj3yMGmlqEDNdrNZhqOhRdatYDg1HndWrEuNFEW7qg2jWzRA/Xg9uBTnSTIT2y8whDBzBLLNOnD8EWYA5Bk6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+pA03kv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+pA03kv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767042815; x=1798578815;
  h=date:from:to:cc:subject:message-id;
  bh=iMRXUTN3g9DG8sRw5xGsBul7vuCCB9wI1QsXsQG2x4k=;
  b=R+pA03kvRxBZ5zlGbQuve+K+caMWQmgTQinGu01kB2xUn7NVzW5R3JPw
   K5T7vCWF1XSiZddVdZqAfTuXpOrRdg3wV9lgnGgPTYtjzQQ4LDKSWbmTB
   y1gT4L4a+IthqzC4943cKixYE6XFRY3AXG7n9Rn66D+BuFZAhPopi1aqz
   OH2QNpRBXUOC/m3kvdvKaD2AHeGMpXhzvBbbdKICtzQGqfoJ5viFDHn5N
   U2zJRhuF+dqQDQRAwDZaMeccORC65vRDnHQyeIwWcRuplv6jSW7z9L8Qa
   0SHkpEwNGHjgI+Wjw6PpGMw+oJX+t7CXgzknV2hL/yltrmWOUnNgONrhO
   A==;
X-CSE-ConnectionGUID: Y67tK8byQ2anf31x08bmjQ==
X-CSE-MsgGUID: taXkpOvISz+tHxvAF4vQPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="80098344"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="80098344"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 13:13:33 -0800
X-CSE-ConnectionGUID: JV4k+mj/TLSULI5P4CV3xw==
X-CSE-MsgGUID: Jer19qNSTVOnChU44rj6ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="200231785"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Dec 2025 13:13:32 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaKYT-0000000082T-0hDO;
	Mon, 29 Dec 2025 21:13:29 +0000
Date: Tue, 30 Dec 2025 05:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3408/3408] drivers/vfio/vfio.c:745:
 warning: Function parameter or member 'device_data' not described in
 'vfio_init_group_dev'
Message-ID: <202512300518.2iNoaLSP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: 7e292ed053bcdc739fdea7c6a4326905ade70176 [3408/3408] vfio: Split creation of a vfio_device into init and register ops
config: arm64-randconfig-r113-20251213 (https://download.01.org/0day-ci/archive/20251230/202512300518.2iNoaLSP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512300518.2iNoaLSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512300518.2iNoaLSP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/vfio/vfio.c:214: warning: Function parameter or member 'ops' not described in 'vfio_register_iommu_driver'
   drivers/vfio/vfio.c:263: warning: Function parameter or member 'group' not described in 'vfio_alloc_group_minor'
   drivers/vfio/vfio.c:283: warning: Function parameter or member 'container' not described in 'vfio_container_get'
   drivers/vfio/vfio.c:315: warning: Function parameter or member 'iommu_group' not described in 'vfio_create_group'
   drivers/vfio/vfio.c:527: warning: Function parameter or member 'device' not described in 'vfio_device_put'
   drivers/vfio/vfio.c:633: warning: Function parameter or member 'group' not described in 'vfio_group_nb_add_dev'
   drivers/vfio/vfio.c:633: warning: Function parameter or member 'dev' not described in 'vfio_group_nb_add_dev'
   drivers/vfio/vfio.c:745: warning: Function parameter or member 'device' not described in 'vfio_init_group_dev'
   drivers/vfio/vfio.c:745: warning: Function parameter or member 'dev' not described in 'vfio_init_group_dev'
   drivers/vfio/vfio.c:745: warning: Function parameter or member 'ops' not described in 'vfio_init_group_dev'
>> drivers/vfio/vfio.c:745: warning: Function parameter or member 'device_data' not described in 'vfio_init_group_dev'
   drivers/vfio/vfio.c:833: warning: Function parameter or member 'dev' not described in 'vfio_device_get_from_dev'
   drivers/vfio/vfio.c:982: warning: Function parameter or member 'container' not described in 'vfio_ioctl_check_extension'
   drivers/vfio/vfio.c:982: warning: Function parameter or member 'arg' not described in 'vfio_ioctl_check_extension'
   drivers/vfio/vfio.c:1253: warning: Function parameter or member 'group' not described in '__vfio_group_unset_container'
   drivers/vfio/vfio.c:1588: warning: Function parameter or member 'inode' not described in 'vfio_device_fops_release'
   drivers/vfio/vfio.c:1588: warning: Function parameter or member 'filep' not described in 'vfio_device_fops_release'
   drivers/vfio/vfio.c:1682: warning: Function parameter or member 'filep' not described in 'vfio_group_get_external_user'
   drivers/vfio/vfio.c:1719: warning: Function parameter or member 'dev' not described in 'vfio_group_get_external_user_from_dev'
   drivers/vfio/vfio.c:1779: warning: Function parameter or member 'caps' not described in 'vfio_info_cap_add'
   drivers/vfio/vfio.c:1779: warning: Function parameter or member 'size' not described in 'vfio_info_cap_add'
   drivers/vfio/vfio.c:1779: warning: Function parameter or member 'id' not described in 'vfio_info_cap_add'
   drivers/vfio/vfio.c:1779: warning: Function parameter or member 'version' not described in 'vfio_info_cap_add'
   drivers/vfio/vfio.c:2316: warning: Function parameter or member 'dev' not described in 'vfio_devnode'
   drivers/vfio/vfio.c:2316: warning: Function parameter or member 'mode' not described in 'vfio_devnode'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +745 drivers/vfio/vfio.c

cba3345cc494ad2 Alex Williamson 2012-07-31  739  
cba3345cc494ad2 Alex Williamson 2012-07-31  740  /**
cba3345cc494ad2 Alex Williamson 2012-07-31  741   * VFIO driver API
cba3345cc494ad2 Alex Williamson 2012-07-31  742   */
7e292ed053bcdc7 Jason Gunthorpe 2022-11-18  743  void vfio_init_group_dev(struct vfio_device *device, struct device *dev,
cba3345cc494ad2 Alex Williamson 2012-07-31  744  			 const struct vfio_device_ops *ops, void *device_data)
cba3345cc494ad2 Alex Williamson 2012-07-31 @745  {
7e292ed053bcdc7 Jason Gunthorpe 2022-11-18  746  	init_completion(&device->comp);
7e292ed053bcdc7 Jason Gunthorpe 2022-11-18  747  	device->dev = dev;
7e292ed053bcdc7 Jason Gunthorpe 2022-11-18  748  	device->ops = ops;
7e292ed053bcdc7 Jason Gunthorpe 2022-11-18  749  	device->device_data = device_data;
7e292ed053bcdc7 Jason Gunthorpe 2022-11-18  750  }
7e292ed053bcdc7 Jason Gunthorpe 2022-11-18  751  EXPORT_SYMBOL_GPL(vfio_init_group_dev);
7e292ed053bcdc7 Jason Gunthorpe 2022-11-18  752  

:::::: The code at line 745 was first introduced by commit
:::::: cba3345cc494ad286ca8823f44b2c16cae496679 vfio: VFIO core

:::::: TO: Alex Williamson <alex.williamson@redhat.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
