Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB52F1FF5E3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 03:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778900965; cv=none; b=V5uFZ4cEiAtj1vfIsYzOE94XYwTdTSU0XSLqJzxUPvsC4zZHwLDSjVTcvNHcCqxOuTPRtgMI4t+yRMmsi9zYZ4MnnHvHhrMAm2VN6JA4cljMSFWdIOdbvH/ARwe3rGEde3T+cqgwpXXxwhOsVDUEIVhpUovvGq9aqXl1teXck2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778900965; c=relaxed/simple;
	bh=qRfqEEK/oTFuibVy7Qb7zNQA204GL40iU97gIngEQjM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W3uXHdVHby8U9HolkXdQOmz0TSZCx//VmBlmSd3WLCUBQxtwKxBJouSZ+LqrrzKnN6egILddiq3Dyc6hIfMULUP/BrnDbc5asLGO59oLH/2lY6JG/hN5t6cXCM4pawvoKbvCHBGljrW1D/3jRZ0E6MDNF5VQfBXxNh3QtLuz9tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j300VT8h; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j300VT8h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778900964; x=1810436964;
  h=date:from:to:cc:subject:message-id;
  bh=qRfqEEK/oTFuibVy7Qb7zNQA204GL40iU97gIngEQjM=;
  b=j300VT8hqF3Opi5rlu6ftr1xueA4z7vsKCZCm09kBB3WcFR1GOneTkkN
   T1AgD5oRWHT85/lkg4xUdm90vwJKkKDBWgcdkVKx6REopZwSIClI+mZfA
   LxNGmzIFn9YduTVTSYBVIal8hWNyH3Nk0QDnZTIWJlwKcA4EISYJyOXWF
   h8zc27K8tRwV/N+/X1tsvT9O5uzTGwKJ7/lWw46LdigRvIPXgA25m9/Hc
   WeV4o5Y/mdpUCHhteNrAi8hOqy+bhW4rwCdF//O0252pnexTfWZsit76R
   uIUpc+648KChfis40f8KpfKa3lIZOUW1aLqximCLaXZiNHB+mf8Yp5bUA
   g==;
X-CSE-ConnectionGUID: tW0LrzNWTy2vKc+t21zCAw==
X-CSE-MsgGUID: bkrYz8z4TnS0cA/pObfWBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="83711330"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="83711330"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 20:09:23 -0700
X-CSE-ConnectionGUID: lxx6kbnIQluvGkM6BNVYUQ==
X-CSE-MsgGUID: oiOpvW+5Q++aCe8sMgzAjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="243839309"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 15 May 2026 20:09:22 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO5Ox-000000009CT-3mza;
	Sat, 16 May 2026 03:09:19 +0000
Date: Sat, 16 May 2026 05:08:20 +0200
From: kernel test robot <lkp@intel.com>
To: Zhen Ni <zhen.ni@easystack.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/mm/page_owner.rst:70: WARNING:
 Literal block expected; none found. [docutils]
Message-ID: <202605160501.NQmx0x3R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Zhen-Ni/mm-page_owner-add-print_mode-filter/20260515-225525
head:   a6ca3c15fa7e6f6f22139da9699ecc02375c6942
commit: a6ca3c15fa7e6f6f22139da9699ecc02375c6942 mm/page_owner: document page_owner filter
date:   12 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260516/202605160501.NQmx0x3R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160501.NQmx0x3R-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Non-Preserved Properties
   ======================== [docutils]
>> Documentation/mm/page_owner.rst:70: WARNING: Literal block expected; none found. [docutils]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:48: ERROR: Unexpected section title.


vim +70 Documentation/mm/page_owner.rst

    69	
  > 70	To filter page_owner output::
    71	
    72		cd tools/mm
    73		make page_owner_filter
    74	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
