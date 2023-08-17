Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8461E168C0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 17:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692294878; x=1723830878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VAo/Rc2pZ1FseR2QBvHnL0lZnR++4qdmHUhlHXag5TA=;
  b=ilmbUxBhhQdBOu7BJW8Kh+tcmwoLcdMZTOVi86EBuwfr8A4/BP609JRv
   kIBQQxH1qkwNcJV9XNNNRJ84vJ73Jjc65zXqSRtYvco+DIwJRfCxIjgPX
   wcc+7kJh7OUZO3c28noy7Q72FBut9OgdLD8WaHb2sCip+zmuTJsOjrilx
   RklgMtDtX7aufDEhWPfC0mM3OHwqCWKTgYaENAYpq5ZEZNqeU6qtCjm8F
   xjsDrzkk+HOMfqj/7sT6B3Vb7E/tWWrNSVUEHWGDJmfxhuJn2B2ZF06hW
   /pX7tEqkid/WyXLfog69AnZLvFNJ5rvAUiL6SxmKAaf7tVjVAqcaPdck9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="439267139"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="439267139"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 10:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="800143079"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="800143079"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2023 10:54:36 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWhCd-0001Mf-1q;
	Thu, 17 Aug 2023 17:54:35 +0000
Date: Fri, 18 Aug 2023 01:53:44 +0800
From: kernel test robot <lkp@intel.com>
To: Rae Moar <rmoar@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Gow <davidgow@google.com>
Subject: [linux-next:master 4031/10848] lib/kunit/attributes.c:41: warning:
 Function parameter or member 'attr_default' not described in 'kunit_attr'
Message-ID: <202308180127.VD7YRPGa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47762f08697484cf0c2f2904b8c52375ed26c8cb
commit: 39e92cb1e4a1f6a12097ea2aa9e9ca6f2d2f8a83 [4031/10848] kunit: Add test attributes API structure
config: microblaze-randconfig-r032-20230817 (https://download.01.org/0day-ci/archive/20230818/202308180127.VD7YRPGa-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180127.VD7YRPGa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180127.VD7YRPGa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/kunit/attributes.c:41: warning: Function parameter or member 'attr_default' not described in 'kunit_attr'
>> lib/kunit/attributes.c:41: warning: Function parameter or member 'print' not described in 'kunit_attr'


vim +41 lib/kunit/attributes.c

    22	
    23	/**
    24	 * struct kunit_attr - represents a test attribute and holds flexible
    25	 * helper functions to interact with attribute.
    26	 *
    27	 * @name: name of test attribute, eg. speed
    28	 * @get_attr: function to return attribute value given a test
    29	 * @to_string: function to return string representation of given
    30	 * attribute value
    31	 * @filter: function to indicate whether a given attribute value passes a
    32	 * filter
    33	 */
    34	struct kunit_attr {
    35		const char *name;
    36		void *(*get_attr)(void *test_or_suite, bool is_test);
    37		const char *(*to_string)(void *attr, bool *to_free);
    38		int (*filter)(void *attr, const char *input, int *err);
    39		void *attr_default;
    40		enum print_ops print;
  > 41	};
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
