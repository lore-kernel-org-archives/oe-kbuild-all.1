Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F15192D76
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 09:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735809194; cv=none; b=LasK/1dg1pOtXQH1oKtitvzzTea7qTfugI2AjcdMc5AwRZ0NaBAWyB3SUKrjlwxLDJx3VobcVz/XIh8cOaimnavYLmFf9KcnfffJc150bv+AV3hHQ3C4fWLYPnHm0mY1cUCseC4X08PH4PrGqqAjuM/DTxp06jVmVFf5wv+CuMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735809194; c=relaxed/simple;
	bh=MWmKZHjhGQYBjrTDQ0ZCB+i7Fj3XLe1SBL9ljo20CMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ukav64oehyITGQgN5DzywOFSclrKxRGSOLHutZTOwPaJ+kjOBZd+G2V7xW0Ujnw4GJZI+xvFrXMpAgVUTGaQdOVl1b0aDRUKVYFxdA44V2wsUgAMBmuEc8SxMXlYRMjrx85U+DCJALXc+rO5iJeq0AhbQSf4PEXbmhO6/FywCg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+328HCc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+328HCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735809193; x=1767345193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MWmKZHjhGQYBjrTDQ0ZCB+i7Fj3XLe1SBL9ljo20CMo=;
  b=T+328HCcwgNYKqbXEEznYfaLES8kX/6H/PZEJrpdpLAsDR43uC0KIsOH
   YQZ5EW09h+3T5s4J6tFxIuzW6FfXI0hvIAcS9C3/wqvz00gLulnooCOkH
   iJ69OFsqmza0fiAA9afrDj0gW2PIYkwq1RQeoj9bmeKX8NKMP1I/UnkFD
   cFbs+i0HXcbyCcQQi0wbrHznDizWEGdvB5sFXMkvNLVYCsekNIQFRZRlH
   JVqLnwKOKkBAfuQBx/NVDq7COq2afiEUqofw1I8dJxhAsV9os1vQqOmtZ
   1KsuOHLHPeSlAbDjlcwF4y1Z/AdrJK7Sy2aTJfwei2YN5sTSO556QUuBh
   Q==;
X-CSE-ConnectionGUID: fZ/S1KsLRhS81XYRNdgB/Q==
X-CSE-MsgGUID: QgUa3ACCTle4J/RhZnu/ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36059430"
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; 
   d="scan'208";a="36059430"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 01:13:12 -0800
X-CSE-ConnectionGUID: wTKfJlz9SCOJoowOIId82Q==
X-CSE-MsgGUID: uZJVDN2WRcOkOkqvUR9Dsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102308964"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Jan 2025 01:13:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTHGO-0008Lr-2d;
	Thu, 02 Jan 2025 09:13:08 +0000
Date: Thu, 2 Jan 2025 17:12:26 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Weikang <guoweikang.kernel@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/memmap: Prevent double scanning of memmap by kmemleak
Message-ID: <202501021601.jub4p3EM-lkp@intel.com>
References: <20250102065704.647693-1-guoweikang.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102065704.647693-1-guoweikang.kernel@gmail.com>

Hi Guo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Guo-Weikang/mm-memmap-Prevent-double-scanning-of-memmap-by-kmemleak/20250102-145930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250102065704.647693-1-guoweikang.kernel%40gmail.com
patch subject: [PATCH] mm/memmap: Prevent double scanning of memmap by kmemleak
config: x86_64-buildonly-randconfig-003-20250102 (https://download.01.org/0day-ci/archive/20250102/202501021601.jub4p3EM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501021601.jub4p3EM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501021601.jub4p3EM-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: vmemmap_alloc_block+0xfa (section: .text) -> memmap_alloc (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
