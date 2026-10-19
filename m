Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434338;
	b=yXAXsd0ECOeT6Xtjj/+/+mYbGsNItoVOeIek2sZYIStzvX9nsr6i3MfGAn5eiSduZjA/
	 1+JMbarXh9O1qtjNqARJGzN10azLrzV2NwDin+9dqPeqxxYs21rMTIww6yeSOu1W5noqr
	 VmKKBylI3gw1LmwA2ngqs5R07T7Fti8FiOq/9o92SgYcu43s9O3B9WIx2g041Ky9CqzxE
	 VVYOp/OCmpUCxGx9iLzR61y/fbVRgYdWAvxs+eFQVK8NY4RvdEDFhM2jmrLDro/B1OQdg
	 BP8z8jsOwUtyFk77N6KF87X64kWi5G6v1s+9mqhtfh+UVy5QLncUpvvviK2pD95ihpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434338;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JG5h206hRo6iW0TrHuAcKSqCO7RY4RdXhMUKQK0a/SU=;
	b=C3O9wfrK9cU3jjb8vQHcAD9NfkVjcteK/+km9fk+UnunV/1hYjeB05IfwwbJa/90R9lz
	 8rjsaRbtnFFQC+a1jznNuypI9A84snkxX/4ePB51B3KrkHwwKPtoGARDNRFNXJ0KwNN1K
	 dOpwFh/WVU7S0fzdMVDUVAYEaeSKWO0e+zMYLZUwf7wL31PAWmWS95DYjyylHV/5WTtmV
	 MHar1N73cRA3qF15yzxBxbVFFaJghls/03AaGCAGXHkqWGxiUSgrhDwG174P47GES5PTc
	 QDa208dZK9F6mLB5MHVaUTQwjYPhe7lBqq+9tf3UKmFbESTngaL5iJTyPdnbL1vbNUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KKfBXdqS;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E4E606A31B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 18:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15E4E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KKfBXdqS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792434338; x=1823970338;
  h=date:from:to:cc:subject:message-id;
  bh=+tIcgTpYeUYiSVYtee6Va55A7EqNK22YUlDKpvXDY7s=;
  b=KKfBXdqSr5rUWRdJmeT3fAgE+KA483kQ7V6TaYuYX1iiKFNXsA++Kgfq
   zmtVE8i3Fv3a/1WNPoDSTKJg69KuuB1F7u7t9fQInh2p/Il15yUlY0cWT
   NA9Uue4HFkzEp2l8fdfKF+Rl/G92ihlM97coxY7JnUnOVZDXpFfYzvXlw
   U56XvzrvRg1BlIAcPqcTpU7l1AUYnOHmtWOizr/H+dnRGem0u2mlnk+VH
   tY1H7rtrovObg7zjLcSj2ItcgkVue8k+o5ghvPz1yn0DbT2LBM4l12zXo
   ZLt2x7ftMTkIv7DCcYheMt9i1WTQqkbLtPOWseOBThShqKqu6ogd1x4QR
   w==;
X-CSE-ConnectionGUID: gztBYbRVSvaOYsi6s42ZkQ==
X-CSE-MsgGUID: P2Gsl3X6T225vF3MhuvKpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1010544"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1010544"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 11:25:37 -0700
X-CSE-ConnectionGUID: FBOO53xLSGGDKroEHEmV0Q==
X-CSE-MsgGUID: CsPljI08TTiQVM9rrutiuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2564877"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 19 Oct 2026 11:25:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIs3B-000000005p1-1SZJ;
	Mon, 19 Oct 2026 18:25:33 +0000
Date: Mon, 19 Oct 2026 20:25:11 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-10 1/1]
 drivers/vfio/vfio.c:527: warning: Function parameter or member 'device' not
 described in 'vfio_device_put'
Message-ID: <202610192036.15w73rFB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.10-2026-10
head:   a4c2f82969bc5fa7fcc21ede4b690ece7ff72335
commit: a2fbf4acd28069d4922c33e4b5b0d58fc38073f8 [1/1] vfio: Split creation of a vfio_device into init and register ops
config: arm-randconfig-r2104-20261018 (https://download.01.org/0day-ci/archive/20261019/202610192036.15w73rFB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610192036.15w73rFB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610192036.15w73rFB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/vfio/vfio.c:214: warning: Function parameter or member 'ops' not described in 'vfio_register_iommu_driver'
   drivers/vfio/vfio.c:263: warning: Function parameter or member 'group' not described in 'vfio_alloc_group_minor'
   drivers/vfio/vfio.c:283: warning: Function parameter or member 'container' not described in 'vfio_container_get'
   drivers/vfio/vfio.c:315: warning: Function parameter or member 'iommu_group' not described in 'vfio_create_group'
>> drivers/vfio/vfio.c:527: warning: Function parameter or member 'device' not described in 'vfio_device_put'
   drivers/vfio/vfio.c:633: warning: Function parameter or member 'group' not described in 'vfio_group_nb_add_dev'
   drivers/vfio/vfio.c:633: warning: Function parameter or member 'dev' not described in 'vfio_group_nb_add_dev'
>> drivers/vfio/vfio.c:745: warning: Function parameter or member 'device' not described in 'vfio_init_group_dev'
>> drivers/vfio/vfio.c:745: warning: Function parameter or member 'dev' not described in 'vfio_init_group_dev'
>> drivers/vfio/vfio.c:745: warning: Function parameter or member 'ops' not described in 'vfio_init_group_dev'
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
   drivers/vfio/vfio.c:2298: warning: Function parameter or member 'dev' not described in 'vfio_devnode'
   drivers/vfio/vfio.c:2298: warning: Function parameter or member 'mode' not described in 'vfio_devnode'


vim +527 drivers/vfio/vfio.c

7ed3ea8a71187a Kirti Wankhede          2016-11-17  521  
cba3345cc494ad Alex Williamson         2012-07-31  522  /**
cba3345cc494ad Alex Williamson         2012-07-31  523   * Device objects - create, release, get, put, search
cba3345cc494ad Alex Williamson         2012-07-31  524   */
cba3345cc494ad Alex Williamson         2012-07-31  525  /* Device reference always implies a group reference */
44f507163d9e51 Vijay Mohan Pandarathil 2013-03-11  526  void vfio_device_put(struct vfio_device *device)
cba3345cc494ad Alex Williamson         2012-07-31 @527  {
f54fa910e6cb5b Jason Gunthorpe         2021-03-30  528  	if (refcount_dec_and_test(&device->refcount))
f54fa910e6cb5b Jason Gunthorpe         2021-03-30  529  		complete(&device->comp);
cba3345cc494ad Alex Williamson         2012-07-31  530  }
44f507163d9e51 Vijay Mohan Pandarathil 2013-03-11  531  EXPORT_SYMBOL_GPL(vfio_device_put);
cba3345cc494ad Alex Williamson         2012-07-31  532  

:::::: The code at line 527 was first introduced by commit
:::::: cba3345cc494ad286ca8823f44b2c16cae496679 vfio: VFIO core

:::::: TO: Alex Williamson <alex.williamson@redhat.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
