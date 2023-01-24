Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6025D10FC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674557092; x=1706093092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=siuIgv34vh4LdHQCnOOEukc1+6Z0xUsOP8D+aHrmq6U=;
  b=EPGFjA41pssFj525qMsFBSwk7qMeJtxkIeVoFEk51ywZnhxNv1tKp5fs
   7xCdehJuLTkAwury5LqsBTZVLbcLDB/ow0MI1IJGEqFpZKUeAQzzc2W95
   4ZAh9SLve4pRAUCwgR5/Koc9JB3iyXt0138Snt2e6DApgfxL9paoT1hkt
   5DvRrYlvWggI7ppOc2qjhHprvs4Mz/1LaZ/rYve/L54s4uWgEnX82FzI6
   +zBKwjZsDLgBjZFEl1X766DqVfhGAOJgYv8aeppDn+m1dPYPKnyr6XtNm
   usMB2JHI0KfYwj+g7/Y+fAdaoME7UrWpYYo3+Jd74wJSXZw6JPiTjaxnf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="323961521"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="323961521"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:44:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="694291559"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="694291559"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Jan 2023 02:44:50 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKGnJ-0006LS-2V;
	Tue, 24 Jan 2023 10:44:49 +0000
Date: Tue, 24 Jan 2023 18:43:57 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2] kunit: Add "hooks" to call into KUnit when it's
 built as a module
Message-ID: <202301241805.ieXjH3yy-lkp@intel.com>
References: <20230124080350.2275652-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124080350.2275652-1-davidgow@google.com>

Hi David,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on kees/for-next/pstore]
[also build test WARNING on kees/for-next/kspp linus/master v6.2-rc5]
[cannot apply to next-20230124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Gow/kunit-Add-hooks-to-call-into-KUnit-when-it-s-built-as-a-module/20230124-160516
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/pstore
patch link:    https://lore.kernel.org/r/20230124080350.2275652-1-davidgow%40google.com
patch subject: [RFC PATCH v2] kunit: Add "hooks" to call into KUnit when it's built as a module
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230124/202301241805.ieXjH3yy-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e72363e2b7988bc87fbe76b2083a2736640d2df9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Gow/kunit-Add-hooks-to-call-into-KUnit-when-it-s-built-as-a-module/20230124-160516
        git checkout e72363e2b7988bc87fbe76b2083a2736640d2df9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash lib/kunit/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/kunit/test.c:26:6: warning: no previous prototype for '__kunit_fail_current_test_impl' [-Wmissing-prototypes]
      26 | void __kunit_fail_current_test_impl(const char *file, int line, const char *fmt, ...)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/test.c: In function '__kunit_fail_current_test_impl':
   lib/kunit/test.c:39:9: warning: function '__kunit_fail_current_test_impl' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      39 |         len = vsnprintf(NULL, 0, fmt, args) + 1;
         |         ^~~
   lib/kunit/test.c:47:9: warning: function '__kunit_fail_current_test_impl' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      47 |         vsnprintf(buffer, len, fmt, args);
         |         ^~~~~~~~~


vim +/__kunit_fail_current_test_impl +26 lib/kunit/test.c

    22	
    23	/*
    24	 * Fail the current test and print an error message to the log.
    25	 */
  > 26	void __kunit_fail_current_test_impl(const char *file, int line, const char *fmt, ...)
    27	{
    28		va_list args;
    29		int len;
    30		char *buffer;
    31	
    32		if (!current->kunit_test)
    33			return;
    34	
    35		kunit_set_failure(current->kunit_test);
    36	
    37		/* kunit_err() only accepts literals, so evaluate the args first. */
    38		va_start(args, fmt);
    39		len = vsnprintf(NULL, 0, fmt, args) + 1;
    40		va_end(args);
    41	
    42		buffer = kunit_kmalloc(current->kunit_test, len, GFP_KERNEL);
    43		if (!buffer)
    44			return;
    45	
    46		va_start(args, fmt);
    47		vsnprintf(buffer, len, fmt, args);
    48		va_end(args);
    49	
    50		kunit_err(current->kunit_test, "%s:%d: %s", file, line, buffer);
    51		kunit_kfree(current->kunit_test, buffer);
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
