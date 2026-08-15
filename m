Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3498931618C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786805512; cv=none; b=jOlgCWe+OtLW8IGbUHih9i1cARGBN8mx0fx2Le5va3h1FGQNKoQsxC5LJknx0NLG/u38NUO6yBv68x5QKWnVSbpoXHPvAsQ0Qmky8QaHgmAU2xeQM79IDga4aMMx//Y4gjgmvWUVeLF+cnWSKK+EBJqbj2Ex4Ssr+vyex1WLOHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786805512; c=relaxed/simple;
	bh=joanGa6y7iYI9RrMAgcLBthoPErtxhPb5LevekRcbgc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LinjTYjMf1sfo8ooC50TadFENH1hd2khWThNbPHdnWiJ5jnJaiNl5HrZcrU49iGQbHad+BpcS1saA3P6TSpoyovRuCyauNYLiY05P+cNPtvf2WbfHFGWNfOYS/hMXtzW5FhREwUDkTmhpvn3r9/mm5WGOKajZxi6JIeNEZHZGWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gDr00nzP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gDr00nzP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786805510; x=1818341510;
  h=date:from:to:cc:subject:message-id;
  bh=joanGa6y7iYI9RrMAgcLBthoPErtxhPb5LevekRcbgc=;
  b=gDr00nzP7hP2NsMDUyf08Ln8AyT2H7j9RMwiWYoWFv87RJslwFTjQRPj
   zA5Z0IfcJobGJ2Dl26Ow5ojjjfyAZJm6f349+mH911AiaA7I4K4bI/XT5
   jyeYp94kPNaJMnK7VkWvdUrBM9DIlU7pd9gzOuO3tJlwAlK9UTpEZ5ym2
   rxN7fgNUBp7gydW96F3ALJo/uYgdYW/ltjQRhLendcF24wyjkcme8fQdN
   XZ4V6O61TtyNbEw6u196VeahW8eDDOfc8YCrqVi3nBi86/TKO6WYp+RN1
   10iMm5j0Oce97CDvjggzYT9pKS/s0y0vqv67byN/rCbeK/TccgSi8zd+8
   w==;
X-CSE-ConnectionGUID: mplCqisPRDOwGuUZdNdWNA==
X-CSE-MsgGUID: vlMG8jpAQVe4mCtsvUxM7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87481511"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="87481511"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 07:51:49 -0700
X-CSE-ConnectionGUID: /iirWcIdT8On0hJPBsncGw==
X-CSE-MsgGUID: J0wHhTKhRY+BGmliTd7hVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="287962565"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Aug 2026 07:51:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvFjd-00000000cGW-3Me3;
	Sat, 15 Aug 2026 14:51:45 +0000
Date: Sat, 15 Aug 2026 22:51:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 0/1]
 mm/gcma_sysfs.c:11:16: sparse: sparse: symbol 'vendor_mm_kobj' was not
 declared. Should it be static?
Message-ID: <202608152255.jnCKUEMv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-06
head:   578646d8e1186137788a586ba90d339174e9713f
commit: 3f3d84c99a6730553294bbe20941ea977fb9c437 [0/1] ANDROID: mm: add GCMA sysfs stats
config: x86_64-randconfig-121-20260815 (https://download.01.org/0day-ci/archive/20260815/202608152255.jnCKUEMv-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608152255.jnCKUEMv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608152255.jnCKUEMv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/gcma_sysfs.c:11:16: sparse: sparse: symbol 'vendor_mm_kobj' was not declared. Should it be static?

vim +/vendor_mm_kobj +11 mm/gcma_sysfs.c

    10	
  > 11	struct kobject *vendor_mm_kobj;
    12	static struct kobject gcma_kobj;
    13	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
