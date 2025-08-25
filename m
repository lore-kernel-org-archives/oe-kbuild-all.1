Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F658220F49
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 08:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756110169; cv=none; b=JjdV+ppr94As8o86t0Bt6EoYeyoSrz6dbLYysv15cnpAY5txchnfLmVxNVXJkTzwZE3Op9dNefB2FLyLHC8EhVTakPfozJ3I1OETZDpsG5wXv/MdL08pssobV86Va9/cenWbcucqo2oLAC3cKbr3i7mGXr/HBdo4NmCxxxsvRzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756110169; c=relaxed/simple;
	bh=cVgIJ1X8DT5QTXS6TpIvKsM36DwaBcPd9kJqzULjl3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JibMjTCOZmyZ6kKiUQswIiVxDouFuHmjA6AUtRmLwMoQ1RLj0lbykAVcbJ+P5z5mCrhCkCH3VfIOYygZCM0yeULfhSbcxOdSzo5wg4BpUGrkEu4eEt+Blr47gPbHCQOP56Ci+iDSeugkR1WTDX4zGa11goZSIlD+F3M1MrLnE3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UAoVpv8m; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAoVpv8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756110168; x=1787646168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cVgIJ1X8DT5QTXS6TpIvKsM36DwaBcPd9kJqzULjl3Y=;
  b=UAoVpv8mnhq3xPRKiETCbqhz616rBfxJtUQVPbK+0Q9uyXYO9iWoMXQ6
   BHQHS4bddgU3QeggikkH0ScZoKbG79aPLlYucFJaRvfxiLsYBtEVLSkMM
   wfEw6vVol1wCAjGiGGBPcrkocLlEduUwNdQlE2fCOB7tUQY7E0ICdI3RQ
   W90v2DDGE3k0qv1UP4LNyUNmkVU/8ywQ/+18/ZIySKC1HHIpe1oQqTJvf
   A0/CqLaR/mbB8eYi8ZrnRLi1piPv9CrIt4iCze3N7x9umqTQB4SAvfmoF
   Yf6bmcFZO2Zt0CjBTl3NyR6K18PJr5X3c4B5k+M40aDv6vPI22poNAIgW
   A==;
X-CSE-ConnectionGUID: CN5KxxNiSAuidyClwSyqOw==
X-CSE-MsgGUID: pqdDTQHsSlKfw5xVTz44lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="60946688"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60946688"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 01:22:47 -0700
X-CSE-ConnectionGUID: AUDtVBMAS+WZromJcP5Yig==
X-CSE-MsgGUID: BLlXcrUXTXWC0S5gy3nbZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200129775"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 25 Aug 2025 01:22:46 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqSTT-0002Hb-2i;
	Mon, 25 Aug 2025 08:22:43 +0000
Date: Mon, 25 Aug 2025 10:22:25 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 161/161] mm/swap_slots.c:95:6:
 warning: no previous prototype for function 'is_swap_slot_cache_enabled'
Message-ID: <202508251009.UFbpafOh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   6c4f5ec4fbbf8b26b10215c34009ad8c2736f46b
commit: e064059673798b931f95f724c7e377fa8cd15df7 [161/161] ANDROID: create and export is_swap_slot_cache_enabled
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250825/202508251009.UFbpafOh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4f15debe13af14e0fd668ee4861aff6dbc5283df)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508251009.UFbpafOh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508251009.UFbpafOh-lkp@intel.com/

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
