Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5559376FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 09:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708592816; cv=none; b=CsLwvc3kjck95x5ON6vU80jtoFKQlAVlySOkSv6YPkLStp5QSj77tz5ZtyZnDZJv49M0FnO9YlFmEVSl9w9RuAdaO4u8SO7UlKe8MhDi1+oKb/EBJR5kie+Tm/pP825yY4bkyU9uX+U/7oD2brLvSsdCaIQ4Yw1k4Y8IVjdxVU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708592816; c=relaxed/simple;
	bh=m/xmSu0j1rbgh7jAXez2FDWO3UGiuaD6qqV2evsF6Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MK+/oio5qhbouWJ79TY6TxGxsb/vEUazGEWyF+NUKUDbqSUPKR0iobNt/xVj2I8yD8RgfoUMc5QdTWv2EZ+b+/LjvqfrEbgo4W+abrMxZtfWuYHO0X/EOJNX/2cuf4RuVrdtJ7cdGursaIaL5SsdCDDiRbVSIddnKoWlaQ/RReE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmQWRYUe; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmQWRYUe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708592815; x=1740128815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m/xmSu0j1rbgh7jAXez2FDWO3UGiuaD6qqV2evsF6Sc=;
  b=mmQWRYUebaI20h2FbDu+UYAJXAfWk0+l9aWP1Y4egVGFbSsJcjJNVNo0
   DShTd0X+QHQyhoujIYmxnnnZ4mx//EebvL1is4aS0kAo5VZMQWsPwj8Ct
   hxY4Bz4GOgDjO/ioHllaJYmt4yhNXcIRm9JFuWxRw91Uw8ToPkHotEIy+
   Lh2A1aNXTBxrJYVBBGHa/G3tQmviBtSSNR7tp4nkoRBmEbbGIj6vppKbh
   bVCcH3n37pN4gWVolK4u1vNLWeuE3ElQ6neVGbOApwz6wS0jejb608aYF
   53OZ3ohhlyKTLowSsgtWqs2kiULtoD3kV2i3vCA/Q7jXnPiGjqCcVJpNe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="25264900"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="25264900"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 01:06:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="42905950"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Feb 2024 01:06:53 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd52Y-00069q-1y;
	Thu, 22 Feb 2024 09:06:50 +0000
Date: Thu, 22 Feb 2024 17:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:for-next/kspp 33/35] lib/fortify_kunit.c:675:33: warning:
 'strncat' output may be truncated copying 15 bytes from a string of length
 31
Message-ID: <202402221649.Mw7k4WTb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
head:   e3508eabe0cce31e8bfd2c9da60fd45f129e37b9
commit: aea52ebe8f1b8a5ec28bc17d620edc4e30a1f649 [33/35] fortify: Add KUnit tests for runtime overflows
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240222/202402221649.Mw7k4WTb-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221649.Mw7k4WTb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221649.Mw7k4WTb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/err.h:5,
                    from include/kunit/assert.h:12,
                    from include/kunit/test.h:12,
                    from include/kunit/device.h:16,
                    from lib/fortify_kunit.c:26:
   lib/fortify_kunit.c: In function 'strncat_test':
>> lib/fortify_kunit.c:675:33: warning: 'strncat' output may be truncated copying 15 bytes from a string of length 31 [-Wstringop-truncation]
     675 |         KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, partial) == pad.buf);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/kunit/test.h:654:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     654 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1214:9: note: in expansion of macro 'KUNIT_TRUE_MSG_ASSERTION'
    1214 |         KUNIT_TRUE_MSG_ASSERTION(test,                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1211:9: note: in expansion of macro 'KUNIT_ASSERT_TRUE_MSG'
    1211 |         KUNIT_ASSERT_TRUE_MSG(test, condition, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~
   lib/fortify_kunit.c:675:9: note: in expansion of macro 'KUNIT_ASSERT_TRUE'
     675 |         KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, partial) == pad.buf);
         |         ^~~~~~~~~~~~~~~~~
   lib/fortify_kunit.c:679:33: warning: 'strncat' output may be truncated copying 15 bytes from a string of length 31 [-Wstringop-truncation]
     679 |         KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, partial) == pad.buf);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/kunit/test.h:654:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     654 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1214:9: note: in expansion of macro 'KUNIT_TRUE_MSG_ASSERTION'
    1214 |         KUNIT_TRUE_MSG_ASSERTION(test,                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1211:9: note: in expansion of macro 'KUNIT_ASSERT_TRUE_MSG'
    1211 |         KUNIT_ASSERT_TRUE_MSG(test, condition, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~
   lib/fortify_kunit.c:679:9: note: in expansion of macro 'KUNIT_ASSERT_TRUE'
     679 |         KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, partial) == pad.buf);
         |         ^~~~~~~~~~~~~~~~~
>> lib/fortify_kunit.c:688:33: warning: 'strncat' output may be truncated copying 1 byte from a string of length 31 [-Wstringop-truncation]
     688 |         KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, 1) == pad.buf);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/kunit/test.h:654:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     654 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1214:9: note: in expansion of macro 'KUNIT_TRUE_MSG_ASSERTION'
    1214 |         KUNIT_TRUE_MSG_ASSERTION(test,                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1211:9: note: in expansion of macro 'KUNIT_ASSERT_TRUE_MSG'
    1211 |         KUNIT_ASSERT_TRUE_MSG(test, condition, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~
   lib/fortify_kunit.c:688:9: note: in expansion of macro 'KUNIT_ASSERT_TRUE'
     688 |         KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, 1) == pad.buf);
         |         ^~~~~~~~~~~~~~~~~
   lib/fortify_kunit.c:697:33: warning: 'strncat' output may be truncated copying 1 byte from a string of length 31 [-Wstringop-truncation]
     697 |         KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, 1) == pad.buf);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/kunit/test.h:654:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     654 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1214:9: note: in expansion of macro 'KUNIT_TRUE_MSG_ASSERTION'
    1214 |         KUNIT_TRUE_MSG_ASSERTION(test,                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1211:9: note: in expansion of macro 'KUNIT_ASSERT_TRUE_MSG'
    1211 |         KUNIT_ASSERT_TRUE_MSG(test, condition, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~
   lib/fortify_kunit.c:697:9: note: in expansion of macro 'KUNIT_ASSERT_TRUE'
     697 |         KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, 1) == pad.buf);
         |         ^~~~~~~~~~~~~~~~~
   lib/fortify_kunit.c:707:33: warning: 'strncat' output may be truncated copying 2 bytes from a string of length 31 [-Wstringop-truncation]
     707 |         KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, 2) == pad.buf);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/kunit/test.h:654:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     654 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1214:9: note: in expansion of macro 'KUNIT_TRUE_MSG_ASSERTION'
    1214 |         KUNIT_TRUE_MSG_ASSERTION(test,                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1211:9: note: in expansion of macro 'KUNIT_ASSERT_TRUE_MSG'
    1211 |         KUNIT_ASSERT_TRUE_MSG(test, condition, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~
   lib/fortify_kunit.c:707:9: note: in expansion of macro 'KUNIT_ASSERT_TRUE'
     707 |         KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, 2) == pad.buf);
         |         ^~~~~~~~~~~~~~~~~
   lib/fortify_kunit.c:718:33: warning: 'strncat' output may be truncated copying 1 byte from a string of length 31 [-Wstringop-truncation]
     718 |         KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, 1) == pad.buf);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/kunit/test.h:654:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     654 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1214:9: note: in expansion of macro 'KUNIT_TRUE_MSG_ASSERTION'
    1214 |         KUNIT_TRUE_MSG_ASSERTION(test,                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1211:9: note: in expansion of macro 'KUNIT_ASSERT_TRUE_MSG'
    1211 |         KUNIT_ASSERT_TRUE_MSG(test, condition, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~
   lib/fortify_kunit.c:718:9: note: in expansion of macro 'KUNIT_ASSERT_TRUE'
     718 |         KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, 1) == pad.buf);
         |         ^~~~~~~~~~~~~~~~~


vim +/strncat +675 lib/fortify_kunit.c

   655	
   656	static void strncat_test(struct kunit *test)
   657	{
   658		struct fortify_padding pad = { };
   659		char src[sizeof(pad.buf)] = { };
   660		int i, partial;
   661	
   662		/* Fill 31 bytes with valid characters. */
   663		partial = sizeof(src) / 2 - 1;
   664		for (i = 0; i < partial; i++)
   665			src[i] = i + 'A';
   666	
   667		/* Destination is %NUL-filled to start with. */
   668		KUNIT_EXPECT_EQ(test, pad.bytes_before, 0);
   669		KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 1], '\0');
   670		KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 2], '\0');
   671		KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 3], '\0');
   672		KUNIT_EXPECT_EQ(test, pad.bytes_after, 0);
   673	
   674		/* Legitimate strncat() using less than half max size. */
 > 675		KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, partial) == pad.buf);
   676		KUNIT_EXPECT_EQ(test, fortify_read_overflows, 0);
   677		KUNIT_EXPECT_EQ(test, fortify_write_overflows, 0);
   678		/* Legitimate strncat() now 2 bytes shy of end. */
 > 679		KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, partial) == pad.buf);
   680		KUNIT_EXPECT_EQ(test, fortify_read_overflows, 0);
   681		KUNIT_EXPECT_EQ(test, fortify_write_overflows, 0);
   682		/* Last two bytes should be %NUL */
   683		KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 1], '\0');
   684		KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 2], '\0');
   685		KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 3], '\0');
   686	
   687		/* Add one more character to the end. */
 > 688		KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, 1) == pad.buf);
   689		KUNIT_EXPECT_EQ(test, fortify_read_overflows, 0);
   690		KUNIT_EXPECT_EQ(test, fortify_write_overflows, 0);
   691		/* Last byte should be %NUL */
   692		KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 1], '\0');
   693		KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
   694		KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 3], '\0');
   695	
   696		/* And this one char will overflow. */
   697		KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, 1) == pad.buf);
   698		KUNIT_EXPECT_EQ(test, fortify_read_overflows, 0);
   699		KUNIT_EXPECT_EQ(test, fortify_write_overflows, 1);
   700		/* Last byte should be %NUL thanks to FORTIFY. */
   701		KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 1], '\0');
   702		KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
   703		KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 3], '\0');
   704		KUNIT_EXPECT_EQ(test, pad.bytes_after, 0);
   705	
   706		/* And adding two will overflow more. */
   707		KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, 2) == pad.buf);
   708		KUNIT_EXPECT_EQ(test, fortify_read_overflows, 0);
   709		KUNIT_EXPECT_EQ(test, fortify_write_overflows, 2);
   710		/* Last byte should be %NUL thanks to FORTIFY. */
   711		KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 1], '\0');
   712		KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
   713		KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 3], '\0');
   714		KUNIT_EXPECT_EQ(test, pad.bytes_after, 0);
   715	
   716		/* Force an unterminated destination, and overflow. */
   717		pad.buf[sizeof(pad.buf) - 1] = 'A';
   718		KUNIT_ASSERT_TRUE(test, strncat(pad.buf, src, 1) == pad.buf);
   719		/* This will have tripped both strlen() and strcat(). */
   720		KUNIT_EXPECT_EQ(test, fortify_read_overflows, 1);
   721		KUNIT_EXPECT_EQ(test, fortify_write_overflows, 3);
   722		KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 1], '\0');
   723		KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
   724		KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 3], '\0');
   725		/* But we should not go beyond the end. */
   726		KUNIT_EXPECT_EQ(test, pad.bytes_after, 0);
   727	}
   728	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
