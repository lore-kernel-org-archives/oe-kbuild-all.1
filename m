Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A21629B0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 12:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696250061; x=1727786061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8TYB6PYz7ireFTO5VnZe06e9l96x5MKyrVIAp3cpONk=;
  b=nbdviCy1yAwUN8sV01ry1d1TRVWCtlafYkFOpiNwYjwiP8nwuZvTMXPU
   TY29HPHthIKtSs+LImmS0tl6B+yssIU3+B+sac/+0gJEA+zVzw7azNkI0
   2k4aEivdOCn7/ihPSZFcTNiAI/DKEkhCyBRW9S1RkEaplwLIVfJTIof9m
   G2oaD2FaYBl5qQxKnvmvM8dzAIkj9SkgN9ok2k9fG7/rOiUVeakeLUkac
   INcbNQ/ycTBW5ycQEq7xKbTFhd5OXeQ2gn+g4jl51ALIbMGkBAhckrFEf
   2hPn4Jz7YdTEOkQoXflvHMr5h08FJrN1SznuAScylLgf61JfPBo3B4MgI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="362009260"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="362009260"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 05:34:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1081622306"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="1081622306"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 02 Oct 2023 05:34:12 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnI7R-00063J-1K;
	Mon, 02 Oct 2023 12:33:49 +0000
Date: Mon, 2 Oct 2023 20:33:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 6/34] fs/netfs/internal.h:164:36: warning:
 format '%lx' expects argument of type 'long unsigned int', but argument 4
 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202310022006.3FdUZcF0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   8b08a7e2d3217f7054808246fc559c867f54a524
commit: 38850c7a26f2b4cf1c335de164a4a527dfdae101 [6/34] netfs: Provide invalidate_folio and release_folio calls
config: powerpc-randconfig-002-20231002 (https://download.01.org/0day-ci/archive/20231002/202310022006.3FdUZcF0-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310022006.3FdUZcF0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310022006.3FdUZcF0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swap.h:5,
                    from fs/netfs/misc.c:8:
   fs/netfs/misc.c: In function 'netfs_invalidate_folio':
>> fs/netfs/internal.h:164:36: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     164 | #define _enter(FMT, ...) no_printk("==> %s("FMT")", __func__, ##__VA_ARGS__)
         |                                    ^~~~~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   fs/netfs/internal.h:164:26: note: in expansion of macro 'no_printk'
     164 | #define _enter(FMT, ...) no_printk("==> %s("FMT")", __func__, ##__VA_ARGS__)
         |                          ^~~~~~~~~
   fs/netfs/misc.c:22:9: note: in expansion of macro '_enter'
      22 |         _enter("{%lx},%lx,%lx", folio_index(folio), offset, length);
         |         ^~~~~~
   fs/netfs/internal.h:164:36: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     164 | #define _enter(FMT, ...) no_printk("==> %s("FMT")", __func__, ##__VA_ARGS__)
         |                                    ^~~~~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   fs/netfs/internal.h:164:26: note: in expansion of macro 'no_printk'
     164 | #define _enter(FMT, ...) no_printk("==> %s("FMT")", __func__, ##__VA_ARGS__)
         |                          ^~~~~~~~~
   fs/netfs/misc.c:22:9: note: in expansion of macro '_enter'
      22 |         _enter("{%lx},%lx,%lx", folio_index(folio), offset, length);
         |         ^~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ADB_CUDA
   Depends on [n]: MACINTOSH_DRIVERS [=n] && (ADB [=n] || PPC_PMAC [=y]) && !PPC_PMAC64 [=n]
   Selected by [y]:
   - PPC_PMAC [=y] && PPC_BOOK3S [=y] && CPU_BIG_ENDIAN [=y] && POWER_RESET [=y] && PPC32 [=y]


vim +164 fs/netfs/internal.h

3d3c95046742e4 David Howells 2020-05-13  162  
3d3c95046742e4 David Howells 2020-05-13  163  #else
3d3c95046742e4 David Howells 2020-05-13 @164  #define _enter(FMT, ...) no_printk("==> %s("FMT")", __func__, ##__VA_ARGS__)

:::::: The code at line 164 was first introduced by commit
:::::: 3d3c95046742e4eebaa4b891b0b01cbbed94ebbd netfs: Provide readahead and readpage netfs helpers

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
