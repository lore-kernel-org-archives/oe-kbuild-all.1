Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B38340407
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 11:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786621582; cv=none; b=bHZRv5VCrltAtOrCA/aDN89Ryk+1QlsmM8wVV2q+IVtedpx/jplS4cjl016FwiFGDgPEK4Xt3BOY7qlHnsOqQX70DMXeY3IvDIqjJySJ4+DYgAQwCO3/lUaQgPHS7jawpjMWHWebC/2Pad3QemZtNXeeI4kyuKTYQXrk4VOa20s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786621582; c=relaxed/simple;
	bh=MM3qymzTNAWSchI/0+V2o+2AEKnaAwcFGswRtBGkfiw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uwGfjuB9hK7vieV5DGoLC3A3LVccHq6MAKVoihDNmLAgC2im9kJLZCk0tWiovcewTB9IaHLw4YHA2Ag0XmqGUr4rk3V8S7XTD5GVYAwY2F8dCwZy1V83WO+eRUGoAQkUt/ovDcrLTu/2GzWEFg8cYAcUeZ9SLWcKp3V+sWqU4nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FltdZFdr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FltdZFdr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786621581; x=1818157581;
  h=date:from:to:cc:subject:message-id;
  bh=MM3qymzTNAWSchI/0+V2o+2AEKnaAwcFGswRtBGkfiw=;
  b=FltdZFdrDYjnwaO4tCABK1ZnFZtFq5xgPT5EsYK+YHAmb6WpjB9WvJ/o
   Y4hXWbcuH85jSjKRd/iOIW+Q7VYbfIbiAqKowidP3isFYCOukwAwy6Fgc
   KmFLm2hm+YpOILqGkAa6MsrgKwmvtClfWTRpeeCqk/84x/UZWq694KlEl
   Dmpg6fraMXPobq3HaMC8C8KRS4vQjbLXOsiJPlrIwSX+hxnsnoVy5zhJJ
   wNhHBeklEMb9ZRPyrDKwE6ebJ/O2ck70WXNdVeLX6egWOCZttJ/EVQaUx
   t7dyWqIdV88GEnYMYVEPaYZZ7elhZJpnDaHYvpCwk8jnfySca9mT3YaS1
   Q==;
X-CSE-ConnectionGUID: k+KE8ndeRlis9tHEX10u2Q==
X-CSE-MsgGUID: KPY2+p/gTueMxaefxqkTfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="91067618"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="91067618"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 04:46:20 -0700
X-CSE-ConnectionGUID: +LkdXsluQr6uoDu/GaituQ==
X-CSE-MsgGUID: bOlKQ+DjR/eJxw6b+2itDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="267436781"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Aug 2026 04:46:19 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuTt2-00000000Tuk-1JBb;
	Thu, 13 Aug 2026 11:46:16 +0000
Date: Thu, 13 Aug 2026 19:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/usb/typec/mode_selection.c:261:9: error: implicit declaration of
 function 'kzalloc'
Message-ID: <202608131955.l7J3dFuN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Andrei,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: f49f8d90b43e2a0aa7a011c88529f38c409fbf0b [1/1] ANDROID: usb: typec: Implement mode selection
config: arm-randconfig-004-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131955.l7J3dFuN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131955.l7J3dFuN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131955.l7J3dFuN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/typec/mode_selection.c: In function 'mode_list_clean':
   drivers/usb/typec/mode_selection.c:110:3: error: implicit declaration of function 'kfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
     110 |   kfree(ms);
         |   ^~~~~
         |   kvfree
   drivers/usb/typec/mode_selection.c: In function 'mode_add_to_list':
>> drivers/usb/typec/mode_selection.c:261:9: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
     261 |    ms = kzalloc(sizeof(struct mode_state), GFP_KERNEL);
         |         ^~~~~~~
   drivers/usb/typec/mode_selection.c:261:7: warning: assignment to 'struct mode_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     261 |    ms = kzalloc(sizeof(struct mode_state), GFP_KERNEL);
         |       ^
   drivers/usb/typec/mode_selection.c: In function 'typec_mode_selection_start':
   drivers/usb/typec/mode_selection.c:292:6: warning: assignment to 'struct altmode_selection *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     292 |  sel = kzalloc(sizeof(struct altmode_selection), GFP_KERNEL);
         |      ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
   Selected by [m]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=m]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=m] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
   Selected by [m]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=m]


vim +/kzalloc +261 drivers/usb/typec/mode_selection.c

   250	
   251	static int mode_add_to_list(struct device *dev, void *data)
   252	{
   253		struct list_head *list = (struct list_head *)data;
   254		struct mode_state *ms;
   255	
   256		if (is_typec_altmode(dev)) {
   257			struct typec_altmode *altmode = to_typec_altmode(dev);
   258			const struct typec_altmode *pdev = typec_altmode_get_partner(altmode);
   259	
   260			if (pdev && altmode->ops && altmode->ops->activate) {
 > 261				ms = kzalloc(sizeof(struct mode_state), GFP_KERNEL);
   262				if (!ms)
   263					return -ENOMEM;
   264	
   265				ms->altmode = altmode;
   266				ms->priority = pdev->priority;
   267				INIT_LIST_HEAD(&ms->list);
   268				list_add_tail(&ms->list, list);
   269			}
   270		}
   271	
   272		return 0;
   273	}
   274	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
