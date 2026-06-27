Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01EF211466
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jun 2026 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554815; cv=none; b=L0PlIZUN1pyvDJLKp1Gd+2ELfGCdb00NIyK73DTBttAOmgjAglp5IwVUpdU0fhioPo2ifaTHDbFn+Y3B5xxopXOJbmdkduyVuvcTeVhkZJWBcbcDSl19C1ZqAclpujWEAvRQMjVp9axFVL9f5HGtK85NF5hUEHiN1TzkV02eAKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554815; c=relaxed/simple;
	bh=XwW+nVX7N6+3wPgc0fOZ6y1cy6zt4N+1TbqFgayJ8n4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vC3Aw6MVmCzB1vF1ytwRPTGrIkuSRe3qn9tJLfgUs57BwS6WrdPO7b7o1I72tUGi5WVXb7TEFsFiOjgzLy3CsAsklL6D2f5NhBshVDQ1jP0yUKaCaMX4Wn0c8CKuNRPhL5q2MKzaKl6UlIclW/W9rQxS9+YSN/CB+K9UmGWkjq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTXZmZ75; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTXZmZ75"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782554813; x=1814090813;
  h=date:from:to:cc:subject:message-id;
  bh=XwW+nVX7N6+3wPgc0fOZ6y1cy6zt4N+1TbqFgayJ8n4=;
  b=DTXZmZ757cCriSSEzdr5VBIGho9wgcWKbbrFle2fX+5H6E18w/Q/zwMa
   nkppaoPq9APd8vJ7kQ3jJSaG4ep7WqSdShGMXUPL1KXMPRyY8OVRC9Bk6
   yVApiJRl5T2clWdMixe5rvtiGYP6J2ZOyxwLBQJ7QKTTUILFXPCY9Uqoy
   U6XGrB0qwGUEhfUAUOO42NoSX7aVo1zRwCNOYnVO4TMj5oMziBcT4yXg+
   6RJjIxJxHgha0FP8pNYcvutCdCQ0HWBl21Qv1TvkHx45BBju9V1ZK+G+U
   eJp6GOLFfcGfr6jL4xJ7dtmShpaSw/2PNAmvpO3a6l5P1t+eyIMq0l7DY
   g==;
X-CSE-ConnectionGUID: Y9Dm1XcLTOmYPDIcIfqviA==
X-CSE-MsgGUID: 5VJ5zxUORbiK/Bzz/6Vhvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="83202423"
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="83202423"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2026 03:06:53 -0700
X-CSE-ConnectionGUID: A2ckyPhYTsWDvN2bR+AQ1w==
X-CSE-MsgGUID: lMX9+j33SkSLrx0tTZy3QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="251144457"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2026 03:06:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdPw0-000000005n7-1VSm;
	Sat, 27 Jun 2026 10:06:48 +0000
Date: Sat, 27 Jun 2026 18:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-26 180/328]
 include/kunit/test.h:501:undefined reference to `kunit_kmalloc_array'
Message-ID: <202606271733.Wu6V6p0u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-26
head:   3b1a6af55c000fdba23910aeb597cb608b44bed6
commit: bffc7fb8a232f84aa163c36aa3decdc2fc392d74 [180/328] ASoC: add test-hack method
config: parisc-randconfig-002-20260626 (https://download.01.org/0day-ci/archive/20260627/202606271733.Wu6V6p0u-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606271733.Wu6V6p0u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606271733.Wu6V6p0u-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: sound/soc/soc-component.o: in function `test_hack_component_alloc':
>> include/kunit/test.h:501:(.text+0x1a44): undefined reference to `kunit_kmalloc_array'
   hppa-linux-ld: sound/soc/soc-card.o: in function `test_hack_card_alloc':
>> soc-card.c:(.text+0xf1c): undefined reference to `kunit_kmalloc_array'


vim +501 include/kunit/test.h

7122debb4367ee Daniel Latypov  2021-05-03  487  
7122debb4367ee Daniel Latypov  2021-05-03  488  /**
7122debb4367ee Daniel Latypov  2021-05-03  489   * kunit_kmalloc() - Like kmalloc() except the allocation is *test managed*.
7122debb4367ee Daniel Latypov  2021-05-03  490   * @test: The test context object.
7122debb4367ee Daniel Latypov  2021-05-03  491   * @size: The size in bytes of the desired memory.
7122debb4367ee Daniel Latypov  2021-05-03  492   * @gfp: flags passed to underlying kmalloc().
7122debb4367ee Daniel Latypov  2021-05-03  493   *
7122debb4367ee Daniel Latypov  2021-05-03  494   * See kmalloc() and kunit_kmalloc_array() for more information.
57e3cded99e9c8 David Gow       2023-05-25  495   *
57e3cded99e9c8 David Gow       2023-05-25  496   * Note that some internal context data is also allocated with GFP_KERNEL,
57e3cded99e9c8 David Gow       2023-05-25  497   * regardless of the gfp passed in.
7122debb4367ee Daniel Latypov  2021-05-03  498   */
7122debb4367ee Daniel Latypov  2021-05-03  499  static inline void *kunit_kmalloc(struct kunit *test, size_t size, gfp_t gfp)
7122debb4367ee Daniel Latypov  2021-05-03  500  {
7122debb4367ee Daniel Latypov  2021-05-03 @501  	return kunit_kmalloc_array(test, 1, size, gfp);
7122debb4367ee Daniel Latypov  2021-05-03  502  }
0a756853586ce1 Brendan Higgins 2019-09-23  503  

:::::: The code at line 501 was first introduced by commit
:::::: 7122debb4367ee5c89237e5d36dcc0007d7ec43c kunit: introduce kunit_kmalloc_array/kunit_kcalloc() helpers

:::::: TO: Daniel Latypov <dlatypov@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
