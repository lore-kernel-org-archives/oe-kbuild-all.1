Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737B651DDEA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 18:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793647; cv=none; b=enttp1jfiIh2OZy++GPzS+MEAPqgrzXoBdbBaRBc4YwR9zaH2Z1/RtCnWe6MwujmmExxS4ONGsm7rzZiMWprYyaS34YJUG/0tg3aQTriH16adNlVVGIHIM67gJIkY9XXiaIUpakoNB83r/2zywPHxgFiIwiDldKZzkwv38Kq1vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793647; c=relaxed/simple;
	bh=Ch8wKW8224XMvvRi+d6TVK2uVjdMvs12DfuvsysOG1A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QAIOMMnBPei2F98WMbpHhvGAS88hbENr7hoAk8hjDV7nsNeGEIZ8im2oU/5E3pIWbDz2PNzPkiN5JSmonrBpA6hWZduMXSKcpGRM05gmZlu+CHlU6mGt3ouvrMFa/rd8q1VmjB10YdDqtcGeqO3NmKifnNLUdxqDTrOjPJ4cRFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7zovsJk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7zovsJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790793645; x=1822329645;
  h=date:from:to:cc:subject:message-id;
  bh=Ch8wKW8224XMvvRi+d6TVK2uVjdMvs12DfuvsysOG1A=;
  b=W7zovsJkmFnXFcy37Tepoi2LStaApgh2MGevVnRpYWrN4uP6Cvi6rGmu
   /anF4j4bGK1kAbpP+8g5BUFMFxVSMBYzGegysiZAYPdetS7ImHfzIFtr4
   F5AH6GMysr7YrgcUkRoxZ4fSBiK8VmHFmTbA9vCz06dpVD3JLtmoW/OqN
   8XNhUEfs8P0KAEIQm9BBhc2mllREMKjkivQABAxiu+WwDkyoDwWF7z+e6
   gwQjfqV5MMlx8MDIiU/KsX7mPxxEXyHVpIe0mb9cHkmCJMQ52p40rdIck
   d7oiRJc6/wo9Fdc5ipZbai4dx9/sydSl+9az4H5hC065ds0mXM5dbc471
   w==;
X-CSE-ConnectionGUID: dfKad5iTRo+b0SXGl4CeOw==
X-CSE-MsgGUID: HuK/nV+PTdqc4oc5kyPuEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90596716"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="90596716"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 11:40:45 -0700
X-CSE-ConnectionGUID: eqWj7VnuRqiaA/BwHeM1pw==
X-CSE-MsgGUID: /TjnHeIBR++TMZUARnThyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="275313650"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2026 11:40:44 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBzEP-000000001xm-3yvp;
	Wed, 30 Sep 2026 18:40:41 +0000
Date: Wed, 30 Sep 2026 20:40:01 +0200
From: kernel test robot <lkp@intel.com>
To: Cai Yu <caiyu7372@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/bluetooth/hci_intel.c:1089:36: warning:
 'intel_serdev_proto' defined but not used
Message-ID: <202609302039.XHhztFPs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Cai-Yu/Bluetooth-hci_intel-fix-tty-only-assumptions-in-the-LPM-paths/20260926-074040
head:   9b31b2873fd79cbca5e114a5347eea72fca2768a
commit: e80846cccd7389f5b80f67ee7f6308b6578801bf Bluetooth: hci_intel: add serdev support for the CcP controller
date:   5 days ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260930/202609302039.XHhztFPs-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609302039.XHhztFPs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609302039.XHhztFPs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/hci_intel.c:1089:36: warning: 'intel_serdev_proto' defined but not used [-Wunused-const-variable=]
    1089 | static const struct hci_uart_proto intel_serdev_proto = {
         |                                    ^~~~~~~~~~~~~~~~~~


vim +/intel_serdev_proto +1089 drivers/bluetooth/hci_intel.c

  1077	
  1078	/* Do not let the generic baudrate change in hci_serdev.c run for this path.
  1079	 *
  1080	 * It is executed before intel_setup() (and right after the controller has been
  1081	 * power cycled by the probe), but the controller is still in bootloader mode at
  1082	 * that point: it only answers at init_speed until the firmware has been
  1083	 * downloaded, and it needs a few seconds after the reset pulse before it
  1084	 * answers at all.  Switching the host to oper_speed while the controller is
  1085	 * silent leaves the two sides at different baudrates and the setup never
  1086	 * recovers.  intel_setup() changes the baudrate itself, once the bootloader is
  1087	 * talking.
  1088	 */
> 1089	static const struct hci_uart_proto intel_serdev_proto = {
  1090		.id		= HCI_UART_INTEL,
  1091		.name		= "Intel",
  1092		.manufacturer	= 2,
  1093		.init_speed	= 115200,
  1094		.oper_speed	= 0,
  1095		.open		= intel_open,
  1096		.close		= intel_close,
  1097		.flush		= intel_flush,
  1098		.setup		= intel_setup,
  1099		.set_baudrate	= intel_set_baudrate,
  1100		.recv		= intel_recv,
  1101		.enqueue	= intel_enqueue,
  1102		.dequeue	= intel_dequeue,
  1103	};
  1104	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
