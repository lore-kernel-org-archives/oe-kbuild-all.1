Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B40349B11
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 18:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774465046; cv=none; b=KN4l44nTZjrzLq8grHhs8gheCqaPnl9SiOPs/3SxvrRKCiqXb1D4HjJkgIzvy4XewxEswqypReIddrHA4dWYK/tgeoZpzYGarRWU7K5jKcULTo6a/qRLKuDjtdeMq/CGztCp+zEn+DE4DL38ew0trO3JfPW2JrgdyIAh+IrpuIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774465046; c=relaxed/simple;
	bh=MVDfFsqYX0MW9Fulm689W6yN5G2DQYwOvx0mRUIgVCU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vr9D5H7ZKsqXiD/E/VdyP6m0PTbf+n7v8InWBjAcawEEqk0KctrZcDqPtdOJFswD5LPUVYMLrsM/9YK+MDmhyGoZPxBqI2VuH+JGCMUUFtwi3cn4zlK7sV0o6JBk3KHseILYxKqY5QSiqoxG+CE+zNA36ojdgpn1f8HrM5l0fbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DX90IVYG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DX90IVYG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774465045; x=1806001045;
  h=date:from:to:cc:subject:message-id;
  bh=MVDfFsqYX0MW9Fulm689W6yN5G2DQYwOvx0mRUIgVCU=;
  b=DX90IVYGimcTm8UyB2d7bFW7FoBqEZ3wpFLEdYn+ZqjJ0e10X5f4+Nsi
   dsU7nKmgbKOMP/ImCMUwSfs0SCao3/uR3Zs/ve73qMcYJOdUpMujNqnP8
   74sIHblOwnnMOQAqanATvycZ9nq0bsaUzDKggCeFIwBqtx2GiecUAbUxv
   37R4WDaCzwnah9PZxEyRRhteD4OrcbaXTDGmKpqWsfNOj+zWmRl6h1Y08
   gqR6aCk8Z3t7Zez2dO0kNNXXw5FnNn2hNatYhRWPfm1gB6eH2pQTiu+om
   1cbVZA6b43VGDclrM1aDQ0eCRiDEwofYSkgUiIMBKdJMjF/D1VxwTiV96
   w==;
X-CSE-ConnectionGUID: pKuPloJZQDOQynQL3RG53g==
X-CSE-MsgGUID: IP6ySv55RtCB8UF2jN9ryw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75230441"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75230441"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 11:57:24 -0700
X-CSE-ConnectionGUID: idx8ZZdsQF2Af5+507ab0Q==
X-CSE-MsgGUID: LJDnIKbgQJKj4e0Wn+kyLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="229544674"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Mar 2026 11:57:22 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5TPs-000000007Uh-1KmE;
	Wed, 25 Mar 2026 18:57:20 +0000
Date: Thu, 26 Mar 2026 02:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 36/36]
 sound/soc/codecs/rt-sdw-common.c:87: warning: Function parameter or struct
 member 'val' not described in 'rt_sdca_index_update_bits'
Message-ID: <202603260213.nE9dAVxS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jack,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   bb47b925bb600e95cd776d4ab19d2b6c2ae342c7
commit: ba46a64341209fd14a19c13e35a61bca6f571812 [36/36] UPSTREAM: ASoC: rt721-sdca: Add RT721 SDCA driver
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260326/202603260213.nE9dAVxS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260213.nE9dAVxS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260213.nE9dAVxS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/rt-sdw-common.c:87: warning: Function parameter or struct member 'val' not described in 'rt_sdca_index_update_bits'
>> sound/soc/codecs/rt-sdw-common.c:87: warning: Excess function parameter 'value' description in 'rt_sdca_index_update_bits'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +87 sound/soc/codecs/rt-sdw-common.c

cbc3cb613e4044 Jack Yu 2024-10-01  71  
cbc3cb613e4044 Jack Yu 2024-10-01  72  /**
cbc3cb613e4044 Jack Yu 2024-10-01  73   * rt_sdca_index_update_bits - Update value on Realtek defined register.
cbc3cb613e4044 Jack Yu 2024-10-01  74   *
cbc3cb613e4044 Jack Yu 2024-10-01  75   * @map: map for setting.
cbc3cb613e4044 Jack Yu 2024-10-01  76   * @nid: Realtek-defined ID.
cbc3cb613e4044 Jack Yu 2024-10-01  77   * @reg: register.
cbc3cb613e4044 Jack Yu 2024-10-01  78   * @mask: Bitmask to change
cbc3cb613e4044 Jack Yu 2024-10-01  79   * @value: New value for bitmask
cbc3cb613e4044 Jack Yu 2024-10-01  80   *
cbc3cb613e4044 Jack Yu 2024-10-01  81   * A value of zero will be returned on success, a negative errno will
cbc3cb613e4044 Jack Yu 2024-10-01  82   * be returned in error cases.
cbc3cb613e4044 Jack Yu 2024-10-01  83   */
cbc3cb613e4044 Jack Yu 2024-10-01  84  
cbc3cb613e4044 Jack Yu 2024-10-01  85  int rt_sdca_index_update_bits(struct regmap *map,
cbc3cb613e4044 Jack Yu 2024-10-01  86  	unsigned int nid, unsigned int reg, unsigned int mask, unsigned int val)
cbc3cb613e4044 Jack Yu 2024-10-01 @87  {
cbc3cb613e4044 Jack Yu 2024-10-01  88  	unsigned int tmp;
cbc3cb613e4044 Jack Yu 2024-10-01  89  	int ret;
cbc3cb613e4044 Jack Yu 2024-10-01  90  
cbc3cb613e4044 Jack Yu 2024-10-01  91  	ret = rt_sdca_index_read(map, nid, reg, &tmp);
cbc3cb613e4044 Jack Yu 2024-10-01  92  	if (ret < 0)
cbc3cb613e4044 Jack Yu 2024-10-01  93  		return ret;
cbc3cb613e4044 Jack Yu 2024-10-01  94  
cbc3cb613e4044 Jack Yu 2024-10-01  95  	set_mask_bits(&tmp, mask, val);
cbc3cb613e4044 Jack Yu 2024-10-01  96  	return rt_sdca_index_write(map, nid, reg, tmp);
cbc3cb613e4044 Jack Yu 2024-10-01  97  }
cbc3cb613e4044 Jack Yu 2024-10-01  98  EXPORT_SYMBOL_GPL(rt_sdca_index_update_bits);
cbc3cb613e4044 Jack Yu 2024-10-01  99  

:::::: The code at line 87 was first introduced by commit
:::::: cbc3cb613e4044c076c6648ce0934818cba52545 UPSTREAM: ASoC: rt-sdw-common: Common functions for Realtek soundwire driver

:::::: TO: Jack Yu <jack.yu@realtek.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
