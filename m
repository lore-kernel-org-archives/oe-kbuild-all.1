Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2885A14AA6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 18:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692295479; x=1723831479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jdsR7ndyX1pRZkRgie9q54M4BTWBENkj/CFLr00cvzo=;
  b=FE9IDG2gjvduEgqeTLvycXkskmBunZZvCZjSe1CO94RM8TbFz6uBFyRn
   qQSTMZlek6xgrlt1UiEIaGb80D2akHSSrGYCXwDJZS0fEi1nkrYAJ1VD8
   ujdHOirHm+fh8LQoGOqjVH7gxQ6UB+CNbfEaHnyBkrzXOHV3whPdCmeb4
   mW3mk3u8rlQcTQ4m1Yn71WwNc7S0uZK31MMuFWAP4OdA7GN9K94Lsr2PD
   BJRJ0Iwywi+0dPvmipHD2tDYtjU0c8Pmv+YpUiTPeI6pliMv3/cPo6/PV
   LRtujbx/fHtuRHnQJKZwCva4YnmxSyQeC1Fd8jXOJigL/vY15RorP39tN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="403870671"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="403870671"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 11:04:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="769762287"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="769762287"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Aug 2023 11:04:36 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWhMJ-0001N5-2P;
	Thu, 17 Aug 2023 18:04:35 +0000
Date: Fri, 18 Aug 2023 02:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: Rae Moar <rmoar@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Gow <davidgow@google.com>
Subject: [linux-next:master 4031/10848] lib/kunit/attributes.c:41: warning:
 Function parameter or member 'attr_default' not described in 'kunit_attr'
Message-ID: <202308180215.zK3ENXPe-lkp@intel.com>
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
config: m68k-randconfig-r031-20230817 (https://download.01.org/0day-ci/archive/20230818/202308180215.zK3ENXPe-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180215.zK3ENXPe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180215.zK3ENXPe-lkp@intel.com/

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
