Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F34F1C2A1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFsiqyP6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699628265; x=1731164265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zXn/NiYr993eJ0lWZOpY0CPK+pSL/1ZYUOBzqIGz7dA=;
  b=BFsiqyP6pQGs3ZPDZm8lUffBc0fj9SV6mBf90TKGjofRXiMnK7uAUv67
   dvkBFwiiBd+TPTk/RJuyeoB5pwTK+X67XMyrry/toTGjPzFB4kU0yHPTJ
   TMaWjIzVEFXvCdvgj4L0xXNRObwoHIS9IjnHxEfTEb3/VTY2MFKwxn41H
   ru1WGIjuN1F6xSjanbQ6xWHxTBHOmOVeC2zSDZoiwDVYfHpWkYETUD0/5
   NlOh9xeK9CI/jSIXKmc0HF2GkACq0dEKGGtA8QsY8LnAB2W2DPUIHMDzY
   zc3PuBMklk+xc8sVhupk45TZibHpAF8GNRoLzz2pD0/ncCjCIk+DsMsnq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="387354945"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="387354945"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 06:57:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="880984537"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="880984537"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2023 06:57:43 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Sx3-0009fU-2v;
	Fri, 10 Nov 2023 14:57:41 +0000
Date: Fri, 10 Nov 2023 22:57:12 +0800
From: kernel test robot <lkp@intel.com>
To: Zach O'Keefe <zokeefe@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/khugepaged.c:747:25: sparse: sparse: symbol
 'khugepaged_collapse_control' was not declared. Should it be static?
Message-ID: <202311102258.uFby3wrM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89cdf9d556016a54ff6ddd62324aa5ec790c05cc
commit: 34d6b470ab9cf3a038f9bcd0f8cf09016a2e6fbe mm/khugepaged: add struct collapse_control
date:   1 year, 2 months ago
config: i386-randconfig-062-20230909 (https://download.01.org/0day-ci/archive/20231110/202311102258.uFby3wrM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311102258.uFby3wrM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311102258.uFby3wrM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/khugepaged.c:747:25: sparse: sparse: symbol 'khugepaged_collapse_control' was not declared. Should it be static?

vim +/khugepaged_collapse_control +747 mm/khugepaged.c

   745	
   746	
 > 747	struct collapse_control khugepaged_collapse_control = {
   748		.last_target_node = NUMA_NO_NODE,
   749	};
   750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
