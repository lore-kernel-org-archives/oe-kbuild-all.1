Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75606146A66
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722941; cv=none; b=SEIuIiG91aoGrqVNjgqGNDOFC+P0aUZKVbdGf8mJzTvUmF61dwVGxBRDVFW70FwfM4tWd6YVOEc6TMQ7c+U2X2ZToR7RH0EdCGUzL8KiWLqmqLksD9s7nHIwJEPfe3Y6889upX9UkuAgLoN7fRJdMLoptX8hfNnwjCdhV986r6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722941; c=relaxed/simple;
	bh=SQp1H5I+bKqVnQnGNdl2PVx7vhoJl8+3JiisclYlTFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=adIM3BS1xVtFhkvM+Gh/0tKsle6Dsc2jw0ioBukDziscQPHzt13BQ7QB/OJqXLJd1fCEx5nrILMoHhtckGR2qfGbYjm0GWWR8WeTxggfWEm7sK0HbSi4yt3XsOptbBc1OzfYdAMUHAczHWrHTX0mRVHWM1bQEgmP1K801J7phE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nATGg4AA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nATGg4AA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749722938; x=1781258938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SQp1H5I+bKqVnQnGNdl2PVx7vhoJl8+3JiisclYlTFU=;
  b=nATGg4AAx6IHnWWuQa+N73r8+sJsVeRiRgsZZSeyNlyK626sEFTbZqTX
   yecsKSVxQZpdTmfFeVkwAGVLF6uygqnI/hvyPs58/YUdZ5JVnUPW9Lm4q
   EwfRnIQ1MVMQVK2EFu+gyfxZIqL3KCKLfkGW8Kvp5qM6NqxMEAREZHJs2
   70OV5oDPk8jG+vP9lYylocfZnNsQKZXuId1hgPuwnK+lW0B4+7mC6ciSv
   dSoUAnJw3T5drI/C0d1gtIUg3I/hzhs5aHwn5Q131T9Adngp/iQ0VQ3X8
   ri+eVnrbwhuvbYiYdNvo9kcoji+BeQgVQQ7RV2W1/WRHLFrdD9H3HVIQE
   w==;
X-CSE-ConnectionGUID: VKE4fgjtQfuLuQ4j+6MtHg==
X-CSE-MsgGUID: 4oKb1BI2Q+W2ovSaFTuR+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62932990"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="62932990"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 03:08:57 -0700
X-CSE-ConnectionGUID: BbWZkOQJRLuqcFMX94PtdQ==
X-CSE-MsgGUID: pI5ZH1+ZTBe1fc1CKIzpOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="152464705"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Jun 2025 03:08:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPerd-000BOM-1m;
	Thu, 12 Jun 2025 10:08:53 +0000
Date: Thu, 12 Jun 2025 18:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 0/141] mm/swap_slots.c:95:6:
 warning: no previous prototype for function 'is_swap_slot_cache_enabled'
Message-ID: <202506121744.4gFR6Tpm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bing,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   b185a6ede2f07a9c35a68b13b3ba9d3abf114a5d
commit: e064059673798b931f95f724c7e377fa8cd15df7 [0/141] ANDROID: create and export is_swap_slot_cache_enabled
config: x86_64-buildonly-randconfig-002-20250612 (https://download.01.org/0day-ci/archive/20250612/202506121744.4gFR6Tpm-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506121744.4gFR6Tpm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506121744.4gFR6Tpm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swap_slots.c:95:6: warning: no previous prototype for function 'is_swap_slot_cache_enabled' [-Wmissing-prototypes]
      95 | bool is_swap_slot_cache_enabled(void)
         |      ^
   mm/swap_slots.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      95 | bool is_swap_slot_cache_enabled(void)
         | ^
         | static 
   mm/swap_slots.c:101:6: warning: no previous prototype for function 'check_cache_active' [-Wmissing-prototypes]
     101 | bool check_cache_active(void)
         |      ^
   mm/swap_slots.c:101:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     101 | bool check_cache_active(void)
         | ^
         | static 
   2 warnings generated.


vim +/is_swap_slot_cache_enabled +95 mm/swap_slots.c

    94	
  > 95	bool is_swap_slot_cache_enabled(void)
    96	{
    97		return swap_slot_cache_enabled;
    98	}
    99	EXPORT_SYMBOL_GPL(is_swap_slot_cache_enabled);
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
