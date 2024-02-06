Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505E012880E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707214864; cv=none; b=MPgfNhuGG0K8MIryket/SeFsbW6J/1dkCJKKkCQbhHTjWD5HsltRPseBT4Fq6NUC7K8cV9wZPuSxO2bxvdwQDwLx69CMepTrk37/3zlY3R5nTJfEylKaFQYHfW5uqrSjKxNF2SGFy0IELC5D9mjTefY22qRFep8mIdoX9fKtKWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707214864; c=relaxed/simple;
	bh=f5pRmcMSEECH39A+t02tTu0ewn5BNu04vJttG/VC5bw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V8MMICrmDINdmpGFvc5vSSosM5+W3bIOBbz8PnHtskWDX58uJsIn5cx1jcwEExZ70kz7vselHkmXZEugpRKUYB0JBlAj4OHy8IdzgSZVW8kr+BbjGktcke03TyAZzMZpbBc9BcHRfptKZSII5kkXcovWGaeXrg0eOAh4T7hkK8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hi5oZwN/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hi5oZwN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707214861; x=1738750861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f5pRmcMSEECH39A+t02tTu0ewn5BNu04vJttG/VC5bw=;
  b=hi5oZwN/6H0ugbk3bdxc7PAJjY4CGhJUK1FWvbsaGvRSqjftQkbVvEfj
   Qs63M/JsajrVbEAOAHYIS1bFefwsqCoiTTbnQMJaw80RLvNrvMQHAost0
   0oCtLQi378JxMpxlgWy4zQh6irC1ptooF85NyS/kO7MFRS6ABETFGXrzs
   5XRWYy8uAvUuzg9NbDwQhCPlLz2u9mywh1cQHvJMuxcJ8lAY8cYOqvsj4
   ZuqFEIxFxOb7parHJJmmyoDpppN/FXIYytCquAeomubd5s6s2BuBHWb4z
   WOxP6LJSn4U3f12EyQC0G5cAvCwzBFz9Hs6Z49X4YVTENe57x+mn+02aA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11452133"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="11452133"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 02:21:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="909586396"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="909586396"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2024 02:20:59 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXIZU-0001GU-0Q;
	Tue, 06 Feb 2024 10:20:56 +0000
Date: Tue, 6 Feb 2024 18:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-cleanups 547/548]
 lib/math/mean_and_variance_test.c:33:50: error: 'struct
 mean_and_variance_weighted' has no member named 'weight'
Message-ID: <202402061856.trcn9rAS-lkp@intel.com>
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
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20240206/202402061856.trcn9rAS-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402061856.trcn9rAS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402061856.trcn9rAS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/math/mean_and_variance_test.c: In function 'mean_and_variance_weighted_test':
>> lib/math/mean_and_variance_test.c:33:50: error: 'struct mean_and_variance_weighted' has no member named 'weight'
      33 |         struct mean_and_variance_weighted s = { .weight = 2 };
         |                                                  ^~~~~~
>> lib/math/mean_and_variance_test.c:35:9: error: too few arguments to function 'mean_and_variance_weighted_update'
      35 |         mean_and_variance_weighted_update(&s, 10);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/math/mean_and_variance_test.c:3:
   include/linux/mean_and_variance.h:193:6: note: declared here
     193 | void mean_and_variance_weighted_update(struct mean_and_variance_weighted *s,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/math/mean_and_variance_test.c:2:
>> lib/math/mean_and_variance_test.c:36:31: error: too few arguments to function 'mean_and_variance_weighted_get_mean'
      36 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 10);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:36:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      36 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 10);
         |         ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:196:5: note: declared here
     196 | s64 mean_and_variance_weighted_get_mean(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/math/mean_and_variance_test.c:36:31: error: too few arguments to function 'mean_and_variance_weighted_get_mean'
      36 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 10);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:36:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      36 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 10);
         |         ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:196:5: note: declared here
     196 | s64 mean_and_variance_weighted_get_mean(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/math/mean_and_variance_test.c:37:31: error: too few arguments to function 'mean_and_variance_weighted_get_variance'
      37 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 0);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:37:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      37 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 0);
         |         ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:198:5: note: declared here
     198 | u64 mean_and_variance_weighted_get_variance(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/math/mean_and_variance_test.c:37:31: error: too few arguments to function 'mean_and_variance_weighted_get_variance'
      37 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 0);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:37:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      37 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 0);
         |         ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:198:5: note: declared here
     198 | u64 mean_and_variance_weighted_get_variance(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:39:9: error: too few arguments to function 'mean_and_variance_weighted_update'
      39 |         mean_and_variance_weighted_update(&s, 20);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:193:6: note: declared here
     193 | void mean_and_variance_weighted_update(struct mean_and_variance_weighted *s,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:40:31: error: too few arguments to function 'mean_and_variance_weighted_get_mean'
      40 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 12);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:40:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      40 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 12);
         |         ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:196:5: note: declared here
     196 | s64 mean_and_variance_weighted_get_mean(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:40:31: error: too few arguments to function 'mean_and_variance_weighted_get_mean'
      40 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 12);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:40:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      40 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 12);
         |         ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:196:5: note: declared here
     196 | s64 mean_and_variance_weighted_get_mean(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:41:31: error: too few arguments to function 'mean_and_variance_weighted_get_variance'
      41 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 18);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:41:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      41 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 18);
         |         ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:198:5: note: declared here
     198 | u64 mean_and_variance_weighted_get_variance(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:41:31: error: too few arguments to function 'mean_and_variance_weighted_get_variance'
      41 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 18);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:41:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      41 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 18);
         |         ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:198:5: note: declared here
     198 | u64 mean_and_variance_weighted_get_variance(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:43:9: error: too few arguments to function 'mean_and_variance_weighted_update'
      43 |         mean_and_variance_weighted_update(&s, 30);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:193:6: note: declared here
     193 | void mean_and_variance_weighted_update(struct mean_and_variance_weighted *s,
--
   lib/math/mean_and_variance_test.c:78:31: error: too few arguments to function 'mean_and_variance_weighted_get_mean'
      78 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), -11);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:78:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      78 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), -11);
         |         ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:196:5: note: declared here
     196 | s64 mean_and_variance_weighted_get_mean(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:79:31: error: too few arguments to function 'mean_and_variance_weighted_get_variance'
      79 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 107);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:79:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      79 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 107);
         |         ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:198:5: note: declared here
     198 | u64 mean_and_variance_weighted_get_variance(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:79:31: error: too few arguments to function 'mean_and_variance_weighted_get_variance'
      79 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 107);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:79:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      79 |         KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 107);
         |         ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:198:5: note: declared here
     198 | u64 mean_and_variance_weighted_get_variance(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c: In function 'do_mean_and_variance_test':
   lib/math/mean_and_variance_test.c:94:51: error: 'struct mean_and_variance_weighted' has no member named 'weight'
      94 |         struct mean_and_variance_weighted vw = { .weight = weight };
         |                                                   ^~~~~~
   lib/math/mean_and_variance_test.c:98:17: error: too few arguments to function 'mean_and_variance_weighted_update'
      98 |                 mean_and_variance_weighted_update(&vw, initial_value);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:193:6: note: declared here
     193 | void mean_and_variance_weighted_update(struct mean_and_variance_weighted *s,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:102:39: error: too few arguments to function 'mean_and_variance_weighted_get_mean'
     102 |                 KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(vw),  initial_value);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:102:17: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     102 |                 KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(vw),  initial_value);
         |                 ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:196:5: note: declared here
     196 | s64 mean_and_variance_weighted_get_mean(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:102:39: error: too few arguments to function 'mean_and_variance_weighted_get_mean'
     102 |                 KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(vw),  initial_value);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:102:17: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     102 |                 KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(vw),  initial_value);
         |                 ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:196:5: note: declared here
     196 | s64 mean_and_variance_weighted_get_mean(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/math/mean_and_variance_test.c:103:39: error: too few arguments to function 'mean_and_variance_weighted_get_stddev'
     103 |                 KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_stddev(vw),0);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:103:17: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     103 |                 KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_stddev(vw),0);
         |                 ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:200:5: note: declared here
     200 | u32 mean_and_variance_weighted_get_stddev(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/math/mean_and_variance_test.c:103:39: error: too few arguments to function 'mean_and_variance_weighted_get_stddev'
     103 |                 KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_stddev(vw),0);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:103:17: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     103 |                 KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_stddev(vw),0);
         |                 ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:200:5: note: declared here
     200 | u32 mean_and_variance_weighted_get_stddev(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:108:17: error: too few arguments to function 'mean_and_variance_weighted_update'
     108 |                 mean_and_variance_weighted_update(&vw, data[i]);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:193:6: note: declared here
     193 | void mean_and_variance_weighted_update(struct mean_and_variance_weighted *s,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:112:39: error: too few arguments to function 'mean_and_variance_weighted_get_mean'
     112 |                 KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(vw),  weighted_mean[i]);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:112:17: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     112 |                 KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(vw),  weighted_mean[i]);
         |                 ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:196:5: note: declared here
     196 | s64 mean_and_variance_weighted_get_mean(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:112:39: error: too few arguments to function 'mean_and_variance_weighted_get_mean'
     112 |                 KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(vw),  weighted_mean[i]);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:112:17: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     112 |                 KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(vw),  weighted_mean[i]);
         |                 ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:196:5: note: declared here
     196 | s64 mean_and_variance_weighted_get_mean(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:113:39: error: too few arguments to function 'mean_and_variance_weighted_get_stddev'
     113 |                 KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_stddev(vw),weighted_stddev[i]);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:113:17: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     113 |                 KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_stddev(vw),weighted_stddev[i]);
         |                 ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:200:5: note: declared here
     200 | u32 mean_and_variance_weighted_get_stddev(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:113:39: error: too few arguments to function 'mean_and_variance_weighted_get_stddev'
     113 |                 KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_stddev(vw),weighted_stddev[i]);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:693:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     693 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     885 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:882:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     882 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   lib/math/mean_and_variance_test.c:113:17: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     113 |                 KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_stddev(vw),weighted_stddev[i]);
         |                 ^~~~~~~~~~~~~~~
   include/linux/mean_and_variance.h:200:5: note: declared here
     200 | u32 mean_and_variance_weighted_get_stddev(struct mean_and_variance_weighted s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
..


vim +33 lib/math/mean_and_variance_test.c

92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   25  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   26  /*
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   27   * Test values computed using a spreadsheet from the psuedocode at the bottom:
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   28   * https://fanf2.user.srcf.net/hermes/doc/antiforgery/stats.pdf
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   29   */
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   30  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   31  static void mean_and_variance_weighted_test(struct kunit *test)
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   32  {
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06  @33  	struct mean_and_variance_weighted s = { .weight = 2 };
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   34  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06  @35  	mean_and_variance_weighted_update(&s, 10);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06  @36  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 10);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06  @37  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 0);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   38  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   39  	mean_and_variance_weighted_update(&s, 20);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   40  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 12);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   41  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 18);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   42  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   43  	mean_and_variance_weighted_update(&s, 30);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   44  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 16);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   45  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 72);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   46  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   47  	s = (struct mean_and_variance_weighted) { .weight = 2 };
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   48  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   49  	mean_and_variance_weighted_update(&s, -10);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   50  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), -10);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   51  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 0);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   52  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   53  	mean_and_variance_weighted_update(&s, -20);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   54  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), -12);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   55  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 18);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   56  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   57  	mean_and_variance_weighted_update(&s, -30);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   58  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), -16);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   59  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 72);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   60  }
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   61  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   62  static void mean_and_variance_weighted_advanced_test(struct kunit *test)
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   63  {
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   64  	struct mean_and_variance_weighted s = { .weight = 8 };
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   65  	s64 i;
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   66  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   67  	for (i = 10; i <= 100; i += 10)
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   68  		mean_and_variance_weighted_update(&s, i);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   69  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   70  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), 11);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   71  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 107);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   72  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   73  	s = (struct mean_and_variance_weighted) { .weight = 8 };
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   74  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   75  	for (i = -10; i >= -100; i -= 10)
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   76  		mean_and_variance_weighted_update(&s, i);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   77  
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   78  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(s), -11);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   79  	KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_variance(s), 107);
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   80  }
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   81  
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   82  static void do_mean_and_variance_test(struct kunit *test,
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   83  				      s64 initial_value,
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   84  				      s64 initial_n,
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   85  				      s64 n,
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   86  				      unsigned weight,
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   87  				      s64 *data,
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   88  				      s64 *mean,
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   89  				      s64 *stddev,
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   90  				      s64 *weighted_mean,
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   91  				      s64 *weighted_stddev)
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   92  {
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   93  	struct mean_and_variance mv = {};
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   94  	struct mean_and_variance_weighted vw = { .weight = weight };
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   95  
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   96  	for (unsigned i = 0; i < initial_n; i++) {
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   97  		mean_and_variance_update(&mv, initial_value);
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25   98  		mean_and_variance_weighted_update(&vw, initial_value);
92095781e0f607 fs/bcachefs/mean_and_variance_test.c Daniel Hill     2022-08-06   99  
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25  100  		KUNIT_EXPECT_EQ(test, mean_and_variance_get_mean(mv),		initial_value);
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25  101  		KUNIT_EXPECT_EQ(test, mean_and_variance_get_stddev(mv),		0);
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25 @102  		KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(vw),	initial_value);
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25 @103  		KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_stddev(vw),0);
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25  104  	}
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25  105  
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25  106  	for (unsigned i = 0; i < n; i++) {
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25  107  		mean_and_variance_update(&mv, data[i]);
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25  108  		mean_and_variance_weighted_update(&vw, data[i]);
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25  109  
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25  110  		KUNIT_EXPECT_EQ(test, mean_and_variance_get_mean(mv),		mean[i]);
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25  111  		KUNIT_EXPECT_EQ(test, mean_and_variance_get_stddev(mv),		stddev[i]);
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25  112  		KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_mean(vw),	weighted_mean[i]);
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25  113  		KUNIT_EXPECT_EQ(test, mean_and_variance_weighted_get_stddev(vw),weighted_stddev[i]);
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25  114  	}
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25  115  
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25  116  	KUNIT_EXPECT_EQ(test, mv.n, initial_n + n);
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25  117  }
65bc41090720cd fs/bcachefs/mean_and_variance_test.c Kent Overstreet 2023-05-25  118  

:::::: The code at line 33 was first introduced by commit
:::::: 92095781e0f607e735971c1a6462ca6dad8826d2 bcachefs: Mean and variance

:::::: TO: Daniel Hill <daniel@gluo.nz>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
