Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C4D236EDB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736857004; cv=none; b=KV7ZkzFpXh7US97HApUhG+ylOjGWzbA52oj9eBCbbkUwe9hZxjJyyBHjtPzz36857ykyytYfqurrH8JwzO4mGhYCbc1RQkFLB5sEzPvWZrY0UfgvsTN80c3MIoxc/8JLtA1UJb3g/zi/wBGesGMs4Po1PRub+nOoQpyP/AqytVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736857004; c=relaxed/simple;
	bh=hWIH6cgp4D5v8wYz2QsDScc6WX232RTIlw7po5MZaMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ojifUpFx74SXYRulRivQK21RCXSbTGmwSK7lbWsAsdAu2upLdgsIwATBsknsxZ+vA9NStwlsK/hsIf8tdgI0APvvJAld4I+H7e1TFtv6oyNKmrqVhsEmunVFMzHoulkLss8EgtMhvQFLUpKhxcD3vwvnUE/5kMEiuObkG3wMNGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUziOd69; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUziOd69"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736857003; x=1768393003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hWIH6cgp4D5v8wYz2QsDScc6WX232RTIlw7po5MZaMA=;
  b=iUziOd69BEcAMIV/fHvLRyQBjHeLPsn0LrNl4/hT825l3h3Tpx1arUsS
   QhKo528GsDyNPB5iUoyhyLgPOVHwoQDkomqnakoZJuOq81XUlXqlebeKY
   1Bfyfwg9kzJBZ9ilSmI0P1GXyVfpW+qgrtWRiP9LXDTPXN858igalduoa
   gdRRmIgxU1SdYSeVw7RJw3LCkLNBMeeBYvkNAP/koeMpyi1ZdbW99Ofl/
   1Z84B5N3PbAzxZ/YvIAHlzII1ulPeHzTqcYDT7NxZYT0kgr9V0Xyb9Cuf
   hQdmZRRSJlHfRPiqiee1vhAiVcbTRoq32igGX39KcX7dIY6pRKr678deN
   Q==;
X-CSE-ConnectionGUID: uaWoWkBZRr6BrDellchl5w==
X-CSE-MsgGUID: tjcxPVXbSMWcswdnHhUEJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="47638184"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="47638184"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 04:16:42 -0800
X-CSE-ConnectionGUID: pjhDJ/p6Ruy/eCHTl89qpw==
X-CSE-MsgGUID: /oMONKPISmucDwNGtpjFIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142070936"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Jan 2025 04:16:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXfqY-000OUh-2P;
	Tue, 14 Jan 2025 12:16:38 +0000
Date: Tue, 14 Jan 2025 20:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Xiang Gao <xiang@kernel.org>
Subject: [xiang:lz4-macros 1/1] lib/lz4/lz4defs.h:96:22: error:
 'LZ4_MAX_DISTANCE' undeclared; did you mean 'MAX_DISTANCE'?
Message-ID: <202501142028.mAPCyAD2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/linux.git lz4-macros
head:   cc151de616805bc027b30cfc99853989274e2a2d
commit: cc151de616805bc027b30cfc99853989274e2a2d [1/1] include/linux/lz4.h: add some missing macros
config: arc-randconfig-002-20250114 (https://download.01.org/0day-ci/archive/20250114/202501142028.mAPCyAD2-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501142028.mAPCyAD2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501142028.mAPCyAD2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/lz4/lz4_compress.c:36:
   lib/lz4/lz4_compress.c: In function 'LZ4_compress_generic':
>> lib/lz4/lz4defs.h:96:22: error: 'LZ4_MAX_DISTANCE' undeclared (first use in this function); did you mean 'MAX_DISTANCE'?
      96 | #define MAX_DISTANCE LZ4_MAX_DISTANCE
         |                      ^~~~~~~~~~~~~~~~
   lib/lz4/lz4_compress.c:287:52: note: in expansion of macro 'MAX_DISTANCE'
     287 |                                         : (match + MAX_DISTANCE < ip))
         |                                                    ^~~~~~~~~~~~
   lib/lz4/lz4defs.h:96:22: note: each undeclared identifier is reported only once for each function it appears in
      96 | #define MAX_DISTANCE LZ4_MAX_DISTANCE
         |                      ^~~~~~~~~~~~~~~~
   lib/lz4/lz4_compress.c:287:52: note: in expansion of macro 'MAX_DISTANCE'
     287 |                                         : (match + MAX_DISTANCE < ip))
         |                                                    ^~~~~~~~~~~~
   lib/lz4/lz4_compress.c: In function 'LZ4_compress_destSize_generic':
>> lib/lz4/lz4defs.h:96:22: error: 'LZ4_MAX_DISTANCE' undeclared (first use in this function); did you mean 'MAX_DISTANCE'?
      96 | #define MAX_DISTANCE LZ4_MAX_DISTANCE
         |                      ^~~~~~~~~~~~~~~~
   lib/lz4/lz4_compress.c:597:44: note: in expansion of macro 'MAX_DISTANCE'
     597 |                                 : (match + MAX_DISTANCE < ip))
         |                                            ^~~~~~~~~~~~
--
   In file included from lib/lz4/lz4hc_compress.c:37:
   lib/lz4/lz4hc_compress.c: In function 'LZ4HC_Insert':
>> lib/lz4/lz4defs.h:96:22: error: 'LZ4_MAX_DISTANCE' undeclared (first use in this function); did you mean 'MAX_DISTANCE'?
      96 | #define MAX_DISTANCE LZ4_MAX_DISTANCE
         |                      ^~~~~~~~~~~~~~~~
   lib/lz4/lz4hc_compress.c:86:29: note: in expansion of macro 'MAX_DISTANCE'
      86 |                 if (delta > MAX_DISTANCE)
         |                             ^~~~~~~~~~~~
   lib/lz4/lz4defs.h:96:22: note: each undeclared identifier is reported only once for each function it appears in
      96 | #define MAX_DISTANCE LZ4_MAX_DISTANCE
         |                      ^~~~~~~~~~~~~~~~
   lib/lz4/lz4hc_compress.c:86:29: note: in expansion of macro 'MAX_DISTANCE'
      86 |                 if (delta > MAX_DISTANCE)
         |                             ^~~~~~~~~~~~


vim +96 lib/lz4/lz4defs.h

    95	
  > 96	#define MAX_DISTANCE LZ4_MAX_DISTANCE
    97	#define STEPSIZE sizeof(size_t)
    98	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
