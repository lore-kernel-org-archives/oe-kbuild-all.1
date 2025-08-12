Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D376435948
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 03:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754970479; cv=none; b=PcUeJXoNid5lKLr8bFAN1pFwADRod9BYLd6CUCVRsviOsphzRFQi5/bB93LZBS0sKJLzmLaKUjBG69oES3LQZoHz0nUT1MbVs2uPKmtIFMPz/XWQIejL/sKanZ3jV4yqJ4cnPtjwOt+GMtz+3MLNY3obj5Vfmaa4tqChmDvOiHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754970479; c=relaxed/simple;
	bh=Rqusj9m/hiSfq0tXCxCe0zRMoZ04H6FUKkFluFMG2WU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HnoEcmgK29rSsRQwburKjYgtfgTXgYwty002CfLV7rwUqT5rKLi7UYwJeu1XOIzPwriRXCgRzbydpIkGxoA4vLW20DCcS9xqF64ypEf+M8TRShExacJbGKlWi76Q1sEh/y0GkZWeaqTFQufRtGjYsZXpfPxpjChwhK4DhbbQqro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDfAfC+U; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDfAfC+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754970477; x=1786506477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rqusj9m/hiSfq0tXCxCe0zRMoZ04H6FUKkFluFMG2WU=;
  b=bDfAfC+Uh4nQsJlzJdPBhIahb0Pt7XE5xh9MCQCjwMbn3wJARVT/xHT+
   5lT5CAqSdnEY00VQPI5u2q6QjPXL4RIz/t1UDdCC5vbGSPdiMQiooQFS2
   1JNMKqxbCPUxqXkJ/PPEwMkz3NrU9V/EoTalhlbjXxm0hKpbWXYovFHCp
   m2qRfWpN2Fhq3upYLv8x55Tg956WoMJFYqFEbX+gQpXNWFn3SBDJaqHSx
   d7ajl+sBMxhjmGDzZjm4V89SkEvq462w7dK8HBQS58+x+wybM+zu8xDFq
   cE/sVX8LQ+iXlaqlAKmZ0SHZQ+Z/T4zmmed8JHpC5w/8SMteoq4bpge7c
   Q==;
X-CSE-ConnectionGUID: 49WK9NexTmibZy13LwjXSA==
X-CSE-MsgGUID: 0qXK9cniSrG/WNm21Qhmfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="79805647"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="79805647"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 20:47:57 -0700
X-CSE-ConnectionGUID: LjIHrMrZS+KX+ibUe7jeag==
X-CSE-MsgGUID: NAYF/VF/QHqKlFjgVeISQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="196928480"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 11 Aug 2025 20:47:55 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulfzN-0006Oc-14;
	Tue, 12 Aug 2025 03:47:53 +0000
Date: Tue, 12 Aug 2025 11:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.7 9/15] Warning: mm/oom_kill.c:1399 function
 parameter 'task' not described in 'bpf_task_is_oom_victim'
Message-ID: <202508121150.gdCtcQgo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.7
head:   dbe4840307762d87486c81fa82f9cc0dc466b778
commit: e3b3777dd8616d81d075f793d7fcafa12c807a6c [9/15] mm: introduce bpf_task_is_oom_victim() kfunc
config: riscv-randconfig-001-20250812 (https://download.01.org/0day-ci/archive/20250812/202508121150.gdCtcQgo-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508121150.gdCtcQgo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508121150.gdCtcQgo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/oom_kill.c:1399 function parameter 'task' not described in 'bpf_task_is_oom_victim'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
