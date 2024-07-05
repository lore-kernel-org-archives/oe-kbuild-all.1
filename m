Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494F0146A79
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 23:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720221076; cv=none; b=oBIMxIupVFdIWNh8mWbo+MenYBgZmYtujaABkN0sPVGVltaUuVSdWOBVadbUKi0C4PfNv5/BiNln9RWtdsIFnJCwKyAPHZKZVPl5SpB9kxglmX3rLygyqM4PJqZF/LuXhSk399qtsyh7HNkzoHjlwBV4mVVHprGuiYcPCT2hWqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720221076; c=relaxed/simple;
	bh=7Xc3sHgjsMmdHomlBEiECJUfFN8wD8B2teBsCGlCAKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nJPCIgLkxG+cc9WzeQhiB2GMtP5nZju41S+BfFJOfc50YLqmcvJSa6hjwRgDSl1FB1i3iAIuUbzw4ofte3LenmVv7uUEJ8uL2lLWq4CZR77ZWudCkwvtzy3VRlQ5QToCeWBPlQ/7hAaFGKdxP1HDtON6Zk5qPi2oc3LQ1p/iXww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UyjvSVoh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UyjvSVoh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720221074; x=1751757074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Xc3sHgjsMmdHomlBEiECJUfFN8wD8B2teBsCGlCAKo=;
  b=UyjvSVohEODE63yaN4FwPjSEWH4l9c1Fd8T3yxA1CyRQeWcOkFOFI0Sq
   pFrc1rGPTTUFrGV8I+HWhpfzGmO6hrWlB04QXnyAzKXX0R/jRg+OYPKk2
   PK0g/ZB6Rlvw+PvGgYlm/qZ0boxPAuE7zpokKztpnEdMXhmaOEqMNBEFP
   xKgxojjmiEEOWhshj368FtwLdHOcu+LkYhSNF7l0RIvyyS2WOm0AZTHPd
   j6f9nL1rnzeB8h1yjNNM8B6uyk1DiNWy3C5TlDilmhEOCsVEW09tq0H6j
   sB/G0ZbhqR4SkKs2KDDVM20CGD5Uuc5gyUbUNPURCNh1ErCD26RC39QrQ
   g==;
X-CSE-ConnectionGUID: jcvwDqwuQIiQ4s/S5VAn7w==
X-CSE-MsgGUID: D3LXvx4mQzmGEa0iEPajPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17382533"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="17382533"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 16:11:13 -0700
X-CSE-ConnectionGUID: +m/iu/qzTzKkWleoM86cJA==
X-CSE-MsgGUID: mLXHnC2dRZy68kfgRsplEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="52158910"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Jul 2024 16:11:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPs57-000T0C-35;
	Fri, 05 Jul 2024 23:11:09 +0000
Date: Sat, 6 Jul 2024 07:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240705 18/20]
 drivers/vfio/iommufd.c:208:13: warning: unused variable 'rc'
Message-ID: <202407060714.PoGJAQxm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20240705
head:   e8ad31c5d95dbf6e57bdc334f3fb9e1e917c94c3
commit: 8e601c85c6ffb6533e64fdfb8af9b7a67387c2a4 [18/20] vfio-iommufd: Support pasid [at|de]tach for physical VFIO devices
config: arm64-randconfig-001-20240706 (https://download.01.org/0day-ci/archive/20240706/202407060714.PoGJAQxm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407060714.PoGJAQxm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407060714.PoGJAQxm-lkp@intel.com/

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
