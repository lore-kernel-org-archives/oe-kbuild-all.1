Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E20F210EA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 08:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlcMxaqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700640540; x=1732176540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jS/Lw2t0KETgSKiHLhmuAnn56b48BKGNbOea6r4wsFI=;
  b=BlcMxaqcU30ad9gmdYVs0NoY+kCx+K2gnbT+GtkEZ6Lwz+eDk+9nFZ/x
   ZySpGtEsFn65xylti6hdCNN2/j51szVZ5cBiuW6c6zmdunrKLx6vv3KJ+
   TQxT3PE3Lp3Sa4m1LKKc0OLCyhj7KPSZYY2EuOswCP3Txk2AcJGkNyxwQ
   zi1AJRrYOnYjaFBgnb+1PnCRmHdWYOlsK2kVhaWkfChk1LA69LNbE9SVY
   PJVw5SvridFdo6TocHPb4RKE/gu+sxHOuqVn/qXCDVDIE18exJeWKrWlR
   L8atBC+jMvTOD4lpNROOVVCpEB2Ma/me6wrybwuPHX3tgRzU/O8Asu6ak
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="390867924"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="390867924"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 00:08:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="716763254"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="716763254"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Nov 2023 00:08:56 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5iI2-0000Fm-0u;
	Wed, 22 Nov 2023 08:08:54 +0000
Date: Wed, 22 Nov 2023 16:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 4/4]
 drivers/virtio/virtio_pvclock.c:49:6: warning: no previous prototype for
 function 'update_suspend_time'
Message-ID: <202311221431.yztkGogx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   17247bc66ac307a806992acccf347a5f9efbd4d9
commit: 029865ac9555743665dd106b4bbefb2f371849e9 [4/4] ANDROID: virtio: virtio_pvclock: initial driver impl
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231122/202311221431.yztkGogx-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221431.yztkGogx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221431.yztkGogx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_pvclock.c:49:6: warning: no previous prototype for function 'update_suspend_time' [-Wmissing-prototypes]
   void update_suspend_time(struct work_struct *work)
        ^
   drivers/virtio/virtio_pvclock.c:49:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_suspend_time(struct work_struct *work)
   ^
   static 
   drivers/virtio/virtio_pvclock.c:295:11: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
           uint32_t rating =
                    ^
   2 warnings generated.


vim +/update_suspend_time +49 drivers/virtio/virtio_pvclock.c

    48	
  > 49	void update_suspend_time(struct work_struct *work)
    50	{
    51		u64 suspend_ns, suspend_time_delta = 0;
    52		struct timespec64 inject_time;
    53		struct virtio_pvclock *vp;
    54	
    55		vp = container_of(work, struct virtio_pvclock,
    56				  update_suspend_time_work);
    57	
    58		virtio_cread(vp->vdev, struct virtio_pvclock_config, suspend_time_ns,
    59			     &suspend_ns);
    60	
    61		mutex_lock(&vp->inject_suspend_lock);
    62		if (suspend_ns > vp->injected_suspend_ns) {
    63			suspend_time_delta = suspend_ns - vp->injected_suspend_ns;
    64			vp->injected_suspend_ns = suspend_ns;
    65		}
    66		mutex_unlock(&vp->inject_suspend_lock);
    67	
    68		if (suspend_time_delta == 0) {
    69			dev_err(&vp->vdev->dev,
    70				"%s: suspend_time_ns is less than injected_suspend_ns\n",
    71				__func__);
    72			return;
    73		}
    74	
    75		inject_time = ns_to_timespec64(suspend_time_delta);
    76	
    77		timekeeping_inject_sleeptime64(&inject_time);
    78	
    79		dev_info(&vp->vdev->dev, "injected sleeptime: %llu ns\n",
    80			 suspend_time_delta);
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
