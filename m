Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F4431A7A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 17:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CzipCFkw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697476764; x=1729012764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z2qunwpzs4Mxmd9js9BePT5EkG0PiYVTm6XlqTK38Yc=;
  b=CzipCFkwvYSQQhBT7kMAdTQONvmNdidB/8U2PldyrOpvdff9W9k567uz
   kPnckxfyYstEqLMT2d/K4YuNV/iFO0qEHb7cldznV6JmmX1emtOtUq5yA
   3qGLlY4x9kewJ1+HWhuG2jI9YtEJrED9sfLQ3XdwK7CiZF0a8R1MAEwUs
   u01jsaZ4q3s9lSxrhrIHsxICmqHQJp89/CdfP9J+NH8qJbskT5AOvmYml
   /iY3kbYuynGcjWHjQU81ewV5EZ8751xzhZNZvVT9cBv1d7Pqs3GCgB1qJ
   /lm/8/PHnJBgQ6ZiDSiew9q+JNTdu1eINTrzh1zDl2wgWQfAwN4MQZo0/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="370667760"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="370667760"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 10:13:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="879493732"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="879493732"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Oct 2023 10:13:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsRA5-0008Ww-1k;
	Mon, 16 Oct 2023 17:13:50 +0000
Date: Tue, 17 Oct 2023 01:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/cpus_have_const_cap 2/38] checkpatch: WARNING:
 Possible repeated word: 'the'
Message-ID: <202310170148.YYk66Mvf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/cpus_have_const_cap
head:   e8d4006dc24e66105444715d6d5daa244aa2bdec
commit: 20f3b8eafe0ba5d3c69d5011a9b07739e9645132 [2/38] arm64/arm: xen: enlighten: Fix KPTI checks
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170148.YYk66Mvf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170148.YYk66Mvf-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#28: 
CPUs before KPTI is subsequent enabled, resulting the the problems the

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
