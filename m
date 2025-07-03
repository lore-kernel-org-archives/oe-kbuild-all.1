Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D8D2BD005
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 20:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575298; cv=none; b=BT9LMVHq78vmkF12ZYV+cXjkx9UElRHfw8oo2+zkWgCOg+cx1d9dvSYo5xxlyNezl0JLkuYnUO2ixEqiJkctkX47JXff9idTC9Ew1R7cpVla4nAm3yXgvZgb215XazhXkhKRxTvZVPGad93dpdTImwTUFXTu5jTZfNfiGsdm6lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575298; c=relaxed/simple;
	bh=UBbrgOoR/ZRCGiPgv5YzKOhrX3w/W9M2O6aLK7PxgQw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rWZz0UeH+DeTQfso9rhP2l27icUZqF40bYdoqNYHNhdvcRDXio7IFixpn23MSKQBXYjLk505c1Q7m+ReGSwX3jUpk3mTiPLZD+eu2fhhs49RuHnTP7gsWFuDGV4+tjZsMA1YOoFnxPFQYK3qnHJiwYabt5pypzdLry8BdnEmBzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1npjAU3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1npjAU3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751575297; x=1783111297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UBbrgOoR/ZRCGiPgv5YzKOhrX3w/W9M2O6aLK7PxgQw=;
  b=e1npjAU3PKfhEOun+afyuWqrQsV43diazZY3JiCjtu9D3iytERyXJWiB
   BTT+cczsruxVeeS+UBlKmD5RStuEUJSNJ2IyVUdRXjDXzw98uGtLWQEqH
   j6Bq/ByZcMGNQshrE7b4XYhgQwjX1/oaAYvoAZd1b75z51GAC+Ds6K3Wm
   zmDU5iN5yikakImWj1OQ4MLPxW0cMkyG4hRan4iwaKqc10Y74s6DhKRrE
   m5g9t7qrDhew8VIl5lGUTsaw2pSmZ6sPqC6RzXRmVywmsNsl0KPappEzu
   5rcmFTTGlSies5mLKKFC4L+IHCPh8McQrQCrBupxLpHB4xVqIo2jE5XB3
   Q==;
X-CSE-ConnectionGUID: 7ECbiP6/TMesIteJCLYFjA==
X-CSE-MsgGUID: 9RRKGKSFRx+v1RrLkolY5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53137827"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="53137827"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 13:41:34 -0700
X-CSE-ConnectionGUID: Jv1gcwX8S+WgQUPA5mc/Lg==
X-CSE-MsgGUID: R04QDVt4SySTVelc7r04yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="155032021"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jul 2025 13:41:34 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXQkN-0002zV-0w;
	Thu, 03 Jul 2025 20:41:31 +0000
Date: Fri, 4 Jul 2025 04:41:10 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 13/13] drivers/vfio/vfio_main.c:602:
 warning: Function parameter or member 'device' not described in
 'vfio_device_put_registration'
Message-ID: <202507040401.0pZyhY74-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kevin,

First bad commit (maybe != root cause):

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   e19c0b65fe0e6ed2dcda7cb2f7c66806af85a6e6
commit: e19c0b65fe0e6ed2dcda7cb2f7c66806af85a6e6 [13/13] vfio: Rename vfio_device_put() and vfio_device_try_get()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250704/202507040401.0pZyhY74-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040401.0pZyhY74-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040401.0pZyhY74-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/vfio/vfio_main.c:289: warning: Function parameter or member 'ops' not described in 'vfio_register_iommu_driver'
   drivers/vfio/vfio_main.c:338: warning: Function parameter or member 'group' not described in 'vfio_alloc_group_minor'
   drivers/vfio/vfio_main.c:358: warning: Function parameter or member 'container' not described in 'vfio_container_get'
   drivers/vfio/vfio_main.c:390: warning: Function parameter or member 'iommu_group' not described in 'vfio_create_group'
>> drivers/vfio/vfio_main.c:602: warning: Function parameter or member 'device' not described in 'vfio_device_put_registration'
   drivers/vfio/vfio_main.c:709: warning: Function parameter or member 'group' not described in 'vfio_group_nb_add_dev'
   drivers/vfio/vfio_main.c:709: warning: Function parameter or member 'dev' not described in 'vfio_group_nb_add_dev'
   drivers/vfio/vfio_main.c:821: warning: Function parameter or member 'device' not described in 'vfio_init_group_dev'
   drivers/vfio/vfio_main.c:821: warning: Function parameter or member 'dev' not described in 'vfio_init_group_dev'
   drivers/vfio/vfio_main.c:821: warning: Function parameter or member 'ops' not described in 'vfio_init_group_dev'
   drivers/vfio/vfio_main.c:990: warning: Function parameter or member 'dev' not described in 'vfio_device_get_from_dev'
   drivers/vfio/vfio_main.c:1118: warning: Function parameter or member 'container' not described in 'vfio_ioctl_check_extension'
   drivers/vfio/vfio_main.c:1118: warning: Function parameter or member 'arg' not described in 'vfio_ioctl_check_extension'
   drivers/vfio/vfio_main.c:1389: warning: Function parameter or member 'group' not described in '__vfio_group_unset_container'
   drivers/vfio/vfio_main.c:1740: warning: Function parameter or member 'inode' not described in 'vfio_device_fops_release'
   drivers/vfio/vfio_main.c:1740: warning: Function parameter or member 'filep' not described in 'vfio_device_fops_release'
   drivers/vfio/vfio_main.c:2401: warning: Function parameter or member 'filep' not described in 'vfio_group_get_external_user'
   drivers/vfio/vfio_main.c:2438: warning: Function parameter or member 'dev' not described in 'vfio_group_get_external_user_from_dev'
   drivers/vfio/vfio_main.c:2498: warning: Function parameter or member 'caps' not described in 'vfio_info_cap_add'
   drivers/vfio/vfio_main.c:2498: warning: Function parameter or member 'size' not described in 'vfio_info_cap_add'
   drivers/vfio/vfio_main.c:2498: warning: Function parameter or member 'id' not described in 'vfio_info_cap_add'
   drivers/vfio/vfio_main.c:2498: warning: Function parameter or member 'version' not described in 'vfio_info_cap_add'
   drivers/vfio/vfio_main.c:3036: warning: Function parameter or member 'dev' not described in 'vfio_devnode'
   drivers/vfio/vfio_main.c:3036: warning: Function parameter or member 'mode' not described in 'vfio_devnode'


vim +602 drivers/vfio/vfio_main.c

7ed3ea8a71187a drivers/vfio/vfio.c      Kirti Wankhede  2016-11-17  596  
cba3345cc494ad drivers/vfio/vfio.c      Alex Williamson 2012-07-31  597  /**
cba3345cc494ad drivers/vfio/vfio.c      Alex Williamson 2012-07-31  598   * Device objects - create, release, get, put, search
cba3345cc494ad drivers/vfio/vfio.c      Alex Williamson 2012-07-31  599   */
cba3345cc494ad drivers/vfio/vfio.c      Alex Williamson 2012-07-31  600  /* Device reference always implies a group reference */
e19c0b65fe0e6e drivers/vfio/vfio_main.c Kevin Tian      2022-09-21  601  void vfio_device_put_registration(struct vfio_device *device)
cba3345cc494ad drivers/vfio/vfio.c      Alex Williamson 2012-07-31 @602  {
3408686e4430d8 drivers/vfio/vfio.c      Jason Gunthorpe 2021-03-30  603  	if (refcount_dec_and_test(&device->refcount))
3408686e4430d8 drivers/vfio/vfio.c      Jason Gunthorpe 2021-03-30  604  		complete(&device->comp);
cba3345cc494ad drivers/vfio/vfio.c      Alex Williamson 2012-07-31  605  }
e19c0b65fe0e6e drivers/vfio/vfio_main.c Kevin Tian      2022-09-21  606  EXPORT_SYMBOL_GPL(vfio_device_put_registration);
cba3345cc494ad drivers/vfio/vfio.c      Alex Williamson 2012-07-31  607  

:::::: The code at line 602 was first introduced by commit
:::::: cba3345cc494ad286ca8823f44b2c16cae496679 vfio: VFIO core

:::::: TO: Alex Williamson <alex.williamson@redhat.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
