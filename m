Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932851917D0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741253731; cv=none; b=rG7jh+dgzjt5I61nD25lglEYEpcWCh+9Y4dHKHPEeiHvIVdUQQuT6QTx2heGAdF9QHaIL69lSqwUeR7Q9ku1M/mb6yhjUVC8w0Ha/TSuKodvabLZqzXVjPtqUgAKBiUUqWPTYrJ5n3N2Pm2wvl9eV76CurV0r5pQ87RU+zkd+kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741253731; c=relaxed/simple;
	bh=qHaob6+RUoWxKhb4FNc8vsDtZuqr9g2HMYSWkk0Tuig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DgCGo1pNjDO7zjdAysNzVAznOCGpFGxahlyckbwn4gLjPLusORf3dPKFuCmEZsjG+zJ6F9p17LjqXrr1Tua1j87dbmbwPAkOLfwHMtxmizCtXbtL5aHRlRaQC9YMnC4tpaGwgg/vUNp8lKh//76EkN83LKXR/+Ntz46gOm3jQLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lktHa/tg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lktHa/tg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741253730; x=1772789730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qHaob6+RUoWxKhb4FNc8vsDtZuqr9g2HMYSWkk0Tuig=;
  b=lktHa/tgVD2G7+nmIUEeVkAjNtbAWzuatzR7JD3lKKZcr5mA4vIdmUN7
   DQR2XmXY/QpuaXN/kc9CMg/K+0dCf8k8TEB5EtFnNySn3ym19x3+l2vD5
   QZsaUVB6/9DNl5Xr/iO1pxVxFwGY91FgBRbDGoQ68qFCVU+KIP6tM8HZx
   apwtRoUeiFMIwf3YSQY8U7NMxNF1TH6aNOnDbD//RVDF8x7dTvpGAvVbR
   BzyLPBw+0dMricgxApozlE9B/fHE8zZmcFDb5ywRKsZEqmVWBJYVzPhx6
   9nBmtarORZRZvmYM5ywjaBOZ10vNfPAk9w1sxiGBoBYokVQME5rZwkJUi
   g==;
X-CSE-ConnectionGUID: txPWGLwyQHuyC9KaTfij4Q==
X-CSE-MsgGUID: B+l1a5KeRbaRhiHNQzOa3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64700849"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="64700849"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 01:35:29 -0800
X-CSE-ConnectionGUID: KVXK8/L5Q6C9AYYBW4Ybrw==
X-CSE-MsgGUID: 6zZBehwNQ5aXStKqyNM5YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="119470466"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2025 01:35:27 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq7dV-000MqY-26;
	Thu, 06 Mar 2025 09:35:25 +0000
Date: Thu, 6 Mar 2025 17:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [broonie-sound:for-next 4/7] sound/soc/codecs/cs42l43.c:2405:12:
 warning: 'cs42l43_codec_runtime_force_suspend' defined but not used
Message-ID: <202503061702.WLN1jGJb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   989180be7182f518e3cc7c8057c6c23ffd6ddf47
commit: 164b7dd4546b57c08b373e9e3cf315ff98cb032d [4/7] ASoC: cs42l43: Add jack delay debounce after suspend
config: nios2-randconfig-001-20250305 (https://download.01.org/0day-ci/archive/20250306/202503061702.WLN1jGJb-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061702.WLN1jGJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061702.WLN1jGJb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/cs42l43.c:2405:12: warning: 'cs42l43_codec_runtime_force_suspend' defined but not used [-Wunused-function]
    2405 | static int cs42l43_codec_runtime_force_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cs42l43_codec_runtime_force_suspend +2405 sound/soc/codecs/cs42l43.c

  2404	
> 2405	static int cs42l43_codec_runtime_force_suspend(struct device *dev)
  2406	{
  2407		struct cs42l43_codec *priv = dev_get_drvdata(dev);
  2408	
  2409		dev_dbg(priv->dev, "Runtime suspend\n");
  2410	
  2411		priv->suspend_jack_debounce = true;
  2412	
  2413		pm_runtime_force_suspend(dev);
  2414	
  2415		return 0;
  2416	}
  2417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
