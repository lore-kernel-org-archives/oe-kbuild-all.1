Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6E13C17
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 00:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768178546; cv=none; b=r00I4uO9cvJ74wmXPZOs7efwxRfr0/XVPpO2NBQvbxypAF2bo2L0u/5mkzazYhZk7YBVoBDYdlGNlgFTQNF383K3RQn72++coyDFX/1H6L81eE/1QDhwYu+ntuC4S59WQr8TA/xnQOMQKCpVpqwbWw/b7wzO+0Fgu87fqJ2uVOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768178546; c=relaxed/simple;
	bh=kcs8dkJkhYYY4Dx6hQY/A++XlYQLS7fLA7GuoMSxQ64=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pCXk+t5dtROcGPV1uCcWIUrqOK9o7H5XkZMKYRTA2GgQ8AeoLMllOn/SpLifZ06BFmzKbhw5fmk4ZphJJaIH+2iHqK5RUmCzfoCzrSWjkdjKNARcJ0IBsCNDi421SbiO6Y1Lh17g8LxeeN0NZyCHVgh/sDZ1kb7ELxnPy8S7kyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDlJ2P4P; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDlJ2P4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768178544; x=1799714544;
  h=date:from:to:cc:subject:message-id;
  bh=kcs8dkJkhYYY4Dx6hQY/A++XlYQLS7fLA7GuoMSxQ64=;
  b=EDlJ2P4PP94wqy29A+5a4BeSv3h/hpv6Ty+um9GPS+AXtug7VlAz25IS
   RIHPSGGBUXUjMp+WEWlBiCsUtL1cjst7ApnU/QCcFuKGSGPG07q0kmIQ1
   ydpTggis+j4SxsqX03BT72Dhiiqe+2pJFaUxxLCVo5PT9teHYG3os5RZa
   cJHQvFUeh7p6Lb6PFOizPdlDhU0N/4VyCUr3rYDv13jMiki1Ic+fgYv+C
   bpo0uf9mDgJHZeMKuEfsmp80auZfIlT89hGBAaDm3XyDO124LjoOPDWD0
   FHQhiChPmL5BI2DlplUcvWDyAScRUEbwLAf2F4yKhQtc8bxo49pZUJ9IA
   g==;
X-CSE-ConnectionGUID: OkPWuA6EQXe9HjnseEAWSg==
X-CSE-MsgGUID: 5pgCLW6vSGKWIGJkcIrFsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="57005646"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="57005646"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 16:42:24 -0800
X-CSE-ConnectionGUID: ItrXcoTjSCOrhZ+9qI1HWQ==
X-CSE-MsgGUID: GHCrr/mdRiO+C+Uu0oUcZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203585111"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jan 2026 16:42:22 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf60h-000000000Yd-3DmH;
	Mon, 12 Jan 2026 00:42:19 +0000
Date: Mon, 12 Jan 2026 01:41:56 +0100
From: kernel test robot <lkp@intel.com>
To: Raju Rangoju <Raju.Rangoju@amd.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 NET_SELFTESTS when selected by AMD_XGBE
Message-ID: <202601120123.FXmxml0s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c7ef209cd0f7c1a92ed61eed3e835d6e4abc66c
commit: 862a64c83faf7708e7e79498193ff5270543a68d amd-xgbe: introduce support ethtool selftest
date:   10 weeks ago
config: hexagon-kismet-CONFIG_NET_SELFTESTS-CONFIG_AMD_XGBE-0-0 (https://download.01.org/0day-ci/archive/20260112/202601120123.FXmxml0s-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260112/202601120123.FXmxml0s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120123.FXmxml0s-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NET_SELFTESTS when selected by AMD_XGBE
   WARNING: unmet direct dependencies detected for NET_SELFTESTS
     Depends on [n]: NET [=y] && PHYLIB [=y] && INET [=n]
     Selected by [y]:
     - AMD_XGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_AMD [=y] && (OF_ADDRESS [=y] || ACPI || PCI [=n]) && HAS_IOMEM [=y] && (X86 || ARM64 || COMPILE_TEST [=y]) && PTP_1588_CLOCK_OPTIONAL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
