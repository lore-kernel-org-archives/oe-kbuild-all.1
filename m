Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637738;
	b=vvRDJ/7Ogrn5DQvHxz5X+oXSQ6A/sI5rwJxBW2rADw4zuytIc7IrWUiAImqNIRclkUER
	 E7OKxDgaIKWbSTC4rfMBNFaymWu+HfmsoKI32oh4ok+9YqtcENV5mkgzA9YQMGxIIP2ql
	 PiiU6Pt06XxeZmsIQy4NqTHKf2bOiUnojsyiZH8y/cDsaNxh82Pi1vUpCe4jomT+gi7FR
	 RlNtNXCxBM+NTQT0D02CM338qO4rX7ezl6d95qS7vi9BJNl6OWiatUeAoymuo9WQY1xmH
	 N7vA9XmUE32dsZiXG847mqaDyVlPpReybv9jW1O9OKxT47N1b3UbOPCzf2fT0HQWe/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637738;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wiBV55UiQ9z8iTuK3YaAzLsgbV9kG+r8B4QK4xmoEeU=;
	b=UOlpPOINO+g83B/nI1zxrEDANZ00B14e0muoaLjElHbmN3s4OqfsuojgaSVf84LgCLYJ
	 ydNgdeR4sHiTlMmtUXAIRGj+moHAA7qtyZv/wSqERb7LlWcwe1lbvsVce27uv0JdpuDMv
	 dNYC+vthroWD2+YXPKuBCIVR5MpSQ55c9w/tqHFjA79oP99HZqWbIV5uOoNM9MgxK1tNS
	 6U4XCRlca+YYqpOJnVsBZ4H3Lqxv3XA6Au08Vr5PC3aGAWnAJCKJzs6Vh+Gu/iMrcTpB4
	 wuS/L9HGRg8xhn4tVlSPJ2mw+638H+O093k06ugWoLk3WyzfYK/EfN8LST2jHVe8Uaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hap5b8xg;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41730606A31E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 20:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41730606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hap5b8xg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795637738; x=1827173738;
  h=date:from:to:cc:subject:message-id;
  bh=760j/5/P4ra5RcXbJHQ0umixXSrs9LxuijhlKqkPzAY=;
  b=hap5b8xgkeD3eNWKHPIGpWS0JonJ4pQ0/fWYJoNJ8dmm4Adbmr975q1h
   PGqZQzKxcdKGJBsvrBxIKNU5tGWbTtCsjIJ5sTt0I97ZvU0TtiOcXDHsE
   8+4uBpcLV13CG2wT2U0LzT4QOXqkIh1mx+SwDDzasfYWmD8woxjdsEpkB
   r491iCSDbGmFxstWqizhpHS+p2A36fi6+ylo4v+IkxZAgx4ZVjrzNqsgH
   3J7V0ZHbF+ZwAbemH4h9XGJRG9UHWHfC4EeYwvlXPsBOHuG4FKBcP5+wf
   8+jgCke5KiGfB44c94qSwhYl0j3usWG7/xkhUkxNz6MkZHIWCCQywxbaY
   Q==;
X-CSE-ConnectionGUID: jPDTyU6LRDOZAUG74t60+w==
X-CSE-MsgGUID: f/xK7MYLRLW6x8u9MbAhxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4412545"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4412545"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:29:59 -0800
X-CSE-ConnectionGUID: zPN+fDcrRseDHVxpR0y86Q==
X-CSE-MsgGUID: 7CzfZJi9R36bAw+GJa7+7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12380482"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Nov 2026 11:28:57 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWIfm-0000000003v-3irM;
	Wed, 25 Nov 2026 19:28:54 +0000
Date: Wed, 25 Nov 2026 20:28:10 +0100
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:arm/boards 1/13] htmldocs: Warning:
 drivers/tty/serial/Kconfig references a file that doesn't exist:
 file:Documentation/arch/arm/sa1100/serial_uart.rst
Message-ID: <20261125201757.fs0nwqZl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/boards
head:   273a6e23f66433952300d1810b5274786e7e4a25
commit: aed54038a668c435e3a9ce99c15bc117017bd246 [1/13] ARM: remove sa1100 platform
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261125/20261125201757.fs0nwqZl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125201757.fs0nwqZl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/arm/xen/enlighten.c references a file that doesn't exist: Documentation/devicetree/bindings/arm/xen.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
>> Warning: drivers/tty/serial/Kconfig references a file that doesn't exist: file:Documentation/arch/arm/sa1100/serial_uart.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
