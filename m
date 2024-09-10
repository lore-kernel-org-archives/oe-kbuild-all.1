Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5901AAE0B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 20:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726001955; cv=none; b=eGAnGe1YZ/I/2ATAdQobsQy6zFHCKhIh07CpaSZ8qj0pdrfs7CV9EavMOzZ1pIDaHaW5mzOWuewp7FLfXZ7FM+QyyNrWkjMitxOi84cVtKCq97ge016opzHtPOB/aphEKwI48z5c8ElfS4j8FZ3AhZ4frxpV3cvjmv23Rv5QZDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726001955; c=relaxed/simple;
	bh=fRgWAvZ5rOYCvRJFBPPTX+YcFbhveBZmkAZD71KlW1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VO3ENGo/oQynhzAgm7iqG2tOhVPNKOFVWt6tEqONWaqkCtNXyTyPMpt7rdiLISs6YJGSpD+K7nlAFGXnrTat1TN7jjcCCAkM7z4VFm109qz1Sfvw8cgagsqEuN46+4hDp1tblVit2YmeEwGoo/jXM1ITWPei3x3bHqF+nKTpSIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=godzdHZU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="godzdHZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726001954; x=1757537954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fRgWAvZ5rOYCvRJFBPPTX+YcFbhveBZmkAZD71KlW1o=;
  b=godzdHZUU0Me5GT3KIgEnInf0AV4YtANyS9lc8MhdIXlxCQEyGaR4F2U
   JSjb4ZS7+a5j+/Us0Pn6SzJDDtSDugijGtms495lUUWRDOuqfaEEJ2LwK
   I1kvnf3ssmWWIJ1dc+B0Idq9e/KfA8PRVPjvwNcqV8etJSR0HDkpCtnD3
   lYMVvPZ0pc1BUWMRNDiGGrWICV4H7aJTqPKMPnP0dCR3lqHzF1gLsLzjB
   53VDv26X4VnWElhHNvWAUR84moZ8RmInWFMdiIY8ii74TBz2HvbaLoG1I
   xo6jIDX4aZuKv2XpYYc9P20P/d0YKqyXrrgUI7rImq4l8fX40yEbbSPlB
   Q==;
X-CSE-ConnectionGUID: sJFU/pV9S6GGujdF6B8sfw==
X-CSE-MsgGUID: 1wGd95ldTn2t/3NvoRFyTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36154811"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="36154811"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 13:59:10 -0700
X-CSE-ConnectionGUID: ZEwAx3KlRCuJkT3Rca7vIg==
X-CSE-MsgGUID: s2h1gUILQ/e74Mq7Bjtsgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="67906035"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Sep 2024 13:59:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so7x5-0002hQ-1J;
	Tue, 10 Sep 2024 20:59:07 +0000
Date: Wed, 11 Sep 2024 04:58:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240910 34/37]
 drivers/vfio/iommufd.c:208:13: warning: unused variable 'rc'
Message-ID: <202409110414.5ZRILNpy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20240910
head:   47bd94563684b36d40cac3c558ca963539dd5980
commit: 9e5b89906ecb80bb5fb6c18a8c20f4bc185884bf [34/37] vfio-iommufd: Support pasid [at|de]tach for physical VFIO devices
config: arc-randconfig-002-20240911 (https://download.01.org/0day-ci/archive/20240911/202409110414.5ZRILNpy-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409110414.5ZRILNpy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409110414.5ZRILNpy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/vfio/iommufd.c: In function 'vfio_iommufd_physical_pasid_detach_ioas':
>> drivers/vfio/iommufd.c:208:13: warning: unused variable 'rc' [-Wunused-variable]
     208 |         int rc;
         |             ^~


vim +/rc +208 drivers/vfio/iommufd.c

   204	
   205	void vfio_iommufd_physical_pasid_detach_ioas(struct vfio_device *vdev,
   206						     u32 pasid)
   207	{
 > 208		int rc;
   209	
   210		lockdep_assert_held(&vdev->dev_set->lock);
   211	
   212		if (WARN_ON(!vdev->iommufd_device))
   213			return;
   214	
   215		if (!ida_exists(&vdev->pasids, pasid))
   216			return;
   217	
   218		iommufd_device_pasid_detach(vdev->iommufd_device, pasid);
   219		ida_free(&vdev->pasids, pasid);
   220	}
   221	EXPORT_SYMBOL_GPL(vfio_iommufd_physical_pasid_detach_ioas);
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
