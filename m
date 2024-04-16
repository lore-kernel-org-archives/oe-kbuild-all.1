Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2E2132C16
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 17:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713288267; cv=none; b=nyKCsp7YIynM4/aFFHWnBs79q3B3VGtUFm0XxD/kMH3RNtqD2xAquu3J+AEL3/BXduJv73ksYpN3XP26TvCTl3wic5CM5EP/uOBcvK+4i2E/cRuinprkF0lmC31AGj5dCfXVYAeA0WJUkqO/O/g20TZIBm1pQbBPRQKqbZVP7Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713288267; c=relaxed/simple;
	bh=bmxpwiyf2ZiUDMgL9Dy0hbuZ8mUP+UFOXbQMJpIwP0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IKLYmFajbTf+e+JKFS/tdZORqFawJA3IW1tcTawQdjKfHWJjzEL9WapaxpZQWA15g1NpU2NQI8SttJfsgOuKVKq01mjw0zax0L8/jW5u9QUuHFMj/Ramanihehj7oBaSTxRhKuMn/AQIDSE/ytYx+wMk3nugaUxe9xHPcGf/tf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BOXowVJ7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BOXowVJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713288266; x=1744824266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bmxpwiyf2ZiUDMgL9Dy0hbuZ8mUP+UFOXbQMJpIwP0k=;
  b=BOXowVJ75MK2+TujaqQXMTGbVJ/LvuJSKQsnTZTFacBLP4um3SeWeN8P
   qr0fsQbYUxAWQWX7kt97N+EraKHAF1KH8MuDG9XTwXcyJPY35owXMDd2q
   fRjUMkhJ/0eMoy0auGPAVrVv8CE2ntY0ecJlnVFhvt+QsvPipNFaoPyIE
   4xe/KcX75DWkhRm12neVRRf0dqNDdwC/zCTKoxL9R0i4URoEyzNI8oa9y
   28NSAEI8NDuPpzPcCtIcBwqB7WE76PMYjO2hZCak0d4sTPl1Azvuk6E8y
   nrHNPLAK666/hWZ53LAfFwCdtPKhy+ehwwdM+lHFCYzidtrZVlA8uX5TA
   Q==;
X-CSE-ConnectionGUID: hPynQWpMSc6SfB8qgzKYow==
X-CSE-MsgGUID: IpMclgcHRFWlZiHSIL7Xpw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19453513"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="19453513"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 10:24:25 -0700
X-CSE-ConnectionGUID: Y1hiaMoqQ+KwKw/dZkRhCQ==
X-CSE-MsgGUID: xHqv+KvJSTWEDawqnpRKtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="26902387"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 16 Apr 2024 10:24:23 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwmXd-0005c0-2I;
	Tue, 16 Apr 2024 17:24:21 +0000
Date: Wed, 17 Apr 2024 01:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: John Watts <contact@jookia.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v5_20240416_angelogioacchino_delregno_asoc_cleanup_mediatek_soundcard_machine_drivers
 67/85] sound/soc/sunxi/sun4i-i2s.c:1103:57: sparse: sparse: incorrect type
 in argument 3 (different base types)
Message-ID: <202404170103.ySYwieqi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v5_20240416_angelogioacchino_delregno_asoc_cleanup_mediatek_soundcard_machine_drivers
head:   787f190cd1cd3123555e33a3400f3e919ec94a81
commit: 863f94ac5f4481a7c5665e8152d551701ac71bf3 [67/85] ASoC: sunxi: sun4i-i2s: Support 32-bit audio formats
config: loongarch-randconfig-r123-20240416 (https://download.01.org/0day-ci/archive/20240417/202404170103.ySYwieqi-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240417/202404170103.ySYwieqi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404170103.ySYwieqi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/sunxi/sun4i-i2s.c:1103:57: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long [usertype] mask @@     got restricted snd_pcm_format_t const [usertype] pcm_formats @@
   sound/soc/sunxi/sun4i-i2s.c:1103:57: sparse:     expected unsigned long long [usertype] mask
   sound/soc/sunxi/sun4i-i2s.c:1103:57: sparse:     got restricted snd_pcm_format_t const [usertype] pcm_formats
>> sound/soc/sunxi/sun4i-i2s.c:1361:35: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted snd_pcm_format_t [usertype] pcm_formats @@     got unsigned long long @@
   sound/soc/sunxi/sun4i-i2s.c:1361:35: sparse:     expected restricted snd_pcm_format_t [usertype] pcm_formats
   sound/soc/sunxi/sun4i-i2s.c:1361:35: sparse:     got unsigned long long
   sound/soc/sunxi/sun4i-i2s.c:1380:35: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted snd_pcm_format_t [usertype] pcm_formats @@     got unsigned long long @@
   sound/soc/sunxi/sun4i-i2s.c:1380:35: sparse:     expected restricted snd_pcm_format_t [usertype] pcm_formats
   sound/soc/sunxi/sun4i-i2s.c:1380:35: sparse:     got unsigned long long
   sound/soc/sunxi/sun4i-i2s.c:1404:35: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted snd_pcm_format_t [usertype] pcm_formats @@     got unsigned long long @@
   sound/soc/sunxi/sun4i-i2s.c:1404:35: sparse:     expected restricted snd_pcm_format_t [usertype] pcm_formats
   sound/soc/sunxi/sun4i-i2s.c:1404:35: sparse:     got unsigned long long
   sound/soc/sunxi/sun4i-i2s.c:1423:35: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted snd_pcm_format_t [usertype] pcm_formats @@     got unsigned long long @@
   sound/soc/sunxi/sun4i-i2s.c:1423:35: sparse:     expected restricted snd_pcm_format_t [usertype] pcm_formats
   sound/soc/sunxi/sun4i-i2s.c:1423:35: sparse:     got unsigned long long
   sound/soc/sunxi/sun4i-i2s.c:1442:35: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted snd_pcm_format_t [usertype] pcm_formats @@     got unsigned long long @@
   sound/soc/sunxi/sun4i-i2s.c:1442:35: sparse:     expected restricted snd_pcm_format_t [usertype] pcm_formats
   sound/soc/sunxi/sun4i-i2s.c:1442:35: sparse:     got unsigned long long
   sound/soc/sunxi/sun4i-i2s.c:1461:35: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted snd_pcm_format_t [usertype] pcm_formats @@     got unsigned long long @@
   sound/soc/sunxi/sun4i-i2s.c:1461:35: sparse:     expected restricted snd_pcm_format_t [usertype] pcm_formats
   sound/soc/sunxi/sun4i-i2s.c:1461:35: sparse:     got unsigned long long
   sound/soc/sunxi/sun4i-i2s.c:1480:35: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted snd_pcm_format_t [usertype] pcm_formats @@     got unsigned long long @@
   sound/soc/sunxi/sun4i-i2s.c:1480:35: sparse:     expected restricted snd_pcm_format_t [usertype] pcm_formats
   sound/soc/sunxi/sun4i-i2s.c:1480:35: sparse:     got unsigned long long

vim +1103 sound/soc/sunxi/sun4i-i2s.c

  1096	
  1097	static int sun4i_i2s_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai *dai)
  1098	{
  1099		struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
  1100		struct snd_pcm_runtime *runtime = sub->runtime;
  1101	
  1102		return snd_pcm_hw_constraint_mask64(runtime, SNDRV_PCM_HW_PARAM_FORMAT,
> 1103						    i2s->variant->pcm_formats);
  1104	}
  1105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
