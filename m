Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33578462
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 04:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766031847; cv=none; b=QxCHATDCrXaXwqvdGHiRBPVInkdKqA684kBx9tEJKDbpDXwm/EBUMnb/vZrYmt4Ubx2sSyH9Czvl0hx51Ni13B8+3WsR4y5a11zidYdhkVDeMePao94I9pcgT92KJJDqJK6BpVfxRPBxjU7i9XCzNj0oVioDYkbiJKWiT24mzhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766031847; c=relaxed/simple;
	bh=r5nG8lfxac9xq+0B18FML99ev64rnIRWIT5/MWlBJgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LTd1c5tCb90J2pX6mGIXTlCNrFoTK5gMSEdhljbV+eefEtLQyYzxYOKyhqJo8mAINY3B8OC+wcihB0kOuEyvk7lMRJ73dbIVp5dFToOR/Fv+T21+2YK+vSDSHfCpN6/zl5UvM54kZZPmLDcjE57Y70iKT3Jz2iyfH5bdu6lbwTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MAEeK/Wp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MAEeK/Wp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766031846; x=1797567846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r5nG8lfxac9xq+0B18FML99ev64rnIRWIT5/MWlBJgU=;
  b=MAEeK/Wpe3Ht0oIJ4YTRVTN8kDokR+vS4NjTy5m/AobjGxMeDu8KbiGc
   0q0SlWh2otl0T/ljw1pPDNG+WfnKNEYmed18ozUfN48vwH1XQRypV7r1/
   XWhB81w5PH7QEnRpD+5o+RrdTy2FkvObLFTkFuPLzHuMZNOSS4Sh9yH87
   pmGJSls39J6BIG6BNn599MkBbkTaLIo3PD15c1TgWzIzYI9q3zusd616y
   vcnWflMWP4a77OUYmthjlDIslBm5N1/UR2vgaxzzXKMyBSyWCoaMIF9Wq
   QGgFXHtcnVaYPSSxQLekzjDoDoldUmgMt5ynwK6Nhsh3ynGnDdT31TM50
   A==;
X-CSE-ConnectionGUID: Fwl53JT0SZaEzLzETFth5g==
X-CSE-MsgGUID: CSZ36JSQQo2PqIMiUD6lZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67861239"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67861239"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 20:24:05 -0800
X-CSE-ConnectionGUID: jCEAruefRC6dodSpKrFJSw==
X-CSE-MsgGUID: jPd5ct/FTRGZoVFxPt5mcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198087972"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 17 Dec 2025 20:24:04 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW5YY-000000003q4-1zj1;
	Thu, 18 Dec 2025 04:24:02 +0000
Date: Thu, 18 Dec 2025 05:23:14 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 40/40] load_address.c:65:69:
 error: implicit declaration of function 'strerror'; did you mean 'perror'?
Message-ID: <202512180546.xznwmzN9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   12597ffc824d027b45aa3fda9606a4f0c3835d81
commit: add3a49ae91a1f6390b3fbf14a7ec9c6231bfbd6 [40/40] selftests/exec: Build both static and non-static load_address tests
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251218/202512180546.xznwmzN9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180546.xznwmzN9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180546.xznwmzN9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   load_address.c: In function 'main':
>> load_address.c:65:69: error: implicit declaration of function 'strerror'; did you mean 'perror'? [-Wimplicit-function-declaration]
      65 |                 ksft_exit_fail_msg("FAILED: /proc/self/maps: %s\n", strerror(errno));
         |                                                                     ^~~~~~~~
         |                                                                     perror
>> load_address.c:81:25: error: implicit declaration of function 'strstr' [-Wimplicit-function-declaration]
      81 |         interp_needed = strstr(argv[0], ".static.") == NULL;
         |                         ^~~~~~
   load_address.c:10:1: note: include '<string.h>' or provide a declaration of 'strstr'
       9 | #include "../kselftest.h"
     +++ |+#include <string.h>
      10 | 
>> load_address.c:81:25: warning: incompatible implicit declaration of built-in function 'strstr' [-Wbuiltin-declaration-mismatch]
      81 |         interp_needed = strstr(argv[0], ".static.") == NULL;
         |                         ^~~~~~
   load_address.c:81:25: note: include '<string.h>' or provide a declaration of 'strstr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
