Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111FE3126D7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 17:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782150869; cv=none; b=GaEidNSB3vaGK30iLSMgTHHg5gqZovkHDUot+fihz+tWp6ztbHc/nwxdUmt2yZdnJhAZFCB7Q1XUzW6zJ4tiScw46P8RIw4eMoWFmGh9CTmH3l6Sdhrc5Mv8Ku5pllQxNxzn0aRSz5h7jIxWkKXcLbrFw5NlPbUz0VbqUcGkC24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782150869; c=relaxed/simple;
	bh=tuhyQDa0mM7ztcqgmTSan4pYcaTiFE6miMLwYkpor/c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b6PTS5HVuhIb1os0fD+yq3iFEKbYDuaSQfEqQgZDC4q0oIf003HJMPS+RCRiJhRCxs0MLYG70uqcUL7tVr4GR6FWERXTFpolxTSoNSO7ovdcJFv3COT+zShWBCFt73xpqtpRRKLCGmwm3M7uqq/u1wSMBz03FWVMI+tluOnU9eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ft7yfJZB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ft7yfJZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782150868; x=1813686868;
  h=date:from:to:cc:subject:message-id;
  bh=tuhyQDa0mM7ztcqgmTSan4pYcaTiFE6miMLwYkpor/c=;
  b=Ft7yfJZBoyWb1WdqNdkd/M4kP9dFSTdekScHeRr1A83BRdzp8WC3dxqE
   Sk0cHNK+0N4Un2FoibpqoIKBSsLm118G2kVmqo1oZqa1UgtQe4/3V2DYy
   JFFlHZq6M+TXkKHOomUsZRbrupPgRAxyz7jjJUksousuWhaoGSeEp9/B0
   hVFuej1E4IiJD8ztQCqdVW8unhZQphMcQcNSkF0YFdNwW/sQgCXYiOs/F
   w97rPQQ7lNMO8t+Qx4JkmmKhteP5qt5spECcKDuaCMluh1RZXO2NkeBCY
   bE198/UdHgV3rY9RMozq5kLcfwpk5zLtKxcShcC1QV+smT0tps4N7V20k
   g==;
X-CSE-ConnectionGUID: nlg4o9+NT8mCt9WD4RU9hg==
X-CSE-MsgGUID: ViOxGT1LTkys+7DqveAJ7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="70404423"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="70404423"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 10:54:28 -0700
X-CSE-ConnectionGUID: IEBGxDb8Rq6zavvljJSQZg==
X-CSE-MsgGUID: UwxH1DfwTDWqQuZe9FGWPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="249333897"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Jun 2026 10:54:26 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbipR-000000001er-24CD;
	Mon, 22 Jun 2026 17:53:41 +0000
Date: Tue, 23 Jun 2026 01:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [abelloni:rtc-next 7/14]
 drivers/rtc/rtc-renesas-rtca3.c:233:9: warning: result of comparison of
 constant 65535 with expression of type 'typeof (_Generic((mask), char:
 (unsigned char)0, unsigned char: (unsigned char)0, signed char: (unsigned
 char)0, unsigned short: (unsigned shor...
Message-ID: <202606230130.jmcAMnJP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
head:   041ca8884410a4f70b40521f34258c7b773ea5c2
commit: 2098bb8ac5f5a66b1a0e02512ae11b6208936c92 [7/14] rtc: renesas-rtca3: Factor out year decoding helper
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260623/202606230130.jmcAMnJP-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230130.jmcAMnJP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230130.jmcAMnJP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-renesas-rtca3.c:233:9: warning: result of comparison of constant 65535 with expression of type 'typeof (_Generic((mask), char: (unsigned char)0, unsigned char: (unsigned char)0, signed char: (unsigned char)0, unsigned short: (unsigned short)0, short: (unsigned short)0, unsigned int: (unsigned int)0, int: (unsigned int)0, unsigned long: (unsigned long)0, long: (unsigned long)0, unsigned long long: (unsigned long long)0, long long: (unsigned long long)0, default: (mask)))' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
     233 |         u8 y = FIELD_GET(mask, year);
         |                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:177:3: note: expanded from macro 'FIELD_GET'
     177 |                 __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:50: note: expanded from macro '__BF_FIELD_CHECK_REG'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
      80 |                          __bf_cast_unsigned(reg, ~0ull),                \
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      81 |                          pfx "type of reg too small for mask")
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   1 warning generated.


vim +233 drivers/rtc/rtc-renesas-rtca3.c

   230	
   231	static u32 rtca3_decode_year(u8 mask, u16 year)
   232	{
 > 233		u8 y = FIELD_GET(mask, year);
   234		u32 century = bcd2bin((y == 0x99) ? 0x19 : 0x20);
   235	
   236		return (century * 100 + bcd2bin(y)) - 1900;
   237	}
   238	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
