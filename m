Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472956D19
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Oct 2023 07:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVbkCwr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696577619; x=1728113619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oUl+vwf7Z+/eSnCAGwBQq/dCQLu7m/mBTQwSatI7DEw=;
  b=aVbkCwr+djWyccf4Je8f71qlywqMLF5SjRjNPIfOn05DJ0HK3JprgKpK
   5/kmBpsZDNxAVNedjCeGLP7n8NCAoqrMWcmtCLKZ7hKyjTnA3z6aF0sRI
   30UVuv0iaIBW3oRgcv6bYYu7scTKDyK/n6g0/HZY3XfASZVLTSoF8ZrRe
   Kx/+htooWGzCUXAngt6Y/dZRjMYDB79KKzyj6xvaORMXTQa1xb4kdAprf
   8zU2aZNSGovfy7th2h3RrZUZ/Ldfv7My6A5+qjYVbUG7yvSUGNeDzEahX
   KvTS5XZ53VYy3t0+t+MCrP8lnMIeLIew4v/KPxoGjzAV+Mqy5kMU8CT4k
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363055247"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="363055247"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 00:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="817926005"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="817926005"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 06 Oct 2023 00:33:37 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qofL4-000MNo-2U;
	Fri, 06 Oct 2023 07:33:34 +0000
Date: Fri, 6 Oct 2023 15:33:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9982/9984] ERROR: start_text address is
 c000000000000800, should be c000000000000200
Message-ID: <202310061532.jb7umkb1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f0fe5040de5e5fd9b040672e37725b046e312f0
commit: cf10b86c9096df9fd9b424c08fcdb2e56e5b9a5e [9982/9984] Merge branch 'for-next/kspp' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
config: powerpc64-buildonly-randconfig-r005-20211221 (https://download.01.org/0day-ci/archive/20231006/202310061532.jb7umkb1-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310061532.jb7umkb1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310061532.jb7umkb1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: start_text address is c000000000000800, should be c000000000000200
   ERROR: try to enable LD_HEAD_STUB_CATCH config option
   ERROR: see comments in arch/powerpc/tools/head_check.sh

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
