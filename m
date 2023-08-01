Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F26E4DC89
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 18:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690915421; x=1722451421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yBVL6kOwEqZnzmoz9oCG+uTCB4l95uiDVOvH1ypkU2I=;
  b=bJf8fglUMi6kZfIONWpCjTkc49frE8I1CdSD8aebJ/9mwjegqnucyke3
   Hegpl9X7XtbHdX6TTd4w+XsjskaZlvqGCLZzJyRAIT70sOab5/JqDtnVt
   0tY7buUbzFx3Wr1f9WFTFFd63yTpEEMGS9cna4LoO1ntCkx+3Rt6xAzd2
   8oHL7udr2NRPHwx1cQLorKBvvu9w7fnP0eJXKqIHh5781BTxkkQRRGCkP
   rtBIuroMvef+S3UMk4d8/oHgEalVExW01STGvd3NwsvIwA/i7zbLk8q2H
   bc++I7JB24A8ADEK4TFzTBqCgbjH7VAnhP4Ny0fze8Cq64/O0x5xzScXB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="349688524"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="349688524"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 11:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="798780083"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="798780083"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Aug 2023 11:43:38 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQuLJ-0000Wh-2V;
	Tue, 01 Aug 2023 18:43:37 +0000
Date: Wed, 2 Aug 2023 02:43:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Tobin C. Harding" <tobin@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.14.y 6518/9999] lib/string.c:312:7: error:
 redefinition of 'stpcpy'
Message-ID: <202308020214.xzsfpaPo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   60a6e3043cc8b918c989707a5eba5fd6830a08a4
commit: fe072e50be403fc52c426c15073b8c38ce301416 [6518/9999] lib/string: Add strscpy_pad() function
config: openrisc-alldefconfig (https://download.01.org/0day-ci/archive/20230802/202308020214.xzsfpaPo-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020214.xzsfpaPo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020214.xzsfpaPo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/string.c:312:7: error: redefinition of 'stpcpy'
     312 | char *stpcpy(char *__restrict__ dest, const char *__restrict__ src)
         |       ^~~~~~
   lib/string.c:255:7: note: previous definition of 'stpcpy' with type 'char *(char *, const char *)'
     255 | char *stpcpy(char *__restrict__ dest, const char *__restrict__ src)
         |       ^~~~~~


vim +/stpcpy +312 lib/string.c

fe072e50be403f Tobin C. Harding               2019-04-05  295  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  296  #ifndef __HAVE_ARCH_STRCAT
^1da177e4c3f41 Linus Torvalds                 2005-04-16  297  /**
^1da177e4c3f41 Linus Torvalds                 2005-04-16  298   * strcat - Append one %NUL-terminated string to another
^1da177e4c3f41 Linus Torvalds                 2005-04-16  299   * @dest: The string to be appended to
^1da177e4c3f41 Linus Torvalds                 2005-04-16  300   * @src: The string to append to it
^1da177e4c3f41 Linus Torvalds                 2005-04-16  301   */
0c28130b5c9e8f Paolo 'Blaisorblade' Giarrusso 2005-05-05  302  #undef strcat
^1da177e4c3f41 Linus Torvalds                 2005-04-16  303  char *strcat(char *dest, const char *src)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  304  {
^1da177e4c3f41 Linus Torvalds                 2005-04-16  305  	char *tmp = dest;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  306  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  307  	while (*dest)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  308  		dest++;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  309  	while ((*dest++ = *src++) != '\0')
^1da177e4c3f41 Linus Torvalds                 2005-04-16  310  		;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  311  	return tmp;
^1da177e4c3f41 Linus Torvalds                 2005-04-16 @312  }
^1da177e4c3f41 Linus Torvalds                 2005-04-16  313  EXPORT_SYMBOL(strcat);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  314  #endif
^1da177e4c3f41 Linus Torvalds                 2005-04-16  315  

:::::: The code at line 312 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
