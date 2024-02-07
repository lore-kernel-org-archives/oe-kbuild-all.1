Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D93112E47
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Feb 2024 04:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707278437; cv=none; b=TYU8vyOgE1+h4AjphostCuzAeKHzlkB2Z0tLN+waqVvsbuY1kqWo5SfO57SDTCG7+JldNASC4/+UtubUB6RcyM4iOzCQTj2XJQHBC9QEO3zc5gkBrQXhnaf3Yn1b0ggwutOeFDMbc5hYOw/bDmQKAA+ZzIqTuSLMnXDcmPwCE8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707278437; c=relaxed/simple;
	bh=/B8J5fp898qmrUCS/WpWZVyoWeF53/HDPuafBIMVv7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SOeAYNDrI9My40jixbs2329tZgaeEl9Ndj/rWmAkA5hfiIDYx9Om7EE6QhVPtx7gZUPRpsoyLkA8OgmhDElnDuRwUX6+Fh7EkYfGH13O2OtxVF0KJ7J6m7MKN2nrjWeMgvQrMPpQoTlsAHmxbzmP+59njJydTWew+YKallx6+TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCq4etn2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCq4etn2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707278436; x=1738814436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/B8J5fp898qmrUCS/WpWZVyoWeF53/HDPuafBIMVv7I=;
  b=oCq4etn2+lLHFNQ/djlFI7co5YKzXtC0ctYCPaSwQzqWYbEFffMLduai
   4kgNxip4lVkWjnsYfGjlYvb7jOz6igsdacj6NJNPDZjJz8zVzntc01x8L
   l3zYnpq8tVylIk7bLUSb/fBxBO9ob90YvaJQuCT5GdlVXdb6SEn/MRT/a
   0C+iiDPXZIORgSXJmKGN+Kf7H/K8GO4IPoI6/N/03ECIP/nQbXXQMaHd8
   bNyMtNpWBzdkl+PqB3TOZYxiMxVzfnSD8i8SovgKWJrMdU9jgVoxUkHCE
   Id0coB3rU1F8MmXPOJbZLJi6ahocIld4GHxtQNBQsBrbo7bQ3UI9CReQs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1058666"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1058666"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 20:00:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1269156"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Feb 2024 20:00:33 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXZ6t-00026a-0J;
	Wed, 07 Feb 2024 04:00:31 +0000
Date: Wed, 7 Feb 2024 11:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-cleanups 547/548]
 lib/math/mean_and_variance_test.c:33:43: error: field designator 'weight'
 does not refer to any field in type 'struct mean_and_variance_weighted'
Message-ID: <202402071103.5jXo7Iym-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-cleanups
head:   d07e8ccdf01715f8c7fbbdea9d7910d89c6684fb
commit: 9c23552695abf8c3bacbae100e838e70ad8921e1 [547/548] mean_and_variance: put struct mean_and_variance_weighted on a diet
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240207/202402071103.5jXo7Iym-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402071103.5jXo7Iym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402071103.5jXo7Iym-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/math/mean_and_variance_test.c:33:43: error: field designator 'weight' does not refer to any field in type 'struct mean_and_variance_weighted'
      33 |         struct mean_and_variance_weighted s = { .weight = 2 };
         |                                                 ~^~~~~~~~~~
>> lib/math/mean_and_variance_test.c:35:42: error: too few arguments to function call, expected 4, have 2
      35 |         mean_and_variance_weighted_update(&s, 10);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~       ^
   include/linux/mean_and_variance.h:193:6: note: 'mean_and_variance_weighted_update' declared here
     193 | void mean_and_variance_weighted_update(struct mean_and_variance_weighted *s,
         |      ^                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     194 |                 s64 v, bool initted, u8 weight);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:36:61: error: too few arguments to function call, expected 2, have 1
      36 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 10);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   include/kunit/test.h:882:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:887:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
     887 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:726:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     726 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:693:15: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/linux/mean_and_variance.h:196:5: note: 'mean_and_variance_weighted_get_mean' declared here
     196 | s64 mean_and_variance_weighted_get_mean(struct mean_and_variance_weighted s,
         |     ^                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     197 |                 u8 weight);
         |                 ~~~~~~~~~
   lib/math/mean_and_variance_test.c:36:61: error: too few arguments to function call, expected 2, have 1
      36 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 10);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   include/kunit/test.h:882:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:887:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
     887 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:726:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     726 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:693:31: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/linux/mean_and_variance.h:196:5: note: 'mean_and_variance_weighted_get_mean' declared here
     196 | s64 mean_and_variance_weighted_get_mean(struct mean_and_variance_weighted s,
         |     ^                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     197 |                 u8 weight);
         |                 ~~~~~~~~~
   lib/math/mean_and_variance_test.c:37:65: error: too few arguments to function call, expected 2, have 1
      37 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 0);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   include/kunit/test.h:882:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:887:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
     887 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:726:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     726 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:693:15: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/linux/mean_and_variance.h:198:5: note: 'mean_and_variance_weighted_get_variance' declared here
     198 | u64 mean_and_variance_weighted_get_variance(struct mean_and_variance_weighted s,
         |     ^                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     199 |                 u8 weight);
         |                 ~~~~~~~~~
   lib/math/mean_and_variance_test.c:37:65: error: too few arguments to function call, expected 2, have 1
      37 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 0);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   include/kunit/test.h:882:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:887:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
     887 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:726:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     726 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:693:31: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/linux/mean_and_variance.h:198:5: note: 'mean_and_variance_weighted_get_variance' declared here
     198 | u64 mean_and_variance_weighted_get_variance(struct mean_and_variance_weighted s,
         |     ^                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     199 |                 u8 weight);
         |                 ~~~~~~~~~
   lib/math/mean_and_variance_test.c:39:42: error: too few arguments to function call, expected 4, have 2
      39 |         mean_and_variance_weighted_update(&s, 20);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~       ^
   include/linux/mean_and_variance.h:193:6: note: 'mean_and_variance_weighted_update' declared here
     193 | void mean_and_variance_weighted_update(struct mean_and_variance_weighted *s,
         |      ^                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     194 |                 s64 v, bool initted, u8 weight);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:40:61: error: too few arguments to function call, expected 2, have 1
      40 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 12);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   include/kunit/test.h:882:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)


vim +33 lib/math/mean_and_variance_test.c

92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  25  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  26  /*
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  27   * Test values computed using a spreadsheet from the psuedocode at the bottom:
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  28   * https://fanf2.user.srcf.net/hermes/doc/antiforgery/stats.pdf
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  29   */
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  30  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  31  static void mean_and_variance_weighted_test(struct kunit *test)
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  32  {
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06 @33  	struct mean_and_variance_weighted s = { .weight = 2 };
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  34  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06 @35  	mean_and_variance_weighted_update(&s, 10);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  36  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 10);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  37  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 0);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  38  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  39  	mean_and_variance_weighted_update(&s, 20);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  40  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 12);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  41  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 18);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  42  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  43  	mean_and_variance_weighted_update(&s, 30);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  44  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 16);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  45  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 72);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  46  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  47  	s = (struct mean_and_variance_weighted) { .weight = 2 };
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  48  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  49  	mean_and_variance_weighted_update(&s, -10);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  50  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), -10);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  51  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 0);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  52  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  53  	mean_and_variance_weighted_update(&s, -20);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  54  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), -12);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  55  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 18);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  56  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  57  	mean_and_variance_weighted_update(&s, -30);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  58  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), -16);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  59  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 72);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  60  }
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill 2022-08-06  61  

:::::: The code at line 33 was first introduced by commit
:::::: 92095781e0f607e735971c1a6462ca6dad8826d2 bcachefs: Mean and variance

:::::: TO: Daniel Hill <daniel@gluo.nz>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
