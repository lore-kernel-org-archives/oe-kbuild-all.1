Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70177EA2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 01:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XaE2ivet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697418203; x=1728954203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GJRN3C4Orml9lTBKA4J9Ve7BO4UcFgdGnqovH9z8RMs=;
  b=XaE2ivet58ThEoUJdPaiCzySyfmHhShT7t//w0L99H+WOCpKmIPNinx6
   ehWbiMgmLZ3O4exJrurgom02RKX4d1fQGQsITGmG9VSJ/FyitadKJ0KyU
   VQ0h+EgWPqEoPqluuluvjtuugWIG5HdjbgkI57+uBDrxye8lJC6glMVrD
   kKNsDQeJGQvzAYIvRXG4DTk3NAnGOqRJExH5mtxKj+AJY6INmp6wtrQGj
   qwRsn+LA4tiGGPRhYPP1BgqBj77J1jieyoqQk3yvYM/LvEcC22I+e6nGc
   43J3e7UxfuJrro4RMybFGVkvIEaexTLtpxdV+C9ZPoUZahl+HCNGJN7gB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="388291328"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="388291328"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 18:03:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="879247111"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="879247111"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Oct 2023 18:03:20 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsC0r-0007zJ-2q;
	Mon, 16 Oct 2023 01:03:17 +0000
Date: Mon, 16 Oct 2023 09:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 69/206] checkpatch: ERROR: code
 indent should use tabs where possible
Message-ID: <202310160917.LvTw3NQg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   c4c1ca0ec7d6b3dcce7304ea88eaaad52f090d90
commit: 513fe54f7475c9b4aa30d8a56f3d43725fe91b1d [69/206] arm64: dts: apple: Add initial t602x device trees
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160917.LvTw3NQg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160917.LvTw3NQg-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:CODE_INDENT: code indent should use tabs where possible
#1090: FILE: arch/arm64/boot/dts/apple/t602x-die0.dtsi:23:
+                <0x2 0x8e10c000 0x0 0x1000>;$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
