Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB57C1845
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jan 2024 00:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqwcIMo5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704415075; x=1735951075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tA90xhyMvS/Co15Cl2K7RNsaBz2QUZfi/10E8B6OtUw=;
  b=fqwcIMo5r6ecpiWZpRQizk/Ic6UI/LPffb43JgfRrWHXkEeMXaFzbje7
   S49fr4/UrHuesBUFYnTPiKHHwap3PJ9v8lcxeDv+cts7VRiD5gxiOB2NA
   qv4aNcGfjizabjEScsMFN4NoWFYuoEPHwRxLsISLz8t0OXOO0KcH75uGU
   RhUFOGekCbUvhVyewa1kJiWfSRstUcWdWBnJhB/sqmgtjLCS7YJ+gviqy
   WASDiX7b89/BwP2NcAqvdEzSTFxRE5BeDbtVVszMA4qLZAQPBKe05lyQx
   UmMwtjLVm4RpmDpkUvMRRN8sSTdGt4mlnC05dhIcdKTpth6Yd7dnPQrcA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4176442"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="4176442"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 16:36:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="22678031"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jan 2024 16:36:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLYCQ-0000Zg-23;
	Fri, 05 Jan 2024 00:36:34 +0000
Date: Fri, 5 Jan 2024 08:36:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 19/32]
 drivers/virt/gunyah/vm_mgr.c:46:21: error: call to undeclared function
 'module_refcount'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202401050825.Qzq2QWCX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   e74417834ea0485b4a1e9ba9d8d7f2fed143eddd
commit: 291489ffb6b5de26afe2c403dc5cfe3977b5532c [19/32] BACKPORT: FROMLIST: gunyah: vm_mgr: Add framework to add VM Functions
config: arm64-randconfig-004-20240105 (https://download.01.org/0day-ci/archive/20240105/202401050825.Qzq2QWCX-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7e186d366d6c7def0543acc255931f617e76dff0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401050825.Qzq2QWCX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401050825.Qzq2QWCX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/virt/gunyah/vm_mgr.c:46:21: error: call to undeclared function 'module_refcount'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      46 |         WARN_ON(fn->mod && module_refcount(fn->mod));
         |                            ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/module_refcount +46 drivers/virt/gunyah/vm_mgr.c

    42	
    43	void gh_vm_function_unregister(struct gh_vm_function *fn)
    44	{
    45		/* Expecting unregister to only come when unloading a module */
  > 46		WARN_ON(fn->mod && module_refcount(fn->mod));
    47		xa_erase(&functions, fn->type);
    48	}
    49	EXPORT_SYMBOL_GPL(gh_vm_function_unregister);
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
