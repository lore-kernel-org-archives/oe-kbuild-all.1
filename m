Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0866539A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 04:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748061079; cv=none; b=i6Yk+XiCyX/hQqSOf92GemgW8k+FhooF/ImJ0y98ggE5eg3NDhPt0/ISfavQxLkmyvsv5V8e9rLNzw1Futnlv7DbbCSZsYHnpm7DR4Rt4LuxjKUDrwM3u2SRqy4/+7Q11RCkkLW+UXN0cz4sJdHd2F0vrokHWX++S1zM9xavx0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748061079; c=relaxed/simple;
	bh=Dzx2ejkA9fRb6K9KzUfSvoayxe977aw7jzxWSQjTkdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IT8swIsyMwhpuzt6cXVLIVXOvfumYngpJI+BIn9SehSZ/EHlOByy6XdecKN7WIuANwHDVs54vpeCa3Lfm3J9wadZc6rYxJyxqoYRZjUPyAapuhsKUIwtyYQ/oGt722xngVvlDJdxkE4oPiS45x9FRcibrsOv1QG8POIijB9OPzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b85pZstC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b85pZstC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748061078; x=1779597078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dzx2ejkA9fRb6K9KzUfSvoayxe977aw7jzxWSQjTkdc=;
  b=b85pZstCgMMrJvjQdZUnnH872mawaiEkhGFg61sP9LOO1PIqPwN2JGjS
   Cb2f3q6kKZHwyH9L7oYQhxAhhMuLJvFgxaAKgs+W+D1bzvM8fKkVfSweX
   3Y6/6oZRJKson3KpVY4UzGNEKirHqRRugexcsPoqTlR+xXFRp+ijYctKi
   FNHYT3Y0anO/44S1pGG3yN6vsYlohQ9unzTH4Nqa6wl2iNfRinYdZzw9/
   5HCED1TvyDwZ5l8Zskz+1b1/oOEuryWaOApnKjF3KVrRcKzPcy6DuoOEm
   rtWwZgWgFJ5+FvD55vMZRe6OUNKWM3J2Yp1c1cB/CN+dEvDpq17/HS7g7
   w==;
X-CSE-ConnectionGUID: 1xSzZO3BQgGN09pXxPxIyQ==
X-CSE-MsgGUID: q4lqrqWTQVGYWDtCd8WUGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50266933"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="50266933"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 21:31:17 -0700
X-CSE-ConnectionGUID: kf9VxUd8Q0eYCEkBv5LJqA==
X-CSE-MsgGUID: +Nsoo2i9RkqEfBbOENt2gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="141978124"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 May 2025 21:31:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIgXR-000Qwa-0e;
	Sat, 24 May 2025 04:31:13 +0000
Date: Sat, 24 May 2025 12:30:48 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Alan Maguire <alan.maguire@oracle.com>
Subject: [jlayton:uek-localio 2010/2262] ld: warning: CTF linking failed;
 output will have no CTF section: Type name must not be empty.
Message-ID: <202505241218.KKoHv1jp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 6b54a5f98028f22335751515ce25c05c82b21c54 [2010/2262] ctf: generate CTF information for the kernel
config: x86_64-buildonly-randconfig-004-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241218.KKoHv1jp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241218.KKoHv1jp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241218.KKoHv1jp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   CTF error: drivers/dma/dw/pci.c (0): while emitting deduplicated forward, error emitting target type from input type 21
   CTF error: deduplicating link type emission failed for drivers/dma/dw/pci.c
>> ld: warning: CTF linking failed; output will have no CTF section: Type name must not be empty.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
