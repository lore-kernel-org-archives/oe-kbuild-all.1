Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40154C79
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 01:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717896938; cv=none; b=klz5eN/z0UUpDM6BsNZLiPA7XcHtFtRVdD8BTO9elzrgJgx5KHBhDb8Mk1grc7pmpcBu5waC6cfzhCxm6XhwJ5YbXbph+vNOJTYedaAecHH2ucevYGrXqQ4q5jJ9Xgz6/KfOcpdp0JEw1iI3KgXLzPVup54g6GXxWC3pYCiA7p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717896938; c=relaxed/simple;
	bh=L5f2GwW6YmUDMPlXtZsxM43jVq0VgiWrn9ghPGs6Rik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P0j27C6bZ97NqlWxoO/UfZQ7Eww0/J42Yv8u1lWlqnQNNqqsxHNzZbMMD4xXvnhQLhm/1B/tdnIK9hvrU0ko6Y40fpk+1XWmTPw4ZlaIZCtwuIMWG9A3ht6DP0mHY9F9zT7clPBgpRhpb7ypa3VNutTzXe4GqF9Ch7+iydIux9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KU9eaOvH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KU9eaOvH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717896936; x=1749432936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L5f2GwW6YmUDMPlXtZsxM43jVq0VgiWrn9ghPGs6Rik=;
  b=KU9eaOvHYJCmPvoRjezvaBe5akHpUV4+Vmg5ndIEqVAZxjGEC6ksisgX
   NogsrYZmVB8qkCAyVM2EvwKXE2wYjd2Vs/8Ip7jErMEZ2g31ggdDK8XmV
   eDI8/TfKZO2OkqNzmBJLBNicT6U5fDycJkIB4j3gPwp37I+UZLcjNSuYj
   lAwR5K01A2rkgNVZ+/lWP2sY+wPK5/XzkN+d9FYZHy0P446gCwCNId5qS
   8OvnqlK0Wtqu0EJj85Iph9WUeZrnyVjay7BCjV/pj+Xs4Zmfb6jCHsEis
   NMZtwKE53Ter54scPBg4zDebbdEcJcBFoaZuiL4xAATq6BRMcGsP9+iKj
   w==;
X-CSE-ConnectionGUID: svMC2Yf/QI+hik3ze+ghQA==
X-CSE-MsgGUID: uS13kXDbQnycGGjiG9xRQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="32081334"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="32081334"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 18:35:36 -0700
X-CSE-ConnectionGUID: woeGImGdSgGzSMJ3nf+dbw==
X-CSE-MsgGUID: DPPFvp6+TkSGtAgkVVo+RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="69483276"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Jun 2024 18:35:35 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG7T3-0000jT-13;
	Sun, 09 Jun 2024 01:35:33 +0000
Date: Sun, 9 Jun 2024 09:35:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 938/5188]
 da9150-charger.c:undefined reference to `devm_usb_get_phy'
Message-ID: <202406090937.WuCImCsT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sandeep,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   2334161bc8fc2d2e925c8601bedc551ed8aa9db8
commit: adb016dd5328f53cccfabd3af74fd1be9ca02fad [938/5188] ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
config: x86_64-buildonly-randconfig-006-20240609 (https://download.01.org/0day-ci/archive/20240609/202406090937.WuCImCsT-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406090937.WuCImCsT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406090937.WuCImCsT-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/power/supply/wm831x_power.o: in function `wm831x_power_probe':
   wm831x_power.c:(.text+0xb1c): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: drivers/power/supply/da9150-charger.o: in function `da9150_charger_probe':
>> da9150-charger.c:(.text+0x956): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_probe':
   rt9455_charger.c:(.text+0x1424): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/twl4030_charger.o: in function `twl4030_bci_probe':
   twl4030_charger.c:(.text+0x17ea): undefined reference to `devm_usb_get_phy_by_node'
   ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   bq25890_charger.c:(.text+0xd89): undefined reference to `devm_usb_get_phy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
