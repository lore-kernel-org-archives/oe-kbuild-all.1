Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31A43B285
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 20:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Af1JvyoG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699649609; x=1731185609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pG/zny4q8LZPtCPE67yHT7WiAIhIEydSbJARI2VzDQA=;
  b=Af1JvyoGpgDIgKTv+MjY4GAAs80t6CRsih0PeZ8VOBQrXeogyu1iDqN8
   nOrcADymNs+kKB+uhbTz6lptivpEfuW3VEd5L0yx8DhWEn1SQk5ZiXjAU
   zwqo8dJjo2AwEvnTKVLFrbjDiFix6nce0wlG4xEBaT8qwHK/wG/XOVgpN
   MUnQPb766MlM9plyNv/EQJ8sJbcTlo5zZ9xQcZUU5dxnIyTvk7Lq7Nis1
   IvtVcsS7Dt58qjYySGlrfhmgM+ndSL9+nl5JPPrSoqlCNu+TkFzoDssFX
   bv+SDSjHw9ZlR0+t7RnIdiDbNQlw1x9UgY3HQ+dno9EQ8X1Cd3HBoviM7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="387395205"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="387395205"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 12:53:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="767413346"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="767413346"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Nov 2023 12:53:28 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1YVK-0009tI-0e;
	Fri, 10 Nov 2023 20:53:26 +0000
Date: Sat, 11 Nov 2023 04:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: Feng Tang <feng.tang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: ERROR: start_text address is c000000000000900, should be
 c000000000000200
Message-ID: <202311110405.PqH7IcX7-lkp@intel.com>
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
commit: cf536e185869d4815d506e777bcca6edd9966a6e Makefile: extend 32B aligned debug option to 64B aligned
date:   2 years, 6 months ago
config: powerpc64-buildonly-randconfig-r003-20211118 (https://download.01.org/0day-ci/archive/20231111/202311110405.PqH7IcX7-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110405.PqH7IcX7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110405.PqH7IcX7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: start_text address is c000000000000900, should be c000000000000200
   ERROR: try to enable LD_HEAD_STUB_CATCH config option
   ERROR: see comments in arch/powerpc/tools/head_check.sh

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
