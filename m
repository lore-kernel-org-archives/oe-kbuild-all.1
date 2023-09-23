Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5C337C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 04:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695443873; x=1726979873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IrgqcicNtCYFFFygX5BjxTkbqGhovs436aVXMKzphr4=;
  b=fYZkBw+YOTIQs7cFUwHnKryv2SvI2flWXlQVP4GiCemp6+XLy3LIVCnU
   uYv9LtKgPGCR9TONXpIVYEE07EjnA9iH4worAw8qJ4m00JlKHwHRLjW44
   i3UmClzrry64Lyfcvo1XWrjnUiwMRhLju3j0xqLd49qKKkA1CdllDXJKq
   XQTuDO5QYziY5eeilGvMaSvkFq1magre5T0umsO2LEP4AMFbuxghzNUKZ
   81yKWcUq80XkphLUrc487WreQxz+x8JW0IVyMtxqsPbdTkiztu4+5Kbmt
   fDhEFRDqzV8tqIx7dyoCQDAiAWVjkdXOx3CtQxB7kayC7qbb9L9HQUbKg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="371307987"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="371307987"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 21:37:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="782874603"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="782874603"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 22 Sep 2023 21:37:45 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjuOk-0001mF-38;
	Sat, 23 Sep 2023 04:37:42 +0000
Date: Sat, 23 Sep 2023 12:37:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 5037/27214]
 isp1704_charger.c:undefined reference to `devm_usb_get_phy_by_phandle'
Message-ID: <202309231235.kRTvWxSB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   ca2edd4a031c6a640d53d2337d30cea639d72dd8
commit: f7941b37ab1c4cc0a85a5617d32495908c3d08a2 [5037/27214] ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
config: x86_64-buildonly-randconfig-003-20230922 (https://download.01.org/0day-ci/archive/20230923/202309231235.kRTvWxSB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309231235.kRTvWxSB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309231235.kRTvWxSB-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/power/supply/pda_power.o: in function `pda_power_remove':
   pda_power.c:(.text+0x18c): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe':
   pda_power.c:(.text+0x74a): undefined reference to `usb_get_phy'
   ld: pda_power.c:(.text+0x9f0): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
>> isp1704_charger.c:(.text+0x4fe): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: isp1704_charger.c:(.text+0x50d): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   bq25890_charger.c:(.text+0xb71): undefined reference to `devm_usb_get_phy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
