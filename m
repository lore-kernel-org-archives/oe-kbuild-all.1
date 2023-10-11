Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE5C803
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 01:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQE2Nkmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696986844; x=1728522844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o4RXXphRHffqAyqme3WH+Gja7pXQoOSwUVnu4+2wwAQ=;
  b=CQE2Nkmp03ptjxMjhyzWOz4yEpxRaNpC99eXCsC5XLy3tdwB04tPP0Og
   t7uVQiHJNwb0FofWe2Kb/ZYdLAp7bRZ13BAMAGjk6b37AIjfRMM0TOHug
   1kd+qvop7Ggw2Mu1uyXdvO0k6WggjY38GKErSVOFpakT4bB/E2ABdcsgq
   w2m7P6i0oXWt8lIG8XBXok85EuovIdXhPV2vog/jO0tkI7/waZlvalMMy
   tiLi5iMNsoCSAg5KpoYt6B1h6jhjnubANZnO+0Xgz9hXhMTazXp2DdDpi
   Gn9FfvM+2Xlkt1rkaxnfO5WJ6HqEIwYXOX8VhxwAlMoKEv3prxhxHAsyG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387395674"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="387395674"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 18:14:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="783067101"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="783067101"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Oct 2023 18:14:02 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqNnU-0001UC-1P;
	Wed, 11 Oct 2023 01:14:00 +0000
Date: Wed, 11 Oct 2023 09:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lwn:docs-mw 26/27] checkpatch: WARNING: Possible repeated word:
 'run'
Message-ID: <202310110924.c5TvaXJR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.lwn.net/linux.git docs-mw
head:   1fae02e7eb99fa8feba18ce444d8ce3546e6010e
commit: f1477dbfa5623a2738dbee77f4453f4d2519a103 [26/27] docs: add backporting and conflict resolution document
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310110924.c5TvaXJR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110924.c5TvaXJR-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'run'
#310: FILE: Documentation/process/backporting.rst:258:
+However, if you were to run run ``git diff`` without any arguments, the

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
