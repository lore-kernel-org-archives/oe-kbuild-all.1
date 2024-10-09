Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6687161313
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 20:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728505288; cv=none; b=XVRGyMl9WMUfqA8uZNmOasufyMr8NBsuMFUJMESL0fEzKrKUb3WDDx/7mjJbuF1DtJpMCoTJra4I7gNuU6f9eAGkPTyLECdR3tKiF29FioCaoQNZ9LNVIdkbj5Q4LgjVt5L3gA9udDi+2g6IdxdxFte+QzmWc+u3x+S+R6yeiHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728505288; c=relaxed/simple;
	bh=KKclAz0GfIOsOq2vZn4eOQld51yEvRHRCEnstvQA4B4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sQEhbo4BH/bRFcrooM6GcfwwA8603gEDblKLRun7NDV1vGKj5p+0cSY7m+UItodk3/p1ySYCI8a246lszMMOggJohvB70mwlEaBXvpXAOKarbEGH2nN86k5edf7kzu5NC6XlDd2F6D/c8mn6Pj9VRe7DAh84Jyh8elpmbYo7crk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZTZVWlI1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZTZVWlI1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728505287; x=1760041287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KKclAz0GfIOsOq2vZn4eOQld51yEvRHRCEnstvQA4B4=;
  b=ZTZVWlI1bHSQQcSOBSfs7o+i6KGFmgcZT5t0FADtpVz6bs3JDw9CFDEc
   SnqMO4tGOV91nn3SViKHmdzJtibG67Zr2Gl2tbgz8xPEEuZFqjP1U5/1v
   Pjg+wpXY6v043iLlxn7ZoJj0F2NKLI9i8HKX4aKvNqcb7QTjRbeHM/MrI
   6nGyrnVQlCCOrSHTfOURe4X3UXM/cNRjVDFcudUk8SEJlZ1INsbf0HITi
   6arSWyMyMB446gQPdHsZugaQPacoLaWavgYSZwjLaYop26J3MCehQXy58
   Oyco6v7rHuUu19q/vGoYn7a3U/i1QVz/dpmbe68g81pCLPyqznQQNoz9e
   w==;
X-CSE-ConnectionGUID: Q303X6xsTYqDWvae1SV8Aw==
X-CSE-MsgGUID: KLx8j4FDSkeDLA9oiZlBnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27919353"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="27919353"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 13:21:22 -0700
X-CSE-ConnectionGUID: tgqT1GTlTvK6NTJvBtxweg==
X-CSE-MsgGUID: 6wnnW8dnRgWhqsLI1OOrAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="107116495"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Oct 2024 13:21:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sydBN-0009lk-19;
	Wed, 09 Oct 2024 20:21:17 +0000
Date: Thu, 10 Oct 2024 04:20:57 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-key-deprecated 4/18]
 arch/powerpc/include/asm/hvcall.h:556:1: error: type defaults to 'int' in
 declaration of 'DECLARE_STATIC_KEY_FALSE'
Message-ID: <202410100404.tT9kNuHR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-key-deprecated
head:   dcac197b3a60b3c0c8417cae924a5e9f22e2d8ba
commit: 9d18d6239993d7bfb1e5142a4d7b190de0ed2113 [4/18] powerpc/pseries: Convert hcall_tracepoint_key to new static branch API
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20241010/202410100404.tT9kNuHR-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410100404.tT9kNuHR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410100404.tT9kNuHR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/powerpc/kvm/guest-state-buffer.c:3:
>> arch/powerpc/include/asm/hvcall.h:556:1: warning: data definition has no type or storage class
     556 | DECLARE_STATIC_KEY_FALSE(hcall_tracepoint_key);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/hvcall.h:556:1: error: type defaults to 'int' in declaration of 'DECLARE_STATIC_KEY_FALSE' [-Wimplicit-int]
>> arch/powerpc/include/asm/hvcall.h:556:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]


vim +556 arch/powerpc/include/asm/hvcall.h

   554	
   555	/* pseries hcall tracing */
 > 556	DECLARE_STATIC_KEY_FALSE(hcall_tracepoint_key);
   557	void __trace_hcall_entry(unsigned long opcode, unsigned long *args);
   558	void __trace_hcall_exit(long opcode, long retval, unsigned long *retbuf);
   559	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
