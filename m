Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ABC1EB9F4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 16:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254685; cv=none; b=e6Xsi6zUHUvep/nwlkiCvcAEI3zNWOz/e0f583raJv5PXm4+mKBn2csZXf+LJlfjQ0G0dSkU6Th2Y8lnLPtOxBdBFQ6a25Rg9DVjTPYotdU8xBcETAXOSY/GCDHiUjYd11a9ahHrF9Rzjcuz0c+DR9GnKLtTOnK208G+QNP7O8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254685; c=relaxed/simple;
	bh=pK1nz/DP9B4BZNDKCUzvtwBolDGSPZutbDrKSst/ZOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NBekLjt05iuIgfACL4zRItFBvX9OKuBmSPmW0zkSCEf1YVd0F+OHhiVdBXiRhkQYAhCMYFnVeShGP4bcp702XKlhfopCXXREyP06eWmGR3Cm+4OUALCXXtJurFRsTloIxm8+NEIAmEBbdHsoTk9fSOPrUSC+EnvKaXkz6636Axc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3bHDudt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3bHDudt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738254684; x=1769790684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pK1nz/DP9B4BZNDKCUzvtwBolDGSPZutbDrKSst/ZOo=;
  b=P3bHDudtzV8zKkEKjZefelHNZYizi9b+h6HNSZpYKH0eDUMJ/87ZnxU1
   8mCpoBDdMeVxDbW/vmv5JW6y26hBkNAbIoycE4D7OXcMu7/ViG3i3D0Ju
   QaF6Fb5d+JVS0IeE9QFn2Ore//0HbJxO9azN5yC1rmRwRiYO8D/23u6Il
   crdo1Qnb5ehGDxzkbBhfGlFkFDGDsM+6RcyNfQVYAb54lBdDrAQurquE+
   xLttVq4WqN35u9yvn1eBqijb1GjVHaOX/yicJ73jzP+OXl+DQ51xNJru2
   LCw8ns+O6r4Gq/PXqnzZFm1iRYBxb9ecYSau66U9xcwCCnYCc/xDk71j+
   A==;
X-CSE-ConnectionGUID: CLAkxZz7QJeP/q96XKL9uA==
X-CSE-MsgGUID: NvNk5boQTJOua2cX8OE0Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49796203"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="49796203"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 08:31:23 -0800
X-CSE-ConnectionGUID: mFfLwP2qTr2aNjbB6/PUSg==
X-CSE-MsgGUID: y1AcpFwRSfeeZ1sCseBbsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="114356132"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Jan 2025 08:31:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdXRo-000kgL-0g;
	Thu, 30 Jan 2025 16:31:20 +0000
Date: Fri, 31 Jan 2025 00:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 38/49] ERROR: modpost: "tty_port_hangup"
 [drivers/tty/ttytest.ko] undefined!
Message-ID: <202501310038.tCI4zTmJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   a2ea6ca94c68a7ab616969102e07614d1be0a5a8
commit: 34e336a961ca6b92723a8bed2c79c51e94911942 [38/49] ttytest: add
config: arm64-randconfig-004-20250130 (https://download.01.org/0day-ci/archive/20250131/202501310038.tCI4zTmJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501310038.tCI4zTmJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501310038.tCI4zTmJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "tty_port_hangup" [drivers/tty/ttytest.ko] undefined!
>> ERROR: modpost: "tty_port_close" [drivers/tty/ttytest.ko] undefined!
ERROR: modpost: "tty_port_open" [drivers/tty/ttytest.ko] undefined!
ERROR: modpost: "tty_port_unregister_device" [drivers/tty/ttytest.ko] undefined!
ERROR: modpost: "tty_port_put" [drivers/tty/ttytest.ko] undefined!
ERROR: modpost: "tty_unregister_driver" [drivers/tty/ttytest.ko] undefined!
ERROR: modpost: "tty_driver_kref_put" [drivers/tty/ttytest.ko] undefined!
ERROR: modpost: "tty_port_init" [drivers/tty/ttytest.ko] undefined!
ERROR: modpost: "tty_port_register_device" [drivers/tty/ttytest.ko] undefined!
ERROR: modpost: "__tty_alloc_driver" [drivers/tty/ttytest.ko] undefined!
WARNING: modpost: suppressed 4 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
