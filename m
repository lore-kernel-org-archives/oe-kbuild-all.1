Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D1624B26
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 01:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726018525; cv=none; b=ALLC40cSyZfLRXp55MedzxY/MQwUniG1dMYJv8lhV3Kr5Zq5jMsuHWB9fQQaAd3T3i5f1eKVqsUgTy+cwpUx/nfBhmN06AgGPtd0zwvezR7gNEV/Tz4F5GMmq8CEWEdE9yAdoh/Z/d02Sr6egyksWQZcS6XsSWjYu+9MPHVRlYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726018525; c=relaxed/simple;
	bh=uZBGI9AC5epjr+t/41LcNbYQbmOnf+BQcv0uIzXcmnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uK9oLL0oO6PMCXLZYkgJly5SrIdOFW9VIpOcqZfeVqwlTlQxx0/uhY1b4rXe7bDnmb/CVyLCLO63Git02YgD9E9jDhryL5dJ9hwjBPg0wyYmhFgUsGFpqZX1IDlzeQo7JGwSyVM/NZ7qEJD8etepDNmllXC+5bCy199qs9aKBjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fv1oqhZ3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fv1oqhZ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726018522; x=1757554522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uZBGI9AC5epjr+t/41LcNbYQbmOnf+BQcv0uIzXcmnc=;
  b=Fv1oqhZ335xM6W5GfmGT1Q1ZggdM4GJLLaZSrkJHoS+6QVZ4b4m8yF4y
   LpUd122dD4Upzs8NbM8oPwpogbQ5SAE5I7W4A4KZ5Teh3810gaijd+wQI
   YMLJqRLdyFNLC3zyz7NyFb0ceUkejX7fbsNOczc8SNHloJNjQokfKUmOU
   1hLuMVP5Ver2cI8TRQwedPxBztrU7sSSJMRD4vz4MkeIrNfM569HHXrHh
   DWLgneZOzhHm6rorbh9t89ExuvSQnxX2UQz5eV4xmdfyvmIAYaj/Jqwln
   9+v2yVztPXr4QgSWfWwCiR3i7jerc7J/HRBTMXtkm/u/TXSOQkF6ZAcCJ
   w==;
X-CSE-ConnectionGUID: 8xR+/qW7QQ+mo9M1qRkxVg==
X-CSE-MsgGUID: j7SRplDoRR6gu4+nMfUKnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24663475"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="24663475"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:35:22 -0700
X-CSE-ConnectionGUID: usYvhOSXR1GvRkTgBqprUg==
X-CSE-MsgGUID: aubv7gD8R/6DX0yEHD0lKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="71820087"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Sep 2024 18:35:21 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soCGN-0002vi-0J;
	Wed, 11 Sep 2024 01:35:19 +0000
Date: Wed, 11 Sep 2024 09:34:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20076/23703] arch/x86/power/cpu.o:
 warning: objtool: missing symbol for section .exit.text
Message-ID: <202409110927.XJnvEERE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bf039567abd9303dc03746afaaf0854f41ed853b
commit: 27dd57ae7b305c8c1bcf55eab82c45d85b605149 [20076/23703] x86/cpu: Load microcode during restore_processor_state()
config: x86_64-buildonly-randconfig-003-20240911 (https://download.01.org/0day-ci/archive/20240911/202409110927.XJnvEERE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409110927.XJnvEERE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409110927.XJnvEERE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/power/cpu.c:78: warning: Function parameter or member 'ctxt' not described in '__save_processor_state'
   arch/x86/power/cpu.c:200: warning: Function parameter or member 'ctxt' not described in '__restore_processor_state'
>> arch/x86/power/cpu.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
