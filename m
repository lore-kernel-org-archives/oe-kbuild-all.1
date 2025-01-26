Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E471CBA42
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 09:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737884296; cv=none; b=AhlWy473iHzCQA0/Qjgs1cifSbkimFkbt1pHmbgkgsEJ81oPkjIlpmMx0EnAcq1wDzVYPBDLH79lJEBzuXTcB1Py9JNtQ35kbkStJGsKxMr1H/ZQQTo2KHYDVRvNcYpyqxaQxZgBDeelk/Yy8IJqMnO1LhpDA5YtQLULsPGp9eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737884296; c=relaxed/simple;
	bh=+2bpGFkR1lRDtafIiKoNtPAUL7S892t/98R08Qq4ME8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O+SOQTXEX8uPkhigtUaJUpjX2GbQoEpnIeG0s5GTDAXrFyTo05Bk1l/nueg7eD64S0KQcN+oiNNbKbcMe8/KY0Tu3UJy/Ipm/Z8npsMgVNXOm3bQDLGG7iTltuwGzsaVY422QyJGicDlnFOKqOjXT0LBvSAc8H5LIuRa2OLymxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GkbMN4Tn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GkbMN4Tn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737884294; x=1769420294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+2bpGFkR1lRDtafIiKoNtPAUL7S892t/98R08Qq4ME8=;
  b=GkbMN4TnpYBfcQCOrPUywEPhf0Bz1YI/rszpXwq+55+si58LZzVKwHpC
   R8cKXrN9SuYQS+duvC/lAz4LXzz3qru9dTGCUDGf8viwGVWGUZqrvxqIj
   sRLn8RKv4gl5XHtE+GpoOHLD98L8FT7y1t8F3b2s5Nz4A4rCasXr17Fzr
   AOKkvhBx3cyiWXj7rlzI8ch4l9K1F7is0CCZiINxNJuXpgR1QtfGAIfbk
   2iyxLFSrAFYZezrXygh49shWm9m6yVSGM9V3EU8sXpcIg1IYjwl5UxFhU
   lF/SkYhlv+YNBaKmtC4kGVzNVyLhlv7a+zn6w4HbVQU1x59TcnOHWzhYR
   A==;
X-CSE-ConnectionGUID: 38TXbinsQ4SpUD1H5/yKQQ==
X-CSE-MsgGUID: QOTSeFShTlu0WSE6CXeowg==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="38276823"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="38276823"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 01:38:13 -0800
X-CSE-ConnectionGUID: fjY/f3z9TIeiMKNiciZ6rw==
X-CSE-MsgGUID: Vlbv82obR7+9Zftvixxi8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="108286991"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Jan 2025 01:38:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbz5k-000fBL-0O;
	Sun, 26 Jan 2025 09:38:08 +0000
Date: Sun, 26 Jan 2025 17:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2441/2441]
 drivers/gpu/drm/i915/gvt/gvt.c:108:26: error: initialization of 'ssize_t
 (*)(struct mdev_type *, struct mdev_type_attribute *, char *)' {aka 'long
 int (*)(struct mdev_type *, struct mdev_type_attribute *, char *)'} from
 incompatible pointer type 'ssize_t ...
Message-ID: <202501261702.vXPv6hVv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: fd9fba1888bbde48e305c31006f614fe387931c8 [2441/2441] vfio/mdev: Correct the function signatures for the mdev_type_attributes
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250126/202501261702.vXPv6hVv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501261702.vXPv6hVv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501261702.vXPv6hVv-lkp@intel.com/

Note: the opencloudos/linux-5.4/lts/5.4.119-20.0009.spr HEAD f1811f6442501fe34d2339158aed4f85a64f0398 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/cpumask.h:14,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:21,
                    from arch/x86/include/asm/xen/hypervisor.h:39,
                    from include/xen/xen.h:37,
                    from drivers/gpu/drm/i915/gvt/gvt.c:34:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/init.h:5,
                    from arch/x86/include/asm/mem_encrypt.h:15,
                    from include/linux/mem_encrypt.h:17,
                    from arch/x86/include/asm/processor-flags.h:6,
                    from arch/x86/include/asm/processor.h:5:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/gpu/drm/i915/i915_drv.h:39,
                    from drivers/gpu/drm/i915/gvt/gvt.c:37:
>> drivers/gpu/drm/i915/gvt/gvt.c:108:26: error: initialization of 'ssize_t (*)(struct mdev_type *, struct mdev_type_attribute *, char *)' {aka 'long int (*)(struct mdev_type *, struct mdev_type_attribute *, char *)'} from incompatible pointer type 'ssize_t (*)(struct kobject *, struct device *, char *)' {aka 'long int (*)(struct kobject *, struct device *, char *)'} [-Werror=incompatible-pointer-types]
     108 | static MDEV_TYPE_ATTR_RO(available_instances);
         |                          ^~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:117:19: note: in definition of macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:108:8: note: in expansion of macro 'MDEV_TYPE_ATTR_RO'
     108 | static MDEV_TYPE_ATTR_RO(available_instances);
         |        ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:108:26: note: (near initialization for 'mdev_type_attr_available_instances.show')
     108 | static MDEV_TYPE_ATTR_RO(available_instances);
         |                          ^~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:117:19: note: in definition of macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:108:8: note: in expansion of macro 'MDEV_TYPE_ATTR_RO'
     108 | static MDEV_TYPE_ATTR_RO(available_instances);
         |        ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:109:26: error: initialization of 'ssize_t (*)(struct mdev_type *, struct mdev_type_attribute *, char *)' {aka 'long int (*)(struct mdev_type *, struct mdev_type_attribute *, char *)'} from incompatible pointer type 'ssize_t (*)(struct kobject *, struct device *, char *)' {aka 'long int (*)(struct kobject *, struct device *, char *)'} [-Werror=incompatible-pointer-types]
     109 | static MDEV_TYPE_ATTR_RO(device_api);
         |                          ^~~~~~~~~~
   include/linux/sysfs.h:117:19: note: in definition of macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:109:8: note: in expansion of macro 'MDEV_TYPE_ATTR_RO'
     109 | static MDEV_TYPE_ATTR_RO(device_api);
         |        ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:109:26: note: (near initialization for 'mdev_type_attr_device_api.show')
     109 | static MDEV_TYPE_ATTR_RO(device_api);
         |                          ^~~~~~~~~~
   include/linux/sysfs.h:117:19: note: in definition of macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:109:8: note: in expansion of macro 'MDEV_TYPE_ATTR_RO'
     109 | static MDEV_TYPE_ATTR_RO(device_api);
         |        ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:110:26: error: initialization of 'ssize_t (*)(struct mdev_type *, struct mdev_type_attribute *, char *)' {aka 'long int (*)(struct mdev_type *, struct mdev_type_attribute *, char *)'} from incompatible pointer type 'ssize_t (*)(struct kobject *, struct device *, char *)' {aka 'long int (*)(struct kobject *, struct device *, char *)'} [-Werror=incompatible-pointer-types]
     110 | static MDEV_TYPE_ATTR_RO(description);
         |                          ^~~~~~~~~~~
   include/linux/sysfs.h:117:19: note: in definition of macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:110:8: note: in expansion of macro 'MDEV_TYPE_ATTR_RO'
     110 | static MDEV_TYPE_ATTR_RO(description);
         |        ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:110:26: note: (near initialization for 'mdev_type_attr_description.show')
     110 | static MDEV_TYPE_ATTR_RO(description);
         |                          ^~~~~~~~~~~
   include/linux/sysfs.h:117:19: note: in definition of macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:110:8: note: in expansion of macro 'MDEV_TYPE_ATTR_RO'
     110 | static MDEV_TYPE_ATTR_RO(description);
         |        ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +108 drivers/gpu/drm/i915/gvt/gvt.c

c5d71cb31723135 fred gao 2017-09-28  107  
c5d71cb31723135 fred gao 2017-09-28 @108  static MDEV_TYPE_ATTR_RO(available_instances);
c5d71cb31723135 fred gao 2017-09-28  109  static MDEV_TYPE_ATTR_RO(device_api);
c5d71cb31723135 fred gao 2017-09-28  110  static MDEV_TYPE_ATTR_RO(description);
c5d71cb31723135 fred gao 2017-09-28  111  

:::::: The code at line 108 was first introduced by commit
:::::: c5d71cb31723135dbaa54b32bf046342fe538210 drm/i915/gvt: Move vGPU type related code into gvt file

:::::: TO: fred gao <fred.gao@intel.com>
:::::: CC: Zhenyu Wang <zhenyuw@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
