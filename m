Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048181861
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 07:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691826611; x=1723362611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jWygOVU9FGPRfO1fs6HdELMzalx/6eQk5u2kNhzb148=;
  b=VBL/C1vklnOWxw1FXzc/kPUCU2h3xowD2imdRcZRjCmPiB2zAx7SArU7
   Xg6VqEteFMQTDL3yvI1udzRzHSkiXdtGV96UooP5LHTuAUEYdmHycnoI/
   b3+x+PGbzvTepm21ZQ/n1tACVwxpdV/W1YKOO/GXUThkoux0rTPcEN981
   johH7GddsPNbjbTbJLn1EDjYfpG/2qPQynJtN6sJ+rUCmLa3QJynsfbmc
   igBpS2mAbpHZdxV/ynCmAoBVcO+1b4pKPT5WyWsm6Vja2R27FAdn7IfC9
   Kb1yW/yNZvO27fnnEiwqMghBM/W2wqaRMMxZXTmPDig450OjsT8lIQDHp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="351417685"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="351417685"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 00:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="798270353"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="798270353"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 Aug 2023 00:50:06 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUjNu-0008O0-0X;
	Sat, 12 Aug 2023 07:50:06 +0000
Date: Sat, 12 Aug 2023 15:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
Subject: [vbabka:slab-orders 1/2] include/linux/kern_levels.h:5:25: warning:
 format '%lu' expects argument of type 'long unsigned int', but argument 2
 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202308121533.nX38oQSg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slab-orders
head:   93d25b5ac13e097b8c7274a7ca354d2a4d88d7ae
commit: e036e48cc75073b52ea9ccf837574f95ad58604d [1/2] mm, slub: print out results for calculate_order() with varying parameters
config: arm-randconfig-r046-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121533.nX38oQSg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121533.nX38oQSg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121533.nX38oQSg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/slub.c:13:
   mm/slub.c: In function '__print_all_orders':
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   mm/slub.c:6262:17: note: in expansion of macro 'pr_info'
    6262 |                 pr_info("%10lu\t%d\n", size, order);
         |                 ^~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
