Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077E210944
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 08:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9jj6a7a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702887764; x=1734423764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iA1kHz4wxnmDxu+/tIS0igZWZKW3FUULHA7xFRCLjgU=;
  b=I9jj6a7aieDLhkp3SSJgw2jC1nSqeENZj2DJ2aJCbKfHV+aE509U3X0m
   Y6RjA3tkDiJfm8nN/EkuhOsTKswUMWKWkDeKlpU9/cWv+Iun8SXjrwu33
   2Khur7jNA3heGBxRsq39veUIuaxvInzGlnI81HQOyb/cN4Vw13gplKE8b
   /y0XC1f55fIQVk93XrEHUu10NQPWVXMzqrbN/wtTcIh22EfWnbkYOEM7t
   3wij63Gjuh4pM4GM19eXgwSXidjwFJfZ0B+ngGLco4yYxLzhts8WGsqgf
   Pp7GKHPnyXR8nZyqDjZB3eMFyaAcXDt0P/KaQ9zYRyeC0LPtBgWfhDNC5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2325155"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="2325155"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 00:22:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="919175593"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="919175593"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2023 00:22:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF8ta-0003ul-0A;
	Mon, 18 Dec 2023 08:22:38 +0000
Date: Mon, 18 Dec 2023 16:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: scripts/kernel-doc: fs/ubifs/file.c:1385: warning: Excess function
 parameter 'time' description in 'ubifs_update_time'
Message-ID: <202312181655.uTLcappp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ceb6a6f023fd3e8b07761ed900352ef574010bcb
commit: 48ec6328de6c153a64474d9e5b6ec95f20f4142b ubifs: Fix some kernel-doc comments
date:   7 weeks ago
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231218/202312181655.uTLcappp-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312181655.uTLcappp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312181655.uTLcappp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kernel-doc: fs/ubifs/file.c:1385: warning: Excess function parameter 'time' description in 'ubifs_update_time'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
