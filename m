Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719F9329E7E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 03:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769831088; cv=none; b=AR5aTfExtJSkb7z59iws8F4fpM/r1YP42MixDbPnEYUiyhu1e/hjHfrrigPM+fgPsUxrcMM/8eZIWQ4tYhM3gXV/EiNFWRZx6Ny+VyUDaE3ZXp+RB53eiH8tvAxcl8v7tqj2IW1pY+34nYRaL7OPaKvnLjeLwetuhM3W1+CF//4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769831088; c=relaxed/simple;
	bh=WAluWMtBs17x+IDSkpeWwRII1IKBjTGfRDgx4H1LOJY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bRSsml+nGPj1ezt+uasjMazxN5l5Gwl8ioMp8q4oqV4UgIvGNSfBb7/H2TrqMVPV+ZD/+aInlzzBOSpGo8BvpUdcC6zRgiwt+xgR9j3N7l8SS+HulS/MPZm+clRF/Osw0frrE0M7/NFpa4YhOMBQmnOvAip4+PEpHZ+A23NUpEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gi4s6mpZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gi4s6mpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769831087; x=1801367087;
  h=date:from:to:cc:subject:message-id;
  bh=WAluWMtBs17x+IDSkpeWwRII1IKBjTGfRDgx4H1LOJY=;
  b=Gi4s6mpZhhOC1IhyTN6c3X0KjCbLrHa1GCh6TiSjNGZhfv5uG5Ost8Bk
   SzHgIJFfcmbQ8LBWRTcUjQjeWPqc1EkVNIc30vQSs0uQukke5lro6iI7V
   JwpNA2pl/g8isOCraOJcPtD8oqIINusrLJMH5IUtA0FsCxZbSFvAwxeGj
   0yBkmkgTnD5QejbDK7kr9TluExUwTzgKbj3bX9ziKrVmrJodhS+4kzIau
   8dgxGF63Xdq6ouftyh16UDRlG/AiTi98z1g+1Ay3X30foxDedZe+emqNy
   fa1F8oXELGkpYe0O6iHTUQD+pUuCn2xYkqsuuE6Erx97H6zID7DjXfRgu
   w==;
X-CSE-ConnectionGUID: eFjEQYPkR1KUk4CHrP7e0Q==
X-CSE-MsgGUID: +CWpUtLTTwOBpyMlpjcfAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="82190308"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="82190308"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 19:44:46 -0800
X-CSE-ConnectionGUID: EecFyWW0Spqi/Y4ue1zgFw==
X-CSE-MsgGUID: sz+/GxPfSPGew6Kd4OvKtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="231937738"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Jan 2026 19:44:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm1uc-00000000dca-0Lul;
	Sat, 31 Jan 2026 03:44:42 +0000
Date: Sat, 31 Jan 2026 11:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommufd_noiommu 4/6]
 drivers/vfio/vfio.h:124:undefined reference to `vfio_noiommu_enabled'
Message-ID: <202601311130.7sI1r5Gf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux iommufd_noiommu
head:   7786a2757eb91ada48627ce3c749705507a3cdd3
commit: 8e19339e317779e8448d80d70c8e10fde713306d [4/6] vfio: Support noiommu devices through the cdev interface
config: i386-randconfig-007-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311130.7sI1r5Gf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311130.7sI1r5Gf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311130.7sI1r5Gf-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/vfio/vfio_main.o: in function `vfio_device_set_no_iommu':
>> drivers/vfio/vfio.h:124:(.text+0x2161): undefined reference to `vfio_noiommu_enabled'


vim +124 drivers/vfio/vfio.h

   121	
   122	static inline int vfio_device_set_no_iommu(struct vfio_device *vdev)
   123	{
 > 124		if (vfio_device_is_noiommu(vdev) || vfio_noiommu_enabled())
   125			vdev->noiommu = true;
   126		return 0;
   127	}
   128	#else
   129	struct vfio_group;
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
