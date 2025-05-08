Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667B3179A7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 23:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747843; cv=none; b=TJ4JT2Lj4e3Z1A5qknMTNDlbgM/0WeQWbPePuxspksMHOb+aaYTWdHJG2hZcGiTQ2KflPzuV/s5wkr70HHR3TSh+DDy4zYSBP9vZKiauMIlTyE1Pk5vXn/yczASposoblD22rrywbdMu3p3iWFGhHqcEakkn6neBVtZcbZ40YhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747843; c=relaxed/simple;
	bh=MYQ+JkXetokYBw5m258CPLzs80QjTY8CJgcx/XUaKSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ofnb4WCKjxJnKt76Y4twiWNBsLevuMuoP4LppWbo3ohyHQ0lN2SzLHbvBBSEyU3zsB2nKT6a5+WQRwlwa5AKJN9xcSTrK7Stwt1/gXr5/LanZNLYyAxYexUoOHw+2YbvXaNqeZ0NxpgFIEo2Rd3cOx053jHtKLw6sm0/sgeAfiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eidpP0o5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eidpP0o5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746747842; x=1778283842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MYQ+JkXetokYBw5m258CPLzs80QjTY8CJgcx/XUaKSk=;
  b=eidpP0o5RvtHSW11YPz/GnmoP4PJYVN+wB97zdmewfVilYjEKR+Fgdym
   Nd+jdNhx5OsOs/24Bn3bPk+a+TDPHIPGnpOnawGxUGY9ky4mCdm4li99O
   9WYpAKCEFnlDmqPfkEe75kzBOjrV/E7LfXU8E6c0CM2uXDCRIViDg0M+W
   xNVUhDkZ1NyP2sJ+QlKU+R4kV7uZR7o5/4JJN2UGeTQZ8wUnm2PNRjFVn
   QDgufJYzMNpucoXmgJn71QUI2vG50wN89e4evPV568/2KPHubI4qebGoA
   Lq4dD9cFcWD9I1wj8Z+RsKjH5UsQSZ4OZB1XyWQ6qvPeDZ6avrfVbpPj6
   w==;
X-CSE-ConnectionGUID: xetDKTVbQZ2KHIgS1GB3bg==
X-CSE-MsgGUID: /7ZH7TgWRAqA/pAjimdVjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="65970102"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="65970102"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 16:44:01 -0700
X-CSE-ConnectionGUID: OBA5qKoQST6XcVyNGUDd9Q==
X-CSE-MsgGUID: yi1ptojYRj2+ovcVckg29g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="159740254"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 May 2025 16:43:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDAuD-000BTP-0a;
	Thu, 08 May 2025 23:43:57 +0000
Date: Fri, 9 May 2025 07:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/1] mm/hugetlb_background_clean.h:86:9:
 error: implicit declaration of function 'clear_huge_page'; did you mean
 'clear_highpage'?
Message-ID: <202505090738.AOBJjZlv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: c29bfa28e97ff02afd20b21fd89eb5e945a575d9 [0/1] bytedance: mm/hugetlb: optionally pre-zero hugetlb pages
config: x86_64-buildonly-randconfig-001-20250509 (https://download.01.org/0day-ci/archive/20250509/202505090738.AOBJjZlv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090738.AOBJjZlv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090738.AOBJjZlv-lkp@intel.com/

Note: the bytedance/5.15-velinux HEAD de277dab626c9ece4c9cf99ec9c56f23b298a042 builds fine.
      It only hurts bisectability.

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
