Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10721C33
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 04:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C0P3X6Tf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697171394; x=1728707394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lq2fNYF0qZKdf0beEslsOP3ZHn9NnujODKNjOBKAXfk=;
  b=C0P3X6TfgnZCf28VVvvs6CT4vqfalQ90l5LPi1is4nMqUKJh1j7e2nwJ
   3gfqfcUjIhj4o/AnlEOn0TCL1q9wyEesVZXueHyeOR0BFUZZiiR+PaALe
   7MjstvManwIsNv0TJTsSHVWE/JguCHaqYM/TV6QabX4azYtcyzDH6SHNW
   j65zzm3P5tCosZVFhpRlyWe1IgerQ+pdKDpKHs7V4h97ojzoDHcspAowT
   nYslcdZQy7yavuLjYxZthbsEN19vqihfs/eajpT5CWKXdZkU5rk7BsWI6
   jy4RG41OxeDkO+Wp8yg9SG6BsyPeJ6RWLqp3zcmLk7YeAz8zxYmMiV5Jp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="451582084"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="451582084"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 21:29:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="704470518"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="704470518"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 12 Oct 2023 21:29:52 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr9o6-0004KL-10;
	Fri, 13 Oct 2023 04:29:50 +0000
Date: Fri, 13 Oct 2023 12:29:31 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/3] mm/memory-tiers: Introduce sysfs for tier
 interleave weights
Message-ID: <202310131212.2B2Hfkid-lkp@intel.com>
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
[cannot apply to akpm-mm/mm-everything next-20231012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-memory-tiers-change-mutex-to-rw-semaphore/20231012-044511
base:   linus/master
patch link:    https://lore.kernel.org/r/20231009204259.875232-3-gregory.price%40memverge.com
patch subject: [RFC PATCH v2 2/3] mm/memory-tiers: Introduce sysfs for tier interleave weights
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20231013/202310131212.2B2Hfkid-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131212.2B2Hfkid-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131212.2B2Hfkid-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/vmscan.c:46:0:
>> include/linux/memory-tiers.h:106:15: warning: no previous declaration for 'memtier_get_node_weight' [-Wmissing-declarations]
    unsigned char memtier_get_node_weight(int from_node, int target_node,
                  ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/memory-tiers.h:112:14: warning: no previous declaration for 'memtier_get_total_weight' [-Wmissing-declarations]
    unsigned int memtier_get_total_weight(int from_node, nodemask_t *pol_nodes)
                 ^~~~~~~~~~~~~~~~~~~~~~~~


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
