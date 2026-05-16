Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348082580CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 09:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778925031; cv=none; b=W/9zqkWcewp84eksRnWyu2zPPBeN7ULycHwqm7NYIKeDwF8Ag4WU2577QJkIbzx1hQDa+Ubusngii4vdY20nmbjSQjS558fG2SkmDKInW05dfddrbq8XtRgHlhBoGG9uTUOLqyWUwkQ9jji39dLdVzIL/bldJ54bTFQUZ1Sm0AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778925031; c=relaxed/simple;
	bh=EK4ORYC/0pmdG0TmXrLF5vJLaOnPabrlULfWCfwhl6I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ok4NUK9Q+EH0zWp7POQ50jrJRvLCgdyLdgRarzO3AzXsHu1NLT3pXp5P0PxmguNbQ1yKYOs+nLjO/mWI1iaRrRzGYFXsi1zZN8jEXFQdib5Bt7rljBjicGYTfS5yrgn9sCUXsPNyQf9yG90EgAa7WzqRa6wbGUGsstbb9BPyqEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMqxKpvf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMqxKpvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778925029; x=1810461029;
  h=date:from:to:cc:subject:message-id;
  bh=EK4ORYC/0pmdG0TmXrLF5vJLaOnPabrlULfWCfwhl6I=;
  b=UMqxKpvf4NwwUvGG5TXcPmCHZ0iarapcjSMuxUyUbvoPHsvKVBjxLrpj
   NkdD2WgjnVCp5hasBE0KXR7Kbm+3sbmQX7IuE2c3R1zvKII0twGa/j4DU
   zVAUZPz5HEEHuODqfglaDXTuhl2uY/s53RtqHFWIX8DPjWgYH4Q2DZBwL
   LLGALIhgwLWBmOoO9onTM2U3Igy/3hOLJdb2QtOGAyH9iYOEvRp57xFfS
   n9Eo86EAanlTDaYgHQXvvepizbGenFE+9nM/F8UFGFkVYj4Eghe9iRzQq
   A9NzyG4ETvGkPgQncbOb6hXQ552SD+A8o1cor61j2bevZ8e1E0iscH1YQ
   Q==;
X-CSE-ConnectionGUID: KypdKq/DSCWttbzO/qHbIQ==
X-CSE-MsgGUID: gYGbWzIZTDSYkKMuuHsc2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79984870"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="79984870"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 02:50:29 -0700
X-CSE-ConnectionGUID: 8RsZYSdNQNerLkTcZHrvxg==
X-CSE-MsgGUID: cVU7BOKpSke5MmAOQniyng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="234492224"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 May 2026 02:50:27 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOBf7-000000000gv-088O;
	Sat, 16 May 2026 09:50:25 +0000
Date: Sat, 16 May 2026 17:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 security/apparmor/lsm.c:1915:15: sparse: sparse: symbol 'nulldfa' was not
 declared. Should it be static?
Message-ID: <202605161703.ITPBGagF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b5816a1652ad494d4af974f0000657b686bd683c
commit: 32928c1749e8a0162b168a5bb87c1b67e37281ff [0/1] apparmor: refcount the pdb
config: i386-randconfig-062-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161703.ITPBGagF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161703.ITPBGagF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161703.ITPBGagF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/apparmor/lsm.c:1915:15: sparse: sparse: symbol 'nulldfa' was not declared. Should it be static?

vim +/nulldfa +1915 security/apparmor/lsm.c

  1911	
  1912	static char nulldfa_src[] = {
  1913		#include "nulldfa.in"
  1914	};
> 1915	struct aa_dfa *nulldfa;
  1916	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
