Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FB45246
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 18:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681152638; x=1712688638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IMbdhZCGER1S9AmrQ+HlZR8mgvfxKpZ4g0Ekzw+dzq0=;
  b=mdH2TAT7W50tvK5hNearMmG9wCcC6U+Q8NN4pSxipyWKkJBn/5GcDxwG
   KWdoUpF2MkbxCpu9qx5npeptVsKjxKYDwRY9pFIQEyBkFNh/IKQ2zeN84
   tYbt9G3wICLKnTH0E3DNJvgNPOphCaO1UAf/QCju6k8/gnTSzBOjy+HNo
   hZu1NoKmhdu/I47BqNooZUcezYcaUTK5dz46eDYg02h7lV9W8Y15Dg2ZC
   D/fWFY5qpAJZ1jCcYEBrfGOsOtdrKyu65n094GV2AuvLZws9LFTgVW2D5
   oNvzLaYYdYV8R55tRxf3fOGSB9vjw7X3Cmg34403JURYD4edF5QahOy5f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="323064434"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="323064434"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 11:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="690882415"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="690882415"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Apr 2023 11:50:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plwb5-000Vb3-33;
	Mon, 10 Apr 2023 18:50:35 +0000
Date: Tue, 11 Apr 2023 02:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:report_group_id 3/4]
 drivers/s390/crypto/vfio_ap_ops.c:1757:9: error: 'ret' undeclared; did you
 mean 'net'?
Message-ID: <202304110242.lPmMNLqX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git report_group_id
head:   57cbf428d04231ccaf608b7b2f9eb1d8a77e1ac9
commit: ff4b8bee90761961041126305183a9a7e0f0542d [3/4] vfio: Report group_id to user
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230411/202304110242.lPmMNLqX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/ff4b8bee90761961041126305183a9a7e0f0542d
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd report_group_id
        git checkout ff4b8bee90761961041126305183a9a7e0f0542d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/s390/crypto/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304110242.lPmMNLqX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/s390/crypto/vfio_ap_ops.c: In function 'vfio_ap_mdev_get_device_info':
>> drivers/s390/crypto/vfio_ap_ops.c:1757:9: error: 'ret' undeclared (first use in this function); did you mean 'net'?
    1757 |         ret =vfio_device_info_add_group_cap(vdev, &caps);
         |         ^~~
         |         net
   drivers/s390/crypto/vfio_ap_ops.c:1757:9: note: each undeclared identifier is reported only once for each function it appears in


vim +1757 drivers/s390/crypto/vfio_ap_ops.c

  1737	
  1738	static int vfio_ap_mdev_get_device_info(struct vfio_device *vdev,
  1739						unsigned long arg)
  1740	{
  1741		struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
  1742		unsigned long minsz;
  1743		struct vfio_device_info info;
  1744	
  1745		minsz = offsetofend(struct vfio_device_info, num_irqs);
  1746	
  1747		if (copy_from_user(&info, (void __user *)arg, minsz))
  1748			return -EFAULT;
  1749	
  1750		if (info.argsz < minsz)
  1751			return -EINVAL;
  1752	
  1753		info.flags = VFIO_DEVICE_FLAGS_AP | VFIO_DEVICE_FLAGS_RESET;
  1754		info.num_regions = 0;
  1755		info.num_irqs = 0;
  1756	
> 1757		ret =vfio_device_info_add_group_cap(vdev, &caps);
  1758		if (ret)
  1759			return ret;
  1760	
  1761		ret = vfio_device_info_copy_caps(&info, &caps,
  1762						 (struct vfio_device_info __user *)arg);
  1763		if (ret)
  1764			return ret;
  1765	
  1766		return copy_to_user((void __user *)arg, &info, minsz) ? -EFAULT : 0;
  1767	}
  1768	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
