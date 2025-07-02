Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEDC2F7CE7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 19:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751483792; cv=none; b=lQabhTZWo6mLkDfd6pdw90vkYhwSVNtUnXz1te1Y7pbk1mUzVmWVaxaO1zmnFtF7KWpHZ9znBer5UqE4inTcQTuSyJdBDYfaGkwL3KzOXobdpaAKyiQkOV5CrkAMXn7yfQxcSc4wn1tHNGXfgx3uKOvfLWXulUGg+E5yrMUd2lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751483792; c=relaxed/simple;
	bh=ibnFMytArBc215nrsYXcznGONbFmAlqM386o60g1V4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WirKeEEYQk+ndZ46P3VfuwOe9b3XIE3Y1idVz1rci4jqDIjkI4kaX0ADOxT/EelGfLs7l3qjXTlMyrOyVuD1MtxCpr52m7Rm6Ae9TgV+lGDCHmbXxAu2jVC3lJdwWHaQg3Z4vwZmZGWSkgJrqcFg4r29JEPKAuufTlr78Nr1MOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNHMU1Fr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNHMU1Fr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751483791; x=1783019791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ibnFMytArBc215nrsYXcznGONbFmAlqM386o60g1V4U=;
  b=hNHMU1Frzl7Rjlz1dZCH2Zt/IO7lnixSKSdzZv9s5VC1EryOqEExNqRj
   U9r/iGGLmqxFnBvRHZMazI0ftSgzP9ROv6lG/daK1bDtN4T2i3kFChJZM
   rskskPiixU68E2Ddm1Y3cZRBMhlUlDacpEOrqBO/Nq3VUHTsEymD/NO+t
   luJjfCFkEoMzRP3PtZd0keWCPRxAHA5TGWp/DDdPxZAg+xxOgMx6TgT5W
   x0Rxy5z4JYZ1becf3+a6Ki2IYGZm4yLvSUgkEyJwVqGowv5jbfQmaZWKX
   7aoQEjUu8AJsRLCOftd0VYajMjA5CCQ9s9WUViyOMowbNOci1hLC+yzYJ
   Q==;
X-CSE-ConnectionGUID: PEu7xZGsSpm151cDO/3uCA==
X-CSE-MsgGUID: O6USYVwGTrKk+tCDJUy/tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53027171"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="53027171"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 12:16:30 -0700
X-CSE-ConnectionGUID: Ok0bVSA7SZGSpf5UsV0EbA==
X-CSE-MsgGUID: ZDxjBarRTDSQ5FN4NUDcmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="153803191"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jul 2025 12:16:29 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX2wV-0000Kb-05;
	Wed, 02 Jul 2025 19:16:27 +0000
Date: Wed, 2 Jul 2025 21:16:11 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] kernel/bpf/local_storage.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202507022154.UFs4fbqs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d96cd567c8d8d584405abe92c2576bf58202fa6e
commit: de9cbbaadba5adf88a19e46df61f7054000838f6 [1605/1605] bpf: introduce cgroup storage maps
config: x86_64-buildonly-randconfig-2001-20250501 (https://download.01.org/0day-ci/archive/20250702/202507022154.UFs4fbqs-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507022154.UFs4fbqs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507022154.UFs4fbqs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/local_storage.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
