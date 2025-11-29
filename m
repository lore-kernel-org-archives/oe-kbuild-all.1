Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3088A1D5141
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 06:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764398034; cv=none; b=PgGclIV1jk/ykOTmRiwF+Mi+W+2hmf102JOpwt6VafbFZ2Eei3kEMFOWn0rwa+ukfiZFNEbto0doSdx7ETRpa3/kRohYlM8oSo03XLLEURDbWvPSy1K4c2eO82/cET3iUwEzk4q5X2p2ZICp2XQgO13lbMP5Wpp4D9+mERbSfqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764398034; c=relaxed/simple;
	bh=1i1lkz230O3GBJCEoKPYYcukH7uzRTRTnZyyKMYOfEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dFZ0b5zv5XtaKKFyNHtmPvoyxqjfqDLuklHrkOZwrKgM1DP1E2FzTM4KOJzoJRVOXeik3yZbHThUoJxeeN/PclngJGb+3FRa/hWclrNosdbcLB7LL2b0NN2Czlo6jhIIOCh04m6eS0MCHZZNiNUYIgTCkQG+iJdUIO1DCApoS/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y0wKI7wJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y0wKI7wJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764398033; x=1795934033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1i1lkz230O3GBJCEoKPYYcukH7uzRTRTnZyyKMYOfEY=;
  b=Y0wKI7wJ+RtYkk5fB3nQ778SilRCclp9tEqf4vmlYHB2t//evUX7fr0q
   KUd+aLNjL/4g9Xv0GeSbNvJBn87drxT/bVgcoVfApuXHQMAVwZB+GS9/T
   asE6XHDd1a7YT2OGAUKhKyoN0gfH5xWH1uR1MXYidJJmrq45NfV0vI5LY
   V5wyMPrfXrH6QyD4ok/RWuIFDmrjndKMTjkBYcRdQUh31M4Ora0IRgCFP
   9LXRKOUFLK3R5esQm5Y3AV7Xk273a8CR/eD7NPW9GM7+pJ8MWZr8c+0ph
   JaSjP1Gyxy4rB/wmv7dx/1mITilc3WAGpAWpoICsJ1pZHPZRZswcKWVYi
   A==;
X-CSE-ConnectionGUID: BHUzWfWcTFmihrbZHPMWmg==
X-CSE-MsgGUID: 0xj5/ad3TZy4YG70QIdAZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66300278"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="66300278"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 22:33:53 -0800
X-CSE-ConnectionGUID: jMRP5pbUQhyozPsl1hTZ5w==
X-CSE-MsgGUID: /8FGYwJbQeaHzP33/pQgxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="193269728"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Nov 2025 22:33:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPEWj-00000000713-2T3A;
	Sat, 29 Nov 2025 06:33:49 +0000
Date: Sat, 29 Nov 2025 14:33:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: [morimoto:renesas-lts/v6.18-rc7-2025-11-28-x5h-ironhide-2 21/36]
 drivers/mfd/rcar-mfis.c:125:32: warning: cast from pointer to integer of
 different size
Message-ID: <202511291444.X7ETG95W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc7-2025-11-28-x5h-ironhide-2
head:   3aa250dd3d8e5d5146a9d921c8a3e886ba782615
commit: d0a07af25dae370bad25d0dd03997f8bd0bfd5c2 [21/36] mfd: renesas: Support MFIS driver
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251129/202511291444.X7ETG95W-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511291444.X7ETG95W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511291444.X7ETG95W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/rcar-mfis.c: In function 'mfis_probe':
>> drivers/mfd/rcar-mfis.c:125:32: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     125 |         priv->unprotect_mask = (u64)of_device_get_match_data(dev);
         |                                ^


vim +125 drivers/mfd/rcar-mfis.c

   114	
   115	static int mfis_probe(struct platform_device *pdev)
   116	{
   117		struct device *dev = &pdev->dev;
   118		struct mfis_priv *priv;
   119		int ret;
   120	
   121		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   122		if (!priv)
   123			return -ENOMEM;
   124	
 > 125		priv->unprotect_mask = (u64)of_device_get_match_data(dev);
   126	
   127		ret = mfis_reg_probe(pdev, priv,
   128				     &priv->common_reg,
   129				     MFIS_RES_NAME_COMMON);
   130		if (ret)
   131			return ret;
   132	
   133		ret = mfis_reg_probe(pdev, priv,
   134				     &priv->mbox_reg,
   135				     MFIS_RES_NAME_MBOXES);
   136		if (ret)
   137			return ret;
   138	
   139		return devm_of_platform_populate(dev);
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
