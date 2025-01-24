Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8664F1CFEB2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 22:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737758208; cv=none; b=N5cPps52emCamV6NRqmw6cUn5oTzSW/Rs6bZfiNrVnhV2pVfUnTMpdOVIrnNUXPVfAINtYs+eZLBrJq8HrX9o3YFrhQkiuCKA2onkGQ5jP9+zKwDykDGz9hKAkv/pZ8MHRj2DTlMzOCqH0KVofuP0P21MkkkAVVHVrqgfDtYunI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737758208; c=relaxed/simple;
	bh=Rbig95U9QwiGs5Zal6O9hxsGHxJZ8N+6aMQnxFqCdTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qB08jqk1cca7EQN3HvQICXq5+1Nf2d/0jgcSZX3ot08YBV8JfTeyWKr/mcmkv9FOK1xiDoxYsWaMbn7j964txKVLgvQJXBvjVdKsCyjv5Ll6SFmnHFOrxGvtwS39fivCkFQcLqcF7jGBOfIAXrxWkKjkVugJpSOzppqH4le9rRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGShTAPh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGShTAPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737758205; x=1769294205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rbig95U9QwiGs5Zal6O9hxsGHxJZ8N+6aMQnxFqCdTQ=;
  b=dGShTAPhPG4W4ppU/BEWrutFjsZG+5Y237gUhyfbFoKj1zALoM9QJbKj
   z3GA0OQXQykmA06MlN7B2Wgs7Qy92Y6rOmWlz8yHf0wyvIE05/qUJVuax
   XLPD3Gq/ZSfYdjfJ+UMkuYHHs3aKvnRumkO+c7+o5fjqjDCo5YJIMVLVa
   y9qX4XS0Nkz2iUW8N5GIDF7c7sxjLTwCSKT11NQJKgXmJeygr7Ez4GjDk
   9Meqn4g29Hb6dQRHhB+2x/Y6hvqtMt35wGZQKBtwd+8GUkh7Yo1ZOQd2T
   ljCZGEdhoYya6VjjIZXW++rkWgbE0ewr6K4lXjG/5ssnqBPM6zZitksSl
   Q==;
X-CSE-ConnectionGUID: VMcSsUmqS+aHFGbM2O0WPQ==
X-CSE-MsgGUID: lvgjeW6lSgieYMoPgyuYWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="41144905"
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="41144905"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 14:36:43 -0800
X-CSE-ConnectionGUID: 0/vCSUQbT92ALA2jVCvjFw==
X-CSE-MsgGUID: LiUrBnK2SPqunamE5H5I/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="107790599"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jan 2025 14:36:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbSI1-000dDD-1K;
	Fri, 24 Jan 2025 22:36:37 +0000
Date: Sat, 25 Jan 2025 06:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2441/2441]
 drivers/vfio/platform/vfio_platform.c:29:16: warning: returning 'int' from a
 function with return type 'struct resource *' makes pointer from integer
 without a cast
Message-ID: <202501250626.cAj7NS8G-lkp@intel.com>
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
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: 6c95419e5c4fa83ef61c2c0cbf752d39df4b9f3f [2441/2441] vfio-platform: Add COMPILE_TEST to VFIO_PLATFORM
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250125/202501250626.cAj7NS8G-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501250626.cAj7NS8G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501250626.cAj7NS8G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:10,
                    from drivers/vfio/platform/vfio_platform.c:7:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/export.h:42,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   drivers/vfio/platform/vfio_platform.c: In function 'get_platform_resource':
   drivers/vfio/platform/vfio_platform.c:29:16: error: implicit declaration of function 'platform_get_mem_or_io'; did you mean 'platform_get_device_id'? [-Werror=implicit-function-declaration]
      29 |         return platform_get_mem_or_io(dev, num);
         |                ^~~~~~~~~~~~~~~~~~~~~~
         |                platform_get_device_id
>> drivers/vfio/platform/vfio_platform.c:29:16: warning: returning 'int' from a function with return type 'struct resource *' makes pointer from integer without a cast [-Wint-conversion]
      29 |         return platform_get_mem_or_io(dev, num);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +29 drivers/vfio/platform/vfio_platform.c

9df85aaa43297c Antonios Motakis 2015-03-16  23  
9df85aaa43297c Antonios Motakis 2015-03-16  24  static struct resource *get_platform_resource(struct vfio_platform_device *vdev,
9df85aaa43297c Antonios Motakis 2015-03-16  25  					      int num)
9df85aaa43297c Antonios Motakis 2015-03-16  26  {
9df85aaa43297c Antonios Motakis 2015-03-16  27  	struct platform_device *dev = (struct platform_device *) vdev->opaque;
9df85aaa43297c Antonios Motakis 2015-03-16  28  
f0953dcfbb5080 Andy Shevchenko  2020-12-09 @29  	return platform_get_mem_or_io(dev, num);
9df85aaa43297c Antonios Motakis 2015-03-16  30  }
9df85aaa43297c Antonios Motakis 2015-03-16  31  

:::::: The code at line 29 was first introduced by commit
:::::: f0953dcfbb508070e806a0c53aae09cdd3cde744 vfio: platform: Switch to use platform_get_mem_or_io()

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Jianping Liu <frankjpliu@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
