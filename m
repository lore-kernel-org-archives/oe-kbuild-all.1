Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2411D555
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 05:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736833972; cv=none; b=b3pq4zUjBMkQznupaLWy+M6UxxxkHtsuxSiXO24BDbnXvayioZYbVpD27qLOQMoDl6QsVjtCG0qA0+qejMWBIAqTiolTfQaEHBrXQzrkMflQWZA4ZjmULjITMO0RGWsoQOIwwUzRbC1D0F6CnaVRry4QiX1oQmFTEZQXBzGmrqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736833972; c=relaxed/simple;
	bh=78V/392g/ScWTwVkhPHPPe2g3ApClZYQcO6ZVM1OdFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r/y0Is0jyDLzJ1UvfldrZSv6NioIbl8KVq0cnLMei8c7/snlMNG69SAB3+fBWyoaU28Ng/U7hSLIad4XDLfrWm7XUidfVlTPHv78YcbLDKRoyMTefD4LE4Nw/6XVQlAIAR1poEPIrTi2cbYkYUhvC8N4Wiw2k8lEjeyGKO9Xs8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTMuTvG8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTMuTvG8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736833970; x=1768369970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=78V/392g/ScWTwVkhPHPPe2g3ApClZYQcO6ZVM1OdFo=;
  b=kTMuTvG89a7hRfD6K5F/Tfwhx+BJe6H1DE16AC8NJJgYGJV1cU7OIfVs
   V0gEFpWE51ATha3DHiiRj2taSmOtmewJvmzmCD0C/YFIamRP+a2IjH1n7
   u1/o6i8aRIrqH1GwSjgutOAdMqczCFbPPI/xHUc2WFmaZqVr/HXtKN2Ad
   ai0L6/LDhU2Xd8ubl1EmfjSokHVC6J+S97CLmaCMPJLqvh1DNMT8zbbaG
   I/qmoiz5CqWWzosPwTvVX2MS3wONPhlazl1YZiYqZuHQ2gmmuDDGY0C3d
   2oRKKhC+EeQ3/JD19THup5PvKVEZ8ffZX+9OdJoSxqEzOpgSQ4blEPa4y
   Q==;
X-CSE-ConnectionGUID: UHPCgmt3THelNvAAQO6u4A==
X-CSE-MsgGUID: cTy4dtmDRuijqjr1zKZRgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37277985"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="37277985"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 21:52:50 -0800
X-CSE-ConnectionGUID: Giv4VdliSKahKCj+Z+jmtQ==
X-CSE-MsgGUID: aO29NmFpQ5eo3c33//mhKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="109635166"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jan 2025 21:52:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXZr4-000O9z-1k;
	Tue, 14 Jan 2025 05:52:46 +0000
Date: Tue, 14 Jan 2025 13:51:46 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:sframe_unwinder.rfc 6/6]
 arch/arm64/kernel/stacktrace.c:340:27: error: 'const struct unwind_state'
 has no member named 'reliable'
Message-ID: <202501141348.BEkaaGVm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git sframe_unwinder.rfc
head:   de8b6f19951d0f45e4ff55813f6259c3b58b7a0c
commit: de8b6f19951d0f45e4ff55813f6259c3b58b7a0c [6/6] unwind: arm64: add reliable stacktrace support for arm64
config: arm64-randconfig-003-20250114 (https://download.01.org/0day-ci/archive/20250114/202501141348.BEkaaGVm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501141348.BEkaaGVm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501141348.BEkaaGVm-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/stacktrace.c: In function 'arch_kunwind_reliable_consume_entry':
>> arch/arm64/kernel/stacktrace.c:340:27: error: 'const struct unwind_state' has no member named 'reliable'
     340 |         if (!state->common.reliable) {
         |                           ^


vim +340 arch/arm64/kernel/stacktrace.c

   334	
   335	static __always_inline bool
   336	arch_kunwind_reliable_consume_entry(const struct kunwind_state *state, void *cookie)
   337	{
   338		struct kunwind_reliable_consume_entry_data *data = cookie;
   339	
 > 340		if (!state->common.reliable) {
   341			data->reliable = false;
   342			return false;
   343		}
   344		return data->consume_entry(data->cookie, state->common.pc);
   345	}
   346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
