Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB7F374E57
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533889; cv=none; b=K3OCnxujdpVyAfzac31diIN42Ijn/MPvC+9zmDWb9ldGmUvqQKyG25orILANnE1Bp8lVnLjQ6yU+PSymvN50Pkrfw9oCTGV+fk4ZZyZDXXU26clTg8jwpavK+seXT7CdGwRtSZ+TaOXYsEXypsNQnBNLZfMSBPUK9nGxW8VuM38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533889; c=relaxed/simple;
	bh=ap64z4abq24NliXDmr/eWvfIc33dJia8NwCMLEa14d8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oXn1HQcnp2RhlZK5Psoosw7tkjROXuj/MGvZI34HCHgouF9yz0t8ta59iyKdYwOaTORWNPXc0S9UgXddBkZXx0kImE5tq+F6TJvhH1Ss5Qy2RmvY9pRT8VaPxCJM57twnbaKNFux/Umob0GDC7Mv5VWfqn67mHn0+PAoefQRdPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARFhjX9o; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARFhjX9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533885; x=1807069885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ap64z4abq24NliXDmr/eWvfIc33dJia8NwCMLEa14d8=;
  b=ARFhjX9o6DUjoMv4doqPlZUAebWpbFZGMf/FcQYfdtmjmD+PaJFq+GoU
   76CU+2w0a0LzJRACXiDs4Z7dmAUFhM7stgcU4Z9OdXGqZnBYM9nVtWOMf
   rUTssvl0Dhewnc5I4oEo3ioIkU5yDMXdc7Zvc3pnel2is0WncBGtjY3DV
   +2TAJZJ5uP7sHka01chDYIy8RbvaD1iBzgDtIRUPiJIeiv0ky5QP6s6nn
   993C9O0JjU6uYYdBU9FthzPxiPpt9FgC5D3tLJmMRE+jeRRSC/3LCIY1R
   F75HQ/KznUazihWQaEKTe850GqXyskZb/upT0S861/W24Sih3vpsmkpPO
   g==;
X-CSE-ConnectionGUID: QaND6FKcRb+Bv15pkrijSQ==
X-CSE-MsgGUID: Dpd/7/TESfy6E0p21PxyGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76203947"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76203947"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:51:23 -0700
X-CSE-ConnectionGUID: PZLxtxOSTDK9YAFxZFadvA==
X-CSE-MsgGUID: 9yrUQ+pcTcmboxRDj8tTLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="251332688"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Apr 2026 20:51:21 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xTC-0000000002J-2O2t;
	Tue, 07 Apr 2026 03:51:18 +0000
Date: Tue, 07 Apr 2026 11:50:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-attr-device_attr 6/21]
 drivers/base/core.c:455:8: sparse: sparse: Initializer entry defined twice
Message-ID: <202604040412.GVa0jddK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-attr-device_attr
head:   9ea6d09f6e27145f7dfee08143bf35902ebe2615
commit: 501590c1d265467e1553ac02033959094742b837 [6/21] store_new show_new
config: nios2-randconfig-r133-20260404 (https://download.01.org/0day-ci/archive/20260404/202604040412.GVa0jddK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040412.GVa0jddK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040412.GVa0jddK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/test_firmware.c:276:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:276:8: sparse:   also defined here
   lib/test_firmware.c:333:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:333:8: sparse:   also defined here
   lib/test_firmware.c:459:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:459:8: sparse:   also defined here
   lib/test_firmware.c:485:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:485:8: sparse:   also defined here
   lib/test_firmware.c:515:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:515:8: sparse:   also defined here
   lib/test_firmware.c:532:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:532:8: sparse:   also defined here
   lib/test_firmware.c:562:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:562:8: sparse:   also defined here
   lib/test_firmware.c:592:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:592:8: sparse:   also defined here
   lib/test_firmware.c:609:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:609:8: sparse:   also defined here
   lib/test_firmware.c:631:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:631:8: sparse:   also defined here
   lib/test_firmware.c:647:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:647:8: sparse:   also defined here
   lib/test_firmware.c:663:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:663:8: sparse:   also defined here
   lib/test_firmware.c:699:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:699:8: sparse:   also defined here
   lib/test_firmware.c:810:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:810:8: sparse:   also defined here
   lib/test_firmware.c:856:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:856:8: sparse:   also defined here
   lib/test_firmware.c:992:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:992:8: sparse:   also defined here
   lib/test_firmware.c:1102:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:1102:8: sparse:   also defined here
   lib/test_firmware.c:1349:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:1349:8: sparse:   also defined here
   lib/test_firmware.c:1375:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:1375:8: sparse:   also defined here
   lib/test_firmware.c:1383:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:1383:8: sparse:   also defined here
   lib/test_firmware.c:1392:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:1392:8: sparse:   also defined here
   lib/test_firmware.c:1437:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:1437:8: sparse:   also defined here
   lib/test_firmware.c:1476:8: sparse: sparse: Initializer entry defined twice
   lib/test_firmware.c:1476:8: sparse:   also defined here
--
>> mm/backing-dev.c:287:1: sparse: sparse: Initializer entry defined twice
   mm/backing-dev.c:287:1: sparse:   also defined here
   mm/backing-dev.c:306:1: sparse: sparse: Initializer entry defined twice
   mm/backing-dev.c:306:1: sparse:   also defined here
   mm/backing-dev.c:325:1: sparse: sparse: Initializer entry defined twice
   mm/backing-dev.c:325:1: sparse:   also defined here
   mm/backing-dev.c:344:1: sparse: sparse: Initializer entry defined twice
   mm/backing-dev.c:344:1: sparse:   also defined here
   mm/backing-dev.c:363:1: sparse: sparse: Initializer entry defined twice
   mm/backing-dev.c:363:1: sparse:   also defined here
   mm/backing-dev.c:391:8: sparse: sparse: Initializer entry defined twice
   mm/backing-dev.c:391:8: sparse:   also defined here
   mm/backing-dev.c:419:8: sparse: sparse: Initializer entry defined twice
   mm/backing-dev.c:419:8: sparse:   also defined here
   mm/backing-dev.c:429:8: sparse: sparse: Initializer entry defined twice
   mm/backing-dev.c:429:8: sparse:   also defined here
   mm/backing-dev.c:457:8: sparse: sparse: Initializer entry defined twice
   mm/backing-dev.c:457:8: sparse:   also defined here
--
>> mm/dmapool.c:93:8: sparse: sparse: Initializer entry defined twice
   mm/dmapool.c:93:8: sparse:   also defined here
--
>> drivers/auxdisplay/line-display.c:253:8: sparse: sparse: Initializer entry defined twice
   drivers/auxdisplay/line-display.c:253:8: sparse:   also defined here
   drivers/auxdisplay/line-display.c:263:8: sparse: sparse: Initializer entry defined twice
   drivers/auxdisplay/line-display.c:263:8: sparse:   also defined here
   drivers/auxdisplay/line-display.c:295:8: sparse: sparse: Initializer entry defined twice
   drivers/auxdisplay/line-display.c:295:8: sparse:   also defined here
   drivers/auxdisplay/line-display.c:320:8: sparse: sparse: Initializer entry defined twice
   drivers/auxdisplay/line-display.c:320:8: sparse:   also defined here
   drivers/auxdisplay/line-display.c:323:8: sparse: sparse: Initializer entry defined twice
   drivers/auxdisplay/line-display.c:323:8: sparse:   also defined here
--
>> drivers/base/bus.c:526:8: sparse: sparse: Initializer entry defined twice
   drivers/base/bus.c:526:8: sparse:   also defined here
--
>> drivers/base/dd.c:494:8: sparse: sparse: Initializer entry defined twice
   drivers/base/dd.c:494:8: sparse:   also defined here
   drivers/base/dd.c:606:8: sparse: sparse: Initializer entry defined twice
   drivers/base/dd.c:606:8: sparse:   also defined here
--
>> drivers/base/core.c:455:8: sparse: sparse: Initializer entry defined twice
   drivers/base/core.c:455:8: sparse:   also defined here
   drivers/base/core.c:472:8: sparse: sparse: Initializer entry defined twice
   drivers/base/core.c:472:8: sparse:   also defined here
   drivers/base/core.c:481:8: sparse: sparse: Initializer entry defined twice
   drivers/base/core.c:481:8: sparse:   also defined here
   drivers/base/core.c:490:8: sparse: sparse: Initializer entry defined twice
   drivers/base/core.c:490:8: sparse:   also defined here
   drivers/base/core.c:1247:8: sparse: sparse: Initializer entry defined twice
   drivers/base/core.c:1247:8: sparse:   also defined here
   drivers/base/core.c:2787:8: sparse: sparse: Initializer entry defined twice
   drivers/base/core.c:2787:8: sparse:   also defined here
   drivers/base/core.c:2818:8: sparse: sparse: Initializer entry defined twice
   drivers/base/core.c:2818:8: sparse:   also defined here
   drivers/base/core.c:2837:8: sparse: sparse: Initializer entry defined twice
   drivers/base/core.c:2837:8: sparse:   also defined here
   drivers/base/core.c:2992:8: sparse: sparse: Initializer entry defined twice
   drivers/base/core.c:2992:8: sparse:   also defined here
--
>> drivers/base/platform.c:1299:8: sparse: sparse: Initializer entry defined twice
   drivers/base/platform.c:1299:8: sparse:   also defined here
   drivers/base/platform.c:1306:8: sparse: sparse: Initializer entry defined twice
   drivers/base/platform.c:1306:8: sparse:   also defined here
--
>> drivers/base/cpu.c:242:8: sparse: sparse: Initializer entry defined twice
   drivers/base/cpu.c:242:8: sparse:   also defined here
   drivers/base/cpu.c:275:8: sparse: sparse: Initializer entry defined twice
   drivers/base/cpu.c:275:8: sparse:   also defined here
   drivers/base/cpu.c:282:8: sparse: sparse: Initializer entry defined twice
   drivers/base/cpu.c:282:8: sparse:   also defined here
   drivers/base/cpu.c:301:8: sparse: sparse: Initializer entry defined twice
   drivers/base/cpu.c:301:8: sparse:   also defined here
   drivers/base/cpu.c:314:8: sparse: sparse: Initializer entry defined twice
   drivers/base/cpu.c:314:8: sparse:   also defined here
--
>> drivers/base/topology.c:62:8: sparse: sparse: Initializer entry defined twice
   drivers/base/topology.c:62:8: sparse:   also defined here
   drivers/base/topology.c:75:8: sparse: sparse: Initializer entry defined twice
   drivers/base/topology.c:75:8: sparse:   also defined here
   drivers/base/topology.c:78:8: sparse: sparse: Initializer entry defined twice
   drivers/base/topology.c:78:8: sparse:   also defined here
   drivers/base/topology.c:229:8: sparse: sparse: Initializer entry defined twice
   drivers/base/topology.c:229:8: sparse:   also defined here
--
>> drivers/base/cacheinfo.c:745:8: sparse: sparse: Initializer entry defined twice
   drivers/base/cacheinfo.c:745:8: sparse:   also defined here
   drivers/base/cacheinfo.c:746:8: sparse: sparse: Initializer entry defined twice
   drivers/base/cacheinfo.c:746:8: sparse:   also defined here
   drivers/base/cacheinfo.c:747:8: sparse: sparse: Initializer entry defined twice
   drivers/base/cacheinfo.c:747:8: sparse:   also defined here
   drivers/base/cacheinfo.c:748:8: sparse: sparse: Initializer entry defined twice
   drivers/base/cacheinfo.c:748:8: sparse:   also defined here
   drivers/base/cacheinfo.c:749:8: sparse: sparse: Initializer entry defined twice
   drivers/base/cacheinfo.c:749:8: sparse:   also defined here
   drivers/base/cacheinfo.c:750:8: sparse: sparse: Initializer entry defined twice
   drivers/base/cacheinfo.c:750:8: sparse:   also defined here
   drivers/base/cacheinfo.c:751:8: sparse: sparse: Initializer entry defined twice
   drivers/base/cacheinfo.c:751:8: sparse:   also defined here
   drivers/base/cacheinfo.c:752:8: sparse: sparse: Initializer entry defined twice
   drivers/base/cacheinfo.c:752:8: sparse:   also defined here
   drivers/base/cacheinfo.c:753:8: sparse: sparse: Initializer entry defined twice
   drivers/base/cacheinfo.c:753:8: sparse:   also defined here
   drivers/base/cacheinfo.c:754:8: sparse: sparse: Initializer entry defined twice
   drivers/base/cacheinfo.c:754:8: sparse:   also defined here
   drivers/base/cacheinfo.c:755:8: sparse: sparse: Initializer entry defined twice
   drivers/base/cacheinfo.c:755:8: sparse:   also defined here
   drivers/base/cacheinfo.c:756:8: sparse: sparse: Initializer entry defined twice
   drivers/base/cacheinfo.c:756:8: sparse:   also defined here
--
>> drivers/base/soc.c:36:8: sparse: sparse: Initializer entry defined twice
   drivers/base/soc.c:36:8: sparse:   also defined here
   drivers/base/soc.c:37:8: sparse: sparse: Initializer entry defined twice
   drivers/base/soc.c:37:8: sparse:   also defined here
   drivers/base/soc.c:38:8: sparse: sparse: Initializer entry defined twice
   drivers/base/soc.c:38:8: sparse:   also defined here
   drivers/base/soc.c:39:8: sparse: sparse: Initializer entry defined twice
   drivers/base/soc.c:39:8: sparse:   also defined here
   drivers/base/soc.c:40:8: sparse: sparse: Initializer entry defined twice
   drivers/base/soc.c:40:8: sparse:   also defined here
--
>> drivers/bcma/main.c:39:8: sparse: sparse: Initializer entry defined twice
   drivers/bcma/main.c:39:8: sparse:   also defined here
   drivers/bcma/main.c:46:8: sparse: sparse: Initializer entry defined twice
   drivers/bcma/main.c:46:8: sparse:   also defined here
   drivers/bcma/main.c:53:8: sparse: sparse: Initializer entry defined twice
   drivers/bcma/main.c:53:8: sparse:   also defined here
   drivers/bcma/main.c:60:8: sparse: sparse: Initializer entry defined twice
   drivers/bcma/main.c:60:8: sparse:   also defined here
--
>> drivers/char/ipmi/ipmi_msghandler.c:2795:8: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_msghandler.c:2795:8: sparse:   also defined here
   drivers/char/ipmi/ipmi_msghandler.c:2811:8: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_msghandler.c:2811:8: sparse:   also defined here
   drivers/char/ipmi/ipmi_msghandler.c:2826:8: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_msghandler.c:2826:8: sparse:   also defined here
   drivers/char/ipmi/ipmi_msghandler.c:2843:8: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_msghandler.c:2843:8: sparse:   also defined here
   drivers/char/ipmi/ipmi_msghandler.c:2861:8: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_msghandler.c:2861:8: sparse:   also defined here
   drivers/char/ipmi/ipmi_msghandler.c:2877:8: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_msghandler.c:2877:8: sparse:   also defined here
   drivers/char/ipmi/ipmi_msghandler.c:2894:8: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_msghandler.c:2894:8: sparse:   also defined here
   drivers/char/ipmi/ipmi_msghandler.c:2910:8: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_msghandler.c:2910:8: sparse:   also defined here
   drivers/char/ipmi/ipmi_msghandler.c:2930:8: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_msghandler.c:2930:8: sparse:   also defined here
   drivers/char/ipmi/ipmi_msghandler.c:2948:8: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_msghandler.c:2948:8: sparse:   also defined here
   drivers/char/ipmi/ipmi_msghandler.c:3564:8: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_msghandler.c:3564:8: sparse:   also defined here
   drivers/char/ipmi/ipmi_msghandler.c:3582:8: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_msghandler.c:3582:8: sparse:   also defined here
   drivers/char/ipmi/ipmi_msghandler.c:3595:8: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_msghandler.c:3595:8: sparse:   also defined here
--
>> drivers/char/ipmi/ipmi_si_intf.c:1651:8: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_si_intf.c:1651:8: sparse:   also defined here
   drivers/char/ipmi/ipmi_si_intf.c:1662:8: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_si_intf.c:1662:8: sparse:   also defined here
   drivers/char/ipmi/ipmi_si_intf.c:1664:1: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_si_intf.c:1664:1: sparse:   also defined here
   drivers/char/ipmi/ipmi_si_intf.c:1665:1: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_si_intf.c:1665:1: sparse:   also defined here
   drivers/char/ipmi/ipmi_si_intf.c:1666:1: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_si_intf.c:1666:1: sparse:   also defined here
   drivers/char/ipmi/ipmi_si_intf.c:1667:1: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_si_intf.c:1667:1: sparse:   also defined here
   drivers/char/ipmi/ipmi_si_intf.c:1668:1: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_si_intf.c:1668:1: sparse:   also defined here
   drivers/char/ipmi/ipmi_si_intf.c:1669:1: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_si_intf.c:1669:1: sparse:   also defined here
   drivers/char/ipmi/ipmi_si_intf.c:1670:1: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_si_intf.c:1670:1: sparse:   also defined here
   drivers/char/ipmi/ipmi_si_intf.c:1671:1: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_si_intf.c:1671:1: sparse:   also defined here
   drivers/char/ipmi/ipmi_si_intf.c:1672:1: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_si_intf.c:1672:1: sparse:   also defined here
   drivers/char/ipmi/ipmi_si_intf.c:1673:1: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_si_intf.c:1673:1: sparse:   also defined here
   drivers/char/ipmi/ipmi_si_intf.c:1674:1: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_si_intf.c:1674:1: sparse:   also defined here
   drivers/char/ipmi/ipmi_si_intf.c:1693:8: sparse: sparse: Initializer entry defined twice
   drivers/char/ipmi/ipmi_si_intf.c:1693:8: sparse:   also defined here
--
>> drivers/clk/clk-si5341.c:1482:8: sparse: sparse: Initializer entry defined twice
   drivers/clk/clk-si5341.c:1482:8: sparse:   also defined here
   drivers/clk/clk-si5341.c:1497:8: sparse: sparse: Initializer entry defined twice
   drivers/clk/clk-si5341.c:1497:8: sparse:   also defined here
   drivers/clk/clk-si5341.c:1512:8: sparse: sparse: Initializer entry defined twice
   drivers/clk/clk-si5341.c:1512:8: sparse:   also defined here
   drivers/clk/clk-si5341.c:1527:8: sparse: sparse: Initializer entry defined twice
   drivers/clk/clk-si5341.c:1527:8: sparse:   also defined here
   drivers/clk/clk-si5341.c:1546:8: sparse: sparse: Initializer entry defined twice
   drivers/clk/clk-si5341.c:1546:8: sparse:   also defined here
--
   drivers/dax/bus.c:19:1: sparse: sparse: symbol 'dax_region_rwsem' was not declared. Should it be static?
   drivers/dax/bus.c:25:1: sparse: sparse: symbol 'dax_dev_rwsem' was not declared. Should it be static?
>> drivers/dax/bus.c:271:8: sparse: sparse: Initializer entry defined twice
   drivers/dax/bus.c:271:8: sparse:   also defined here
   drivers/dax/bus.c:324:8: sparse: sparse: Initializer entry defined twice
   drivers/dax/bus.c:324:8: sparse:   also defined here
   drivers/dax/bus.c:345:8: sparse: sparse: Initializer entry defined twice
   drivers/dax/bus.c:345:8: sparse:   also defined here
   drivers/dax/bus.c:421:8: sparse: sparse: Initializer entry defined twice
   drivers/dax/bus.c:421:8: sparse:   also defined here
   drivers/dax/bus.c:585:8: sparse: sparse: Initializer entry defined twice
   drivers/dax/bus.c:585:8: sparse:   also defined here
   drivers/dax/bus.c:742:8: sparse: sparse: Initializer entry defined twice
   drivers/dax/bus.c:742:8: sparse:   also defined here
   drivers/dax/bus.c:758:8: sparse: sparse: Initializer entry defined twice
   drivers/dax/bus.c:758:8: sparse:   also defined here
   drivers/dax/bus.c:774:8: sparse: sparse: Initializer entry defined twice
   drivers/dax/bus.c:774:8: sparse:   also defined here
   drivers/dax/bus.c:1133:8: sparse: sparse: Initializer entry defined twice
   drivers/dax/bus.c:1133:8: sparse:   also defined here
   drivers/dax/bus.c:1199:8: sparse: sparse: Initializer entry defined twice
   drivers/dax/bus.c:1199:8: sparse:   also defined here
   drivers/dax/bus.c:1270:8: sparse: sparse: Initializer entry defined twice
   drivers/dax/bus.c:1270:8: sparse:   also defined here
   drivers/dax/bus.c:1286:8: sparse: sparse: Initializer entry defined twice
   drivers/dax/bus.c:1286:8: sparse:   also defined here
   drivers/dax/bus.c:1302:8: sparse: sparse: Initializer entry defined twice
   drivers/dax/bus.c:1302:8: sparse:   also defined here
   drivers/dax/bus.c:1313:8: sparse: sparse: Initializer entry defined twice
   drivers/dax/bus.c:1313:8: sparse:   also defined here
   drivers/dax/bus.c:1320:8: sparse: sparse: Initializer entry defined twice
   drivers/dax/bus.c:1320:8: sparse:   also defined here
   drivers/dax/bus.c:1362:8: sparse: sparse: Initializer entry defined twice
   drivers/dax/bus.c:1362:8: sparse:   also defined here
--
>> drivers/devfreq/devfreq.c:1410:8: sparse: sparse: Initializer entry defined twice
   drivers/devfreq/devfreq.c:1410:8: sparse:   also defined here
   drivers/devfreq/devfreq.c:1501:8: sparse: sparse: Initializer entry defined twice
   drivers/devfreq/devfreq.c:1501:8: sparse:   also defined here
   drivers/devfreq/devfreq.c:1547:8: sparse: sparse: Initializer entry defined twice
   drivers/devfreq/devfreq.c:1547:8: sparse:   also defined here
   drivers/devfreq/devfreq.c:1564:8: sparse: sparse: Initializer entry defined twice
   drivers/devfreq/devfreq.c:1564:8: sparse:   also defined here
   drivers/devfreq/devfreq.c:1573:8: sparse: sparse: Initializer entry defined twice
   drivers/devfreq/devfreq.c:1573:8: sparse:   also defined here
   drivers/devfreq/devfreq.c:1614:8: sparse: sparse: Initializer entry defined twice
   drivers/devfreq/devfreq.c:1614:8: sparse:   also defined here
   drivers/devfreq/devfreq.c:1668:8: sparse: sparse: Initializer entry defined twice
   drivers/devfreq/devfreq.c:1668:8: sparse:   also defined here
   drivers/devfreq/devfreq.c:1696:8: sparse: sparse: Initializer entry defined twice
   drivers/devfreq/devfreq.c:1696:8: sparse:   also defined here
   drivers/devfreq/devfreq.c:1796:8: sparse: sparse: Initializer entry defined twice
   drivers/devfreq/devfreq.c:1796:8: sparse:   also defined here
   drivers/devfreq/devfreq.c:1843:8: sparse: sparse: Initializer entry defined twice
   drivers/devfreq/devfreq.c:1843:8: sparse:   also defined here
   drivers/devfreq/devfreq.c:1906:8: sparse: sparse: Initializer entry defined twice
   drivers/devfreq/devfreq.c:1906:8: sparse:   also defined here
--
>> drivers/devfreq/devfreq-event.c:445:8: sparse: sparse: Initializer entry defined twice
   drivers/devfreq/devfreq-event.c:445:8: sparse:   also defined here
   drivers/devfreq/devfreq-event.c:457:8: sparse: sparse: Initializer entry defined twice
   drivers/devfreq/devfreq-event.c:457:8: sparse:   also defined here
--
>> drivers/fpga/fpga-mgr.c:655:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/fpga-mgr.c:655:8: sparse:   also defined here
   drivers/fpga/fpga-mgr.c:656:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/fpga-mgr.c:656:8: sparse:   also defined here
   drivers/fpga/fpga-mgr.c:657:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/fpga-mgr.c:657:8: sparse:   also defined here
--
>> drivers/fpga/fpga-bridge.c:311:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/fpga-bridge.c:311:8: sparse:   also defined here
   drivers/fpga/fpga-bridge.c:312:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/fpga-bridge.c:312:8: sparse:   also defined here
--
>> drivers/fpga/fpga-region.c:175:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/fpga-region.c:175:8: sparse:   also defined here
--
>> drivers/fpga/dfl.c:300:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/dfl.c:300:8: sparse:   also defined here
   drivers/fpga/dfl.c:309:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/dfl.c:309:8: sparse:   also defined here
--
>> drivers/fpga/dfl-afu-main.c:161:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/dfl-afu-main.c:161:8: sparse:   also defined here
   drivers/fpga/dfl-afu-main.c:202:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/dfl-afu-main.c:202:8: sparse:   also defined here
   drivers/fpga/dfl-afu-main.c:239:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/dfl-afu-main.c:239:8: sparse:   also defined here
   drivers/fpga/dfl-afu-main.c:277:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/dfl-afu-main.c:277:8: sparse:   also defined here
   drivers/fpga/dfl-afu-main.c:294:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/dfl-afu-main.c:294:8: sparse:   also defined here
   drivers/fpga/dfl-afu-main.c:315:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/dfl-afu-main.c:315:8: sparse:   also defined here
   drivers/fpga/dfl-afu-main.c:336:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/dfl-afu-main.c:336:8: sparse:   also defined here
   drivers/fpga/dfl-afu-main.c:354:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/dfl-afu-main.c:354:8: sparse:   also defined here
   drivers/fpga/dfl-afu-main.c:373:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/dfl-afu-main.c:373:8: sparse:   also defined here
   drivers/fpga/dfl-afu-main.c:480:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/dfl-afu-main.c:480:8: sparse:   also defined here
--
>> drivers/fpga/dfl-afu-error.c:143:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/dfl-afu-error.c:143:8: sparse:   also defined here
   drivers/fpga/dfl-afu-error.c:160:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/dfl-afu-error.c:160:8: sparse:   also defined here
   drivers/fpga/dfl-afu-error.c:180:8: sparse: sparse: Initializer entry defined twice
   drivers/fpga/dfl-afu-error.c:180:8: sparse:   also defined here
--
>> drivers/hsi/hsi_core.c:25:8: sparse: sparse: Initializer entry defined twice
   drivers/hsi/hsi_core.c:25:8: sparse:   also defined here
--
>> drivers/hwmon/hwmon.c:78:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/hwmon.c:78:8: sparse:   also defined here
   drivers/hwmon/hwmon.c:85:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/hwmon.c:85:8: sparse:   also defined here
   drivers/hwmon/hwmon.c:393:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/hwmon.c:393:8: sparse:   also defined here
--
>> drivers/hwmon/w83792d.c:1021:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/w83792d.c:1021:8: sparse:   also defined here
   drivers/hwmon/w83792d.c:1041:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/w83792d.c:1041:8: sparse:   also defined here
--
>> drivers/hwmon/w83781d.c:412:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/w83781d.c:412:8: sparse:   also defined here
   drivers/hwmon/w83781d.c:437:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/w83781d.c:437:8: sparse:   also defined here
   drivers/hwmon/w83781d.c:446:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/w83781d.c:446:8: sparse:   also defined here
   drivers/hwmon/w83781d.c:517:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/w83781d.c:517:8: sparse:   also defined here
   drivers/hwmon/w83781d.c:767:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/w83781d.c:767:8: sparse:   also defined here
--
>> drivers/hwmon/w83793.c:1157:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/w83793.c:1157:8: sparse:   also defined here
--
>> drivers/hwmon/adm1025.c:332:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1025.c:332:8: sparse:   also defined here
   drivers/hwmon/adm1025.c:357:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1025.c:357:8: sparse:   also defined here
   drivers/hwmon/adm1025.c:382:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1025.c:382:8: sparse:   also defined here
--
>> drivers/hwmon/adm1026.c:1007:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1007:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1009:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1009:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1011:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1011:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1075:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1075:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1087:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1087:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1114:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1114:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1123:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1123:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1201:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1201:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1234:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1234:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1269:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1269:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1384:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1384:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1385:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1385:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1386:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1386:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1387:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1387:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1388:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1388:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1390:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1390:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1392:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1392:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1393:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1393:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1395:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1395:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1398:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1398:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1399:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1399:8: sparse:   also defined here
   drivers/hwmon/adm1026.c:1401:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1026.c:1401:8: sparse:   also defined here
--
>> drivers/hwmon/adm1031.c:818:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1031.c:818:8: sparse:   also defined here
   drivers/hwmon/adm1031.c:894:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adm1031.c:894:8: sparse:   also defined here
--
>> drivers/hwmon/adt7470.c:1028:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adt7470.c:1028:8: sparse:   also defined here
   drivers/hwmon/adt7470.c:1029:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adt7470.c:1029:8: sparse:   also defined here
   drivers/hwmon/adt7470.c:1030:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/adt7470.c:1030:8: sparse:   also defined here
--
>> drivers/hwmon/emc1403.c:63:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/emc1403.c:63:8: sparse:   also defined here
--
>> drivers/hwmon/emc2103.c:494:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/emc2103.c:494:8: sparse:   also defined here
   drivers/hwmon/emc2103.c:495:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/emc2103.c:495:8: sparse:   also defined here
   drivers/hwmon/emc2103.c:496:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/emc2103.c:496:8: sparse:   also defined here
   drivers/hwmon/emc2103.c:497:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/emc2103.c:497:8: sparse:   also defined here
   drivers/hwmon/emc2103.c:499:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/emc2103.c:499:8: sparse:   also defined here
--
>> drivers/hwmon/g760a.c:156:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/g760a.c:156:8: sparse:   also defined here
   drivers/hwmon/g760a.c:157:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/g760a.c:157:8: sparse:   also defined here
   drivers/hwmon/g760a.c:158:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/g760a.c:158:8: sparse:   also defined here
--
>> drivers/hwmon/g762.c:1012:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/g762.c:1012:8: sparse:   also defined here
   drivers/hwmon/g762.c:1013:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/g762.c:1013:8: sparse:   also defined here
   drivers/hwmon/g762.c:1014:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/g762.c:1014:8: sparse:   also defined here
   drivers/hwmon/g762.c:1015:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/g762.c:1015:8: sparse:   also defined here
   drivers/hwmon/g762.c:1016:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/g762.c:1016:8: sparse:   also defined here
   drivers/hwmon/g762.c:1017:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/g762.c:1017:8: sparse:   also defined here
   drivers/hwmon/g762.c:1018:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/g762.c:1018:8: sparse:   also defined here
   drivers/hwmon/g762.c:1019:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/g762.c:1019:8: sparse:   also defined here
   drivers/hwmon/g762.c:1020:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/g762.c:1020:8: sparse:   also defined here
--
>> drivers/hwmon/gl518sm.c:419:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:419:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:420:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:420:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:421:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:421:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:423:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:423:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:430:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:430:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:431:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:431:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:432:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:432:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:433:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:433:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:434:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:434:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:435:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:435:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:436:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:436:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:437:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:437:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:438:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:438:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:439:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:439:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:440:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:440:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:441:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:441:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:442:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:442:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:443:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:443:8: sparse:   also defined here
   drivers/hwmon/gl518sm.c:445:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl518sm.c:445:8: sparse:   also defined here
--
>> drivers/hwmon/gl520sm.c:195:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl520sm.c:195:8: sparse:   also defined here
   drivers/hwmon/gl520sm.c:495:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl520sm.c:495:8: sparse:   also defined here
   drivers/hwmon/gl520sm.c:645:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl520sm.c:645:8: sparse:   also defined here
   drivers/hwmon/gl520sm.c:646:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl520sm.c:646:8: sparse:   also defined here
   drivers/hwmon/gl520sm.c:647:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/gl520sm.c:647:8: sparse:   also defined here
--
>> drivers/hwmon/ibmpex.c:259:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/ibmpex.c:259:8: sparse:   also defined here
--
>> drivers/hwmon/ina2xx.c:863:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/ina2xx.c:863:8: sparse:   also defined here
--
>> drivers/hwmon/lm78.c:288:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm78.c:288:8: sparse:   also defined here
   drivers/hwmon/lm78.c:289:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm78.c:289:8: sparse:   also defined here
   drivers/hwmon/lm78.c:290:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm78.c:290:8: sparse:   also defined here
   drivers/hwmon/lm78.c:425:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm78.c:425:8: sparse:   also defined here
   drivers/hwmon/lm78.c:434:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm78.c:434:8: sparse:   also defined here
--
>> drivers/hwmon/lm85.c:617:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm85.c:617:8: sparse:   also defined here
   drivers/hwmon/lm85.c:644:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm85.c:644:8: sparse:   also defined here
   drivers/hwmon/lm85.c:653:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm85.c:653:8: sparse:   also defined here
--
>> drivers/hwmon/lm87.c:464:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm87.c:464:8: sparse:   also defined here
   drivers/hwmon/lm87.c:465:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm87.c:465:8: sparse:   also defined here
   drivers/hwmon/lm87.c:466:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm87.c:466:8: sparse:   also defined here
   drivers/hwmon/lm87.c:596:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm87.c:596:8: sparse:   also defined here
   drivers/hwmon/lm87.c:604:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm87.c:604:8: sparse:   also defined here
   drivers/hwmon/lm87.c:629:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm87.c:629:8: sparse:   also defined here
   drivers/hwmon/lm87.c:656:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm87.c:656:8: sparse:   also defined here
--
   drivers/hwmon/lm93.c:595:27: sparse: sparse: cast to restricted __le16
   drivers/hwmon/lm93.c:615:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/hwmon/lm93.c:615:16: sparse:     expected unsigned short
   drivers/hwmon/lm93.c:615:16: sparse:     got restricted __le16 [usertype]
>> drivers/hwmon/lm93.c:2064:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm93.c:2064:8: sparse:   also defined here
   drivers/hwmon/lm93.c:2096:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm93.c:2096:8: sparse:   also defined here
   drivers/hwmon/lm93.c:2276:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm93.c:2276:8: sparse:   also defined here
   drivers/hwmon/lm93.c:2308:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm93.c:2308:8: sparse:   also defined here
   drivers/hwmon/lm93.c:2329:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm93.c:2329:8: sparse:   also defined here
   drivers/hwmon/lm93.c:2338:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/lm93.c:2338:8: sparse:   also defined here
--
>> drivers/hwmon/max197.c:232:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/max197.c:232:8: sparse:   also defined here
--
>> drivers/hwmon/max31760.c:485:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/max31760.c:485:8: sparse:   also defined here
--
>> drivers/hwmon/max31827.c:457:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/max31827.c:457:8: sparse:   also defined here
--
>> drivers/hwmon/sht4x.c:352:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/sht4x.c:352:8: sparse:   also defined here
   drivers/hwmon/sht4x.c:353:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/sht4x.c:353:8: sparse:   also defined here
   drivers/hwmon/sht4x.c:354:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/sht4x.c:354:8: sparse:   also defined here
--
>> drivers/hwmon/shtc1.c:159:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/shtc1.c:159:8: sparse:   also defined here
   drivers/hwmon/shtc1.c:160:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/shtc1.c:160:8: sparse:   also defined here
--
>> drivers/hwmon/smsc47m192.c:406:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/smsc47m192.c:406:8: sparse:   also defined here
   drivers/hwmon/smsc47m192.c:431:8: sparse: sparse: Initializer entry defined twice
   drivers/hwmon/smsc47m192.c:431:8: sparse:   also defined here
--
>> drivers/hwtracing/intel_th/core.c:216:8: sparse: sparse: Initializer entry defined twice
   drivers/hwtracing/intel_th/core.c:216:8: sparse:   also defined here
   drivers/hwtracing/intel_th/core.c:326:8: sparse: sparse: Initializer entry defined twice
   drivers/hwtracing/intel_th/core.c:326:8: sparse:   also defined here
--
>> drivers/hwtracing/intel_th/pti.c:77:8: sparse: sparse: Initializer entry defined twice
   drivers/hwtracing/intel_th/pti.c:77:8: sparse:   also defined here
   drivers/hwtracing/intel_th/pti.c:105:8: sparse: sparse: Initializer entry defined twice
   drivers/hwtracing/intel_th/pti.c:105:8: sparse:   also defined here
   drivers/hwtracing/intel_th/pti.c:136:8: sparse: sparse: Initializer entry defined twice
   drivers/hwtracing/intel_th/pti.c:136:8: sparse:   also defined here
   drivers/hwtracing/intel_th/pti.c:288:8: sparse: sparse: Initializer entry defined twice
   drivers/hwtracing/intel_th/pti.c:288:8: sparse:   also defined here
--
>> drivers/hwtracing/intel_th/msu.c:1842:8: sparse: sparse: Initializer entry defined twice
   drivers/hwtracing/intel_th/msu.c:1842:8: sparse:   also defined here
   drivers/hwtracing/intel_th/msu.c:1956:8: sparse: sparse: Initializer entry defined twice
   drivers/hwtracing/intel_th/msu.c:1956:8: sparse:   also defined here
   drivers/hwtracing/intel_th/msu.c:2054:8: sparse: sparse: Initializer entry defined twice
   drivers/hwtracing/intel_th/msu.c:2054:8: sparse:   also defined here
   drivers/hwtracing/intel_th/msu.c:2085:8: sparse: sparse: Initializer entry defined twice
   drivers/hwtracing/intel_th/msu.c:2085:8: sparse:   also defined here
   drivers/hwtracing/intel_th/msu.c:2109:8: sparse: sparse: Initializer entry defined twice
   drivers/hwtracing/intel_th/msu.c:2109:8: sparse:   also defined here
--
>> drivers/hwtracing/stm/core.c:48:8: sparse: sparse: Initializer entry defined twice
   drivers/hwtracing/stm/core.c:48:8: sparse:   also defined here
   drivers/hwtracing/stm/core.c:62:8: sparse: sparse: Initializer entry defined twice
   drivers/hwtracing/stm/core.c:62:8: sparse:   also defined here
   drivers/hwtracing/stm/core.c:76:8: sparse: sparse: Initializer entry defined twice
   drivers/hwtracing/stm/core.c:76:8: sparse:   also defined here
   drivers/hwtracing/stm/core.c:1192:8: sparse: sparse: Initializer entry defined twice
   drivers/hwtracing/stm/core.c:1192:8: sparse:   also defined here
--
>> drivers/i2c/i2c-core-base.c:671:8: sparse: sparse: Initializer entry defined twice
   drivers/i2c/i2c-core-base.c:671:8: sparse:   also defined here
   drivers/i2c/i2c-core-base.c:689:8: sparse: sparse: Initializer entry defined twice
   drivers/i2c/i2c-core-base.c:689:8: sparse:   also defined here
   drivers/i2c/i2c-core-base.c:1320:8: sparse: sparse: Initializer entry defined twice
   drivers/i2c/i2c-core-base.c:1320:8: sparse:   also defined here
   drivers/i2c/i2c-core-base.c:1375:8: sparse: sparse: Initializer entry defined twice
   drivers/i2c/i2c-core-base.c:1375:8: sparse:   also defined here
--
>> drivers/i2c/i2c-dev.c:107:8: sparse: sparse: Initializer entry defined twice
   drivers/i2c/i2c-dev.c:107:8: sparse:   also defined here
--
>> drivers/iio/industrialio-core.c:1443:8: sparse: sparse: Initializer entry defined twice
   drivers/iio/industrialio-core.c:1443:8: sparse:   also defined here
   drivers/iio/industrialio-core.c:1453:8: sparse: sparse: Initializer entry defined twice
   drivers/iio/industrialio-core.c:1453:8: sparse:   also defined here
   drivers/iio/industrialio-core.c:1544:8: sparse: sparse: Initializer entry defined twice
   drivers/iio/industrialio-core.c:1544:8: sparse:   also defined here
--
>> drivers/iio/industrialio-buffer.c:1453:8: sparse: sparse: Initializer entry defined twice
   drivers/iio/industrialio-buffer.c:1453:8: sparse:   also defined here
   drivers/iio/industrialio-buffer.c:1455:8: sparse: sparse: Initializer entry defined twice
   drivers/iio/industrialio-buffer.c:1455:8: sparse:   also defined here
   drivers/iio/industrialio-buffer.c:1456:8: sparse: sparse: Initializer entry defined twice
   drivers/iio/industrialio-buffer.c:1456:8: sparse:   also defined here
   drivers/iio/industrialio-buffer.c:1458:8: sparse: sparse: Initializer entry defined twice
   drivers/iio/industrialio-buffer.c:1458:8: sparse:   also defined here
   drivers/iio/industrialio-buffer.c:1459:8: sparse: sparse: Initializer entry defined twice
   drivers/iio/industrialio-buffer.c:1459:8: sparse:   also defined here
--
>> drivers/iio/industrialio-trigger.c:58:8: sparse: sparse: Initializer entry defined twice
   drivers/iio/industrialio-trigger.c:58:8: sparse:   also defined here
   drivers/iio/industrialio-trigger.c:495:8: sparse: sparse: Initializer entry defined twice
   drivers/iio/industrialio-trigger.c:495:8: sparse:   also defined here
--
>> drivers/char/hw_random/core.c:501:8: sparse: sparse: Initializer entry defined twice
   drivers/char/hw_random/core.c:501:8: sparse:   also defined here
   drivers/char/hw_random/core.c:502:8: sparse: sparse: Initializer entry defined twice
   drivers/char/hw_random/core.c:502:8: sparse:   also defined here
   drivers/char/hw_random/core.c:503:8: sparse: sparse: Initializer entry defined twice
   drivers/char/hw_random/core.c:503:8: sparse:   also defined here
   drivers/char/hw_random/core.c:504:8: sparse: sparse: Initializer entry defined twice
   drivers/char/hw_random/core.c:504:8: sparse:   also defined here
--
>> drivers/firmware/google/cbmem.c:65:8: sparse: sparse: Initializer entry defined twice
   drivers/firmware/google/cbmem.c:65:8: sparse:   also defined here
   drivers/firmware/google/cbmem.c:74:8: sparse: sparse: Initializer entry defined twice
   drivers/firmware/google/cbmem.c:74:8: sparse:   also defined here
--
>> drivers/char/tpm/tpm-sysfs.c:80:8: sparse: sparse: Initializer entry defined twice
   drivers/char/tpm/tpm-sysfs.c:80:8: sparse:   also defined here
   drivers/char/tpm/tpm-sysfs.c:115:8: sparse: sparse: Initializer entry defined twice
   drivers/char/tpm/tpm-sysfs.c:115:8: sparse:   also defined here
   drivers/char/tpm/tpm-sysfs.c:137:8: sparse: sparse: Initializer entry defined twice
   drivers/char/tpm/tpm-sysfs.c:137:8: sparse:   also defined here
   drivers/char/tpm/tpm-sysfs.c:159:8: sparse: sparse: Initializer entry defined twice
   drivers/char/tpm/tpm-sysfs.c:159:8: sparse:   also defined here
   drivers/char/tpm/tpm-sysfs.c:181:8: sparse: sparse: Initializer entry defined twice
   drivers/char/tpm/tpm-sysfs.c:181:8: sparse:   also defined here
   drivers/char/tpm/tpm-sysfs.c:203:8: sparse: sparse: Initializer entry defined twice
   drivers/char/tpm/tpm-sysfs.c:203:8: sparse:   also defined here
   drivers/char/tpm/tpm-sysfs.c:254:8: sparse: sparse: Initializer entry defined twice
   drivers/char/tpm/tpm-sysfs.c:254:8: sparse:   also defined here
   drivers/char/tpm/tpm-sysfs.c:268:8: sparse: sparse: Initializer entry defined twice
   drivers/char/tpm/tpm-sysfs.c:268:8: sparse:   also defined here
   drivers/char/tpm/tpm-sysfs.c:285:8: sparse: sparse: Initializer entry defined twice
   drivers/char/tpm/tpm-sysfs.c:285:8: sparse:   also defined here
   drivers/char/tpm/tpm-sysfs.c:300:8: sparse: sparse: Initializer entry defined twice
   drivers/char/tpm/tpm-sysfs.c:300:8: sparse:   also defined here
   drivers/char/tpm/tpm-sysfs.c:310:8: sparse: sparse: Initializer entry defined twice
   drivers/char/tpm/tpm-sysfs.c:310:8: sparse:   also defined here
--
>> drivers/input/serio/serio.c:413:8: sparse: sparse: Initializer entry defined twice
   drivers/input/serio/serio.c:413:8: sparse:   also defined here
   drivers/input/serio/serio.c:414:8: sparse: sparse: Initializer entry defined twice
   drivers/input/serio/serio.c:414:8: sparse:   also defined here
   drivers/input/serio/serio.c:415:8: sparse: sparse: Initializer entry defined twice
   drivers/input/serio/serio.c:415:8: sparse:   also defined here
   drivers/input/serio/serio.c:416:8: sparse: sparse: Initializer entry defined twice
   drivers/input/serio/serio.c:416:8: sparse:   also defined here
   drivers/input/serio/serio.c:431:8: sparse: sparse: Initializer entry defined twice
   drivers/input/serio/serio.c:431:8: sparse:   also defined here
   drivers/input/serio/serio.c:432:8: sparse: sparse: Initializer entry defined twice
   drivers/input/serio/serio.c:432:8: sparse:   also defined here
   drivers/input/serio/serio.c:433:8: sparse: sparse: Initializer entry defined twice
   drivers/input/serio/serio.c:433:8: sparse:   also defined here
   drivers/input/serio/serio.c:434:8: sparse: sparse: Initializer entry defined twice
   drivers/input/serio/serio.c:434:8: sparse:   also defined here
   drivers/input/serio/serio.c:435:8: sparse: sparse: Initializer entry defined twice
   drivers/input/serio/serio.c:435:8: sparse:   also defined here
--
>> drivers/ipack/ipack.c:174:8: sparse: sparse: Initializer entry defined twice
   drivers/ipack/ipack.c:174:8: sparse:   also defined here
   drivers/ipack/ipack.c:175:8: sparse: sparse: Initializer entry defined twice
   drivers/ipack/ipack.c:175:8: sparse:   also defined here
   drivers/ipack/ipack.c:176:8: sparse: sparse: Initializer entry defined twice
   drivers/ipack/ipack.c:176:8: sparse:   also defined here
   drivers/ipack/ipack.c:177:8: sparse: sparse: Initializer entry defined twice
   drivers/ipack/ipack.c:177:8: sparse:   also defined here
   drivers/ipack/ipack.c:178:8: sparse: sparse: Initializer entry defined twice
   drivers/ipack/ipack.c:178:8: sparse:   also defined here
--
>> drivers/mcb/mcb-core.c:113:8: sparse: sparse: Initializer entry defined twice
   drivers/mcb/mcb-core.c:113:8: sparse:   also defined here
   drivers/mcb/mcb-core.c:122:8: sparse: sparse: Initializer entry defined twice
   drivers/mcb/mcb-core.c:122:8: sparse:   also defined here
   drivers/mcb/mcb-core.c:131:8: sparse: sparse: Initializer entry defined twice
   drivers/mcb/mcb-core.c:131:8: sparse:   also defined here
   drivers/mcb/mcb-core.c:140:8: sparse: sparse: Initializer entry defined twice
   drivers/mcb/mcb-core.c:140:8: sparse:   also defined here
--
>> drivers/media/mc/mc-device.c:564:8: sparse: sparse: Initializer entry defined twice
   drivers/media/mc/mc-device.c:564:8: sparse:   also defined here
--
>> drivers/media/v4l2-core/v4l2-dev.c:53:8: sparse: sparse: Initializer entry defined twice
   drivers/media/v4l2-core/v4l2-dev.c:53:8: sparse:   also defined here
   drivers/media/v4l2-core/v4l2-dev.c:77:8: sparse: sparse: Initializer entry defined twice
   drivers/media/v4l2-core/v4l2-dev.c:77:8: sparse:   also defined here
   drivers/media/v4l2-core/v4l2-dev.c:86:8: sparse: sparse: Initializer entry defined twice
   drivers/media/v4l2-core/v4l2-dev.c:86:8: sparse:   also defined here
--
>> drivers/mfd/intel-m10-bmc-core.c:113:8: sparse: sparse: Initializer entry defined twice
   drivers/mfd/intel-m10-bmc-core.c:113:8: sparse:   also defined here
   drivers/mfd/intel-m10-bmc-core.c:128:8: sparse: sparse: Initializer entry defined twice
   drivers/mfd/intel-m10-bmc-core.c:128:8: sparse:   also defined here
   drivers/mfd/intel-m10-bmc-core.c:153:8: sparse: sparse: Initializer entry defined twice
   drivers/mfd/intel-m10-bmc-core.c:153:8: sparse:   also defined here
   drivers/mfd/intel-m10-bmc-core.c:168:8: sparse: sparse: Initializer entry defined twice
   drivers/mfd/intel-m10-bmc-core.c:168:8: sparse:   also defined here
--
>> drivers/misc/ics932s401.c:332:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/ics932s401.c:332:8: sparse:   also defined here
   drivers/misc/ics932s401.c:333:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/ics932s401.c:333:8: sparse:   also defined here
   drivers/misc/ics932s401.c:334:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/ics932s401.c:334:8: sparse:   also defined here
   drivers/misc/ics932s401.c:335:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/ics932s401.c:335:8: sparse:   also defined here
   drivers/misc/ics932s401.c:336:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/ics932s401.c:336:8: sparse:   also defined here
   drivers/misc/ics932s401.c:337:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/ics932s401.c:337:8: sparse:   also defined here
   drivers/misc/ics932s401.c:338:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/ics932s401.c:338:8: sparse:   also defined here
   drivers/misc/ics932s401.c:339:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/ics932s401.c:339:8: sparse:   also defined here
   drivers/misc/ics932s401.c:340:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/ics932s401.c:340:8: sparse:   also defined here
   drivers/misc/ics932s401.c:341:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/ics932s401.c:341:8: sparse:   also defined here
   drivers/misc/ics932s401.c:342:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/ics932s401.c:342:8: sparse:   also defined here
--
>> drivers/misc/bh1770glc.c:1098:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1098:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1100:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1100:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1103:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1103:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1106:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1106:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1107:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1107:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1108:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1108:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1111:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1111:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1114:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1114:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1117:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1117:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1119:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1119:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1121:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1121:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1124:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1124:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1125:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1125:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1126:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1126:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1128:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1128:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1129:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1129:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1132:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1132:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1135:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1135:8: sparse:   also defined here
   drivers/misc/bh1770glc.c:1136:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/bh1770glc.c:1136:8: sparse:   also defined here
--
>> drivers/misc/enclosure.c:432:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/enclosure.c:432:8: sparse:   also defined here
   drivers/misc/enclosure.c:444:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/enclosure.c:444:8: sparse:   also defined here
   drivers/misc/enclosure.c:644:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/enclosure.c:644:8: sparse:   also defined here
   drivers/misc/enclosure.c:646:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/enclosure.c:646:8: sparse:   also defined here
   drivers/misc/enclosure.c:648:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/enclosure.c:648:8: sparse:   also defined here
   drivers/misc/enclosure.c:650:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/enclosure.c:650:8: sparse:   also defined here
   drivers/misc/enclosure.c:652:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/enclosure.c:652:8: sparse:   also defined here
   drivers/misc/enclosure.c:654:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/enclosure.c:654:8: sparse:   also defined here
   drivers/misc/enclosure.c:655:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/enclosure.c:655:8: sparse:   also defined here
--
>> drivers/misc/apds9802als.c:178:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/apds9802als.c:178:8: sparse:   also defined here
   drivers/misc/apds9802als.c:180:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/apds9802als.c:180:8: sparse:   also defined here
--
>> drivers/misc/isl29020.c:127:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/isl29020.c:127:8: sparse:   also defined here
   drivers/misc/isl29020.c:129:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/isl29020.c:129:8: sparse:   also defined here
--
>> drivers/most/core.c:349:8: sparse: sparse: Initializer entry defined twice
   drivers/most/core.c:349:8: sparse:   also defined here
   drivers/most/core.c:350:8: sparse: sparse: Initializer entry defined twice
   drivers/most/core.c:350:8: sparse:   also defined here
   drivers/most/core.c:351:8: sparse: sparse: Initializer entry defined twice
   drivers/most/core.c:351:8: sparse:   also defined here
   drivers/most/core.c:352:8: sparse: sparse: Initializer entry defined twice
   drivers/most/core.c:352:8: sparse:   also defined here
   drivers/most/core.c:353:8: sparse: sparse: Initializer entry defined twice
   drivers/most/core.c:353:8: sparse:   also defined here
   drivers/most/core.c:354:8: sparse: sparse: Initializer entry defined twice
   drivers/most/core.c:354:8: sparse:   also defined here
   drivers/most/core.c:355:8: sparse: sparse: Initializer entry defined twice
   drivers/most/core.c:355:8: sparse:   also defined here
   drivers/most/core.c:356:8: sparse: sparse: Initializer entry defined twice
   drivers/most/core.c:356:8: sparse:   also defined here
   drivers/most/core.c:357:8: sparse: sparse: Initializer entry defined twice
   drivers/most/core.c:357:8: sparse:   also defined here
   drivers/most/core.c:358:8: sparse: sparse: Initializer entry defined twice
   drivers/most/core.c:358:8: sparse:   also defined here
   drivers/most/core.c:359:8: sparse: sparse: Initializer entry defined twice
   drivers/most/core.c:359:8: sparse:   also defined here
   drivers/most/core.c:360:8: sparse: sparse: Initializer entry defined twice
   drivers/most/core.c:360:8: sparse:   also defined here
   drivers/most/core.c:361:8: sparse: sparse: Initializer entry defined twice
   drivers/most/core.c:361:8: sparse:   also defined here
   drivers/most/core.c:362:8: sparse: sparse: Initializer entry defined twice
   drivers/most/core.c:362:8: sparse:   also defined here
   drivers/most/core.c:430:8: sparse: sparse: Initializer entry defined twice
   drivers/most/core.c:430:8: sparse:   also defined here
   drivers/most/core.c:431:8: sparse: sparse: Initializer entry defined twice
   drivers/most/core.c:431:8: sparse:   also defined here
--
>> drivers/pcmcia/socket_sysfs.c:45:8: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/socket_sysfs.c:45:8: sparse:   also defined here
   drivers/pcmcia/socket_sysfs.c:59:8: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/socket_sysfs.c:59:8: sparse:   also defined here
   drivers/pcmcia/socket_sysfs.c:69:8: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/socket_sysfs.c:69:8: sparse:   also defined here
   drivers/pcmcia/socket_sysfs.c:79:8: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/socket_sysfs.c:79:8: sparse:   also defined here
   drivers/pcmcia/socket_sysfs.c:94:8: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/socket_sysfs.c:94:8: sparse:   also defined here
   drivers/pcmcia/socket_sysfs.c:126:8: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/socket_sysfs.c:126:8: sparse:   also defined here
   drivers/pcmcia/socket_sysfs.c:141:8: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/socket_sysfs.c:141:8: sparse:   also defined here
   drivers/pcmcia/socket_sysfs.c:174:8: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/socket_sysfs.c:174:8: sparse:   also defined here
   drivers/pcmcia/socket_sysfs.c:202:8: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/socket_sysfs.c:202:8: sparse:   also defined here
--
>> drivers/pcmcia/ds.c:1017:1: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/ds.c:1017:1: sparse:   also defined here
   drivers/pcmcia/ds.c:1018:1: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/ds.c:1018:1: sparse:   also defined here
   drivers/pcmcia/ds.c:1019:1: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/ds.c:1019:1: sparse:   also defined here
   drivers/pcmcia/ds.c:1020:1: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/ds.c:1020:1: sparse:   also defined here
   drivers/pcmcia/ds.c:1021:1: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/ds.c:1021:1: sparse:   also defined here
   drivers/pcmcia/ds.c:1022:1: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/ds.c:1022:1: sparse:   also defined here
   drivers/pcmcia/ds.c:1023:1: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/ds.c:1023:1: sparse:   also defined here
   drivers/pcmcia/ds.c:1031:8: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/ds.c:1031:8: sparse:   also defined here
   drivers/pcmcia/ds.c:1044:8: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/ds.c:1044:8: sparse:   also defined here
   drivers/pcmcia/ds.c:1072:8: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/ds.c:1072:8: sparse:   also defined here
   drivers/pcmcia/ds.c:1094:8: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/ds.c:1094:8: sparse:   also defined here
   drivers/pcmcia/ds.c:1111:8: sparse: sparse: Initializer entry defined twice
   drivers/pcmcia/ds.c:1111:8: sparse:   also defined here
--
>> drivers/power/supply/wm8350_power.c:182:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/wm8350_power.c:182:8: sparse:   also defined here
--
>> drivers/power/supply/ds2781_battery.c:715:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/ds2781_battery.c:715:8: sparse:   also defined here
   drivers/power/supply/ds2781_battery.c:717:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/ds2781_battery.c:717:8: sparse:   also defined here
   drivers/power/supply/ds2781_battery.c:719:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/ds2781_battery.c:719:8: sparse:   also defined here
   drivers/power/supply/ds2781_battery.c:721:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/ds2781_battery.c:721:8: sparse:   also defined here
--
>> drivers/power/supply/lp8788-charger.c:641:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/lp8788-charger.c:641:8: sparse:   also defined here
   drivers/power/supply/lp8788-charger.c:642:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/lp8788-charger.c:642:8: sparse:   also defined here
   drivers/power/supply/lp8788-charger.c:643:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/lp8788-charger.c:643:8: sparse:   also defined here
--
>> drivers/power/supply/ltc4162-l-charger.c:795:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/ltc4162-l-charger.c:795:8: sparse:   also defined here
   drivers/power/supply/ltc4162-l-charger.c:812:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/ltc4162-l-charger.c:812:8: sparse:   also defined here
   drivers/power/supply/ltc4162-l-charger.c:829:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/ltc4162-l-charger.c:829:8: sparse:   also defined here
   drivers/power/supply/ltc4162-l-charger.c:845:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/ltc4162-l-charger.c:845:8: sparse:   also defined here
   drivers/power/supply/ltc4162-l-charger.c:886:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/ltc4162-l-charger.c:886:8: sparse:   also defined here
   drivers/power/supply/ltc4162-l-charger.c:926:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/ltc4162-l-charger.c:926:8: sparse:   also defined here
--
>> drivers/power/supply/max14577_charger.c:556:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/max14577_charger.c:556:8: sparse:   also defined here
--
>> drivers/power/supply/max77693_charger.c:486:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/max77693_charger.c:486:8: sparse:   also defined here
   drivers/power/supply/max77693_charger.c:487:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/max77693_charger.c:487:8: sparse:   also defined here
   drivers/power/supply/max77693_charger.c:488:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/max77693_charger.c:488:8: sparse:   also defined here
--
>> drivers/power/supply/mp2629_charger.c:546:8: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/mp2629_charger.c:546:8: sparse:   also defined here
--
>> drivers/pwm/core.c:1304:8: sparse: sparse: Initializer entry defined twice
   drivers/pwm/core.c:1304:8: sparse:   also defined here
   drivers/pwm/core.c:1305:8: sparse: sparse: Initializer entry defined twice
   drivers/pwm/core.c:1305:8: sparse:   also defined here
   drivers/pwm/core.c:1306:8: sparse: sparse: Initializer entry defined twice
   drivers/pwm/core.c:1306:8: sparse:   also defined here
   drivers/pwm/core.c:1307:8: sparse: sparse: Initializer entry defined twice
   drivers/pwm/core.c:1307:8: sparse:   also defined here
   drivers/pwm/core.c:1308:8: sparse: sparse: Initializer entry defined twice
   drivers/pwm/core.c:1308:8: sparse:   also defined here
   drivers/pwm/core.c:1422:8: sparse: sparse: Initializer entry defined twice
   drivers/pwm/core.c:1422:8: sparse:   also defined here
   drivers/pwm/core.c:1443:8: sparse: sparse: Initializer entry defined twice
   drivers/pwm/core.c:1443:8: sparse:   also defined here
   drivers/pwm/core.c:1452:8: sparse: sparse: Initializer entry defined twice
   drivers/pwm/core.c:1452:8: sparse:   also defined here
--
>> drivers/remoteproc/remoteproc_sysfs.c:66:8: sparse: sparse: Initializer entry defined twice
   drivers/remoteproc/remoteproc_sysfs.c:66:8: sparse:   also defined here
   drivers/remoteproc/remoteproc_sysfs.c:128:8: sparse: sparse: Initializer entry defined twice
   drivers/remoteproc/remoteproc_sysfs.c:128:8: sparse:   also defined here
   drivers/remoteproc/remoteproc_sysfs.c:160:8: sparse: sparse: Initializer entry defined twice
   drivers/remoteproc/remoteproc_sysfs.c:160:8: sparse:   also defined here
   drivers/remoteproc/remoteproc_sysfs.c:210:8: sparse: sparse: Initializer entry defined twice
   drivers/remoteproc/remoteproc_sysfs.c:210:8: sparse:   also defined here
   drivers/remoteproc/remoteproc_sysfs.c:220:8: sparse: sparse: Initializer entry defined twice
   drivers/remoteproc/remoteproc_sysfs.c:220:8: sparse:   also defined here
--
>> drivers/misc/c2port/core.c:310:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/c2port/core.c:310:8: sparse:   also defined here
   drivers/misc/c2port/core.c:320:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/c2port/core.c:320:8: sparse:   also defined here
   drivers/misc/c2port/core.c:330:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/c2port/core.c:330:8: sparse:   also defined here
   drivers/misc/c2port/core.c:340:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/c2port/core.c:340:8: sparse:   also defined here
   drivers/misc/c2port/core.c:377:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/c2port/core.c:377:8: sparse:   also defined here
   drivers/misc/c2port/core.c:398:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/c2port/core.c:398:8: sparse:   also defined here
   drivers/misc/c2port/core.c:435:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/c2port/core.c:435:8: sparse:   also defined here
   drivers/misc/c2port/core.c:472:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/c2port/core.c:472:8: sparse:   also defined here
   drivers/misc/c2port/core.c:542:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/c2port/core.c:542:8: sparse:   also defined here
   drivers/misc/c2port/core.c:624:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/c2port/core.c:624:8: sparse:   also defined here
--
>> drivers/i2c/muxes/i2c-demux-pinctrl.c:176:8: sparse: sparse: Initializer entry defined twice
   drivers/i2c/muxes/i2c-demux-pinctrl.c:176:8: sparse:   also defined here
   drivers/i2c/muxes/i2c-demux-pinctrl.c:206:8: sparse: sparse: Initializer entry defined twice
   drivers/i2c/muxes/i2c-demux-pinctrl.c:206:8: sparse:   also defined here
--
>> drivers/i2c/muxes/i2c-mux-pca954x.c:403:8: sparse: sparse: Initializer entry defined twice
   drivers/i2c/muxes/i2c-mux-pca954x.c:403:8: sparse:   also defined here
--
>> drivers/rpmsg/rpmsg_core.c:356:1: sparse: sparse: Initializer entry defined twice
   drivers/rpmsg/rpmsg_core.c:356:1: sparse:   also defined here
   drivers/rpmsg/rpmsg_core.c:357:1: sparse: sparse: Initializer entry defined twice
   drivers/rpmsg/rpmsg_core.c:357:1: sparse:   also defined here
   drivers/rpmsg/rpmsg_core.c:358:1: sparse: sparse: Initializer entry defined twice
   drivers/rpmsg/rpmsg_core.c:358:1: sparse:   also defined here
   drivers/rpmsg/rpmsg_core.c:359:1: sparse: sparse: Initializer entry defined twice
   drivers/rpmsg/rpmsg_core.c:359:1: sparse:   also defined here
   drivers/rpmsg/rpmsg_core.c:386:8: sparse: sparse: Initializer entry defined twice
   drivers/rpmsg/rpmsg_core.c:386:8: sparse:   also defined here
   drivers/rpmsg/rpmsg_core.c:400:8: sparse: sparse: Initializer entry defined twice
   drivers/rpmsg/rpmsg_core.c:400:8: sparse:   also defined here
--
   drivers/rpmsg/qcom_glink_native.c:419:9: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int version @@     got restricted __le16 [assigned] [usertype] param1 @@
   drivers/rpmsg/qcom_glink_native.c:419:9: sparse:     expected unsigned int version
   drivers/rpmsg/qcom_glink_native.c:419:9: sparse:     got restricted __le16 [assigned] [usertype] param1
   drivers/rpmsg/qcom_glink_native.c:419:9: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int features @@     got restricted __le32 [assigned] [usertype] param2 @@
   drivers/rpmsg/qcom_glink_native.c:419:9: sparse:     expected unsigned int features
   drivers/rpmsg/qcom_glink_native.c:419:9: sparse:     got restricted __le32 [assigned] [usertype] param2
   drivers/rpmsg/qcom_glink_native.c:738:9: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected unsigned int [usertype] count @@     got restricted __le32 [assigned] [usertype] count @@
   drivers/rpmsg/qcom_glink_native.c:738:9: sparse:     expected unsigned int [usertype] count
   drivers/rpmsg/qcom_glink_native.c:738:9: sparse:     got restricted __le32 [assigned] [usertype] count
   drivers/rpmsg/qcom_glink_native.c:738:9: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [assigned] [usertype] size @@
   drivers/rpmsg/qcom_glink_native.c:738:9: sparse:     expected unsigned int [usertype] size
   drivers/rpmsg/qcom_glink_native.c:738:9: sparse:     got restricted __le32 [assigned] [usertype] size
   drivers/rpmsg/qcom_glink_native.c:738:9: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected unsigned int [usertype] liid @@     got restricted __le32 [assigned] [usertype] liid @@
   drivers/rpmsg/qcom_glink_native.c:738:9: sparse:     expected unsigned int [usertype] liid
   drivers/rpmsg/qcom_glink_native.c:738:9: sparse:     got restricted __le32 [assigned] [usertype] liid
   drivers/rpmsg/qcom_glink_native.c:934:9: sparse: sparse: restricted __le16 degrades to integer
   drivers/rpmsg/qcom_glink_native.c:1067:9: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 @@
   drivers/rpmsg/qcom_glink_native.c:1067:9: sparse:     expected unsigned int [usertype] size
   drivers/rpmsg/qcom_glink_native.c:1067:9: sparse:     got restricted __le32
   drivers/rpmsg/qcom_glink_native.c:1067:9: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected unsigned int [usertype] liid @@     got restricted __le32 @@
   drivers/rpmsg/qcom_glink_native.c:1067:9: sparse:     expected unsigned int [usertype] liid
   drivers/rpmsg/qcom_glink_native.c:1067:9: sparse:     got restricted __le32
>> drivers/rpmsg/qcom_glink_native.c:1847:8: sparse: sparse: Initializer entry defined twice
   drivers/rpmsg/qcom_glink_native.c:1847:8: sparse:   also defined here
--
>> drivers/siox/siox-core.c:392:8: sparse: sparse: Initializer entry defined twice
   drivers/siox/siox-core.c:392:8: sparse:   also defined here
   drivers/siox/siox-core.c:402:8: sparse: sparse: Initializer entry defined twice
   drivers/siox/siox-core.c:402:8: sparse:   also defined here
   drivers/siox/siox-core.c:412:8: sparse: sparse: Initializer entry defined twice
   drivers/siox/siox-core.c:412:8: sparse:   also defined here
   drivers/siox/siox-core.c:429:8: sparse: sparse: Initializer entry defined twice
   drivers/siox/siox-core.c:429:8: sparse:   also defined here
   drivers/siox/siox-core.c:446:8: sparse: sparse: Initializer entry defined twice
   drivers/siox/siox-core.c:446:8: sparse:   also defined here
   drivers/siox/siox-core.c:463:8: sparse: sparse: Initializer entry defined twice
   drivers/siox/siox-core.c:463:8: sparse:   also defined here
   drivers/siox/siox-core.c:480:8: sparse: sparse: Initializer entry defined twice
   drivers/siox/siox-core.c:480:8: sparse:   also defined here
   drivers/siox/siox-core.c:585:8: sparse: sparse: Initializer entry defined twice
   drivers/siox/siox-core.c:585:8: sparse:   also defined here
   drivers/siox/siox-core.c:614:8: sparse: sparse: Initializer entry defined twice
   drivers/siox/siox-core.c:614:8: sparse:   also defined here
   drivers/siox/siox-core.c:630:8: sparse: sparse: Initializer entry defined twice
   drivers/siox/siox-core.c:630:8: sparse:   also defined here
   drivers/siox/siox-core.c:661:8: sparse: sparse: Initializer entry defined twice
   drivers/siox/siox-core.c:661:8: sparse:   also defined here
--
>> drivers/ssb/main.c:365:1: sparse: sparse: Initializer entry defined twice
   drivers/ssb/main.c:365:1: sparse:   also defined here
   drivers/ssb/main.c:366:1: sparse: sparse: Initializer entry defined twice
   drivers/ssb/main.c:366:1: sparse:   also defined here
   drivers/ssb/main.c:367:1: sparse: sparse: Initializer entry defined twice
   drivers/ssb/main.c:367:1: sparse:   also defined here
   drivers/ssb/main.c:368:1: sparse: sparse: Initializer entry defined twice
   drivers/ssb/main.c:368:1: sparse:   also defined here
   drivers/ssb/main.c:369:1: sparse: sparse: Initializer entry defined twice
   drivers/ssb/main.c:369:1: sparse:   also defined here
   drivers/ssb/main.c:376:8: sparse: sparse: Initializer entry defined twice
   drivers/ssb/main.c:376:8: sparse:   also defined here
--
>> drivers/ssb/pcmcia.c:759:8: sparse: sparse: Initializer entry defined twice
   drivers/ssb/pcmcia.c:759:8: sparse:   also defined here
--
>> drivers/thermal/thermal_sysfs.c:318:1: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:318:1: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:319:1: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:319:1: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:320:1: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:320:1: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:321:1: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:321:1: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:322:1: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:322:1: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:323:1: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:323:1: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:324:1: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:324:1: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:332:8: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:332:8: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:333:8: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:333:8: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:334:8: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:334:8: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:335:8: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:335:8: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:336:8: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:336:8: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:339:8: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:339:8: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:563:8: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:563:8: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:564:8: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:564:8: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:757:8: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:757:8: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:758:8: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:758:8: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:759:8: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:759:8: sparse:   also defined here
   drivers/thermal/thermal_sysfs.c:760:8: sparse: sparse: Initializer entry defined twice
   drivers/thermal/thermal_sysfs.c:760:8: sparse:   also defined here
--
>> drivers/misc/pvpanic/pvpanic.c:139:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/pvpanic/pvpanic.c:139:8: sparse:   also defined here
   drivers/misc/pvpanic/pvpanic.c:167:8: sparse: sparse: Initializer entry defined twice
   drivers/misc/pvpanic/pvpanic.c:167:8: sparse:   also defined here
--
>> drivers/video/backlight/lcd.c:111:8: sparse: sparse: Initializer entry defined twice
   drivers/video/backlight/lcd.c:111:8: sparse:   also defined here
   drivers/video/backlight/lcd.c:150:8: sparse: sparse: Initializer entry defined twice
   drivers/video/backlight/lcd.c:150:8: sparse:   also defined here
   drivers/video/backlight/lcd.c:159:8: sparse: sparse: Initializer entry defined twice
   drivers/video/backlight/lcd.c:159:8: sparse:   also defined here
--
>> drivers/virtio/virtio.c:20:8: sparse: sparse: Initializer entry defined twice
   drivers/virtio/virtio.c:20:8: sparse:   also defined here
   drivers/virtio/virtio.c:28:8: sparse: sparse: Initializer entry defined twice
   drivers/virtio/virtio.c:28:8: sparse:   also defined here
   drivers/virtio/virtio.c:36:8: sparse: sparse: Initializer entry defined twice
   drivers/virtio/virtio.c:36:8: sparse:   also defined here
   drivers/virtio/virtio.c:45:8: sparse: sparse: Initializer entry defined twice
   drivers/virtio/virtio.c:45:8: sparse:   also defined here
   drivers/virtio/virtio.c:62:8: sparse: sparse: Initializer entry defined twice
   drivers/virtio/virtio.c:62:8: sparse:   also defined here
--
   drivers/w1/w1.c:418:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] rn64_le @@     got restricted __le64 [usertype] @@
   drivers/w1/w1.c:418:17: sparse:     expected unsigned long long [usertype] rn64_le
   drivers/w1/w1.c:418:17: sparse:     got restricted __le64 [usertype]
   drivers/w1/w1.c:907:21: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] rn_le @@     got restricted __le64 [usertype] @@
   drivers/w1/w1.c:907:21: sparse:     expected unsigned long long [usertype] rn_le
   drivers/w1/w1.c:907:21: sparse:     got restricted __le64 [usertype]
>> drivers/w1/w1.c:91:8: sparse: sparse: Initializer entry defined twice
   drivers/w1/w1.c:91:8: sparse:   also defined here
   drivers/w1/w1.c:102:8: sparse: sparse: Initializer entry defined twice
   drivers/w1/w1.c:102:8: sparse:   also defined here
--
   drivers/w1/slaves/w1_therm.c:1063:18: sparse: sparse: cast to restricted __le64
>> drivers/w1/slaves/w1_therm.c:348:8: sparse: sparse: Initializer entry defined twice
   drivers/w1/slaves/w1_therm.c:348:8: sparse:   also defined here
   drivers/w1/slaves/w1_therm.c:349:8: sparse: sparse: Initializer entry defined twice
   drivers/w1/slaves/w1_therm.c:349:8: sparse:   also defined here
   drivers/w1/slaves/w1_therm.c:350:8: sparse: sparse: Initializer entry defined twice
   drivers/w1/slaves/w1_therm.c:350:8: sparse:   also defined here
   drivers/w1/slaves/w1_therm.c:351:8: sparse: sparse: Initializer entry defined twice
   drivers/w1/slaves/w1_therm.c:351:8: sparse:   also defined here
   drivers/w1/slaves/w1_therm.c:352:8: sparse: sparse: Initializer entry defined twice
   drivers/w1/slaves/w1_therm.c:352:8: sparse:   also defined here
   drivers/w1/slaves/w1_therm.c:353:8: sparse: sparse: Initializer entry defined twice
   drivers/w1/slaves/w1_therm.c:353:8: sparse:   also defined here
   drivers/w1/slaves/w1_therm.c:354:8: sparse: sparse: Initializer entry defined twice
   drivers/w1/slaves/w1_therm.c:354:8: sparse:   also defined here
   drivers/w1/slaves/w1_therm.c:355:8: sparse: sparse: Initializer entry defined twice
   drivers/w1/slaves/w1_therm.c:355:8: sparse:   also defined here
   drivers/w1/slaves/w1_therm.c:356:8: sparse: sparse: Initializer entry defined twice
   drivers/w1/slaves/w1_therm.c:356:8: sparse:   also defined here
   drivers/w1/slaves/w1_therm.c:358:8: sparse: sparse: Initializer entry defined twice
   drivers/w1/slaves/w1_therm.c:358:8: sparse:   also defined here
--
   drivers/w1/slaves/w1_ds2405.c:30:24: sparse: sparse: cast to restricted __le64
   drivers/w1/slaves/w1_ds2405.c:182:32: sparse: sparse: cast to restricted __le64
>> drivers/w1/slaves/w1_ds2405.c:198:8: sparse: sparse: Initializer entry defined twice
   drivers/w1/slaves/w1_ds2405.c:198:8: sparse:   also defined here
   drivers/w1/slaves/w1_ds2405.c:199:8: sparse: sparse: Initializer entry defined twice
   drivers/w1/slaves/w1_ds2405.c:199:8: sparse:   also defined here
--
>> drivers/w1/slaves/w1_ds2423.c:112:8: sparse: sparse: Initializer entry defined twice
   drivers/w1/slaves/w1_ds2423.c:112:8: sparse:   also defined here
--
>> drivers/w1/slaves/w1_ds28e04.c:359:8: sparse: sparse: Initializer entry defined twice
   drivers/w1/slaves/w1_ds28e04.c:359:8: sparse:   also defined here
--
>> drivers/base/firmware_loader/sysfs.c:235:1: sparse: sparse: Initializer entry defined twice
   drivers/base/firmware_loader/sysfs.c:235:1: sparse:   also defined here
--
>> drivers/base/firmware_loader/sysfs_upload.c:67:1: sparse: sparse: Initializer entry defined twice
   drivers/base/firmware_loader/sysfs_upload.c:67:1: sparse:   also defined here
   drivers/base/firmware_loader/sysfs_upload.c:90:1: sparse: sparse: Initializer entry defined twice
   drivers/base/firmware_loader/sysfs_upload.c:90:1: sparse:   also defined here
   drivers/base/firmware_loader/sysfs_upload.c:113:1: sparse: sparse: Initializer entry defined twice
   drivers/base/firmware_loader/sysfs_upload.c:113:1: sparse:   also defined here
   drivers/base/firmware_loader/sysfs_upload.c:122:1: sparse: sparse: Initializer entry defined twice
   drivers/base/firmware_loader/sysfs_upload.c:122:1: sparse:   also defined here
--
>> drivers/iio/health/afe4404.c:151:1: sparse: sparse: Initializer entry defined twice
   drivers/iio/health/afe4404.c:151:1: sparse:   also defined here
   drivers/iio/health/afe4404.c:163:1: sparse: sparse: Initializer entry defined twice
   drivers/iio/health/afe4404.c:163:1: sparse:   also defined here
--
>> drivers/iio/light/tsl2772.c:1352:8: sparse: sparse: Initializer entry defined twice
   drivers/iio/light/tsl2772.c:1352:8: sparse:   also defined here
   drivers/iio/light/tsl2772.c:1354:8: sparse: sparse: Initializer entry defined twice
   drivers/iio/light/tsl2772.c:1354:8: sparse:   also defined here
   drivers/iio/light/tsl2772.c:1356:8: sparse: sparse: Initializer entry defined twice
   drivers/iio/light/tsl2772.c:1356:8: sparse:   also defined here
   drivers/iio/light/tsl2772.c:1358:8: sparse: sparse: Initializer entry defined twice
   drivers/iio/light/tsl2772.c:1358:8: sparse:   also defined here
--
>> drivers/iio/trigger/iio-trig-hrtimer.c:80:8: sparse: sparse: Initializer entry defined twice
   drivers/iio/trigger/iio-trig-hrtimer.c:80:8: sparse:   also defined here

vim +455 drivers/base/core.c

287905e68dd2987 Saravana Kannan 2020-05-21  423  
287905e68dd2987 Saravana Kannan 2020-05-21  424  static ssize_t status_show(struct device *dev,
287905e68dd2987 Saravana Kannan 2020-05-21  425  			   struct device_attribute *attr, char *buf)
287905e68dd2987 Saravana Kannan 2020-05-21  426  {
948b3edba898830 Joe Perches     2020-09-16  427  	const char *output;
287905e68dd2987 Saravana Kannan 2020-05-21  428  
287905e68dd2987 Saravana Kannan 2020-05-21  429  	switch (to_devlink(dev)->status) {
287905e68dd2987 Saravana Kannan 2020-05-21  430  	case DL_STATE_NONE:
948b3edba898830 Joe Perches     2020-09-16  431  		output = "not tracked";
948b3edba898830 Joe Perches     2020-09-16  432  		break;
287905e68dd2987 Saravana Kannan 2020-05-21  433  	case DL_STATE_DORMANT:
948b3edba898830 Joe Perches     2020-09-16  434  		output = "dormant";
948b3edba898830 Joe Perches     2020-09-16  435  		break;
287905e68dd2987 Saravana Kannan 2020-05-21  436  	case DL_STATE_AVAILABLE:
948b3edba898830 Joe Perches     2020-09-16  437  		output = "available";
948b3edba898830 Joe Perches     2020-09-16  438  		break;
287905e68dd2987 Saravana Kannan 2020-05-21  439  	case DL_STATE_CONSUMER_PROBE:
948b3edba898830 Joe Perches     2020-09-16  440  		output = "consumer probing";
948b3edba898830 Joe Perches     2020-09-16  441  		break;
287905e68dd2987 Saravana Kannan 2020-05-21  442  	case DL_STATE_ACTIVE:
948b3edba898830 Joe Perches     2020-09-16  443  		output = "active";
948b3edba898830 Joe Perches     2020-09-16  444  		break;
287905e68dd2987 Saravana Kannan 2020-05-21  445  	case DL_STATE_SUPPLIER_UNBIND:
948b3edba898830 Joe Perches     2020-09-16  446  		output = "supplier unbinding";
948b3edba898830 Joe Perches     2020-09-16  447  		break;
287905e68dd2987 Saravana Kannan 2020-05-21  448  	default:
948b3edba898830 Joe Perches     2020-09-16  449  		output = "unknown";
948b3edba898830 Joe Perches     2020-09-16  450  		break;
287905e68dd2987 Saravana Kannan 2020-05-21  451  	}
948b3edba898830 Joe Perches     2020-09-16  452  
948b3edba898830 Joe Perches     2020-09-16  453  	return sysfs_emit(buf, "%s\n", output);
287905e68dd2987 Saravana Kannan 2020-05-21  454  }
287905e68dd2987 Saravana Kannan 2020-05-21 @455  static DEVICE_ATTR_RO(status);
287905e68dd2987 Saravana Kannan 2020-05-21  456  

:::::: The code at line 455 was first introduced by commit
:::::: 287905e68dd29873bcb7986a8290cd1e4cfde600 driver core: Expose device link details in sysfs

:::::: TO: Saravana Kannan <saravanak@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
