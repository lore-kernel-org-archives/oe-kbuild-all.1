Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E69510A1C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1id65Uk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700306616; x=1731842616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CnURLSGEW9prGglwf+8+NMdn/PPFYctcqO4oaEaG1oM=;
  b=L1id65UkOjd9lOccMX+RGOhZnUtnIqGFw3Gy1NhvgQR9inwkeCZbBFGc
   N/AytWeWySY0m4N2hoBDuoJ74A+66/wLLmw6wNaOgWJD1m/t//LI2pfs4
   tiiXgzEcx7L2vGvc+2oHhrjHkogmw8+1TKHiQGZLHspAwH13NI7CPDgpD
   ydl1gEqL3Odtxs6LzMHnvKkO9ihxoeJNt+AkGYYbuQonUj5XqnI+3ZNbj
   m49NO0RiFQehSfQEMCtQl2OgRwfkm71JyAsAw6LUS6cha1t/Mph/T7sRg
   nX7t1Q5SJfjbHSTBzcH6Gb+jj3OVty3raX9vX2/0dZf6UCNX1uNoaNewJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="376468250"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="376468250"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 03:23:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="883388257"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="883388257"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2023 03:23:34 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4JQC-0003ql-0A;
	Sat, 18 Nov 2023 11:23:32 +0000
Date: Sat, 18 Nov 2023 19:23:17 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Gow <davidgow@google.com>
Subject: lib/kunit/string-stream-test.c:73:9: sparse: sparse: incorrect type
 in initializer (different base types)
Message-ID: <202311181918.0mpCu2Xh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   791c8ab095f71327899023223940dd52257a4173
commit: d1a0d699bfc00ae5b5e74bb640d791a93e825b68 kunit: string-stream: Add tests for freeing resource-managed string_stream
date:   9 weeks ago
config: x86_64-randconfig-x001-20230717 (https://download.01.org/0day-ci/archive/20231118/202311181918.0mpCu2Xh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181918.0mpCu2Xh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181918.0mpCu2Xh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/kunit/string-stream-test.c:73:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long left_value @@     got restricted gfp_t const __left @@
   lib/kunit/string-stream-test.c:73:9: sparse:     expected long long left_value
   lib/kunit/string-stream-test.c:73:9: sparse:     got restricted gfp_t const __left
>> lib/kunit/string-stream-test.c:73:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long right_value @@     got restricted gfp_t const __right @@
   lib/kunit/string-stream-test.c:73:9: sparse:     expected long long right_value
   lib/kunit/string-stream-test.c:73:9: sparse:     got restricted gfp_t const __right

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
