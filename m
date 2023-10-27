Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E982D78A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 12:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OhM/3MRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698409968; x=1729945968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uwHD2zaBSSM9X8bewJCBqducTCIdFrGfACkBvZhuEEo=;
  b=OhM/3MRu2rw+wxE/0l4zpumGNjOgqe3xxo9o2Is6VBHAvCuKYu8K78FL
   u60H5pbGgDKbQnjvL/bgH+PG6xqAPJEhcTPLNtylGmsRDE9YWT961KEWt
   Eyqo2qA7vTy8OnIXUWsgXhCGUNlE+VKZgeJS/JB3gFiDecffk+pTH+sLM
   FUkhdBTIi9U1j9aWdtjQd9l9JcspYqiIzQ03bStw8nu6UG9R94uBZkJJs
   rpzGj2132IDMZjoT4P5Xcc9U5hO/BCEbBruwl3fcL3A1E+V/ifEKsrgip
   0V1HmIqne74gbFciq9QWzLTKJtpk0Qm1hg9yFLMX0DpnyyKOctePdD9Jp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="452003662"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="452003662"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 05:32:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="876325125"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="876325125"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2023 05:32:33 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwM0s-000Ap9-2y;
	Fri, 27 Oct 2023 12:32:30 +0000
Date: Fri, 27 Oct 2023 20:32:05 +0800
From: kernel test robot <lkp@intel.com>
To: Karol Wachowski <karol.wachowski@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [linux-next:master 13806/15478] drivers/accel/ivpu/ivpu_pm.c:254:51:
 error: 'struct dev_pm_info' has no member named 'usage_count'
Message-ID: <202310272012.tcy8MoK3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66f1e1ea3548378ff6387b1ce0b40955d54e86aa
commit: c39dc15191c4d40c58ce986e5f0daf94c84b7324 [13806/15478] accel/ivpu: Read clock rate only if device is up
config: x86_64-randconfig-r036-20230609 (https://download.01.org/0day-ci/archive/20231027/202310272012.tcy8MoK3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310272012.tcy8MoK3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310272012.tcy8MoK3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:30,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from drivers/accel/ivpu/ivpu_pm.c:6:
   drivers/accel/ivpu/ivpu_pm.c: In function 'ivpu_rpm_get_if_active':
>> drivers/accel/ivpu/ivpu_pm.c:254:51: error: 'struct dev_pm_info' has no member named 'usage_count'
     254 |                  atomic_read(&vdev->drm.dev->power.usage_count));
         |                                                   ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/accel/ivpu/ivpu_drv.h:74:17: note: in expansion of macro 'dev_dbg'
      74 |                 dev_dbg((vdev)->drm.dev, "[%s] " fmt, #type, ##args);          \
         |                 ^~~~~~~
   drivers/accel/ivpu/ivpu_pm.c:253:9: note: in expansion of macro 'ivpu_dbg'
     253 |         ivpu_dbg(vdev, RPM, "rpm_get_if_active count %d\n",
         |         ^~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +254 drivers/accel/ivpu/ivpu_pm.c

   248	
   249	int ivpu_rpm_get_if_active(struct ivpu_device *vdev)
   250	{
   251		int ret;
   252	
   253		ivpu_dbg(vdev, RPM, "rpm_get_if_active count %d\n",
 > 254			 atomic_read(&vdev->drm.dev->power.usage_count));
   255	
   256		ret = pm_runtime_get_if_active(vdev->drm.dev, false);
   257		drm_WARN_ON(&vdev->drm, ret < 0);
   258	
   259		return ret;
   260	}
   261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
