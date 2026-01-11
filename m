Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21A043ABC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 06:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768112272; cv=none; b=a4/p4/o9VsSyY0CPcXj0OWSZhw+LqXJTtRpePV/GVMYwcy3AACVWb2SpFRdtc0ZfN9yv9EA1HzuP6rk/Z/3lb28R19ZAMateDDxQDsvUMkx3d+r3yERWorokNL5Tesozzh1iySljHm9QArDHSp1fAKSUWzCOY2dv4uGG6qVOcVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768112272; c=relaxed/simple;
	bh=jWoKAD3/vSYjfnERV7g4aKSqgH7ooA9GsM8mKuvZRo4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LASEM8X40uC3YZqFiNMqS+nPr53LT16xVueZRuuoagYKLzSEWUHBTJ90xdT1CRXntyJGLceoHaX9e4ZNb0lo3ar6tmKdwj7UYSYpK9iO4i5Lg1l87imaY1sQHNySsmP9vQ2brHEnOUi18v5E/e6V6IWhcJQ5Pxs0+DF7WIMKY0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTlHtQ7D; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTlHtQ7D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768112270; x=1799648270;
  h=date:from:to:cc:subject:message-id;
  bh=jWoKAD3/vSYjfnERV7g4aKSqgH7ooA9GsM8mKuvZRo4=;
  b=cTlHtQ7DRg4RNCU8sFxWy8vR1TNdGJ6KDAgPUK7PXqysZSfECCH6gFJb
   5A7D9/qabF6R2TbN2dblgFF0/tNkyLkxCq785PAkPIyYhRbKzwvK4FVTe
   AYIDH9q5qgzHuRxUEN8z8fpXgzMg1YJzeKlCm1+G4MF0erVQCT15QP17r
   8g/3+6W6Re1+F4Tqt6KXajVsvIis57T5Pq9rG7FM6uhS6oF0lQIugD1FM
   jPqPHzp8Lvv3sgS8pDNw8MoR5BA2PZf+Qvj+GeRHAuaWR4yCmDkBONvzB
   cKO54OvCwR3xqOr2hWKWQIEJBSCwwaN8TjGe0o1uVdI++dCiBMikUCqu+
   g==;
X-CSE-ConnectionGUID: bGJqzmLyTQ+tgFlwwOaSCg==
X-CSE-MsgGUID: fCbv+2mcRnOXf3CkIZqMsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69340886"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="69340886"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 22:17:50 -0800
X-CSE-ConnectionGUID: 3cQrQl5WTLyzgEPnjUwSvA==
X-CSE-MsgGUID: tK4me3epTcCMm3usaDHHCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="203434975"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jan 2026 22:17:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veolm-000000009gW-2lVK;
	Sun, 11 Jan 2026 06:17:46 +0000
Date: Sun, 11 Jan 2026 14:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [linux-next:master 1626/5095]
 drivers/gpu/drm/xe/tests/xe_args_test.c:225 if_args_test() warn: if();
Message-ID: <202601111420.alodw392-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
commit: ce5971773651ad5c7e26aea29d72ea8887428774 [1626/5095] drm/xe: Introduce IF_ARGS macro utility
config: s390-randconfig-r072-20260109 (https://download.01.org/0day-ci/archive/20260111/202601111420.alodw392-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601111420.alodw392-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/tests/xe_args_test.c:225 if_args_test() warn: if();

Old smatch warnings:
drivers/gpu/drm/xe/tests/xe_args_test.c:226 if_args_test() warn: if();
drivers/gpu/drm/xe/tests/xe_args_test.c:228 if_args_test() warn: if();
drivers/gpu/drm/xe/tests/xe_args_test.c:229 if_args_test() warn: if();

vim +225 drivers/gpu/drm/xe/tests/xe_args_test.c

   218	
   219	static void if_args_test(struct kunit *test)
   220	{
   221		bool with_args = true;
   222		bool no_args = false;
   223		enum { X = 100 };
   224	
 > 225		KUNIT_EXPECT_TRUE(test, IF_ARGS(true, false, FOO_ARGS));
   226		KUNIT_EXPECT_FALSE(test, IF_ARGS(true, false, NO_ARGS));
   227	
   228		KUNIT_EXPECT_TRUE(test, CONCATENATE(IF_ARGS(with, no, FOO_ARGS), _args));
   229		KUNIT_EXPECT_FALSE(test, CONCATENATE(IF_ARGS(with, no, NO_ARGS), _args));
   230	
   231		KUNIT_EXPECT_STREQ(test, __stringify(IF_ARGS(yes, no, FOO_ARGS)), "yes");
   232		KUNIT_EXPECT_STREQ(test, __stringify(IF_ARGS(yes, no, NO_ARGS)), "no");
   233	
   234		KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, FOO_ARGS), -1, FOO_ARGS), 4);
   235		KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, FOO_ARGS), -1, NO_ARGS), -1);
   236		KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, NO_ARGS), -1, FOO_ARGS), 0);
   237		KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, NO_ARGS), -1, NO_ARGS), -1);
   238	
   239		KUNIT_EXPECT_EQ(test,
   240				CALL_ARGS(FIRST_ARG,
   241					  CALL_ARGS(CONCATENATE, IF_ARGS(FOO, MAX, FOO_ARGS), _ARGS)), X);
   242		KUNIT_EXPECT_EQ(test,
   243				CALL_ARGS(FIRST_ARG,
   244					  CALL_ARGS(CONCATENATE, IF_ARGS(FOO, MAX, NO_ARGS), _ARGS)), -1);
   245		KUNIT_EXPECT_EQ(test,
   246				CALL_ARGS(COUNT_ARGS,
   247					  CALL_ARGS(CONCATENATE, IF_ARGS(FOO, MAX, FOO_ARGS), _ARGS)), 4);
   248		KUNIT_EXPECT_EQ(test,
   249				CALL_ARGS(COUNT_ARGS,
   250					  CALL_ARGS(CONCATENATE, IF_ARGS(FOO, MAX, NO_ARGS), _ARGS)), 12);
   251	}
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
