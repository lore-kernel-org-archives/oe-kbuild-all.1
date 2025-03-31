Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71D72AEE1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 11:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743419185; cv=none; b=DRR/L3Xd6ZCV51D3XIT5dc7lbslHBDPxOCNDiMtAqBe1hz7Hd6S69VRNDEnjSUkVjw016/aIN4cQkwcP2Fpb1PKkcuO4/QcLUbX2p3s6H+GTB4+8UW2nbxolV7Rkqx8wOXtSziVpbStAFWI8w2i/TJFE2OYVR5lICNkE7qRJ+cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743419185; c=relaxed/simple;
	bh=qrWEM9nJSDAcKNBN/sHNGtoWM4k5sCl6DC5dXoCEUCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SCsPaT6WyqesR2cdxCIykZwqEAog3FJ56cbZWLxjmcZk0iJvfcLEG4Yy/fM8tdz5Bl0/epOaiL+CRI+FOL49FtyOPoI9Lg6+RO0tQMtgMntjzhoWqRIefmTtkzjvn2CF6OcON34cmSNZiAZVw6FFbrYepziTbHlPfh0E1rnV+Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijrpP5WK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijrpP5WK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743419184; x=1774955184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qrWEM9nJSDAcKNBN/sHNGtoWM4k5sCl6DC5dXoCEUCA=;
  b=ijrpP5WKzOZBd64ZehKdjjA/tNVARljVLGpUn8XW0JkitOMxWm47rZVj
   mkxgyEZ+8BQXTMfD9K+wvNr1C/mTFm//J7glLrkqv6M66U2WSYtp+AtYZ
   /8+L2nKJAcWDSilODF2SvQ/AUWM5Zv4InWpzkgCSsE+Mn8F8gXQL899ON
   Ip36FFV1jLBDVTHO0tVtL+iDr9tc9m1CmR1/q3IDTHNvYM/gRPk1fJl8B
   qHnfMxh5iYjGHjBPIepUJjQuPqhm0CQfRJRG4hsvMlLdSPwKDsKmpUhU7
   f54NSy1rrdsNHiHVUoocu4C4ynOAOFGfodFOuqh/v+faPswPzrZpYgFT8
   A==;
X-CSE-ConnectionGUID: Un+0E7oxS9217X6NU5FvoQ==
X-CSE-MsgGUID: Cc9SFI0oRt2kvfx+DPkJig==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="55361373"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="55361373"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 04:06:23 -0700
X-CSE-ConnectionGUID: IcwUaQ2NSw+pxGvR5uNZ4w==
X-CSE-MsgGUID: d7tj+vcRQZyIJOluBiTMmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="126285737"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2025 04:06:22 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzCyC-0009BA-0D;
	Mon, 31 Mar 2025 11:06:20 +0000
Date: Mon, 31 Mar 2025 19:05:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sahil Siddiq <icegambit91@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Stafford Horne <shorne@gmail.com>
Subject: [linux-next:master 13940/14141]
 arch/openrisc/include/asm/spr.h:16:27: error: impossible constraint in 'asm'
Message-ID: <202503311807.BZaUHY5L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   405e2241def89c88f008dcb899eb5b6d4be8b43c
commit: c5c6fd8be51207f0abd3e5a6ed4fd5220b0bdecd [13940/14141] openrisc: Introduce new utility functions to flush and invalidate caches
config: openrisc-randconfig-r062-20250331 (https://download.01.org/0day-ci/archive/20250331/202503311807.BZaUHY5L-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250331/202503311807.BZaUHY5L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503311807.BZaUHY5L-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/openrisc/mm/cache.c:13:
   In function 'cache_loop',
       inlined from 'cache_loop_page' at arch/openrisc/mm/cache.c:51:2:
>> arch/openrisc/include/asm/spr.h:16:27: warning: 'asm' operand 0 probably does not match constraints
      16 | #define mtspr(_spr, _val) __asm__ __volatile__ (                \
         |                           ^~~~~~~
   arch/openrisc/mm/cache.c:38:17: note: in expansion of macro 'mtspr'
      38 |                 mtspr(reg, paddr);
         |                 ^~~~~
>> arch/openrisc/include/asm/spr.h:16:27: error: impossible constraint in 'asm'
      16 | #define mtspr(_spr, _val) __asm__ __volatile__ (                \
         |                           ^~~~~~~
   arch/openrisc/mm/cache.c:38:17: note: in expansion of macro 'mtspr'
      38 |                 mtspr(reg, paddr);
         |                 ^~~~~


vim +/asm +16 arch/openrisc/include/asm/spr.h

58e0166a4772aa Jonas Bonn 2011-06-04  15  
58e0166a4772aa Jonas Bonn 2011-06-04 @16  #define mtspr(_spr, _val) __asm__ __volatile__ (		\
58e0166a4772aa Jonas Bonn 2011-06-04  17  	"l.mtspr r0,%1,%0"					\
58e0166a4772aa Jonas Bonn 2011-06-04  18  	: : "K" (_spr), "r" (_val))
58e0166a4772aa Jonas Bonn 2011-06-04  19  #define mtspr_off(_spr, _off, _val) __asm__ __volatile__ (	\
58e0166a4772aa Jonas Bonn 2011-06-04  20  	"l.mtspr %0,%1,%2"					\
58e0166a4772aa Jonas Bonn 2011-06-04  21  	: : "r" (_off), "r" (_val), "K" (_spr))
58e0166a4772aa Jonas Bonn 2011-06-04  22  

:::::: The code at line 16 was first introduced by commit
:::::: 58e0166a4772aaeb10c9b0f6d59f19099d2047df OpenRISC: Headers

:::::: TO: Jonas Bonn <jonas@southpole.se>
:::::: CC: Jonas Bonn <jonas@southpole.se>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
