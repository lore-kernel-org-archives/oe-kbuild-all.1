Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFF422CBD0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 12:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739880556; cv=none; b=aPVt13bdQmhn2DhWGqFudRzWvJCt9acUZUlUNYHuVVe9vi+3TzzQvGDK9wnrcet1MWv9FHkIE8Pdzj/6PGLrfa36eKoEn2nk1rLTO02b75XOMwgFAcSDYZW65LqZOR0Ywh7QaX67G1WRusvBZPWnw7OuCNmUoi0TzpC8e5rM9vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739880556; c=relaxed/simple;
	bh=3bqTF3woxoL4JnUMd0tAm5+mcX7pd7jNTZOEoQ3dMFA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g4iUGpRZC3iNVtZKhM3zw77y09QBNtEoXX9M1C7NmalFu9smhDY88yRbCjAyETuvWtiyw6GGUm/rNa8S86dzt7zzHMnFc3GgPsOaQ+e4q7ZPZjUXiBBoZzWCsqiSd/Ypxbiggk/sniQquHMBwBJQLcLMWCwekV2jcTIcUgC4C8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOMQtu05; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOMQtu05"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739880555; x=1771416555;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3bqTF3woxoL4JnUMd0tAm5+mcX7pd7jNTZOEoQ3dMFA=;
  b=aOMQtu05uD2tyA3nHlx4rzOxQ57sAxwVuydsl++5ez8xLqWThuEfw8JC
   4sKhgJf6Z6e3BANm6DtAwIZpl841v7ZqIZd0phns4/KXDJBvjel64NzMG
   kSfWH2k3VJcjh9lKXH/niyHXGYn6tnuUtDMOBcy2MLtWzZC0gOzykk04z
   oR+RHcqa2ralbvT2cJh5uwhIi7/39gOZWqHqrL0L2Z2HHDHsPCEgpn8qo
   vtq6im7jpwEeXzWP47tlyrpxwWmDI1CSblFt859gKVR93mnjShC/lWf/v
   5GjFvDluP3LXcwzTtmJNcF8lUnysbqoDo+pJbCP2RQKHS9tYTeHEI7r50
   g==;
X-CSE-ConnectionGUID: y2e1X6RQS8GksdTOCsLJ1g==
X-CSE-MsgGUID: yoFfVkOORwOWFwbda0uQ8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40707364"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="40707364"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 04:09:14 -0800
X-CSE-ConnectionGUID: nfZG6o8QQlGHoa2XPzKRKw==
X-CSE-MsgGUID: Gd9lsWR+QOS7Z4rJs1zX7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119591211"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 Feb 2025 04:09:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkMPS-0000Uz-1L
	for oe-kbuild-all@lists.linux.dev;
	Tue, 18 Feb 2025 12:09:07 +0000
Date: Tue, 18 Feb 2025 20:08:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/60 1/1] drivers/mtd/nand/raw/nand_bbt.c:563:32:
 warning: writing 1 byte into a region of size 0
Message-ID: <202502181951.Yl0X71jJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Miquel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: 72c5af00272339af6bbed6fe7275cd731f57be2d [1/1] mtd: rawnand: Clarify Kconfig entry MTD_NAND
config: arc-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250218/202502181951.Yl0X71jJ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502181951.Yl0X71jJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502181951.Yl0X71jJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/asm-generic/div64.h:235:16: note: in expansion of macro 'if'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                ^~
   include/linux/mtd/nand.h:462:21: note: in expansion of macro 'do_div'
     462 |         pos->page = do_div(tmp, nand->memorg.pages_per_eraseblock);
         |                     ^~~~~~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/asm-generic/div64.h:235:16: note: in expansion of macro 'if'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:235:20: note: in expansion of macro 'likely'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                    ^~~~~~
   include/linux/mtd/nand.h:463:27: note: in expansion of macro 'do_div'
     463 |         pos->eraseblock = do_div(tmp, nand->memorg.eraseblocks_per_lun);
         |                           ^~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/asm-generic/div64.h:235:16: note: in expansion of macro 'if'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                ^~
   include/linux/mtd/nand.h:463:27: note: in expansion of macro 'do_div'
     463 |         pos->eraseblock = do_div(tmp, nand->memorg.eraseblocks_per_lun);
         |                           ^~~~~~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/asm-generic/div64.h:235:16: note: in expansion of macro 'if'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:235:20: note: in expansion of macro 'likely'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                    ^~~~~~
   include/linux/mtd/nand.h:465:20: note: in expansion of macro 'do_div'
     465 |         pos->lun = do_div(tmp, nand->memorg.luns_per_target);
         |                    ^~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/asm-generic/div64.h:235:16: note: in expansion of macro 'if'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                ^~
   include/linux/mtd/nand.h:465:20: note: in expansion of macro 'do_div'
     465 |         pos->lun = do_div(tmp, nand->memorg.luns_per_target);
         |                    ^~~~~~
   drivers/mtd/nand/raw/internals.h: In function 'nand_exec_op':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   drivers/mtd/nand/raw/internals.h:113:9: note: in expansion of macro 'if'
     113 |         if (WARN_ON(op->cs >= nanddev_ntargets(&chip->base)))
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:192:9: note: in expansion of macro 'unlikely'
     192 |         unlikely(__ret_warn_on);                                        \
         |         ^~~~~~~~
   drivers/mtd/nand/raw/internals.h:113:13: note: in expansion of macro 'WARN_ON'
     113 |         if (WARN_ON(op->cs >= nanddev_ntargets(&chip->base)))
         |             ^~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   drivers/mtd/nand/raw/internals.h:113:9: note: in expansion of macro 'if'
     113 |         if (WARN_ON(op->cs >= nanddev_ntargets(&chip->base)))
         |         ^~
   drivers/mtd/nand/raw/nand_bbt.c: In function 'search_bbt.isra':
>> drivers/mtd/nand/raw/nand_bbt.c:563:32: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
     563 |                 td->version[i] = 0;
         |                 ~~~~~~~~~~~~~~~^~~
   In file included from drivers/mtd/nand/raw/nand_bbt.c:63:
   include/linux/mtd/bbm.h:60:17: note: at offset 8 into destination object 'version' of size 8
      60 |         uint8_t version[NAND_MAX_CHIPS];
         |                 ^~~~~~~


vim +563 drivers/mtd/nand/raw/nand_bbt.c

^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  515  
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  516  /**
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  517   * search_bbt - [GENERIC] scan the device for a specific bad block table
0813621ba898aa drivers/mtd/nand/raw/nand_bbt.c Boris Brezillon           2018-11-11  518   * @this: NAND chip object
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  519   * @buf: temporary buffer
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  520   * @td: descriptor for the bad block table
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  521   *
8b6e50c9eba8bf drivers/mtd/nand/nand_bbt.c     Brian Norris              2011-05-25  522   * Read the bad block table by searching for a given ident pattern. Search is
8b6e50c9eba8bf drivers/mtd/nand/nand_bbt.c     Brian Norris              2011-05-25  523   * preformed either from the beginning up or from the end of the device
8b6e50c9eba8bf drivers/mtd/nand/nand_bbt.c     Brian Norris              2011-05-25  524   * downwards. The search starts always at the start of a block. If the option
8b6e50c9eba8bf drivers/mtd/nand/nand_bbt.c     Brian Norris              2011-05-25  525   * NAND_BBT_PERCHIP is given, each chip is searched for a bbt, which contains
8b6e50c9eba8bf drivers/mtd/nand/nand_bbt.c     Brian Norris              2011-05-25  526   * the bad block information of this chip. This is necessary to provide support
8b6e50c9eba8bf drivers/mtd/nand/nand_bbt.c     Brian Norris              2011-05-25  527   * for certain DOC devices.
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  528   *
8b6e50c9eba8bf drivers/mtd/nand/nand_bbt.c     Brian Norris              2011-05-25  529   * The bbt ident pattern resides in the oob area of the first page in a block.
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  530   */
0813621ba898aa drivers/mtd/nand/raw/nand_bbt.c Boris Brezillon           2018-11-11  531  static int search_bbt(struct nand_chip *this, uint8_t *buf,
0813621ba898aa drivers/mtd/nand/raw/nand_bbt.c Boris Brezillon           2018-11-11  532  		      struct nand_bbt_descr *td)
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  533  {
6c836d515ff85e drivers/mtd/nand/raw/nand_bbt.c Boris Brezillon           2018-10-29  534  	u64 targetsize = nanddev_target_size(&this->base);
0813621ba898aa drivers/mtd/nand/raw/nand_bbt.c Boris Brezillon           2018-11-11  535  	struct mtd_info *mtd = nand_to_mtd(this);
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  536  	int i, chips;
930de53701c139 drivers/mtd/nand/nand_bbt.c     Brian Norris              2014-01-02  537  	int startblock, block, dir;
28318776a80bc3 drivers/mtd/nand/nand_bbt.c     Joern Engel               2006-05-22  538  	int scanlen = mtd->writesize + mtd->oobsize;
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  539  	int bbtblocks;
8593fbc68b0df1 drivers/mtd/nand/nand_bbt.c     Thomas Gleixner           2006-05-29  540  	int blocktopage = this->bbt_erase_shift - this->page_shift;
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  541  
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  542  	/* Search direction top -> down? */
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  543  	if (td->options & NAND_BBT_LASTBLOCK) {
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  544  		startblock = (mtd->size >> this->bbt_erase_shift) - 1;
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  545  		dir = -1;
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  546  	} else {
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  547  		startblock = 0;
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  548  		dir = 1;
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  549  	}
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  550  
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  551  	/* Do we have a bbt per chip? */
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  552  	if (td->options & NAND_BBT_PERCHIP) {
32813e288414fe drivers/mtd/nand/raw/nand_bbt.c Boris Brezillon           2018-10-29  553  		chips = nanddev_ntargets(&this->base);
6c836d515ff85e drivers/mtd/nand/raw/nand_bbt.c Boris Brezillon           2018-10-29  554  		bbtblocks = targetsize >> this->bbt_erase_shift;
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  555  		startblock &= bbtblocks - 1;
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  556  	} else {
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  557  		chips = 1;
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  558  		bbtblocks = mtd->size >> this->bbt_erase_shift;
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  559  	}
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  560  
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  561  	for (i = 0; i < chips; i++) {
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  562  		/* Reset version information */
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16 @563  		td->version[i] = 0;
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  564  		td->pages[i] = -1;
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  565  		/* Scan the maximum number of blocks */
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  566  		for (block = 0; block < td->maxblocks; block++) {
8593fbc68b0df1 drivers/mtd/nand/nand_bbt.c     Thomas Gleixner           2006-05-29  567  
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  568  			int actblock = startblock + dir * block;
69423d99fc182a drivers/mtd/nand/nand_bbt.c     Adrian Hunter             2008-12-10  569  			loff_t offs = (loff_t)actblock << this->bbt_erase_shift;
8593fbc68b0df1 drivers/mtd/nand/nand_bbt.c     Thomas Gleixner           2006-05-29  570  
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  571  			/* Read first page */
0813621ba898aa drivers/mtd/nand/raw/nand_bbt.c Boris Brezillon           2018-11-11  572  			scan_read(this, buf, offs, mtd->writesize, td);
28318776a80bc3 drivers/mtd/nand/nand_bbt.c     Joern Engel               2006-05-22  573  			if (!check_pattern(buf, scanlen, mtd->writesize, td)) {
8593fbc68b0df1 drivers/mtd/nand/nand_bbt.c     Thomas Gleixner           2006-05-29  574  				td->pages[i] = actblock << blocktopage;
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  575  				if (td->options & NAND_BBT_VERSION) {
0813621ba898aa drivers/mtd/nand/raw/nand_bbt.c Boris Brezillon           2018-11-11  576  					offs = bbt_get_ver_offs(this, td);
7cba7b14fe1799 drivers/mtd/nand/nand_bbt.c     Sebastian Andrzej Siewior 2010-09-30  577  					td->version[i] = buf[offs];
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  578  				}
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  579  				break;
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  580  			}
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  581  		}
6c836d515ff85e drivers/mtd/nand/raw/nand_bbt.c Boris Brezillon           2018-10-29  582  		startblock += targetsize >> this->bbt_erase_shift;
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  583  	}
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  584  	/* Check, if we found a bbt for each requested chip */
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  585  	for (i = 0; i < chips; i++) {
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  586  		if (td->pages[i] == -1)
9a4d4d69018e7b drivers/mtd/nand/nand_bbt.c     Brian Norris              2011-07-19  587  			pr_warn("Bad block table not found for chip %d\n", i);
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  588  		else
2ac63d901b1170 drivers/mtd/nand/nand_bbt.c     Rafał Miłecki             2014-08-19  589  			pr_info("Bad block table found at page %d, version 0x%02X\n",
2ac63d901b1170 drivers/mtd/nand/nand_bbt.c     Rafał Miłecki             2014-08-19  590  				td->pages[i], td->version[i]);
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  591  	}
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  592  	return 0;
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  593  }
^1da177e4c3f41 drivers/mtd/nand/nand_bbt.c     Linus Torvalds            2005-04-16  594  

:::::: The code at line 563 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
