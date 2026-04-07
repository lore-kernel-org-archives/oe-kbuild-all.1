Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F85B1E4BE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534007; cv=none; b=sOOxdjY/Zlm5zmGTt6pIuaZDfMPSKDo2jc+gtr1w1kGTC+G7s0/Kr3Yt5D9KS6+BhCRBsttQNRi9FMjN/CdbcHkSPgfJpadiwZLKIZavAZbp1DpnE5VSSd9MC0x4ss25NzUmEytZAc0u/JjxyVL1Aiw61g2FBq8eYgSt+3wtnYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534007; c=relaxed/simple;
	bh=GuNgz1ZO43neMxTaWkMqchNBtZBDmZjJvi8HweEdBy0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J3EwbLY9ffJf4qp18aXaPBtJu5sF8p02PCj4mSGMxtPXkYA+LYbJO0R5iXnJMjtBibMjrmqSuJ+pY/F5mFD6i/0ZpTSL8hAJSusDpgTooGkTvnqg3DpcsP5nb8kv+IwCkLAo+N7YrpXVUoXAbpwy+cX2AupF1Ni7f4iX1TKomp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F0YVyoes; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0YVyoes"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534006; x=1807070006;
  h=date:from:to:cc:subject:message-id;
  bh=GuNgz1ZO43neMxTaWkMqchNBtZBDmZjJvi8HweEdBy0=;
  b=F0YVyoesdhmwIN5LHqfaV1Ilyn6qXKj0HLSZS58IH2T+d+wyhxgl3rjy
   t9e3wfO+4W1x72sG1uiKgtAI/FvsaXbvlkgHYleY6xKP5xQcsgNbXD4/h
   OUy0NsvjZd0rYvMlbcIJLFb4vhz/fn7V2VoUPaltSYT4uuf8JYSmO/dXF
   PUlFatjmaPSoG/P8qSdK/6/LAbxU4bLE95aEoAIpkr2Vx1Cy2qXXPzIlj
   Brt+9V+w1azs9SXnGK6aoeNbiZJGP+Vu7+Qzxrmt5RgFDiUWgUGcz9kQE
   3aD2XmoTroMUTfmtt4mjQd41UZP4sgagmPtPICqRXI/bZ75UahDCHO4C1
   w==;
X-CSE-ConnectionGUID: m19vHP83SfWEAj9FlzyKnw==
X-CSE-MsgGUID: vf+V55QJQ5WaI563QcG3tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86781610"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86781610"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:53:25 -0700
X-CSE-ConnectionGUID: qnRqYHuOTNqVZkLnOm9I/w==
X-CSE-MsgGUID: aEkCBPllSOC5BhTtSEJrBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="225303573"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 20:53:24 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xV9-0000000003B-1zAO;
	Tue, 07 Apr 2026 03:53:19 +0000
Date: Tue, 07 Apr 2026 11:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 28/28]
 drivers/scsi/aic7xxx/aic7xxx_core.o: warning: objtool: ahc_reset+0x1fc:
 unreachable instruction
Message-ID: <202604040740.80Tf2C7h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sean,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   2ae5f5ed1b2f5c49e06cf1e40ed7d7249cf74aa0
commit: 38f17d1fbb5bfb56ca1419e2d06376d57a9396f9 [28/28] cpu: Re-enable CPU mitigations by default for !X86 architectures
config: x86_64-randconfig-r061-20260403 (https://download.01.org/0day-ci/archive/20260404/202604040740.80Tf2C7h-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040740.80Tf2C7h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040740.80Tf2C7h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/aic7xxx/aic7xxx_core.c:4171:13: warning: variable 'data_addr' set but not used [-Wunused-but-set-variable]
    4171 |                         uint32_t data_addr;
         |                                  ^
   1 warning generated.
>> drivers/scsi/aic7xxx/aic7xxx_core.o: warning: objtool: ahc_reset+0x1fc: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
