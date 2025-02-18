Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2006B1A3140
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 04:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739854422; cv=none; b=eRc3f4+WNp4SLbxYEmanMf709ZfLCHfC2es6E+dfnUlxl5CqeiBlBoAj8B0bwFC1lzM8NtRD7yDBGVq09XPzsu/4evLU6gfsCKwoHRZ+ckz65MHa7hQL+YBW8G8Q3syt7GHPraZNhOZSG6Fma2fl/VLseTGqij8MHPMrHScpvPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739854422; c=relaxed/simple;
	bh=zHmfBF/oghzx0CmSE06QujzhAse/xLku0vSAis9lhY0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nsLbahup4AkTE9Mfq3wnsy6FDI/HX6peM1hGkSEgcCKpaF6yzPOmTOa9miX3Ot4Rl9nJC05C7idEySpB6xDwF/mo0pV9b65Z+yBj03azUcu5kcQXj/eZp5GkuROSYUCfQ35HOY6BQJay7t/851pMk9G3UCYdYZkfxTP2I7IIqTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IvXFogWX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IvXFogWX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739854420; x=1771390420;
  h=date:from:cc:subject:message-id:mime-version;
  bh=zHmfBF/oghzx0CmSE06QujzhAse/xLku0vSAis9lhY0=;
  b=IvXFogWX28nzI2jqfxPXiU4Xgr1UNTSV8oDZI2MGXIdbFBOn+0c6ZZJ9
   9L6fJPtZf1uijp45MPLSyZnAolkWEfS/ed0cv4iQYqqNO/L0dxhQEwqFQ
   CSF5vuO5KxSFuwWKaQCsOgpWUyLuUbFU0a5nSgOzFOaOxFd9p67+UeU4M
   Ug9ehM2TC5KWINzIpHYWgl39wuVBUd/z1ul/7VJ7jA+z+7DuFMBBTAHtX
   HhfsafNqO3a7U40iiwsKVgYwzY9/Xmf5N6W/z32YUTlKQ/J1qsoTjoBXW
   dYoql8yM1zu6IDLp09JpEjJk6Pw7hiJvViCgu9hybMgBtbUqb5yfEacG8
   Q==;
X-CSE-ConnectionGUID: cd9iti3hQymbjAUiwiPSww==
X-CSE-MsgGUID: W4oVdtfyStGuibWx/kQDYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40403597"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="40403597"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 20:53:39 -0800
X-CSE-ConnectionGUID: lUkftwyWR6GnFNu8nN8D+g==
X-CSE-MsgGUID: LKT5cTt1Q9mEbDf4Qkjlsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118415512"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2025 20:53:38 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkFbw-0000BN-0w
	for oe-kbuild-all@lists.linux.dev;
	Tue, 18 Feb 2025 04:53:33 +0000
Date: Tue, 18 Feb 2025 12:53:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] drivers/clk/mediatek/clk-mt8516.c:234:27:
 warning: 'ddrphycfg_parents' defined but not used
Message-ID: <202502181229.Jkue825l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fabien,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: db077febb774b400cff461195106c1ea320497a4 [1/1] clk: mediatek: add clock driver for MT8516
config: x86_64-buildonly-randconfig-005-20250217 (https://download.01.org/0day-ci/archive/20250218/202502181229.Jkue825l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502181229.Jkue825l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502181229.Jkue825l-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/mediatek/clk-mt8516.c:234:27: warning: 'ddrphycfg_parents' defined but not used [-Wunused-const-variable=]
     234 | static const char * const ddrphycfg_parents[] __initconst = {
         |                           ^~~~~~~~~~~~~~~~~


vim +/ddrphycfg_parents +234 drivers/clk/mediatek/clk-mt8516.c

   233	
 > 234	static const char * const ddrphycfg_parents[] __initconst = {
   235		"clk26m_ck",
   236		"mainpll_d16"
   237	};
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
