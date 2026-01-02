Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3291E7C23
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jan 2026 15:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767367088; cv=none; b=DvPIcALKe6m+DI3ng3dbcg3e3EUGgAPj+ji+N7PM9lwGFVTT0ET/bNZP99UsR5YWwLxekY0m/8B3wFWsn5TXiNMGYNWQ28ZrDiNompScwf/egEbihRcqEFJlnOt2cakQx4V+mUFcKFbbZvzbUqOscvLlMbfTKibLXZZNhPqGYH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767367088; c=relaxed/simple;
	bh=4hhkIzDWA8c8RxezGDLG4pvwHg/S1ix4negcT6VVfx0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IS837pF/xzfwc/TJAhx4aOz1OSRhCuKtiqmg6S71gMvhoAIEzUrylT/cB2FpXNngF6HMVxUCT7RuorkOSrs2zmMNifWcJy0f7h4wvZcWW2Sf1Ub6cIQWC8WTJylLrTTD9XwFhDatb8D0Wt8IFsjWbTZf9MkOedQ0DwhR2EfH68g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJX4DTjP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJX4DTjP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767367087; x=1798903087;
  h=date:from:to:cc:subject:message-id;
  bh=4hhkIzDWA8c8RxezGDLG4pvwHg/S1ix4negcT6VVfx0=;
  b=JJX4DTjPC4ELz8dvxGQiH4WfhtNMojc3ZpPPEa2xq5/aCMIJnvAV0cTQ
   10EHKwevlZFzJa5MJ9gx1ZuR9EZ8lxeOkJl4u/9f2FHnteRtCCLHK91Vu
   hHnoS9e3u4QyJMozo3xLIE7R4CI+IOKjD0wtLFiGlp3PGqx8Zo/IWh6Ux
   Ejgkj9SKzYgcUyRe0ZNMO3rxZxy7PMS0bdvHyfsjjlObYLVRvoZ4PGlek
   rUO57X8Oxl2JGHickXBRKwsEgDx1pZkpxeTwzU2Bk/hvm3bRVHdbAL0uN
   NW4E3XGtUwjj6pIeDfKg9dAf3P9HxYpAFrjeYP/+vZXo482OCtf1D8sw2
   Q==;
X-CSE-ConnectionGUID: RRP3RGf8RE2VhsZu2WfEBw==
X-CSE-MsgGUID: 4r6E+I8RREaIgVttWBmpWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68763121"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="68763121"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 07:18:06 -0800
X-CSE-ConnectionGUID: RfsK0/o6QQ2pXzktjxm+XA==
X-CSE-MsgGUID: x93leUbxSk2U9vhaKJV+Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="205977863"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Jan 2026 07:18:04 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbgug-000000002Jl-2pQH;
	Fri, 02 Jan 2026 15:18:02 +0000
Date: Fri, 02 Jan 2026 23:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/hfsplus/unicode_test.c:43:2-7: WARNING: NULL check before
 some freeing functions is not needed.
Message-ID: <202601022306.Dll2Dylo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
commit: 6f84ceb98538523f49d544aa7c671c87cc23d1b1 hfsplus: introduce KUnit tests for HFS+ string operations
date:   6 weeks ago
config: arm-randconfig-r051-20251231 (https://download.01.org/0day-ci/archive/20260102/202601022306.Dll2Dylo-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 86b9f90b9574b3a7d15d28a91f6316459dcfa046)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601022306.Dll2Dylo-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/hfsplus/unicode_test.c:43:2-7: WARNING: NULL check before some freeing functions is not needed.

vim +43 fs/hfsplus/unicode_test.c

    39	
    40	static void free_mock_str_env(struct test_mock_string_env *env)
    41	{
    42		if (env->buf)
  > 43			kfree(env->buf);
    44		kfree(env);
    45	}
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
