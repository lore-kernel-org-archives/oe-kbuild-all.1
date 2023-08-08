Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0BF14A9C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 17:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691515328; x=1723051328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fEqtOZ72BqZeQk/Tdin4uek2TJmyEz6+UNUo3dPMGS4=;
  b=kWsbyAx2aAHQi209XgMu+2Km2FsRh876AZQFJrVtj2Toq7FBKRK8ckwE
   /RzQwc4uLTWBpq9OAaMmNJU97LGpeLgi7gKg7aGMnCw2DueKsDPN63jBc
   wLP58F/WQsKy9L4idLGyAuelb3ejpKHdWavlemOBYT99ST4/RxLRXlTUu
   2JQTbbvCIZcLwgT3GTFIwvVY4HUPw8b4KpWdhlZdnlUDoajpz4KKs6NTe
   AEAAIHP+7zlQDWzJGWfnOnsuS2WYRkr8mOX/WTUZo1VbCf3d9g6ZmrnwN
   1wPPmYNbA9vSZFzJECkd4a7Y2gYM6K7Dbu2fftNrUGZy1cj1NU4vJnjyQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369794366"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="369794366"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 10:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="708347297"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="708347297"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Aug 2023 10:22:06 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTQPF-0005Uq-21;
	Tue, 08 Aug 2023 17:22:05 +0000
Date: Wed, 9 Aug 2023 01:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
Subject: [vbabka:slub-percpu-caches-v1 3/5] maple_tree.c:undefined reference
 to `kmem_cache_setup_percpu_array'
Message-ID: <202308090134.QVs4tYeo-lkp@intel.com>
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
config: arc-randconfig-r043-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090134.QVs4tYeo-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090134.QVs4tYeo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090134.QVs4tYeo-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: lib/maple_tree.o: in function `maple_tree_init':
>> maple_tree.c:(.init.text+0x22): undefined reference to `kmem_cache_setup_percpu_array'
>> arc-elf-ld: maple_tree.c:(.init.text+0x22): undefined reference to `kmem_cache_setup_percpu_array'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
