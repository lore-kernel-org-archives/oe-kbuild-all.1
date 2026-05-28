Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AD72571C0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983979; cv=none; b=W/d9HtsMKqJ8UpGtShaEePqiSRSU/6SJbnA/i4XZ27CJJa43HfQYtAbPtzs7XJ1HK4vWmbWyWIMGTXTCE4uxUY4/vzBgu0lf5ZrLsdc4+USs7M4Yz3dy14cpx1N91YgZwq1Vd/RpsHu1/cEyZuCu59C5C4E7pq2U5AyWPHnLrYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983979; c=relaxed/simple;
	bh=tpLXBa7OCDr3arTqoRa/wOORcEnapbVte3zRoJIyjM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T/jfD9NPogmsAdqbckg5CNOvJ2C3IBJuwOlaNfsE6LY9NTrGldS0y4Qd+YxW8hFJvJ8dgokb/VtrkcwtlUExj/NLROFMfCYDflV6hHjljk7wTY2kVYbaluRy8VtM5DtMZcHSfkI8BtZFzO26dqK5cQU/DRAVqxfY21HKr8wfKbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VL6V49NB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VL6V49NB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779983977; x=1811519977;
  h=date:from:to:cc:subject:message-id;
  bh=tpLXBa7OCDr3arTqoRa/wOORcEnapbVte3zRoJIyjM8=;
  b=VL6V49NBZglqAWQoQ930RwiMJdiKvtNFc5EtNZzSf/2usZN/K1oOWAiF
   olETZDQtlvanXMpsjaCaDlb3qsp4ZXE9lcnlM+8j2cAT9HoxAcEaDJ0Ye
   fVAEIRilQuJnRKDkU04PDE6x/agunKCJD/3YBSs68cYHjxGbu+6N2Lkqa
   iZneUnTdrx18GeMWbmR+Aw/prgxYiA0WNhnm3UFAWtS/T7mfDmz8/q+J/
   MMcPrrZgSDDcisq6phmPL1Uuthfqhucdub4hG/iZHLgKlD1RFHMxJ7hy1
   jSC4Y5t+ByvfGO9ncOGymvxspTXG4LD9RfkLHGy7tK/viuNvwtW+93Osm
   Q==;
X-CSE-ConnectionGUID: jDUYijiwTVSrTp8HsteOCA==
X-CSE-MsgGUID: lpk9BC7pSFuJnwpQkHPNrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="79978359"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="79978359"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 08:59:37 -0700
X-CSE-ConnectionGUID: 6ZMKgckjRS+rrhqI2vgiGg==
X-CSE-MsgGUID: lRXRZOzkRFCh6B0Vjwbccg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 May 2026 08:59:35 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSd8v-0000000066k-3TT2;
	Thu, 28 May 2026 15:59:33 +0000
Date: Thu, 28 May 2026 23:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 15/23] <stdin>:1633:2: warning: syscall
 rootns_wait not implemented
Message-ID: <202605282307.ULuMkkOn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   e5a6a778f0cd5584723651f07f5e46f765b4b2f5
commit: c33122882bc50e01504936c20aefc86b1dc1bfb5 [15/23] rootns: Implement rootns_wait()
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260528/202605282307.ULuMkkOn-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605282307.ULuMkkOn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605282307.ULuMkkOn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1630:2: warning: syscall rootns_create not implemented [-W#warnings]
    1630 | #warning syscall rootns_create not implemented
         |  ^
>> <stdin>:1633:2: warning: syscall rootns_wait not implemented [-W#warnings]
    1633 | #warning syscall rootns_wait not implemented
         |  ^
   2 warnings generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
