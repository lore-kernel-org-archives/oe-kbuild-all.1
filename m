Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACF02C21CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 21:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763500820; cv=none; b=FDDwNvhunNRv1zMKnK5BftUjdfMGAgb1HSfRa+HZtNMwf6xMN+9SQvtEDGh1w8Tb8lo6bd6S+sfGwQb6RAngveOcequrDQi+L6ToB99thmcd2MQx/auILFhPzIYtyd8eqfwehPRkI6iinkP+uKsIldqOR5Iim53TnY5yi+jNQZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763500820; c=relaxed/simple;
	bh=EaYuR4uVecqc0PxxzKX3/9Eywm+pI2xg+Zf7PqoHb4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ufB6DP6DsPF/OasdtqAVt/4vXZp3C0j5AdZeTiK1bfUd2pBmBjcfxCXuPt44DPrc3ez/8QF8U57IbEgYlQb3tt2V085GVthvL4d+SMNnS5d9DuHT5/TRuReMpRSYAB3dEJ/elQjNwGuqBX2e4qnYgT1VYfehms7uLoCsMdb0JWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fX2uiBlr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fX2uiBlr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763500818; x=1795036818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EaYuR4uVecqc0PxxzKX3/9Eywm+pI2xg+Zf7PqoHb4k=;
  b=fX2uiBlrpUiKO20YfX3lY9sOl6BzcHxTkeNYaM/vJSd2AWVnfCV3FIKo
   GGzdWMPK4rIz8ak9H/CBV8mCPRDkiXCbdqU+YNoYbzL1c5E7qp7Z1MEmq
   sWAi4/bz9afxnzVItrpnWljon1q9cpEP/yLtRrZ5G1KIBwY4VLNDkXlB/
   tLWHN4oisv0w6eRnchkZFYIsB4cldfLyX11Z2c16heZSCKddLDVYdqVN3
   VVixUXkowBZs9kTiyucZe2X/PAZdB+rIwGHYKduF0x60q1pyw9tf+DKXZ
   eNl4/Z0QPUjsu7vCCqARk0/91O23XTbw5Th1dvdkAFDe6AUZcVzbzKN3v
   g==;
X-CSE-ConnectionGUID: t6vt1Z2HR+KwjuRxrX2/Ag==
X-CSE-MsgGUID: BS6JgqEvRO6uE/rm4w6CiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65571765"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65571765"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 13:20:17 -0800
X-CSE-ConnectionGUID: jjHe67nISXOKEGBOsClnaQ==
X-CSE-MsgGUID: w3mVAIOKRNOQrr60S0TmFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190668724"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2025 13:20:17 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLT7W-0002BV-2L;
	Tue, 18 Nov 2025 21:20:14 +0000
Date: Wed, 19 Nov 2025 05:19:27 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:6.6-velinux 6063/6063] mm/vmscan.c:196:38: error: macro
 'get_total_swap_pages' passed 1 arguments, but takes just 0
Message-ID: <202511190543.NX7taPDt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 6.6-velinux
head:   e2ef091eb40492c4e4e49d523f807d3c4621fe39
commit: 33ac4e8eeeb07a752a2e32dff0908075c1624af3 [6063/6063] bytedance: mm: add /proc knob for proactive swappiness
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251119/202511190543.NX7taPDt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511190543.NX7taPDt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511190543.NX7taPDt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:196:38: error: macro 'get_total_swap_pages' passed 1 arguments, but takes just 0
     196 | inline long get_total_swap_pages(void)
         |                                      ^
   In file included from mm/vmscan.c:20:
   include/linux/swap.h:530:9: note: macro 'get_total_swap_pages' defined here
     530 | #define get_total_swap_pages()          0L
         |         ^~~~~~~~~~~~~~~~~~~~
>> mm/vmscan.c:197:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     197 | {
         | ^


vim +/get_total_swap_pages +196 mm/vmscan.c

   195	
 > 196	inline long get_total_swap_pages(void)
 > 197	{
   198		return proactive_swappiness_enabled ? 0 : total_swap_pages;
   199	}
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
