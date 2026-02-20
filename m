Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A76619D093
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 06:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771568391; cv=none; b=LKxnIm4nrhfT7kb4tkwjOysJgREpHrc87Px9dyVn0kbWtFvKISN/50AcqT9tG/bdMOfan5EbUM3VTPrg4dZc3ZsIF5FlKPA3YhQyYUvRaGCgOVXeR1zAusnedC/X7WbWQt4M8VhSOQaYy7+RCzvtsSknTaaZozxYA663Bd4W0ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771568391; c=relaxed/simple;
	bh=PrkD85zv/CikBtBh9/x0HAE+2UzAUJ/tIfQqkmPadvQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YI0eEEljZG/faIT8u5voGsW7V7rib4imu5hvVQBZzFeT9QimyUkx11g3u/k4O6UWeIiW53UCk19585sYF3hNORMm+vpObSqlbzBo8EQSzKp5v18nfM9Gi24fy6wsnmUysU0GnEufrSEhzSz84fv7jL38uRCYskecS9EzMVWslOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLurqOFj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLurqOFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771568390; x=1803104390;
  h=date:from:to:cc:subject:message-id;
  bh=PrkD85zv/CikBtBh9/x0HAE+2UzAUJ/tIfQqkmPadvQ=;
  b=kLurqOFjCTjAk1xJ/RODQIeZQEkgF9sUvCYjKn6jNRGhApZpdOoZLHmt
   EHHOc8Mb6PjLILeQOLqGIWMdwLw2TzGZUAzL0M7+YirZDy9tdIThYX0KB
   a+3EfUmhXw6KpiHSmB1JO3ehSgci3ECWQu+CqnbTV3+C+1zXgydOMr2Zx
   hV8An8ggkA9kXX3HGMeV31YOhY1nwJFEg7us8I3cNp4r1F5ZzVGEKW95r
   ur7ccMWH2hAFaSaPY2wZg2GH/N18BJsbr3KIw0gK0AqT2HknTj6iyvDP2
   r1WESAe1bO3Cx54B5wvdAL3OHoiyKoxvPqgyfh14U7IeBbvl8/AZQKVMH
   A==;
X-CSE-ConnectionGUID: js+8dtBPQ6WC31brlUk7pA==
X-CSE-MsgGUID: 1Xb7nqyfRYCJ0yN3jG67Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76277577"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="76277577"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 22:19:50 -0800
X-CSE-ConnectionGUID: 1z2b7aKuSgGK1Q4ldRGmkw==
X-CSE-MsgGUID: opMlGm1/RHCrPJgGJBh+KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="214882243"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 19 Feb 2026 22:19:48 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtJrd-0000000049F-2NBT;
	Fri, 20 Feb 2026 06:19:45 +0000
Date: Fri, 20 Feb 2026 07:19:10 +0100
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-doc@vger.kernel.org
Subject: [akpm-mm:mm-new 71/81] htmldocs:
 Documentation/core-api/percpu-counter-tree.rst: WARNING: document isn't
 included in any toctree [toc.not_included]
Message-ID: <202602200739.GL1Y7ImH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   68777acba791f6c852c9128668ef27a662ab7bf4
commit: 979792367f37009e45b073abcd733bb095ac19ab [71/81] lib: introduce hierarchical per-cpu counters
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260220/202602200739.GL1Y7ImH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200739.GL1Y7ImH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:166: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:189: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/core-api/percpu-counter-tree.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
