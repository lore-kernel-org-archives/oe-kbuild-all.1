Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB5E178378
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725103385; cv=none; b=UR5pW8SY+R4mIrcMqutXDaFWq5t4Tm1FItbVe2d40Q+lpy/WHYd6RBIKL3YXvYxMu4wjJRtogpakjrTjhDvr+fhOixb89YwpGiCmhxdkBms3FXqWHB7CRRFtUqJbfU9XLXvW9XEXC2r4nS4rXG985gr1P4e9YnSbSmfdwwSwllM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725103385; c=relaxed/simple;
	bh=6szRXDdcL9Gv+X3/qPMVDSFSvLMpwlv56BGd18gQCzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=drA+6uM4F7fLEun5xQWVdQgomUP4h5SA2Kl85HVQD1Q4Y9AlbJJLlzJXhwKRx4FHh5nzLTWbNQZ2ofPHd1tCjY6VWMvSKI2vX/KKN7RgzZqoEuj4hjPIOK3hqyzllOhvfDKqjb7aTN9IbrdnnDiUv3CSYbn0Uvv5B+LtCHmfMEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQDflqN2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQDflqN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725103383; x=1756639383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6szRXDdcL9Gv+X3/qPMVDSFSvLMpwlv56BGd18gQCzs=;
  b=TQDflqN2a6tD6mg45CvTa0TLupUfvUv9Zmfy35GTKpaDWGwX31tPwE2b
   q6IZjz0BrYdWTNebBQ35KFFx/e4pWprYV0ShZheAbIEYGtU451phyQiKo
   JZPuFMvq/+xnc6YL6zjSF/GTS1RUDJcguroc4h0HkyJWEKhDq7bFt5moy
   UCMRSiQ9hsebP3J7xyLywHf7/oTTzakeogXY4MyuCiTgopjjaL0OhfGWG
   VVYqqv23OJIHgC5tHDuaO+4QiHFU8M2yTDjTZz0tSJt8W3tb0CYzVs9i/
   8CBkMwGcOV9w7q0tNweMTEznyPqU1yWdelyp56LBWu4peHzY3elu8R2xw
   A==;
X-CSE-ConnectionGUID: kX5EER6WT1mYFLjePkadrA==
X-CSE-MsgGUID: PY1bQ37UQBeCYCjpUpK4iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23701520"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="23701520"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 04:23:02 -0700
X-CSE-ConnectionGUID: 93yupJ0MQHuqytvIxtsHug==
X-CSE-MsgGUID: rswksChDT9Wor2vzcK4fVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="64641704"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Aug 2024 04:23:01 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skMC3-0002gN-1b;
	Sat, 31 Aug 2024 11:22:59 +0000
Date: Sat, 31 Aug 2024 19:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240830-notest-yet 22/22]
 drivers/iommu/iommufd/pasid.c:66:42: error: passing argument 1 of
 'iommufd_hwpt_replace_device' from incompatible pointer type
Message-ID: <202408311946.55a92nii-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20240830-notest-yet
head:   aa93c979a57a5a050175b1d62886d9eb31dc0a6c
commit: aa93c979a57a5a050175b1d62886d9eb31dc0a6c [22/22] iommufd: Support attach/replace hwpt per pasid
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240831/202408311946.55a92nii-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408311946.55a92nii-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311946.55a92nii-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/iommufd/pasid.c:4:
   include/linux/iommufd.h:30:33: error: unknown type name 'ioasid_t'
      30 |                                 ioasid_t pasid, u32 *pt_id);
         |                                 ^~~~~~~~
   include/linux/iommufd.h:32:34: error: unknown type name 'ioasid_t'
      32 |                                  ioasid_t pasid, u32 *pt_id);
         |                                  ^~~~~~~~
   include/linux/iommufd.h:33:63: error: unknown type name 'ioasid_t'
      33 | void iommufd_device_pasid_detach(struct iommufd_device *idev, ioasid_t pasid);
         |                                                               ^~~~~~~~
   drivers/iommu/iommufd/pasid.c: In function 'iommufd_device_pasid_do_replace':
>> drivers/iommu/iommufd/pasid.c:66:42: error: passing argument 1 of 'iommufd_hwpt_replace_device' from incompatible pointer type [-Wincompatible-pointer-types]
      66 |         rc = iommufd_hwpt_replace_device(hwpt, idev, pasid, hwpt, curr);
         |                                          ^~~~
         |                                          |
         |                                          struct iommufd_hw_pagetable *
   In file included from drivers/iommu/iommufd/pasid.c:8:
   drivers/iommu/iommufd/iommufd_private.h:592:70: note: expected 'struct iommufd_device *' but argument is of type 'struct iommufd_hw_pagetable *'
     592 | static inline int iommufd_hwpt_replace_device(struct iommufd_device *idev,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> drivers/iommu/iommufd/pasid.c:66:48: error: passing argument 2 of 'iommufd_hwpt_replace_device' makes integer from pointer without a cast [-Wint-conversion]
      66 |         rc = iommufd_hwpt_replace_device(hwpt, idev, pasid, hwpt, curr);
         |                                                ^~~~
         |                                                |
         |                                                struct iommufd_device *
   drivers/iommu/iommufd/iommufd_private.h:593:56: note: expected 'ioasid_t' {aka 'unsigned int'} but argument is of type 'struct iommufd_device *'
     593 |                                               ioasid_t pasid,
         |                                               ~~~~~~~~~^~~~~
>> drivers/iommu/iommufd/pasid.c:66:54: error: passing argument 3 of 'iommufd_hwpt_replace_device' makes pointer from integer without a cast [-Wint-conversion]
      66 |         rc = iommufd_hwpt_replace_device(hwpt, idev, pasid, hwpt, curr);
         |                                                      ^~~~~
         |                                                      |
         |                                                      ioasid_t {aka unsigned int}
   drivers/iommu/iommufd/iommufd_private.h:594:76: note: expected 'struct iommufd_hw_pagetable *' but argument is of type 'ioasid_t' {aka 'unsigned int'}
     594 |                                               struct iommufd_hw_pagetable *hwpt,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> drivers/iommu/iommufd/pasid.c:66:14: error: too many arguments to function 'iommufd_hwpt_replace_device'
      66 |         rc = iommufd_hwpt_replace_device(hwpt, idev, pasid, hwpt, curr);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/iommufd_private.h:592:19: note: declared here
     592 | static inline int iommufd_hwpt_replace_device(struct iommufd_device *idev,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pasid.c: At top level:
   drivers/iommu/iommufd/pasid.c:98:5: warning: no previous prototype for 'iommufd_device_pasid_attach' [-Wmissing-prototypes]
      98 | int iommufd_device_pasid_attach(struct iommufd_device *idev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pasid.c:126:5: warning: no previous prototype for 'iommufd_device_pasid_replace' [-Wmissing-prototypes]
     126 | int iommufd_device_pasid_replace(struct iommufd_device *idev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pasid.c:147:6: warning: no previous prototype for 'iommufd_device_pasid_detach' [-Wmissing-prototypes]
     147 | void iommufd_device_pasid_detach(struct iommufd_device *idev, ioasid_t pasid)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/iommufd_hwpt_replace_device +66 drivers/iommu/iommufd/pasid.c

    39	
    40	struct iommufd_hw_pagetable *
    41	iommufd_device_pasid_do_replace(struct iommufd_device *idev, ioasid_t pasid,
    42					struct iommufd_hw_pagetable *hwpt)
    43	{
    44		void *curr;
    45		int rc;
    46	
    47		refcount_inc(&hwpt->obj.users);
    48		curr = xa_store(&idev->pasid_hwpts, pasid, hwpt, GFP_KERNEL);
    49		rc = xa_err(curr);
    50		if (rc)
    51			goto out_put_hwpt;
    52	
    53		if (!curr) {
    54			xa_erase(&idev->pasid_hwpts, pasid);
    55			rc = -EINVAL;
    56			goto out_put_hwpt;
    57		}
    58	
    59		if (curr == hwpt)
    60			goto out_put_hwpt;
    61	
    62		/*
    63		 * After replacement, the reference on the old hwpt is retained
    64		 * in this thread as caller would free it.
    65		 */
  > 66		rc = iommufd_hwpt_replace_device(hwpt, idev, pasid, hwpt, curr);
    67		if (rc) {
    68			WARN_ON(xa_err(xa_store(&idev->pasid_hwpts, pasid,
    69						curr, GFP_KERNEL)));
    70			goto out_put_hwpt;
    71		}
    72	
    73		/* Caller must destroy old_hwpt */
    74		return curr;
    75	
    76	out_put_hwpt:
    77		refcount_dec(&hwpt->obj.users);
    78		return ERR_PTR(rc);
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
