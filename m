Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8E7F9FE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 00:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709600077; cv=none; b=CfGvPumeZgvvZVY6e1lXG3DZY8wbZw4mKdMukbXQzZgCwUWjo9LqjRbmr6O4fYRGH2T2agf0ijQdxI5IdfB/ObI1KYtjTH5YYGCWQJnImHSFbQEiBrP4Pk1zbQVbJtNOwUrtA3D6vvC77xp4tVzKQfPbrNO8pVK2W8suBT/CCbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709600077; c=relaxed/simple;
	bh=57NhiH4lEDAnb+ZYX0QyCF65sZs+Mvv7fkkwOUMLV9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kOAX7AS0qtZl/V+lg1i2xZsLfTZlntA/esCpstOfigxuX1uxZDSn0ghkWSYRQSs4ygPSDDrlVgWaYaDiW9ch1RbKNkfICBsNq2EvvhkeiKrcMR7Lsi+OZYSTBMrywTjOgcXdZyYMBob33j1p0vjj49Ed7oJI8dJDUF+bYk0Rms4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HV8nuOBv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HV8nuOBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709600076; x=1741136076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=57NhiH4lEDAnb+ZYX0QyCF65sZs+Mvv7fkkwOUMLV9A=;
  b=HV8nuOBvZ3kVJjYzDWveko0Pooj0tt5XsxXKuIDWwrRatVyViZRwhc0H
   IrWQyYzHakgxxrPqcsvAkZVDcu7rOVOdlg5bKGoMPwMeAaIzFstVuoHL5
   XjGB+LldD3QeBUaDa+clYDSK+GsLwpJNym5HZhdMdqf6J8h+dG6UxllR4
   cTq1wzh3gcai3QlddkpSc8Tk+4ZQc0ImbJ+qzG+BpyeJ54RJeZTPLbZ1V
   +dbfIGOlbiGyARyWDCikcLttYJqRuCxVgfgQYEaM2WCDZQsMs5lBMYGOc
   yUeUU4s5T9M3TtLqSpIahNel+IbH5/1465ASSlVqP+A6brLO5l2LLGIhE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15529857"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="15529857"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 16:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9137173"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Mar 2024 16:54:26 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhJ4Z-0002s2-1i;
	Tue, 05 Mar 2024 00:54:23 +0000
Date: Tue, 5 Mar 2024 08:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/vfio/platform/vfio_platform.c:29:16: error: implicit
 declaration of function 'platform_get_mem_or_io'; did you mean
 'platform_get_device_id'?
Message-ID: <202403050837.W7PuOYzU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

First bad commit (maybe != root cause):

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 7bd4091a92dd9ed03a482d8359bc7c54871ff5fc vfio-platform: Add COMPILE_TEST to VFIO_PLATFORM
date:   9 months ago
config: x86_64-buildonly-randconfig-003-20240305 (https://download.01.org/0day-ci/archive/20240305/202403050837.W7PuOYzU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050837.W7PuOYzU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050837.W7PuOYzU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/iommu.h:16,
                    from include/linux/vfio.h:12,
                    from drivers/vfio/platform/vfio_platform.c:9:
   include/linux/ioasid.h:210:51: error: unknown type name 'ioasid_set_type'
     210 |                                                   ioasid_set_type type)
         |                                                   ^~~~~~~~~~~~~~~
   drivers/vfio/platform/vfio_platform.c: In function 'get_platform_resource':
>> drivers/vfio/platform/vfio_platform.c:29:16: error: implicit declaration of function 'platform_get_mem_or_io'; did you mean 'platform_get_device_id'? [-Werror=implicit-function-declaration]
      29 |         return platform_get_mem_or_io(dev, num);
         |                ^~~~~~~~~~~~~~~~~~~~~~
         |                platform_get_device_id
>> drivers/vfio/platform/vfio_platform.c:29:16: warning: returning 'int' from a function with return type 'struct resource *' makes pointer from integer without a cast [-Wint-conversion]
      29 |         return platform_get_mem_or_io(dev, num);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - X86 [=y]


vim +29 drivers/vfio/platform/vfio_platform.c

^590eaf1fec755 Kaixu Xia       2021-03-16  23  
^590eaf1fec755 Kaixu Xia       2021-03-16  24  static struct resource *get_platform_resource(struct vfio_platform_device *vdev,
^590eaf1fec755 Kaixu Xia       2021-03-16  25  					      int num)
^590eaf1fec755 Kaixu Xia       2021-03-16  26  {
^590eaf1fec755 Kaixu Xia       2021-03-16  27  	struct platform_device *dev = (struct platform_device *) vdev->opaque;
^590eaf1fec755 Kaixu Xia       2021-03-16  28  
c82043e721f22c Andy Shevchenko 2020-12-09 @29  	return platform_get_mem_or_io(dev, num);
^590eaf1fec755 Kaixu Xia       2021-03-16  30  }
^590eaf1fec755 Kaixu Xia       2021-03-16  31  

:::::: The code at line 29 was first introduced by commit
:::::: c82043e721f22c84a1fe6936599dfb4e5228891e vfio: platform: Switch to use platform_get_mem_or_io()

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Song, Youquan <youquan.song@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
