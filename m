Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2C71DF75C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 01:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765501806; cv=none; b=b41KCd7n9za44o/TsbZb1+hRYBCACverO/kbjcaifW8BmCslq5mvji0LbhrlSmfCMiLlhf+mmZNVQrtaiKYFWfBsGdkIsTgot16Ly8TwGnWwp+IHdfIBSoQqwlTn7BxWwFw4up2kExmiTpHNxgQugGCjQEtSOVUGZDVE0YG75AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765501806; c=relaxed/simple;
	bh=SdYb8wN98DudnC4/ffD8v7sZUiewMBNdMl30Uv22BB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kEBo/gNQoYV76qD3sVQNP1xRVWuBq67T/vSlWiu+NEtz+/Wbyb4JR6dncNG8INjZyNrgyn989D3gzHAIT6Q6K1747C5EAQxSjv/WPrCUMY8GufVBmwrlrg4l8za1kuAJYfV7pj4NQUR3n5PFzk92SYdaP3Z1iWmCLzYLStI+fzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XOgzumG7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOgzumG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765501805; x=1797037805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SdYb8wN98DudnC4/ffD8v7sZUiewMBNdMl30Uv22BB4=;
  b=XOgzumG7e4NCDyGBICWzY1zNl3zWtdC37Sxmr1FQvnstBAeB0FvyH8I+
   jvlgJP5gseJHXWy1SHrOmBIrCSufqZyibDXd2Kn7nLRDKPifYZp1u71WF
   r2hwgdQT+xHY9o9szNof4++UQcNyWlUcGoPKIb/+c/d0OOk3wWrmJtQDO
   i7YqE3eRCVU7PmGdyP2lvCPf+8eWVHW9Ll5p/I01PEmLIi0nWgRv3YTHJ
   N8Fn1qq+v767A4tIGdzUAvqB/4kmuu1bku1kYi9X6NZTMkPClVeQjWqM7
   4z3myqSL+dtFS/6+w6Sdt0vgyw4Jdz5Hy6ek04SI+c/b0UUZ34+dmHq13
   w==;
X-CSE-ConnectionGUID: iukiEKJFTwqSW4iP+DZ17g==
X-CSE-MsgGUID: Yp1M6IPFR3iXN0Dnp2vo8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="70074903"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="70074903"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 17:10:04 -0800
X-CSE-ConnectionGUID: gUi8Aj2lRzyqE1WLLt/R7w==
X-CSE-MsgGUID: v08TndySQ96aOebfz2hqYw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Dec 2025 17:10:03 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTrfV-000000005H3-0QCQ;
	Fri, 12 Dec 2025 01:10:01 +0000
Date: Fri, 12 Dec 2025 09:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 5/5]
 sound/soc/codecs/rt-sdw-common.c:87: warning: Function parameter or struct
 member 'val' not described in 'rt_sdca_index_update_bits'
Message-ID: <202512120900.Nk98XpbL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jack,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   aede8f2a23afdacd71bb57369610179a20e859a7
commit: ba46a64341209fd14a19c13e35a61bca6f571812 [5/5] UPSTREAM: ASoC: rt721-sdca: Add RT721 SDCA driver
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251212/202512120900.Nk98XpbL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120900.Nk98XpbL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120900.Nk98XpbL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/rt-sdw-common.c:87: warning: Function parameter or struct member 'val' not described in 'rt_sdca_index_update_bits'
>> sound/soc/codecs/rt-sdw-common.c:87: warning: Excess function parameter 'value' description in 'rt_sdca_index_update_bits'


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
