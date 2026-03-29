Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E79431E822
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 11:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774782647; cv=none; b=btIgSHtkZdI2Qzyo5Hg2sb+I09WNnqYII10MUPYzN+VaErf7n3MXi6Xl34VJSVwQY3kl8tnxi3Y0mOQxFfkHNgc9bRHoymAGuZd8kfX1M7uf5u9SK4a/AozbHeWwe9ydWIhxh6roCXEOeFDgupStm18jez3gjNwp2qX6V1ix2Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774782647; c=relaxed/simple;
	bh=I32ahbkTMCtWN6vThyJfrSRu80yvW02mMlzNU56uGzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DLo+ZeKzNNKwdxvoIXx1DhfmSf12Qyb8hEOgGH4XA2pibL1SucKmo7ChrChkN7tPru9UsZl4bIf//wyWUJLy8uhlmwQwaDHAuap9j238BqD37wiyhdz2096xky7d5UFwNdUhf9/dxXAU9zMD/okLo/yGD7F/gADalr64u4ao6xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cNztf+tm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNztf+tm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774782646; x=1806318646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I32ahbkTMCtWN6vThyJfrSRu80yvW02mMlzNU56uGzU=;
  b=cNztf+tmTwmUY1fdQ9BaFRRlhCgX3WmPNtlGU4Hl3Ln+W7ZEpZA+CIgb
   XDJLRm1IVGnQVhYPBXRKq1zWVw6rGamODWK5biq9SdnIKrpEl+/P197tL
   KEuBZSdJqW/9K4w8XiRaDDrHzzV+K3VUcSdUdsgm8oeK2qqR/b/lKohz1
   xmufkkenGaJkergSmupzwTIiWrpGeb48aLOI5kpQo+5pAeOAJsNc8cdWc
   1GntITMeO2Z0w1saekG40iwOTsrrXvlqJRP2oE2CfyzfH90AS8LWqnM0m
   lLPQGrMecDQmcgK8CDEaq+kDwudM51iFPAm9eQ/5lZjhVLnCPxmBcYBsw
   Q==;
X-CSE-ConnectionGUID: 0+DkNidnQbyg4V7BpSlxPw==
X-CSE-MsgGUID: MzVM6+dSQJi1ALaVPhquMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75504057"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="75504057"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 04:10:45 -0700
X-CSE-ConnectionGUID: 1JcBdpTGTluQ6hkpu8LCAQ==
X-CSE-MsgGUID: 15+LGpw0SbmWWwoyGD1Yyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="230570838"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Mar 2026 04:10:44 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6o2T-00000000CJ9-1ZRL;
	Sun, 29 Mar 2026 11:10:41 +0000
Date: Sun, 29 Mar 2026 19:10:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-cached-prefix 86/89] lib/dynamic_debug.c:1925:43:
 warning: left shift count >= width of type
Message-ID: <202603291907.4XUTQyq7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-cached-prefix
head:   a138e116d24e080d1c0778ca2bbb7b9cc4770e9b
commit: b00af02b193459e4b8f56031f395c3cfa10fc506 [86/89] dyndbg: cache the dynamic prefixes per callsite.
config: arc-randconfig-002-20260329 (https://download.01.org/0day-ci/archive/20260329/202603291907.4XUTQyq7-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603291907.4XUTQyq7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603291907.4XUTQyq7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_prefix_key':
>> lib/dynamic_debug.c:1925:43: warning: left shift count >= width of type [-Wshift-count-overflow]
    #define DDEBUG_PREFIX_KEY_ADDR_MASK ((1UL << DDEBUG_PREFIX_KEY_FLAGS_SHIFT) - 1)
                                              ^~
   lib/dynamic_debug.c:1929:32: note: in expansion of macro 'DDEBUG_PREFIX_KEY_ADDR_MASK'
     return ((unsigned long)desc & DDEBUG_PREFIX_KEY_ADDR_MASK) |
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1930:45: warning: left shift count >= width of type [-Wshift-count-overflow]
      ((unsigned long)prefix_flags(desc->flags) << DDEBUG_PREFIX_KEY_FLAGS_SHIFT);
                                                ^~


vim +1925 lib/dynamic_debug.c

  1923	
  1924	#define DDEBUG_PREFIX_KEY_FLAGS_SHIFT 56
> 1925	#define DDEBUG_PREFIX_KEY_ADDR_MASK ((1UL << DDEBUG_PREFIX_KEY_FLAGS_SHIFT) - 1)
  1926	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
