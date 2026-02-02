Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15E4330B30
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 22:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770072152; cv=none; b=meQxuEQNeZFAGhfSpyhZPONSUGs6f8tX6+oAS9Gn2ZbBwh/QBx2O14vRcMnuY1f0LW60GjbD6tZZ1ZXxH8NcBl0ql+IaOk21w6lzoDIDAg+CgsIjv/WIhVt0yLTZmTaX9h7l/WWjKrvndWkgGjszqQxna77bsiMiQWnO8E4d5nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770072152; c=relaxed/simple;
	bh=dJqBhnCjv+ARNxGhcymEd/bUx+NAcoEk6SIjpgJXcgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCBR2d1cscv3VRWQl8+y+EgDLm1p3bMSNDxqUKkneWbeWbTtU1g7lvlzTFsvSMlN+wxPKo+njgGeNUd0+hxiFSfhT9dsjpbWipMwL7Bl9nFEnwXOP9i7H0GLoY4DYWEykD/kT/QKTYJMbXRMXF8O4QVOygk7RmOXccYDH7W6WlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjTCYYD7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjTCYYD7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770072150; x=1801608150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dJqBhnCjv+ARNxGhcymEd/bUx+NAcoEk6SIjpgJXcgs=;
  b=QjTCYYD7deT+CqVLqBqCJP8OTkZKW3Yj0lG7y7wlkC+eqylP+E/SBSM8
   hNqkZUej3R+dhYppTrcXdVcnDVcSRyQhYfrOXgqU5HKZq+9PXl+vtypAD
   oU/um7D8RQCp/+RG5gBg2QfGFSNY4TN9Vin/yH0jL2c/vx/S2RNninxBM
   v6W10EYmY3iM6Z08RDSO1FrsVsqN9ShGSfaeqZEV2vJgXtuJYU/Cq6rXV
   eASnFCF+wO86p50guHQi97exUBAzl8qNOamW75RXNKNGvYXxR/BUbhBa0
   bVzPDv97d82ORqx4OUayXsbwyAroSC/gPiJlGAtjYinwMiAAEiz2DchaO
   Q==;
X-CSE-ConnectionGUID: zFc46yuCQIWYEWQZg8+nQw==
X-CSE-MsgGUID: JY1UOLDTQq6y6euoDgp3jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71146539"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="71146539"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 14:42:30 -0800
X-CSE-ConnectionGUID: JhZZAtqiSYqHdWP/GEBTXw==
X-CSE-MsgGUID: fyKoC9HGSS6KG6Ysdwb7mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="214175101"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Feb 2026 14:42:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vn2cj-00000000g1k-2F2s;
	Mon, 02 Feb 2026 22:42:25 +0000
Date: Tue, 3 Feb 2026 06:42:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ryota Sakamoto <sakamo.ryota@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org,
	Ryota Sakamoto <sakamo.ryota@gmail.com>
Subject: Re: [PATCH] lib/tests: add KUnit test for argv_split()
Message-ID: <202602030650.7n64kb2g-lkp@intel.com>
References: <20260203-kunit-argv_split-v1-1-0d3545314a41@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203-kunit-argv_split-v1-1-0d3545314a41@gmail.com>

Hi Ryota,

kernel test robot noticed the following build errors:

[auto build test ERROR on 18f7fcd5e69a04df57b563360b88be72471d6b62]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryota-Sakamoto/lib-tests-add-KUnit-test-for-argv_split/20260203-004209
base:   18f7fcd5e69a04df57b563360b88be72471d6b62
patch link:    https://lore.kernel.org/r/20260203-kunit-argv_split-v1-1-0d3545314a41%40gmail.com
patch subject: [PATCH] lib/tests: add KUnit test for argv_split()
config: sparc-randconfig-001-20260203 (https://download.01.org/0day-ci/archive/20260203/202602030650.7n64kb2g-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602030650.7n64kb2g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602030650.7n64kb2g-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> lib/tests/argv_split_kunit.c:55:3: warning: braces around scalar initializer
      .argv = {},
      ^
   lib/tests/argv_split_kunit.c:55:3: note: (near initialization for 'argv_split_cases[5].argv')
>> lib/tests/argv_split_kunit.c:55:11: error: empty scalar initializer
      .argv = {},
              ^
   lib/tests/argv_split_kunit.c:55:11: note: (near initialization for 'argv_split_cases[5].argv')


vim +55 lib/tests/argv_split_kunit.c

    19	
    20	static struct argv_split_test_case argv_split_cases[] = {
    21		{
    22			.str = "basic words",
    23			.input = "foo bar",
    24			.argc = 2,
    25			.argv = (const char *[]){ "foo", "bar" },
    26		},
    27		{
    28			.str = "single word",
    29			.input = "foobar",
    30			.argc = 1,
    31			.argv = (const char *[]){ "foobar" },
    32		},
    33		{
    34			.str = "leading/trailing whitespace",
    35			.input = "   hello  world ",
    36			.argc = 2,
    37			.argv = (const char *[]){ "hello", "world" },
    38		},
    39		{
    40			.str = "mixing space",
    41			.input = " \t foo \n bar   baz",
    42			.argc = 3,
    43			.argv = (const char *[]){ "foo", "bar", "baz" },
    44		},
    45		{
    46			.str = "quotes are treated as literals",
    47			.input = "ls \"my file/\"",
    48			.argc = 3,
    49			.argv = (const char *[]){ "ls", "\"my", "file/\"" },
    50		},
    51		{
    52			.str = "empty",
    53			.input = "",
    54			.argc = 0,
  > 55			.argv = {},
    56		},
    57	};
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
