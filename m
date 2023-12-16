Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C951095B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 02:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OePEusbH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702692719; x=1734228719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d+7Gi/e8np/nNKAVpyFu6yndYlenWqczNp7HDNjQuGU=;
  b=OePEusbHv/0zSDK4QSl8yCVq9dBx+cRXX3HgOQiutURO4cdk+vmQmyJB
   PYvxvh/t7PrE+mcD/1GMJlb1+IwZg+e+mMJdCv5d2fOv1E2QH7gPh69WK
   t7tCdJoZIQwglUabZ2hOL7rgfWv8okQo1moKv35WWNOy1u8XyOkvESf+6
   qSRLZctMz935SV3Db2KKRKwPfKkvAPcfaRaoXrPZXCTXPRkvh4hv0ij0Y
   mckkNeBwTbWmjGRS58tYB18HBYWDR9LJszkfLK48JtGZaxHC7rAM5ljgf
   Ft9/xFH9Cs48NTNJ+PMDaGaZvPTv18NPGwCP/QVwmBD6phu95UE0KpyBu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="375505176"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="375505176"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 18:11:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="778470047"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="778470047"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Dec 2023 18:11:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEK9f-00012M-17;
	Sat, 16 Dec 2023 02:11:51 +0000
Date: Sat, 16 Dec 2023 10:11:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>, Kees Cook <keescook@chromium.org>
Subject: scripts/kernel-doc:
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c:37: warning: Excess
 struct member 'data' description in 'brcmf_fweh_queue_item'
Message-ID: <202312161035.TqxHqpc9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3bd7d748816927202268cb335921f7f68b3ca723
commit: 62d19b35808816dc2bdf5031e5401230f6a915ba wifi: brcmfmac: fweh: Add __counted_by for struct brcmf_fweh_queue_item and use struct_size()
date:   9 weeks ago
config: arc-randconfig-002-20231215 (https://download.01.org/0day-ci/archive/20231216/202312161035.TqxHqpc9-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312161035.TqxHqpc9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312161035.TqxHqpc9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kernel-doc: drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c:37: warning: Excess struct member 'data' description in 'brcmf_fweh_queue_item'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
