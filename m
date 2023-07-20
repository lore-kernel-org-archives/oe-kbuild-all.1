Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E81F199EF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 08:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689842420; x=1721378420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KGVLG9F+44nemYy5n2nlLCx2Ui/BF+yahJwPM5chfrs=;
  b=bkUPRsgHYPQT3ZtWHnhqJ+diTbOesMSSAtKY4kyfz6Kjel7tRzsm2NRM
   mMho/fax9mKtyRYN6or3UMM9DN3MS1z0b4KcqKZqbqjkQeCOnnKe6tpy8
   J0HOdQijzDjOvIkRmST32kOsKxFE6ttNzUY9N0i1uYWqJgrM9U6yMGkXw
   HVO/O8iOJhfCeJBNXyi4tNuZsydWfuWXS0f9YKgA3xupijdZ9ZYYFdSnF
   3VWoDmehu3rJ90djXOojP+mdJRs2PF4qJ/1wmi1w7EfbfydMm6YCZT+Fr
   coHYMF/WCGJ6SjVUDKxDWFXZrixhQAl7MotbCYEDLF2X0OJp6wSPdxwS8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="430443142"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="430443142"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 01:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="838020676"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="838020676"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jul 2023 01:40:17 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMPCq-0005wP-2P;
	Thu, 20 Jul 2023 08:40:16 +0000
Date: Thu, 20 Jul 2023 16:39:42 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <keescook@chromium.org>
Subject: [stable:linux-5.10.y 119/9999]
 arch/sh/boot/compressed/../../../../lib/decompress_unlzo.c:46:12: warning:
 variable 'level' set but not used
Message-ID: <202307201649.0A7oZ97N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   381518b4a9165cd793599c1668c82079fcbcbe1f
commit: b506450ce3d904386c1bd7e33c74f9343548d2d8 [119/9999] seccomp: Add missing return in non-void function
config: sh-randconfig-r015-20230720 (https://download.01.org/0day-ci/archive/20230720/202307201649.0A7oZ97N-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307201649.0A7oZ97N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307201649.0A7oZ97N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/sh/boot/compressed/misc.c:70:
   arch/sh/boot/compressed/../../../../lib/decompress_unlzo.c: In function 'parse_header':
>> arch/sh/boot/compressed/../../../../lib/decompress_unlzo.c:46:12: warning: variable 'level' set but not used [-Wunused-but-set-variable]
      46 |         u8 level = 0;
         |            ^~~~~
   arch/sh/boot/compressed/misc.c: At top level:
   arch/sh/boot/compressed/misc.c:109:6: warning: no previous prototype for '__stack_chk_fail' [-Wmissing-prototypes]
     109 | void __stack_chk_fail(void)
         |      ^~~~~~~~~~~~~~~~
   arch/sh/boot/compressed/misc.c:115:6: warning: no previous prototype for 'ftrace_stub' [-Wmissing-prototypes]
     115 | void ftrace_stub(void)
         |      ^~~~~~~~~~~
   arch/sh/boot/compressed/misc.c:125:6: warning: no previous prototype for 'decompress_kernel' [-Wmissing-prototypes]
     125 | void decompress_kernel(void)
         |      ^~~~~~~~~~~~~~~~~


vim +/level +46 arch/sh/boot/compressed/../../../../lib/decompress_unlzo.c

7dd65feb6c603e Albin Tonnerre 2010-01-08  40  
d97b07c54f34e8 Yinghai Lu     2014-08-08  41  STATIC inline long INIT parse_header(u8 *input, long *skip, long in_len)
7dd65feb6c603e Albin Tonnerre 2010-01-08  42  {
7dd65feb6c603e Albin Tonnerre 2010-01-08  43  	int l;
7dd65feb6c603e Albin Tonnerre 2010-01-08  44  	u8 *parse = input;
5a3f81a7029daf Lasse Collin   2011-01-12  45  	u8 *end = input + in_len;
7dd65feb6c603e Albin Tonnerre 2010-01-08 @46  	u8 level = 0;
7dd65feb6c603e Albin Tonnerre 2010-01-08  47  	u16 version;
7dd65feb6c603e Albin Tonnerre 2010-01-08  48  
5a3f81a7029daf Lasse Collin   2011-01-12  49  	/*
5a3f81a7029daf Lasse Collin   2011-01-12  50  	 * Check that there's enough input to possibly have a valid header.
5a3f81a7029daf Lasse Collin   2011-01-12  51  	 * Then it is possible to parse several fields until the minimum
5a3f81a7029daf Lasse Collin   2011-01-12  52  	 * size may have been used.
5a3f81a7029daf Lasse Collin   2011-01-12  53  	 */
5a3f81a7029daf Lasse Collin   2011-01-12  54  	if (in_len < HEADER_SIZE_MIN)
5a3f81a7029daf Lasse Collin   2011-01-12  55  		return 0;
5a3f81a7029daf Lasse Collin   2011-01-12  56  
7dd65feb6c603e Albin Tonnerre 2010-01-08  57  	/* read magic: 9 first bits */
7dd65feb6c603e Albin Tonnerre 2010-01-08  58  	for (l = 0; l < 9; l++) {
7dd65feb6c603e Albin Tonnerre 2010-01-08  59  		if (*parse++ != lzop_magic[l])
7dd65feb6c603e Albin Tonnerre 2010-01-08  60  			return 0;
7dd65feb6c603e Albin Tonnerre 2010-01-08  61  	}
7dd65feb6c603e Albin Tonnerre 2010-01-08  62  	/* get version (2bytes), skip library version (2),
7dd65feb6c603e Albin Tonnerre 2010-01-08  63  	 * 'need to be extracted' version (2) and
7dd65feb6c603e Albin Tonnerre 2010-01-08  64  	 * method (1) */
7dd65feb6c603e Albin Tonnerre 2010-01-08  65  	version = get_unaligned_be16(parse);
7dd65feb6c603e Albin Tonnerre 2010-01-08  66  	parse += 7;
7dd65feb6c603e Albin Tonnerre 2010-01-08  67  	if (version >= 0x0940)
7dd65feb6c603e Albin Tonnerre 2010-01-08  68  		level = *parse++;
7dd65feb6c603e Albin Tonnerre 2010-01-08  69  	if (get_unaligned_be32(parse) & HEADER_HAS_FILTER)
7dd65feb6c603e Albin Tonnerre 2010-01-08  70  		parse += 8; /* flags + filter info */
7dd65feb6c603e Albin Tonnerre 2010-01-08  71  	else
7dd65feb6c603e Albin Tonnerre 2010-01-08  72  		parse += 4; /* flags */
7dd65feb6c603e Albin Tonnerre 2010-01-08  73  
5a3f81a7029daf Lasse Collin   2011-01-12  74  	/*
5a3f81a7029daf Lasse Collin   2011-01-12  75  	 * At least mode, mtime_low, filename length, and checksum must
5a3f81a7029daf Lasse Collin   2011-01-12  76  	 * be left to be parsed. If also mtime_high is present, it's OK
5a3f81a7029daf Lasse Collin   2011-01-12  77  	 * because the next input buffer check is after reading the
5a3f81a7029daf Lasse Collin   2011-01-12  78  	 * filename length.
5a3f81a7029daf Lasse Collin   2011-01-12  79  	 */
5a3f81a7029daf Lasse Collin   2011-01-12  80  	if (end - parse < 8 + 1 + 4)
5a3f81a7029daf Lasse Collin   2011-01-12  81  		return 0;
5a3f81a7029daf Lasse Collin   2011-01-12  82  
7dd65feb6c603e Albin Tonnerre 2010-01-08  83  	/* skip mode and mtime_low */
7dd65feb6c603e Albin Tonnerre 2010-01-08  84  	parse += 8;
7dd65feb6c603e Albin Tonnerre 2010-01-08  85  	if (version >= 0x0940)
7dd65feb6c603e Albin Tonnerre 2010-01-08  86  		parse += 4;	/* skip mtime_high */
7dd65feb6c603e Albin Tonnerre 2010-01-08  87  
7dd65feb6c603e Albin Tonnerre 2010-01-08  88  	l = *parse++;
7dd65feb6c603e Albin Tonnerre 2010-01-08  89  	/* don't care about the file name, and skip checksum */
5a3f81a7029daf Lasse Collin   2011-01-12  90  	if (end - parse < l + 4)
5a3f81a7029daf Lasse Collin   2011-01-12  91  		return 0;
7dd65feb6c603e Albin Tonnerre 2010-01-08  92  	parse += l + 4;
7dd65feb6c603e Albin Tonnerre 2010-01-08  93  
7dd65feb6c603e Albin Tonnerre 2010-01-08  94  	*skip = parse - input;
7dd65feb6c603e Albin Tonnerre 2010-01-08  95  	return 1;
7dd65feb6c603e Albin Tonnerre 2010-01-08  96  }
7dd65feb6c603e Albin Tonnerre 2010-01-08  97  

:::::: The code at line 46 was first introduced by commit
:::::: 7dd65feb6c603e13eba501c34c662259ab38e70e lib: add support for LZO-compressed kernels

:::::: TO: Albin Tonnerre <albin.tonnerre@free-electrons.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
