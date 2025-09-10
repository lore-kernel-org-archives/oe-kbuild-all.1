Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4962730EF95
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 10:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501707; cv=none; b=lllpSixPRo6u3wqZGKxUObxCgue9ohZvzXTcLbaFP02kR7+oz3Gc2tHtSb/lyFfOkmNPoAU+A/x+AIwF99OpfNSZ8w4+Q4/m7lJ6lcK3bTGDruL0p8q0m9nmtozuScVUSbz8h71mv++5rkNnFwTpOKMLtteKVqIaVxuAlqvqFXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501707; c=relaxed/simple;
	bh=uAx299JcDZjCWTYD0f5NpEfnfmt5i9TOZB4kjp25Zro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eP7XiLpPFsYmBj33iJp+Jbibb8nee5Yez/cheZxXF7QsAaqWyvkn6/j9bxG/tt8nlJzKfVoxwycNMN/GgFcPp4VHSvTvA7R6KNSjAUEYgHpMk9JbajNyWC4NzFbG601JPU0oDeA66WgXCrIFdjejz9R18mYZGr+IWbinhaUW4Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdgBhCbS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdgBhCbS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757501706; x=1789037706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uAx299JcDZjCWTYD0f5NpEfnfmt5i9TOZB4kjp25Zro=;
  b=hdgBhCbSTTlm0xRhMBUV3FVKDLADutMH9/ZiTPi/QAYSIGxYkRG41FmE
   EYKHEFzXDQ+k43Fkfyu63SCJZ3z4S98MpObApWOYX1xVNGVogv0W1n8jd
   bbQNKZt+uzhSXr+eg6hf/slFH7PNrJ1rPe22KaCvV09b3a8mOYr0YcKeq
   yZzQNGzlFbWrThIBMkGmQgSMNX3nACbJRacrjKZ9s23ErGPNLnkaZodX7
   Z+0uv6pfl6vpywvr2LW87qYYeyWxxq7ZtYpQAW+o7QjyGw+PXxPZiopkH
   go7tpONX92SyXSyG3J0z+2FQdBTTExSOE0UiOyI/fEB1czLHwlrEDPfYC
   w==;
X-CSE-ConnectionGUID: HG+kd2vjSGOErn7J8O+goQ==
X-CSE-MsgGUID: GuJ/q/zMQ8iQyOccZtqBiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59746557"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="59746557"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 03:55:05 -0700
X-CSE-ConnectionGUID: NAL9cNw9RSmtKDncuokfJw==
X-CSE-MsgGUID: mApGe61WReiRAT9ZePhUWg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 10 Sep 2025 03:55:04 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwITe-0005DT-0C;
	Wed, 10 Sep 2025 10:55:02 +0000
Date: Wed, 10 Sep 2025 12:54:34 +0200
From: kernel test robot <lkp@intel.com>
To: Chris Li <chrisl@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kairui Song <kasong@tencent.com>, linux-doc@vger.kernel.org
Subject: [akpm-mm:mm-new 348/411] htmldocs:
 Documentation/mm/swap-table.rst:39: WARNING: duplicate label
 mm/swap-table:swap table, other instance in Documentation/mm/swap-table.rst
 [autosectionlabel.mm/swap-table]
Message-ID: <202509101218.97pfd0jg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   3a0afa6640282ff559b6f4ff432cffc3ecc2bc77
commit: ec9b9250f31f1560443efd2b4831e6d3404a135e [348/411] docs/mm: add document for swap table
reproduce: (https://download.01.org/0day-ci/archive/20250910/202509101218.97pfd0jg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509101218.97pfd0jg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/highmem.h
   ERROR: Cannot find file ./include/linux/highmem-internal.h
   WARNING: No kernel-doc for file ./include/linux/highmem-internal.h
   ERROR: Cannot find file ./include/linux/migrate.h
   WARNING: No kernel-doc for file ./include/linux/migrate.h
>> Documentation/mm/swap-table.rst:39: WARNING: duplicate label mm/swap-table:swap table, other instance in Documentation/mm/swap-table.rst [autosectionlabel.mm/swap-table]
   ERROR: Cannot find file ./include/linux/ethtool.h
   WARNING: No kernel-doc for file ./include/linux/ethtool.h
   ERROR: Cannot find file ./include/linux/ethtool.h
   WARNING: No kernel-doc for file ./include/linux/ethtool.h
   ERROR: Cannot find file ./include/linux/ethtool.h
--
   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/mm/swap-table.rst: WARNING: document isn't included in any toctree [toc.not_included]


vim +39 Documentation/mm/swap-table.rst

    30	
    31	2. folio: A folio has been allocated and bound to this swap entry. This is
    32	   the transient state of swap out or swap in. The folio data can be in
    33	   the folio or swap file, or both.
    34	
    35	3. shadow: The shadow contains the working set information of the swap
    36	   outed folio. This is the normal state for a swap outed page.
    37	
    38	Swap Table
  > 39	----------
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
