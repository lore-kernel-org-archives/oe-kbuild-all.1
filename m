Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12163C2ED
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739613930; cv=none; b=jv1YPKpq8vdted7RfjmoHlLY4l9meZyyAHw1nnZLZrwHshlq3a7AVbFrrN4dkcPWNg2UgzVVK3AGWM5QYGn+gx2JA+/GWYX8b29nU2rZu+28o89jfROovZ0O++NCN744RbI32/bMzdKuxX3TUfz5FR9iiJc2WNU09bYJI+XTL0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739613930; c=relaxed/simple;
	bh=/AZiInjA7wahnGpZ+fSJzG0YwjRvzjIOvweZkWgyaRc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AsJNdy8sBM6/7aUXtSCg+xL62AJSXkt0ZEtihEmr+NTGxvxSGNJulZC14w1tXNpUnQ8ZtzkUciz88kg5p52lQOdA6salkPO+epMNmvkFr6HBX1zPPgM+cbVsnbgUCfyfJd1OYSfKcIBBb4J1zZZTD9v0/0vZYZYGWyKnlt9HwE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCl6eMQu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCl6eMQu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739613928; x=1771149928;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/AZiInjA7wahnGpZ+fSJzG0YwjRvzjIOvweZkWgyaRc=;
  b=kCl6eMQuuYwc2/jjX8Rcy7y1ZRfwwZmgz97ppJl+2q/2sHVogdKXMqy1
   8aYoTV9p19IKwIk3b7nknOO++h0kzl7HYuzybeF21uwe0MKv/8Aq7vplx
   kGeh+zTtYXg5OVbxYN0PkyXXiKoJ8GeWG88NTA80qPvJ9eY81DeElie0R
   3d0IAHCmC5JYC8j0wGIh9z9y/Uv421BX8zhhtgqY0ty9iddduUm038Yrc
   fmm/UYZX2cKq5U1q0xPfKr3Z1CHRcosnWS1ySFZ4wOWpymsBmIm/uC+rG
   YjLSdRLmV1kt6L/+lFWUgCQtXoC/hkoZ01tt4HINEfk17V8QuEym1HNwV
   Q==;
X-CSE-ConnectionGUID: O/3M7Xp5RCyCLCQ8n7SjDQ==
X-CSE-MsgGUID: yliY64bXSieGShWU46dSCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="51338103"
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="51338103"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 02:05:27 -0800
X-CSE-ConnectionGUID: qihVjsziR9aca8X7AuiV8A==
X-CSE-MsgGUID: BqDjkTfqQIKOsV2mx/eVlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144591328"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Feb 2025 02:05:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjF36-001Ahf-2O
	for oe-kbuild-all@lists.linux.dev;
	Sat, 15 Feb 2025 10:05:24 +0000
Date: Sat, 15 Feb 2025 18:05:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/preempt-rt 0/3] sound/soc/sunxi/sun4i-spdif.c:181:
 warning: Function parameter or member 'mclk_multiplier' not described in
 'sun4i_spdif_quirks'
Message-ID: <202502151741.u5vi5Kx7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   da3aec3fdaa3fcb8c9f9760d4edef06741ccfc6e
commit: 557065f0a493aeab7ecbe1e818229d628bcad201 [0/3] ASoC: sun4i-spdif: Add clock multiplier settings
config: x86_64-buildonly-randconfig-002-20250215 (https://download.01.org/0day-ci/archive/20250215/202502151741.u5vi5Kx7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502151741.u5vi5Kx7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502151741.u5vi5Kx7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sunxi/sun4i-spdif.c:181: warning: Function parameter or member 'mclk_multiplier' not described in 'sun4i_spdif_quirks'


vim +181 sound/soc/sunxi/sun4i-spdif.c

f8260afa444b67 Marcus Cooper 2016-02-08  168  
ae9cccc30f6c08 Clément Péron 2019-05-27  169  /**
ae9cccc30f6c08 Clément Péron 2019-05-27  170   * struct sun4i_spdif_quirks - Differences between SoC variants.
ae9cccc30f6c08 Clément Péron 2019-05-27  171   *
c7202a19cf838d Lee Jones     2020-07-09  172   * @reg_dac_txdata: TX FIFO offset for DMA config.
ae9cccc30f6c08 Clément Péron 2019-05-27  173   * @has_reset: SoC needs reset deasserted.
f6a86b436b2658 Clément Péron 2019-05-27  174   * @val_fctl_ftx: TX FIFO flush bitmask.
ae9cccc30f6c08 Clément Péron 2019-05-27  175   */
ae9cccc30f6c08 Clément Péron 2019-05-27  176  struct sun4i_spdif_quirks {
ae9cccc30f6c08 Clément Péron 2019-05-27  177  	unsigned int reg_dac_txdata;
ae9cccc30f6c08 Clément Péron 2019-05-27  178  	bool has_reset;
f6a86b436b2658 Clément Péron 2019-05-27  179  	unsigned int val_fctl_ftx;
557065f0a493ae George Lander 2024-11-11  180  	unsigned int mclk_multiplier;
ae9cccc30f6c08 Clément Péron 2019-05-27 @181  };
ae9cccc30f6c08 Clément Péron 2019-05-27  182  

:::::: The code at line 181 was first introduced by commit
:::::: ae9cccc30f6c088dd6ead63e990407e37cd9437b ASoC: sun4i-spdif: Move quirks to the top

:::::: TO: Clément Péron <peron.clem@gmail.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
