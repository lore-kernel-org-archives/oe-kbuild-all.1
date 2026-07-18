Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FDB2D3ECF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 03:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784344985; cv=none; b=iw+4iwtvXs1AqRm2EoYgZFHS5powF+w9hoFKOwoEhdKPkXK1MKBY8P/gB6yh3/SradkHPccSMziGFBmOhrx0Xs9M3xnP/sA/iNmllwAwS6z5EBdNMr0w1f/57td9zOYHTC1wgGaCLJQqBs/o6yiIEIISYApz/mRI3UGKporU4DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784344985; c=relaxed/simple;
	bh=6uki9amHVwnnpRw81YR6XWPVGObf2Zcd6mVBZX5s8IE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qlO8vFyTIwdITR6C9JAwPESxEZTmWXea9YNHru68DAT4m0odNDqYO2vU2yFQDoTFH4ZGIr/8b6Nzjyjvilw+FpQsrdSato7g2z1gXk1nXpZGb4ViLmdF8tweoLYlQqm1dvrsf0otcRBCG+iGw54ID40afppJdV+8qgMhEuQmxZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLu5zs5I; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLu5zs5I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784344982; x=1815880982;
  h=date:from:to:cc:subject:message-id;
  bh=6uki9amHVwnnpRw81YR6XWPVGObf2Zcd6mVBZX5s8IE=;
  b=KLu5zs5IpS66Hfhx6EYYsET5mpoHRl2vyAUHU0XDZmCxagjjTEW4PfZO
   FsykMqq6+ceFZuFF1I2Uo+SJBuenySz7RISABa+IrVg9Gw7GYKEXovBV1
   7I+M28G1TmZ1ZSDwyei2eJ79pYLCNwg9nS6v6R7SKLZvvl25hhhHO7IzI
   O9wzBYvB/sVuaVpbZDQkN/rzHj5eFNdKFqo48FNaoBHaFIzM5sswYen8f
   hkKwuNTtGsp0/H6p6vrTQdn3PEoKVC54nHFXH/12oxjGXdAR1Dr8RV30A
   BaruxDt7PItoxH2loiItZ31jr26K21+dw6LRdCqVRXaQKnQzhH2JIYEbK
   w==;
X-CSE-ConnectionGUID: 1fsXdnjwTuKzdcw0LaWKkw==
X-CSE-MsgGUID: N/D7/SI9SY6mexwlwnaJfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="88832820"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="88832820"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 20:23:02 -0700
X-CSE-ConnectionGUID: clHmRn3vRhG6W3GJekKPpA==
X-CSE-MsgGUID: 7tdN0YKiREebOHZbF82z8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="261911139"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jul 2026 20:23:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkvdi-00000000TPz-3bV3;
	Sat, 18 Jul 2026 03:22:58 +0000
Date: Sat, 18 Jul 2026 11:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc5 37/81]
 Warning: mm/mempolicy.c:2469 expecting prototype for alloc_pages_mpol().
 Prototype was for mpol_zonelist() instead
Message-ID: <202607181153.gLatcglu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc5
head:   0d3372ae148c7edad4bf772949f6a2852a059b6d
commit: fc440558999c0e94f91c3ca2650bf9b691d598ac [37/81] mm/mempolicy: add MPOL_F_PRIVATE and zonelist selection
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260718/202607181153.gLatcglu-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181153.gLatcglu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181153.gLatcglu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/mempolicy.c:2469 expecting prototype for alloc_pages_mpol(). Prototype was for mpol_zonelist() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
