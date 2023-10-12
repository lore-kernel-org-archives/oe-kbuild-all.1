Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B164F658
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 01:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FyqMFtN1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697075341; x=1728611341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AnFM0Nt6QjVFLUDkrOwK6SIkr+ZKi9hX22kaiItO7K4=;
  b=FyqMFtN1CJYULNJTn14UDutranttLEnWELEu4ckLN8CB6qOo8LgdJqOe
   qFPWZ9OrOnlEZ5ce95xXTb840eGdNF3mwl3k2hRh6jL5AIQxI4AwkoBC1
   bYyj651F33XaLraZv8ttohovC5orf9uzRCvdG3gxJwbA9lvLJkODTHqvR
   oSi/PXi7VbZyOnIH7wZSpGBPsoOmm3CuI80y10nq6G8hQGeqfFIPKOaf4
   ongShx3k9Q1pZMIdrRh43SgfDBnhfYz4s+nTgxwMeOZKXhjh0pNqDbhxp
   by74J9+24ekfXVkmUcGh2L71nA7a7vkp0vFI+a0H9DMpMQQR2Dvxfr2qP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="369880186"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="369880186"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 18:49:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="870373069"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="870373069"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2023 18:48:59 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqkor-000301-1U;
	Thu, 12 Oct 2023 01:48:57 +0000
Date: Thu, 12 Oct 2023 09:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/3] mm/memory-tiers: Introduce sysfs for tier
 interleave weights
Message-ID: <202310120945.5jljtMTt-lkp@intel.com>
References: <20231009204259.875232-3-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009204259.875232-3-gregory.price@memverge.com>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on cxl/next cxl/pending v6.6-rc5]
[cannot apply to akpm-mm/mm-everything next-20231011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-memory-tiers-change-mutex-to-rw-semaphore/20231012-044511
base:   linus/master
patch link:    https://lore.kernel.org/r/20231009204259.875232-3-gregory.price%40memverge.com
patch subject: [RFC PATCH v2 2/3] mm/memory-tiers: Introduce sysfs for tier interleave weights
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231012/202310120945.5jljtMTt-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120945.5jljtMTt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120945.5jljtMTt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/vmscan.c:46:
>> include/linux/memory-tiers.h:106:15: warning: no previous prototype for 'memtier_get_node_weight' [-Wmissing-prototypes]
     106 | unsigned char memtier_get_node_weight(int from_node, int target_node,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/memory-tiers.h:112:14: warning: no previous prototype for 'memtier_get_total_weight' [-Wmissing-prototypes]
     112 | unsigned int memtier_get_total_weight(int from_node, nodemask_t *pol_nodes)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/memtier_get_node_weight +106 include/linux/memory-tiers.h

   105	
 > 106	unsigned char memtier_get_node_weight(int from_node, int target_node,
   107					      nodemask_t *pol_nodes)
   108	{
   109		return 0;
   110	}
   111	
 > 112	unsigned int memtier_get_total_weight(int from_node, nodemask_t *pol_nodes)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
