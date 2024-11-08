Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09E921FDA9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 15:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731081191; cv=none; b=mAwqQMLTP74OGcYFbpmJjodPUmcVBxWx6BRnAcE83RDzX2lNb5lkCn87dXSjVQUrY8VVlFHVhkIm5BvIzjtwDBmWwzq9gWV9o7BLq5LJZb7kPgjHk9I6bYxpHjYBDSyDpzbOVLecpHgmKhPSamD5ECh56DApEFRtEnMG5mw8nvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731081191; c=relaxed/simple;
	bh=oMMP8cTf4Z2iBXWs8ua9DlWZJNVbyhdpdO1po9UoAJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiTJPEVKp9zJ+QtV/06BIt++meXvXVgvN0HBofk5HZQ0OWVgJNFAi2G67E/4fLi5c5ps4BHNVHKGMOkq7cFhh0vHaQ59PDYYxrq5imcHAZG4V1L+A4f6CF3oJkkJWppvKB3TyZA3zZPI/YqtPkiahFKN+pAQh0Pp3zfQ8IdKWXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDMlDjlq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDMlDjlq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731081189; x=1762617189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oMMP8cTf4Z2iBXWs8ua9DlWZJNVbyhdpdO1po9UoAJ8=;
  b=dDMlDjlqtZUjyFQMawitMXzzW+p9fIWtb1ywtR6ZIAHUnssuFQ+W0d9D
   i74OfSTaXCYI0Xmu3yDbHQv/YDRYM/1nsRXKLVqypWJnegzPTEZ3glDKn
   8ueSQFAnaxgDXEm9wqkkH2XNnBPpJHa1t5HUj0g3Dr18ZeOA5QPE0nu/Z
   sDiiDaCNf/DfEakDgJ8FFudRg99sc/rhwvxvnpb+ZTroxlglDt1GCvDnZ
   kG6QpepbXbGA53XXIvS3i1/Xd4DnfAVI3C0Y7QoU/IEMh3hIw6NOy4vMq
   NpcGhQjkpG8cdRE3LSiVJqMBxInRh6wP772cxiG3D6qmP7jkzmj8IZ/wB
   A==;
X-CSE-ConnectionGUID: 2fn7He/zQK2tX/ZNvgB7BQ==
X-CSE-MsgGUID: h+5vvFf0T2+tzJdysSiVPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30384248"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="30384248"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 07:53:09 -0800
X-CSE-ConnectionGUID: 8G3xdaK/ShORCU2Gt8vGPw==
X-CSE-MsgGUID: u1JgxHdBTiqBPbFJAwDYGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="85867464"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Nov 2024 07:53:08 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9RII-000rZ0-13;
	Fri, 08 Nov 2024 15:53:06 +0000
Date: Fri, 8 Nov 2024 23:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/5] vfio-iommufd: Support pasid [at|de]tach for
 physical VFIO devices
Message-ID: <202411082315.10rfpMKh-lkp@intel.com>
References: <20241108121742.18889-3-yi.l.liu@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108121742.18889-3-yi.l.liu@intel.com>

Hi Yi,

kernel test robot noticed the following build errors:

[auto build test ERROR on awilliam-vfio/next]
[also build test ERROR on akpm-mm/mm-nonmm-unstable pci/next pci/for-linus linus/master awilliam-vfio/for-linus v6.12-rc6 next-20241108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-Liu/ida-Add-ida_find_first_range/20241108-202010
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20241108121742.18889-3-yi.l.liu%40intel.com
patch subject: [PATCH v5 2/5] vfio-iommufd: Support pasid [at|de]tach for physical VFIO devices
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20241108/202411082315.10rfpMKh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411082315.10rfpMKh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411082315.10rfpMKh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/iommufd.c: In function 'vfio_iommufd_physical_unbind':
>> drivers/vfio/iommufd.c:134:17: error: implicit declaration of function 'iommufd_device_pasid_detach'; did you mean 'iommufd_device_detach'? [-Werror=implicit-function-declaration]
     134 |                 iommufd_device_pasid_detach(vdev->iommufd_device, pasid);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 iommufd_device_detach
   drivers/vfio/iommufd.c: In function 'vfio_iommufd_physical_pasid_attach_ioas':
>> drivers/vfio/iommufd.c:190:24: error: implicit declaration of function 'iommufd_device_pasid_replace'; did you mean 'iommufd_device_replace'? [-Werror=implicit-function-declaration]
     190 |                 return iommufd_device_pasid_replace(vdev->iommufd_device,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        iommufd_device_replace
>> drivers/vfio/iommufd.c:197:14: error: implicit declaration of function 'iommufd_device_pasid_attach'; did you mean 'iommufd_device_attach'? [-Werror=implicit-function-declaration]
     197 |         rc = iommufd_device_pasid_attach(vdev->iommufd_device, pasid, pt_id);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |              iommufd_device_attach
   cc1: some warnings being treated as errors


vim +134 drivers/vfio/iommufd.c

   126	
   127	void vfio_iommufd_physical_unbind(struct vfio_device *vdev)
   128	{
   129		int pasid;
   130	
   131		lockdep_assert_held(&vdev->dev_set->lock);
   132	
   133		while ((pasid = ida_find_first(&vdev->pasids)) >= 0) {
 > 134			iommufd_device_pasid_detach(vdev->iommufd_device, pasid);
   135			ida_free(&vdev->pasids, pasid);
   136		}
   137	
   138		if (vdev->iommufd_attached) {
   139			iommufd_device_detach(vdev->iommufd_device);
   140			vdev->iommufd_attached = false;
   141		}
   142		iommufd_device_unbind(vdev->iommufd_device);
   143		vdev->iommufd_device = NULL;
   144	}
   145	EXPORT_SYMBOL_GPL(vfio_iommufd_physical_unbind);
   146	
   147	int vfio_iommufd_physical_attach_ioas(struct vfio_device *vdev, u32 *pt_id)
   148	{
   149		int rc;
   150	
   151		lockdep_assert_held(&vdev->dev_set->lock);
   152	
   153		if (WARN_ON(!vdev->iommufd_device))
   154			return -EINVAL;
   155	
   156		if (vdev->iommufd_attached)
   157			rc = iommufd_device_replace(vdev->iommufd_device, pt_id);
   158		else
   159			rc = iommufd_device_attach(vdev->iommufd_device, pt_id);
   160		if (rc)
   161			return rc;
   162		vdev->iommufd_attached = true;
   163		return 0;
   164	}
   165	EXPORT_SYMBOL_GPL(vfio_iommufd_physical_attach_ioas);
   166	
   167	void vfio_iommufd_physical_detach_ioas(struct vfio_device *vdev)
   168	{
   169		lockdep_assert_held(&vdev->dev_set->lock);
   170	
   171		if (WARN_ON(!vdev->iommufd_device) || !vdev->iommufd_attached)
   172			return;
   173	
   174		iommufd_device_detach(vdev->iommufd_device);
   175		vdev->iommufd_attached = false;
   176	}
   177	EXPORT_SYMBOL_GPL(vfio_iommufd_physical_detach_ioas);
   178	
   179	int vfio_iommufd_physical_pasid_attach_ioas(struct vfio_device *vdev,
   180						    u32 pasid, u32 *pt_id)
   181	{
   182		int rc;
   183	
   184		lockdep_assert_held(&vdev->dev_set->lock);
   185	
   186		if (WARN_ON(!vdev->iommufd_device))
   187			return -EINVAL;
   188	
   189		if (ida_exists(&vdev->pasids, pasid))
 > 190			return iommufd_device_pasid_replace(vdev->iommufd_device,
   191							    pasid, pt_id);
   192	
   193		rc = ida_alloc_range(&vdev->pasids, pasid, pasid, GFP_KERNEL);
   194		if (rc < 0)
   195			return rc;
   196	
 > 197		rc = iommufd_device_pasid_attach(vdev->iommufd_device, pasid, pt_id);
   198		if (rc)
   199			ida_free(&vdev->pasids, pasid);
   200	
   201		return rc;
   202	}
   203	EXPORT_SYMBOL_GPL(vfio_iommufd_physical_pasid_attach_ioas);
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
