Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F8E23741
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Dec 2023 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPAN1r3I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701691373; x=1733227373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iap4ZTFSpn/FsRg4pF+EFKebnBz9wjEd5NG/ftOdyvc=;
  b=KPAN1r3IbDwYmJ58RUy/eMoLBO+sq6TiwWeuTGlSeABeqC03t4me0qYi
   B5YZmVRspU5Sjf9yy4GC855dRS7LDWNJfMFluxGFbA/sQp2DwzXBM5GmF
   TsOA7yA1RfsbrAUkSaMhSX/HYid/IOgdVpEq9R+9YK21YxYb/pUv2WPJX
   Nk7TSTj9m5JGezRwpXvITxw+UiSpukaVrOCglgBt6VVwc6uTIExEwmX1v
   uHnd2JDVx2m8NqbecX1U3ickFKuwca3f+Gr3s6l5ouE0sdkrACoGoaRYX
   7t4AvLGHbIsYbakwm/H4Txuz01cFqj61HHtBVGXBVahJ3cZTeDCwUzV26
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="373154158"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="373154158"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 04:02:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="1017826172"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="1017826172"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 04 Dec 2023 04:02:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rA7ey-0007iA-29;
	Mon, 04 Dec 2023 12:02:48 +0000
Date: Mon, 4 Dec 2023 20:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: pm.c:undefined reference to `i8042_command'
Message-ID: <202312041909.lwhcU35R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 7b4537199a4a8480b8c3ba37a2d44765ce76cd9b kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS
date:   1 year, 6 months ago
config: mips-randconfig-r001-20211012 (https://download.01.org/0day-ci/archive/20231204/202312041909.lwhcU35R-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231204/202312041909.lwhcU35R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312041909.lwhcU35R-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64el-linux-ld: arch/mips/loongson2ef/lemote-2f/pm.o: in function `setup_wakeup_events':
>> pm.c:(.text+0x118): undefined reference to `i8042_command'
>> mips64el-linux-ld: pm.c:(.text+0x154): undefined reference to `i8042_command'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
