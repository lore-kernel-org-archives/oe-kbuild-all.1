Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BC36ABA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 13:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678282788; x=1709818788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aTtgii78nUMQB0b677ZdohE16uA1P9iqWc/Mbxod15g=;
  b=CHZwnpNrOJgcz480nsuxtsr+hS0Qg/S8JRJF5BKPJ59YKROwGForrdFY
   3ElOWV13g/uFtQsVlyqPZAQmzKUr1nJwYMcgyeSnfaNYXpZns1kjvVnvZ
   /g/ZrrS1qTv404FUs1I6K2y/EzpMBlkY71Q9We/ZRq0UKkhc+owZe/iR2
   vNZn745EzJJddUuqfxRemb7wyn7URNibbyqtTxWveiUXiEgJposnWpDNO
   oSVqL2A4RmE+5tjgZDbMNkAgvRsHwC9CM208kWoZAayxmaHCYhSMhdOXm
   mfLloxavnS5NV4mmGz/ZwkUIXt+rPgInDwlC3H575TzPzt5WXx9tn8vQ/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336167233"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="336167233"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 05:39:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="922792354"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="922792354"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2023 05:39:46 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZu1B-00029f-2S;
	Wed, 08 Mar 2023 13:39:45 +0000
Date: Wed, 8 Mar 2023 21:38:47 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [niks:has_ioport_v3 25/39] lib/Kconfig:513:error: recursive
 dependency detected!
Message-ID: <202303082114.v295VcRs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Niklas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v3
head:   15efe5a5643b289fad94dc62901788da89dfb095
commit: 4f99fa4202f6c5e349429b2e4f0aa6a7389a040b [25/39] pcmcia: add HAS_IOPORT dependencies
config: m68k-allyesconfig (attached as .config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=4f99fa4202f6c5e349429b2e4f0aa6a7389a040b
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v3
        git checkout 4f99fa4202f6c5e349429b2e4f0aa6a7389a040b
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 ARCH=m68k 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303082114.v295VcRs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/Kconfig:513:error: recursive dependency detected!
   lib/Kconfig:513:	symbol HAS_IOPORT is selected by ISA
   arch/m68k/Kconfig.bus:38:	symbol ISA depends on HAS_IOPORT
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"


vim +513 lib/Kconfig

24fa0402a9b6a5 Lasse Collin            2011-01-12  358  
c8531ab343dec8 H. Peter Anvin          2009-01-05  359  #
c8531ab343dec8 H. Peter Anvin          2009-01-05  360  # These all provide a common interface (hence the apparent duplication with
c8531ab343dec8 H. Peter Anvin          2009-01-05  361  # ZLIB_INFLATE; DECOMPRESS_GZIP is just a wrapper.)
c8531ab343dec8 H. Peter Anvin          2009-01-05  362  #
c8531ab343dec8 H. Peter Anvin          2009-01-05  363  config DECOMPRESS_GZIP
7856a16ea03ed9 H. Peter Anvin          2009-01-07  364  	select ZLIB_INFLATE
c8531ab343dec8 H. Peter Anvin          2009-01-05  365  	tristate
c8531ab343dec8 H. Peter Anvin          2009-01-05  366  
c8531ab343dec8 H. Peter Anvin          2009-01-05  367  config DECOMPRESS_BZIP2
c8531ab343dec8 H. Peter Anvin          2009-01-05  368  	tristate
c8531ab343dec8 H. Peter Anvin          2009-01-05  369  
c8531ab343dec8 H. Peter Anvin          2009-01-05  370  config DECOMPRESS_LZMA
c8531ab343dec8 H. Peter Anvin          2009-01-05  371  	tristate
c8531ab343dec8 H. Peter Anvin          2009-01-05  372  
3ebe12439ba7fc Lasse Collin            2011-01-12  373  config DECOMPRESS_XZ
3ebe12439ba7fc Lasse Collin            2011-01-12  374  	select XZ_DEC
3ebe12439ba7fc Lasse Collin            2011-01-12  375  	tristate
3ebe12439ba7fc Lasse Collin            2011-01-12  376  
cacb246f8db2b9 Albin Tonnerre          2010-01-08  377  config DECOMPRESS_LZO
cacb246f8db2b9 Albin Tonnerre          2010-01-08  378  	select LZO_DECOMPRESS
cacb246f8db2b9 Albin Tonnerre          2010-01-08  379  	tristate
cacb246f8db2b9 Albin Tonnerre          2010-01-08  380  
e76e1fdfa8f8dc Kyungsik Lee            2013-07-08  381  config DECOMPRESS_LZ4
e76e1fdfa8f8dc Kyungsik Lee            2013-07-08  382  	select LZ4_DECOMPRESS
e76e1fdfa8f8dc Kyungsik Lee            2013-07-08  383  	tristate
e76e1fdfa8f8dc Kyungsik Lee            2013-07-08  384  
4963bb2b89884b Nick Terrell            2020-07-30  385  config DECOMPRESS_ZSTD
4963bb2b89884b Nick Terrell            2020-07-30  386  	select ZSTD_DECOMPRESS
4963bb2b89884b Nick Terrell            2020-07-30  387  	tristate
4963bb2b89884b Nick Terrell            2020-07-30  388  
f14f75b81187cd Jes Sorensen            2005-06-21  389  #
f14f75b81187cd Jes Sorensen            2005-06-21  390  # Generic allocator support is selected if needed
f14f75b81187cd Jes Sorensen            2005-06-21  391  #
f14f75b81187cd Jes Sorensen            2005-06-21  392  config GENERIC_ALLOCATOR
6341e62b212a25 Christoph Jaeger        2014-12-20  393  	bool
f14f75b81187cd Jes Sorensen            2005-06-21  394  
^1da177e4c3f41 Linus Torvalds          2005-04-16  395  #
^1da177e4c3f41 Linus Torvalds          2005-04-16  396  # reed solomon support is select'ed if needed
^1da177e4c3f41 Linus Torvalds          2005-04-16  397  #
^1da177e4c3f41 Linus Torvalds          2005-04-16  398  config REED_SOLOMON
^1da177e4c3f41 Linus Torvalds          2005-04-16  399  	tristate
^1da177e4c3f41 Linus Torvalds          2005-04-16  400  	
^1da177e4c3f41 Linus Torvalds          2005-04-16  401  config REED_SOLOMON_ENC8
6341e62b212a25 Christoph Jaeger        2014-12-20  402  	bool
^1da177e4c3f41 Linus Torvalds          2005-04-16  403  
^1da177e4c3f41 Linus Torvalds          2005-04-16  404  config REED_SOLOMON_DEC8
6341e62b212a25 Christoph Jaeger        2014-12-20  405  	bool
^1da177e4c3f41 Linus Torvalds          2005-04-16  406  
^1da177e4c3f41 Linus Torvalds          2005-04-16  407  config REED_SOLOMON_ENC16
6341e62b212a25 Christoph Jaeger        2014-12-20  408  	bool
^1da177e4c3f41 Linus Torvalds          2005-04-16  409  
^1da177e4c3f41 Linus Torvalds          2005-04-16  410  config REED_SOLOMON_DEC16
6341e62b212a25 Christoph Jaeger        2014-12-20  411  	bool
^1da177e4c3f41 Linus Torvalds          2005-04-16  412  
437aa565e26567 Ivan Djelic             2011-03-11  413  #
437aa565e26567 Ivan Djelic             2011-03-11  414  # BCH support is selected if needed
437aa565e26567 Ivan Djelic             2011-03-11  415  #
437aa565e26567 Ivan Djelic             2011-03-11  416  config BCH
437aa565e26567 Ivan Djelic             2011-03-11  417  	tristate
437aa565e26567 Ivan Djelic             2011-03-11  418  
437aa565e26567 Ivan Djelic             2011-03-11  419  config BCH_CONST_PARAMS
6341e62b212a25 Christoph Jaeger        2014-12-20  420  	bool
437aa565e26567 Ivan Djelic             2011-03-11  421  	help
437aa565e26567 Ivan Djelic             2011-03-11  422  	  Drivers may select this option to force specific constant
437aa565e26567 Ivan Djelic             2011-03-11  423  	  values for parameters 'm' (Galois field order) and 't'
437aa565e26567 Ivan Djelic             2011-03-11  424  	  (error correction capability). Those specific values must
437aa565e26567 Ivan Djelic             2011-03-11  425  	  be set by declaring default values for symbols BCH_CONST_M
437aa565e26567 Ivan Djelic             2011-03-11  426  	  and BCH_CONST_T.
437aa565e26567 Ivan Djelic             2011-03-11  427  	  Doing so will enable extra compiler optimizations,
437aa565e26567 Ivan Djelic             2011-03-11  428  	  improving encoding and decoding performance up to 2x for
437aa565e26567 Ivan Djelic             2011-03-11  429  	  usual (m,t) values (typically such that m*t < 200).
437aa565e26567 Ivan Djelic             2011-03-11  430  	  When this option is selected, the BCH library supports
437aa565e26567 Ivan Djelic             2011-03-11  431  	  only a single (m,t) configuration. This is mainly useful
437aa565e26567 Ivan Djelic             2011-03-11  432  	  for NAND flash board drivers requiring known, fixed BCH
437aa565e26567 Ivan Djelic             2011-03-11  433  	  parameters.
437aa565e26567 Ivan Djelic             2011-03-11  434  
437aa565e26567 Ivan Djelic             2011-03-11  435  config BCH_CONST_M
437aa565e26567 Ivan Djelic             2011-03-11  436  	int
437aa565e26567 Ivan Djelic             2011-03-11  437  	range 5 15
437aa565e26567 Ivan Djelic             2011-03-11  438  	help
437aa565e26567 Ivan Djelic             2011-03-11  439  	  Constant value for Galois field order 'm'. If 'k' is the
437aa565e26567 Ivan Djelic             2011-03-11  440  	  number of data bits to protect, 'm' should be chosen such
437aa565e26567 Ivan Djelic             2011-03-11  441  	  that (k + m*t) <= 2**m - 1.
437aa565e26567 Ivan Djelic             2011-03-11  442  	  Drivers should declare a default value for this symbol if
437aa565e26567 Ivan Djelic             2011-03-11  443  	  they select option BCH_CONST_PARAMS.
437aa565e26567 Ivan Djelic             2011-03-11  444  
437aa565e26567 Ivan Djelic             2011-03-11  445  config BCH_CONST_T
437aa565e26567 Ivan Djelic             2011-03-11  446  	int
437aa565e26567 Ivan Djelic             2011-03-11  447  	help
437aa565e26567 Ivan Djelic             2011-03-11  448  	  Constant value for error correction capability in bits 't'.
437aa565e26567 Ivan Djelic             2011-03-11  449  	  Drivers should declare a default value for this symbol if
437aa565e26567 Ivan Djelic             2011-03-11  450  	  they select option BCH_CONST_PARAMS.
437aa565e26567 Ivan Djelic             2011-03-11  451  
f7704347a74fce David S. Miller         2005-06-24  452  #
f7704347a74fce David S. Miller         2005-06-24  453  # Textsearch support is select'ed if needed
f7704347a74fce David S. Miller         2005-06-24  454  #
2de4ff7bd658c9 Thomas Graf             2005-06-23  455  config TEXTSEARCH
6341e62b212a25 Christoph Jaeger        2014-12-20  456  	bool
^1da177e4c3f41 Linus Torvalds          2005-04-16  457  
df3fb93ad9ec0b Thomas Graf             2005-06-23  458  config TEXTSEARCH_KMP
f7704347a74fce David S. Miller         2005-06-24  459  	tristate
df3fb93ad9ec0b Thomas Graf             2005-06-23  460  
8082e4ed0a61da Pablo Neira Ayuso       2005-08-25  461  config TEXTSEARCH_BM
29cb9f9c5502f6 David S. Miller         2005-08-25  462  	tristate
8082e4ed0a61da Pablo Neira Ayuso       2005-08-25  463  
6408f79cce401e Thomas Graf             2005-06-23  464  config TEXTSEARCH_FSM
f7704347a74fce David S. Miller         2005-06-24  465  	tristate
6408f79cce401e Thomas Graf             2005-06-23  466  
5db53f3e80dee2 Joern Engel             2009-11-20  467  config BTREE
6341e62b212a25 Christoph Jaeger        2014-12-20  468  	bool
5db53f3e80dee2 Joern Engel             2009-11-20  469  
a88cc108f6f39e Chris Wilson            2014-03-17  470  config INTERVAL_TREE
6341e62b212a25 Christoph Jaeger        2014-12-20  471  	bool
a88cc108f6f39e Chris Wilson            2014-03-17  472  	help
a88cc108f6f39e Chris Wilson            2014-03-17  473  	  Simple, embeddable, interval-tree. Can find the start of an
a88cc108f6f39e Chris Wilson            2014-03-17  474  	  overlapping range in log(n) time and then iterate over all
a88cc108f6f39e Chris Wilson            2014-03-17  475  	  overlapping nodes. The algorithm is implemented as an
a88cc108f6f39e Chris Wilson            2014-03-17  476  	  augmented rbtree.
a88cc108f6f39e Chris Wilson            2014-03-17  477  
a88cc108f6f39e Chris Wilson            2014-03-17  478  	  See:
a88cc108f6f39e Chris Wilson            2014-03-17  479  
14bbe3e33710be Matthew Wilcox (Oracle  2020-04-01  480) 		Documentation/core-api/rbtree.rst
a88cc108f6f39e Chris Wilson            2014-03-17  481  
a88cc108f6f39e Chris Wilson            2014-03-17  482  	  for more information.
a88cc108f6f39e Chris Wilson            2014-03-17  483  
5fe937862c8426 Jason Gunthorpe         2022-11-29  484  config INTERVAL_TREE_SPAN_ITER
5fe937862c8426 Jason Gunthorpe         2022-11-29  485  	bool
5fe937862c8426 Jason Gunthorpe         2022-11-29  486  	depends on INTERVAL_TREE
5fe937862c8426 Jason Gunthorpe         2022-11-29  487  
02c02bf12c5d83 Matthew Wilcox          2017-11-03  488  config XARRAY_MULTI
57578c2ea2cb2e Matthew Wilcox          2016-05-20  489  	bool
02c02bf12c5d83 Matthew Wilcox          2017-11-03  490  	help
02c02bf12c5d83 Matthew Wilcox          2017-11-03  491  	  Support entries which occupy multiple consecutive indices in the
02c02bf12c5d83 Matthew Wilcox          2017-11-03  492  	  XArray.
57578c2ea2cb2e Matthew Wilcox          2016-05-20  493  
3cb989501c2688 David Howells           2013-09-24  494  config ASSOCIATIVE_ARRAY
3cb989501c2688 David Howells           2013-09-24  495  	bool
3cb989501c2688 David Howells           2013-09-24  496  	help
3cb989501c2688 David Howells           2013-09-24  497  	  Generic associative array.  Can be searched and iterated over whilst
3cb989501c2688 David Howells           2013-09-24  498  	  it is being modified.  It is also reasonably quick to search and
3cb989501c2688 David Howells           2013-09-24  499  	  modify.  The algorithms are non-recursive, and the trees are highly
3cb989501c2688 David Howells           2013-09-24  500  	  capacious.
3cb989501c2688 David Howells           2013-09-24  501  
3cb989501c2688 David Howells           2013-09-24  502  	  See:
3cb989501c2688 David Howells           2013-09-24  503  
5fb94e9ca333f0 Mauro Carvalho Chehab   2018-05-08  504  		Documentation/core-api/assoc_array.rst
3cb989501c2688 David Howells           2013-09-24  505  
3cb989501c2688 David Howells           2013-09-24  506  	  for more information.
3cb989501c2688 David Howells           2013-09-24  507  
5ea81769940034 Al Viro                 2007-02-11  508  config HAS_IOMEM
6341e62b212a25 Christoph Jaeger        2014-12-20  509  	bool
5ea81769940034 Al Viro                 2007-02-11  510  	depends on !NO_IOMEM
5ea81769940034 Al Viro                 2007-02-11  511  	default y
5ea81769940034 Al Viro                 2007-02-11  512  
54db159220086b Niklas Schnelle         2021-12-20 @513  config HAS_IOPORT
54db159220086b Niklas Schnelle         2021-12-20  514  	bool
54db159220086b Niklas Schnelle         2021-12-20  515  

:::::: The code at line 513 was first introduced by commit
:::::: 54db159220086bcf9167a248ef0092ad5ffb1ce7 Kconfig: introduce HAS_IOPORT option and select it as necessary

:::::: TO: Niklas Schnelle <schnelle@linux.ibm.com>
:::::: CC: Niklas Schnelle <schnelle@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
