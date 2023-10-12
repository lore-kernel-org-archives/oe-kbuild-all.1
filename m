Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014D12AB53
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 16:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKTvplNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697129749; x=1728665749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vo/8++lnQIIRVVncuzSliSyhY7tGpFJX7hf73/S408Y=;
  b=XKTvplNp432bLv82yWG/+BDntBa9kFFV1OqSo8hTOAbRCqmRNFRehKxm
   4j658aIRT5zFQb5k2fjwwcAXoJPi3u7uf1zPM+6GlXXKQ7VbPBpYAO/q3
   PwEA9Hy7RRJAG0yyHuqttMw0E0rc1M299+UHyGlXnyy7Za8icvOEMyOz3
   2Po8SgeRbj65uLhIfN2lKk+pGMDeUlaJajUX4Qa504hH4+nBdtAd1sqrG
   32RK9+yOWjR0mhOF8N5azhY92i9nU4MnEAAnla3XnkAgWBsrHkURAUnLB
   bKcyNrHL9BiauGQdnLvbPN3nnl3TngO84OtbWtSeC7bGHrT+SBj7jY0P9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="370046691"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="370046691"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 09:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="928067046"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="928067046"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Oct 2023 09:55:47 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqyyO-0003fD-3A;
	Thu, 12 Oct 2023 16:55:44 +0000
Date: Fri, 13 Oct 2023 00:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm:zii 73/94] checkpatch: WARNING: Missing or malformed
 SPDX-License-Identifier tag in line 1
Message-ID: <202310130012.CJHHbZ27-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   6f5d2f0af9152dabd1cf8a2d23196fe28d88bc18
commit: fc2a639129dd591ac464c365d34ce23eb3faf405 [73/94] net: sfp: display SFP module information       [*not for mainline*]
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130012.CJHHbZ27-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130012.CJHHbZ27-lkp@intel.com/

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
