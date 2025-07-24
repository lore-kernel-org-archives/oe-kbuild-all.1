Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A19E23F295
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753350250; cv=none; b=H39ALC7KRtVIOeR7SFPS8sjuMw9AsbvvO3u2OsBxKAzxKg3rym2EswZJWH4P1HUyjhUQmkmJryosAED5j/K6OoxYLNulnXhOkvlNnCHs3sQaYovm9Xp7mHDW9BdDa7jLEseqlpjheMmXA2I5rJylUzqAJGEujdYocA7a4kdlkVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753350250; c=relaxed/simple;
	bh=fblJDFd3URAZvfRfzfAq5XyxosXvXb7BpwsC1VhlWYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R7eAjnN44EiuqoW6zeUjofpq8kTarcbyy8LFeECMK+8inZHSdXdYxXzaIH4G80L6AmVi5mB0RSrRy3P605Zw3ULD0eH17eSXanekEz4cp8cehG8h+A/Kelubs/ND7jugqHFNRSKvY33KLCQB3+t7xZuV5PMCbpzT2umpnIuLlrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SSD8uPtA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSD8uPtA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753350249; x=1784886249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fblJDFd3URAZvfRfzfAq5XyxosXvXb7BpwsC1VhlWYY=;
  b=SSD8uPtAPn2JW0IrSv+bE2v4LJwQZjkErvOtxOgenpQGLy4XDS9uLDok
   ric050dG+nd6j9NecY3e3yKPL0ru72r4N+UUZEq+fjmptKkQ5qhx0tBZ6
   p46fNNKoQazxQL+xINs0HUj0J460bdU9U9KXpmyQEd+sH9XFkJenrIDLW
   FuEwhrcHgB7sluUUO+v68ptgZAzOUi7IyB7sLOSuW7ygvAuwECl2y86SH
   rYrW50jmji6Ld8kgYI1pTGedQMqMmwp/QKWz7G4QjiJNqZ195u85IbqHr
   TJOX2gX8vUS/2fGOirbRCJsVjqU4bPArrzqiAdQTRDz+dC06BgFqrj/Qh
   Q==;
X-CSE-ConnectionGUID: 1m0g2gOSS7+p5UAn4M+uyA==
X-CSE-MsgGUID: veerZDS7TMW6+BagV3SQ9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="54749548"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="54749548"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 02:44:07 -0700
X-CSE-ConnectionGUID: MkCkSxvnSWuhxU33sqDpmg==
X-CSE-MsgGUID: 0o8GHbFJSH2VNXhfD/TEvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="160642447"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Jul 2025 02:44:06 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uesUe-000KI9-0J;
	Thu, 24 Jul 2025 09:44:04 +0000
Date: Thu, 24 Jul 2025 17:43:46 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:sheaves-with-microbenchmark 2/13] slub_kunit.c:undefined
 reference to `__udivdi3'
Message-ID: <202507241708.Rk5cxKqZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git sheaves-with-microbenchmark
head:   0ccec62a3cdf5cc2dcc69a139babc4f5aeb5284b
commit: 0c4fd4c733964800f18cf161362a82065710473a [2/13] slub_kunit: microbenchmark
config: i386-buildonly-randconfig-001-20250724 (https://download.01.org/0day-ci/archive/20250724/202507241708.Rk5cxKqZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241708.Rk5cxKqZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507241708.Rk5cxKqZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: lib/tests/slub_kunit.o: in function `do_bench.constprop.0.isra.0':
>> slub_kunit.c:(.text+0xc85): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
