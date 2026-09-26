Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B539E39CCED
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 06:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790403697; cv=none; b=deBOhKQKUrgzfNHHAFddNsRtbn4LY0IUEojQnrLFZeBCSN6Z/kwF5fzDOSqNvoH4AxG6X/zPHbQXTKN4jOs30BTYK5gFfmgdW0dgPKVKBXma0/H8HR7EUdbJtPtGRy8A2HNxPdhJevNXC97r2Ti9PWo0namGkPZX4JGgvt5EUfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790403697; c=relaxed/simple;
	bh=8I6VxHoSIu/hYUzQU0gIyg67mqCoPe3c6ddo4juqoqs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WXNa8KAKUCiFvLz05NC9QqmiPOlm0HfPTsubNYmK98JlEVipjBrGYP0q6wpX6kcZxKf3Qvz8Gk44FAl20mLamDb5jH4Tw1tx6+XBPtFKYsU+QcQCsbzp+QDkPTQ6YEH7hj2NJxB+DLdADa3XlvzXBHg+IGM20H1d06hMq2Odg+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9XFj9RV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9XFj9RV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790403695; x=1821939695;
  h=date:from:to:cc:subject:message-id;
  bh=8I6VxHoSIu/hYUzQU0gIyg67mqCoPe3c6ddo4juqoqs=;
  b=b9XFj9RV3/TSwkHX0dRU+l5EJRwnfx5nCCrTrXpZvea79TA0SWDkWki7
   GKxD84Gd2lH74jQ17PdJQvx89O/PgJ4J2vE7D2FGx9RXCznpd6pNyWc+z
   wlgbLcr7mph/AXGuBZYHaLpmKz41px35TEVUDkr25n98Z0iwwXTb2Tqe4
   icXqKWc4PVeQLmNP4NNlbP9veETRsTLtQCpmx6xotGZBLEMYtZGWwzxMa
   a+52IhhZZuAYrZVy6y2joB3CbY5jkmB0n1SfF5lmpM8dwGxxCmHrFTVy5
   7gpFLT4eSYibm4900Xnb/REXzrX8xNxmqxqQpO4vB4x2tvzt5I7xJw0Wz
   A==;
X-CSE-ConnectionGUID: gPhEGZ+QRL6daZWzntFpDw==
X-CSE-MsgGUID: 7hks6+tcTGmGwvBB5LlV6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="102549738"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="102549738"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 23:21:31 -0700
X-CSE-ConnectionGUID: rTdlHBhtR+WEVqG9Bphtrw==
X-CSE-MsgGUID: UUM/TyINTMGpbHBFN7OL3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="272306673"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 25 Sep 2026 23:21:28 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xALmk-000000000Ph-4Bix;
	Sat, 26 Sep 2026 06:21:22 +0000
Date: Sat, 26 Sep 2026 08:20:43 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 6331/8450] htmldocs:
 Warning: drivers/tty/serial/Kconfig references a file that doesn't exist:
 file:Documentation/arch/arm/sa1100/serial_uart.rst
Message-ID: <202609260855.kLXy24Bb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 72efc75f7028c3347a699d55bf2809112ad08579 [6331/8450] ARM: remove sa1100 platform
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260926/202609260855.kLXy24Bb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260855.kLXy24Bb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/arm/xen/enlighten.c references a file that doesn't exist: Documentation/devicetree/bindings/arm/xen.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
>> Warning: drivers/tty/serial/Kconfig references a file that doesn't exist: file:Documentation/arch/arm/sa1100/serial_uart.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
