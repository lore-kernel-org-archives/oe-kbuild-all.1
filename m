Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13281DD0EF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 14:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765292088; cv=none; b=YsFfF5dnwvrPxdGCV4BYwHZyX7VjRWczv+sj59QfI83YXB/HURwk++qsiQTD46+3RDr3uWuzCOOIQzdybe+vea9S1DRaYCx7zbLH3pEXntQxqXXBhbv7pWxLD9ovwT+fgtKOox4OVSI36N8dgIXh8D81bjzyDjB3tELG7TepkfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765292088; c=relaxed/simple;
	bh=Vbb0mTjcBB9u8p1eqiHme7RtI9PXDWlByIPtdiW91NA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qlAshla5f4xqjQhOCRJy8B2mecLIP1v1nexIhJLFV+fklioo1uc1edkBnhvFhB5X6hQSkdGmtio5ezubr26BAsrjKBlVBC9Kt9V95tRKId2xICWLdILIUv/+e/qMNEUzp8KC3oYBlLV92wdSCO8I7fwOVbkIHFFUYxzU/vd5Xls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jdqy6Gna; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jdqy6Gna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765292087; x=1796828087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vbb0mTjcBB9u8p1eqiHme7RtI9PXDWlByIPtdiW91NA=;
  b=Jdqy6Gnah/6jFRemoNRjfARz7l0Ki9j6gkpugZMd28VaDC1bxFg9yipO
   fZeKv0Wbm0rYcmqLX8k9n72ATsOtTO1pgvfYiJ4t9GsyckDuL9R2Zxq3L
   XNQ77lndCQPWpDN0Y9eNzO8usefQHixQfeIrT7UKa/PYZKLSGxunJoxCi
   S8JPpdxLibIapZ2xZHTksQGC/ivSgTER3dbavQljS9S6Ny8s25IeOeFlR
   ln25zmDWffyHK07LmyfTpGTEoQF+0HwY/lZI76oTDg79WWIGbCjfWC8Gy
   X1Up5AG/ArqJ2hdQxCs33xSVALnouOedYUTlmvH9qDlKhdZUFGNlKzwrf
   g==;
X-CSE-ConnectionGUID: 5UPhjEVxSMe+/spLvyPQWw==
X-CSE-MsgGUID: rI6MuBwoQkq3z3QA4PSnyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="54789557"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="54789557"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 06:54:46 -0800
X-CSE-ConnectionGUID: 3cnBd70ERaivS3gTzCpp/A==
X-CSE-MsgGUID: o3rFOA62RcGG7zx7hvtyfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="200726338"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Dec 2025 06:54:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSz6x-000000001v1-0F0C;
	Tue, 09 Dec 2025 14:54:43 +0000
Date: Tue, 9 Dec 2025 22:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.3 20/32] sparc-linux-ld:
 mm/oom_kill.c:1210:undefined reference to `bpf_handle_oom'
Message-ID: <202512092200.lnBnzJia-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.3.3
head:   757d46bae762bfc65cab977e0365e3f110f4e300
commit: 87f4eb904747c1edafa64353f98883c560d750cc [20/32] mm: allow specifying custom oom constraint for BPF triggers
config: sparc-randconfig-002-20251209 (https://download.01.org/0day-ci/archive/20251209/202512092200.lnBnzJia-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512092200.lnBnzJia-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512092200.lnBnzJia-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: mm/oom_kill.o: in function `out_of_memory':
   mm/oom_kill.c:1210:(.text+0x132c): undefined reference to `bpf_handle_oom'
>> sparc-linux-ld: mm/oom_kill.c:1210:(.text+0x1440): undefined reference to `bpf_handle_oom'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
