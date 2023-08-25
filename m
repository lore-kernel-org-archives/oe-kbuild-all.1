Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E196A2571
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 16:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692980124; x=1724516124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rwr6PSTgN8wp4klUyHHPGoINVGER8BObj2gS+V7ZX38=;
  b=DpMoKz9zDlOv9LkfUYbRp/J07VD1uhg0HFB0+wWlPVgl3wpPeR7uzLVZ
   IBYL7F8xNyc/skRWHN7Zc/IabhL0BZiKNGs6Ed6WNiOMYNEztYO7J0+rh
   4oaIS/3m36RldBA1UoMoh/4VGNOpok/3hsONA+YiEy6eJvSiyi0pelvAG
   ypyG8EBh3gu/atxSV1S6TVQc/W3b4haAcgx5jtK6g1LPU6FIGOmQ74cRk
   OI4cUINaTXCV610mUg5UezPlG6arPDk8sy3tc9BMIyPmXm6dRcVkMUKBA
   FpdP2X0ioD8CY4pL+YHN7AaJJvRbNHPdbBrkJRfmc+b+K1xB9qQ78Gvao
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="364942523"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="364942523"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 09:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="1068283943"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="1068283943"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Aug 2023 09:10:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZZOY-0003nL-17;
	Fri, 25 Aug 2023 16:10:46 +0000
Date: Sat, 26 Aug 2023 00:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Subject: Re: [PATCH 1/9] accel/ivpu: Move set autosuspend delay to HW
 specific code
Message-ID: <202308260057.5bVOUnNo-lkp@intel.com>
References: <20230825124135.4086628-2-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825124135.4086628-2-stanislaw.gruszka@linux.intel.com>

Hi Stanislaw,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on next-20230825]
[cannot apply to drm-misc/drm-misc-next linus/master v6.5-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislaw-Gruszka/accel-ivpu-Move-set-autosuspend-delay-to-HW-specific-code/20230825-204444
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230825124135.4086628-2-stanislaw.gruszka%40linux.intel.com
patch subject: [PATCH 1/9] accel/ivpu: Move set autosuspend delay to HW specific code
config: x86_64-randconfig-004-20230825 (https://download.01.org/0day-ci/archive/20230826/202308260057.5bVOUnNo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260057.5bVOUnNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260057.5bVOUnNo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/pci.h:37,
                    from drivers/accel/ivpu/ivpu_pm.c:8:
   drivers/accel/ivpu/ivpu_pm.c: In function 'ivpu_pm_init':
>> drivers/accel/ivpu/ivpu_pm.c:303:66: error: 'struct dev_pm_info' has no member named 'autosuspend_delay'
     303 |         ivpu_dbg(vdev, PM, "Autosuspend delay = %d\n", dev->power.autosuspend_delay);
         |                                                                  ^
   include/linux/dev_printk.h:129:48: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                                ^~~~~~~~~~~
   drivers/accel/ivpu/ivpu_drv.h:73:17: note: in expansion of macro 'dev_dbg'
      73 |                 dev_dbg((vdev)->drm.dev, "[%s] " fmt, #type, ##args);          \
         |                 ^~~~~~~
   drivers/accel/ivpu/ivpu_pm.c:303:9: note: in expansion of macro 'ivpu_dbg'
     303 |         ivpu_dbg(vdev, PM, "Autosuspend delay = %d\n", dev->power.autosuspend_delay);
         |         ^~~~~~~~


vim +303 drivers/accel/ivpu/ivpu_pm.c

   284	
   285	int ivpu_pm_init(struct ivpu_device *vdev)
   286	{
   287		struct device *dev = vdev->drm.dev;
   288		struct ivpu_pm_info *pm = vdev->pm;
   289	
   290		pm->vdev = vdev;
   291		pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
   292	
   293		atomic_set(&pm->in_reset, 0);
   294		INIT_WORK(&pm->recovery_work, ivpu_pm_recovery_work);
   295	
   296		pm_runtime_use_autosuspend(dev);
   297	
   298		if (ivpu_disable_recovery)
   299			pm_runtime_set_autosuspend_delay(dev, -1);
   300		else
   301			pm_runtime_set_autosuspend_delay(dev, vdev->timeout.autosuspend);
   302	
 > 303		ivpu_dbg(vdev, PM, "Autosuspend delay = %d\n", dev->power.autosuspend_delay);
   304	
   305		return 0;
   306	}
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
