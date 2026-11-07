Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794083941;
	b=O2IfFO2w6HcQ11x1rJPTqgPlbG3Hv9iiOrWPUNi8CbzfSXitq1V3X8Ixn8hBRip6FnTr
	 mLwi4Y4bpisZ66zQUiZgxCv3/2QotuGw8bdqk2yte3vXbXaltrJUcPgiHlzUTrXjguVR1
	 nccfoIkLPlaWj6seZKcVMzy9RsTvmCxXhMWxN7BiZMHrVWRZZx/fCAPqtNeHQW7h/zq3n
	 JNwIkxSguQSD2jpNeFSK9ST10Fhq3rLqX+xFuwIzEr6SfN8hCfNHZ52uHy/e9RzPQiRfK
	 WqcG6h4gePsMZTG4ECC8ydD+gzE4ltkilqdRUFDkm5pPF/2zvKCctnhotqB6646o1Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083941;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=KDzq1/3UJPMvmMOXglrbil2kk7gGAUGdMJKtDWtdqBE=;
	b=tn83XhUgYVjMqP3vPzn4teC+TQQuQWMGujdMmC1uOBpNtOvbZ6huxaXiS6tv6UMpxeUc
	 3MC0o4Mcnl641+t5RvA1/T/GRcBzRngV02M0VH2PbhlN48uRV8ZkdxuYsYP/7lnTwm6Fm
	 ZRsFnPXFkkHr5OXkezAJB8rWEl8ijgBplqcpHowIwDctSbhDn+rxrr8Sxrq6U5DhT29+N
	 0gamC/T0R7bazYIqr5bEZe6q5ZmIKjWVyvfFoa0EjwzrdLmXyA6+CB7zU/WxAIL9susU2
	 lKvW6+f0H2ZLrdAMWMcq80ytlDuXnUHwdNS/VBercCMe3xYfnQuZX9qRcbKNkrPGehw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eEbQAEqM;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2108606A32C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 20:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2108606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eEbQAEqM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794083939; x=1825619939;
  h=date:from:to:cc:subject:message-id;
  bh=mp5/fsallevulxasrGtFWu7D6OTF0C/IQp93XVDhiJA=;
  b=eEbQAEqMqhLg3RbdItx+4Yselw2G23BVnDlsTFa0HP/y7cz4hSEMcdRG
   6+acPT36UvZo6GlPdSK2yIPhd1IYaBKZk9ti0cJUtnFkBZ5oXALHVgN7O
   uc8Mq0RfeKTp0gxbOtqfOnvMNuO0fzzjrmbtmn0r06DR8xp6jmxQZSTzy
   x3T/4EhN9Fol6qva4OY/sul9kjf5BFTY2JbM/imy3WcPIINsTBqHZAVC1
   YEMh3PyYJkUPa4D3+4P98C+6034UoCS5SK5J25vNFjAnuhCA3tChksdNY
   Dg1aQcQ9Hou7maa2deuCN6G4Jy5djS1tHbCRaE8Z7YKX3608wo1ICrLiI
   w==;
X-CSE-ConnectionGUID: 4cKDqU20Txu0wJnFaFjrYw==
X-CSE-MsgGUID: xTV3LBHhQg6IqL52mWcT8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2765225"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2765225"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 12:38:58 -0800
X-CSE-ConnectionGUID: P+aiuqMZR7ipR+Dqm/n7+g==
X-CSE-MsgGUID: maMvULGwRQGIS0eDgN33PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9319866"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 07 Nov 2026 12:38:57 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPnBe-00000000Aml-1jET;
	Sat, 07 Nov 2026 20:38:54 +0000
Date: Sat, 07 Nov 2026 21:38:46 +0100
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 83/85] Warning:
 drivers/acpi/property.c:1993 function parameter 'ports_name' not described in
 'acpi_graph_get_remote_directional_port'
Message-ID: <202611072118.FTpcAmPG-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   5f0fc23f88cf06b249de0a44544248099edb14ca
commit: 6dbf82a69e8d1c65061fbb3a6f9c963b480638a8 [83/85] ACPI: property: Add device graph support
config: loongarch-randconfig-2200-20261107 (https://download.01.org/0day-ci/archive/20261107/202611072118.FTpcAmPG-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611072118.FTpcAmPG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611072118.FTpcAmPG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/acpi/property.c:1993 function parameter 'ports_name' not described in 'acpi_graph_get_remote_directional_port'
>> Warning: drivers/acpi/property.c:1993 function parameter 'ports_name' not described in 'acpi_graph_get_remote_directional_port'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
