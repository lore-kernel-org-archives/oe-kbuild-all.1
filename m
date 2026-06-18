Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB8F34D4C9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jun 2026 06:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781764885; cv=none; b=Y16QwhWcHztgBVdn6wJpuMZ5gCpu73c8/OGko7LN6mMY7ANP0RWqHiKaanf1m7CRyjgRPlpFjKpnbQBAQX3BvXXt+9Ft/gzFkonIu8gV27mAq+xmIXi++mvC0ny4LAEPNAFH0vpcVQypkQUic86ofzH9ZAWeicSxwCnB8IVEJCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781764885; c=relaxed/simple;
	bh=/MDrmNK8YwDpbqL6Z11c0MQq8q44aN9uBVCY7fQHyzQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e93bcJWKHp8aA7DFdbAShLfpKBQV7XItzx3zyKUMoRdxENpV4tc6Bly8ACsJOQ2PropF8YB1/XzYigJvEqZDAmg5KbiWNPAMy36jTxo/Ju2tL4j4IUeSFhc4WuOx+dwHmWxF9j+nuWqTNlq+vtLl8As0HX85L9dCI7RgR9wqS8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiNvuTmX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiNvuTmX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781764882; x=1813300882;
  h=date:from:to:cc:subject:message-id;
  bh=/MDrmNK8YwDpbqL6Z11c0MQq8q44aN9uBVCY7fQHyzQ=;
  b=EiNvuTmXMklBuYXB5f59DT/cCch06X31F8yN8znm4zJ8DD5p02witDGY
   p4YIhAX4uNYfeppQZJa1v8BbnWNZGVmz8CbkMeGsVX+tWtYk+iTI7ol/o
   as1u2eFEb2XQjzoqmX2hfppxoJefYk5QIkh8P7lOsf/XD1xe1D1zCoVEp
   fZnbr+9PwT1IvEl5kfrtoaf/2yRfX/0wsYmu7IUxRj/6z4f7fb8iFdkZl
   xeX44yv3tpfxxgrrO5dIXWZqeHuN4BfirytCHBmVzLcHzP3YisGetEknN
   CQ3lmNTLj8Md3upWFHiM6GNTmJnX8Y4CFvzWd/DJVXuii2eT9XNkNdv7L
   A==;
X-CSE-ConnectionGUID: F5J8qD8CQ/m4uSFEZB6gCQ==
X-CSE-MsgGUID: 3VNQw7X7TYCTPE+8nrAV9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="85148039"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="85148039"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:41:21 -0700
X-CSE-ConnectionGUID: +/bA2FkJRUmeUJLAnHSWuQ==
X-CSE-MsgGUID: KWHAwWY5SUW4UuF2r5Ffqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="250172334"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jun 2026 23:41:20 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa6RB-000000005UP-1gPW;
	Thu, 18 Jun 2026 06:41:17 +0000
Date: Thu, 18 Jun 2026 08:40:17 +0200
From: kernel test robot <lkp@intel.com>
To: Jane Chu <jane.chu@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ./include/linux/pagemap.h:1090:undefined reference to
 `is_raw_hwpoison_page_in_folio'
Message-ID: <202606180842.DBCHSCJI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jane-Chu/mm-memory-failure-make-is_raw_hwpoison_page_in_hugepage-general-purpose/20260618-012902
head:   ad6812ce0c4c46ffdd13060f0251f31b3412017b
commit: 12e5a24644d326a21bd49526746156ea59e376c4 mm: factor out adjust_range_hwpoison() from hugetlbfs
date:   13 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260618/202606180842.DBCHSCJI-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606180842.DBCHSCJI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180842.DBCHSCJI-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-gnu-ld: mm/filemap.o: in function `wake_page_match':
>> ./include/linux/pagemap.h:1090:(.text+0x13ee): undefined reference to `is_raw_hwpoison_page_in_folio'
>> riscv64-linux-gnu-ld: ./include/linux/pagemap.h:1092:(.text+0x141c): undefined reference to `is_raw_hwpoison_page_in_folio'


vim +1090 ./include/linux/pagemap.h

c7510ab2cf5ccd Jens Axboe              2020-05-23  1086  
cdc8fcb49905c0 Linus Torvalds          2020-08-03  1087  static inline bool wake_page_match(struct wait_page_queue *wait_page,
c7510ab2cf5ccd Jens Axboe              2020-05-23  1088  				  struct wait_page_key *key)
c7510ab2cf5ccd Jens Axboe              2020-05-23  1089  {
df4d4f12739495 Matthew Wilcox (Oracle  2021-01-16 @1090) 	if (wait_page->folio != key->folio)
cdc8fcb49905c0 Linus Torvalds          2020-08-03  1091  	       return false;
c7510ab2cf5ccd Jens Axboe              2020-05-23 @1092  	key->page_match = 1;
c7510ab2cf5ccd Jens Axboe              2020-05-23  1093  
c7510ab2cf5ccd Jens Axboe              2020-05-23  1094  	if (wait_page->bit_nr != key->bit_nr)
cdc8fcb49905c0 Linus Torvalds          2020-08-03  1095  		return false;
d1932dc3dc268f Jens Axboe              2020-05-22  1096  
cdc8fcb49905c0 Linus Torvalds          2020-08-03  1097  	return true;
d1932dc3dc268f Jens Axboe              2020-05-22  1098  }
d1932dc3dc268f Jens Axboe              2020-05-22  1099  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
