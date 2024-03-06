Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7229B5F481
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 10:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709719644; cv=none; b=YO2C2xzZrjBXmFR2bwomJuOt3I4TljpWeBiSCVM1uyabtOZ48dzkLeKyY+9E7yAuE670sFNzbeba7ELWpmSn8mz/6IQ4A2kjSPzUo9ubhiwPvEaRoSGoiei1kBP3VABP3Pc0Fi5/R/Ya80BT0NSTWRXQQa8Hbi7+sgTsoGOZKBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709719644; c=relaxed/simple;
	bh=axh9DjFBoQ1+LaORdvnbNOrfc/QSb4m9mU7leFSaHP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DbuGzlR9HyQsUGy9Em+AeDptnY30RVPQJE31E0BMitIPMzOONrsIFdUVyCDAXazkutbyPcfRbCjOicA+4n6zw5M/LbFsw//UleueRNL27Ue6f0B25DkPpNfAOVOmUtQwTVaSRCgBj24CpMihy4QHYylY2V7WYsEcnYS7togFABA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ovw1dph/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ovw1dph/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709719643; x=1741255643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=axh9DjFBoQ1+LaORdvnbNOrfc/QSb4m9mU7leFSaHP4=;
  b=Ovw1dph/Rz4v0oHXI+dyPyUZhSU6qzL4upvq/g7z1vrO8jo6RoIy56RB
   IVVc05UgW+U+nNZ2A4stKqYbhCz4nv5htHgtWf2c+leipWyJTUKAzC7zt
   p07G8kMlPoAXpd+49iw38eJasvNtfIMtNQLQgMgh68dolcaukUqrW7BdJ
   ReYJo5030pz5cft9Bb3+OC/axuQI88OqMh75FhVvFkt83ePB3l6RJ9kG2
   esERePAn9FpiuGHxrLtWbS7t5Cn4pPyeLG8JNo8kqvRDOfZk+I/Bzvo+6
   SJzEbLPQvrvpXSiqcEVjoPLCjfCISO+YAR5JYbuHvo82WOcrAJ3RhOsYh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="7264862"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="7264862"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 02:07:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="40686009"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Mar 2024 02:07:18 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhoBA-00047z-1y;
	Wed, 06 Mar 2024 10:07:16 +0000
Date: Wed, 6 Mar 2024 18:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/vfio/platform/vfio_amba.c:78:44: error: passing argument 1
 of 'vfio_platform_remove_common' from incompatible pointer type
Message-ID: <202403061802.BSYD3VqO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: c91f5dd4bd209fb8c6e5bbbde6afe8500b5e97cf vfio/platform: Use vfio_init/register/unregister_group_dev
date:   9 months ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240306/202403061802.BSYD3VqO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061802.BSYD3VqO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061802.BSYD3VqO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/iommu.h:16,
                    from include/linux/vfio.h:12,
                    from drivers/vfio/platform/vfio_amba.c:9:
   include/linux/ioasid.h:210:51: error: unknown type name 'ioasid_set_type'
     210 |                                                   ioasid_set_type type)
         |                                                   ^~~~~~~~~~~~~~~
   drivers/vfio/platform/vfio_amba.c: In function 'vfio_amba_remove':
>> drivers/vfio/platform/vfio_amba.c:78:44: error: passing argument 1 of 'vfio_platform_remove_common' from incompatible pointer type [-Werror=incompatible-pointer-types]
      78 |         vdev = vfio_platform_remove_common(&adev->dev);
         |                                            ^~~~~~~~~~
         |                                            |
         |                                            struct device *
   In file included from drivers/vfio/platform/vfio_amba.c:12:
   drivers/vfio/platform/vfio_platform_private.h:85:63: note: expected 'struct vfio_platform_device *' but argument is of type 'struct device *'
      85 | void vfio_platform_remove_common(struct vfio_platform_device *vdev);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> drivers/vfio/platform/vfio_amba.c:78:14: error: void value not ignored as it ought to be
      78 |         vdev = vfio_platform_remove_common(&adev->dev);
         |              ^
   cc1: some warnings being treated as errors


vim +/vfio_platform_remove_common +78 drivers/vfio/platform/vfio_amba.c

^590eaf1fec755 Kaixu Xia 2021-03-16  73  
^590eaf1fec755 Kaixu Xia 2021-03-16  74  static int vfio_amba_remove(struct amba_device *adev)
^590eaf1fec755 Kaixu Xia 2021-03-16  75  {
^590eaf1fec755 Kaixu Xia 2021-03-16  76  	struct vfio_platform_device *vdev;
^590eaf1fec755 Kaixu Xia 2021-03-16  77  
^590eaf1fec755 Kaixu Xia 2021-03-16 @78  	vdev = vfio_platform_remove_common(&adev->dev);
^590eaf1fec755 Kaixu Xia 2021-03-16  79  	if (vdev) {
^590eaf1fec755 Kaixu Xia 2021-03-16  80  		kfree(vdev->name);
^590eaf1fec755 Kaixu Xia 2021-03-16  81  		kfree(vdev);
^590eaf1fec755 Kaixu Xia 2021-03-16  82  		return 0;
^590eaf1fec755 Kaixu Xia 2021-03-16  83  	}
^590eaf1fec755 Kaixu Xia 2021-03-16  84  
^590eaf1fec755 Kaixu Xia 2021-03-16  85  	return -EINVAL;
^590eaf1fec755 Kaixu Xia 2021-03-16  86  }
^590eaf1fec755 Kaixu Xia 2021-03-16  87  

:::::: The code at line 78 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
