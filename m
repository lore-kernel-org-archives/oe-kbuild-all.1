Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A05330B2E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 06:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025402; cv=none; b=mUegeqUI+wQxKGEYXDCL7JAXK3LyvzJsGv2JmTDPSLA8+pqUBGJefeOnP4N4210dMJ1XTtiPd7lrGbhuVTIjXtxjsqXhONvs8lKjadlFPBtopQPUJ33Oez7Am++6XXFGywMHZmnVLNiajW62QXFZBLUm87p7kmwxUcIz1l+7M/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025402; c=relaxed/simple;
	bh=QGGQ/Hfa2CU6Z1TD0eYjfEEz/2jPVQelhv8NmTuZqlU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hb3T+GbcCGd2SwEmcE/5PDjV3USrnwbLJU0XPcECYqUe9pctUTrIZuGZJiSYs3cCtZi2vj7Liy5esvmZPwjlAHUQDKsi79D/52/Gh8r0NH8LTX6yb2P0KZZELe0vXT8yICEaCNqwqyPszxeuUX68h9cUBimq1SC+T5XhIXMTawk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3uhBiWG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3uhBiWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775025401; x=1806561401;
  h=date:from:to:cc:subject:message-id;
  bh=QGGQ/Hfa2CU6Z1TD0eYjfEEz/2jPVQelhv8NmTuZqlU=;
  b=e3uhBiWGWA7wOZbC+jG15znLDq4pKDGL/jZAFRLyJTE3zfJnCVXn00IS
   WPEyvzaFviLJXJQplNrJORJs09AQ/8SNgZeCzb6YSPOqjDrYK+WBq2j52
   zKg0VOE2qR89qGDibGpC/tHd/fTPuo218uXyV00JB1rfKomONbPtiIWOO
   fYajbNnwjaZ1ExaIqZtzitfdmXHtMj9L5PL3ZscHOt5O1lRw+xBmiIMfH
   BG7PAzvWNRSD5gEGt0vGwXs7kSIXyFaGM6W4R4Tmb1WJYTyvolW6Z4Qr7
   Ua0jbVty5uE50PaeOJjLrvQ1y1KyjYi8h8aTW9N+qJkP9NaRIzHnCQKuq
   A==;
X-CSE-ConnectionGUID: xEiIqp8WT56a4inb6gQrAg==
X-CSE-MsgGUID: mYYq8TJbSIGEpqqkgr03FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87514021"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="87514021"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 23:36:37 -0700
X-CSE-ConnectionGUID: vXeGyT6wRp6q3MTLXB2nCw==
X-CSE-MsgGUID: /is4+eUyQsGdwTc92iPQRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="249805329"
Received: from lkp-server01.sh.intel.com (HELO 699e4e600a11) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Mar 2026 23:36:35 -0700
Received: from kbuild by 699e4e600a11 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7pBo-0000000002j-1OO6;
	Wed, 01 Apr 2026 06:36:32 +0000
Date: Wed, 01 Apr 2026 14:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 124/135]
 include/linux/compiler_types.h:706:45: error: call to
 '__compiletime_assert_350' declared with attribute error: BUILD_BUG_ON
 failed: SECTION_MAP_LAST_BIT > min(PFN_SECTION_SHIFT + __ffs(sizeof(struct
 page)), PAGE_SHIFT)
Message-ID: <202604011400.OFLcOOmf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   d873dd7a326a5b9f970008d4b59ae2c9e4e9b12b
commit: 28208ad9dae4d1eccc9280bc3193b4091afd6a1a [124/135] mm/sparse: fix BUILD_BUG_ON check for section map alignment
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260401/202604011400.OFLcOOmf-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011400.OFLcOOmf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011400.OFLcOOmf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'sparse_init_one_section',
       inlined from 'sparse_init_early_section' at mm/sparse.c:323:2:
>> include/linux/compiler_types.h:706:45: error: call to '__compiletime_assert_350' declared with attribute error: BUILD_BUG_ON failed: SECTION_MAP_LAST_BIT > min(PFN_SECTION_SHIFT + __ffs(sizeof(struct page)), PAGE_SHIFT)
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:687:25: note: in definition of macro '__compiletime_assert'
     687 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   mm/internal.h:975:9: note: in expansion of macro 'BUILD_BUG_ON'
     975 |         BUILD_BUG_ON(SECTION_MAP_LAST_BIT > min(PFN_SECTION_SHIFT + __ffs(sizeof(struct page)),
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_350 +706 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  692  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  693  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  694  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  695  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  696  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  697   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  698   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  699   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  700   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  701   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  702   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  703   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  704   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  705  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @706  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  707  

:::::: The code at line 706 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
