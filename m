Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D2DBA3C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 15:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXhvNXha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697123262; x=1728659262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HLY2LcEdCGuStkneq2ZaL0J8vFmtjUGqRP3y2tYxFis=;
  b=TXhvNXhaWBcSNUrpo6GNhWHYwjvEywep/7gDK1colMgaqSKvzkStyps0
   tVx0lCsAw58ejayMQ/Er6nT0uvisdWcH6H7zH4zxymakvKudpLJPvF9XH
   xvZGiYNNDqjpFicBX40rjXRh3ZYbl32BhrZkpoRbXwGWaZA6vLUFDEg+J
   EXZaC6dONq1PaBIzvRYgKZ50kzCOkfYEEWsJXVgzgPp+B7evvFX1SYu+a
   Pt/u92DUNWu5quVvVIFE7x7Pp/Hb05c05nflbTKeWqejQ6q4X+vTGCQf/
   51uRhSLGidgTlLtq/bTE751GFIrmKrxKNg+hf2Q0ylDDJ932sg51XKV/n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="6498448"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="6498448"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 08:06:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="704218979"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="704218979"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 12 Oct 2023 08:06:16 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqxGQ-0003Yb-0U;
	Thu, 12 Oct 2023 15:06:14 +0000
Date: Thu, 12 Oct 2023 23:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 19/38]
 drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:108:42: warning:
 'esp_wowlan_support' defined but not used
Message-ID: <202310122355.B3dduNPU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc5-esp32
head:   c2191d1bd425905e3a6439c28449222848e9ecde
commit: 4bbe55067a282a1a5f7f6021bd8175a9b233c82d [19/38] drivers/net/wireless/espressif/esp32-ng: initial import
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231012/202310122355.B3dduNPU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310122355.B3dduNPU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310122355.B3dduNPU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:108:42: warning: 'esp_wowlan_support' defined but not used [-Wunused-const-variable=]
     108 | static const struct wiphy_wowlan_support esp_wowlan_support = {
         |                                          ^~~~~~~~~~~~~~~~~~


vim +/esp_wowlan_support +108 drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c

   107	
 > 108	static const struct wiphy_wowlan_support esp_wowlan_support = {
   109		.flags = WIPHY_WOWLAN_ANY | WIPHY_WOWLAN_MAGIC_PKT,
   110		.n_patterns = 0,
   111		.pattern_max_len = 0,
   112		.pattern_min_len = 0,
   113		.max_pkt_offset = 0,
   114	};
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
