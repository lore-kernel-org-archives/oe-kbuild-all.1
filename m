Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485811400C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 19:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769284598; cv=none; b=PIAQ06UKXiDVTAidwNMMLlII+ooPHsoZZMxAAAAa/ePAUIml+FFYdurCM5KCGRQfOHxfGoFOpTt0czmDNrGeW+e+ZD36jh+22Vla0a1nJVb40U7of9RQVKFf4uzVh7w/7b4DOlqc1V5L+NqLXeP3Ke9mQYh86/qNPH82QGtd6FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769284598; c=relaxed/simple;
	bh=Llj/zg6hvjuRYuZEPmWI5O17fb+DeuVikfbQKP8yUiQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ajCTRJeT8QAGY5T6nZEBa10K3PKpnrap1hWN5kOMq2RJ8flbxa5v6yy6mO8GU+wzzu9PA6Qzpm109RzmAPmvvRKb6zB85v51F6WbbDr3jLJfH34SESDaJ77oa3DmzLafECzoKPbxMrg+/YhXOrJTjGAtDwIXzSsMFNUHLvjYGQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JaVm5hia; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JaVm5hia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769284597; x=1800820597;
  h=date:from:to:cc:subject:message-id;
  bh=Llj/zg6hvjuRYuZEPmWI5O17fb+DeuVikfbQKP8yUiQ=;
  b=JaVm5hiaWspqcYlnIfoqSidajsPgCPT5SL2DzEUl18AIB2dCph+1tqZB
   5v2JcH8oxI+GXpx7dBVUOr/88T/+LqMRMVWmfRFjKOPMMH1VAeliyzfKY
   Oyybf2xw1n3riG/zZtixPMY/9VxWg91A6IlUoG/YEJKIKT5hPrq9VlLa/
   opRc+YpNL/+iEAY3yfw7zICAQCeuYe2p+IiHzWmJrNs/cwEhvlpR6UxTt
   BcmfyU3NrX72JWvjMht60OF6I/N76e/OVG5EVW4hRF75i0deyihMO7Yht
   vuOk5k5zvDdx9avmT6Pgp42htv2K93NMpOz7DzzZRQN/k+F8m5KiRZ2/K
   g==;
X-CSE-ConnectionGUID: sYDDy0YeSaCboi/5RcmPZw==
X-CSE-MsgGUID: 0RjPkOkGR4+zkP8Cy4pa4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="74346675"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="74346675"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 11:56:36 -0800
X-CSE-ConnectionGUID: VOYSHp6vTf6jLhDVWNMNGw==
X-CSE-MsgGUID: aKO6ea8TQauclgOpjf2rnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="212304080"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Jan 2026 11:56:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjjkG-00000000VVa-1JEt;
	Sat, 24 Jan 2026 19:56:32 +0000
Date: Sun, 25 Jan 2026 03:56:00 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 131/131]
 utils/firmware/aeonsemi/as21x1x_fw.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202601250355.dMsphDpA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Frank,

FYI, the error/warning still remains.

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   b99e3f4753537bac1067bdaa28a34cdb01cc5308
commit: d52e1e3f76796a72c9dea64c2c6c64aabd750aac [131/131] firmware: add aeonsemi firmware
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260125/202601250355.dMsphDpA-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250355.dMsphDpA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601250355.dMsphDpA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> utils/firmware/aeonsemi/as21x1x_fw.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
