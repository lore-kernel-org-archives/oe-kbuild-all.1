Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F004430
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755781640; cv=none; b=Idz06zAZgNvsqbPAJwmQ2eI7tjrxkhFIBIhdMzeg4zzpvXNmK6J7n19m3ZUucWJCw5S5wAVlC5sPdBMMZPOI9PJiB+B/A/f1aXUKY3qAuPp3B/82EKrCGS7xAufMKniC9zgtb/ur6L1x2uCSvskJ+BQ43iVRw/jRBqFKvKS8RXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755781640; c=relaxed/simple;
	bh=tE1NmOyzXxvPgrrTJGhuD6AuSH3wZEbvmm4L/snuzc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nAVpXJ6gfqy94p4GDwmH8LG/Kt1czE3oxX6HWGdbQj42lEsDPz3EXdBLTk+pnmws4xrJhmm7t7BbYRYMYRUqUkEtkBUQn0mfWvJq8ev5+WPIsG28uH3DXSGkhyMqqUb8z79r0Ix9bprJCzHNukViyzpxQEj4aC3/nkEWvCxsAjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k401KUJm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k401KUJm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755781639; x=1787317639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tE1NmOyzXxvPgrrTJGhuD6AuSH3wZEbvmm4L/snuzc4=;
  b=k401KUJmCOLWVDMGnpqOmp1/La0Ye5tTMxiZ64dNqarAc+L8ctCjHMis
   ej2FhIXM/F/G2nRkNnwc5+7b13RzCW9AsYy94tCHIdJF66OnVdYsl9rfb
   0qBPxOJb6OWn2q0WrdDmrb6Lbnwgmv9XCquns17vuyox/aHSnV5OdJnn4
   YBQBCwP3PI19qa7D4K+IJ+y00DbB0pYmIQ0KTn1W6mB/JPJhQ9DopLE7v
   cy+vvGXO3Joik8hZ2AxfJ4vPGk5Qe6NhbwTgX7XQs43Yd1M33iLx/6GMz
   BplG0eyRHVo8qvIpxux+s7ZaALNVlcD0H6dAxAHe9JN4boThz9Jf2mZOi
   Q==;
X-CSE-ConnectionGUID: z56v10RLTPiLV4/GpS7WbQ==
X-CSE-MsgGUID: drIoNByeQCiXpUFVCnE/Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57988988"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57988988"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:07:18 -0700
X-CSE-ConnectionGUID: LLYEOhJvS6ONXwTfmM6k9g==
X-CSE-MsgGUID: yPb6mup4QNCW+wCI61oMPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="172826332"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 Aug 2025 06:07:17 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up4yA-000KIJ-0R;
	Thu, 21 Aug 2025 13:06:05 +0000
Date: Thu, 21 Aug 2025 21:04:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:nth_page 22/35] Warning: mm/util.c:1299 function
 parameter 'nr_pages' not described in 'page_range_contiguous'
Message-ID: <202508212039.h1NtKNOg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux nth_page
head:   0c11be702a67d416001abffc75378456f11e1a59
commit: aaef6f2f23b98d3c00e6f992f81cc9ccb4a28dd2 [22/35] mm/cma: refuse handing out non-contiguous page ranges
config: x86_64-buildonly-randconfig-004-20250821 (https://download.01.org/0day-ci/archive/20250821/202508212039.h1NtKNOg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508212039.h1NtKNOg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508212039.h1NtKNOg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/util.c:1299 function parameter 'nr_pages' not described in 'page_range_contiguous'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
