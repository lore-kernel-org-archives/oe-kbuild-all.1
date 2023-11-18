Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D94EBF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 00:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ji9+FLFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700268879; x=1731804879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TD9IPSJt+oVbK7xCzpj1GFD8kz0ZDvOJokIsJun7kJQ=;
  b=Ji9+FLFSCCWVhE1DuTLuYDcK8Opk/OM6KHjNdxrMEO9+jaBmQKkF7+rS
   er/PLLBTYiDBkk8oWlCnm/Q98vTpz7iSilD2rvN8RRnSXDNlk8Qx0STDN
   8Z08CVQCjQ17TU4fxG67AK36vhNAp1iSGww5MS7uVJRn61gScdl37MEgE
   qAPJ99UQUuqDKYWoscEIppQbqH7dpW4vCwu/BDBhZKxf1v1nFe1EQbcuj
   ntvjMBqHoG2rCFQA2c6rdTlfNELx3GSwwfb5LGPyk8lE9pBItfnrSl4js
   Y1hZhAcp64zq8/tgwUI1dV0oAG0lJdJqwLi+YZu3JortbSNi86GuPrskr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="390253612"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="390253612"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 16:54:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="889403828"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="889403828"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Nov 2023 16:54:36 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r49bV-0003Mp-2y;
	Sat, 18 Nov 2023 00:54:33 +0000
Date: Sat, 18 Nov 2023 08:52:17 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Gow <davidgow@google.com>
Subject: lib/kunit/string-stream-test.c:73:9: sparse: sparse: incorrect type
 in initializer (different base types)
Message-ID: <202311180846.j5VBD2IH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   12ee72fe01e45a9586b9d130c5501763818c8efc
commit: d1a0d699bfc00ae5b5e74bb640d791a93e825b68 kunit: string-stream: Add tests for freeing resource-managed string_stream
date:   9 weeks ago
config: sparc-randconfig-r021-20230427 (https://download.01.org/0day-ci/archive/20231118/202311180846.j5VBD2IH-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231118/202311180846.j5VBD2IH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180846.j5VBD2IH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/kunit/string-stream-test.c:73:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long left_value @@     got restricted gfp_t const __left @@
   lib/kunit/string-stream-test.c:73:9: sparse:     expected long long left_value
   lib/kunit/string-stream-test.c:73:9: sparse:     got restricted gfp_t const __left
>> lib/kunit/string-stream-test.c:73:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long right_value @@     got restricted gfp_t const __right @@
   lib/kunit/string-stream-test.c:73:9: sparse:     expected long long right_value
   lib/kunit/string-stream-test.c:73:9: sparse:     got restricted gfp_t const __right
   lib/kunit/string-stream-test.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +73 lib/kunit/string-stream-test.c

    61	
    62	/* Unmanaged string_stream object is initialized correctly. */
    63	static void string_stream_unmanaged_init_test(struct kunit *test)
    64	{
    65		struct string_stream *stream;
    66	
    67		stream = alloc_string_stream(GFP_KERNEL);
    68		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, stream);
    69		kunit_add_action(test, cleanup_raw_stream, stream);
    70	
    71		KUNIT_EXPECT_EQ(test, stream->length, 0);
    72		KUNIT_EXPECT_TRUE(test, list_empty(&stream->fragments));
  > 73		KUNIT_EXPECT_EQ(test, stream->gfp, GFP_KERNEL);
    74		KUNIT_EXPECT_FALSE(test, stream->append_newlines);
    75	
    76		KUNIT_EXPECT_TRUE(test, string_stream_is_empty(stream));
    77	}
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
