Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF182481C4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 21:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716845267; cv=none; b=VGnIIGubfe8x9/rHcPL7vGVAz7SpaQdZd1p5RGT+N3LjGItIAjPJQefYepQgRkZGWLcMY4e1puMLhOzag8b7c1+t9od6D9s9Lk/94fUpCoHORYRA/Ao/ZfbgbqWW3PQit+soTDRsQANoCYYa+3laH+AOcZ/yAtyXsTt2aFGepOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716845267; c=relaxed/simple;
	bh=kKNRY+YP8kCCWuROR3Y2Rq1iZ9fwcc9cA2di5uwor7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q4B5n1peem+0EEeQI8bDXUiGn2BhZ3GcGbxA3l32pVZwUA2X1PnA3qzrWC0VVF6Owl/oHQYJVc3ZaDSnGVBZyC4B+SvsgvWTw0NvFiKpPTYCZrowlOuUZAQ3jujU0neqvbBCNY159ugQdWtES6hdwDQ9VjgbzPmXnJr61QdBRiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDQwvjO7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDQwvjO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716845265; x=1748381265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kKNRY+YP8kCCWuROR3Y2Rq1iZ9fwcc9cA2di5uwor7A=;
  b=PDQwvjO7khB63mqKNHjSMRUqzaX1RqLfQxebUxoU6bDuc8CN7bLNmURq
   HaTh1+az5T4JGMdZVusZHPHNBfVQXHSLNa0XoxMebItrf2OaKIiGJ9HUr
   Oayw9DcwjFgOU03lLHioHHlCQql62CM9+aEjIvAKRU4riMOIUBDlvZCJ4
   1EdD2Ij5xYbe4HAe+eFNyiSfpHLD3/Excucw7O8W+DBYQ7lSZeMfRi9AT
   ByLHM8PwK/hWIgMNaTe7Js1IrUQHh5sSDAz2F0XNlhKzCKrNSBAZGz1ev
   qtm2T6BfYrrWJcHTvgGUdxKsDqf91r7e2PDJ6QApiwRZvCEtIULbDD+0J
   Q==;
X-CSE-ConnectionGUID: ieKqDGJBTYiwAw3O7r5jKw==
X-CSE-MsgGUID: g5S9IjRbTP2Zz8S2FeAPtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13043776"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13043776"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 14:27:45 -0700
X-CSE-ConnectionGUID: x0BNfgmdTy2o1bwtKHYRnw==
X-CSE-MsgGUID: f+NtVH/QQCiwy6O5TzLdvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="39847732"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 May 2024 14:27:45 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBhsb-000B79-2T;
	Mon, 27 May 2024 21:27:41 +0000
Date: Tue, 28 May 2024 05:27:00 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:DONTTEST-pcp-locking-bench 1/4] lib/slub_kunit.c:9:10: fatal
 error: asm/tsc.h: No such file or directory
Message-ID: <202405280528.3NUldrBg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git DONTTEST-pcp-locking-bench
head:   95b2f070fc4eb7b92d528f64395c5306dc993c50
commit: aefcca2d0875add24036512e1f45bb9da89989c0 [1/4] slub_kunit: hack in a stupid locking/atomics microbenchmark
config: m68k-apollo_defconfig (https://download.01.org/0day-ci/archive/20240528/202405280528.3NUldrBg-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405280528.3NUldrBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405280528.3NUldrBg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/slub_kunit.c:9:10: fatal error: asm/tsc.h: No such file or directory
       9 | #include <asm/tsc.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +9 lib/slub_kunit.c

   > 9	#include <asm/tsc.h>
    10	#include "../mm/slab.h"
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
