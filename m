Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA85A20EB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 06:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736748129; cv=none; b=EuSpyLxF2jMIFhiZ2YopuexCLPoqwhNpKW+FivM91TpD2NP/1OQtMLWhr5XBEQ9UJmE4KV6OcdzAKmboG/E+skdB1f4T3TkyLc1av84CmVZesqoNIKBSPUfVoRTVm4y4qNMmDAs6lrLT3WfkKHT1WdH/P7flYyicD7agJ05F35s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736748129; c=relaxed/simple;
	bh=LPlWoC4SHAij4B14wNTcqFpr8Z5h7V9e5qEcAQWBhLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAPI7i/pL0WJwSlMfgy1zEPpRUjF+Xl5OUfXhpntLx2R/kF87B2RSrzZd137Q9lYnXEx+VKtWLP6Gyg0hiLX0YMNdbwOwoYaglGTmlkZ7rW6uFFEmQJmb4W0DcLSGNWK8MPyksqYVVV8bEv6QPgiKufYBWcxuaQvLXK313FfYMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbSaFHMW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbSaFHMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736748128; x=1768284128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LPlWoC4SHAij4B14wNTcqFpr8Z5h7V9e5qEcAQWBhLA=;
  b=fbSaFHMWfAXGm3ddCJp8MCwQxff+/GfIJFi97XnD//DvOPqP64GE+hez
   ec8VyqM5WZ5IfazO7EkRY0CEPIIfpEBKwOWLs1VeZfL0hyRdoQsbIqUvf
   L7nMH9xAT1kOPxDsAxqxcKzk1eLljNFiLpXWRMys4F4ASzNGyY0CAyKe8
   XV8fyZZ0RBEM0zS7qc70KPH/kmIayiAAvVUCj5F54z0E+t+1oSM6r+xcK
   8wEZaav7YpS4bN/vx7QCaE2fiJ1CBZrkozF69eLbBrb0k93sdlUVlqcpQ
   +AsSXIia8dii8JM5XwXBXgiFcql2kSIZEM9s15c8MQy7mWPQbe4uEDffF
   A==;
X-CSE-ConnectionGUID: RFN74xrdTt+tanykTlg9IQ==
X-CSE-MsgGUID: DRX7J98eTsGEUi4FIfBlMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="37101658"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37101658"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 22:02:08 -0800
X-CSE-ConnectionGUID: 9qD3v3SZRaCBrJ/AeHwHdA==
X-CSE-MsgGUID: RvokNhjjRe6hv3Eph9uVcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="104179212"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jan 2025 22:02:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXDWV-000Mn5-0s;
	Mon, 13 Jan 2025 06:02:03 +0000
Date: Mon, 13 Jan 2025 14:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: John Sperbeck <jsperbeck@google.com>,
	Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, John Sperbeck <jsperbeck@google.com>,
	Kees Cook <kees@kernel.org>, Wen Yang <wen.yang@linux.dev>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2] sysctl: expose sysctl_check_table for unit testing
 and use it
Message-ID: <202501131354.JbiHtAEH-lkp@intel.com>
References: <20250112215013.2386009-1-jsperbeck@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112215013.2386009-1-jsperbeck@google.com>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/kspp]
[also build test ERROR on linus/master v6.13-rc7 next-20250110]
[cannot apply to kees/for-next/pstore sysctl/sysctl-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Sperbeck/sysctl-expose-sysctl_check_table-for-unit-testing-and-use-it/20250113-055310
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
patch link:    https://lore.kernel.org/r/20250112215013.2386009-1-jsperbeck%40google.com
patch subject: [PATCH v2] sysctl: expose sysctl_check_table for unit testing and use it
config: csky-randconfig-002-20250113 (https://download.01.org/0day-ci/archive/20250113/202501131354.JbiHtAEH-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501131354.JbiHtAEH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501131354.JbiHtAEH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sysctl-test.c:6:
   kernel/sysctl-test.c: In function 'sysctl_test_register_sysctl_sz_invalid_extra_value':
>> kernel/sysctl-test.c:414:25: error: implicit declaration of function 'sysctl_check_table_test_helper' [-Wimplicit-function-declaration]
     414 |                         sysctl_check_table_test_helper("foo", table_foo));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:774:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     774 |         const typeof(right) __right = (right);                                 \
         |                      ^~~~~
   include/kunit/test.h:969:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     969 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:966:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     966 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sysctl-test.c:413:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     413 |         KUNIT_EXPECT_EQ(test, -EINVAL,
         |         ^~~~~~~~~~~~~~~


vim +/sysctl_check_table_test_helper +414 kernel/sysctl-test.c

   369	
   370	/*
   371	 * Test that registering an invalid extra value is not allowed.
   372	 */
   373	static void sysctl_test_register_sysctl_sz_invalid_extra_value(
   374			struct kunit *test)
   375	{
   376		unsigned char data = 0;
   377		struct ctl_table table_foo[] = {
   378			{
   379				.procname	= "foo",
   380				.data		= &data,
   381				.maxlen		= sizeof(u8),
   382				.mode		= 0644,
   383				.proc_handler	= proc_dou8vec_minmax,
   384				.extra1		= SYSCTL_FOUR,
   385				.extra2		= SYSCTL_ONE_THOUSAND,
   386			},
   387		};
   388	
   389		struct ctl_table table_bar[] = {
   390			{
   391				.procname	= "bar",
   392				.data		= &data,
   393				.maxlen		= sizeof(u8),
   394				.mode		= 0644,
   395				.proc_handler	= proc_dou8vec_minmax,
   396				.extra1		= SYSCTL_NEG_ONE,
   397				.extra2		= SYSCTL_ONE_HUNDRED,
   398			},
   399		};
   400	
   401		struct ctl_table table_qux[] = {
   402			{
   403				.procname	= "qux",
   404				.data		= &data,
   405				.maxlen		= sizeof(u8),
   406				.mode		= 0644,
   407				.proc_handler	= proc_dou8vec_minmax,
   408				.extra1		= SYSCTL_ZERO,
   409				.extra2		= SYSCTL_TWO_HUNDRED,
   410			},
   411		};
   412	
   413		KUNIT_EXPECT_EQ(test, -EINVAL,
 > 414				sysctl_check_table_test_helper("foo", table_foo));
   415		KUNIT_EXPECT_EQ(test, -EINVAL,
   416				sysctl_check_table_test_helper("foo", table_bar));
   417		KUNIT_EXPECT_EQ(test, 0,
   418				sysctl_check_table_test_helper("foo", table_qux));
   419	}
   420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
