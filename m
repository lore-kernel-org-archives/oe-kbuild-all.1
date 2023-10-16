Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162C91A27D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0f/ATPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697446361; x=1728982361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Kiy6BxIz+DtLtRTv+tFWbyd0p8Zuqw5bUswBUX5tbw=;
  b=O0f/ATPRg3NB9t0uxKuBCFskBNCMlbzgBTs/M016nlXgAdrzlnSPdThu
   r/oYb0XaiJGgWeGVV9WZ4T2aB/Fl0sds/d23gRYASOFOfIayYS2rkah68
   hGbXC5aCh4m0tFQhK19x/gcpMFn22V0pbGN6J6W+4+sJ1aWV/lhgvbohw
   Zo4gv/fvGG6Bp/3czyx57hQujcsebnuRwcWXetz782ilbqsV0P0FU7BXS
   dsAbe3BCLrCI1wpuUOJ3CjEeu8NmP8WvdIzOp5vYOMKrzsU1oG6Ffkgv4
   Z8KZRyUmN2GtcNiHC2MdGKtrZX0sCSHSaeBfteLtbkndMtf6B5bOIH516
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="451960046"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="451960046"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 01:52:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="872013083"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="872013083"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Oct 2023 01:52:39 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsJKy-0008Fa-0q;
	Mon, 16 Oct 2023 08:52:35 +0000
Date: Mon, 16 Oct 2023 16:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl:mtk/v6.6/thp7312/fixups 5/5]
 drivers/media/i2c/thp7312.c:1836:20: sparse: sparse: symbol
 'thp7312_fw_prepare' was not declared. Should it be static?
Message-ID: <202310161640.k7xgqReZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.6/thp7312/fixups
head:   e16a701c1ccadbb92d46e6b9004d83f2ba14f3be
commit: e16a701c1ccadbb92d46e6b9004d83f2ba14f3be [5/5] fixup! media: i2c: Add driver for THine THP7312
config: x86_64-randconfig-121-20231016 (https://download.01.org/0day-ci/archive/20231016/202310161640.k7xgqReZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310161640.k7xgqReZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161640.k7xgqReZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/thp7312.c:1836:20: sparse: sparse: symbol 'thp7312_fw_prepare' was not declared. Should it be static?
>> drivers/media/i2c/thp7312.c:1872:20: sparse: sparse: symbol 'thp7312_fw_write' was not declared. Should it be static?
>> drivers/media/i2c/thp7312.c:1916:20: sparse: sparse: symbol 'thp7312_fw_poll_complete' was not declared. Should it be static?
>> drivers/media/i2c/thp7312.c:1927:6: sparse: sparse: symbol 'thp7312_fw_cancel' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
