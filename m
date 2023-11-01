Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFE51841
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 02:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JI7nRdQp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698804770; x=1730340770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0JVvMWru+/JYoDkrf/kxs3VVIuSerWcU8a5wgfGwh+Y=;
  b=JI7nRdQpD/pKA4YR3qeWff18I0PwxgQEZn3s+7YepEz1BSFAYuvJsl6q
   PKa6aSYw8gZwQco9jOwtVx0jD7uGEiqO3Km8C8K05donOu3QfVuxU+qwx
   aFAJWjDN0zz/r/3SZV/E5qARGt/M7NK7L1KNm01X28D8AMh5W1rzVCUfS
   JOugjH3cPw6ionMQ3hzNNQkuNtRyo46/mAauMYoFo/g44HhWnMpdVkmzW
   cENwTCCOYj78GwPSMBL8FbBZ6nVeTxUe5Wrnxq1l97E9hTtA/E77YKlSp
   Let+vUL3LNG4m7XL0xMe6UlqMAUFLW/zhbh4sTXty9sYVyAOF/gDjeqeG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="474656267"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="474656267"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 19:12:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="826622565"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="826622565"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Oct 2023 19:12:47 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy0ir-0000Ww-23;
	Wed, 01 Nov 2023 02:12:45 +0000
Date: Wed, 1 Nov 2023 10:12:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4-lts 5037/29904] pda_power.c:undefined
 reference to `usb_put_phy'
Message-ID: <202311011047.NPBGhAFa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4-lts
head:   7e0378ff5ef3dc6bf91b89c3c99eeb8030bac47a
commit: f7941b37ab1c4cc0a85a5617d32495908c3d08a2 [5037/29904] ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
config: i386-buildonly-randconfig-003-20231101 (https://download.01.org/0day-ci/archive/20231101/202311011047.NPBGhAFa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311011047.NPBGhAFa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011047.NPBGhAFa-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/power/supply/pda_power.o: in function `pda_power_remove':
   pda_power.c:(.text+0x266): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe':
   pda_power.c:(.text+0x6dd): undefined reference to `usb_get_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe.cold':
>> pda_power.c:(.text.unlikely+0x100): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_probe':
>> rt9455_charger.c:(.text+0x16c9): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
   isp1704_charger.c:(.text+0x154): undefined reference to `devm_usb_get_phy_by_phandle'
>> ld: isp1704_charger.c:(.text+0x398): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/twl4030_charger.o: in function `twl4030_bci_probe':
   twl4030_charger.c:(.text+0x1479): undefined reference to `devm_usb_get_phy_by_node'
   ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
>> bq25890_charger.c:(.text+0x9d9): undefined reference to `devm_usb_get_phy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
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
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
