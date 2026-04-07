Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B99E1CBEB9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533823; cv=none; b=YfEzh9Zc+ABMuV7qV0hTjtmnUkISv/b8oBon46fTYPiHeDXbkI7E8I1nEoYN+iZnHMPa7fQ0hYlGCezNTW+jBbEQjWWIsJCtk3CY4BgCCNa+o0ZZyv38FoJAlFJtUjYKD/480uvKCdhabwYwTntngJWXiDeScODG7k+5C9CN8LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533823; c=relaxed/simple;
	bh=wJ4vE6T3XYwqL9Z6csA50yHzPTaaepKmsTeg4tDnR3E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J+1ISAPy7JmZ8cQt0m0nk5E8JJexY3dq4kA3vFJyGYQlsVQOkHHT80eH1D2ztayYOW16NUHQeJya8YhWOHweVd16FiX723MALKv+Jkgkqc2JK52s/vm8mXNA5pv66hd+6+b5hqGsw7J7lvfMOR1s5pv26A38I9wID5YS0cKLck8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRG49fYf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRG49fYf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533822; x=1807069822;
  h=date:from:to:cc:subject:message-id;
  bh=wJ4vE6T3XYwqL9Z6csA50yHzPTaaepKmsTeg4tDnR3E=;
  b=iRG49fYfZBgr8AVUjWjbWl1bB3Wvi4brYC08tnjPNzCx4lbp456vac++
   Tv3FBMCwjgM/NmVcQaJ0M6JUFimHJdvnHapYWLP8hCCQv4OLauOxCEGnP
   T6ZGCabMhZxjptKeLTt8/YP1dcWk+UvebLGfzCCTHbYAxgYGpzQPH4opO
   rWF6dtAqJ3MIQnm6WEhf3sQkmoCn2eWwigPtfAYc0MHG1wnhBv2B+mEIL
   nDmj3E71itRR+UeKDSWU8hyI4DulnVKiSsWiJgkLKnJRfcvl+SpoXqNdL
   rNmFtm+4/xkBXyYHpXgrlgnTUhiSpoiYBoOCGY+epWOI6rRYg6LhUURnk
   g==;
X-CSE-ConnectionGUID: 2qo2NbdLRG+7ktQbmQDqcA==
X-CSE-MsgGUID: N4I7hW6ySW6sIzjvSqoClg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87113615"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87113615"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:50:22 -0700
X-CSE-ConnectionGUID: jRWE84q5Sjqw12jBJbzW6w==
X-CSE-MsgGUID: 730cg9YBTzSpNCwTEPYMtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="223258473"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Apr 2026 20:50:21 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xSE-0000000001x-1oXI;
	Tue, 07 Apr 2026 03:50:18 +0000
Date: Tue, 07 Apr 2026 11:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm-crc64-neon-v2 7/7] /tmp/ccy3mQRT.s:59: Error:
 VFP/Neon double precision register expected -- `vmull.p64 q8,s20,s16'
Message-ID: <202604040013.oJVfdTXr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm-crc64-neon-v2
head:   1bdc1fc41f0cce1e9c1d610c8977eb89d80ee762
commit: 1bdc1fc41f0cce1e9c1d610c8977eb89d80ee762 [7/7] lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260404/202604040013.oJVfdTXr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040013.oJVfdTXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040013.oJVfdTXr-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccy3mQRT.s: Assembler messages:
>> /tmp/ccy3mQRT.s:59: Error: VFP/Neon double precision register expected -- `vmull.p64 q8,s20,s16'
>> /tmp/ccy3mQRT.s:62: Error: VFP/Neon double precision register expected -- `vmull.p64 q4,s22,s18'
>> /tmp/ccy3mQRT.s:76: Error: VFP/Neon double precision register expected -- `vmull.p64 q9,s22,s16'
>> /tmp/ccy3mQRT.s:87: Error: VFP/Neon double precision register expected -- `vmull.p64 q9,d20,s16'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
