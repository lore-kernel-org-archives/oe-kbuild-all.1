Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768AC18132A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 16:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725986578; cv=none; b=HfPMVBzF/s9YqALtiqAlGo8zZk++ocbOvkKIf5BR1kOiWcWFta7EE+Bcn1rPkVFwr+ua+zSPnovFnUS2rJu11NAuCsRM+f+RytYOVxxLJMvOQYf7JVNOA7k/Lq9vr+WZCVnjojhs1leMolMWjAC++tmrwTh3/uFHcVsnGcCfFIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725986578; c=relaxed/simple;
	bh=U9Nal/aSXFdm4x3H/aGylf4bAOQYA/j4mBRP1BgahAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RFWhr+RDLgAz8S8yP0OIeQi+GYvi5R4Y96JkzuIpMx6exW+GfcCt64Uy+OVZhmuZPrSgZvxBt3YdpKJ0oZeiZ/L8naOx/q/UNPVVIfToA7p13KzH8bKXlyE8lnkymhfq58SspUmy+4dUmKy8fMnXTuYhwxerraXXaK/qDJhLHog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jv9Dtddd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jv9Dtddd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725986576; x=1757522576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U9Nal/aSXFdm4x3H/aGylf4bAOQYA/j4mBRP1BgahAI=;
  b=jv9Dtddd5Xrs6d0tRYU1JQvqlp44vthz3erDobC2abDDGIOS2GaX8q20
   IrdL47nrskw2WkT7v4ANdPc1OI5cV4I8fXqq2g0RTwKNX6zMMQjbBey0Y
   K+iTNn+3bsx6AzyvoyYI8I1RaEz57M5ZYtHFF0dD+e2Ut0qRQQhaRVO96
   jC5ZeyjHToIrUFC7iriq+PszkQXFMVL3WUFENApQyNYZR7Nd8DAlkOuxG
   ydAOwvfdBStbcRaYrVGnq/t/KQaOocy+CDo+e5hQrvbliBseWuj3ayIu5
   XSYQkQqw3f7mDSJnrb5mzAby6uojY7IhF1wVW/y5lHBAW63Yn/szD5f+k
   A==;
X-CSE-ConnectionGUID: sVd2nJh5T+uuQRapKhtpbw==
X-CSE-MsgGUID: 27KTImbsTwO6kd5RO9Cvjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24290312"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="24290312"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 09:42:55 -0700
X-CSE-ConnectionGUID: 3Q+nnwJxSdmVpAqr81f0+w==
X-CSE-MsgGUID: KS3dVdJLTe2IXxtWPXT7Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="66921825"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Sep 2024 09:42:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so3x5-0002OH-2y;
	Tue, 10 Sep 2024 16:42:51 +0000
Date: Wed, 11 Sep 2024 00:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 16/44]
 drivers/virt/gunyah/vm_mgr.c:173:28: error: implicit declaration of function
 'module_refcount'
Message-ID: <202409110037.SEyIFlOn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   63aeacfc81f69e2533c50ab0965e02c11e015344
commit: f3be66c6dc3c15949929f656944ec339cb5096e5 [16/44] FROMLIST: gunyah: vm_mgr: Add framework for VM Functions
config: arm64-randconfig-r131-20240910 (https://download.01.org/0day-ci/archive/20240911/202409110037.SEyIFlOn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240911/202409110037.SEyIFlOn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409110037.SEyIFlOn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from arch/arm64/include/asm/cpufeature.h:23,
                    from arch/arm64/include/asm/hwcap.h:9,
                    from arch/arm64/include/asm/arch_timer.h:12,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from drivers/virt/gunyah/vm_mgr.c:9:
   drivers/virt/gunyah/vm_mgr.c: In function 'gunyah_vm_function_unregister':
>> drivers/virt/gunyah/vm_mgr.c:173:28: error: implicit declaration of function 'module_refcount' [-Wimplicit-function-declaration]
     173 |         WARN_ON(fn->mod && module_refcount(fn->mod));
         |                            ^~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +/module_refcount +173 drivers/virt/gunyah/vm_mgr.c

   169	
   170	void gunyah_vm_function_unregister(struct gunyah_vm_function *fn)
   171	{
   172		/* Expecting unregister to only come when unloading a module */
 > 173		WARN_ON(fn->mod && module_refcount(fn->mod));
   174		xa_erase(&gunyah_vm_functions, fn->type);
   175	}
   176	EXPORT_SYMBOL_GPL(gunyah_vm_function_unregister);
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
