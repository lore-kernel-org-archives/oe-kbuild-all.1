Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EEA1A2398
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 19:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752608012; cv=none; b=qjq4CRtuXxIzJaYThmMWt35FaniGL3Y6jmr5tQlZO3WBkaiuXH3TNe9NxzDTh+q9eC+ypDfncbhrPw3uHhY/9TAXsiZEfBQTXnYRdAqQYacc5NWU36tfVUsiIIgqaQYtbc5qL8Lzo4xjdRvHdGj9nEsrv4OhW++ArjB7gZV9GNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752608012; c=relaxed/simple;
	bh=283y0Zg6Ue5PSynx5+V42R/AdbuoKDsW3xn9bIJ1zMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dnmXEJOylm25nuY6A10PTw/5obBT8tnUAbBqR8a0zoevSR5QTuDZHjGqooobFSzrymRlTgwIl2HOlSlvTZ6G3w9Sm/9FowB7NxC8IhVt+U9q2050dBllAuUZNzNQeV+v/7A1sre2va0Q3H7hW83qHpdFxsausy4ft4XmFq+FD7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTCOiEDE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTCOiEDE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752608011; x=1784144011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=283y0Zg6Ue5PSynx5+V42R/AdbuoKDsW3xn9bIJ1zMM=;
  b=aTCOiEDEEBlPl12ohIMgXgW4zWLIb77mdIsHBLyPs7MNimJmejNDg82n
   kABE7PmF7bZP7q+gGFtOWTGIG8sbzhSb9geV3LSyQVTsvKzggbWJATPOp
   4ihUJwNwLLZGzUsMl+HB1pH1oHqRiMuuhAiNqd3/9LtaGuRq6s8GHlHOm
   qyqVXHFgFvhB/EIIJ16XJM1jauZek13K55xxWwyNvgL6JnS0NKlin76RU
   RLmJMUQyB9GqksLS6NCi0blgRrena3oITJiQkPtNWRMI4H3QT4q3KHDjJ
   apROV36qgV2s2c2jYix3XzUkkWNTA4LWofokHWNkWl7rwuZR5tDZn1NJ7
   g==;
X-CSE-ConnectionGUID: /OWkCZTFT9qMkVWq7T66hQ==
X-CSE-MsgGUID: hDp3li1iQyuV3LqssILZYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="53954335"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="53954335"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 12:33:30 -0700
X-CSE-ConnectionGUID: A1UOUqCYQZOvKq5URA4DTg==
X-CSE-MsgGUID: x2kiMk1oR6ee96FBvhh46w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="157661129"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jul 2025 12:33:29 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ublP5-000BUZ-0y;
	Tue, 15 Jul 2025 19:33:27 +0000
Date: Wed, 16 Jul 2025 03:32:47 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/92] mm/hugetlb_background_clean.h:86:9:
 error: implicit declaration of function 'clear_huge_page'; did you mean
 'clear_highpage'?
Message-ID: <202507160359.GUTKn3ao-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frank,

FYI, the error/warning still remains.

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c71e88ad12bfbc44f855b681ef923e1acc2e984a
commit: c29bfa28e97ff02afd20b21fd89eb5e945a575d9 [0/92] bytedance: mm/hugetlb: optionally pre-zero hugetlb pages
config: x86_64-buildonly-randconfig-001-20250715 (https://download.01.org/0day-ci/archive/20250716/202507160359.GUTKn3ao-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160359.GUTKn3ao-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160359.GUTKn3ao-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory_hotplug.c:40:
   mm/hugetlb_background_clean.h: In function 'hugetlb_clear_huge_page':
>> mm/hugetlb_background_clean.h:86:9: error: implicit declaration of function 'clear_huge_page'; did you mean 'clear_highpage'? [-Werror=implicit-function-declaration]
      86 |         clear_huge_page(page, addr_hint, pages_per_huge_page);
         |         ^~~~~~~~~~~~~~~
         |         clear_highpage
   cc1: some warnings being treated as errors


vim +86 mm/hugetlb_background_clean.h

    82	
    83	static inline void hugetlb_clear_huge_page(struct page *page,
    84			unsigned long addr_hint, unsigned int pages_per_huge_page)
    85	{
  > 86		clear_huge_page(page, addr_hint, pages_per_huge_page);
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
