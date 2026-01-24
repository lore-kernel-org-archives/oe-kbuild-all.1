Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A832D1391
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 03:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769224845; cv=none; b=Fzynk5Gv1f8/sar6LdZMBERmWYihFblmgyVIBcKto4GS40nrSAaDzHQD0N0tV3C9sVd8ENvf+pHdSHhUJJkau3XQcMmyqKvEnXCdcUeLbrKdsUpDmzHCIzKuZ2qLMfiPtYPDpngSO17jVK5CahuHp5e1o5s2i6BgwVfoHTIbCoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769224845; c=relaxed/simple;
	bh=2q17eRNJYKuO+nmXySe4HVpPdSH7Tred0YPMWg0TLtI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UNALE0vgcCUBuADUYhWaE0eQwr+qSozoxdq+3ImoGKAiFKkwSTLHXMOVKCpMR720VdbSJGgESqrYAH7TW9V1WqxiZ/iPXgNs1OuwQK722n8jTVswQkpZ0kvNLI3ant1YH4toW0mHvTVc0fk2vTY2lsLcgeghbiAZ6bxEUggC4Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hseG042a; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hseG042a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769224844; x=1800760844;
  h=date:from:to:cc:subject:message-id;
  bh=2q17eRNJYKuO+nmXySe4HVpPdSH7Tred0YPMWg0TLtI=;
  b=hseG042a5bjAuMBMzprf6DEgLwL24iWogSW3nArDi6wdR9MRTEDtpAhF
   qVqToJ6YGx95c13iYxCHq1R6bJ0+1qyJotX9pmatOsjcXazIslQTtfv9k
   lFAu8C8qunilLUESWJ4sBGAq4AJlRIvi5u6oy89D2Xm6x4YQHrJlmJRxZ
   ZflTE0a9Yz90hi69WOw0HRnRAs1QMvggZxgf8oTmNsWh98wQBp6CGXQK2
   R3eD8w/TCyEosB5Drm0gchiZV2b+YihoS8oJacUDk59DA1hifPQCovS2B
   Z8D4NBQuffnYwz9FW4yUyPwAXHogxC7VYUuru7AmkA2uTR1J+p0Xjr8OL
   A==;
X-CSE-ConnectionGUID: xVKXZ+ToRf2ieUkcTv/RxQ==
X-CSE-MsgGUID: ncCQagbjRBy4pnuiloqh8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74338422"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="74338422"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 19:20:43 -0800
X-CSE-ConnectionGUID: 6WgGsiYpRcmAWfQ91bd5BA==
X-CSE-MsgGUID: scNNTnDNRPSXsmhC6aw9JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="211641785"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2026 19:20:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjUCU-00000000Ul4-43FN;
	Sat, 24 Jan 2026 03:20:38 +0000
Date: Sat, 24 Jan 2026 11:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-testing 50/53] powerpc64-linux-ld:
 fs/nfsd/debugfs.o:undefined reference to `nfsd_delegts_enabled'
Message-ID: <202601241129.xQwA6F28-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   297c36c70a94b990fcc2d143b406beb0309a2a2c
commit: bf18662aa8520b408479ac0e99d8168b5ac18106 [50/53] nfsd: add a runtime switch for disabling delegated timestamps
config: powerpc64-randconfig-r112-20260123 (https://download.01.org/0day-ci/archive/20260124/202601241129.xQwA6F28-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241129.xQwA6F28-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601241129.xQwA6F28-lkp@intel.com/

All errors (new ones prefixed by >>):

>> powerpc64-linux-ld: fs/nfsd/debugfs.o:(.toc+0x0): undefined reference to `nfsd_delegts_enabled'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
