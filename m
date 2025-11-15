Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3604E307AC3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 19:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763234269; cv=none; b=S5DZOk+rjNvECg6Yft5TeCVfUf/bR0EjGq6iDuTgMPY7ykiQ8M4SVdrmxhD9dTJ9nBX+M3MEFGCblcll0e994Mt8uTMbMSmpn54eYYvLPCebA5twli/fktdoFB1TuockEhUA4Zw85F27iR9yOvexBtlfXmDao6SaDxleVk5Nfho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763234269; c=relaxed/simple;
	bh=ueBIAissdbE2rNylSIiqjPFYNkDgZ+wha6Yk6wSsQUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=noJQEvKBcHBIi2jBClTOR7YBucySNmV2XdQzW2+St98vJoZ5/SOV/XK1zvCFz0JexvQ34cgor5li0eyb+cheIkofY0giVzweJiqkaFSb1cVA9B3aEAF9PM9zpkzyoR6fiBmO5ALCzhwpnERsD2dAtuhvpAs2MdbGtBuczu2rp9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHg6ZLKB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHg6ZLKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763234268; x=1794770268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ueBIAissdbE2rNylSIiqjPFYNkDgZ+wha6Yk6wSsQUo=;
  b=fHg6ZLKB6bSJHeyuzkKvO1ZoCr+tAH5tUIrl9rZs1hJySWdip/YkUgcy
   kFaKUoWnQc7TrPGr035jYXdNlI94w4TqbNjE112gZBXUnb5S+grdt+YpI
   aMcahvNzljypZK92fwVx7AIDQHssdIDUrUq6HnUm6B++gSZQPAxSyqmNf
   CeWSXWWkVlDtVPLdgIPKoqt5bbAemaKhtPCq2umabLOMm0wkzUHl2ho8a
   NYYLqBzQyIczTMrRCgMMSi7ZK1jPQMVdTKvLlZQk5MBDQxzFcg1s4sSzW
   +SYkOgS9zzhRtXEi1olRG2mBlQvffcbSIYlNvuuYeDtznek83uQaNtD1o
   Q==;
X-CSE-ConnectionGUID: wOQN/mgdRr6qoK3PBrzm1A==
X-CSE-MsgGUID: Do8d1VqCS7mwtrWgjz6s0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="67901332"
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="67901332"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 11:17:44 -0800
X-CSE-ConnectionGUID: IXKnlsu4QUGcwimd1zdiZg==
X-CSE-MsgGUID: /pnF3jRCT/S4DUOTIlg3xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="194194210"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Nov 2025 11:17:42 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKLmG-0008CV-1B;
	Sat, 15 Nov 2025 19:17:40 +0000
Date: Sun, 16 Nov 2025 03:17:18 +0800
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Subject: [akpm-mm:mm-nonmm-unstable 82/133] fdt.c:(.text+0x6ac): multiple
 definition of `kho_alloc_preserve'; mm/mm_init.o:mm_init.c:(.text+0x0):
 first defined here
Message-ID: <202511160302.QiMsgMfT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   4fc88c237bfe11bde443e104428aac56e63a997f
commit: 88316955b5b1b4cb0cb2fad416f7e8dde9b246a0 [82/133] kho: introduce high-level memory allocation API
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20251116/202511160302.QiMsgMfT-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511160302.QiMsgMfT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511160302.QiMsgMfT-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/of/fdt.o: in function `kho_alloc_preserve':
>> fdt.c:(.text+0x6ac): multiple definition of `kho_alloc_preserve'; mm/mm_init.o:mm_init.c:(.text+0x0): first defined here
   arc-linux-ld: drivers/of/fdt.o: in function `kho_unpreserve_free':
>> fdt.c:(.text+0x6b4): multiple definition of `kho_unpreserve_free'; mm/mm_init.o:mm_init.c:(.text+0x8): first defined here
   arc-linux-ld: drivers/of/fdt.o: in function `kho_restore_free':
>> fdt.c:(.text+0x6b8): multiple definition of `kho_restore_free'; mm/mm_init.o:mm_init.c:(.text+0xc): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
