Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F7234BA28
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 May 2026 21:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779485560; cv=none; b=lIsxhLU/3k5Alt/KAkh9i+1K/7LPpquCHUnq6X5fRTjycHohM2+3K86IINnSQwe3YHbwPNqTwPo4Vqa59xteGWHpjDhxfwtAAqad6XFAtRRHM5gIiQkzExjHHQ3wB748RU2I7krqNdiuu4JXkcUz2NnCPCPV1j3aGxJMZ/v65n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779485560; c=relaxed/simple;
	bh=hekKT1uIGL6+WOKjsMSFJ22O+8saGNyRdoW5+5EUj5o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=guT1id8QCtFB7ueH3ufo80TRkl1FbRX2QAVDrJTIdvwgP4ZZToxmBJAMfOhW2cEtIaFT/AYeedZmEpFpM5SrTtD2CiB2rvyU3xhvhTqIX7aokWVU0aCRKdV40AF/vUWEs9r8B9L0uSdt47DUolu0WxHgwkrTpY1tPTWW414g6so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ci3usc2N; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ci3usc2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779485559; x=1811021559;
  h=date:from:to:cc:subject:message-id;
  bh=hekKT1uIGL6+WOKjsMSFJ22O+8saGNyRdoW5+5EUj5o=;
  b=Ci3usc2N8Rm1d2QBvHlm4Aj20digLXqpGFzmOjmvhqZkfaB/rCQzBxpw
   YHv1srSzTzDq3hvGJMN1sQHL2QJPSkDlpHBNoKNL9It0wc+e3bnGrWvjS
   gJGlg3nWcmWELXbXpkIL3V2ZJjaPExvK8TPdJDMU/v5VnioiH8OcFl40Z
   X3zCSL8FexVKBV7GXUz3bPxm26TnOIniOkcItClkdcrTpkVhHmfB3auIk
   maFHpXP5tEUSt18uhB9fC0CwpP0UNLQGGeL61qdO4TlKKCyGMS0gIQIdd
   T2SxK8bEfNg4g682JOgTmgm865tZlV8T1fWEQjERMOEC34ZycEb/t0RYW
   w==;
X-CSE-ConnectionGUID: c0h64eiDQrqsMwbq2XGXGA==
X-CSE-MsgGUID: gyStreUiRreHvZMbjU7lNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="79452559"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="79452559"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 14:32:38 -0700
X-CSE-ConnectionGUID: RI19uCZSReKJY9hMxY0sYw==
X-CSE-MsgGUID: u1o0arq0TvufehavYUrPjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="238436799"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 May 2026 14:32:37 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQXTu-00000000303-3Nfq;
	Fri, 22 May 2026 21:32:34 +0000
Date: Sat, 23 May 2026 05:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot/v7.0 31/1197]
 ./usr/include/linux/compat64_pr.h:4:10: fatal error: linux/compat.h: No such
 file or directory
Message-ID: <202605230522.mupCvcFr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot/v7.0
head:   af9683ebfd23308f714cc478321fb01e5c4a7104
commit: cef57a69a69cd2627d8c6da407d3d61ab87ef0f5 [31/1197] cheri: UAPI: Generate compat64 headers
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260523/202605230522.mupCvcFr-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605230522.mupCvcFr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605230522.mupCvcFr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/compat64_pr.h:4:10: fatal error: linux/compat.h: No such file or directory
       4 | #include <linux/compat.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
