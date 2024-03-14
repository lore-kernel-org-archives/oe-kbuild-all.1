Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3862581
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 12:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710419551; cv=none; b=eBc8sOug1FYrdNRGM+MfhUAHTx2yTZ/DbgDaaAWSDPSkC8f+6LdaG7y0KtpcYr6oeK5d2f7a97KHaI3aVe6YPtJ6qQrpO7nY0Mgz/95DIBwxC8fJwAhAeK7mEAEkMO1IEztY4IaXqvGBBnS6F9s4k0/tlAOdyJUnQBgAbeEd3/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710419551; c=relaxed/simple;
	bh=8zTR0ntiMrJsnrrQ+2c6dxqFRg+P8y4EbjcWD6BLf0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MlY2d/6rZoICUGbD1wPJDj46Y5qu3h85Wr+VnuGn3Ox8UtTVsF/JgUcfSldTnxQgbj2xsDSvJgUaQhpaG13MW62Nwr50nlviSFsO9M1GTYhIs20dsREN0+EKzNdFQGMoH0s0ZfPvQPjs3wBcu4kxzgn+yYGMzzU85z0hy0cIznI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWP2A6s9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWP2A6s9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710419549; x=1741955549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8zTR0ntiMrJsnrrQ+2c6dxqFRg+P8y4EbjcWD6BLf0M=;
  b=GWP2A6s9auuTffQzRwjIQP7R3qJq02yIgJmwCzzqOYX/2OkDLWRosd7i
   pmQAERunCAzfrowj15qZHH0wQf5y9M7o2dXGFM+wVSyBnL/d4dtT8+bx8
   jVSTgukTss9XH5jm7mPwU5FphVK4ncxh4XXPM0ApLlI0nfaoEjcNheSjr
   FcvT2V6MswzcYrYcguvjttts2gQ0AVcPm/j7U65v7jTlErybDxg3guoge
   66BIB4PFziO2dSHMXzuEQO1LjDFfrhnKiu3r4ESlvxA4QeiozcdJskl0A
   jA3OZKPGku53OC+z/MsG/wGlBFSKjPiVUbnvhKAhfcCZHn5X1WSanJWfO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="8170440"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="8170440"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 05:32:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="12345915"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Mar 2024 05:32:27 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkkG0-000DP3-2L;
	Thu, 14 Mar 2024 12:32:24 +0000
Date: Thu, 14 Mar 2024 20:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8475/13571] sound/core/pcm_native.c:4106:5-11:
 inconsistent IS_ERR and PTR_ERR on line 4107.
Message-ID: <202403142014.H8ciGzs8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9bb9b28d0568991b1d63e66fe75afa5f97ad1156
commit: ae921398486419c6284d70bd8332eb7edbdb4f70 [8475/13571] ALSA: pcm: Use automatic cleanup of kfree()
config: x86_64-randconfig-103-20240314 (https://download.01.org/0day-ci/archive/20240314/202403142014.H8ciGzs8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403142014.H8ciGzs8-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/core/pcm_native.c:4106:5-11: inconsistent IS_ERR and PTR_ERR on line 4107.
   sound/core/pcm_native.c:864:5-11: inconsistent IS_ERR and PTR_ERR on line 865.
   sound/core/pcm_native.c:4077:5-11: inconsistent IS_ERR and PTR_ERR on line 4078.
   sound/core/pcm_native.c:573:5-11: inconsistent IS_ERR and PTR_ERR on line 574.
   sound/core/pcm_native.c:3287:5-11: inconsistent IS_ERR and PTR_ERR on line 3288.

vim +4106 sound/core/pcm_native.c

  4093	
  4094	static int snd_pcm_hw_params_old_user(struct snd_pcm_substream *substream,
  4095					      struct snd_pcm_hw_params_old __user * _oparams)
  4096	{
  4097		struct snd_pcm_hw_params *params __free(kfree) = NULL;
  4098		struct snd_pcm_hw_params_old *oparams __free(kfree) = NULL;
  4099		int err;
  4100	
  4101		params = kmalloc(sizeof(*params), GFP_KERNEL);
  4102		if (!params)
  4103			return -ENOMEM;
  4104	
  4105		oparams = memdup_user(_oparams, sizeof(*oparams));
> 4106		if (IS_ERR(oparams))
> 4107			return PTR_ERR(no_free_ptr(oparams));
  4108	
  4109		snd_pcm_hw_convert_from_old_params(params, oparams);
  4110		err = snd_pcm_hw_params(substream, params);
  4111		if (err < 0)
  4112			return err;
  4113	
  4114		snd_pcm_hw_convert_to_old_params(oparams, params);
  4115		if (copy_to_user(_oparams, oparams, sizeof(*oparams)))
  4116			return -EFAULT;
  4117		return 0;
  4118	}
  4119	#endif /* CONFIG_SND_SUPPORT_OLD_API */
  4120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
