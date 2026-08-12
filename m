Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A23C39659A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 20:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786566751; cv=none; b=qzbMXKeCy+pWlazqL4BtFy0OhUwKSr0mPdHK76rSzFWnQlDOSQ+sZiHe3FSbFzSgItY4KrerX1CEEEOCVMHo33Ohucep9T8W6apJdCLXmJdx+UEPbET8gb+CtYI57MBdde70gOrXjKhfilmaCTNSg+96kxP58IiSe6pAeQVIIRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786566751; c=relaxed/simple;
	bh=81rHoOrQlf4dLih8DATUfBEZlHeIo+D1i6BG9B5MZ1o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XsjkD8lOJvZmMoxGpHpscCztWTcrX4wr9ETPVcxw+axwFTikm6uM4pJ8j5jgCGEowCvxMhs0vbC0LmSWRT9yESPsABK2ee7rhzvl8gjsCR1CS3FLaKcMbg9o4W2QC/Db1YLV3FIMMvgN5W+g3wa9PyNdrSTVJWOZu4n1Xg8es5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gTPTeizB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gTPTeizB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786566749; x=1818102749;
  h=date:from:to:cc:subject:message-id;
  bh=81rHoOrQlf4dLih8DATUfBEZlHeIo+D1i6BG9B5MZ1o=;
  b=gTPTeizB+HyX+GO4fhDEUZYUeUAq6c6H2MKQ3tKKHhZT4XGj8uNBOsIr
   CTBjy66fbApgqUhSKQD9TPntGLiP86A6gaH2OLG3VTEA+ndSLZlYKHWrN
   tSvu4GC04vCAF79LYVTXPsHnxqAwbm++1ilBbvVoPa0eEafvIdAsOvtPh
   PT9G/ResYVsjV9X27aGrX0I0PtZtE3xK6S8xeEVW9DQc157Hf1aGVoHJd
   S6CXO104mriTR3a+OmRWpjJqE2qcFMGlbvLIsLPs8kz+xOFrE9dhMzWSB
   SkroXYLJiOtmU3zhfW5mBXpxaglnVecj0HUIQTYm6dTLkOk9Kpi8d3wtz
   A==;
X-CSE-ConnectionGUID: kzezcsFYSBOhiy4o1s1yOA==
X-CSE-MsgGUID: NSpqVki6Q5izk+73JaAIRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="90814664"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="90814664"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 13:32:27 -0700
X-CSE-ConnectionGUID: fF6BGFNBSpK27Eyaysc3Xw==
X-CSE-MsgGUID: zmkzyJX9QvOaPc5DcjBvbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="268011495"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Aug 2026 13:32:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuFcd-00000000RcG-2Zcq;
	Wed, 12 Aug 2026 20:32:23 +0000
Date: Thu, 13 Aug 2026 04:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Law <objecting@objecting.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: decompress.c:undefined reference to `__ashldi3'
Message-ID: <202608130401.pONAe1jp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
commit: d4dba3b9c03a326cfa73833d6b166aeb442f82b5 lib: decompress_bunzip2: fix 32-bit shift undefined behavior
date:   5 months ago
config: mips-randconfig-r051-20260812 (https://download.01.org/0day-ci/archive/20260813/202608130401.pONAe1jp-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130401.pONAe1jp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d4dba3b9c03a ("lib: decompress_bunzip2: fix 32-bit shift undefined behavior")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130401.pONAe1jp-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: arch/mips/boot/compressed/decompress.o: in function `get_bits':
>> decompress.c:(.text+0xc8): undefined reference to `__ashldi3'
>> mips-linux-ld: decompress.c:(.text+0x16c): undefined reference to `__ashldi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
