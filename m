Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1643F15E89
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 17:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722706741; cv=none; b=WELix8KMPu5HJ9bUdzM62cxdDu0ZiCaO4JBkm7NH6f/r5BVy00bDzWCoF0ZAx91eErO+Pcq/nhjUmKHcS1CjKMQjTMSZrlOKCg3wJ+EBRTH60UIzY0X1Jrx/dO/v5EtbuKOJ348cLoSfvuM2BX5yUJsf4MuJUcMIA03APZxcTEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722706741; c=relaxed/simple;
	bh=M7nBdBjKL/Du0A2I0LhgvJCZJrPV9RnTfHZfvB03jTM=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NVDZaRbLSCJzdBPH6c3OT2OTlneev61zwYCFH6Q9QFs0+W8X/ZTn9cSX1pV6zsNzRFWC295tiJ0u4kC14wggYArW5frncE+ikmX6nxml3tb8ziy4NoHiVMmgZwTa6MQEUkiVfJT/zXzfKd+lf/gfIm545xMPwIIe4/Jh/xTPWXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ghx9VaBb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ghx9VaBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722706739; x=1754242739;
  h=date:from:cc:subject:message-id:mime-version;
  bh=M7nBdBjKL/Du0A2I0LhgvJCZJrPV9RnTfHZfvB03jTM=;
  b=Ghx9VaBbALiqfLKfX92Xgk0OfBeQlzNclvYtAh1i7k4cAVQiM6ZtBMAB
   DSxJklUQlY+scP9hgTM8TmwtWy4x5cFan/p/rttXhJ1vJtMcPrKps9Tdn
   G/YuZU6NiLMMuryZbasLdFAbvbZW0o5m5qgzdFIGov67tSj6I33dIOYrU
   sgUiBF1RaSyExmTgvYzBJNycajt9GpaxtyLKAfsfO5AOfS8uEs/ZEqIX+
   2h8J3K8JUFkQSa2im/6jojOXDFKaStvphmUW9AqUKorsOC2cM0mmHbkJ2
   NDd5771pN++Hucv2bPIhconrX1EdypjVVuC/wZS9ViyubzPzLwhpnyBNX
   g==;
X-CSE-ConnectionGUID: mV1zhAvoT+q/Xc0UAq9olA==
X-CSE-MsgGUID: 2g9A8qInTEaOtf+FjGNRcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="31364234"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="31364234"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 10:38:59 -0700
X-CSE-ConnectionGUID: SFRZE1V/SgaDKYOvG3sYow==
X-CSE-MsgGUID: E/VDdBt9QIW12givjPF96A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="55958506"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 03 Aug 2024 10:38:57 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saIiU-0000nt-1z
	for oe-kbuild-all@lists.linux.dev;
	Sat, 03 Aug 2024 17:38:54 +0000
Date: Sun, 4 Aug 2024 01:37:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/android_t 938/29299] aarch64-linux-ld:
 isp1704_charger.c:undefined reference to `devm_usb_get_phy'
Message-ID: <202408040125.QsWpLfvQ-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_t
head:   9485d66da87d67d1efc4a5f2d357616c6501dc72
commit: adb016dd5328f53cccfabd3af74fd1be9ca02fad [938/29299] ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
config: arm64-randconfig-004-20240803 (https://download.01.org/0day-ci/archive/20240804/202408040125.QsWpLfvQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040125.QsWpLfvQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040125.QsWpLfvQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_probe':
   rt9455_charger.c:(.text+0x1eb4): undefined reference to `devm_usb_get_phy'
   rt9455_charger.c:(.text+0x1eb4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `devm_usb_get_phy'
   aarch64-linux-ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
   isp1704_charger.c:(.text+0x218): undefined reference to `devm_usb_get_phy_by_phandle'
   isp1704_charger.c:(.text+0x218): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `devm_usb_get_phy_by_phandle'
>> aarch64-linux-ld: isp1704_charger.c:(.text+0x230): undefined reference to `devm_usb_get_phy'
   isp1704_charger.c:(.text+0x230): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `devm_usb_get_phy'
   aarch64-linux-ld: drivers/power/supply/twl4030_charger.o: in function `twl4030_bci_probe':
>> twl4030_charger.c:(.text+0x1c58): undefined reference to `devm_usb_get_phy_by_node'
   twl4030_charger.c:(.text+0x1c58): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `devm_usb_get_phy_by_node'
   aarch64-linux-ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   bq25890_charger.c:(.text+0x119c): undefined reference to `devm_usb_get_phy'
   bq25890_charger.c:(.text+0x119c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `devm_usb_get_phy'
   aarch64-linux-ld: drivers/power/supply/sc2731_charger.o: in function `sc2731_charger_probe':
   sc2731_charger.c:(.text+0x948): undefined reference to `devm_usb_get_phy_by_phandle'
   sc2731_charger.c:(.text+0x948): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `devm_usb_get_phy_by_phandle'
>> aarch64-linux-ld: sc2731_charger.c:(.text+0x9d4): undefined reference to `usb_phy_get_charger_current'
   sc2731_charger.c:(.text+0x9d4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `usb_phy_get_charger_current'
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_dev_disconnect':
   jack.c:(.text+0xc4): undefined reference to `input_unregister_device'
   jack.c:(.text+0xc4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `input_unregister_device'
   aarch64-linux-ld: jack.c:(.text+0xd4): undefined reference to `input_free_device'
   jack.c:(.text+0xd4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `input_free_device'
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_dev_register':
   jack.c:(.text+0x1dc): undefined reference to `input_set_capability'
   jack.c:(.text+0x1dc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `input_set_capability'
   aarch64-linux-ld: jack.c:(.text+0x20c): undefined reference to `input_register_device'
   jack.c:(.text+0x20c): additional relocation overflows omitted from the output
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_dev_free':
   jack.c:(.text+0x40c): undefined reference to `input_unregister_device'
   aarch64-linux-ld: jack.c:(.text+0x41c): undefined reference to `input_free_device'
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_new':
   jack.c:(.text+0x5f8): undefined reference to `input_allocate_device'
   aarch64-linux-ld: jack.c:(.text+0x660): undefined reference to `input_set_capability'
   aarch64-linux-ld: jack.c:(.text+0x710): undefined reference to `input_free_device'
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_report':
   jack.c:(.text+0x92c): undefined reference to `input_event'
   aarch64-linux-ld: jack.c:(.text+0x9b8): undefined reference to `input_event'
   aarch64-linux-ld: jack.c:(.text+0x9fc): undefined reference to `input_event'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
