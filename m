Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581D53D0934
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778926294; cv=none; b=RarIYHw9BY8u5RX1uvTyR4y2HV5CsLW3wtfHEOM6LhxR+0la9hsfAjPtFb5zWRMLEPjsJdY0dBSxf1XBSbK1q98bGiiSWS/mxJpUmoXFAB+l9PWszn8WKSTuG4V58+CnoDGzM/sEq6LsCsjI9kur8gOrES7nsyYeJDKeIrQGdkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778926294; c=relaxed/simple;
	bh=xBvhtfkql7H+jdh8TlsCuGvqA3xsc79RnG8ZIKjS+p4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qunMP8NiBkwj2P8Mn7DN+2m9fGm/hIR2uG48b4yzQxPVfQwCzQ0fi3WAIncXhQ3UjbXhuR2lAYJsunJ8GDrPiE8xD6/8y/cilcBlUkFY1SWvXaNFPiq7Pnpew/wCox6xbhwIGP7IqMpo8WCwhVYdm4RgAwNuPcl2SFhlkc67ddk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOZhNqrD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOZhNqrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778926292; x=1810462292;
  h=date:from:to:cc:subject:message-id;
  bh=xBvhtfkql7H+jdh8TlsCuGvqA3xsc79RnG8ZIKjS+p4=;
  b=VOZhNqrDJn3//QlJrKyzQuQJdp3a0oepXLkImbcE0CF3HUNHeFytpel2
   xYVti8DMDYeWUqCBKFN9PkjLXGp0sWNWn0VTPUT/CKYrWi6DYfjp78izu
   FThgxIdd/7URQW8p6MtKwQhQ9KLhqV2u3kvi2PfSLJTJ80jCR4GI2ktvj
   iFvkduTQxAHRExDCT2YxjgBGYZUyX0uoQW8MweR5pkNWaX0w4+tSlKg1c
   GNrtHL/ldyFMdnRYUep4CO07OJM2zAmBEEcZ+yTwWlAMoCRoVWPcUebhV
   FTvQV8lQzL2rJ3xG1yrw8dVWPcEH9Hq+jQJEwHjk3IOLw9iXGQgMAO1pZ
   A==;
X-CSE-ConnectionGUID: /QizWqAiRqO1XD7OdmqNIA==
X-CSE-MsgGUID: L+7murJWTCuhR4httb2SLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79001175"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="79001175"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 03:11:32 -0700
X-CSE-ConnectionGUID: T+1D32OVTb2y2nkP/MJkTQ==
X-CSE-MsgGUID: gj3PifmFQu+WI0C9DPromA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="269291648"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 May 2026 03:11:29 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOBzS-000000000iJ-08cS;
	Sat, 16 May 2026 10:11:26 +0000
Date: Sat, 16 May 2026 18:11:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>,
 Stephane Deltour <stephane.deltour@barco.com>,
 Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18 630/871] Warning:
 drivers/media/platform/xilinx/xilinx-dprxss.c:585 struct member
 'powerchange_work' not described in 'xdprxss_state'
Message-ID: <202605161855.iJ8jarFO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18
head:   8ad23fcb26beeb807a7f0f3341137ec98e93f390
commit: 8e44af9b009612dab92437d10808952b9d1ba688 [630/871] v4l2: xilinx: dprx: Fix startup link training and correct D3/D0 power-state handling
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260516/202605161855.iJ8jarFO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161855.iJ8jarFO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161855.iJ8jarFO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/media/platform/xilinx/xilinx-dprxss.c:585 struct member 'powerchange_work' not described in 'xdprxss_state'
>> Warning: drivers/media/platform/xilinx/xilinx-dprxss.c:585 struct member 'last_powered_down' not described in 'xdprxss_state'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
