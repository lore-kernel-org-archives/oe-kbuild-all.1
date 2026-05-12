Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025EA1DDC2B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 01:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550861; cv=none; b=hVBksVeTBjJYbSe2O5sOGOqL23J1IrWQ+spefF5BVbldhEUttDNaHpQ2APjGaj14sTE17cBzaPVUPFnnikJFZTX9nHXDvDtsV0A6I4x4/j+M11eqlZDs8FpyP/33yNULrnYGTdpJo3AtFt/edB1v4KW8PaaitgYruWtaOJSyRaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550861; c=relaxed/simple;
	bh=oM7EWSGRptyUs4En/C3Dox2kUNeoAqotp5/3f2K7NVo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JQKrWuoCuWKItwEmFajJI2FVsvh/RLAGyx10GtV8Ux4rrcyYTopn1xhO6P7N3mj5nqSeY+nyzZMEV8G3o8LuFtqk0ieBssgIJfYF+aXteWbcrWuECnQAG5+j46w5n7DLSMQanI6lxx4pfBRmqe76bRddsX6MqmXZwbL5/jWcQzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FD9fwTjH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FD9fwTjH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778550860; x=1810086860;
  h=date:from:to:cc:subject:message-id;
  bh=oM7EWSGRptyUs4En/C3Dox2kUNeoAqotp5/3f2K7NVo=;
  b=FD9fwTjHiBKnRyxUpcwZRkSGsdbENfhj5gwRq0ugTYzxfagLpiuJcsfF
   hgqUWKOWqkAObN5OuSXxDVsxJjyIS0+U0awzymB045TJnyWntwlhv71lj
   Aze9FU+ozrU7VBhI/aSPwTznl2LBObTb1avU8e9uUSeqdzkKlQTO5avAl
   SqLuR+tvJlq7NkWLe/SSyAz+ch5TXQM8nDqeHTGpnZPF7oHWGo9T8xPR4
   QHcTTbs3yg+ObmjtqyEN9VJGG7UsVt7J7hvzSyUbICsnMO6nH+798w9Ee
   SrMiKHJk2qGRkEHxyaqWLSZsANtJ4HlK1JuAlNRFOpNKf6/tf9z7OW6gU
   Q==;
X-CSE-ConnectionGUID: OWvdwKjISp+8f1eAx/2E+w==
X-CSE-MsgGUID: beKf57yXQ5exobD6FwlBSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="89754323"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="89754323"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 18:54:20 -0700
X-CSE-ConnectionGUID: QuKRdWzQQFyjryDkTxorRg==
X-CSE-MsgGUID: RwvsBPK2T6eJ/ndIstlhOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="236785606"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 11 May 2026 18:54:18 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMcK8-0000000087l-0moF;
	Tue, 12 May 2026 01:54:16 +0000
Date: Tue, 12 May 2026 03:54:06 +0200
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_tests 10/14]
 include/kunit/static_stub.h:68:57: warning: argument 2 of
 'kunit_hooks.get_static_stub_address' might be a candidate for a format
 attribute
Message-ID: <202605120348.fCe2bFxI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_tests
head:   2c56034debf1af6ff1539eaf2f3eb6eaf7316944
commit: 226b3ca43ff52df1f35062cc290735bd59cea1cd [10/14] rv: Add KUnit stub to rv_react() and rv_*_task_monitor_slot()
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260512/202605120348.fCe2bFxI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120348.fCe2bFxI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120348.fCe2bFxI-lkp@intel.com/

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
