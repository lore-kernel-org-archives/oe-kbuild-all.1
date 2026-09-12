Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA1637E5D1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216538; cv=none; b=PNzBu8z/xA0pRO0IUlQhS4EduosMgQ8VnF+TB7yFWcC/nIu2bLDip1P7CkemW6drRQku2kRY9qU5VmdJO+XPVWS6BazlFKtRv9OuPC/MH3J7SxhYH2KEnp7T4AYT+Uda3hNZwpgZrCpQkQIL3s2HGr0QohIOV5gEoClQc3KAZac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216538; c=relaxed/simple;
	bh=MLy/x/7iZj3NA4Nlg+kBYxuz2eOUPu/wVvpVd2RqQaY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cn5EOYOyx6U8uQuyPv4B8j0NOmBwWGamINigW51VqWWG62n7IzPyjqURLTWLWeND1xC7+6+bfMhICXfMU9uHIVsTfhb+KzDEYzijBTSsc6wOl6NZ+YSOVNeMm0CbxWcG1iiSexGsHb+AYWd939JWZOhoF2OSEdUOxQufWRbP/44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WifCZwvV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WifCZwvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789216535; x=1820752535;
  h=date:from:to:cc:subject:message-id;
  bh=MLy/x/7iZj3NA4Nlg+kBYxuz2eOUPu/wVvpVd2RqQaY=;
  b=WifCZwvVwF8SBXE7sCh+QCBzp1Dk+YC+XnEac6n38uYdWmxaMDuiDDnJ
   yyA2CK8m4nBUAGEecRbuHliMPKw6cLUXKl8STlfOioNjBTKKwqeXgcYZp
   umzA67sFeHSHoHz2n/No3ShBlwZC9NOc4aqf9jqTEFIkiEmMaDU1j+oi6
   qu4zTgz3rydnrw8mhPLNZpg/Q2tQkhObMFdyCO+9Q3xLp0xhDOatdYFN6
   gU/r4Po5hLO0MX49UrIZmlaZmv+f3kFWJugkGRA3ne0AEnpx/p/AYIqoj
   uGNyHyvdjfdO6V4uqvgdeCYE5qTELV6GvXi6u/145T6rygYMyvh+oMCO7
   A==;
X-CSE-ConnectionGUID: vsGSakP9R7eDKqDy7QwRhQ==
X-CSE-MsgGUID: RNtR2bp2QAGvMVD3/IUMTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="93525441"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="93525441"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 05:35:35 -0700
X-CSE-ConnectionGUID: LWjIV0Z3TGmrpJ5ce4Oksw==
X-CSE-MsgGUID: AMiR076ZRD6O2EI+o3k6zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="272691889"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 12 Sep 2026 05:35:34 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5Mx1-000000002vP-2Q6e;
	Sat, 12 Sep 2026 12:35:25 +0000
Date: Sat, 12 Sep 2026 20:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [wens:mtk-wip 15/66] drivers/usb/core/hub.c:885:undefined
 reference to `pwrseq_enable'
Message-ID: <202609122013.TlPGSKEG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   ac7b6280e922fd6f4053c6350fd5cd77ca1c73ef
commit: 065d96c0ba6c953aaaafba5d69440f823ee9c470 [15/66] usb: hub: Power on connected M.2 E-key connectors with power sequencing API
config: i386-randconfig-013-20260912 (https://download.01.org/0day-ci/archive/20260912/202609122013.TlPGSKEG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609122013.TlPGSKEG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609122013.TlPGSKEG-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/usb/core/hub.o: in function `usb_hub_set_port_pwrseq':
>> drivers/usb/core/hub.c:885:(.text+0x128a): undefined reference to `pwrseq_enable'
>> ld: drivers/usb/core/hub.c:886:(.text+0x1291): undefined reference to `pwrseq_disable'
   ld: drivers/usb/core/hub.o: in function `usb_port_is_power_on':
>> drivers/usb/core/hub.c:3276:(.text+0x4b6b): undefined reference to `pwrseq_get_state'
   ld: drivers/usb/core/port.o: in function `usb_port_device_release':
>> drivers/usb/core/port.c:374:(.text+0x19b): undefined reference to `pwrseq_put'
   ld: drivers/usb/core/port.o: in function `usb_hub_port_pwrseq_get':
>> drivers/usb/core/port.c:798:(.text+0x1079): undefined reference to `pwrseq_get'
   ld: drivers/usb/core/port.o: in function `usb_hub_remove_port_device':
>> drivers/usb/core/port.c:940:(.text+0x1375): undefined reference to `pwrseq_disable'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB
   Depends on [m]: USB_SUPPORT [=y] && USB_ARCH_HAS_HCD [=y] && (POWER_SEQUENCING [=m] || POWER_SEQUENCING [=m]=n [=n])
   Selected by [y]:
   - TABLET_USB_KBTAB [=y] && INPUT [=y] && INPUT_TABLET [=y] && USB_ARCH_HAS_HCD [=y]
   - TOUCHSCREEN_USB_COMPOSITE [=y] && INPUT [=y] && INPUT_TOUCHSCREEN [=y] && USB_ARCH_HAS_HCD [=y]
   - USB_PULSE8_CEC [=y] && MEDIA_CEC_SUPPORT [=y] && USB_SUPPORT [=y] && TTY [=y]
   - USB_RAINSHADOW_CEC [=y] && MEDIA_CEC_SUPPORT [=y] && USB_SUPPORT [=y] && TTY [=y]
   Selected by [m]:
   - MOUSE_APPLETOUCH [=m] && INPUT [=y] && INPUT_MOUSE [=y] && USB_ARCH_HAS_HCD [=y]
   - MOUSE_SYNAPTICS_USB [=m] && INPUT [=y] && INPUT_MOUSE [=y] && USB_ARCH_HAS_HCD [=y]
   - TABLET_USB_AIPTEK [=m] && INPUT [=y] && INPUT_TABLET [=y] && USB_ARCH_HAS_HCD [=y]


vim +885 drivers/usb/core/hub.c

   878	
   879	static int usb_hub_set_port_pwrseq(struct usb_port *port, bool on)
   880	{
   881		if (!IS_ENABLED(CONFIG_POWER_SEQUENCING))
   882			return 0;
   883	
   884		if (on)
 > 885			return pwrseq_enable(port->pwrseq);
 > 886		return pwrseq_disable(port->pwrseq);
   887	}
   888	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
