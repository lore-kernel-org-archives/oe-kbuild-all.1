Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D09182
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 02:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GyL6LAoV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697857185; x=1729393185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wqpBetppanb6XVS9GysHvYqbce7J0kqzkHgV0uypAV4=;
  b=GyL6LAoVDCz/J6HPl54gzPBCqxSY4P+hMF8LrAqhO94+Ej425zAhK+9n
   XLya2C3yzKW28a7B9sxTmQF8SMsc6O1pddFGpbsyPfHJNKgiMKf4kACfk
   6/rpE+nrNghvuR5fqChEhBCM1TwoWx9K9Hw9QK5Zy/Eq+sNlvay2S9Wn5
   ajWY3qS4XWBiOtDtBSNRUKaIAezgax1gVCWkHV1Zg8/knBbiE8CfyrECq
   JhhWY+d8JtpZy999ZCsh3hl5pWQtZxh0jZW2E5nYS0v/REVjUDQDIENha
   o2d04ueos1gNlBNe1FE9Yyd6oL2EbPd32pljzJCBGKOeqI+S6Xbv85sfd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="376983619"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="376983619"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 19:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="1004769622"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="1004769622"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Oct 2023 19:59:43 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu2DF-0004JW-0m;
	Sat, 21 Oct 2023 02:59:41 +0000
Date: Sat, 21 Oct 2023 10:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sre-misc:uti260b 3/23] drivers/media/i2c/gc0308.c:1262:27: warning:
 'gc0308_effects_menu' defined but not used
Message-ID: <202310211016.17NOs8xw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git uti260b
head:   24e8ee6daed2ebc37fcd46a174e990656480a107
commit: b93f15ae7f498a80e8cd27c8e99df0ea16a66df9 [3/23] media: i2c: gc0308: new driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231021/202310211016.17NOs8xw-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310211016.17NOs8xw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310211016.17NOs8xw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/gc0308.c:1262:27: warning: 'gc0308_effects_menu' defined but not used [-Wunused-const-variable=]
    1262 | static const char * const gc0308_effects_menu[] = {
         |                           ^~~~~~~~~~~~~~~~~~~


vim +/gc0308_effects_menu +1262 drivers/media/i2c/gc0308.c

  1261	
> 1262	static const char * const gc0308_effects_menu[] = {
  1263		"Normal", // V4L2_COLORFX_NONE = 0
  1264		"Grayscale", // V4L2_COLORFX_BW = 1
  1265		"Sepia", // V4L2_COLORFX_SEPIA = 2
  1266		"Color Invert", // V4L2_COLORFX_NEGATIVE = 3
  1267	};
  1268	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
