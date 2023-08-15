Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593911857
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 07:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692083794; x=1723619794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mqpW8dLHNLWmnXIgpv0wcWy9H6kceWlZT7a9uKG7nyY=;
  b=MYIdwYPVuNSJFNW6Th9GjTfBg9S1wPfBl7RidlPkmvf8IZDrREcYOt9P
   EhtqO0qZdXXkP7obSQcGiFU07s0L3uvFVl2YC2Pzf4hKGkREuUw2M53eR
   Zh2DG2ziknva6Dq2Q+vwAd2coA6lDWLtyU3MUHUVll9Jzuc3ajtE2tgAc
   e/btmwwkguH3tzMVWFQM7nGchTRlAaxCJXNc8md7JbLvWwwpBOvVBdocv
   7kleh3oFqoXW0SvbJVyvmehLpuD+4HvYmXKkoPNWAaiBjwk06klm4ga05
   VYHQnWpgIR+RryM31fcASw7s8a3Zg+nfC6/jbj2J5O9JbDOqbNqJ7TIFg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="369692382"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="369692382"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 00:16:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="733750361"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="733750361"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Aug 2023 00:16:30 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVoI1-0000l1-1L;
	Tue, 15 Aug 2023 07:16:29 +0000
Date: Tue, 15 Aug 2023 15:16:13 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
	brendan.higgins@linux.dev, davidgow@google.com, rmoar@google.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v4 01/10] kunit: string-stream: Improve testing of
 string_stream
Message-ID: <202308151555.o0Ok5tyv-lkp@intel.com>
References: <20230814132309.32641-2-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814132309.32641-2-rf@opensource.cirrus.com>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/kunit]
[also build test WARNING on shuah-kselftest/kunit-fixes linus/master v6.5-rc6 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Fitzgerald/kunit-string-stream-Improve-testing-of-string_stream/20230814-212947
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git kunit
patch link:    https://lore.kernel.org/r/20230814132309.32641-2-rf%40opensource.cirrus.com
patch subject: [PATCH v4 01/10] kunit: string-stream: Improve testing of string_stream
config: arc-randconfig-r073-20230815 (https://download.01.org/0day-ci/archive/20230815/202308151555.o0Ok5tyv-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151555.o0Ok5tyv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308151555.o0Ok5tyv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/kunit/string-stream-test.c:25:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long left_value @@     got restricted gfp_t const __left @@
   lib/kunit/string-stream-test.c:25:9: sparse:     expected long long left_value
   lib/kunit/string-stream-test.c:25:9: sparse:     got restricted gfp_t const __left
>> lib/kunit/string-stream-test.c:25:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long right_value @@     got restricted gfp_t const __right @@
   lib/kunit/string-stream-test.c:25:9: sparse:     expected long long right_value
   lib/kunit/string-stream-test.c:25:9: sparse:     got restricted gfp_t const __right

vim +25 lib/kunit/string-stream-test.c

    13	
    14	/* string_stream object is initialized correctly. */
    15	static void string_stream_init_test(struct kunit *test)
    16	{
    17		struct string_stream *stream;
    18	
    19		stream = alloc_string_stream(test, GFP_KERNEL);
    20		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, stream);
    21	
    22		KUNIT_EXPECT_EQ(test, stream->length, 0);
    23		KUNIT_EXPECT_TRUE(test, list_empty(&stream->fragments));
    24		KUNIT_EXPECT_PTR_EQ(test, stream->test, test);
  > 25		KUNIT_EXPECT_EQ(test, stream->gfp, GFP_KERNEL);
    26	
    27		KUNIT_EXPECT_TRUE(test, string_stream_is_empty(stream));
    28	}
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
