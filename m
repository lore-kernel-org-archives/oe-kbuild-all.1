Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B42C30FF31
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 05:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763531052; cv=none; b=ZfH9Vtj8RB8QCwRi//a5XR0ugASKAofpV+S/n2GieUiEIrC06rMD1U3J8iJjuGNM5jcxToSN7WvntNky522M51hilEiU6KJGwneLkBhZC6PxWaWqvQiQ0WTSoyuUHcBvVN2oUgsZXsSk2ZvNgtT8Q0p1kyVxnwFNiO/IWosGAF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763531052; c=relaxed/simple;
	bh=dRumNLBpw8seuy+AI0evpjXwRqiSAXvg0r6kXYRvaTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UbrympCa6IsbiF227C7FC71Ozf60i8TO9DAVY8cxkpnXNTesJjUoojkIlyiKo7PKDAdfDaryNmL1YGSv2VqhbR/ggQSz5TZnqdd4ITW4UXufZPDW1p7dR5ZjScZ5E0UDKPQ+9Ibzv/nH+mMcyHWurNlVrYyUWtjyTTITsbWV1Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UXFYiu2m; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXFYiu2m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763531050; x=1795067050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dRumNLBpw8seuy+AI0evpjXwRqiSAXvg0r6kXYRvaTk=;
  b=UXFYiu2m8gprkogmTyXgFmfJKl8jz1fx4Ge+zsmgC1WJdPH6A32c4Ls1
   1xionrvfQHktreVu1gpBDrp+3QTrGlXwghSz2DsKIbFW0G6eZ7osH5WQL
   GLBWVDtjdW0tJIrUUA4t4rYh5o2VVGaQOZmoIHwO2iYg1xbY84muIWxqC
   kgXZ23mDkObneRrnl+7Gbk123xhoz9uVDg4VGXsLynTE7w3VSTFNneTKx
   LugpSFGZU84lvE8n9Kj9ARHds2y7yZF/CE8FkwW11xrnZ/8c+ErM0GHhJ
   YugIQu3OvZpRTU+T57XWG3CDhx+H/YsovYIH8zzhJJcQETADSTdYJIie0
   g==;
X-CSE-ConnectionGUID: EbDVD9hGQZeWqxYF+eLP8g==
X-CSE-MsgGUID: gInxsuewTqaKKcecwzpUSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="88217392"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="88217392"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 21:44:04 -0800
X-CSE-ConnectionGUID: Xjo1C+21T0uYAaQrncFDUg==
X-CSE-MsgGUID: 0YJXjTy1StCdZyR0TGQ+xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="196092451"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Nov 2025 21:44:04 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLaz3-0002VB-0G;
	Wed, 19 Nov 2025 05:44:01 +0000
Date: Wed, 19 Nov 2025 13:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 328/328] mm/hugetlb_background_clean.h:86:2:
 error: implicit declaration of function 'clear_huge_page'; did you mean
 'clear_highpage'?
Message-ID: <202511191302.x0Q3Eyq9-lkp@intel.com>
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
head:   bb0e74acaf990260e6fbe36e2fe42ec210016242
commit: c29bfa28e97ff02afd20b21fd89eb5e945a575d9 [328/328] bytedance: mm/hugetlb: optionally pre-zero hugetlb pages
config: arm64-randconfig-003-20251119 (https://download.01.org/0day-ci/archive/20251119/202511191302.x0Q3Eyq9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191302.x0Q3Eyq9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191302.x0Q3Eyq9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory_hotplug.c:40:
   mm/hugetlb_background_clean.h: In function 'hugetlb_clear_huge_page':
>> mm/hugetlb_background_clean.h:86:2: error: implicit declaration of function 'clear_huge_page'; did you mean 'clear_highpage'? [-Werror=implicit-function-declaration]
      86 |  clear_huge_page(page, addr_hint, pages_per_huge_page);
         |  ^~~~~~~~~~~~~~~
         |  clear_highpage
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
