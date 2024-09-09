Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F0D22095
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725890905; cv=none; b=E/1WGTaaNnL1VQGYpzH+n/6WFoo3J1CvI149fX1t+QAQALehF5owuarkRSF1mbik1RuDjNliuEU45FH9gBb09NCd8yZa8oiF4iryhbjs0bfEMohMOpu8Kq20MdwKnXBbexTVrt/h4hqcxBZV7pfj4bkU5jbYFze9QJzL5gLou98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725890905; c=relaxed/simple;
	bh=2TXZWG2CQQI9Qz5HQqrKZyYJW52v9Q+0avvADBq7a4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K3s2SH4oR5cc+Q9L9XR/3P2AGf+IarxW0bo/A08DwH/FYLf1b5fxFSrWTr+WGp6xFJgHa+35bOzPCAQU9KFtH3QsF0+UyI/duWWvFgUPq4+YFZCUbtZY26VyIc1kHU/O8uWFdEjATEfgu1gJsci5h9lfaf3tjVfKUa9d6j73l/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhyQFaUc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhyQFaUc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725890903; x=1757426903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2TXZWG2CQQI9Qz5HQqrKZyYJW52v9Q+0avvADBq7a4E=;
  b=RhyQFaUcJKQUjmIPym33PZnYpxXqImJFTuvw6b8jpArlvrCIh+Q9CyfN
   zXPSLxR8HfOlEyQyAycRcofVocNb0ShBo++xMvrUebiafCC2qMaHF0rRY
   1+FVJWJFF8pmS5WfTBSqufkOI5n9b0Ow0KmZUp0PNRjxij6hZoqCHg29/
   ORhk4EcNsRFupAwP/Ih9E+nrXO6RYaoJl0UALrbo2GhOXzCXgkOvnGuur
   JtOfCOVIJrqzn3kuPNdGLD8f4Gm4fD4Z22+aGFnorxAcuz73Zky0J4CdM
   0aVVzqLc7cL3F/fQW9E1YduA0TmO0I4Q6/rAZtnq5BkuYQQVDzJ+lS8c8
   w==;
X-CSE-ConnectionGUID: 21KKSTryRduy1jWh05JyMQ==
X-CSE-MsgGUID: wBKLrrFEQGaI1EZPWTuZ6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="50000783"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="50000783"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 07:08:22 -0700
X-CSE-ConnectionGUID: SbuX2q17Q2ala9Bq5tL2eQ==
X-CSE-MsgGUID: 8HxLgDwjSjm6Ghfm91+xig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="67208393"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Sep 2024 07:08:21 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snf3y-000EnC-2B;
	Mon, 09 Sep 2024 14:08:18 +0000
Date: Mon, 9 Sep 2024 22:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 238/258]
 lib/test_bits.c:45:16: warning: unused variable 'w'
Message-ID: <202409092257.2idoiFQv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: bae0847211275fbc52b8f635c24105975cedd042 [238/258] fix W=12 build errors, rest of kernel
config: parisc-randconfig-r072-20240909 (https://download.01.org/0day-ci/archive/20240909/202409092257.2idoiFQv-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409092257.2idoiFQv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409092257.2idoiFQv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/test_bits.c: In function 'genmask_input_check_test':
>> lib/test_bits.c:45:16: warning: unused variable 'w' [-Wunused-variable]
      45 |         int z, w;
         |                ^
>> lib/test_bits.c:45:13: warning: unused variable 'z' [-Wunused-variable]
      45 |         int z, w;
         |             ^
>> lib/test_bits.c:44:25: warning: unused variable 'y' [-Wunused-variable]
      44 |         unsigned int x, y;
         |                         ^
>> lib/test_bits.c:44:22: warning: unused variable 'x' [-Wunused-variable]
      44 |         unsigned int x, y;
         |                      ^


vim +/w +45 lib/test_bits.c

6d511020e13d5d Rikard Falkeborn 2020-08-11  41  
6d511020e13d5d Rikard Falkeborn 2020-08-11  42  static void genmask_input_check_test(struct kunit *test)
6d511020e13d5d Rikard Falkeborn 2020-08-11  43  {
6d511020e13d5d Rikard Falkeborn 2020-08-11 @44  	unsigned int x, y;
6d511020e13d5d Rikard Falkeborn 2020-08-11 @45  	int z, w;
6d511020e13d5d Rikard Falkeborn 2020-08-11  46  
6d511020e13d5d Rikard Falkeborn 2020-08-11  47  	/* Unknown input */
6d511020e13d5d Rikard Falkeborn 2020-08-11  48  	KUNIT_EXPECT_EQ(test, 0, GENMASK_INPUT_CHECK(x, 0));
6d511020e13d5d Rikard Falkeborn 2020-08-11  49  	KUNIT_EXPECT_EQ(test, 0, GENMASK_INPUT_CHECK(0, x));
6d511020e13d5d Rikard Falkeborn 2020-08-11  50  	KUNIT_EXPECT_EQ(test, 0, GENMASK_INPUT_CHECK(x, y));
6d511020e13d5d Rikard Falkeborn 2020-08-11  51  
6d511020e13d5d Rikard Falkeborn 2020-08-11  52  	KUNIT_EXPECT_EQ(test, 0, GENMASK_INPUT_CHECK(z, 0));
6d511020e13d5d Rikard Falkeborn 2020-08-11  53  	KUNIT_EXPECT_EQ(test, 0, GENMASK_INPUT_CHECK(0, z));
6d511020e13d5d Rikard Falkeborn 2020-08-11  54  	KUNIT_EXPECT_EQ(test, 0, GENMASK_INPUT_CHECK(z, w));
6d511020e13d5d Rikard Falkeborn 2020-08-11  55  
6d511020e13d5d Rikard Falkeborn 2020-08-11  56  	/* Valid input */
6d511020e13d5d Rikard Falkeborn 2020-08-11  57  	KUNIT_EXPECT_EQ(test, 0, GENMASK_INPUT_CHECK(1, 1));
6d511020e13d5d Rikard Falkeborn 2020-08-11  58  	KUNIT_EXPECT_EQ(test, 0, GENMASK_INPUT_CHECK(39, 21));
6d511020e13d5d Rikard Falkeborn 2020-08-11  59  }
6d511020e13d5d Rikard Falkeborn 2020-08-11  60  

:::::: The code at line 45 was first introduced by commit
:::::: 6d511020e13d5d6f5f0af853e32ddef75c693ccc lib/test_bits.c: add tests of GENMASK

:::::: TO: Rikard Falkeborn <rikard.falkeborn@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
