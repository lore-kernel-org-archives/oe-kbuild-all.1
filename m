Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54CF1E487
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 23:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757028802; cv=none; b=R02GL1iPZukHfBUqNhxzi9S7DINBVGXMiseudiV0nIpvBVwTK4pldEXIIgg8DUHY/Ufhvd51ZOYo+jTDJW2HPYXYNsWPkVUIcMuCovfL9dBkUE4IMUchN6nok+foq+beADfKAPZrXoW6ym5YAdgnD91+/nLovGswCutqcg5C1E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757028802; c=relaxed/simple;
	bh=/Bd3R0sY0N+wYF+TGwP76DPWjE6cWAF50x6T1V7NCoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K1a5jowfkJQUMlNLqifD6g4XaTx31DyKN23XeDkwLmDy1AkZRwS46O0kE/fS3WG7JWkTXabieE3MXUXho99hO2wBojBgIrRfJU40XTCzWglqhyyqUp8yrgZ8PqfVhpwe8NshYvT1Lrq+AIBOuoOwGw4QHVns/kN6CNpPoCgoWRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nG1GOiRl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nG1GOiRl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757028801; x=1788564801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Bd3R0sY0N+wYF+TGwP76DPWjE6cWAF50x6T1V7NCoc=;
  b=nG1GOiRlwopYRtdMhMlSQVrI8Dbuz3O6qRQRSmU2ejhC0DmCKj4sq407
   IXM008xL/vBki9WpZ0AojsgKfwHs+hrGE4ZnaEYQ4DUR3i6I2qBmuh+yT
   J9uGdPH+yFmpN9BXTtBYlYqWmQfGcQSgAjGRTY91pVSHPLeYY0rtl24ow
   wH7SLBgKVUMV+lZLuRacyhiDMcpjTLxCPOrEcpR0wnX1lVt8Yhpp/WoWF
   7Nb3Fs1tbY4sayJmy4RKIHFEONLgyd/BWdOmyY/B8RqO6gmUxp5JrBX2Q
   cMcYKT5NSDOeq5R1PfxZImjI9zxWAP+v9ccn9v25Ef/prcj3LBZuOy9ZO
   w==;
X-CSE-ConnectionGUID: NiUVfeH6TOi/Q5B6e6ZHPg==
X-CSE-MsgGUID: coGla+hZRZuCsE25HL4qzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59321820"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="59321820"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 16:33:20 -0700
X-CSE-ConnectionGUID: KSORE9khR3KOiuxv7/QR+A==
X-CSE-MsgGUID: oQACPLl+SliR6XJkg6ey/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="176371392"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 04 Sep 2025 16:33:19 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuJS8-0003pv-1w;
	Thu, 04 Sep 2025 23:33:16 +0000
Date: Fri, 5 Sep 2025 01:33:13 +0200
From: kernel test robot <lkp@intel.com>
To: Swarna Prabhu <s.prabhu@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof:20250903-compaction-tracepoints 2/2] mm/page_alloc.c:
 linux/vmstat.h is included more than once.
Message-ID: <202509050157.0C4cWonq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20250903-compaction-tracepoints
head:   1f04c38a08decc2e10035aa27a5f9eafe94c7f2e
commit: 1f04c38a08decc2e10035aa27a5f9eafe94c7f2e [2/2] mm: add compaction success/failure tracepoints and fragmentation tracking
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509050157.0C4cWonq-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> mm/page_alloc.c: linux/vmstat.h is included more than once.

vim +38 mm/page_alloc.c

  > 38	#include <linux/vmstat.h>
    39	#include <linux/fault-inject.h>
    40	#include <linux/compaction.h>
    41	#include <trace/events/kmem.h>
    42	#include <trace/events/oom.h>
    43	#include <linux/prefetch.h>
    44	#include <linux/mm_inline.h>
    45	#include <linux/mmu_notifier.h>
    46	#include <linux/migrate.h>
    47	#include <linux/sched/mm.h>
    48	#include <linux/page_owner.h>
    49	#include <linux/page_table_check.h>
    50	#include <linux/memcontrol.h>
    51	#include <linux/ftrace.h>
    52	#include <linux/lockdep.h>
    53	#include <linux/psi.h>
    54	#include <linux/khugepaged.h>
    55	#include <linux/delayacct.h>
    56	#include <linux/cacheinfo.h>
    57	#include <linux/pgalloc_tag.h>
    58	#include <asm/div64.h>
  > 59	#include <linux/vmstat.h>
    60	#include <linux/debugfs.h>
    61	#include <linux/cpumask.h>
    62	#include "internal.h"
    63	#include "shuffle.h"
    64	#include "page_reporting.h"
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
