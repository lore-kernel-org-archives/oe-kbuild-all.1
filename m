Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B126B23BC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 15:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693583267; x=1725119267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Swk+GeFndGhW5jTc6iI0hsw9dSkS+cL7w8NktZipq3A=;
  b=h3uqmpCF8c9vIsnc+ERas7kbehVHYpRNh293Ir20CzOM5Qr+RULrtWv3
   EnSkFBYLlCtG3JJ2Tmg5MKHbpqe2hVrC16O/piswsiiaFruJWw5NJcSS5
   SHIUc/5G2Gxo2CRxxn5DkubnvfOQRlKakzcw3ojc9kiiV7nWkQOlEyUp4
   hFJ7pCkutZn19M0bbBassBvdFfwD4KCeHpq6AX18zT2/9Z5EjQ7kZxvSG
   AqLk3vHmX26wp0yHHX3SoVxMvrgYUMU0LPZqA127AZyEFNLR+oID3WkSy
   p1kGwmN+f0xSsqNweqakZexbc/Na3Hr/IgEIzMwVNE/vnP8TzWAGtwODZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="373641326"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="373641326"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 08:47:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="810118135"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="810118135"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Sep 2023 08:47:43 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc6N4-0001Q3-2M;
	Fri, 01 Sep 2023 15:47:42 +0000
Date: Fri, 1 Sep 2023 23:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Anish Ghulati <aghulati@google.com>
Subject: [sean-jc:x86/hide_kvm_details 180/187] drivers/vfio/group.c:218:23:
 error: implicit declaration of function 'vfio_device_group_get_kvm_safe';
 did you mean 'vfio_device_get_kvm_safe'?
Message-ID: <202309012357.oI5hniHd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/hide_kvm_details
head:   f2de177a2d8f1b545e0c199bf68cf80d7727c2f5
commit: 2547667bd2e567b534e2588c6fa9a972ef718769 [180/187] tmp
config: loongarch-randconfig-r024-20230901 (https://download.01.org/0day-ci/archive/20230901/202309012357.oI5hniHd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309012357.oI5hniHd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309012357.oI5hniHd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/group.c: In function 'vfio_device_group_open':
>> drivers/vfio/group.c:218:23: error: implicit declaration of function 'vfio_device_group_get_kvm_safe'; did you mean 'vfio_device_get_kvm_safe'? [-Werror=implicit-function-declaration]
     218 |                 ret = vfio_device_group_get_kvm_safe(device);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       vfio_device_get_kvm_safe
   cc1: some warnings being treated as errors


vim +218 drivers/vfio/group.c

   198	
   199	static int vfio_device_group_open(struct vfio_device *device)
   200	{
   201		int ret;
   202	
   203		mutex_lock(&device->group->group_lock);
   204		if (!vfio_group_has_iommu(device->group)) {
   205			ret = -EINVAL;
   206			goto out_unlock;
   207		}
   208	
   209		mutex_lock(&device->dev_set->lock);
   210	
   211		/*
   212		 * Before the first device open, get the KVM pointer currently
   213		 * associated with the group (if there is one) and obtain a reference
   214		 * now that will be held until the open_count reaches 0 again.  Save
   215		 * the pointer in the device for use by drivers.
   216		 */
   217		if (device->open_count == 0) {
 > 218			ret = vfio_device_group_get_kvm_safe(device);
   219			if (ret)
   220				goto out_unlock_device;
   221		}
   222	
   223		ret = vfio_device_open(device, device->group->iommufd);
   224	
   225		if (device->open_count == 0) {
   226			ret = vfio_device_group_get_kvm_safe(device);
   227			if (ret)
   228				goto out_unlock_device;
   229		}
   230	
   231	out_unlock_device:
   232		mutex_unlock(&device->dev_set->lock);
   233	out_unlock:
   234		mutex_unlock(&device->group->group_lock);
   235		return ret;
   236	}
   237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
