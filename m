Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB0B13665B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 18:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736186779; cv=none; b=thKIlUYkQjM9+6YdKE/HPkMVzoGAY+hujdDPcRVu37JqhkjS+8IxWYX/1Tuea20Yw1gehUrdpGmtcIz1+djWbZpRtziH9xYRINZj0H7vvE2p7CyX1LReTp0LeYK/Kw+WeOV+IIBhvUWD0T8mZxpjrGBDwXdzj5xHxPSipNJa9Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736186779; c=relaxed/simple;
	bh=Ve8+y10j9iy7kvl7NtRtHG5qyNtv97CAV6t1GyipD1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l7Hlisis/LIyYbtOCBnCdOohJ8HTttFFJ4AO/HpeMQ0fDGserEB4T2pK3Vm0MLv+RC9L+HjFTjxv20SPEknJdr/AABQAnDU5XUnXFG/5qhqXbWaZmkx5WGmO5EGatQO90bHMyNxeChYmSMslozU9TiB1pbr9//ssgdcnqSeNc1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nsXpu9Rh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nsXpu9Rh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736186778; x=1767722778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ve8+y10j9iy7kvl7NtRtHG5qyNtv97CAV6t1GyipD1E=;
  b=nsXpu9RhLmKAxxUN5OySvgoG08HAbJO2jbYWK15fx42eFWxxU022e1G4
   lBl9V6WPmjLMDaH1VvyQMcJLbGu9fjwiQjb3LLjIzzPj66ESZXTiPj4a9
   /m21h8ZtBLRpCustOguUt2qbYVNDOXHPLXPgyVLR0meYCNn02/Hz5STF0
   cYtr0pHUqGZqzH6ghVTKbx9t+MjL08AyctZL8pr/PZs4Qzpa7tvKM5qUW
   Zj9hUlhMMA+AlVxeoaG30vahYHrqbvrI0X9CvfFCc8EDbMx45+xG4o0Ml
   Xsw3UV+UyWlJfpIZHSFknBJBd0xx635s/S/odpUjRqX6iZlRqO+I+iBDx
   A==;
X-CSE-ConnectionGUID: wsDd5YnKR+6suRH1u490nw==
X-CSE-MsgGUID: nrXcA/n7Re2Fpd+j9PEvKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36223175"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="36223175"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 10:06:17 -0800
X-CSE-ConnectionGUID: tAohSDO3SgyJbMwIo1Vg6Q==
X-CSE-MsgGUID: UAqd93LIQqGxQGSgzwo48g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="103006584"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jan 2025 10:06:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUrUT-000DnH-21;
	Mon, 06 Jan 2025 18:06:13 +0000
Date: Tue, 7 Jan 2025 02:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 17728/25291]
 drivers/vdpa/ifcvf/ifcvf_main.c:553:20: error: initialization of 'void
 (*)(struct vdpa_mgmt_dev *, struct vdpa_device *, int)' from incompatible
 pointer type 'void (*)(struct vdpa_mgmt_dev *, struct vdpa_device *)'
Message-ID: <202501070130.LAsoRn5P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: e4b7b11288fc91b44fd73cd10b954c515eeb26ca [17728/25291] bytedance: vdpa: Add deletion timeout support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250107/202501070130.LAsoRn5P-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070130.LAsoRn5P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070130.LAsoRn5P-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vdpa/ifcvf/ifcvf_main.c:553:20: error: initialization of 'void (*)(struct vdpa_mgmt_dev *, struct vdpa_device *, int)' from incompatible pointer type 'void (*)(struct vdpa_mgmt_dev *, struct vdpa_device *)' [-Werror=incompatible-pointer-types]
     553 |         .dev_del = ifcvf_vdpa_dev_del
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:553:20: note: (near initialization for 'ifcvf_vdpa_mgmt_dev_ops.dev_del')
   cc1: some warnings being treated as errors
--
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:2650:20: error: initialization of 'void (*)(struct vdpa_mgmt_dev *, struct vdpa_device *, int)' from incompatible pointer type 'void (*)(struct vdpa_mgmt_dev *, struct vdpa_device *)' [-Werror=incompatible-pointer-types]
    2650 |         .dev_del = mlx5_vdpa_dev_del,
         |                    ^~~~~~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:2650:20: note: (near initialization for 'mdev_ops.dev_del')
   cc1: some warnings being treated as errors


vim +553 drivers/vdpa/ifcvf/ifcvf_main.c

6b5df347c6482f Zhu Lingshan 2021-08-12  550  
6b5df347c6482f Zhu Lingshan 2021-08-12  551  static const struct vdpa_mgmtdev_ops ifcvf_vdpa_mgmt_dev_ops = {
6b5df347c6482f Zhu Lingshan 2021-08-12  552  	.dev_add = ifcvf_vdpa_dev_add,
6b5df347c6482f Zhu Lingshan 2021-08-12 @553  	.dev_del = ifcvf_vdpa_dev_del
6b5df347c6482f Zhu Lingshan 2021-08-12  554  };
6b5df347c6482f Zhu Lingshan 2021-08-12  555  

:::::: The code at line 553 was first introduced by commit
:::::: 6b5df347c6482f57b0d8f0569b86fb8fcd90d168 vDPA/ifcvf: implement management netlink framework for ifcvf

:::::: TO: Zhu Lingshan <lingshan.zhu@intel.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
