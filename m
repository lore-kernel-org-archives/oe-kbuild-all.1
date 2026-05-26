Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD10438BF81
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 17:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816434; cv=none; b=Jx+uOxC0upxWW7AUBRkbm9TS56zP/DIo9a7jvA8pqbhxgjibNoVjeKpfINP0bvl0XaseKVyzR/l2cN4n5MtldRSLRw/wnsGtjKEAHzwN8ziUvkl9fUNz6KfIGwdKWftRzSbdar7TMnlWQbtcI1kRS2sRSD1QGNAunlpiGQvpfJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816434; c=relaxed/simple;
	bh=BSGs7hT0aXjxdWB+MwrZTjOh3zVTKxqr6tm27D81PEc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OyzJ1CGiJno0y1fU+POHR4d3o07T11R+pm2xmGAICnTuthUuTjHB0WuixSci5N0llMRaeFMZYFf0NYNonKjr7J7BcASCGReiF+pn92v5RnS4N/R9f/GLEG7prqrwQ/LmjuFCNRG11lhoSEPmgeqJmupGbzTJh50WF81Mq4d/dBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uhap4dEF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uhap4dEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779816431; x=1811352431;
  h=date:from:to:cc:subject:message-id;
  bh=BSGs7hT0aXjxdWB+MwrZTjOh3zVTKxqr6tm27D81PEc=;
  b=Uhap4dEFbMmeipQmOImAGw2LI2Kxj9V+Jf5NCBPVVW0y+x/9crADAwn4
   fLW3zeB3j6FK7RNGLEuem6Xk/Vhav9XklLwRsEVVAxMJDBTQRc3asYZDn
   +/lO4QcAprS33Etnvq7dyl3w+gmyA7Kv8eSZNW7WDruFfHoHR4Q+pt9gM
   3eGpXfRTqTkcquNLFb7dVgrf0KraTM29yjHUh8PcUqkY2kwiV1s7Rw256
   +hko5O0TM19cd1EyPVd05moE25jF7EdksLAqhV6bsLgOPTtJ2XPyc/rJd
   QxDFcH0kcsqR4bnOs+DcWcb3i/7HgzT2tyQODg9uC2S2zBo01QKdpgulY
   w==;
X-CSE-ConnectionGUID: uvR9POhnSN6VQnli0JWk2g==
X-CSE-MsgGUID: ce9ZJZYWTQySBqYgM53OeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91329946"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="91329946"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 10:27:10 -0700
X-CSE-ConnectionGUID: rxZwhh4/SVG9mJbOSlFCHg==
X-CSE-MsgGUID: 8bbhIo1jQuiywiYF0yDdiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="265595969"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 May 2026 10:27:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRvYY-000000002ri-1Y1R;
	Tue, 26 May 2026 17:27:06 +0000
Date: Wed, 27 May 2026 01:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [linux-next:master 3038/8013] ld: se_ctrl.c:undefined
 reference to `mbox_free_channel'
Message-ID: <202605270101.2FFpzoFg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7e28506af98ce4e1059e5ec59334b335c00a246
commit: 106ffe5d78ad86d12becfd0648463e14c12b3a2a [3038/8013] firmware: imx: add driver for NXP EdgeLock Enclave
config: i386-buildonly-randconfig-006-20260526 (https://download.01.org/0day-ci/archive/20260527/202605270101.2FFpzoFg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605270101.2FFpzoFg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605270101.2FFpzoFg-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/firmware/imx/se_ctrl.o: in function `if_mbox_free_channel':
   se_ctrl.c:(.text+0x44): undefined reference to `mbox_free_channel'
   ld: drivers/firmware/imx/se_ctrl.o: in function `se_if_request_channel':
   se_ctrl.c:(.text+0x310): undefined reference to `mbox_request_channel_byname'
>> ld: se_ctrl.c:(.text+0x34b): undefined reference to `mbox_free_channel'
   ld: drivers/firmware/imx/ele_common.o: in function `ele_msg_send':
   ele_common.c:(.text+0x11f): undefined reference to `mbox_send_message'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
