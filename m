Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02F91F61D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZlM4IKU6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697479035; x=1729015035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kCZudIuVFBOVY5CGiX/oLm2t9hwJLFtFBkdRKRXrcuE=;
  b=ZlM4IKU6mxAULWcFYh7REhTk+RJvzFoBrxKIdRcSi/YV3O5HUVdX3UrU
   Jq+RdU1kgr/ZX89TYKcsS+diNDEjr+5H4QVUL69YhESJzGFhCih8pdkfO
   /Y7HjgoUQDN1QU3vorWr/5hT9xuLM+9jcVqEBqrQaor9puVLzdHpy/MH9
   5s4WCqm0k8GJNUx4QBA074zFbF8QEeMSWctOo4Zv3TvamxFer6FTPIxY0
   +5lZr39Z/B51HAhWhaGZkCuiHHv/znnL6Hera37irRu035Qg4PGzXn2LZ
   VKCpdeWw8Hb5hP3kAWnQMtnifL0/dS7XXwakcLEYKivx4m6vFJNN9pS4j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="452085226"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="452085226"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 10:57:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="899611404"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="899611404"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2023 10:55:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsRq3-0008YZ-2E;
	Mon, 16 Oct 2023 17:57:11 +0000
Date: Tue, 17 Oct 2023 01:56:22 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm:zii 74/95] checkpatch: WARNING: Missing or malformed
 SPDX-License-Identifier tag in line 1
Message-ID: <202310170145.YDRcO3aw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   2f66b63fb7aeb8a745eab7e54eb1228cc50ee85f
commit: 3b2854aaf784a8ffc92708237dcb2c8dec10f4f9 [74/95] net: sfp: display SFP module information       [*not for mainline*]
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170145.YDRcO3aw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170145.YDRcO3aw-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#39: FILE: drivers/net/phy/sff.c:1:
+#include <linux/kernel.h>

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#159: FILE: drivers/net/phy/sff.h:1:
+#ifndef SFF_H

WARNING:LINE_SPACING: Missing a blank line after declarations
#395: FILE: drivers/net/phy/sfp.c:2338:
+		char len[16];
+		dev_info(sfp->dev, "  Copper length: %s\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
