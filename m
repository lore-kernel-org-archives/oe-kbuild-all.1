Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E1F451992
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 19:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789502007; cv=none; b=Cai4Vf+oXaTPGsGiM/qPAzXkNH8JfSc2v6zY4ZKoWWoIN65XZSZZSAuOBewAwExs7WfQiIi4frvmZBMWfdsHtg4puHy/uxJunYFg/95JnZIWlgj5NTOzlyOVMnRbjU9UFM4egTQjypKmREDtSBgw321MJ0lSstsGdZDlEKb1hL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789502007; c=relaxed/simple;
	bh=PYWT2RgsEdwqHuSIXIsqTTbbuSDRYoWm4stN5KM0MZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XpGMkufnZ+JfZb53Db2xz3TiJq4uYypTyNhmta1Io7UU1OFQgp8RpwOH+4U87otLuUKDe2B52vU3HcPOusm6ViyL6eS4YrtLF2fDU89rvQlv2Cz8iGJzQ0J4b6Thg7+Vhp+V5gSKH5sdCGiMdHwbfCw9cJ6MTL6qrOPw2eOHwSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1K9ea+Z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1K9ea+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789502006; x=1821038006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PYWT2RgsEdwqHuSIXIsqTTbbuSDRYoWm4stN5KM0MZs=;
  b=R1K9ea+Z6cw7++66Y5vBvIuU/e6AO1zjl913nL8R7rcS5sCCizqU5oOt
   QxnjNeZ2lRmzcZv+3VkMPuASV0d3x9E2zMVyCz6w74ZXLDHLDk9CGzrFn
   tE2zAnW+A0dojTamHGsw7+HgkHCJR+t//+oU17Bxlrg8ys7kcQsN+Mzsp
   yFCQ8ljHQcnafKXt6V4am7HMXEu6rSpCIrA3Pkdsx3oefgmiEOf0XxZ/j
   QDCB6lc4UT1gPPpYNO+KTq/ANXRwwMqNZahlcoYHSPi+xar1gbMh2G3qR
   zQ/J+ZQoHh4UjqsrP0T6O7V0HRynPpNTharLX0e2Jc+JCojM4RngCpFtI
   w==;
X-CSE-ConnectionGUID: jXxy58sERxKKPU0HCbYi1g==
X-CSE-MsgGUID: jYQaaYgFRiuE+SN+sBz8mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100202922"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100202922"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 12:53:23 -0700
X-CSE-ConnectionGUID: pVxgQms4TC+8ZVfvU0KzPQ==
X-CSE-MsgGUID: CK5tG1uzReKXR1pTiG3ZhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296615092"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 15 Sep 2026 12:53:21 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6ZDT-000000000gj-1SM2;
	Tue, 15 Sep 2026 19:53:19 +0000
Date: Tue, 15 Sep 2026 21:52:29 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmaps-v10b-akpm 30/40]
 include/linux/dynamic_debug.h:519:9: error: '_DPRINTK_CLASSBITS_INIT' macro
 redefined
Message-ID: <202609152126.v2UDMDfX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-classmaps-v10b-akpm
head:   27e8ebc1c997eacd1d9221e0d313736244ae0db5
commit: 5959d9dd620041fe8451e9b2d2545b1084526432 [30/40] dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
config: x86_64-randconfig-161-20260915 (https://download.01.org/0day-ci/archive/20260915/202609152126.v2UDMDfX-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609152126.v2UDMDfX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609152126.v2UDMDfX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_bitops.c:10:
   In file included from include/linux/module.h:31:
>> include/linux/dynamic_debug.h:519:9: error: '_DPRINTK_CLASSBITS_INIT' macro redefined [-Werror,-Wmacro-redefined]
     519 | #define _DPRINTK_CLASSBITS_INIT 0U
         |         ^
   include/linux/dynamic_debug.h:70:9: note: previous definition is here
      70 | #define _DPRINTK_CLASSBITS_INIT ((_DPRINTK_FLAGS_DEFAULT & _DPRINTK_FLAGS_PRINT) ? ~0U : 0U)
         |         ^
   1 error generated.


vim +/_DPRINTK_CLASSBITS_INIT +519 include/linux/dynamic_debug.h

   515	
   516	#if defined(DEBUG)
   517	#define _DPRINTK_CLASSBITS_INIT ~0U
   518	#else
 > 519	#define _DPRINTK_CLASSBITS_INIT 0U
   520	#endif
   521	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
