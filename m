Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6292E630
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 18:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727461903; cv=none; b=K/hwJog9paRM+fcLRw9M8IjmTKDkhlCT/m+5ZWHYgZTlrsucAjABc4L2SFUmuNIqENadVIYe8ixq5wMcpTNqYT77uDrPT48X6NgSnEgAarrIAkQcEIlF5iRYb6yzIZ1sOudSCTBvoKld3UTt3P+N6bK2Mws/+7dWw8rSwmgh4Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727461903; c=relaxed/simple;
	bh=T9DDW85HPBSs0Ubwrm7WZkAzeuZh2W5KTXv1c21VazA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZDZSBGOYxjDnJKHSr0WsnDGAoSZbqvCuunL7xVANKxdVE/AyMs2IH5pJoU/mk1fka7K6E7JpDKSG8njboZC1DHguIjEbHNDPLdEgXNSUK96XXkdDJjmbQVgY+iVKxAJrgQRtDhTpyqbyPLGrB6w0BIqE/6AgedwT7KvGbSftOVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSzNy60i; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSzNy60i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727461902; x=1758997902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T9DDW85HPBSs0Ubwrm7WZkAzeuZh2W5KTXv1c21VazA=;
  b=YSzNy60i/j+KfcD6IOw3jywLVVJYxvYXe9SPHNuMg/9F83JD5aApsDHi
   tCGm4GY8iLBvWkmip+u+J+bcJIZMtPt0Vb8kIt/uvkHJX7Zv00ShVKo3f
   xq9FGwQc4rYIImNKzq1A0NAFQAr0rH+Rn785k2qpeG/stNqtlZJdcom5p
   9H99uI2fVZPKPtdoMtyhUR7Rdtq9LEr2p0GK2TE2rtSJmH7cA6ZiDHQYZ
   +Oag1no84WhCZ+CSm03VZ/ZaBWh6Zvo65uDaa48eIiQKb8UCPSB2nxukC
   tfq6HRZylXagw3hdVZ3pE0CqSBT0zXUEMbD0i2FDLuwgyUtGA2/Rl09nW
   w==;
X-CSE-ConnectionGUID: GOw01U/0TfWKU5n70trsBw==
X-CSE-MsgGUID: 1Qm1sKUWRmmbe2L8ceT8Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37199365"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="37199365"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 11:31:41 -0700
X-CSE-ConnectionGUID: Jusg9WIpQROY/LiDJryKxA==
X-CSE-MsgGUID: 2YwbcXfcTb2ZAvcXHeK8Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72690969"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Sep 2024 11:31:38 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suFkd-000MUF-2J;
	Fri, 27 Sep 2024 18:31:35 +0000
Date: Sat, 28 Sep 2024 02:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1612/2444]
 drivers/vfio/platform/vfio_amba.c:78:44: error: passing argument 1 of
 'vfio_platform_remove_common' from incompatible pointer type
Message-ID: <202409280205.LfX3Wnwz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   aabcc6dc6d7f9e12baf1f117341469c84afd545d
commit: 4858f53643e4966ab5502d7be21d3646ea1b17f8 [1612/2444] vfio/platform: Use vfio_init/register/unregister_group_dev
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240928/202409280205.LfX3Wnwz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280205.LfX3Wnwz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280205.LfX3Wnwz-lkp@intel.com/

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

36fe431f2811fa Antonios Motakis 2015-03-16  73  
36fe431f2811fa Antonios Motakis 2015-03-16  74  static int vfio_amba_remove(struct amba_device *adev)
36fe431f2811fa Antonios Motakis 2015-03-16  75  {
36fe431f2811fa Antonios Motakis 2015-03-16  76  	struct vfio_platform_device *vdev;
36fe431f2811fa Antonios Motakis 2015-03-16  77  
36fe431f2811fa Antonios Motakis 2015-03-16 @78  	vdev = vfio_platform_remove_common(&adev->dev);
36fe431f2811fa Antonios Motakis 2015-03-16  79  	if (vdev) {
36fe431f2811fa Antonios Motakis 2015-03-16  80  		kfree(vdev->name);
36fe431f2811fa Antonios Motakis 2015-03-16  81  		kfree(vdev);
36fe431f2811fa Antonios Motakis 2015-03-16  82  		return 0;
36fe431f2811fa Antonios Motakis 2015-03-16  83  	}
36fe431f2811fa Antonios Motakis 2015-03-16  84  
36fe431f2811fa Antonios Motakis 2015-03-16  85  	return -EINVAL;
36fe431f2811fa Antonios Motakis 2015-03-16  86  }
36fe431f2811fa Antonios Motakis 2015-03-16  87  

:::::: The code at line 78 was first introduced by commit
:::::: 36fe431f2811fa3b5fed15d272c585d5a47977aa vfio: amba: VFIO support for AMBA devices

:::::: TO: Antonios Motakis <a.motakis@virtualopensystems.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
