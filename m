Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134175DF22
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 16:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706977380; cv=none; b=XUZHDWDywxlcWFFlIqR7BDQHeETmUdpAeCzs+GJAcxp43BpU6AUMVip27ODx3uMSSLGvxZtGSWy2XWAJzbv0mVTbXNjrDLCg3cbiWhQPRwpZAJmVNTmQ8b9IY9/Cmg1KOXeQfs+6HMvvb07QUt8XUiNeQbC/1LdiHKKP19Ls3Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706977380; c=relaxed/simple;
	bh=pxfHy6WlUCvJoBkWpv8moVVc5Q8voUSqnXEo2OleG2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vE0EECja598IiothGlML6WjI4fp/q1H1iWmyac8Dam67/49uE3K7YcVg8hvm3gV4w4YTTz7ZMuS/G+aX+mvH0k/nHXwCQX6xwC8ROtX/JQ6JdpHPJ4JeXv96yJGlN+T1/T9ppM2/nG8kLMH11HEr0GATGQ4bzwV5vwSiL2ucjA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMBUogcP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMBUogcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706977378; x=1738513378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pxfHy6WlUCvJoBkWpv8moVVc5Q8voUSqnXEo2OleG2o=;
  b=TMBUogcPYsBjerTxTFD3T7YqAktlW1YPcQV3O1eFgCcT4rB/0cPpb5/B
   J0m0qWYrKW/EPk3DaMhNNjXNtp0AOphu3SFoqaAopMMfxyLSOc/qgKEzD
   IyCImIaCSirvn6ba0oKGYmCCTVdLfxYQDFyC/MRZURdfo1+3CCdhe7CRI
   gtLDEZY+in27Sflw2QVSSl0IBrmogucm/kCGaDnzM0OopvBqfGe3dOJ/Z
   qDENo8+V/4g+xs8Si/ukWhkoJyvasWMrrCG1rzYo71M2+dKECuVqN2tHh
   eK3hGdHZjHlhn34JCSiaMTdsgqO4LHZKUarBzFuOzrz+ddBOgrWl8xAxm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="489643"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="489643"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 08:22:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="4959592"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Feb 2024 08:22:56 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWIn4-0005II-0a;
	Sat, 03 Feb 2024 16:22:53 +0000
Date: Sun, 4 Feb 2024 00:22:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 2558/3789] include/kunit/test.h:528:17: warning:
 '%s' directive argument is null
Message-ID: <202402040001.VSlU8PNJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   076d56d74f17e625b3d63cf4743b3d7d02180379
commit: 3e39acf56ededdebd1033349a16b704839b94b28 [2558/3789] ALSA: core: Add sound core KUnit test
config: x86_64-randconfig-011-20240203 (https://download.01.org/0day-ci/archive/20240204/202402040001.VSlU8PNJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402040001.VSlU8PNJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402040001.VSlU8PNJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/kunit/assert.h:13,
                    from include/kunit/test.h:12,
                    from sound/core/sound_kunit.c:7:
   sound/core/sound_kunit.c: In function 'test_card_set_id':
   include/linux/printk.h:455:44: warning: '%s' directive argument is null [-Wformat-overflow=]
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                            ^
   include/linux/printk.h:427:17: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                 ^~~~~~~
   include/kunit/test.h:527:17: note: in expansion of macro 'printk'
     527 |                 printk(lvl fmt, ##__VA_ARGS__);                         \
         |                 ^~~~~~
   include/kunit/test.h:533:9: note: in expansion of macro 'kunit_log'
     533 |         kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,         \
         |         ^~~~~~~~~
   include/kunit/test.h:546:9: note: in expansion of macro 'kunit_printk'
     546 |         kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   sound/core/sound_kunit.c:259:9: note: in expansion of macro 'kunit_info'
     259 |         kunit_info(test, "%s", card->id);
         |         ^~~~~~~~~~
   In file included from sound/core/sound_kunit.c:7:
>> include/kunit/test.h:528:17: warning: '%s' directive argument is null [-Wformat-overflow=]
     528 |                 kunit_log_append((test_or_suite)->log,  fmt,            \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     529 |                                  ##__VA_ARGS__);                        \
         |                                  ~~~~~~~~~~~~~~
   include/kunit/test.h:533:9: note: in expansion of macro 'kunit_log'
     533 |         kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,         \
         |         ^~~~~~~~~
   include/kunit/test.h:546:9: note: in expansion of macro 'kunit_printk'
     546 |         kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   sound/core/sound_kunit.c:259:9: note: in expansion of macro 'kunit_info'
     259 |         kunit_info(test, "%s", card->id);
         |         ^~~~~~~~~~


vim +528 include/kunit/test.h

e2219db280e3fe Alan Maguire    2020-03-26  484  
6d2426b2f258da David Gow       2021-06-24  485  /**
6d2426b2f258da David Gow       2021-06-24  486   * kunit_mark_skipped() - Marks @test_or_suite as skipped
6d2426b2f258da David Gow       2021-06-24  487   *
6d2426b2f258da David Gow       2021-06-24  488   * @test_or_suite: The test context object.
6d2426b2f258da David Gow       2021-06-24  489   * @fmt:  A printk() style format string.
6d2426b2f258da David Gow       2021-06-24  490   *
6d2426b2f258da David Gow       2021-06-24  491   * Marks the test as skipped. @fmt is given output as the test status
6d2426b2f258da David Gow       2021-06-24  492   * comment, typically the reason the test was skipped.
6d2426b2f258da David Gow       2021-06-24  493   *
6d2426b2f258da David Gow       2021-06-24  494   * Test execution continues after kunit_mark_skipped() is called.
6d2426b2f258da David Gow       2021-06-24  495   */
6d2426b2f258da David Gow       2021-06-24  496  #define kunit_mark_skipped(test_or_suite, fmt, ...)			\
6d2426b2f258da David Gow       2021-06-24  497  	do {								\
6d2426b2f258da David Gow       2021-06-24  498  		WRITE_ONCE((test_or_suite)->status, KUNIT_SKIPPED);	\
6d2426b2f258da David Gow       2021-06-24  499  		scnprintf((test_or_suite)->status_comment,		\
6d2426b2f258da David Gow       2021-06-24  500  			  KUNIT_STATUS_COMMENT_SIZE,			\
6d2426b2f258da David Gow       2021-06-24  501  			  fmt, ##__VA_ARGS__);				\
6d2426b2f258da David Gow       2021-06-24  502  	} while (0)
6d2426b2f258da David Gow       2021-06-24  503  
6d2426b2f258da David Gow       2021-06-24  504  /**
6d2426b2f258da David Gow       2021-06-24  505   * kunit_skip() - Marks @test_or_suite as skipped
6d2426b2f258da David Gow       2021-06-24  506   *
6d2426b2f258da David Gow       2021-06-24  507   * @test_or_suite: The test context object.
6d2426b2f258da David Gow       2021-06-24  508   * @fmt:  A printk() style format string.
6d2426b2f258da David Gow       2021-06-24  509   *
6d2426b2f258da David Gow       2021-06-24  510   * Skips the test. @fmt is given output as the test status
6d2426b2f258da David Gow       2021-06-24  511   * comment, typically the reason the test was skipped.
6d2426b2f258da David Gow       2021-06-24  512   *
6d2426b2f258da David Gow       2021-06-24  513   * Test execution is halted after kunit_skip() is called.
6d2426b2f258da David Gow       2021-06-24  514   */
6d2426b2f258da David Gow       2021-06-24  515  #define kunit_skip(test_or_suite, fmt, ...)				\
6d2426b2f258da David Gow       2021-06-24  516  	do {								\
6d2426b2f258da David Gow       2021-06-24  517  		kunit_mark_skipped((test_or_suite), fmt, ##__VA_ARGS__);\
6d2426b2f258da David Gow       2021-06-24  518  		kunit_try_catch_throw(&((test_or_suite)->try_catch));	\
6d2426b2f258da David Gow       2021-06-24  519  	} while (0)
e2219db280e3fe Alan Maguire    2020-03-26  520  
e2219db280e3fe Alan Maguire    2020-03-26  521  /*
e2219db280e3fe Alan Maguire    2020-03-26  522   * printk and log to per-test or per-suite log buffer.  Logging only done
e2219db280e3fe Alan Maguire    2020-03-26  523   * if CONFIG_KUNIT_DEBUGFS is 'y'; if it is 'n', no log is allocated/used.
e2219db280e3fe Alan Maguire    2020-03-26  524   */
e2219db280e3fe Alan Maguire    2020-03-26  525  #define kunit_log(lvl, test_or_suite, fmt, ...)				\
e2219db280e3fe Alan Maguire    2020-03-26  526  	do {								\
e2219db280e3fe Alan Maguire    2020-03-26  527  		printk(lvl fmt, ##__VA_ARGS__);				\
2c6a96dad5797e Rae Moar        2023-03-08 @528  		kunit_log_append((test_or_suite)->log,	fmt,		\
e2219db280e3fe Alan Maguire    2020-03-26  529  				 ##__VA_ARGS__);			\
e2219db280e3fe Alan Maguire    2020-03-26  530  	} while (0)
e2219db280e3fe Alan Maguire    2020-03-26  531  
741a98d022362c Brendan Higgins 2019-09-23  532  #define kunit_printk(lvl, test, fmt, ...)				\
c3bba690a26432 Alan Maguire    2020-03-26  533  	kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,		\
c3bba690a26432 Alan Maguire    2020-03-26  534  		  (test)->name,	##__VA_ARGS__)
914cc63eea6fbe Brendan Higgins 2019-09-23  535  
914cc63eea6fbe Brendan Higgins 2019-09-23  536  /**
914cc63eea6fbe Brendan Higgins 2019-09-23  537   * kunit_info() - Prints an INFO level message associated with @test.
914cc63eea6fbe Brendan Higgins 2019-09-23  538   *
914cc63eea6fbe Brendan Higgins 2019-09-23  539   * @test: The test context object.
914cc63eea6fbe Brendan Higgins 2019-09-23  540   * @fmt:  A printk() style format string.
914cc63eea6fbe Brendan Higgins 2019-09-23  541   *
914cc63eea6fbe Brendan Higgins 2019-09-23  542   * Prints an info level message associated with the test suite being run.
914cc63eea6fbe Brendan Higgins 2019-09-23  543   * Takes a variable number of format parameters just like printk().
914cc63eea6fbe Brendan Higgins 2019-09-23  544   */
914cc63eea6fbe Brendan Higgins 2019-09-23  545  #define kunit_info(test, fmt, ...) \
914cc63eea6fbe Brendan Higgins 2019-09-23 @546  	kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
914cc63eea6fbe Brendan Higgins 2019-09-23  547  

:::::: The code at line 528 was first introduced by commit
:::::: 2c6a96dad5797e57b4cf04101d6c8d5c7a571603 kunit: fix bug of extra newline characters in debugfs logs

:::::: TO: Rae Moar <rmoar@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
