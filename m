Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311A315496
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 22:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691534478; x=1723070478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FDTfQHYLa7MS7THbxreUeyfpachjzDBvn95x4BYsn5M=;
  b=Keh4tkfWhZEG7nCdMOPXQzYT1fhX8K+nLBTKY0FfqWHNz9nf/6+wm52O
   qJYBzR1GynbYLhPL+FaX4N99elmUTonW3JNR5g94IaXVkkI41hTxke3hK
   1YTyAisytB2vJgjSJ21WtfPdpybZ/rEaJXA3Yxq8XAiGrF3X4/3wHc6Nu
   GdKGKtZ0hZ+4AE0R9RQQiKpOodfedkAAp3RD2l1JgRXm+kQedLGxMDE9S
   /oxG1jNs4yF85sUzJnsB6nDQXeYwZfuBxh0QNVVrCNTr/F6vZPz7pXCN9
   RynGByjzYKAEvPLPgZxddqZ0acLBQp+BniyukkhfUNP7w0TL4E5OBnyod
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="355931094"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="355931094"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 15:41:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="734744172"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="734744172"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Aug 2023 15:41:16 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTVO7-0005eU-1I;
	Tue, 08 Aug 2023 22:41:15 +0000
Date: Wed, 9 Aug 2023 06:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
Subject: [vbabka:slub-percpu-caches-v1 3/5]
 maple_tree.c:(.rodata.cst4+0x4b8): undefined reference to
 `kmem_cache_setup_percpu_array'
Message-ID: <202308090636.1lQhPkXf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-caches-v1
head:   23793c9cd4b2fc31144dba68dd67554b8e4308e9
commit: d8feeb2f5066b99e1bfc6cdd23297ab01ba98e25 [3/5] maple_tree: use slub percpu array
config: parisc-randconfig-m031-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090636.1lQhPkXf-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090636.1lQhPkXf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090636.1lQhPkXf-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: lib/maple_tree.o: in function `.LC887':
>> maple_tree.c:(.rodata.cst4+0x4b8): undefined reference to `kmem_cache_setup_percpu_array'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
