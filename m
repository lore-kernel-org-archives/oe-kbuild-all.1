Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4AB524AE5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 19:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809283; cv=none; b=ZyjrnG7Q5h7KpzY809x+SQBOVVntBpxic86N+O2oct3Lc3UI1n+WN2FKVF8Farat7NQ7SLFvmOarnDh0Y0DCCmum0/UJ/Y4VSfifTD+JhIQdf9ya/7Xf9j0Q/7MB9oY2dExWthB227P337IircA0L5gYeRdote8fLr0lX8ro3xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809283; c=relaxed/simple;
	bh=QFO3ihPmh0XPNdm9uC9lK8CMJzy93unfGBu/2GRgJ+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dQO+2nEl+j1rvHhxFoPi/oCegNvz7Mkhnbw6fVwh/x0Ei6zAJyWzOCnXED1qhkpEisIRyhYEFHKrKXj/oYn2Um7s0reOjaWPK/Qj1Ox3TiiZa6l/fziWhxVGDcAu2UkwtyxlXkhCYubFv8E30O0uCCTkWMe+JcN167lbgF63aKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hn8gKkts; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hn8gKkts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788809281; x=1820345281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QFO3ihPmh0XPNdm9uC9lK8CMJzy93unfGBu/2GRgJ+g=;
  b=hn8gKktsxVcARDF6j+AN/bUNiorsPB9pDYuqctFRkV+T2sX7h4Hr+Fe9
   LcOmGMZdzzJTqnhePeddD6e6p6engBNoPysZcJ8qzLCPogRohnlQUK9ND
   NtwnxjgSa5JcBKaEqvEM5kBlb7zazKOec4cJZQPrnedOU46Z5G2vrM85y
   ygBqQuDr8W8a11v1cgYXR0V5+At0Xeu0p9cGU9F6FC1XuYxBSJa7voTMq
   okqbicxOFUsvIJBhRSAww6d+3OxBIjH9j/8IaPkz6O1SKqHo19kvG5BKs
   vl5CO6BCk4zJUA2oCf0o7xvsl3UM1O9bVkz30mlSGmDpa0PtjETO9h6xf
   Q==;
X-CSE-ConnectionGUID: mK0kodSzSmukAA2KS3WO2w==
X-CSE-MsgGUID: dMVxtbVpRQiSaEbp+hIOcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89337741"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="89337741"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 12:28:00 -0700
X-CSE-ConnectionGUID: vPmxNue+RAeMcRduxlFcKQ==
X-CSE-MsgGUID: gUQ6Tvy/TPiKHRtOQLAuPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="295675857"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Sep 2026 12:27:59 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3f0W-000000001HV-3c2n;
	Mon, 07 Sep 2026 19:27:56 +0000
Date: Tue, 08 Sep 2026 03:27:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:wk-merge 156/169] lib/dynamic_debug.c:304:1: sparse:
 sparse: cast truncates bits from constant value (3000000000000000 becomes 0)
Message-ID: <202609080319.eYP1bXI4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git wk-merge
head:   0a0ae42743814d601c19e361402c731f47824ec3
commit: 307eaf4154a2d1ffc276dfc80194a5d9a1eefe40 [156/169] lib/dynamic_debug: Combine 3 site-data maple trees into a single tree
config: sh-randconfig-r132-20260907 (https://download.01.org/0day-ci/archive/20260908/202609080319.eYP1bXI4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080319.eYP1bXI4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080319.eYP1bXI4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/dynamic_debug.c:304:1: sparse: sparse: cast truncates bits from constant value (3000000000000000 becomes 0)
   lib/dynamic_debug.c:305:1: sparse: sparse: cast truncates bits from constant value (2000000000000000 becomes 0)
   lib/dynamic_debug.c:306:1: sparse: sparse: cast truncates bits from constant value (1000000000000000 becomes 0)
   lib/dynamic_debug.c:314:65: sparse: sparse: cast truncates bits from constant value (1000000000000000 becomes 0)
   lib/dynamic_debug.c:316:66: sparse: sparse: cast truncates bits from constant value (2000000000000000 becomes 0)
   lib/dynamic_debug.c:318:66: sparse: sparse: cast truncates bits from constant value (3000000000000000 becomes 0)
   lib/dynamic_debug.c:1765:63: sparse: sparse: cast truncates bits from constant value (3000000000000000 becomes 0)
   lib/dynamic_debug.c:1767:63: sparse: sparse: cast truncates bits from constant value (2000000000000000 becomes 0)
   lib/dynamic_debug.c:1769:60: sparse: sparse: cast truncates bits from constant value (1000000000000000 becomes 0)
   lib/dynamic_debug.c:1931:34: sparse: sparse: cast truncates bits from constant value (1000000000000000 becomes 0)
   lib/dynamic_debug.c:1931:46: sparse: sparse: cast truncates bits from constant value (2000000000000000 becomes 0)
   lib/dynamic_debug.c:1931:59: sparse: sparse: cast truncates bits from constant value (3000000000000000 becomes 0)
   lib/dynamic_debug.c:2148:70: sparse: sparse: cast truncates bits from constant value (1000000000000000 becomes 0)
   lib/dynamic_debug.c:2149:76: sparse: sparse: cast truncates bits from constant value (1000000000000000 becomes 0)

vim +304 lib/dynamic_debug.c

   303	
 > 304	DEFINE_DYNDBG_SITE_ACCESSOR(function, DD_TAG_FUNC)
   305	DEFINE_DYNDBG_SITE_ACCESSOR(filename, DD_TAG_FILE)
   306	DEFINE_DYNDBG_SITE_ACCESSOR(modname, DD_TAG_MOD)
   307	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
