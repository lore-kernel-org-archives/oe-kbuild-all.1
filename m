Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17204382
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 01:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689037777; x=1720573777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8yFX+AsV8aldEHCukS66PL3czvDBnWH5sTSwaobkDIg=;
  b=Qsr6VLARU2duoU1GGNW+Rh9gDbu5MDW8EI3RoPkvEE4pXdtk3uklrffB
   cjn5/gncArNmWdhm980wE63onvyMGblapl9QOVtGDRaAtq+qGKM3WtGqh
   cG+FSt76T+SOhUDjLzb8kWBgU5BTQvXkUDcEZ69HXkgB6Lhj+1wsWorSC
   uzRCVi2ckTnTWm7S0owUg2jFHgeBiKo9Ej4EN+bfbqOenIQBp3ORv9XPD
   RHaSJaS5eTFSCzvsOa+RkrlWs4qpgzb+FPVOUj7Oq+fJy3YZb45Rfho2V
   XDaJ+Svg/doNgNjx/vWIToyx7FMd6jn5gou4XldKaF8ro0Qx+7vd9AGaK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="450858565"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="450858565"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 18:09:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="786413007"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="786413007"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Jul 2023 18:09:34 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ1sj-00049j-2f;
	Tue, 11 Jul 2023 01:09:33 +0000
Date: Tue, 11 Jul 2023 09:09:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/fam01-next20230710 2/5]
 arch/sparc/mm/init_64.c:3057:31: error: array subscript -1 is outside array
 bounds of 'char[]'
Message-ID: <202307110949.RG8TpHLo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/fam01-next20230710
head:   58f872f0089daa911786fdbd13d48a0c9147e5b1
commit: b30a1743f607192532d6ad43a08cdbd80051ca5a [2/5] Makefile: Enable -Warray-bounds
config: sparc64-randconfig-r002-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110949.RG8TpHLo-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110949.RG8TpHLo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307110949.RG8TpHLo-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/sparc/mm/init_64.c: In function 'sun4v_linear_pte_xor_finalize':
   arch/sparc/mm/init_64.c:2206:23: error: variable 'pagecv_flag' set but not used [-Werror=unused-but-set-variable]
    2206 |         unsigned long pagecv_flag;
         |                       ^~~~~~~~~~~
   In function 'kernel_lds_init',
       inlined from 'report_memory' at arch/sparc/mm/init_64.c:3069:2:
>> arch/sparc/mm/init_64.c:3057:31: error: array subscript -1 is outside array bounds of 'char[]' [-Werror=array-bounds]
    3057 |         code_resource.end   = compute_kern_paddr(_etext - 1);
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
       inlined from 'report_memory' at arch/sparc/mm/init_64.c:3069:2:
   arch/sparc/mm/init_64.c:3059:31: error: array subscript -1 is outside array bounds of 'char[]' [-Werror=array-bounds]
    3059 |         data_resource.end   = compute_kern_paddr(_edata - 1);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/sections.h: In function 'report_memory':
   include/asm-generic/sections.h:36:32: note: at offset -1 into object '_edata' of size [0, 9223372036854775807]
      36 | extern char _data[], _sdata[], _edata[];
         |                                ^~~~~~
   In function 'kernel_lds_init',
       inlined from 'report_memory' at arch/sparc/mm/init_64.c:3069:2:
   arch/sparc/mm/init_64.c:3061:31: error: array subscript -1 is outside array bounds of 'char[]' [-Werror=array-bounds]
    3061 |         bss_resource.end    = compute_kern_paddr(_end - 1);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/sections.h: In function 'report_memory':
   include/asm-generic/sections.h:41:13: note: at offset -1 into object '_end' of size [0, 9223372036854775807]
      41 | extern char _end[];
         |             ^~~~
   cc1: all warnings being treated as errors


vim +3057 arch/sparc/mm/init_64.c

f6d4fb5cc0475c bob picco 2014-03-03  3053  
f6d4fb5cc0475c bob picco 2014-03-03  3054  static void __init kernel_lds_init(void)
f6d4fb5cc0475c bob picco 2014-03-03  3055  {
f6d4fb5cc0475c bob picco 2014-03-03  3056  	code_resource.start = compute_kern_paddr(_text);
f6d4fb5cc0475c bob picco 2014-03-03 @3057  	code_resource.end   = compute_kern_paddr(_etext - 1);
f6d4fb5cc0475c bob picco 2014-03-03  3058  	data_resource.start = compute_kern_paddr(_etext);
f6d4fb5cc0475c bob picco 2014-03-03  3059  	data_resource.end   = compute_kern_paddr(_edata - 1);
f6d4fb5cc0475c bob picco 2014-03-03  3060  	bss_resource.start  = compute_kern_paddr(__bss_start);
f6d4fb5cc0475c bob picco 2014-03-03  3061  	bss_resource.end    = compute_kern_paddr(_end - 1);
f6d4fb5cc0475c bob picco 2014-03-03  3062  }
f6d4fb5cc0475c bob picco 2014-03-03  3063  

:::::: The code at line 3057 was first introduced by commit
:::::: f6d4fb5cc0475c36437a618db31cbb7f2bf7c282 sparc64 - add mem to iomem resource

:::::: TO: bob picco <bpicco@meloft.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
