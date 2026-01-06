Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D3227703A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 03:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767671560; cv=none; b=NnJbUhLpZ/aMjSXKVNLVcZBBEmlNjc9Uv8JTAo/sJMoL9L0RXdCoeYWmUC7Fqm8QJt4nyzHWYuP5hCeVY4a3O7QFlqJEYRlCxkLmTQT9D2jpBCOEMu8hL3HOXsKrtosyCB0k20/H2kxC+dYpgYYhLGW3RhDpX2LkicYYWfvJRsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767671560; c=relaxed/simple;
	bh=Ov8dXSPER90VpfR56cmiv1jGrtJCUnxec63Grlecafw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NCo6YwhzRbJWh3rFWGXNNHySyrgqdtPFchZp/CVKV0gG6Te2We96nAr7UmJs7pzPg6GL7k8vMcBu7usni9/WH6JDlUALLQCifmbJ5neL870TPElCcncbA+6GHJJUHScthw5P++wjyZUbwlFVTUyNVWATJ4sp9O0m83fYTkUS7aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egOd5lUV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egOd5lUV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767671558; x=1799207558;
  h=date:from:to:cc:subject:message-id;
  bh=Ov8dXSPER90VpfR56cmiv1jGrtJCUnxec63Grlecafw=;
  b=egOd5lUVssO7w8HpQ3kBTw9liGJsx5hCKDr2x8zKYjCsAJ9lcJVVjDJB
   Ai+ZeKbMA7w8ah4lqMMBJFSK1e24wl2YGoMQTWJk9RboHKkOx5S2KCzxg
   k/CWzfl1DzTkVcfQnsUb9f++UpKLCJf/1kSXCrno3fOvU0t4mdWEn0g8u
   LXAEug7hui7/FnzC0BBz7FbcDqHlWs8USP2l7Ezc7qzVVCa9kZjYOKRZy
   tXuxn2OfLgSEn01mRm9lYI1B2lS5Y0NeepTqSM87c+rp3PmyV1ydL/aRQ
   U/yJ22ju5A7TEPq7caTPsX8MMwDX02DOAJV/6lyl++sU3Kh8Oh8SA1iUG
   w==;
X-CSE-ConnectionGUID: o7qUFMgpROSl1cGyohnidw==
X-CSE-MsgGUID: 5dsnZMKuT4eIFU7dev/l7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68049422"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="68049422"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 19:52:37 -0800
X-CSE-ConnectionGUID: exgDN96WRqC/2KtHPT7wxQ==
X-CSE-MsgGUID: Qx3/rjrhQXyHoF3AZNgbFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="201689082"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Jan 2026 19:52:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcy7V-000000001eL-0s9q;
	Tue, 06 Jan 2026 03:52:33 +0000
Date: Tue, 06 Jan 2026 11:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_mon_kunit 25/28]
 include/kunit/static_stub.h:68:57: warning: argument 2 of
 'kunit_hooks.get_static_stub_address' might be a candidate for a format
 attribute
Message-ID: <202601061157.oMrT25W4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_mon_kunit
head:   e50630dce77a6316bf4ba69e1af30004a302bc24
commit: e36d5a77df4847ed0ba165e749a481671fc435e2 [25/28] rv: Add KUnit stub to rv_react() and rv_*_task_monitor_slot()
config: s390-randconfig-002-20260106 (https://download.01.org/0day-ci/archive/20260106/202601061157.oMrT25W4-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601061157.oMrT25W4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601061157.oMrT25W4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/trace/rv/rv_reactors.c:66:
   kernel/trace/rv/rv_reactors.c: In function 'rv_react':
>> include/kunit/static_stub.h:68:57: warning: argument 2 of 'kunit_hooks.get_static_stub_address' might be a candidate for a format attribute [-Wsuggest-attribute=format]
      68 |                                                         &real_fn_name); \
   kernel/trace/rv/rv_reactors.c:472:9: note: in expansion of macro 'KUNIT_STATIC_STUB_REDIRECT'
     472 |         KUNIT_STATIC_STUB_REDIRECT(rv_react, monitor, msg);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +68 include/kunit/static_stub.h

e047c5eaa76324 David Gow  2023-01-31  23  
e047c5eaa76324 David Gow  2023-01-31  24  
e047c5eaa76324 David Gow  2023-01-31  25  /**
e047c5eaa76324 David Gow  2023-01-31  26   * KUNIT_STATIC_STUB_REDIRECT() - call a replacement 'static stub' if one exists
e047c5eaa76324 David Gow  2023-01-31  27   * @real_fn_name: The name of this function (as an identifier, not a string)
e047c5eaa76324 David Gow  2023-01-31  28   * @args: All of the arguments passed to this function
e047c5eaa76324 David Gow  2023-01-31  29   *
e047c5eaa76324 David Gow  2023-01-31  30   * This is a function prologue which is used to allow calls to the current
e047c5eaa76324 David Gow  2023-01-31  31   * function to be redirected by a KUnit test. KUnit tests can call
e047c5eaa76324 David Gow  2023-01-31  32   * kunit_activate_static_stub() to pass a replacement function in. The
582eb3aeed2d06 Kemeng Shi 2023-07-26  33   * replacement function will be called by KUNIT_STATIC_STUB_REDIRECT(), which
e047c5eaa76324 David Gow  2023-01-31  34   * will then return from the function. If the caller is not in a KUnit context,
e047c5eaa76324 David Gow  2023-01-31  35   * the function will continue execution as normal.
e047c5eaa76324 David Gow  2023-01-31  36   *
e047c5eaa76324 David Gow  2023-01-31  37   * Example:
e047c5eaa76324 David Gow  2023-01-31  38   *
e047c5eaa76324 David Gow  2023-01-31  39   * .. code-block:: c
e047c5eaa76324 David Gow  2023-01-31  40   *
e047c5eaa76324 David Gow  2023-01-31  41   *	int real_func(int n)
e047c5eaa76324 David Gow  2023-01-31  42   *	{
e047c5eaa76324 David Gow  2023-01-31  43   *		KUNIT_STATIC_STUB_REDIRECT(real_func, n);
e047c5eaa76324 David Gow  2023-01-31  44   *		return 0;
e047c5eaa76324 David Gow  2023-01-31  45   *	}
e047c5eaa76324 David Gow  2023-01-31  46   *
e047c5eaa76324 David Gow  2023-01-31  47   *	int replacement_func(int n)
e047c5eaa76324 David Gow  2023-01-31  48   *	{
e047c5eaa76324 David Gow  2023-01-31  49   *		return 42;
e047c5eaa76324 David Gow  2023-01-31  50   *	}
e047c5eaa76324 David Gow  2023-01-31  51   *
e047c5eaa76324 David Gow  2023-01-31  52   *	void example_test(struct kunit *test)
e047c5eaa76324 David Gow  2023-01-31  53   *	{
e047c5eaa76324 David Gow  2023-01-31  54   *		kunit_activate_static_stub(test, real_func, replacement_func);
e047c5eaa76324 David Gow  2023-01-31  55   *		KUNIT_EXPECT_EQ(test, real_func(1), 42);
e047c5eaa76324 David Gow  2023-01-31  56   *	}
e047c5eaa76324 David Gow  2023-01-31  57   *
e047c5eaa76324 David Gow  2023-01-31  58   */
e047c5eaa76324 David Gow  2023-01-31  59  #define KUNIT_STATIC_STUB_REDIRECT(real_fn_name, args...)		\
e047c5eaa76324 David Gow  2023-01-31  60  do {									\
e047c5eaa76324 David Gow  2023-01-31  61  	typeof(&real_fn_name) replacement;				\
e047c5eaa76324 David Gow  2023-01-31  62  	struct kunit *current_test = kunit_get_current_test();		\
e047c5eaa76324 David Gow  2023-01-31  63  									\
e047c5eaa76324 David Gow  2023-01-31  64  	if (likely(!current_test))					\
e047c5eaa76324 David Gow  2023-01-31  65  		break;							\
e047c5eaa76324 David Gow  2023-01-31  66  									\
e047c5eaa76324 David Gow  2023-01-31  67  	replacement = kunit_hooks.get_static_stub_address(current_test,	\
e047c5eaa76324 David Gow  2023-01-31 @68  							&real_fn_name);	\
e047c5eaa76324 David Gow  2023-01-31  69  									\
e047c5eaa76324 David Gow  2023-01-31  70  	if (unlikely(replacement))					\
e047c5eaa76324 David Gow  2023-01-31  71  		return replacement(args);				\
e047c5eaa76324 David Gow  2023-01-31  72  } while (0)
e047c5eaa76324 David Gow  2023-01-31  73  

:::::: The code at line 68 was first introduced by commit
:::::: e047c5eaa76324575e1f95664be4c74ce0e2571b kunit: Expose 'static stub' API to redirect functions

:::::: TO: David Gow <davidgow@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
