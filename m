Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11E36AA2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 18:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693421798; x=1724957798;
  h=date:from:cc:subject:message-id:mime-version;
  bh=d8mXpERgjjuLz25b2dcYULoZFAiF56KvC1VyUy6aiMs=;
  b=BX8ShJ5JZElSu0lx4K9SIT498NZKcd0CM8nFR0+HAgZvFFJhEhZwq64F
   xujTeL5NiihyiVFVd+z5Smj3eQp1vS1xwcLnS7fsE9H/lA0cRLSZwIOfH
   zyhJeTDL1cw4xPMr8Myk9QJpFlr1BHZVZg7BDUu+gEUjip9mEEk5y0XuX
   srSPrSFxp0NrrA+KcOmhsfL/qz6Xmi0pgUJBr7LTu/zzL65XJMbD6hdci
   /lZK3VUHlBPzX48CL1hfWzSlfSZCN34RrIO+Ix+TYcFhQNAIaZDnjPN8O
   OV3WVBUPTQstHjt1jLJ4enLY9qcqYOWmEj6qoXgjwbrwORPb6XHEhKWGV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="356043047"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="356043047"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 11:56:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="809257538"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="809257538"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Aug 2023 11:56:35 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbQM7-000A87-1Z
	for oe-kbuild-all@lists.linux.dev;
	Wed, 30 Aug 2023 18:56:17 +0000
Date: Thu, 31 Aug 2023 02:55:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.14 8619/9354] ld.lld: error: undefined
 symbol: __read_overflow2
Message-ID: <202308310259.lOgxrlgD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14
head:   6f750b16c322c9191168a3a97c427c90581d9144
commit: f472b2bece42dfb72c4bfd187b5c4757f986d8b1 [8619/9354] UPSTREAM: kasan: add compiler support for clang
config: x86_64-randconfig-074-20230830 (https://download.01.org/0day-ci/archive/20230831/202308310259.lOgxrlgD-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310259.lOgxrlgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310259.lOgxrlgD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __read_overflow2
   >>> referenced by string.h:340 (include/linux/string.h:340)
   >>>               drivers/net/phy/micrel.o:(kszphy_get_strings) in archive built-in.o
   >>> referenced by string.h:340 (include/linux/string.h:340)
   >>>               drivers/net/phy/marvell.o:(marvell_get_strings) in archive built-in.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
