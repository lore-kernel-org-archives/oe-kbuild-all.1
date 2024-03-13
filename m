Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0F0A59
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710333413; cv=none; b=qecxLSpDR2U3cNEZ7j46PkP83uIcmM3NhunAST3JHtQOC2UsvufUSDOB0mylwgsEzxp7ochtHR3pgpj3SKeRw3kFziu99eo5rIlZygH2AGIJOKh4BSJWadKgwDwjd2P93R122VC261htQX+daNloClpCEL/epO9u7gefCfjvo3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710333413; c=relaxed/simple;
	bh=HvsxMZKAg+NorgLZ2RXw5iWLu0TnPVt4w37A3E8bvVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AwV+629bzyPb4umkkLSoV78oDzu5xFFBOME55Vr1DmepqyWPPzMqg6OA0VmYA2BME6y0NGo41iLogg9T4qj7XoDBj7vZobLbBpsVniABcBdm6eAv5WizTY9VejsvXKA4BMB6hEMlcv5gQ2NO2F//3uLQM50BS/EmSnc3hHEhprE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHouuNeo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHouuNeo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710333411; x=1741869411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HvsxMZKAg+NorgLZ2RXw5iWLu0TnPVt4w37A3E8bvVQ=;
  b=VHouuNeoc9hguwGwt5+QrAEElpF6QpUvWcPQAZHFwlir4Vab2iGr2KAz
   Tmpfso3m3dnqVJwPbK2d3kRkRa4HXg1bJXwKv9E5MeapBaom/63NlU6Cp
   zItj/NwbeO9iUW/5GzwkfYmXh/q1PHbwRGsYo2pb/zWwJOrTmumBGq9yA
   T7FPv2DT6srDuCmBGiUCdTtFmZ6cXCiUkwiOSnxfv10G3qTk7Xkmton/4
   +q4XBal/RsNx3VxJEslWvPOWN9rdyVuY9lNyqVfWsCeP++tmSgU41c43l
   w+R55nO+qEYNSU34bHP8LG2U0YXxObMc2qssv1/ENdTZb7V9JrIVKAcZL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8901152"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="8901152"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 05:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="11830543"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Mar 2024 05:36:48 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkNqf-000CNH-2M;
	Wed, 13 Mar 2024 12:36:45 +0000
Date: Wed, 13 Mar 2024 20:36:31 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/i915/gvt/gvt.c:108:8: error: incompatible function
 pointer types initializing 'ssize_t (*)(struct mdev_type *, struct
 mdev_type_attribute *, char *)' (aka 'long (*)(struct mdev_type *, struct
 mdev_type_attribute *, char *)') with an expres...
Message-ID: <202403132021.qiES57Zd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   c13208f42a275b32080b8b1f05865c408364ef9f
commit: 4804eaccc2985db994a5a507ad7edb4b6c162c7f vfio/mdev: Correct the function signatures for the mdev_type_attributes
date:   9 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240313/202403132021.qiES57Zd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403132021.qiES57Zd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403132021.qiES57Zd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gvt/gvt.c:108:8: error: incompatible function pointer types initializing 'ssize_t (*)(struct mdev_type *, struct mdev_type_attribute *, char *)' (aka 'long (*)(struct mdev_type *, struct mdev_type_attribute *, char *)') with an expression of type 'ssize_t (struct kobject *, struct device *, char *)' (aka 'long (struct kobject *, struct device *, char *)') [-Wincompatible-function-pointer-types]
     108 | static MDEV_TYPE_ATTR_RO(available_instances);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mdev.h:140:54: note: expanded from macro 'MDEV_TYPE_ATTR_RO'
     140 |         struct mdev_type_attribute mdev_type_attr_##_name = __ATTR_RO(_name)
         |                                                             ^~~~~~~~~~~~~~~~
   include/linux/sysfs.h:117:10: note: expanded from macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~~~~~~~~
   <scratch space>:155:1: note: expanded from here
     155 | available_instances_show
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:109:8: error: incompatible function pointer types initializing 'ssize_t (*)(struct mdev_type *, struct mdev_type_attribute *, char *)' (aka 'long (*)(struct mdev_type *, struct mdev_type_attribute *, char *)') with an expression of type 'ssize_t (struct kobject *, struct device *, char *)' (aka 'long (struct kobject *, struct device *, char *)') [-Wincompatible-function-pointer-types]
     109 | static MDEV_TYPE_ATTR_RO(device_api);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mdev.h:140:54: note: expanded from macro 'MDEV_TYPE_ATTR_RO'
     140 |         struct mdev_type_attribute mdev_type_attr_##_name = __ATTR_RO(_name)
         |                                                             ^~~~~~~~~~~~~~~~
   include/linux/sysfs.h:117:10: note: expanded from macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~~~~~~~~
   <scratch space>:158:1: note: expanded from here
     158 | device_api_show
         | ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:110:8: error: incompatible function pointer types initializing 'ssize_t (*)(struct mdev_type *, struct mdev_type_attribute *, char *)' (aka 'long (*)(struct mdev_type *, struct mdev_type_attribute *, char *)') with an expression of type 'ssize_t (struct kobject *, struct device *, char *)' (aka 'long (struct kobject *, struct device *, char *)') [-Wincompatible-function-pointer-types]
     110 | static MDEV_TYPE_ATTR_RO(description);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mdev.h:140:54: note: expanded from macro 'MDEV_TYPE_ATTR_RO'
     140 |         struct mdev_type_attribute mdev_type_attr_##_name = __ATTR_RO(_name)
         |                                                             ^~~~~~~~~~~~~~~~
   include/linux/sysfs.h:117:10: note: expanded from macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~~~~~~~~
   <scratch space>:161:1: note: expanded from here
     161 | description_show
         | ^~~~~~~~~~~~~~~~
   3 errors generated.


vim +108 drivers/gpu/drm/i915/gvt/gvt.c

^590eaf1fec755 Kaixu Xia 2021-03-16  107  
^590eaf1fec755 Kaixu Xia 2021-03-16 @108  static MDEV_TYPE_ATTR_RO(available_instances);
^590eaf1fec755 Kaixu Xia 2021-03-16  109  static MDEV_TYPE_ATTR_RO(device_api);
^590eaf1fec755 Kaixu Xia 2021-03-16  110  static MDEV_TYPE_ATTR_RO(description);
^590eaf1fec755 Kaixu Xia 2021-03-16  111  

:::::: The code at line 108 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
