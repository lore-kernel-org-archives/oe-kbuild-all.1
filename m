Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709C21640F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 20:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685565951; x=1717101951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PJW21wJli9qkZ7QXFTSH0/MHI0lm6akAUyC4MCnTY5Y=;
  b=WOG4V5GsWVolvW5DiFvxb+27kbxYrzmPt+SIQ0ZEBsSwh5fAGUk/OVSW
   B2cqls2/5WMpHQs84L8zhyTd+/HZDT0TE2FSz195wTzoLVCXUXCMU6bgl
   /EqUisKkapCwikrXxJT0vX2YqisAUvNMwzK8E3DUXtDrYHCiZG3wQa3UR
   2fCNPOAe2FIHZavtoFrqwl6uj9VirJg4LRMz69rUrvT29WF5bTcgyjOOZ
   n1C1eXICg0ouQD5mcknFTpG5KPUXSPjDvjWmnN5Tje8cZpKpbn9HXgmwu
   wkof6sT0aJnlRGcSuUiZbiTkFRsvH5GTBNJO4WtU+TGWb/cIIZqfte6Ke
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="383626952"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="383626952"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 13:45:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="740111476"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="740111476"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 May 2023 13:45:39 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4ShO-0001af-1V;
	Wed, 31 May 2023 20:45:38 +0000
Date: Thu, 1 Jun 2023 04:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2023-06 938/20126]
 pda_power.c:undefined reference to `usb_put_phy'
Message-ID: <202306010413.UZy4mv87-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-2023-06
head:   1247e4a9ca826161b8c13c6422a56ed008dc4de5
commit: adb016dd5328f53cccfabd3af74fd1be9ca02fad [938/20126] ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
config: x86_64-buildonly-randconfig-r006-20230531 (https://download.01.org/0day-ci/archive/20230601/202306010413.UZy4mv87-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15-2023-06
        git checkout adb016dd5328f53cccfabd3af74fd1be9ca02fad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306010413.UZy4mv87-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/power/supply/pda_power.o: in function `pda_power_remove':
>> pda_power.c:(.text+0xb18): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe':
>> pda_power.c:(.text+0xecd): undefined reference to `usb_get_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe.cold':
>> pda_power.c:(.text.unlikely+0x17c): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/wm831x_power.o: in function `wm831x_power_probe':
>> wm831x_power.c:(.text+0x1146): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
>> isp1704_charger.c:(.text+0x22a): undefined reference to `devm_usb_get_phy_by_phandle'
>> ld: isp1704_charger.c:(.text+0x636): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
>> bq25890_charger.c:(.text+0xf1c): undefined reference to `devm_usb_get_phy'
   ld: sound/core/jack.o: in function `snd_jack_dev_disconnect':
   jack.c:(.text+0x3f): undefined reference to `input_free_device'
   ld: jack.c:(.text+0x65): undefined reference to `input_unregister_device'
   ld: sound/core/jack.o: in function `snd_jack_dev_register':
   jack.c:(.text+0x13c): undefined reference to `input_set_capability'
   ld: jack.c:(.text+0x16f): undefined reference to `input_register_device'
   ld: sound/core/jack.o: in function `snd_jack_dev_free':
   jack.c:(.text+0x3f6): undefined reference to `input_free_device'
   ld: jack.c:(.text+0x437): undefined reference to `input_unregister_device'
   ld: sound/core/jack.o: in function `snd_jack_new':
   jack.c:(.text+0x596): undefined reference to `input_allocate_device'
   ld: jack.c:(.text+0x616): undefined reference to `input_set_capability'
   ld: jack.c:(.text+0x6fd): undefined reference to `input_free_device'
   ld: sound/core/jack.o: in function `snd_jack_report':
   jack.c:(.text+0x951): undefined reference to `input_event'
   ld: jack.c:(.text+0x978): undefined reference to `input_event'
   ld: jack.c:(.text+0xa0a): undefined reference to `input_event'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
