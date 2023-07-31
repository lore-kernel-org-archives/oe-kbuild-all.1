Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79663657
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 19:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690830426; x=1722366426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WFQTb1NoH4KJdQpchKq81lKoH+q0eGAYNJVtt8gGVKI=;
  b=YdoIf0ycrdd608TCljL9JYEBMvKJa2hbNkfTdKvkYJt9J0Vbv63omCe2
   rb0JDINWupwWK81W62ZS8BWdSfh9ShljdHh2tHYI5QKXW8W6WM94HLw+w
   HdDR0Sle1GQcZwt9h7pj70PJVKkBGaumahmx/e0YyjIREnsyooBNlEh/r
   VBIWFMW3TA41AlV4iU9MCLd0DFS9cVqGoYQFufOja/T6iJKY2ygAtfxWL
   9gZkYOzCm8XGjTTI1N5aA3gAEUBxSv4Ri+yIz6e9Kn6Tpt/doreb9g44D
   2kkRngF+wtJLkQoCB1L88G0cbRjArpJB85hbGIe/3z1kzcOLSHfSijxFP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="359142190"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="359142190"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 12:07:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="902244547"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="902244547"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 31 Jul 2023 12:07:04 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQYER-0005J1-2r;
	Mon, 31 Jul 2023 19:07:03 +0000
Date: Tue, 1 Aug 2023 03:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/fam01-next20230731 2/3]
 arch/sparc/mm/init_64.c:3073:31: error: array subscript -1 is outside array
 bounds of 'char[]'
Message-ID: <202308010320.Wqt7lyc4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/fam01-next20230731
head:   fe48117f31afb2a3804b91b382a77a4e6d3b4351
commit: 1e1ad1e6266067981cd3119d43b132d5370c0976 [2/3] Makefile: Enable -Warray-bounds
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230801/202308010320.Wqt7lyc4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010320.Wqt7lyc4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308010320.Wqt7lyc4-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/sparc/mm/init_64.c: In function 'arch_hugetlb_valid_size':
   arch/sparc/mm/init_64.c:355:24: error: variable 'hv_pgsz_idx' set but not used [-Werror=unused-but-set-variable]
     355 |         unsigned short hv_pgsz_idx;
         |                        ^~~~~~~~~~~
   arch/sparc/mm/init_64.c: At top level:
   arch/sparc/mm/init_64.c:2630:6: error: no previous prototype for 'vmemmap_free' [-Werror=missing-prototypes]
    2630 | void vmemmap_free(unsigned long start, unsigned long end,
         |      ^~~~~~~~~~~~
   In function 'kernel_lds_init',
       inlined from 'report_memory' at arch/sparc/mm/init_64.c:3085:2:
>> arch/sparc/mm/init_64.c:3073:31: error: array subscript -1 is outside array bounds of 'char[]' [-Werror=array-bounds]
    3073 |         code_resource.end   = compute_kern_paddr(_etext - 1);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/sparc/include/asm/sections.h:6,
                    from include/linux/interrupt.h:21,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/hugetlb.h:10,
                    from arch/sparc/mm/init_64.c:16:
   include/asm-generic/sections.h: In function 'report_memory':
   include/asm-generic/sections.h:35:32: note: at offset -1 into object '_etext' of size [0, 9223372036854775807]
      35 | extern char _text[], _stext[], _etext[];
         |                                ^~~~~~
   In function 'kernel_lds_init',
       inlined from 'report_memory' at arch/sparc/mm/init_64.c:3085:2:
   arch/sparc/mm/init_64.c:3075:31: error: array subscript -1 is outside array bounds of 'char[]' [-Werror=array-bounds]
    3075 |         data_resource.end   = compute_kern_paddr(_edata - 1);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/sections.h: In function 'report_memory':
   include/asm-generic/sections.h:36:32: note: at offset -1 into object '_edata' of size [0, 9223372036854775807]
      36 | extern char _data[], _sdata[], _edata[];
         |                                ^~~~~~
   In function 'kernel_lds_init',
       inlined from 'report_memory' at arch/sparc/mm/init_64.c:3085:2:
   arch/sparc/mm/init_64.c:3077:31: error: array subscript -1 is outside array bounds of 'char[]' [-Werror=array-bounds]
    3077 |         bss_resource.end    = compute_kern_paddr(_end - 1);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/sections.h: In function 'report_memory':
   include/asm-generic/sections.h:41:13: note: at offset -1 into object '_end' of size [0, 9223372036854775807]
      41 | extern char _end[];
         |             ^~~~
   cc1: all warnings being treated as errors


vim +3073 arch/sparc/mm/init_64.c

f6d4fb5cc0475c bob picco 2014-03-03  3069  
f6d4fb5cc0475c bob picco 2014-03-03  3070  static void __init kernel_lds_init(void)
f6d4fb5cc0475c bob picco 2014-03-03  3071  {
f6d4fb5cc0475c bob picco 2014-03-03  3072  	code_resource.start = compute_kern_paddr(_text);
f6d4fb5cc0475c bob picco 2014-03-03 @3073  	code_resource.end   = compute_kern_paddr(_etext - 1);
f6d4fb5cc0475c bob picco 2014-03-03  3074  	data_resource.start = compute_kern_paddr(_etext);
f6d4fb5cc0475c bob picco 2014-03-03  3075  	data_resource.end   = compute_kern_paddr(_edata - 1);
f6d4fb5cc0475c bob picco 2014-03-03  3076  	bss_resource.start  = compute_kern_paddr(__bss_start);
f6d4fb5cc0475c bob picco 2014-03-03  3077  	bss_resource.end    = compute_kern_paddr(_end - 1);
f6d4fb5cc0475c bob picco 2014-03-03  3078  }
f6d4fb5cc0475c bob picco 2014-03-03  3079  

:::::: The code at line 3073 was first introduced by commit
:::::: f6d4fb5cc0475c36437a618db31cbb7f2bf7c282 sparc64 - add mem to iomem resource

:::::: TO: bob picco <bpicco@meloft.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
