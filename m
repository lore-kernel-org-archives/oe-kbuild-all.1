Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D23A40FDAD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 22:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786573650; cv=none; b=jjT92rObQHaRE6h4HN356FyrX7SxQLOt6Zpha8KyqFjjXA3QMsNg3K5UyeMBp8i/zGZFD9UoOTpZvsgDitJVP2d29X2O03sxqKPmtVpgpzndEc3GXYrgLe15Fev3OKmBxPCTbzcAHz+J/W0S4AwKQvuBn/XPyju1Rlq8StWrziQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786573650; c=relaxed/simple;
	bh=lAg2q7Gsdng2tLgWGbUAkZWBhCHI9flqL7bpj02kp38=;
	h=Date:From:To:Cc:Subject:Message-ID; b=caxsx79VB/yBslokxJ7CIJnhL6DPaRA9TXQ4ciC2bp1d0yZul7FDeP7LWKLUs1zvY2/ydhEGQv/YnlACYV4ArQv1U3sPjWarYx7Dvm0OEwTWUyUHhUSWTTmtQPk+DN/wFKGUNOlBhd/rzL97TFEX37mko5WS38piKM26+WpxHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdxOUzKt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdxOUzKt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786573649; x=1818109649;
  h=date:from:to:cc:subject:message-id;
  bh=lAg2q7Gsdng2tLgWGbUAkZWBhCHI9flqL7bpj02kp38=;
  b=KdxOUzKtWKSieF0NS/of53dAVpSjnjDgl4InZYZJlPEMweinK1zc+GJC
   XZdvXiorJtID7P1RrRYkze4GYVmSrD+UQIg1utlK+OUamWSXVFLZzMWvX
   KjctFJaddej8Q1FhQU9cO4BTHab4h/MswPA3MQ3ER6PGqqmAalNs53T+v
   KS3oNjHcqI3DhGYG3GlBsi3VdqX/BGsjwndiei2WUdN9FaugitRxARlRm
   yal5sOI4tXww6aGIoTkDFBcrjW2a8DnH65ECqtrWCeXvPEA5dopMo5rRB
   7a6pV5y1pehC/sLVDmhKTnul4CXZ1hvcv/Ok3Hh49MrN8sBWhL6PRBvWY
   g==;
X-CSE-ConnectionGUID: /y0qbww9TqGv3GuLRKHXiw==
X-CSE-MsgGUID: +fmLU+UlQIahGiXXxYGgPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86263552"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="86263552"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 15:27:28 -0700
X-CSE-ConnectionGUID: QVPjCKmSTx6e1O+6TuMneg==
X-CSE-MsgGUID: aRi20F54QBm2wLBbni+9pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="257553628"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Aug 2026 15:27:28 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuHPx-00000000Rug-1Al8;
	Wed, 12 Aug 2026 22:27:25 +0000
Date: Thu, 13 Aug 2026 06:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 194/194] Warning:
 drivers/net/phy/mxl-gpy.c:588 This comment starts with '/**', but isn't a
 kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202608130656.hNZiOr5l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   a95b0dd9ff78c9cef7f526f740079a3a051f234a
commit: ec0f21c9e7aa2f6e466e3ff6db9dc7e6aff84d9d [194/194] net: ethtool: report PHY firmware version in PHY_GET
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608130656.hNZiOr5l-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130656.hNZiOr5l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130656.hNZiOr5l-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/phy/mxl-gpy.c:588 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * in some cases the GPY211 will link up but not RX packets

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
