Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F21030D3E7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 23:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780616288; cv=none; b=g1C06xrIfEMZa0Lgqra5HMFsalLZKLteXKV6XM1shcxuUwM+y1fo94H3SzPEuXZxD9EuRvJwp0rle570Xte7UEMD1PU6+O3Z4c73w4H1sb+0FnpxcEgA7EwrFTyDJ7An/PoSTeAOqsQEI2O3km8ZPvZslrypgVA3JrZ2THUKi4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780616288; c=relaxed/simple;
	bh=YEDWp2cE51a1TKKLwnX+bFGA+Ng6BY6pwhzXPdo9JSk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EtS9tR5cjQkiH7ByBkt6WrYMJpiDdqAi82axLWzu24MBVCvDZ8Jyt66kucIx2PoPED6lbvNKWfGiqAWe4lXti5tn6xhzptPxyAx7R1TB9Qsu/TTzkgcboFfFbpRn/sXN+ivGq9Lc7dozOJz39kSWK8gHoen741jAGnWmyNfp2Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TnXtf9Xj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TnXtf9Xj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780616287; x=1812152287;
  h=date:from:to:cc:subject:message-id;
  bh=YEDWp2cE51a1TKKLwnX+bFGA+Ng6BY6pwhzXPdo9JSk=;
  b=TnXtf9XjoCBvsfAAgqNUbzvvupohbXSafjVJEhC3bmS3wZ6TMKJfnnW/
   ka+NbVgn5oOG7EA12u0UmTAOEEE0OTKoMBHFwKRZbXsIWLdyrtA7hT9ai
   srT5R3d5xOGJT0BjrqVE49ozlchIMOi5ig+yH+6gDph+O07Bc802+EbIH
   QNjQnEtwYTWi5fZTwK7U4O/jvBw8yqSbNBiUd2R3KP6BeY340YFljREA+
   28YEG8FjdGEneW3m5WV9IwGzxslQsS7bSrWXu1WUdXveWNGhxxuCIxaa8
   SVZpdA85KDmW13ZjO/56h5vOEqMlXEy9hiFEWRBd3tOxtwIYl8m+V+Wiy
   g==;
X-CSE-ConnectionGUID: 8HkSO3aZTzu13SIrucxqdg==
X-CSE-MsgGUID: OeYT+MwcSTW5GxbKVTdTgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="84030416"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="84030416"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 16:38:07 -0700
X-CSE-ConnectionGUID: uSt9I3aWSxWZP7tXfMOp6Q==
X-CSE-MsgGUID: McEu248XR6qZYKs/f3/uEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="268614629"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jun 2026 16:38:05 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVHdT-000000002Pz-0aUA;
	Thu, 04 Jun 2026 23:38:03 +0000
Date: Fri, 05 Jun 2026 01:37:53 +0200
From: kernel test robot <lkp@intel.com>
To: Asier Gutierrez <gutierrez.asier@huawei-partners.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/admin-guide/mm/damon/hugepage.rst:
 WARNING: document isn't included in any toctree [toc.not_included]
Message-ID: <202606050129.sxUrDe40-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/gutierrez-asier-huawei-partners-com/mm-damon-Introduce-DAMOS_QUOTA_HUGEPAGE-auto-tuning/20260604-230803
head:   263912f5b34dfc2412f2e8b7ea92f6a278ebcfe7
commit: 263912f5b34dfc2412f2e8b7ea92f6a278ebcfe7 Documentation/admin-guide/mm/damon: add DAMON-based Hugepage Management
date:   8 hours ago
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260605/202606050129.sxUrDe40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050129.sxUrDe40-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:191: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/admin-guide/mm/damon/hugepage.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
