Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEA722D7A1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982116; cv=none; b=GpilhkwJRIErsI2WaOJxDzdpfJhU9t1EzgyJFHotQvxdVhHwvOxg54I5Q8K66IVPoDnU0N11xlWcrTpZrh2n30Ac9FiDqkU4tm9G0WQw9Zc94pNlsoxNA6XNgIp6hBmlLJ1IRkq1StETcfUHD/uL4DVRPdQoLRr8IaMC9jvDjIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982116; c=relaxed/simple;
	bh=+we0t2KMVQzCeVxNaO9zTGijXL+vsdjd0/hfnhqUpi0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jigTkjooqFBhVfM4oilrEW4NZTUhtp89YQ3CAKRQH3yAhNT8VeshfiQeyVlBH6FEml9AGzHB0xFvl6+CV+2gz274r4i9g51O0d3hb1XogNqXWWn62iYn2cfLECEEtnvSkVQzWIYRi2OjplelUSJh+T0JHmdwioRtrxUsiSL6odo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lr/r9KBr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lr/r9KBr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779982116; x=1811518116;
  h=date:from:to:cc:subject:message-id;
  bh=+we0t2KMVQzCeVxNaO9zTGijXL+vsdjd0/hfnhqUpi0=;
  b=lr/r9KBr3HBYOqlE8j9qc7zNJ7QlmZzrkEdLc8ad5SCOuDS1SU8yCtha
   1iQx2QUvHsK9VO0+Hekhh60dU3cjzEzlotvtXswXwTdSgQKtYFcyGG29e
   Au81VG2IK3Ggmj/rHy6zwqqsJgVOyOgIRMM+e4528ZDHO0HdqO8PLJ+Eg
   P7YTG2J99cWVazFPkOU+P1b2SIws11n1JXo++Wp9HGenru8qZyCDzen4Y
   lrOhXHi4PkoXHdqTUxE3wfX9QNYjPxP+o+DxKjVlMJALIsqJpWr4l0PHF
   O/WVidu311a9SVENtdyLKq7UdPfsXfokpObCTOQFHdL9yGNMwC5xFsvvq
   w==;
X-CSE-ConnectionGUID: 6acqqk4kS52DL2akBvnkOw==
X-CSE-MsgGUID: ysGAktoaSDO4l5HtnzRj3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80550561"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80550561"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 08:28:36 -0700
X-CSE-ConnectionGUID: vBrurvtWSJGGv0yAPqcX7w==
X-CSE-MsgGUID: hk4Gd0g6SPCYgz3WQSpSnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="239565934"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 May 2026 08:28:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSceu-0000000064k-0gFn;
	Thu, 28 May 2026 15:28:32 +0000
Date: Thu, 28 May 2026 23:28:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 14/23] <stdin>:1630:2: warning:
 #warning syscall rootns_create not implemented
Message-ID: <202605282324.idyMkVTF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   e5a6a778f0cd5584723651f07f5e46f765b4b2f5
commit: 6d82dd5dbc48fda06eeb470f65277f277f9ce0d6 [14/23] rootns: Implement rootns_create()
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260528/202605282324.idyMkVTF-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605282324.idyMkVTF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605282324.idyMkVTF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1630:2: warning: #warning syscall rootns_create not implemented [-Wcpp]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
