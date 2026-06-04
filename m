Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B93285CB3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 06:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780554241; cv=none; b=QrYfwyIUP7sl/w1jywD+TZ7xbknWmII4KmWw5+TEteWYno/xzt21PEKZvICcf0gOYZ/UESANDFq3kPRu/A1Hg42Y2cdcKmZ+SeM8O2zVkeCKCluirdlivvCdRJuKvKu6IgwnQ3Tj4RC6G9Bjdjd1c7qdYZEZqpIjc9TK4Xe20f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780554241; c=relaxed/simple;
	bh=RMOzP+3w/STflAD+FZMJ8lH94N/Vc2bMzOB2AUh4a+c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KW66uZzBC5VAJmgyqktgguUde0Bi/8bMAcInDf9kyH8gP//6lJ77Zo2vyUPGJxoMMrSfW6waWRvieIz4wXoYt33gA7Qd5+qgV5qfPxSN/Gg6gsgGXDDlXf2CFiElRYYk7BePhqK4+WS/Dd44A/SqHBmvM8LW/3/jhoko2zlM3As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gj5asjNq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gj5asjNq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780554240; x=1812090240;
  h=date:from:to:cc:subject:message-id;
  bh=RMOzP+3w/STflAD+FZMJ8lH94N/Vc2bMzOB2AUh4a+c=;
  b=Gj5asjNqNvs0oqTIcsEkGUPx7KgVjq9EUHhhG0B3E1kvNaYHYb/trkqF
   +2fsouXxqWbYPjeTTarl/3/wi+SeOAoEgJukEZJMdk59xSnsejeNFQo+2
   piN70Zs6D3vfdW03hPiK5QEypcIWZUiFvvpT0sD04msn9QGj1a4nBg6OL
   mxbNze6AAIsBY63Qv7QACgsOkqKQoNlxRImk+GZOnZWmPQ7GMza7atGD5
   s1fssMA3ECkQoZ5fuG6/lPYZvYE8eqQ4unvk9J7GJ9OSD8QIAIuvU5kHw
   NBSlO+SENMiEjS/esmYcu2PiBa15C805CDklG2AkneEBaYlp0dVeXZAxf
   A==;
X-CSE-ConnectionGUID: 22L1GXN8RBmB6i0A+SSUIw==
X-CSE-MsgGUID: hrNQcEbkSM+ssW9rSy2X6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="98948914"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="98948914"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 23:23:59 -0700
X-CSE-ConnectionGUID: so3V/HYvT5yrE1G1ZrV8ow==
X-CSE-MsgGUID: Ou5sL52gRfOO7DUf0IflNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="244535728"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jun 2026 23:23:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wV1Ue-00000000EMk-0TEC;
	Thu, 04 Jun 2026 06:23:52 +0000
Date: Thu, 04 Jun 2026 14:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] mm/gup.c:479:6: warning:
 no previous prototype for function
 '_trace_android_vh_mm_customize_longterm_pinnable'
Message-ID: <202606041448.AVmjttVH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Pengfei,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   8b70dc4403681c64dfbb65125fc2936cb25255cf
commit: 792718bb234ac19db3efdbc3215485e874c41584 [0/1] ANDROID: vendor_hook: Added hook to tune reclaimed huge page
config: i386-randconfig-063 (https://download.01.org/0day-ci/archive/20260604/202606041448.AVmjttVH-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606041448.AVmjttVH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606041448.AVmjttVH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/gup.c:479:6: warning: no previous prototype for function '_trace_android_vh_mm_customize_longterm_pinnable' [-Wmissing-prototypes]
     479 | void _trace_android_vh_mm_customize_longterm_pinnable(struct folio *folio,
         |      ^
   mm/gup.c:479:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     479 | void _trace_android_vh_mm_customize_longterm_pinnable(struct folio *folio,
         | ^
         | static 
   1 warning generated.


vim +/_trace_android_vh_mm_customize_longterm_pinnable +479 mm/gup.c

   473	
   474	/*
   475	 * trace_android_vh_mm_customize_longterm_pinnable is called in include/linux/mm.h
   476	 * by including include/trace/hooks/mm.h, which will result to build-err.
   477	 * So we create func: _trace_android_vh_mm_customize_longterm_pinnable.
   478	 */
 > 479	void _trace_android_vh_mm_customize_longterm_pinnable(struct folio *folio,
   480			bool *is_longterm_pinnable)
   481	{
   482		trace_android_vh_mm_customize_longterm_pinnable(folio, is_longterm_pinnable);
   483	}
   484	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
