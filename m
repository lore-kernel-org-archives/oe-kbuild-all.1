Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0416C1E571B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 16:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742573436; cv=none; b=T4WiajnySGsjxvSjMKG8ZseGyNDKtnC/wSqHBUVSn6z3GHyqQCFCa59asWpbs2WQm68hhOohQgpmVATMBhHxZUOI/V3x5ROZ9b+MynEA+ATnSoF8Vstql8/oFj00kt7uiE07sjsHlgyiLuH97/YbR6j5HdoxrB/nvuGKA+G8WJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742573436; c=relaxed/simple;
	bh=J6vVkSaFrug/OQhTrvRuFJlws91quUgiRtx6AC7I8mw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZsWbZhzLrK/fVaxw6Ev5YTpTt5+hZ0hyRGpqch9WqPX5LUN2nAmoETSp/YQvx+FouJ4v4A/EfpbDbRkV0jf0txvPRaQauybtLURJylgS1R/hWLeg9cvUsh7/I9J2eLU/ZZGaYezlKhi3KE6qycRxtQeMg5VqlQqy3uo96aBURHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4dZPuNp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4dZPuNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742573434; x=1774109434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J6vVkSaFrug/OQhTrvRuFJlws91quUgiRtx6AC7I8mw=;
  b=E4dZPuNpXmusWIwe5f6KsDUga42RT3K63i1mUmtaldyLWFT07RJiN2lD
   ifj5A18S7uGnpsAA1HLX3GFRx6qEb4R3VCArcZwJkUYQNNG7M9d3/dp5l
   yOv5xGE0TUQ0QRPERvGPnAVU58LmQ4jnX2iC0BGG79T+y1YLsR5q4jutP
   zmfERl9CEjFz/4N42GULRS5xKZ1KuukDI2nRkZA+76yL8+R3bLeHFgjgn
   VoOZphe0Vh/ozzblrqX+nIW2wQMD30fBhP4FjpznSRjIMCj9EVM6+BV9N
   u/rYr7ymGejl8whizPiH3PsgGYnBAXpONqqRKbB3tfxXiFonW8kjt3Tf3
   w==;
X-CSE-ConnectionGUID: ZChhXhn3SMaYDSU+ELTHog==
X-CSE-MsgGUID: IObKAEclSrW+6eZY4L6P1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="54839033"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="54839033"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 09:10:33 -0700
X-CSE-ConnectionGUID: jp/P2crJQuGUDvjUvK2cXg==
X-CSE-MsgGUID: llIicO94RveIQiHrHl0AAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="123898661"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Mar 2025 09:10:32 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvex4-0001TW-1h;
	Fri, 21 Mar 2025 16:10:30 +0000
Date: Sat, 22 Mar 2025 00:04:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1510/1510] WARNING:
 vmlinux.o(__ex_table+0x18b4): Section mismatch in reference from the
 (unknown reference) (unknown) to the (unknown reference)
 .irqentry.text:(unknown)
Message-ID: <202503220031.yoxWlnbp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   db5f05c237bbdb9b4d5862fc59bdbdafa8f72a73
commit: 11c79b45694659ce6342c84d2e14ebb648c68060 [1510/1510] x86/apic: Always explicitly disarm TSC-deadline timer
config: x86_64-buildonly-randconfig-004-20250321 (https://download.01.org/0day-ci/archive/20250322/202503220031.yoxWlnbp-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220031.yoxWlnbp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220031.yoxWlnbp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> WARNING: vmlinux.o(__ex_table+0x18b4): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .irqentry.text:(unknown)
   The relocation at __ex_table+0x18b4 references
   section ".irqentry.text" which is not in the list of
   authorized sections.  If you're adding a new section
   and/or if this reference is valid, add ".irqentry.text" to the
   list of authorized sections to jump to on fault.
   This can be achieved by adding ".irqentry.text" to 
   OTHER_TEXT_SECTIONS in scripts/mod/modpost.c.
   WARNING: vmlinux.o(__ex_table+0x18b8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .irqentry.text:(unknown)
   The relocation at __ex_table+0x18b8 references
   section ".irqentry.text" which is not in the list of
   authorized sections.  If you're adding a new section
   and/or if this reference is valid, add ".irqentry.text" to the
   list of authorized sections to jump to on fault.
   This can be achieved by adding ".irqentry.text" to 
   OTHER_TEXT_SECTIONS in scripts/mod/modpost.c.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
