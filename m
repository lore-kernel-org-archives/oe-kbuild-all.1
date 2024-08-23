Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232304D8BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 05:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724390250; cv=none; b=jUzyX7qAyLhaqFcBL8rIYmFFXFAQu+uXgqbB9VaeWS57o96NkT4CnxJQvI1msC+73Vv/UkxjIJBVNfKLamlS9wOEl9PJAGM5PgWVQGsm7Y7/is3kuQp5vaU5zCeokLTBOKbO2nuTULEMA/sK70M05rCsYvvCq3vGoJJ5t9dyMmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724390250; c=relaxed/simple;
	bh=L/NW68CgHw12G6G9QYSWNQFffygW5qUmTaxtp7xkcwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TCVoNp4pbxW1JC/DYDeEHoVDPB/jKwjxqGjfFW87huBADQupauDLn4X+D4xx/+Uf6SIQvOF8aubxeUQX4wxn5xFUEZlkcpv2FfHfen2iQOfjlijmIowiKqge1AOYUMG7hunLhV9kW/H0VJRiIBkzxIKFbqo0kSLBfoPbHZA1ENs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/O/CMvf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/O/CMvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724390248; x=1755926248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L/NW68CgHw12G6G9QYSWNQFffygW5qUmTaxtp7xkcwE=;
  b=Q/O/CMvfU7WrvJJ9sOOcmHdR/ttezdL+VpeRLQ/tbMlJGj17K34EHQeK
   rV3SXOGuavIUaVXR1PxNHMgcCjjNjRh7c65/eOxbhSmq77jlqNCyzAFof
   W0s7W6ugk+4Stbwiutg/bXrMCRWDiLMlam0CRt97gbiXbBulaN0tqzesZ
   K0G9QOHuXPpleu5ZWAybt/vtajzeHp2oD9FLgx6WrF4eZ6dGYRfOHE3Y/
   HTymLKVlV0TXbQ2MrwzjxZLkMZOkCtvJWy3j96PNBMTFwVc/fpufjdHdH
   z2eiNBzNrsvjay1F15JGFCURMFtwcs0tYBbfiRabS60REkixiMDmIxvlE
   g==;
X-CSE-ConnectionGUID: Q+KImF7jQ06XF0KuvqjStg==
X-CSE-MsgGUID: dHu0d38LQMqRk+JsBXt/sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26594562"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="26594562"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 22:17:19 -0700
X-CSE-ConnectionGUID: f38iRhTxTgyxhvnqNGjr1Q==
X-CSE-MsgGUID: Pad8AnA6RVivXuMRDVzP1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="61363169"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Aug 2024 22:17:18 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shMfk-000DWA-1i;
	Fri, 23 Aug 2024 05:17:16 +0000
Date: Fri, 23 Aug 2024 13:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dvyukov:dvyukov-random-sched 1/1] kernel/kcov.c:29:10: fatal error:
 asm/msr.h: No such file or directory
Message-ID: <202408231314.78v9TF4R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dvyukov/linux dvyukov-random-sched
head:   a2e8f001038652815e629351cab41bb9ae304fae
commit: a2e8f001038652815e629351cab41bb9ae304fae [1/1] kcov: add random scheduler perturbations
config: arm-randconfig-003-20240823 (https://download.01.org/0day-ci/archive/20240823/202408231314.78v9TF4R-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231314.78v9TF4R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408231314.78v9TF4R-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/kcov.c:29:10: fatal error: asm/msr.h: No such file or directory
      29 | #include <asm/msr.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +29 kernel/kcov.c

     3	
     4	#define DISABLE_BRANCH_PROFILING
     5	#include <linux/atomic.h>
     6	#include <linux/compiler.h>
     7	#include <linux/delay.h>
     8	#include <linux/errno.h>
     9	#include <linux/export.h>
    10	#include <linux/types.h>
    11	#include <linux/file.h>
    12	#include <linux/fs.h>
    13	#include <linux/hashtable.h>
    14	#include <linux/init.h>
    15	#include <linux/kmsan-checks.h>
    16	#include <linux/mm.h>
    17	#include <linux/preempt.h>
    18	#include <linux/printk.h>
    19	#include <linux/sched.h>
    20	#include <linux/slab.h>
    21	#include <linux/spinlock.h>
    22	#include <linux/vmalloc.h>
    23	#include <linux/debugfs.h>
    24	#include <linux/uaccess.h>
    25	#include <linux/kcov.h>
    26	#include <linux/refcount.h>
    27	#include <linux/log2.h>
    28	#include <asm/setup.h>
  > 29	#include <asm/msr.h>
    30	#include <asm/smap.h>
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
