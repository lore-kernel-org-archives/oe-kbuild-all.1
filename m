Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CC13ED5CD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 17:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773940505; cv=none; b=Zr8LfJ9/JUe4ptUt8com83/mO5L2z78YuoDrMcpAFTZQ3ORLrSYaBpC+HaLrRyWeLJWZycJoPkppmm/hIvNl/u7Rer6I+XTgt/QfOdbsufV9mPjvBwg6oe8E9TBEat1zg2WwkxjtQ02r1cHlvl5doVI78QOGzaGcowUmyTM550I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773940505; c=relaxed/simple;
	bh=po5B/hjC3QKz7aUMCj0Zdx2MqF1tX2mxkWNKo5DxHb4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=efsOi9qtRKQXm9C0GLTdXUd5db52CfFBVwPHXqno82axzgmdtBK0zlliIJI/BarbbC8LxcUmkxSpvliW3wfmBxxY1t/VDJEQL4CKgX/e77t/VZOkxZMZY2Ui9FyCKPPsjlvkrihDFIiDyJFIuYGYysrP83N+ejp8SoJGfK5xhwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBURPLD8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBURPLD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773940504; x=1805476504;
  h=date:from:to:cc:subject:message-id;
  bh=po5B/hjC3QKz7aUMCj0Zdx2MqF1tX2mxkWNKo5DxHb4=;
  b=dBURPLD8yOJ7UofSIzzKu4mEaUr+2d3YSePygHISvnQqzsBzst4whPJf
   niogk5Td7zjlyuaC2Du8JRl/l4LMeDeRBsAmf3tshKJU6d8z5Kf880MsA
   fYut8joFPnjDZ+dvdPVcRNMpVncZjZt1tJ9OxMF9AzqS0sajRHzkr1LyW
   zhPjttmVXQqCh2+XVypbCTzSU/p1MM+ndspIXAhZS0IqN1MIvUKA3ieBO
   BLuEAMklUjbLqzxxO7gPXnWkWkznl6ANRw08TgVqh85d0kj9UsVOEMHqk
   9+TWXIC+MZj6Sv4L5InQR7Lo1Bh1PvfDJPzW+axBPc2JPmKzLw0QepKRf
   Q==;
X-CSE-ConnectionGUID: zBQH9Z6aTwWAwLsZuNEFCQ==
X-CSE-MsgGUID: XeZqQKtzT/GF99WGlTNFSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74908746"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74908746"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 10:15:03 -0700
X-CSE-ConnectionGUID: VEyetpSKT9es2e5WX4R4mA==
X-CSE-MsgGUID: 5vtcf6vdSsasNVLnjVHzVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="227730921"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 Mar 2026 10:15:01 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3GxW-000000001PJ-4AeP;
	Thu, 19 Mar 2026 17:14:58 +0000
Date: Fri, 20 Mar 2026 01:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bjackman:lkp/page_alloc-unmapped 9/21] Warning:
 mm/page_alloc.c:450 expecting prototype for get_pfnblock_migratetype().
 Prototype was for get_pfnblock_freetype() instead
Message-ID: <202603200107.yuTGvLBS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bjackman/linux lkp/page_alloc-unmapped
head:   f67a49b8de0fef84e4746752849e9282634558b9
commit: 61d1b4bc8595152606c723b18fc6d800acc86365 [9/21] mm: introduce freetype_t
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260320/202603200107.yuTGvLBS-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200107.yuTGvLBS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200107.yuTGvLBS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/page_alloc.c:450 expecting prototype for get_pfnblock_migratetype(). Prototype was for get_pfnblock_freetype() instead
>> Warning: mm/page_alloc.c:3252 function parameter 'freetype' not described in '__putback_isolated_page'
>> Warning: mm/page_alloc.c:3252 function parameter 'freetype' not described in '__putback_isolated_page'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
