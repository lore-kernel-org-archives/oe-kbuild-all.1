Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023E73112BF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 16:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758557245; cv=none; b=opSZ2BfnkzxPjOCIdaYUaf4vSfxY15wY5i/y0EgqzypCJhbzUV/sgSFKns0+EnxX8SjOjyLN0eVZdvn+hKT/AISsSZ1Hpw2DcUDYn7w8GHLmDfF6pfYvk4VygHeTxhqk2sFdx73ie64cPrixbLyD/Db8UyQrI1O7aE/urSFlf28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758557245; c=relaxed/simple;
	bh=yTO4P//2m70SNgbAXQ2SUKlP0PpNYCs1bhU4Q01Z5K8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gr9XMSYo3BhKcR73zpub1/cHFhaIebkZnyrTyj3CqJazSXLIYusNBn790rU0ACvRUBB1EHFE0VQtBwSx2VjqVm38XwJQWQ0MKE2aUEG9m+Omfx+3p54TwynwgcwNdkwHWvaqVODKEaGaRIj2azlVsfwBqQyQ1QyXEE7VS8LpJjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHcRgcsh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHcRgcsh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758557244; x=1790093244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yTO4P//2m70SNgbAXQ2SUKlP0PpNYCs1bhU4Q01Z5K8=;
  b=iHcRgcshvT/JHXKAEHa9o//QS3Ufokmbok0NKNJIzwKXLTbpR6hPfFme
   /683UcRSvWGlv4bKN8lO/voilHP3JnWEJ08EczY9UWvzUPCtMNmC5K0LO
   t0BuC668p37jqO7Wt+cd5sTEsMSCbs3EtjyFlxO/SfP618SRkF7CgOIzY
   ZKZDXf+GH1WvJAEfp0O1spTxXQJGvcqsdzRKIlkUE4s7EEptK7q8CE4ue
   bCNI/6uol79zU7cvyyTG68EinXqKY4uAwKoY6JAtYlbnGN3K5S4DzbTCN
   HhDm2gQTtD5x375JLsO1bZ4fNSpepwX47vOGpY2kgfvlCS3iihUsXIwha
   w==;
X-CSE-ConnectionGUID: YypVyutBQyShrYwSN6DDTA==
X-CSE-MsgGUID: mvyq7w9tTwOEZ59LYzIeEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86258979"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="86258979"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 09:07:23 -0700
X-CSE-ConnectionGUID: V67ze2pIS76aKfS2YXVdhA==
X-CSE-MsgGUID: AAzSBZVPSFWPzAGr8pYXgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="175781543"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Sep 2025 09:07:15 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0j4K-0001qD-2M;
	Mon, 22 Sep 2025 16:07:12 +0000
Date: Tue, 23 Sep 2025 00:06:28 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 146/146] mm/hugetlb_background_clean.h:86:2:
 error: implicit declaration of function 'clear_huge_page'; did you mean
 'clear_highpage'?
Message-ID: <202509222359.rukFFNY8-lkp@intel.com>
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
head:   c73db7ebb024f59416db0cf136dc2d4b9dbc3695
commit: c29bfa28e97ff02afd20b21fd89eb5e945a575d9 [146/146] bytedance: mm/hugetlb: optionally pre-zero hugetlb pages
config: arm64-randconfig-003-20250922 (https://download.01.org/0day-ci/archive/20250922/202509222359.rukFFNY8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509222359.rukFFNY8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509222359.rukFFNY8-lkp@intel.com/

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
