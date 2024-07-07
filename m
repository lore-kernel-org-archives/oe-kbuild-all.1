Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5004405
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 07:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720337212; cv=none; b=UtH0msj53ekVypsUKO0Rv1Skcc+zUD/+srKKhXIYcS320VMHVNgvywPcRam7Uk0xOrkM/0Dy7i0o1iwD93P6Z3yI0FTfsqa5tj2G2mpI9GIYtUKgwLmtNne7Ra1D+Jn40FwIjHG7ne6inh4vjmlkhX2OBYx0rDQNZFR9bE8Xz6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720337212; c=relaxed/simple;
	bh=hvDCqb8adLeHivuruBfnAvH3n22531xvDhOgoWpFKEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p6hQQ89lZGtBkdrqcEaxAp2U8WNjF8Hu9DaB5kv4jQEOdjd7MczJsMmJgCP+MHE4vsg+kxXlVlNGKzODZKTvGJ5YxVSRjNjSYf8n0i87IniZyxjOg52FlXTBU5Wytae+GXFLNvotGA05An9Pl/3eqAQNywu0z6ZSm53gztslJl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Twy+dpaQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Twy+dpaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720337210; x=1751873210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hvDCqb8adLeHivuruBfnAvH3n22531xvDhOgoWpFKEI=;
  b=Twy+dpaQyRLEPA5Cc15RSoOIeliIJzbVc1ll4nhMD1B/XIFALsybRAkh
   LYDiKFFXMIt7VJyrbgm/d3BX/sewxWayph7jP+mgXsnwcPq6ezEkQHwwZ
   G+QuAPa/BWYhH//wbWxJRkrlD6ica95oshUGueG/fdJL1HiS+r1t/0PAF
   REMqwF0yAfHXzUzSLMvYhLX34ukdcouWa6VSzJhtSKdXKiOkJrQOCz2vT
   Tn8pmjXSghQQFLPytaC+S5d6KANTQgcmnqYc6I1NayzhD0VHpqu3ZiWzX
   nwVwCRI/ZEw+VT6mC1R6T0+YiNT3laxR892CkGtsFVcI3fjY274xc3eFK
   Q==;
X-CSE-ConnectionGUID: GZfxjsJpRFatsZwyF0FXFA==
X-CSE-MsgGUID: cIHuyMxZRZmC3AQ8f2L13Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="17664155"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="17664155"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 00:26:40 -0700
X-CSE-ConnectionGUID: T+06p2b2TA2gL/Ng09/2cg==
X-CSE-MsgGUID: AC/x8nqwReuuYJXN4Ua9sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="70406745"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jul 2024 00:26:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQMI9-000Uis-0M;
	Sun, 07 Jul 2024 07:26:37 +0000
Date: Sun, 7 Jul 2024 15:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14073/15088]
 drivers/gpu/arm/mali/mali_kbase_core_linux.c:6012:14: error: 'struct
 kbase_device' has no member named 'token'
Message-ID: <202407071527.doZkryCx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   2166fa6b0c817630441a03552541b022f35cfc03
commit: 87f5682a1e2b9a6c7cccba95d0c1e0bf47c43807 [14073/15088] CHROMIUM: gpu: mali: Apply r44p1 EAC release
config: arm64-randconfig-r064-20240707 (https://download.01.org/0day-ci/archive/20240707/202407071527.doZkryCx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407071527.doZkryCx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407071527.doZkryCx-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: warning: kbuild/src/consumer/drivers/gpu/arm/mali: No such file or directory [-Wmissing-include-dirs]
   drivers/gpu/arm/mali/mali_kbase_core_linux.c: In function 'kbase_platform_device_probe':
>> drivers/gpu/arm/mali/mali_kbase_core_linux.c:6012:14: error: 'struct kbase_device' has no member named 'token'
    6012 |         kbdev->token = -EPERM;
         |              ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +6012 drivers/gpu/arm/mali/mali_kbase_core_linux.c

  5995	
  5996	static int kbase_platform_device_probe(struct platform_device *pdev)
  5997	{
  5998		struct kbase_device *kbdev;
  5999		int err = 0;
  6000	
  6001		mali_kbase_print_cs_experimental();
  6002	
  6003		kbdev = kbase_device_alloc();
  6004		if (!kbdev) {
  6005			dev_err(&pdev->dev, "Allocate device failed\n");
  6006			return -ENOMEM;
  6007		}
  6008	
  6009		kbdev->dev = &pdev->dev;
  6010	
  6011	#if (KERNEL_VERSION(6, 0, 0) <= LINUX_VERSION_CODE)
> 6012		kbdev->token = -EPERM;
  6013	#endif /* (KERNEL_VERSION(6, 0, 0) <= LINUX_VERSION_CODE) */
  6014	
  6015		dev_set_drvdata(kbdev->dev, kbdev);
  6016	#if (KERNEL_VERSION(5, 3, 0) <= LINUX_VERSION_CODE)
  6017		mutex_lock(&kbase_probe_mutex);
  6018	#endif
  6019	
  6020		kbdev->funcs = (struct kbase_platform_specific_conf *)
  6021				of_device_get_match_data(kbdev->dev);
  6022	
  6023		if (!kbdev->funcs)
  6024			kbdev->funcs = (struct kbase_platform_specific_conf *)
  6025					&default_conf;
  6026	
  6027		err = kbase_device_init(kbdev);
  6028	
  6029		if (err) {
  6030			dev_err_probe(kbdev->dev, err,
  6031				      "Device initialization failed: %d\n", err);
  6032	
  6033			dev_set_drvdata(kbdev->dev, NULL);
  6034			kbase_device_free(kbdev);
  6035	#if (KERNEL_VERSION(5, 3, 0) <= LINUX_VERSION_CODE)
  6036			mutex_unlock(&kbase_probe_mutex);
  6037	#endif
  6038		} else {
  6039	#if (KERNEL_VERSION(6, 1, 0) <= LINUX_VERSION_CODE)
  6040			/* Since upstream is not exporting mmap_min_addr, kbase at the
  6041			 * moment is unable to track possible kernel changes via sysfs.
  6042			 * Flag this out in a device info message.
  6043			 */
  6044			dev_info(kbdev->dev, KBASE_COMPILED_MMAP_MIN_ADDR_MSG);
  6045	#endif
  6046	
  6047			dev_info(kbdev->dev,
  6048				"Probed as %s\n", dev_name(kbdev->mdev.this_device));
  6049			kbase_increment_device_id();
  6050	#if (KERNEL_VERSION(5, 3, 0) <= LINUX_VERSION_CODE)
  6051			mutex_unlock(&kbase_probe_mutex);
  6052	#endif
  6053	#ifdef CONFIG_MALI_ARBITER_SUPPORT
  6054			mutex_lock(&kbdev->pm.lock);
  6055			kbase_arbiter_pm_vm_event(kbdev, KBASE_VM_GPU_INITIALIZED_EVT);
  6056			mutex_unlock(&kbdev->pm.lock);
  6057	#endif
  6058		}
  6059	
  6060		return err;
  6061	}
  6062	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
