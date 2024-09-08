Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457821C01
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725810926; cv=none; b=kMRYBRABlXyKwUdAgbSN+98hNUsWy4slG+XcNd8ZES29pbr3rjhZbGwu/VMQiY7zNUqFSp/GY84AfjXPJFwWmqmWdD25Tpqzjw5AW3RRy3STnfWUlUxFU+n1DRDrLIvtMFIzuyyyEO8jobnnzc3zk7g8qvHQkOzC+MtBxwTtnpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725810926; c=relaxed/simple;
	bh=ncDLjl9Qj9z1EWedWQqPnr+nGwIlRCX6/7CZkOv968w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bpNG+fkE1Oo3KRWZllpGGxpKQciYO+IYhnJinTaS9r8QEu+Ji3Dd8MBHVxDSw8qd12M0Cz2hMtS+QTQ/pzf+qtxHmYry6NaKCQVPVmIlDMY3NfIMBNOwnf8pOi9BLxTW2ZNYz+QzX6/T82AkWTH2qKPG4kZ/HAFBgz9yAX+53j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/irqcVf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/irqcVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725810924; x=1757346924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ncDLjl9Qj9z1EWedWQqPnr+nGwIlRCX6/7CZkOv968w=;
  b=n/irqcVfvYNd/cv0kgcgJxjxu7ZYll17mXkST2Fp8DjuncDl4V8fPWmd
   7Q8NYFtMJR5EsjKCD/zB22xP6Ke9rfeiFFF6r2syapW225xKSrPl0c9il
   dx9GO7ObvJ3v032GkLgDi/Uq5lpKDVXXyt2CS4cBrvW1G30O3nhWXIJoz
   NnnHE6GxQreZqW88DGZWeSd2/MtcONpCmzFbYGJFU7F+L08FInhCCOwTw
   TP3B/K77FX1GqP2cWnBFA+aQ2hqBHZXQdtgh1kONjWpMMX9JPbQ6SIH4b
   9d7gzw7ho5qtRNsyiJj72JTJnhSCZBtVLzFytvQ5y6dfCgPEkZ7hZ0+Et
   g==;
X-CSE-ConnectionGUID: 6lUU5g1FTq2POgm4lq9xKg==
X-CSE-MsgGUID: cnskKuU+Shu4MY489dWQjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35854224"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="35854224"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 08:55:24 -0700
X-CSE-ConnectionGUID: zrMYdHs1TGeG5UGkMs+cJQ==
X-CSE-MsgGUID: YuuW8KoqRIOoC7wRKCDt3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="67165699"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Sep 2024 08:55:23 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snKG0-000Dgv-18;
	Sun, 08 Sep 2024 15:55:20 +0000
Date: Sun, 8 Sep 2024 23:55:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sandeep Patil <sspatil@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Alistair Delva <adelva@google.com>
Subject: ld: pda_power.c:undefined reference to `usb_put_phy'
Message-ID: <202409082344.QvseYoQk-lkp@intel.com>
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

tree:   https://github.com/ambarus/linux-0day syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f
head:   caa714448992ba4eb583735a4acb26917fbc67a8
commit: adb016dd5328f53cccfabd3af74fd1be9ca02fad ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
date:   4 years, 5 months ago
config: i386-buildonly-randconfig-006-20240908 (https://download.01.org/0day-ci/archive/20240908/202409082344.QvseYoQk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409082344.QvseYoQk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409082344.QvseYoQk-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/power/supply/pda_power.o: in function `pda_power_remove':
   pda_power.c:(.text+0x191): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe':
   pda_power.c:(.text+0x4f8): undefined reference to `usb_get_phy'
>> ld: pda_power.c:(.text+0x6df): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/wm831x_power.o: in function `wm831x_power_probe':
>> wm831x_power.c:(.text+0x858): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_probe':
   rt9455_charger.c:(.text+0x151f): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   bq25890_charger.c:(.text+0xdda): undefined reference to `devm_usb_get_phy'

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
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
